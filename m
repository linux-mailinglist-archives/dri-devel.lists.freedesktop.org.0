Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5C195750
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 13:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEAD6EA0F;
	Fri, 27 Mar 2020 12:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19A46EA0F;
 Fri, 27 Mar 2020 12:42:45 +0000 (UTC)
IronPort-SDR: 3ZNutw0vMAHY05bGVhov8/a7VyrIndYjrd0ma28rDJ2Cf3QaCxufr52HH6DpIvYTtcOOBzQJir
 NbfCjhbDntog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:42:45 -0700
IronPort-SDR: NfhkLARe2+8lccdjJFMPgwhNlhLTQSEIVdp8d3p5JjvaMxI5rm8TwTmDsVkXLEfXV3Bn2oNF5z
 ZsG82Vc2X47g==
X-IronPort-AV: E=Sophos;i="5.72,312,1580803200"; d="scan'208";a="394365095"
Received: from defretin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.231])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 05:42:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 2/7] drm/dsc: add helper for calculating rc buffer size
 from DPCD
Date: Fri, 27 Mar 2020 14:42:24 +0200
Message-Id: <20200327124229.26461-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327124229.26461-1-jani.nikula@intel.com>
References: <20200327124229.26461-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Manasi Navare <manasi.d.navare@intel.com>,
 Harry Wentland <hwentlan@amd.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper for calculating the rc buffer size from the DCPD offsets
DP_DSC_RC_BUF_BLK_SIZE and DP_DSC_RC_BUF_SIZE.

Cc: Alex Deucher <alexdeucher@gmail.com>
Cc: Harry Wentland <hwentlan@amd.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_dsc.c | 27 +++++++++++++++++++++++++++
 include/drm/drm_dsc.h     |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/drm_dsc.c
index 09afbc01ea94..ff602f7ec65b 100644
--- a/drivers/gpu/drm/drm_dsc.c
+++ b/drivers/gpu/drm/drm_dsc.c
@@ -49,6 +49,33 @@ void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header)
 }
 EXPORT_SYMBOL(drm_dsc_dp_pps_header_init);
 
+/**
+ * drm_dsc_dp_rc_buffer_size - get rc buffer size in bytes
+ * @rc_buffer_block_size: block size code, according to DPCD offset 62h
+ * @rc_buffer_size: number of blocks - 1, according to DPCD offset 63h
+ *
+ * return:
+ * buffer size in bytes, or 0 on invalid input
+ */
+int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size)
+{
+	int size = 1024 * (rc_buffer_size + 1);
+
+	switch (rc_buffer_block_size) {
+	case DP_DSC_RC_BUF_BLK_SIZE_1:
+		return 1 * size;
+	case DP_DSC_RC_BUF_BLK_SIZE_4:
+		return 4 * size;
+	case DP_DSC_RC_BUF_BLK_SIZE_16:
+		return 16 * size;
+	case DP_DSC_RC_BUF_BLK_SIZE_64:
+		return 64 * size;
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(drm_dsc_dp_rc_buffer_size);
+
 /**
  * drm_dsc_pps_payload_pack() - Populates the DSC PPS
  *
diff --git a/include/drm/drm_dsc.h b/include/drm/drm_dsc.h
index 887954cbfc60..537a68330840 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/drm_dsc.h
@@ -602,6 +602,7 @@ struct drm_dsc_pps_infoframe {
 } __packed;
 
 void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
+int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
 void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
 				const struct drm_dsc_config *dsc_cfg);
 int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
