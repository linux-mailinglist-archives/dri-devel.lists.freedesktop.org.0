Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4628F850203
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 02:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6011120E8;
	Sat, 10 Feb 2024 01:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="agXxOu+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B65112009;
 Sat, 10 Feb 2024 01:52:50 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A1MhR0011665; Sat, 10 Feb 2024 01:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=L7nrz1tPRYJtOZtzpTsu8alDlXidotMMGoZL8kK50Tw=; b=ag
 XxOu+eUINo9AmsoBidLtF2TNI72EajfLEWmovoZj7DVLcN9T7aD8r9Cq6JkM0yo2
 u1jK0YEt8bsL7gQ2pTbvrk5E5D6ewBf1dgfAen7MCs4GNFgKHsSCb3DIp35EZVy5
 TC4pvS+FylmsU7TpriVmF4KIum2kyqNOncWddGzoeiq1l9tANMa08rO4n6xwYhsf
 43P9K9DdSEzceaAompSxQs9BJPrjzyTU2DnjuiVcb6zxm0FypQCug6A0RwKQS3gH
 xa+4OUv+DMlmOVvgdSgnMs4e8VlfkE5GvRKCionrPprwKzP5v4f9ZoNRCDGv9WHv
 Lv+zlYr7tfSLNDoeIeig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5pa116h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qkoA028041
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:46 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:46 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 13/19] drm/msm/dp: add VSC SDP support for YUV420 over DP
Date: Fri, 9 Feb 2024 17:52:04 -0800
Message-ID: <20240210015223.24670-14-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1A6Qpe38aTOqPjsogUkwBLGJMRvAGW3T
X-Proofpoint-ORIG-GUID: 1A6Qpe38aTOqPjsogUkwBLGJMRvAGW3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402100012
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
 drivers/gpu/drm/msm/dp/dp_catalog.c | 105 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 ++
 drivers/gpu/drm/msm/dp/dp_panel.c   |  59 ++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
 drivers/gpu/drm/msm/dp/dp_utils.c   |  80 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_utils.h   |   3 +
 7 files changed, 260 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5d84c089e520a..0f28a4897b7b7 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -901,6 +901,111 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	return 0;
 }
 
+static void dp_catalog_panel_send_vsc_sdp(struct dp_catalog *dp_catalog, u32 *buffer)
+{
+	struct dp_catalog_private *catalog;
+
+	if (!dp_catalog) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_0, buffer[0]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_1, buffer[1]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_2, buffer[2]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_3, buffer[3]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_4, buffer[4]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_5, buffer[5]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_6, buffer[6]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_7, buffer[7]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_8, buffer[8]);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_9, buffer[9]);
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
+void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, u32 *gen_buffer)
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
+	dp_catalog_panel_send_vsc_sdp(dp_catalog, gen_buffer);
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
index 6cb5e2a243de2..5b3a7ba40d55f 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -7,6 +7,7 @@
 #define _DP_CATALOG_H_
 
 #include <drm/drm_modes.h>
+#include <drm/display/drm_dp_helper.h>
 
 #include "dp_parser.h"
 #include "disp/msm_disp_snapshot.h"
@@ -30,6 +31,9 @@
 
 #define DP_AUX_CFG_MAX_VALUE_CNT 3
 
+#define DP_HW_VERSION_1_0	0x10000000
+#define DP_HW_VERSION_1_2	0x10020000
+
 /* PHY AUX config registers */
 enum dp_phy_aux_config_type {
 	PHY_AUX_CFG0,
@@ -124,6 +128,8 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
 
 /* DP Panel APIs */
 int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+void dp_catalog_panel_enable_vsc_sdp(struct dp_catalog *dp_catalog, u32 *gen_buffer);
+void dp_catalog_panel_disable_vsc_sdp(struct dp_catalog *dp_catalog);
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 209cf2a35642f..beef86b1aaf81 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+
 	/* set dongle to D3 (power off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
@@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index db1942794f1a4..82897edf25e0f 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -4,6 +4,7 @@
  */
 
 #include "dp_panel.h"
+#include "dp_utils.h"
 
 #include <drm/drm_connector.h>
 #include <drm/drm_edid.h>
@@ -281,6 +282,60 @@ void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
 	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
 }
 
