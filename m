Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C7CAD1D52
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622CC10E2B1;
	Mon,  9 Jun 2025 12:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="n5rXbOia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69C910E2B6;
 Mon,  9 Jun 2025 12:24:08 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599ZgUU018309;
 Mon, 9 Jun 2025 12:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PH8x+2vmG4U0nxdfykqKwnxfPRDEpsAoGFVnViU/egE=; b=n5rXbOiaHXrKXi6k
 1hpgIFLYU/rqbEYeyVbYZDwf0kVdx8mMqhtcAF5UBeV9PnGvjWr3+fPIWIZIaQ0y
 1+sGpw0T/n53KL54rBryYSXlDnTNHiKnenH33M9g2uHf351TR/glw3L1GNySalW7
 vMptyIG6lNo28fj9S2ocYqKtB2YEh+x+Z8EaPOSqeYsv62499EsYZcZ4r6Tl6LKm
 dDcpxP9U1CqgfACaZDX88vnRAXgFQmqmMC8Qco6+LXTbwuN/a+6/SM1pp/hoWCBZ
 2tLnABzEHvTTy3nf2bgI3bzQDLCJif5jqIG0oJjIiTixsA5u2mecVJE5rqKhE+O6
 e3X8ig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9p4pn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:24:02 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNdhN003810
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:39 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:35 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:32 +0800
Subject: [PATCH v2 13/38] drm/msm/dp: use stream_id to change offsets in
 dp_catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-13-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471756; l=17796;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=7N6pOqh6d8Y4ekzkELTcrGUFgXw5zClOqWrhSjH0vPQ=;
 b=+wio/c4wzNH+yUdyRdlblHD80qIV4IUjzsmjF/PDCXZmbEUdMiByS6L3/N8Q33oosjrMK7+S4
 2ykMFEhGiZfADU4HqWJygccUbm9CvwajDXetdLFDieslkZO/4Rfww1l
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xYzvgoUSKhpPPZ8pZujAlwP2nFjbTPxc
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846d262 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=KwIAv-fSTdgt_g4ZFToA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xYzvgoUSKhpPPZ8pZujAlwP2nFjbTPxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX2sA0C5DnmfcN
 lTWAHfA/B/rkdZlns34yDBcolxLFpXf3u0ICELraYP8nao6axi70bI36k3dGblWRsBKVYJ/SZmC
 KPY70TpPb9tFs1Ij3DX0wsqgraGOX11kwQhA33NgPUI5WsOS/56a56AFd3HaSOIbNJSWnOXvyC0
 e3RqKrDyZDAT8FXT/6VQ0jmBDa0DP6Qn1HCWQhxCUhhFjX/3y8Oqpyu5VX8ghkTlU4MbGL9dEiZ
 JxkCqVz2A2dwVrcykXa8TT9KqfdlgDaNxmPNNEl7BWl7cq1O89LIPHrHfIhQMEI5vBEbbQ506cn
 Hj9Xl/bIYTagvsNUHi7MSGnB75PEapguCFT/XcNp4Am7Zwu8nP3CgWlAbExquomhcu8eipG9V5o
 Gkj/7GdXRskdwJ+J4F3+qlklrlosAlfIrd72Y8fxSoC2CbgCif9DVhFXFajNiMC5JuZJBwWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090093
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Use the dp_panel's stream_id to adjust the offsets for stream 1
which will be used for MST in the dp_catalog. Stream 1 share the
same link clk with stream 0 with different reg offset. Also add
additional register defines for stream 1.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 106 +++++++++++++++++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  12 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   7 ++-
 drivers/gpu/drm/msm/dp/dp_panel.c   |   3 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |  14 ++++-
 5 files changed, 102 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index d2d975805de93e929cbdadb90609b6bf3e2cf1bf..0f23f69765f63a25650ed6612f1b83338483a142 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -319,14 +319,20 @@ void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 s
 	msm_dp_write_link(catalog, REG_DP_STATE_CTRL, state);
 }
 
-void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 cfg)
+void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog,
+				     enum msm_dp_stream_id stream_id, u32 cfg)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 reg_offset = 0;
 
-	drm_dbg_dp(catalog->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", cfg);
+	if (stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
 
-	msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
+	msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL + reg_offset, cfg);
+
+	drm_dbg_dp(catalog->drm_dev, "stream_id:%d DP_CONFIGURATION_CTRL=0x%x\n",
+		stream_id, cfg);
 }
 
 void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog)
@@ -398,14 +404,19 @@ void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 }
 
 void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
