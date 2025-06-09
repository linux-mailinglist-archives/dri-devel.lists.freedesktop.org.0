Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE63DAD1D40
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6841610E29C;
	Mon,  9 Jun 2025 12:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IiZBgZCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7706A10E286;
 Mon,  9 Jun 2025 12:23:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599VV4a015275;
 Mon, 9 Jun 2025 12:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YEVK4QOocm7yjop6eFdNjAhnOFXYkdyX1kX6lkapERY=; b=IiZBgZCtoXbeJHOQ
 MUshoM90Le1PAQHF2FvMxyr583ZRl/d3bWDUeHk5wBOnzYr95x22TCwCY1pbyrfv
 sbPCPRYrdM0T1iJnPdv8ga/bQc0tdOQW+yelbIahJhyJQZAVCqcsBkFfjS4a/bjU
 OpBzjLhv5SsijhkG96Hni7PYl9JrK6f36x6pG9aEB7maJMcSvS8avdP2OHcreqVW
 0Am4yKNC+hQRtcQQC6u90rP/TMKzIDgpOfZgsHWEnTm8wL8bgc8eguhTAo68N0yG
 KVvDUc1OH+Org+eAmX72MGdpc1at4Rjv2DAt9eyRGlLUo9J57qAUDBFl7a0CCspu
 VK5B3g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x5m1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNZnN012739
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:35 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:31 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:31 +0800
Subject: [PATCH v2 12/38] drm/msm/dp: add support for programming p1/p2/p3
 register block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-12-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471755; l=18782;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=JelKB3YsjYzFKjjiKN+VkAcD59iV2UINGqHh6gepbz0=;
 b=gFq/pTsie4To32twHjyQaXWfZwCQ+NRi3kaV89Ycp6zNoG3Fw17JlNkAfDiEJ35cMpDOSxQSe
 fl4ht2l9rEPAR6t+pizY1U4rXI/LKVrRnmJ7UpiMPRMz6oc9J8LTT7Z
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: cQ7S_hoZB03CMdtfSzqpNWUV2LdRbSIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MiBTYWx0ZWRfXwPGlWJfca//E
 ICw3f866NHh+oAi18d2YVb6qmcZlpXkpDjonVJLsaqes/XINbL8qxQoHHAIsXfp5piilJH/iKpx
 qG9J+r+ns0V1eofhz2JF36OutFnTrvaImrxQNCd+AFw6lPu2JvqoEbVfuSa+yrmQZ6nMnnUeFp5
 O4WOBL5zLIvRba7qNvJIsBOUxZhGmf1crkGr/Fglbt6OiKksy1qV77b1GSnIN36Vc0+2oLdVxR5
 AK5p5TIqPppWMqvzxLqEKt2Ez8THt28XCM8QaNp+pVjRBt78Rk1aZiulFWUsxDWWuZM3x/AVca7
 DKM0lCz0S03nWfT5CGF3AWkAg1t9IAqRlv0rgQIVnVsRX5vqXndVZUhIQWCZ8ya4/3jqa/8unsq
 PhOzvTLJBm3Hzg5aI111wTClFloNQEjTNA0/vMmLW1OkPxw0XmxQS7rZcZifB11rRU7k2VBz
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846d248 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=1fD0qQqZq30VoMthJ50A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cQ7S_hoZB03CMdtfSzqpNWUV2LdRbSIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090092
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

QCS8300 support 4 streams MST and SA8775P support 2 x 2 MST. Add
support for other 3 pixels register block, and introduced
msm_dp_read_pn/msm_dp_write_pn to minimize repetitive code. All PCLK
share the same register definitions with different base addresses.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 128 +++++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  18 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c    |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c |   2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |   8 ++-
 5 files changed, 93 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..d2d975805de93e929cbdadb90609b6bf3e2cf1bf 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -60,8 +60,8 @@
 #define DP_DEFAULT_AUX_SIZE	0x0200
 #define DP_DEFAULT_LINK_OFFSET	0x0400
 #define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
+#define DP_DEFAULT_PIXEL_OFFSET	0x1000
+#define DP_DEFAULT_PIXEL_SIZE	0x0400
 
 struct dss_io_region {
 	size_t len;
@@ -72,7 +72,7 @@ struct dss_io_data {
 	struct dss_io_region ahb;
 	struct dss_io_region aux;
 	struct dss_io_region link;
-	struct dss_io_region p0;
+	struct dss_io_region pixels[DP_STREAM_MAX];
 };
 
 struct msm_dp_catalog_private {
@@ -87,11 +87,17 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 			struct msm_dp_catalog_private, msm_dp_catalog);
 	struct dss_io_data *dss = &catalog->io;
+	char reg_name[6];
+	int i;
 
 	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
 	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
+	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
+		sprintf(reg_name, "dp_p%d", i);
+		msm_disp_snapshot_add_block(disp_state, dss->pixels[i].len,
+			dss->pixels[i].base, reg_name);
+	}
 }
 
 static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