+static int dp_panel_setup_vsc_sdp_yuv_420(struct dp_panel *dp_panel)
+{
+	struct dp_catalog *catalog;
+	struct dp_panel_private *panel;
+	struct dp_display_mode *dp_mode;
+	struct dp_sdp_header sdp_header;
+	struct drm_dp_vsc_sdp vsc_sdp_data;
+	size_t buff_size;
+	u32 gen_buffer[10];
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
+	buff_size = sizeof(gen_buffer);
+
+	memset(&sdp_header, 0, sizeof(sdp_header));
+	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
+
+	/* VSC SDP header as per table 2-118 of DP 1.4 specification */
+	sdp_header.HB0 = 0x00;
+	sdp_header.HB1 = 0x07;
+	sdp_header.HB2 = 0x05;
+	sdp_header.HB3 = 0x13;
+
+	/* VSC SDP Payload for DB16 */
+	vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
+	vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
+
+	/* VSC SDP Payload for DB17 */
+	vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
+
+	/* VSC SDP Payload for DB18 */
+	vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
+
+	vsc_sdp_data.bpc = dp_mode->bpp / 3;
+
+	rc = dp_utils_pack_vsc_sdp(&vsc_sdp_data, &sdp_header, gen_buffer, buff_size);
+	if (rc) {
+		DRM_ERROR("unable to pack vsc sdp\n");
+		return rc;
+	}
+
+	dp_catalog_panel_enable_vsc_sdp(catalog, gen_buffer);
+
+	return rc;
+}
+
 void dp_panel_dump_regs(struct dp_panel *dp_panel)
 {
 	struct dp_catalog *catalog;
@@ -344,6 +399,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	catalog->dp_active = data;
 
 	dp_catalog_panel_timing_cfg(catalog);
+
+	if (dp_panel->dp_mode.out_fmt_is_yuv_420)
+		dp_panel_setup_vsc_sdp_yuv_420(dp_panel);
+
 	panel->panel_on = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index ea85a691e72b5..2983756c125cd 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -142,6 +142,7 @@
 #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
 #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
 #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
+#define DP_MISC1_VSC_SDP			(0x00004000)
 
 #define REG_DP_VALID_BOUNDARY			(0x00000030)
 #define REG_DP_VALID_BOUNDARY_2			(0x00000034)
@@ -201,9 +202,11 @@
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
index 176d839906cec..05e0133eb50f3 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -4,6 +4,16 @@
  */
 
 #include <linux/types.h>
+#include <drm/display/drm_dp_helper.h>
+#include <drm/drm_print.h>
+
+#include "dp_utils.h"
+
+#define DP_GENERIC0_6_YUV_8_BPC		BIT(0)
+#define DP_GENERIC0_6_YUV_10_BPC	BIT(1)
+
+#define DP_SDP_HEADER_SIZE		8
+#define DP_VSC_SDP_BUFFER_SIZE		40
 
 u8 dp_utils_get_g0_value(u8 data)
 {
@@ -69,3 +79,73 @@ u8 dp_utils_calculate_parity(u32 data)
 
 	return parity_byte;
 }
+
+int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *buffer, size_t buff_size)
+{
+	u32 header, parity;
+
+	if (buff_size < DP_SDP_HEADER_SIZE)
+		return -ENOSPC;
+
+	memset(buffer, 0, sizeof(buffer));
+
+	/* HEADER BYTE 0 */
+	header = sdp_header->HB0;
+	parity = dp_utils_calculate_parity(header);
+	buffer[0]   = ((header << HEADER_BYTE_0_BIT) | (parity << PARITY_BYTE_0_BIT));
+
+	/* HEADER BYTE 1 */
+	header = sdp_header->HB1;
+	parity = dp_utils_calculate_parity(header);
+	buffer[0]  |= ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
+
+	/* HEADER BYTE 2 */
+	header = sdp_header->HB2;
+	parity = dp_utils_calculate_parity(header);
+	buffer[1]   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
+
+	/* HEADER BYTE 3 */
+	header = sdp_header->HB3;
+	parity = dp_utils_calculate_parity(header);
+	buffer[1]  |= ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
+
+	return 0;
+}
+
+int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data, struct dp_sdp_header *sdp_header,
+			  u32 *buffer, size_t buff_size)
+{
+	u8 bpc;
+	int ret = 0;
+
+	if (buff_size < DP_VSC_SDP_BUFFER_SIZE)
+		return -ENOSPC;
+
+	ret = dp_utils_pack_sdp_header(sdp_header, buffer, buff_size);
+	if (ret) {
+		DRM_ERROR("unable to pack sdp header\n");
+		return ret;
+	}
+
+	switch (vsc_sdp_data->bpc) {
+	case 10:
+		bpc = DP_GENERIC0_6_YUV_10_BPC;
+		break;
+	case 8:
+	default:
+		bpc = DP_GENERIC0_6_YUV_8_BPC;
+		break;
+	}
+
+	/* VSC SDP payload as per table 2-117 of DP 1.4 specification */
+	buffer[6] = (vsc_sdp_data->colorimetry & 0xF) |
+	       ((vsc_sdp_data->pixelformat & 0xF) << 4) |
+	       (bpc << 8) |
+	       ((vsc_sdp_data->dynamic_range & 0x1) << 15) |
+	       ((vsc_sdp_data->content_type & 0x7) << 16);
+
+	print_hex_dump(KERN_DEBUG, "[drm-dp] VSC: ", DUMP_PREFIX_NONE, 16, 4, buffer,
+		       sizeof(buffer), false);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index c062e29d07898..7fd775de553c9 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -18,5 +18,8 @@
 u8 dp_utils_get_g0_value(u8 data);
 u8 dp_utils_get_g1_value(u8 data);
 u8 dp_utils_calculate_parity(u32 data);
+int dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *buffer, size_t buff_size);
+int dp_utils_pack_vsc_sdp(struct drm_dp_vsc_sdp *vsc_sdp_data, struct dp_sdp_header *sdp_header,
+			  u32 *buffer, size_t buff_size);
 
 #endif /* _DP_UTILS_H_ */
-- 
2.39.2

