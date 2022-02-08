Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8364AE2CB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F08710E275;
	Tue,  8 Feb 2022 21:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED0B10E24B;
 Tue,  8 Feb 2022 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644354312; x=1675890312;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0WtSAqBxNaHkhuPNDVZQh7lGa8qqdWEbVRypYzph9ys=;
 b=Cuha5/puANA+cxoy9l5G43U9DUfVRNt8dpZmQhk4Sfb2M64L9s3iWESC
 Ta9I/ykedTUjINA+iIkLEiuor0AIoR1OBCgSt8kJNNyQZTrbzBNxNGkLW
 x5c0/scO6ZHkbkzI6gS3HhPMqDedgMuWZHOh6MrRHCp55maRUEFQjp0jZ
 9zTwcSknNMb8QWxuvJKk54gIyQbkuyBfmNtkdlDR/gQ7vKMCl7ySQXK04
 cxaOg4JDJjw4a1SfavHUx2jLAvSjBuSeD1TOrtjJx580qPzhCORzf8i9b
 6YD+8y90I0bFvH3o3fdpFGsA/RTI2mTBrrxF8E9nSRQ+eysBeqMTEQOiS w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="236459630"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="236459630"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; d="scan'208";a="499706599"
Received: from fpaillet-mobl.amr.corp.intel.com (HELO localhost)
 ([10.209.65.117])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 13:05:11 -0800
From: Jordan Justen <jordan.l.justen@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v3 4/4] drm/i915/guc: Verify hwconfig blob matches supported
 format
Date: Tue,  8 Feb 2022 13:05:03 -0800
Message-Id: <20220208210503.869491-5-jordan.l.justen@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210503.869491-1-jordan.l.justen@intel.com>
References: <20220208210503.869491-1-jordan.l.justen@intel.com>
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

Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_hwconfig.c   | 56 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index ce6088f112d4..350a0517b9f0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -71,7 +71,52 @@ static int guc_hwconfig_discover_size(struct intel_guc_hwconfig *hwconfig)
 	return 0;
 }
 
-static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
+static int verify_hwconfig_blob(struct drm_device *drm,
+				const struct intel_guc_hwconfig *hwconfig)
+{
+	struct drm_i915_query_hwconfig_blob_item *pos;
+	u32 remaining;
+
+	if (hwconfig->size % 4 != 0 || hwconfig->ptr == NULL)
+		return -EINVAL;
+
+	pos = hwconfig->ptr;
+	/* The number of dwords in the blob to validate. Each loop
+	 * pass will process at least 2 dwords corresponding to the
+	 * key and length fields of the item. In addition, the length
+	 * field of the item indicates the length of the data array,
+	 * and that number of dwords will be processed (skipped) as
+	 * well.
+	 */
+	remaining = hwconfig->size / 4;
+
+	while (remaining > 0) {
+		/* Each item requires at least 2 dwords for the key
+		 * and length fields. If the length field is 0, then
+		 * the data array would be of length 0.
+		 */
+		if (remaining < 2)
+			return -EINVAL;
+		/* remaining >= 2, so subtracting 2 is ok, whereas
+		 * adding 2 to pos->length could overflow.
+		 */
+		if (pos->length > remaining - 2)
+			return -EINVAL;
+		/* The length check above ensures that the adjustment
+		 * of the remaining variable will not underflow, and
+		 * that the adjustment of the pos variable will not
+		 * pass the end of the blob data.
+		 */
+		remaining -= 2 + pos->length;
+		pos = (void *)&pos->data[pos->length];
+	}
+
+	drm_dbg(drm, "hwconfig blob format is valid\n");
+	return 0;
+}
+
+static int guc_hwconfig_fill_buffer(struct drm_device *drm,
+				    struct intel_guc_hwconfig *hwconfig)
 {
 	struct intel_guc *guc = hwconfig_to_guc(hwconfig);
 	struct i915_vma *vma;
@@ -88,8 +133,13 @@ static int guc_hwconfig_fill_buffer(struct intel_guc_hwconfig *hwconfig)
 	ggtt_offset = intel_guc_ggtt_offset(guc, vma);
 
 	ret = __guc_action_get_hwconfig(hwconfig, ggtt_offset, hwconfig->size);
-	if (ret >= 0)
+	if (ret >= 0) {
 		memcpy(hwconfig->ptr, vaddr, hwconfig->size);
+		if (verify_hwconfig_blob(drm, hwconfig)) {
+			drm_err(drm, "Ignoring invalid hwconfig blob received from GuC!\n");
+			ret = -EINVAL;
+		}
+	}
 
 	i915_vma_unpin_and_release(&vma, I915_VMA_RELEASE_MAP);
 
@@ -141,7 +191,7 @@ int intel_guc_hwconfig_init(struct intel_guc_hwconfig *hwconfig)
 		return -ENOMEM;
 	}
 
-	ret = guc_hwconfig_fill_buffer(hwconfig);
+	ret = guc_hwconfig_fill_buffer(&i915->drm, hwconfig);
 	if (ret < 0) {
 		intel_guc_hwconfig_fini(hwconfig);
 		return ret;
-- 
2.34.1

