Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NgMHPxceWnXwgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:49:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC579BBB4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 01:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B23910E5EA;
	Wed, 28 Jan 2026 00:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0Clu6s1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C5010E5DC;
 Wed, 28 Jan 2026 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769561330; x=1801097330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGkB1+eG1DofrVFgwjXKgmh24Mth1xG+rtxt9IIT69o=;
 b=G0Clu6s1zX4/YrcGDY+MyPDiwlRkpbPEK0lYxDyZoHO0QU5VgKPO2a/y
 Pkvzt5MGaqmBC9q9HKDB+JfGiqymTmEjD+8D/jC5foJeqmISMpYDAB4Dn
 5NAwJv545A3iDKw+WGFff0s2tp8A5ac8bCNVb/VNYYbkVX+ywhq+2CzjX
 RXFL34Mo9PwrXnqlwinXJpE9s2wctEst6n8C2w6e6XbgibBWBDTANuXbt
 DWZJDtu5FNWI+WYBO9Md8C7MZXsOkdt9TXidIpTrd7wOkDuBdh4z1zLY+
 7NI+bIZ+xJDkpDkg6YREppxsOL+Ag5zxWRbwjqBhfGOnWorZKG+ddso8w A==;
X-CSE-ConnectionGUID: QaRH4AFoQ7aqIuJPDzgpyg==
X-CSE-MsgGUID: 6allY8RfTwmJpD+SQmC6fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="93427535"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="93427535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
X-CSE-ConnectionGUID: EZ9SWgaYSTOAy3V1RlRprw==
X-CSE-MsgGUID: zmdWX+4VQ4ivnMWXLYRcIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="238822676"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 16:48:48 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: leonro@nvidia.com, francois.dugast@intel.com,
 thomas.hellstrom@linux.intel.com, himal.prasad.ghimiray@intel.com,
 jgg@ziepe.ca
Subject: [RFC PATCH v3 10/11] drm/xe: Implement DRM pagemap IOVA vfuncs
Date: Tue, 27 Jan 2026 16:48:40 -0800
Message-Id: <20260128004841.2436896-11-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128004841.2436896-1-matthew.brost@intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: ECC579BBB4
X-Rspamd-Action: no action

Implement the DRM pagemap IOVA vfuncs on top of the dma-map IOVA API.
Also add lockdep annotations to verify that the locking guidelines are
followed, paving the way for future implementations of the remaining
IOVA vfuncs.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_svm.c | 117 +++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index c2a6bb367e0a..b46de21ed438 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -1660,14 +1660,125 @@ int xe_svm_alloc_vram(struct xe_svm_range *range, const struct drm_gpusvm_ctx *c
 	return err;
 }
 
+static void xe_drm_pagemap_device_iova_prove_locking(bool *locking_proved)
+{
+	struct ww_acquire_ctx ctx;
+	struct dma_resv obj;
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_PROVE_LOCKING))
+		return;
+
+	if (*locking_proved)
+		return;
+
+	might_alloc(GFP_KERNEL);
+
+	dma_resv_init(&obj);
+	ww_acquire_init(&ctx, &reservation_ww_class);
+	ret = dma_resv_lock(&obj, &ctx);
+	if (ret == -EDEADLK)
+		dma_resv_lock_slow(&obj, &ctx);
+	ww_mutex_unlock(&obj.lock);
+	ww_acquire_fini(&ctx);
+
+	*locking_proved = true;
+}
+
+struct xe_svm_iova_cookie {
+	struct dma_iova_state state;
+};
+
 static void *xe_drm_pagemap_device_iova_alloc(struct drm_pagemap *dpagemap,
 					      struct device *dev, size_t length,
 					      enum dma_data_direction dir)
 {
-	/* NIY */
+	struct device *pgmap_dev = dpagemap->drm->dev;
+	struct xe_svm_iova_cookie *cookie;
+	static bool locking_proved = false;
+
+	xe_drm_pagemap_device_iova_prove_locking(&locking_proved);
+
+	if (pgmap_dev == dev)
+		return NULL;
+
+	cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
+	if (!cookie)
+		return NULL;
+
+	dma_iova_try_alloc(dev, &cookie->state, length >= SZ_2M ? SZ_2M : 0,
+			   length);
+	if (dma_use_iova(&cookie->state))
+		return cookie;
+
+	kfree(cookie);
 	return NULL;
 }
 
