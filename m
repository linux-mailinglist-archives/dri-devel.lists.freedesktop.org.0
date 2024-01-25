Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA9D83CC97
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 20:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E3510F96B;
	Thu, 25 Jan 2024 19:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD6010F4B0;
 Thu, 25 Jan 2024 19:39:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40PFL3to003244; Thu, 25 Jan 2024 19:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=FgV0xJtdexORYG8um03TE4yHU3anozmF05tY3QDJ5KI=; b=KP
 zi03tV+QPNPBbLqFlBQJM32M0kWwTOCPZlLRvitRwm7E9k5MKGvERDskon4sLGmf
 iyeMPeNQWcGKXFSHyiKb5/qJH0c1yQaQrJAlnqAcOlskLGnE5mVusCJmMY7QVSgt
 erAzZaoI1AWzy5lOtzKyZmR8iBgIAUwDGrUbJ/RnwBloQwJbYBCky7SpplN25nh7
 NK3zRJ/jyGA5JNtcmT5hZPwmiAnvLr88wVqZLbtI59xPdHvcbOSGRzMJSY38ZWs6
 ThZAGp3Pu/kWry0qsC2S0DAtgQKrmoLQbJlUnTM8BeP/xKWMvMZpN5cicSubfS+O
 s/Eeg10eerl6Avk9b25w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vufk9aapc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:39:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd6iI013938
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jan 2024 19:39:07 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:06 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 11/17] drm/msm/dp: add VSC SDP support for YUV420 over DP
Date: Thu, 25 Jan 2024 11:38:20 -0800
Message-ID: <20240125193834.7065-12-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xB1QBJ21Cx73MwFa8-CFZ3bczhSqz27F
X-Proofpoint-ORIG-GUID: xB1QBJ21Cx73MwFa8-CFZ3bczhSqz27F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250142
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support to pack and send the VSC SDP packet for DP. This therefore
allows the transmision of format information to the sinks which is
needed for YUV420 support over DP.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 147 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |   4 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   4 +
 drivers/gpu/drm/msm/dp/dp_panel.c   |  47 +++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h     |   3 +
 5 files changed, 205 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index c025786170ba5..7e4c68be23e56 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -29,6 +29,9 @@
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
+#define DP_GENERIC0_6_YUV_8_BPC		BIT(0)
+#define DP_GENERIC0_6_YUV_10_BPC	BIT(1)
+
 #define DP_INTERRUPT_STATUS1 \
 	(DP_INTR_AUX_XFER_DONE| \
 	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
@@ -907,6 +910,150 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
 	return 0;
 }
 
