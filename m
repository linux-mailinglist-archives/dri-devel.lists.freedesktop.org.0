Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA98589B3
	for <lists+dri-devel@lfdr.de>; Sat, 17 Feb 2024 00:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5343610ED1E;
	Fri, 16 Feb 2024 23:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="EzhPqypQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4AA10ED05;
 Fri, 16 Feb 2024 23:02:59 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41GMtrQa000675; Fri, 16 Feb 2024 23:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=QLSsM/m6/XLXEWwNwBqGK/Luv1rqtLa1ntAQsjjwiRw=; b=Ez
 hPqypQWGTDzjJF5rjrFhP0+9U9lheur1Q0JkHofUh3E35PNPHljv/+2UeIdj803J
 SL2FkYJGUBUQQBcaXfOutmQCR410k7j/MWfjA3NY219AVmtQSzGisp/eGUV6Z8td
 jnU3MaFua4XKHj9VB5wB6sJXQ+iPzpHcFfCvuXSyIDj3aN2PGbHrpU8i9GrSflM7
 NvObvhNs9Wwy6VMOT4zKUf9RTlEGzwISUTwvHYWoutXn0LTs5OC0n5y89dl4Nc1i
 LMiev5eo/r7UMCCWqxkGcf/gDDwX7iXgULVVmyBRXqUEV0A4fgBBb8txIXtL6PtJ
 p+ucX6GgII7hS1Ap7a9g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9fkfcrsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41GN2tsL016810
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Feb 2024 23:02:55 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 16 Feb 2024 15:02:55 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v4 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
Date: Fri, 16 Feb 2024 15:02:01 -0800
Message-ID: <20240216230228.26713-14-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240216230228.26713-1-quic_parellan@quicinc.com>
References: <20240216230228.26713-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 6UnUlSinJZeGFxt2gBDwPIuM3OhQ9IjA
X-Proofpoint-GUID: 6UnUlSinJZeGFxt2gBDwPIuM3OhQ9IjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-16_22,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402160182
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

Add support to pack and send the VSC SDP packet for DP. This therefore
allows the transmision of format information to the sinks which is
needed for YUV420 support over DP.

Changes in v4:
	- Remove struct msm_dp_sdp_with_parity
	- Use dp_utils_pack_sdp_header() to pack the SDP header and
	  parity bytes into a buffer
	- Use this buffer when writing the VSC SDP data in
	  dp_catalog_panel_send_vsc_sdp()
	- Write to all of the MMSS_DP_GENERIC0 registers instead of just
	  the ones with non-zero values

Changes in v3:
	- Create a new struct, msm_dp_sdp_with_parity, which holds the
	  packing information for VSC SDP
	- Use drm_dp_vsc_sdp_pack() to pack the data into the new
	  msm_dp_sdp_with_parity struct instead of specifically packing
	  for YUV420 format
	- Modify dp_catalog_panel_send_vsc_sdp() to send the VSC SDP
	  data using the new msm_dp_sdp_with_parity struct

Changes in v2:
	- Rename GENERIC0_SDPSIZE macro to GENERIC0_SDPSIZE_VALID
	- Remove dp_sdp from the dp_catalog struct since this data is
	  being allocated at the point used
	- Create a new function in dp_utils to pack the VSC SDP data
	  into a buffer
	- Create a new function that packs the SDP header bytes into a
	  buffer. This function is made generic so that it can be
	  utilized by dp_audio
	  header bytes into a buffer
	- Create a new function in dp_utils that takes the packed buffer
	  and writes to the DP_GENERIC0_* registers
	- Split the dp_catalog_panel_config_vsc_sdp() function into two
	  to disable/enable sending VSC SDP packets
	- Check the DP HW version using the original useage of
	  dp_catalog_hw_revision() and correct the version checking
	  logic
	- Rename dp_panel_setup_vsc_sdp() to
	  dp_panel_setup_vsc_sdp_yuv_420() to explicitly state that
	  currently VSC SDP is only being set up to support YUV420 modes

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 107 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
 drivers/gpu/drm/msm/dp/dp_panel.c   |  55 ++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |  56 +++++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h   |   4 ++
 7 files changed, 236 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5d84c089e520a..c6e57812a239e 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -901,6 +901,113 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	return 0;
 }
 
