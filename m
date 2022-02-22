Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 299A64BF628
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E75310E5E4;
	Tue, 22 Feb 2022 10:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FFF10E5B6;
 Tue, 22 Feb 2022 10:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645526212; x=1677062212;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6YTvKHpbx8ICyCH0Zc3DG0yNHmm2jweVbvtvdLbxHMU=;
 b=Nf7FznYXNS+DgDSt+Pj6e27nBSRwm6ZBVk4EVu8GSw9AuONK7Bx+0Xhf
 eHJeRHZ+YYJfUEz66FX9qOOo/xumwuOjMeXpx50Zz7Qt9Q+50rLZOO+W0
 FWj2DsutPFfr30WiZl6d9yb6G+HykQgIJfDFUnnm6prLoJ99DQzM5RMnw
 jnWNRGGubgXLs9ZcK31ADvR/avaNvzLs3aq+KWivW9Sw31pkRLHRX6KOw
 0PCF/zVbUbhTT9GJVV6HSiEHb1DEoTht0Ha+YSlzVHN3ZlGXxkQPyZb9Y
 sTVc8Oz3r/0nPW4yvvS2Ofzlbgeas4LZqflSg7pvlfiSnE19Ln6AYXOCG Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314921395"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="314921395"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 02:36:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="779037256"
Received: from eelele-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.212.245.101])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 02:36:51 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 4/4] drm/i915/guc: Verify hwconfig blob matches supported
 format
Date: Tue, 22 Feb 2022 02:36:40 -0800
Message-Id: <20220222103640.1006006-5-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220222103640.1006006-1-jordan.l.justen@intel.com>
References: <20220222103640.1006006-1-jordan.l.justen@intel.com>
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
index ad289603460c..a844b880cbdb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -73,9 +73,46 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
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
@@ -90,8 +127,13 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
 	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
 
 	ret = __guc_action_get_hwconfig(guc, ggtt_offset, hwconfig->size);
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

