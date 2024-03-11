Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C29877D3B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 10:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C3F10EBF0;
	Mon, 11 Mar 2024 09:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsYqIec0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783D210EBF0;
 Mon, 11 Mar 2024 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710150561; x=1741686561;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=suFINwRagDmYmzMpxIWkD67UieThKkGxm7kahtWlxJU=;
 b=GsYqIec0WBtCzu/JeZYPpxC5/jM/pAakmBFK+Ywyd/85FWo6z+korD+T
 OQbWdUwTkqCaOKA0+vy9XJ0dt2OJiqAyogf9HUvNR11pkAtWpq55YaBci
 S2vByTuDQXkaHcInRg17WSZdHxkCNGpkJb5tSdM4w9Ds/wGIAHhMQhwqi
 a5kH+RpQxN9BQqmqBxwEkqZcJSJrsTU6a3vjaWsd7UOVX7uSj1J9rIqVB
 1EEgy3JKnaFJqCLTc0YrN+uyX7acbrm6MfKwpAYuQJ+8hMUoS6YQtTtYM
 I0MYNMhwan/2l9faQZQ6eSaa8+vSg+6sBOBQSKWRMpCdAcsjC34dAH/b+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="8619206"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="8619206"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 02:49:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="11198014"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by fmviesa006.fm.intel.com with ESMTP; 11 Mar 2024 02:49:18 -0700
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, dri-devel@lists.freedesktop.org,
 jani.nikula@intel.com, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: [PATCH v17 2/9] drm: Add Adaptive Sync SDP logging
Date: Mon, 11 Mar 2024 15:12:31 +0530
Message-Id: <20240311094238.3320888-3-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
References: <20240311094238.3320888-1-mitulkumar.ajitkumar.golani@intel.com>
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

Add structure representing Adaptive Sync Secondary Data Packet (AS SDP).
Also, add Adaptive Sync SDP logging in drm_dp_helper.c to facilitate
debugging.

--v2:
- Update logging. [Jani, Ankit]
- Use 'as_sdp' instead of 'async' [Ankit]
- Correct define placeholders to where they are actually used. [Jani]
- Update members in 'as_sdp' structure to make it uniform. [Jani]

--v3:
- Added changes to dri-devel mailing list. No code changes.

--v4:
- Instead of directly using operation mode, use an enum to accommodate
all operation modes (Ankit).

--v5:
Nit-pick changes to commit message.

--v6:
- Add correct place holder and name change for AS_SDP_OP_MODE.
- Separate i915 changes from drm changes.
- Remove extra lines.

--v7:
- Add drm/i915/display in subject line.

Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 12 ++++++++++
 include/drm/display/drm_dp.h            | 11 ++++++++++
 include/drm/display/drm_dp_helper.h     | 29 +++++++++++++++++++++++++
 3 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index f2fabb673aa4..f880bc7b2153 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2948,6 +2948,18 @@ void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc)
 }
 EXPORT_SYMBOL(drm_dp_vsc_sdp_log);
 
+void drm_dp_as_sdp_log(struct drm_printer *p, const struct drm_dp_as_sdp *as_sdp)
+{
+	drm_printf(p, "DP SDP: AS_SDP, revision %u, length %u\n",
+		   as_sdp->revision, as_sdp->length);
+	drm_printf(p, "    vtotal: %d\n", as_sdp->vtotal);
+	drm_printf(p, "    target_rr: %d\n", as_sdp->target_rr);
+	drm_printf(p, "    duration_incr_ms: %d\n", as_sdp->duration_incr_ms);
+	drm_printf(p, "    duration_decr_ms: %d\n", as_sdp->duration_decr_ms);
+	drm_printf(p, "    operation_mode: %d\n", as_sdp->mode);
+}
+EXPORT_SYMBOL(drm_dp_as_sdp_log);
+
 /**
  * drm_dp_as_sdp_supported() - check if adaptive sync sdp is supported
  * @aux: DisplayPort AUX channel
diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 4891bd916d26..0b032faa8cf2 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1150,6 +1150,8 @@
 
 #define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0 E11 */
 # define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
