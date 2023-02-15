Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BADF069807B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 17:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E7210EB17;
	Wed, 15 Feb 2023 16:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE8010EB14;
 Wed, 15 Feb 2023 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676477746; x=1708013746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zt1DKEeSn7xRuS1yXMlaTraoBCdZSI/zSbCQL3fb6rc=;
 b=e5MetwQttMSnG+a0Xv3t5z1jCwN1J4LnMZeLADkWaxj2j81ftRy8hbMC
 hXOif9VfO94wbcALNqyCuQ5Byo92CRwl0/ym0v5ERSyrtx3CzSLV2r1JM
 PDgXvXZD0qVS+xyu91idqxYfj4vvfjiyUtrePXfYBIztv8nMFyKv8B7zx
 Xp4XQ24mHq1kccbOkDVI9KCrvB8N4H77kVr0YlWE/2Za1d/jXUXI6JbMU
 mkMwmuT+4SB5OjtF5m0gdMWLe97EbZ2qDwwwQxGq1wfTH9bv73IuYaHuZ
 /+Qpw4lj8WhOrKiu7CtlGJmS58KOa9jsMd7x61WcMzrxXkDgt0yrSDvCz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="393871107"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="393871107"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="758472708"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; d="scan'208";a="758472708"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.14])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 08:15:30 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 13/16] drm/ttm: Make the call to ttm_tt_populate()
 interruptible when faulting
Date: Wed, 15 Feb 2023 17:14:02 +0100
Message-Id: <20230215161405.187368-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, NeilBrown <neilb@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, linux-graphics-maintainer@vmware.com,
 Peter Xu <peterx@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Airlie <airlied@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When swapping in, or under memory pressure ttm_tt_populate() may sleep
for a substantiable amount of time. Allow interrupts during the sleep.
This will also allow us to inject -EINTR errors during swapin in upcoming
patches.

Also avoid returning VM_FAULT_OOM, since that will confuse the core
mm, making it print out a confused message and retrying the fault.
Return VM_FAULT_SIGBUS also under OOM conditions.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 3ecda6db24b8..80f106bfe385 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -218,14 +218,21 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 	prot = ttm_io_prot(bo, bo->resource, prot);
 	if (!bo->resource->bus.is_iomem) {
 		struct ttm_operation_ctx ctx = {
-			.interruptible = false,
+			.interruptible = true,
 			.no_wait_gpu = false,
 			.force_alloc = true
 		};
 
 		ttm = bo->ttm;
-		if (ttm_tt_populate(bdev, bo->ttm, &ctx))
-			return VM_FAULT_OOM;
+		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
+		if (err) {
+			if (err == -EINTR || err == -ERESTARTSYS ||
+			    err == -EAGAIN)
+				return VM_FAULT_NOPAGE;
+
+			pr_debug("TTM fault hit %pe.\n", ERR_PTR(err));
+			return VM_FAULT_SIGBUS;
+		}
 	} else {
 		/* Iomem should not be marked encrypted */
 		prot = pgprot_decrypted(prot);
-- 
2.34.1

