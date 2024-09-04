Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0096B25D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363CE10E684;
	Wed,  4 Sep 2024 07:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5rkvQy6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF3F10E680;
 Wed,  4 Sep 2024 07:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725433704; x=1756969704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ak+61B+0Kuvjkie05qPE5aTzhQZ31UCjpmn7noCrN9U=;
 b=G5rkvQy66Wlao4iZk2kd1PHlovDmh/8JMfjBa6XNk/VxAQGCINSV35lf
 eEpOtqctzJ8EM3thyyu7e6eQr6Vxnz8ek8KJxmlP7ziVbAu9A4pKzofHL
 UQ6l+LvC84dseRQA14stZL0UgbxUFOMoVvnj0dz2p8LdsuhaiXk3nvyuC
 3no6FLynJ3AePmxn5ceAeSH9+5VmaE9S5vDchJq8K8ypshX6jMDykTSEn
 q74Zbq8N5EzoLr/YaAQyhGtDtdrFzDvUULv1qNe9wU9JOxA+OGTLWSa+7
 /G+jXE/FBTy8WsdWbKYclvwe1eWkLyfOh7HtpfCWdwu+iLGP7wwmoyqJA Q==;
X-CSE-ConnectionGUID: bfE5Xm+MQoWgyAZ+jjQSng==
X-CSE-MsgGUID: 4e3D3IeKTUKGxFE7aanmOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13363001"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="13363001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:08:24 -0700
X-CSE-ConnectionGUID: RuR8DKSZTNqpj0pQdyYS8A==
X-CSE-MsgGUID: BYj7G5XySTKMESPpzHgj/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="65165839"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.245.93])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 00:08:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/ttm: Move pinned objects off LRU lists when pinning
Date: Wed,  4 Sep 2024 09:08:08 +0200
Message-ID: <20240904070808.95126-3-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
References: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ttm_bo_pin() and ttm_bo_unpin() functions weren't moving their
resources off the LRU list to the unevictable list.

Make sure that happens so that pinned objects don't accidently linger
on the LRU lists, and also make sure to move them back once they
are unpinned.

v2:
- Removing from a bulk move must be done with the pin-count still zero.
v3:
- ttm_resource_move_to_lru_tail must be done after pinning with a non-
  NULL resource (Intel CI).

Cc: Christian König <christian.koenig@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com> #v1
---
 drivers/gpu/drm/ttm/ttm_bo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 875b024913a0..4374d5eb1a98 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -594,7 +594,8 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
 	spin_lock(&bo->bdev->lru_lock);
 	if (bo->resource)
 		ttm_resource_del_bulk_move(bo->resource, bo);
-	++bo->pin_count;
+	if (!bo->pin_count++ && bo->resource)
+	        ttm_resource_move_to_lru_tail(bo->resource);
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_pin);
@@ -613,9 +614,10 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
 		return;
 
 	spin_lock(&bo->bdev->lru_lock);
-	--bo->pin_count;
-	if (bo->resource)
+	if (!--bo->pin_count && bo->resource) {
 		ttm_resource_add_bulk_move(bo->resource, bo);
+		ttm_resource_move_to_lru_tail(bo->resource);
+	}
 	spin_unlock(&bo->bdev->lru_lock);
 }
 EXPORT_SYMBOL(ttm_bo_unpin);
-- 
2.46.0