-					u32 colorimetry_cfg,
-					u32 test_bits_depth)
+				     enum msm_dp_stream_id stream_id, u32 colorimetry_cfg,
+				     u32 test_bits_depth)
 {
 	u32 misc_val;
+	u32 reg_offset = 0;
+
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	if (stream_id == DP_STREAM_1)
+		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+
+	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + reg_offset);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -415,7 +426,7 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
 }
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
@@ -445,10 +456,16 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	u32 const link_rate_hbr2 = 540000;
 	u32 const link_rate_hbr3 = 810000;
 	unsigned long den, num;
+	u32 mvid_reg_off = 0, nvid_reg_off = 0;
 
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
+	if (stream_id == DP_STREAM_1) {
+		mvid_reg_off = REG_DP1_SOFTWARE_MVID - REG_DP_SOFTWARE_MVID;
+		nvid_reg_off = REG_DP1_SOFTWARE_NVID - REG_DP_SOFTWARE_NVID;
+	}
+
 	if (rate == link_rate_hbr3)
 		pixel_div = 6;
 	else if (rate == 162000 || rate == 270000)
@@ -490,8 +507,8 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 		nvid *= 3;
 
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
+	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
 	msm_dp_write_pn(catalog, stream_id, MMSS_DP_DSC_DTO, 0x0);
 }
 
@@ -856,11 +873,15 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 	u32 reg;
+	u32 offset = 0;
 
-	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	if (stream_id == DP_STREAM_1)
+		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
+
+	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER + offset, total);
+	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
+	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
+	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
 
 	reg = msm_dp_read_pn(catalog, stream_id, MMSS_DP_INTF_CONFIG);
 
@@ -876,59 +897,80 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
 	return 0;
 }
 
-static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
+static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
+					      enum msm_dp_stream_id stream_id,
+					      struct dp_sdp *vsc_sdp)
 {
 	struct msm_dp_catalog_private *catalog;
 	u32 header[2];
 	u32 val;
 	int i;
+	u32 msm_dp_generic_offset = 0;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
+	if (stream_id == DP_STREAM_1)
+		msm_dp_generic_offset = MMSS_DP1_GENERIC0_0 - MMSS_DP_GENERIC0_0;
+
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0 + msm_dp_generic_offset, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1 + msm_dp_generic_offset, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i + msm_dp_generic_offset, val);
 	}
 }
 
-static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog)
+static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalog,
+					    enum msm_dp_stream_id stream_id)
 {
 	struct msm_dp_catalog_private *catalog;
 	u32 hw_revision;
+	u32 sdp_cfg3_offset = 0;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
+	if (stream_id == DP_STREAM_1)
+		sdp_cfg3_offset = MMSS_DP1_SDP_CFG3 - MMSS_DP_SDP_CFG3;
+
 	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
 	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x01);
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x00);
 	}
 }
 
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp)
+void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
+					 enum msm_dp_stream_id stream_id, struct dp_sdp *vsc_sdp)
 {
 	struct msm_dp_catalog_private *catalog;
 	u32 cfg, cfg2, misc;
+	u32 misc_reg_offset = 0;
+	u32 sdp_cfg_offset = 0;
+	u32 sdp_cfg2_offset = 0;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
 
-	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0);
+	if (stream_id == DP_STREAM_1) {
+		misc_reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
+		sdp_cfg_offset = MMSS_DP1_SDP_CFG - MMSS_DP_SDP_CFG;
+		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
+	}
+
+	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
-	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, vsc_sdp);
+	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, stream_id, vsc_sdp);
 
 	/* indicates presence of VSC (BIT(6) of MISC1) */
 	misc |= DP_MISC1_VSC_SDP;
@@ -936,12 +978,14 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
 
-	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
+	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
+
+	msm_dp_catalog_panel_update_sdp(msm_dp_catalog, stream_id);
 }
 
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
+void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
+					  enum msm_dp_stream_id stream_id)
 {
 	struct msm_dp_catalog_private *catalog;
 	u32 cfg, cfg2, misc;
@@ -966,7 +1010,7 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 	pr_debug("misc settings = 0x%x\n", misc);
 	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
 
-	msm_dp_catalog_panel_update_sdp(msm_dp_catalog);
+	msm_dp_catalog_panel_update_sdp(msm_dp_catalog, stream_id);
 }
 
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 9bfb83873ce8749bec173a2bc2366c429f91354a..ef0e3fadcd04ae499d6340d05fd74392235bed76 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -61,12 +61,14 @@ u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */
 void msm_dp_catalog_ctrl_state_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 state);
-void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog, u32 config);
+void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog,
+				     enum msm_dp_stream_id stream_id, u32 config);
 void msm_dp_catalog_ctrl_lane_mapping(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog, bool enable);
 void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32 cc, u32 tb);
