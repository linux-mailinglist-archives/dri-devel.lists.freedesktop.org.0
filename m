Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54924B008F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82EF810E655;
	Wed,  9 Feb 2022 22:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04AE10E63A;
 Wed,  9 Feb 2022 22:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644446716; x=1675982716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oDJmsOQcakdCpgOdC3Mq/jVPb1NYSYe3A1tYxYylSrs=;
 b=OarFNLWFtfFx6d8HWH2JC2Uhd1K/g+qaCVK1WnMF7H9JPEzVOuZsqk4e
 37YbbUHs6OB3I0GJOKGZuyBsg9/tw07E+FA4aAK70vLnsGpEwdr7eQNZO
 De+vgddee1fscoM66EF106c5DB8WgAb+JEd9O3XqraPaifHN7uTY4oKaD
 l6hbahQVlgxoqYraFN9MphfRPtyZqp67xxqLKYnO8zX/gdsWQtY/Lfsth
 ueHkN0IFDLsk602RzvxQOYz15/m0nxw5IjtbB6XZCZGe5J0fFaUPPqGJA
 zhUEoxG+6tQb+BNQnjILOhTFFCAx9I9Y/0WjfvTXB+zCj3+E0xiEyY6lO Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310101193"
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="310101193"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,356,1635231600"; d="scan'208";a="601805303"
Received: from unknown (HELO localhost) ([10.212.169.188])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 14:45:16 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 4/4] drm/i915/guc: Verify hwconfig blob matches supported
 format
Date: Wed,  9 Feb 2022 14:45:07 -0800
Message-Id: <20220209224507.874751-5-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209224507.874751-1-jordan.l.justen@intel.com>
References: <20220209224507.874751-1-jordan.l.justen@intel.com>
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Jon Bloomfield <jon.bloomfield@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

i915_drm.h now defines the format of the returned
DRM_I915_QUERY_HWCONFIG_BLOB query item. Since i915 receives this from
the black box GuC software, it should verify that the data matches
that format before sending it to user-space.

The verification makes a single simple pass through the blob contents,
so this verification step should not add a significant amount of init
time to i915.

v3:
 * Add various changes suggested by Tvrtko

v4:
 * Rewrite verify_hwconfig_blob() to hopefully be clearer without
   relying on comments so much, and add various suggestions from
   Michal.

Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
Acked-by: Jon Bloomfield <jon.bloomfield@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 44 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index ce6088f112d4..7d5569d8d1e3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -71,9 +71,46 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
 	return 0;
 }
 
+static int verify_hwconfig_blob(struct intel_guc_hwconfig *hwconfig)
+{
+	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
+	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
+	struct drm_i915_query_hwconfig_blob_item *item = hwconfig->ptr;
+	u64 offset = 0;
+	u64 remaining = hwconfig->size;
+	/* Everything before the data field is required */
+	u64 min_item_size = offsetof(struct drm_i915_query_hwconfig_blob_item, data);
+	u64 item_size;
+
+	if (!IS_ALIGNED(hwconfig->size, sizeof(u32))) {
+		drm_err(drm, "hwconfig blob size (%d) is not u32 aligned\n", hwconfig->size);
+		return -EINVAL;
+	}
+
+	while (offset < hwconfig->size) {
+		if (remaining < min_item_size) {
+			drm_err(drm, "hwconfig blob invalid (no room for item required fields at offset %lld)\n",
+				offset);
+			return -EINVAL;
+		}
+		item_size = min_item_size + sizeof(u32) * item->length;
+		if (item_size > remaining) {
+			drm_err(drm, "hwconfig blob invalid (no room for data array of item at offset %lld)\n",
+				offset);
+			return -EINVAL;
+		}
+		offset += item_size;
+		remaining -= item_size;
+		item = (void *)&item->data[item->length];
+	}
+
+	return 0;
+}
+
 static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
 {
 	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
+	struct drm_device *drm = &guc_to_gt(guc)->i915->drm;
 	struct i915_vma *vma;
 	u32 ggtt_offset;
 	void *vaddr;
@@ -88,8 +125,13 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
 	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
 
 	ret = __guc_action_get_hwconfig(hwconfig, ggtt_offset, hwconfig->size);
-	if (ret >= 0)
+	if (ret >= 0) {
 		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
+		if (verify_hwconfig_blob(hwconfig)) {
+			drm_err(drm, "Ignoring invalid hwconfig blob received from GuC!\n");
+			ret = -EINVAL;
+		}
+	}
 
 	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
 
-- 
2.34.1