+static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
+					  u32 *header)
+{
+	struct dp_catalog_private *catalog;
+	u32 val;
+	int i;
+
+	if (!dp_catalog) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
+
+	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
+		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
+		       (vsc_sdp->db[i + 3] << 24));
+		dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
+	}
+}
+
+static void dp_catalog_panel_update_sdp(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 hw_revision;
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	hw_revision = dp_catalog_hw_revision(dp_catalog);
+	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
+		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
+	}
+}
+
+void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
+				     u32 *header)
+{
+	struct dp_catalog_private *catalog;
+	u32 cfg, cfg2, misc;
+
+	if (!dp_catalog) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+
+	cfg |= GEN0_SDP_EN;
+	dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+
+	cfg2 |= GENERIC0_SDPSIZE_VALID;
+	dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+	dp_catalog_panel_send_vsc_sdp(dp_catalog, vsc_sdp, header);
+
+	/* indicates presence of VSC (BIT(6) of MISC1) */
+	misc |= DP_MISC1_VSC_SDP;
+
+	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+
+	dp_catalog_panel_update_sdp(dp_catalog);
+}
+
+void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 cfg, cfg2, misc;
+
+	if (!dp_catalog) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+
+	cfg &= ~GEN0_SDP_EN;
+	dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+
+	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
+	dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+	/* switch back to MSA */
+	misc &= ~DP_MISC1_VSC_SDP;
+
+	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+
+	dp_catalog_panel_update_sdp(dp_catalog);
+}
+
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6cb5e2a243de2..4bdc087410a68 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -9,6 +9,7 @@
 #include <drm/drm_modes.h>
 
 #include "dp_parser.h"
+#include "dp_utils.h"
 #include "disp/msm_disp_snapshot.h"
 
 /* interrupts */
@@ -30,6 +31,9 @@
 
 #define DP_AUX_CFG_MAX_VALUE_CNT 3
 
+#define DP_HW_VERSION_1_0	0x10000000
+#define DP_HW_VERSION_1_2	0x10020000
+
 /* PHY AUX config registers */
 enum dp_phy_aux_config_type {
 	PHY_AUX_CFG0,
@@ -124,6 +128,9 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
 
 /* DP Panel APIs */
 int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, struct dp_sdp *vsc_sdp,
+				     u32 *header);
+void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index bffb7bac2c2c8..a42b29f9902c1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1947,6 +1947,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+
 	/* set dongle to D3 (power off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
@@ -2021,6 +2023,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index db1942794f1a4..417655dca2bba 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -4,6 +4,7 @@
  */
 
 #include "dp_panel.h"
+#include "dp_utils.h"
 
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
@@ -281,6 +282,56 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
 	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
 }
 
