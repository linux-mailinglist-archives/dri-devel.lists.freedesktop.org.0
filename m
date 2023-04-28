Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655D26F187F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 14:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34C110ED3A;
	Fri, 28 Apr 2023 12:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA1310ED3B;
 Fri, 28 Apr 2023 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682686426; x=1714222426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U5O4Ny06a9ptqT/D21qH2jYM8IlJmI+cyOU0Pbe/WQM=;
 b=lDyAnuwQspyPPjWqE4nbaMaChjSLBGhktjtJIoLGRBDAAYD7+VInAKZE
 9FiGGc9paWxUCuneqOxhWXcSO/REox2tAn33kUrXBYc6YdT7KpIPvE8EE
 43TbiAoej4dltqfCYjd8Z9xJ3F0VzvqVrgpK21DijuOmb5WAGZymef9/A
 Ys0DRCG1kaSJIIZMQezTXmLmagFK0ytAP7DUwhMamaU1WRAPxOd1KjP2E
 AOO67aRzWaaOEaKALgDgtID5W3RTzgbC6ZVVW4EB2jMLYblOPVu3tYlXM
 C6BYCgNecoB81PHSEJOIa0FxVRjDmNY6f/ZwXl+U+AzDi8LJQWuKjZ2sF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="346507237"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="346507237"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 05:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="1024593659"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="1024593659"
Received: from kdobkakr-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.45])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 05:53:43 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] dma-buf/dma-fence: Use a successful read_trylock()
 annotation for dma_fence_begin_signalling()
Date: Fri, 28 Apr 2023 14:52:32 +0200
Message-Id: <20230428125233.228353-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, linaro-mm-sig@lists.linaro.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Condsider the following call sequence:

/* Upper layer */
dma_fence_begin_signalling();
lock(tainted_shared_lock);
/* Driver callback */
dma_fence_begin_signalling();
...

The driver might here use a utility that is annotated as intended for the
dma-fence signalling critical path. Now if the upper layer isn't correctly
annotated yet for whatever reason, resulting in

/* Upper layer */
lock(tainted_shared_lock);
/* Driver callback */
dma_fence_begin_signalling();

We will receive a false lockdep locking order violation notification from
dma_fence_begin_signalling(). However entering a dma-fence signalling
critical section itself doesn't block and could not cause a deadlock.

So use a successful read_trylock() annotation instead for
dma_fence_begin_signalling(). That will make sure that the locking order
is correctly registered in the first case, and doesn't register any
locking order in the second case.

The alternative is of course to make sure that the "Upper layer" is always
correctly annotated. But experience shows that's not easily achievable
in all cases.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/dma-buf/dma-fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
index f177c56269bb..17f632768ef9 100644
--- a/drivers/dma-buf/dma-fence.c
+++ b/drivers/dma-buf/dma-fence.c
@@ -308,8 +308,8 @@ bool dma_fence_begin_signalling(void)
 	if (in_atomic())
 		return true;
 
-	/* ... and non-recursive readlock */
-	lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _RET_IP_);
+	/* ... and non-recursive successful read_trylock */
+	lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL, _RET_IP_);
 
 	return false;
 }
@@ -340,7 +340,7 @@ void __dma_fence_might_wait(void)
 	lock_map_acquire(&dma_fence_lockdep_map);
 	lock_map_release(&dma_fence_lockdep_map);
 	if (tmp)
-		lock_acquire(&dma_fence_lockdep_map, 0, 0, 1, 1, NULL, _THIS_IP_);
+		lock_acquire(&dma_fence_lockdep_map, 0, 1, 1, 1, NULL, _THIS_IP_);
 }
 #endif
 
-- 
2.39.2