+static void xe_drm_pagemap_device_iova_free(struct drm_pagemap *dpagemap,
+					    struct device *dev, size_t length,
+					    void *cookie)
+{
+	struct xe_svm_iova_cookie *__cookie = cookie;
+	struct xe_device *xe = to_xe_device(dpagemap->drm);
+	static bool locking_proved = false;
+
+	xe_assert(xe, dma_use_iova(&__cookie->state));
+	xe_drm_pagemap_device_iova_prove_locking(&locking_proved);
+
+	dma_iova_free(dev, &__cookie->state);
+	kfree(cookie);
+}
+
+static struct drm_pagemap_addr
+xe_drm_pagemap_device_iova_link(struct drm_pagemap *dpagemap,
+				struct device *dev, struct page *page,
+				size_t length, size_t offset, void *cookie,
+				enum dma_data_direction dir)
+{
+	struct xe_svm_iova_cookie *__cookie = cookie;
+	struct xe_device *xe = to_xe_device(dpagemap->drm);
+	dma_addr_t addr = __cookie->state.addr + offset;
+	int err;
+
+	xe_assert(xe, dma_use_iova(&__cookie->state));
+
+	err = dma_iova_link(dev, &__cookie->state, xe_page_to_pcie(page),
+			    offset, length, dir, DMA_ATTR_SKIP_CPU_SYNC |
+			    DMA_ATTR_MMIO);
+	if (err)
+		addr = DMA_MAPPING_ERROR;
+
+	return drm_pagemap_addr_encode(addr, XE_INTERCONNECT_P2P, ilog2(length),
+				       dir);
+}
+
+static int
+xe_drm_pagemap_device_iova_sync(struct drm_pagemap *dpagemap,
+				struct device *dev, size_t length, void *cookie)
+{
+	struct xe_svm_iova_cookie *__cookie = cookie;
+	struct xe_device *xe = to_xe_device(dpagemap->drm);
+
+	xe_assert(xe, dma_use_iova(&__cookie->state));
+
+	return dma_iova_sync(dev, &__cookie->state, 0, length);
+}
+
+static void
+xe_drm_pagemap_device_iova_unlink(struct drm_pagemap *dpagemap,
+				  struct device *dev, size_t length,
+				  void *cookie, enum dma_data_direction dir)
+{
+	struct xe_svm_iova_cookie *__cookie = cookie;
+	struct xe_device *xe = to_xe_device(dpagemap->drm);
+
+	xe_assert(xe, dma_use_iova(&__cookie->state));
+
+	dma_iova_unlink(dev, &__cookie->state, 0, length, dir,
+			DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO);
+}
+
 static struct drm_pagemap_addr
 xe_drm_pagemap_device_map(struct drm_pagemap *dpagemap,
 			  struct device *dev,
@@ -1740,6 +1851,10 @@ static void xe_pagemap_destroy(struct drm_pagemap *dpagemap, bool from_atomic_or
 
 static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
 	.device_iova_alloc = xe_drm_pagemap_device_iova_alloc,
+	.device_iova_free = xe_drm_pagemap_device_iova_free,
+	.device_iova_link = xe_drm_pagemap_device_iova_link,
+	.device_iova_sync = xe_drm_pagemap_device_iova_sync,
+	.device_iova_unlink = xe_drm_pagemap_device_iova_unlink,
 	.device_map = xe_drm_pagemap_device_map,
 	.device_unmap = xe_drm_pagemap_device_unmap,
 	.populate_mm = xe_drm_pagemap_populate_mm,
-- 
2.34.1