+static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
+{
+	struct dp_catalog *catalog;
+	struct dp_panel_private *panel;
+	struct dp_display_mode *dp_mode;
+	struct drm_dp_vsc_sdp vsc_sdp_data;
+	struct dp_sdp vsc_sdp;
+	ssize_t len;
+	u32 header[2];
+	int rc = 0;
+
+	if (!dp_panel) {
+		DRM_ERROR("invalid input\n");
+		rc = -EINVAL;
+		return rc;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	catalog = panel->catalog;
+	dp_mode = &dp_panel->dp_mode;
+
+	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
+
+	/* VSC SDP header as per table 2-118 of DP 1.4 specification */
+	vsc_sdp_data.sdp_type = DP_SDP_VSC;
+	vsc_sdp_data.revision = 0x05;
+	vsc_sdp_data.length = 0x13;
+
+	/* VSC SDP Payload for DB16 */
+	vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
+	vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
+
+	/* VSC SDP Payload for DB17 */
+	vsc_sdp_data.bpc = dp_mode->bpp / 3;
+	vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
+
+	/* VSC SDP Payload for DB18 */
+	vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
+
+	len = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &vsc_sdp, header);
+	if (len < 0) {
+		DRM_ERROR("unable to pack vsc sdp\n");
+		return len;
+	}
+
+	dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp, header);
+
+	return rc;
+}
+
 void dp_panel_dump_regs(struct dp_panel *dp_panel)
 {
 	struct dp_catalog *catalog;
@@ -344,6 +395,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	catalog->dp_active = data;
 
 	dp_catalog_panel_timing_cfg(catalog);
+
+	if (dp_panel->dp_mode.out_fmt_is_yuv_420)
+		dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
+
 	panel->panel_on = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 78785ed4b40c4..aa9f6c3e4ddeb 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -142,6 +142,7 @@
 #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
 #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
 #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
+#define DP_MISC1_VSC_SDP			(0x00004000)
 
 #define DP_MISC0_COLORIMERY_CFG_LEGACY_RGB	(0)
 #define DP_MISC0_COLORIMERY_CFG_CEA_RGB		(0x04)
@@ -204,9 +205,11 @@
 #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
 
 #define MMSS_DP_SDP_CFG				(0x00000228)
+#define GEN0_SDP_EN				(0x00020000)
 #define MMSS_DP_SDP_CFG2			(0x0000022C)
 #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
 #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
+#define GENERIC0_SDPSIZE_VALID			(0x00010000)
 
 #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
 #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 3a44fe738c004..5577e2366a520 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -4,9 +4,12 @@
  */
 
 #include <linux/types.h>
+#include <drm/drm_print.h>
 
 #include "dp_utils.h"
 
+#define DP_SDP_HEADER_SIZE		8
+
 u8 dp_utils_get_g0_value(u8 data)
 {
 	u8 c[4];
@@ -71,3 +74,56 @@ u8 dp_utils_calculate_parity(u32 data)
 
 	return parity_byte;
 }
+
+ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
+{
+	size_t length;
+	u8 header, parity;
+
+	length = sizeof(header_buff);
+	if (length < DP_SDP_HEADER_SIZE)
+		return -ENOSPC;
+
+	memset(header_buff, 0, sizeof(header_buff));
+
+	/* HEADER BYTE 0 */
+	header = sdp_header->HB0;
+	parity = dp_utils_calculate_parity(header);
+	header_buff[0]   = ((header << HEADER_BYTE_0_BIT) | (parity << PARITY_BYTE_0_BIT));
+
+	/* HEADER BYTE 1 */
+	header = sdp_header->HB1;
+	parity = dp_utils_calculate_parity(header);
+	header_buff[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
+
+	/* HEADER BYTE 2 */
+	header = sdp_header->HB2;
+	parity = dp_utils_calculate_parity(header);
+	header_buff[1]   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
+
+	/* HEADER BYTE 3 */
+	header = sdp_header->HB3;
+	parity = dp_utils_calculate_parity(header);
+	header_buff[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
+
+	return length;
+}
+
+ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct dp_sdp *vsc_sdp, u32 *header)
+{
+	ssize_t len;
+
+	len = drm_dp_vsc_sdp_pack(vsc, vsc_sdp, sizeof(*vsc_sdp));
+	if (len < 0) {
+		DRM_ERROR("unable to pack vsc sdp\n");
+		return len;
+	}
+
+	len = dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
+	if (len < 0) {
+		DRM_ERROR("unable to pack sdp header\n");
+		return len;
+	}
+
+	return len;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 5a505cbf3432b..9d1057bd5a24c 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -6,6 +6,8 @@
 #ifndef _DP_UTILS_H_
 #define _DP_UTILS_H_
 
+#include <drm/display/drm_dp_helper.h>
+
 #define HEADER_BYTE_0_BIT	 0
 #define PARITY_BYTE_0_BIT	 8
 #define HEADER_BYTE_1_BIT	16
@@ -18,5 +20,7 @@
 u8 dp_utils_get_g0_value(u8 data);
 u8 dp_utils_get_g1_value(u8 data);
 u8 dp_utils_calculate_parity(u32 data);
+ssize_t dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
+ssize_t dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc, struct dp_sdp *vsc_sdp, u32 *header);
 
 #endif /* _DP_UTILS_H_ */
-- 
2.39.2