@@ -124,24 +130,24 @@ static inline void msm_dp_write_ahb(struct msm_dp_catalog_private *catalog,
 	writel(data, catalog->io.ahb.base + offset);
 }
 
-static inline void msm_dp_write_p0(struct msm_dp_catalog_private *catalog,
-			       u32 offset, u32 data)
+static inline void msm_dp_write_pn(struct msm_dp_catalog_private *catalog,
+			       enum msm_dp_stream_id stream_id, u32 offset, u32 data)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	writel(data, catalog->io.p0.base + offset);
+	writel(data, catalog->io.pixels[stream_id].base + offset);
 }
 
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
-			       u32 offset)
+static inline u32 msm_dp_read_pn(struct msm_dp_catalog_private *catalog,
+			       enum msm_dp_stream_id stream_id, u32 offset)
 {
 	/*
 	 * To make sure interface reg writes happens before any other operation,
 	 * this function uses writel() instread of writel_relaxed()
 	 */
-	return readl_relaxed(catalog->io.p0.base + offset);
+	return  readl_relaxed(catalog->io.pixels[stream_id].base + offset);
 }
 
 static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
@@ -430,8 +436,8 @@ void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog
 }
 
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
-					u32 rate, u32 stream_rate_khz,
-					bool is_ycbcr_420)
+				    enum msm_dp_stream_id stream_id, u32 rate, u32 stream_rate_khz,
+				    bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -486,7 +492,7 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_DSC_DTO, 0x0);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -843,8 +849,9 @@ u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog)
 }
 
 /* panel related catalog functions */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active)
+int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
+				    enum msm_dp_stream_id stream_id, u32 total, u32 sync_start,
+				    u32 width_blanking, u32 msm_dp_active)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
@@ -855,7 +862,7 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
 	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
+	reg = msm_dp_read_pn(catalog, stream_id, MMSS_DP_INTF_CONFIG);
 
 	if (msm_dp_catalog->wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
@@ -865,7 +872,7 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 t
 
 	DRM_DEBUG_DP("wide_bus_en=%d reg=%#x\n", msm_dp_catalog->wide_bus_en, reg);
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_CONFIG, reg);
 	return 0;
 }
 
@@ -963,7 +970,8 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog)
 }
 
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode)
+				     enum msm_dp_stream_id stream_id,
+				     struct drm_display_mode *drm_mode)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
@@ -998,45 +1006,46 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_pn(catalog, stream_id, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(catalog->drm_dev, "%s: enabled tpg\n", __func__);
 }
 
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
+void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog,
+				      enum msm_dp_stream_id stream_id)
 {
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_pn(catalog, stream_id, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
@@ -1051,10 +1060,11 @@ static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_
 	return base;
 }
 
-static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
+static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog, int max_stream)
 {
 	struct platform_device *pdev = to_platform_device(catalog->dev);
 	struct dss_io_data *dss = &catalog->io;
+	int i;
 
 	dss->ahb.base = msm_dp_ioremap(pdev, 0, &dss->ahb.len);
 	if (IS_ERR(dss->ahb.base))
@@ -1070,7 +1080,7 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 		 * lengths based on this single region.
 		 */
 		if (PTR_ERR(dss->aux.base) == -EINVAL) {
-			if (dss->ahb.len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+			if (dss->ahb.len < DP_DEFAULT_PIXEL_OFFSET + DP_DEFAULT_PIXEL_SIZE) {
 				DRM_ERROR("legacy memory region not large enough\n");
 				return -EINVAL;
 			}
@@ -1080,8 +1090,11 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 			dss->aux.len = DP_DEFAULT_AUX_SIZE;
 			dss->link.base = dss->ahb.base + DP_DEFAULT_LINK_OFFSET;
 			dss->link.len = DP_DEFAULT_LINK_SIZE;
-			dss->p0.base = dss->ahb.base + DP_DEFAULT_P0_OFFSET;
-			dss->p0.len = DP_DEFAULT_P0_SIZE;
+			for (i = DP_STREAM_0; i < max_stream; i++) {
+				dss->pixels[i].base =
+					dss->ahb.base + (i + 1) * DP_DEFAULT_PIXEL_OFFSET;
+				dss->pixels[i].len = DP_DEFAULT_PIXEL_SIZE;
+			}
 		} else {
 			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux.base);
 			return PTR_ERR(dss->aux.base);
@@ -1093,17 +1106,26 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
 			return PTR_ERR(dss->link.base);
 		}
 
-		dss->p0.base = msm_dp_ioremap(pdev, 3, &dss->p0.len);
-		if (IS_ERR(dss->p0.base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
-			return PTR_ERR(dss->p0.base);
+		dss->pixels[0].base = msm_dp_ioremap(pdev, 3, &dss->pixels[0].len);
+		if (IS_ERR(dss->pixels[0].base)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->pixels[0].base);
+			return PTR_ERR(dss->pixels[0].base);
+		}
+
+		for (i = DP_STREAM_1; i < max_stream; i++) {
+			/* pixels clk reg index start from 3*/
+			dss->pixels[i].base = msm_dp_ioremap(pdev, i + 3, &dss->pixels[i].len);
+
+			if (IS_ERR(dss->pixels[i].base))
+				DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
+					      dss->pixels[i].base);
 		}
 	}
 
 	return 0;
 }
 
-struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
+struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev, int max_stream)
 {
 	struct msm_dp_catalog_private *catalog;
 	int ret;
@@ -1114,7 +1136,7 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 
 	catalog->dev = dev;
 
-	ret = msm_dp_catalog_get_io(catalog);
+	ret = msm_dp_catalog_get_io(catalog, max_stream);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index f9e7506afcf4f4d932665462ca316f6c66c662a6..9bfb83873ce8749bec173a2bc2366c429f91354a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -67,8 +67,9 @@ void msm_dp_catalog_ctrl_mainlink_ctrl(struct msm_dp_catalog *msm_dp_catalog, bo
 void msm_dp_catalog_ctrl_psr_mainlink_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32 cc, u32 tb);
-void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
-				u32 stream_rate_khz, bool is_ycbcr_420);
+void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
+				    enum msm_dp_stream_id stream_id, u32 rate, u32 stream_rate_khz,
+				    bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
 u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
@@ -93,15 +94,18 @@ void msm_dp_catalog_ctrl_send_phy_pattern(struct msm_dp_catalog *msm_dp_catalog,
 u32 msm_dp_catalog_ctrl_read_phy_pattern(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Panel APIs */
-int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog, u32 total,
-				u32 sync_start, u32 width_blanking, u32 msm_dp_active);
+int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
+				    enum msm_dp_stream_id stream_id, u32 total, u32 sync_start,
+				    u32 width_blanking, u32 msm_dp_active);
 void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog, struct dp_sdp *vsc_sdp);
 void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
-				struct drm_display_mode *drm_mode);
-void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
+				     enum msm_dp_stream_id stream_id,
+				     struct drm_display_mode *drm_mode);
+void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog,
+				      enum msm_dp_stream_id stream_id);
 
-struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
+struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev, int max_stream);
 
 /* DP Audio APIs */
 void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 7db23968c4227557d3cea9bfbf5aa3c3e17a87d8..594dd6fe9381403b8ab085441276d2ce26612efe 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2075,7 +2075,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 
 	msm_dp_ctrl_configure_source_params(ctrl, msm_dp_panel);
 
-	msm_dp_catalog_ctrl_config_msa(ctrl->catalog,
+	msm_dp_catalog_ctrl_config_msa(ctrl->catalog, msm_dp_panel->stream_id,
 		ctrl->link->link_params.rate,
 		pixel_rate_orig,
 		msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a13e4007858701787562eded7b6fc8f7171e167b..76d07685f5a89109723b68ba9d97c0b0332b18aa 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -748,7 +748,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error;
 	}
 
-	dp->catalog = msm_dp_catalog_get(dev);
+	dp->catalog = msm_dp_catalog_get(dev, dp->max_stream);
 	if (IS_ERR(dp->catalog)) {
 		rc = PTR_ERR(dp->catalog);
 		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index d9041e235104a74b3cc50ff2e307eae0c4301ef3..fb9216673f0d39d10af864346ebfa884dbe1f499 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -285,12 +285,13 @@ void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
 	}
 
 	if (!enable) {
-		msm_dp_catalog_panel_tpg_disable(catalog);
+		msm_dp_catalog_panel_tpg_disable(catalog, msm_dp_panel->stream_id);
 		return;
 	}
 
 	drm_dbg_dp(panel->drm_dev, "calling catalog tpg_enable\n");
-	msm_dp_catalog_panel_tpg_enable(catalog, &panel->msm_dp_panel.msm_dp_mode.drm_mode);
+	msm_dp_catalog_panel_tpg_enable(catalog, msm_dp_panel->stream_id,
+					&msm_dp_panel->msm_dp_mode.drm_mode);
 }
 
 static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
@@ -395,7 +396,8 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_active = data;
 
-	msm_dp_catalog_panel_timing_cfg(catalog, total, sync_start, width_blanking, msm_dp_active);
+	msm_dp_catalog_panel_timing_cfg(catalog, msm_dp_panel->stream_id, total, sync_start,
+					width_blanking, msm_dp_active);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);

-- 
2.34.1