+void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
+				     enum msm_dp_stream_id stream_id,  u32 cc, u32 tb);
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 				    enum msm_dp_stream_id stream_id, u32 rate, u32 stream_rate_khz,
 				    bool is_ycbcr_420);
@@ -97,8 +99,10 @@ u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
 				    enum msm_dp_stream_id stream_id, u32 total, u32 sync_start,
 				    u32 width_blanking, u32 msm_dp_active);
-void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
-void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
+void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
+					 enum msm_dp_stream_id stream_id, struct dp_sdp *vsc_sdp);
+void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
+					  enum msm_dp_stream_id stream_id);
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				     enum msm_dp_stream_id stream_id,
 				     struct drm_display_mode *drm_mode);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 594dd6fe9381403b8ab085441276d2ce26612efe..6c3c27b48b3b13f205ce28b823ae26d5dc7d9a10 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -172,7 +172,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl,
 	if (ctrl->panel->psr_cap.version)
 		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
 
-	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
+	msm_dp_catalog_ctrl_config_ctrl(ctrl->catalog, msm_dp_panel->stream_id, config);
 }
 
 static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl,
@@ -188,7 +188,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	tb = msm_dp_link_get_test_bits_depth(ctrl->link,
 		msm_dp_panel->msm_dp_mode.bpp);
 	cc = msm_dp_link_get_colorimetry_config(ctrl->link);
-	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
+	msm_dp_catalog_ctrl_config_misc(ctrl->catalog, msm_dp_panel->stream_id, cc, tb);
 	msm_dp_panel_timing_cfg(msm_dp_panel);
 }
 
@@ -2100,7 +2100,8 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_d
 	struct msm_dp_ctrl_private *ctrl;
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog);
+	msm_dp_catalog_panel_disable_vsc_sdp(ctrl->catalog, dp_panel->stream_id);
+
 }
 
 void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl)
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index fb9216673f0d39d10af864346ebfa884dbe1f499..a07237b41db148c02fdfaef18aab5cbf71779b57 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -310,6 +310,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 	catalog = panel->catalog;
+
 	msm_dp_mode = &msm_dp_panel->msm_dp_mode;
 
 	memset(&vsc_sdp_data, 0, sizeof(vsc_sdp_data));
@@ -336,7 +337,7 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 		return len;
 	}
 
-	msm_dp_catalog_panel_enable_vsc_sdp(catalog, &vsc_sdp);
+	msm_dp_catalog_panel_enable_vsc_sdp(catalog, msm_dp_panel->stream_id, &vsc_sdp);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 3835c7f5cb984406f8fc52ea765ef2315e0d175b..623a58163f7028dcaac2f4d4416ee091db9f5024 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -122,6 +122,7 @@
 #define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
+#define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
 #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
 #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
@@ -138,13 +139,17 @@
 #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
 
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
+#define REG_DP1_SOFTWARE_MVID			(0x00000414)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
+#define REG_DP1_SOFTWARE_NVID			(0x00000418)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
+#define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
 #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
 #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
 #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
-
 #define REG_DP_MISC1_MISC0			(0x0000002C)
+#define REG_DP1_MISC1_MISC0			(0x0000042C)
+
 #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
 #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
 #define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
@@ -211,8 +216,11 @@
 #define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
 
 #define MMSS_DP_SDP_CFG				(0x00000228)
+#define MMSS_DP1_SDP_CFG			(0x000004E0)
 #define GEN0_SDP_EN				(0x00020000)
 #define MMSS_DP_SDP_CFG2			(0x0000022C)
+#define MMSS_DP1_SDP_CFG2			(0x000004E4)
+
 #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
 #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
 #define GENERIC0_SDPSIZE_VALID			(0x00010000)
@@ -221,6 +229,8 @@
 #define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
 
 #define MMSS_DP_SDP_CFG3			(0x0000024c)
+#define MMSS_DP1_SDP_CFG3			(0x000004E8)
+
 #define UPDATE_SDP				(0x00000001)
 
 #define MMSS_DP_EXTENSION_0			(0x00000250)
@@ -270,6 +280,8 @@
 #define MMSS_DP_GENERIC1_8			(0x00000348)
 #define MMSS_DP_GENERIC1_9			(0x0000034C)
 
+#define MMSS_DP1_GENERIC0_0			(0x00000490)
+
 #define MMSS_DP_VSCEXT_0			(0x000002D0)
 #define MMSS_DP_VSCEXT_1			(0x000002D4)
 #define MMSS_DP_VSCEXT_2			(0x000002D8)

-- 
2.34.1