+# define DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE		GENMASK(1, 0)
+# define DP_ADAPTIVE_SYNC_SDP_LENGTH				GENMASK(5, 0)
 # define DP_AS_SDP_FIRST_HALF_LINE_OR_3840_PIXEL_CYCLE_WINDOW_NOT_SUPPORTED (1 << 1)
 # define DP_VSC_EXT_SDP_FRAMEWORK_VERSION_1_SUPPORTED  (1 << 4)
 
@@ -1639,10 +1641,12 @@ enum drm_dp_phy {
 #define DP_SDP_AUDIO_COPYMANAGEMENT	0x05 /* DP 1.2 */
 #define DP_SDP_ISRC			0x06 /* DP 1.2 */
 #define DP_SDP_VSC			0x07 /* DP 1.2 */
+#define DP_SDP_ADAPTIVE_SYNC		0x22 /* DP 1.4 */
 #define DP_SDP_CAMERA_GENERIC(i)	(0x08 + (i)) /* 0-7, DP 1.3 */
 #define DP_SDP_PPS			0x10 /* DP 1.4 */
 #define DP_SDP_VSC_EXT_VESA		0x20 /* DP 1.4 */
 #define DP_SDP_VSC_EXT_CEA		0x21 /* DP 1.4 */
+
 /* 0x80+ CEA-861 infoframe types */
 
 #define DP_SDP_AUDIO_INFOFRAME_HB2	0x1b
@@ -1798,4 +1802,11 @@ enum dp_content_type {
 	DP_CONTENT_TYPE_GAME = 0x04,
 };
 
+enum operation_mode {
+	DP_AS_SDP_AVT_DYNAMIC_VTOTAL = 0x00,
+	DP_AS_SDP_AVT_FIXED_VTOTAL = 0x01,
+	DP_AS_SDP_FAVT_TRR_NOT_REACHED = 0x02,
+	DP_AS_SDP_FAVT_TRR_REACHED = 0x03
+};
+
 #endif /* _DRM_DP_H_ */
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 7df19acdc790..10147ae96326 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -98,6 +98,35 @@ struct drm_dp_vsc_sdp {
 	enum dp_content_type content_type;
 };
 
+/**
+ * struct drm_dp_as_sdp - drm DP Adaptive Sync SDP
+ *
+ * This structure represents a DP AS SDP of drm
+ * It is based on DP 2.1 spec [Table 2-126:  Adaptive-Sync SDP Header Bytes] and
+ * [Table 2-127: Adaptive-Sync SDP Payload for DB0 through DB8]
+ *
+ * @sdp_type: Secondary-data packet type
+ * @revision: Revision Number
+ * @length: Number of valid data bytes
+ * @vtotal: Minimum Vertical Vtotal
+ * @target_rr: Target Refresh
+ * @duration_incr_ms: Successive frame duration increase
+ * @duration_decr_ms: Successive frame duration decrease
+ * @operation_mode: Adaptive Sync Operation Mode
+ */
+struct drm_dp_as_sdp {
+	unsigned char sdp_type;
+	unsigned char revision;
+	unsigned char length;
+	int vtotal;
+	int target_rr;
+	int duration_incr_ms;
+	int duration_decr_ms;
+	enum operation_mode mode;
+};
+
+void drm_dp_as_sdp_log(struct drm_printer *p,
+		       const struct drm_dp_as_sdp *as_sdp);
 void drm_dp_vsc_sdp_log(struct drm_printer *p, const struct drm_dp_vsc_sdp *vsc);
 
 bool drm_dp_vsc_sdp_supported(struct drm_dp_aux *aux, const u8 dpcd[DP_RECEIVER_CAP_SIZE]);
-- 
2.25.1