+static void dp_catalog_panel_setup_vsc_sdp(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog;
+	u32 header, parity, data;
+	u8 bpc, off = 0;
+	u8 buf[SZ_128];
+
+	if (!dp_catalog) {
+		pr_err("invalid input\n");
+		return;
+	}
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	/* HEADER BYTE 1 */
+	header = dp_catalog->sdp.sdp_header.HB1;
+	parity = dp_catalog_calculate_parity(header);
+	data   = ((header << HEADER_BYTE_1_BIT) | (parity << PARITY_BYTE_1_BIT));
+	dp_write_link(catalog, MMSS_DP_GENERIC0_0, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	/* HEADER BYTE 2 */
+	header = dp_catalog->sdp.sdp_header.HB2;
+	parity = dp_catalog_calculate_parity(header);
+	data   = ((header << HEADER_BYTE_2_BIT) | (parity << PARITY_BYTE_2_BIT));
+	dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
+
+	/* HEADER BYTE 3 */
+	header = dp_catalog->sdp.sdp_header.HB3;
+	parity = dp_catalog_calculate_parity(header);
+	data   = ((header << HEADER_BYTE_3_BIT) | (parity << PARITY_BYTE_3_BIT));
+	data |= dp_read_link(catalog, MMSS_DP_GENERIC0_1);
+	dp_write_link(catalog, MMSS_DP_GENERIC0_1, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	data = 0;
+	dp_write_link(catalog, MMSS_DP_GENERIC0_2, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_3, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_4, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_5, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	switch (dp_catalog->vsc_sdp_data.bpc) {
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
+	data = (dp_catalog->vsc_sdp_data.colorimetry & 0xF) |
+	       ((dp_catalog->vsc_sdp_data.pixelformat & 0xF) << 4) |
+	       (bpc << 8) |
+	       ((dp_catalog->vsc_sdp_data.dynamic_range & 0x1) << 15) |
+	       ((dp_catalog->vsc_sdp_data.content_type & 0x7) << 16);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_6, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	data = 0;
+	dp_write_link(catalog, MMSS_DP_GENERIC0_7, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_8, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	dp_write_link(catalog, MMSS_DP_GENERIC0_9, data);
+	memcpy(buf + off, &data, sizeof(data));
+	off += sizeof(data);
+
+	print_hex_dump(KERN_DEBUG, "[drm-dp] VSC: ", DUMP_PREFIX_NONE, 16, 4, buf, off, false);
+}
+
+void dp_catalog_panel_config_vsc_sdp(struct dp_catalog *dp_catalog, bool en)
+{
+	struct dp_catalog_private *catalog;
+	u32 cfg, cfg2, misc;
+	u16 major = 0, minor = 0;
+
+	if (!dp_catalog) {
+		pr_err("invalid input\n");
+		return;
+	}
+
+	catalog = container_of(dp_catalog, struct dp_catalog_private, dp_catalog);
+
+	cfg = dp_read_link(catalog, MMSS_DP_SDP_CFG);
+	cfg2 = dp_read_link(catalog, MMSS_DP_SDP_CFG2);
+	misc = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+
+	if (en) {
+		cfg |= GEN0_SDP_EN;
+		dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+
+		cfg2 |= GENERIC0_SDPSIZE;
+		dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+		dp_catalog_panel_setup_vsc_sdp(dp_catalog);
+
+		/* indicates presence of VSC (BIT(6) of MISC1) */
+		misc |= DP_MISC1_VSC_SDP;
+
+		drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=%d\n", en);
+	} else {
+		cfg &= ~GEN0_SDP_EN;
+		dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+
+		cfg2 &= ~GENERIC0_SDPSIZE;
+		dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+
+		/* switch back to MSA */
+		misc &= ~DP_MISC1_VSC_SDP;
+
+		drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=%d\n", en);
+	}
+
+	pr_debug("misc settings = 0x%x\n", misc);
+	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+
+	dp_catalog_hw_revision(dp_catalog, &major, &minor);
+	if (major == 1 && minor < 2) {
+		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
+		dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
+	}
+}
+
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 94c377ef90c35..6b757249c0698 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -7,6 +7,7 @@
 #define _DP_CATALOG_H_
 
 #include <drm/drm_modes.h>
+#include <drm/display/drm_dp_helper.h>
 
 #include "dp_parser.h"
 #include "disp/msm_disp_snapshot.h"
@@ -76,6 +77,8 @@ struct dp_catalog {
 	u32 dp_active;
 	enum dp_catalog_audio_sdp_type sdp_type;
 	enum dp_catalog_audio_header_type sdp_header;
+	struct dp_sdp sdp;
+	struct drm_dp_vsc_sdp vsc_sdp_data;
 	u32 audio_data;
 	bool wide_bus_en;
 };
@@ -196,6 +199,7 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
 
 /* DP Panel APIs */
 int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+void dp_catalog_panel_config_vsc_sdp(struct dp_catalog *dp_catalog, bool en);
 void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
 void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
 				struct drm_display_mode *drm_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 209cf2a35642f..ddd92a63d5a67 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1952,6 +1952,8 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	dp_catalog_panel_config_vsc_sdp(ctrl->catalog, false);
+
 	/* set dongle to D3 (power off) mode */
 	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
 
@@ -2026,6 +2028,8 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	dp_io = &ctrl->parser->io;
 	phy = dp_io->phy;
 
+	dp_catalog_panel_config_vsc_sdp(ctrl->catalog, false);
+
 	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index af7820b6d35ec..d6af9898b00d8 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -307,6 +307,49 @@ bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
 	return panel->major >= 1 && panel->minor >= 3 && panel->vsc_supported;
 }
 
+static int dp_panel_setup_vsc_sdp(struct dp_panel *dp_panel)
+{
+	struct dp_catalog *catalog;
+	struct dp_panel_private *panel;
+	struct dp_display_mode *dp_mode;
+	int rc = 0;
+
+	if (!dp_panel) {
+		pr_err("invalid input\n");
+		rc = -EINVAL;
+		return rc;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	catalog = panel->catalog;
+	dp_mode = &dp_panel->dp_mode;
+
+	memset(&catalog->sdp, 0, sizeof(catalog->sdp));
+	memset(&catalog->vsc_sdp_data, 0, sizeof(catalog->vsc_sdp_data));
+
+	/* VSC SDP header as per table 2-118 of DP 1.4 specification */
+	catalog->sdp.sdp_header.HB0 = 0x00;
+	catalog->sdp.sdp_header.HB1 = 0x07;
+	catalog->sdp.sdp_header.HB2 = 0x05;
+	catalog->sdp.sdp_header.HB3 = 0x13;
+
+	/* VSC SDP Payload for DB16 */
+	catalog->vsc_sdp_data.pixelformat = DP_PIXELFORMAT_YUV420;
+	catalog->vsc_sdp_data.colorimetry = DP_COLORIMETRY_DEFAULT;
+
+	/* VSC SDP Payload for DB17 */
+	catalog->vsc_sdp_data.dynamic_range = DP_DYNAMIC_RANGE_CTA;
+
+	/* VSC SDP Payload for DB18 */
+	catalog->vsc_sdp_data.content_type = DP_CONTENT_TYPE_GRAPHICS;
+
+	catalog->vsc_sdp_data.bpc = dp_mode->bpp / 3;
+
+	dp_catalog_panel_config_vsc_sdp(catalog, true);
+
+	return rc;
+}
+
 void dp_panel_dump_regs(struct dp_panel *dp_panel)
 {
 	struct dp_catalog *catalog;
@@ -370,6 +413,10 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
 	catalog->dp_active = data;
 
 	dp_catalog_panel_timing_cfg(catalog);
+
+	if (dp_panel->dp_mode.out_fmt_is_yuv_420)
+		dp_panel_setup_vsc_sdp(dp_panel);
+
 	panel->panel_on = true;
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index ea85a691e72b5..756ddf85b1e81 100644
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
+#define GENERIC0_SDPSIZE			(0x00010000)
 
 #define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
 #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
-- 
2.39.2

