Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 822EB2D2B1E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:34:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785289B22;
	Tue,  8 Dec 2020 12:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C576E97D;
 Tue,  8 Dec 2020 12:34:31 +0000 (UTC)
IronPort-SDR: EV3yLnaV6MzE0v8E2vMsn1/nKUpoSVHY2DhVPtmQ/23VI1lYqFpASTDj6fumzm/Iie56ckORNo
 oAkls/MVusiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9828"; a="235479448"
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="235479448"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:31 -0800
IronPort-SDR: pHUREmWAu2AsJhBJ+nX5B6ikMdfwxqvj2IQPu4Le43FI6LP3wGE8cOuoURnV8PRKuXahqbVE27
 V/Z83WzbTGaw==
X-IronPort-AV: E=Sophos;i="5.78,402,1599548400"; d="scan'208";a="437357332"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.246.199])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 04:34:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/dsc: add helper for calculating rc buffer size from
 DPCD
Date: Tue,  8 Dec 2020 14:33:53 +0200
Message-Id: <6c6aee22740fe7a8cf2b8e768bfda378850cf59a.1607429866.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1607429866.git.jani.nikula@intel.com>
References: <cover.1607429866.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, manasi.d.navare@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>,
 Harry Wentland <hwentlan@amd.com>
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
Reviewed-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
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
index 53c51231b31c..cf43561e60fa 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/drm_dsc.h
@@ -603,6 +603,7 @@ struct drm_dsc_pps_infoframe {
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
