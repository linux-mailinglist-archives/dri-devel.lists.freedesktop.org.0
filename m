Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F3AD1D45
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 14:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA81410E287;
	Mon,  9 Jun 2025 12:24:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BaWO/RMj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781B110E253;
 Mon,  9 Jun 2025 12:24:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599R2fr001080;
 Mon, 9 Jun 2025 12:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NATlPxPRpB8HoWD9L5MbLr5mHFmdYvIVKRX+kqjRISY=; b=BaWO/RMj5ygGFxp+
 sCEsRrdvM3WXZx1o02Fj3WFEQd2glm1x5qEp7K+4kpVc9PwkN7BQcnD5C3YUPxIm
 MqdtI8KRqHPt7ija6LanY/8w+wvdYuuhyU1y2hq6gNmfAylm5aj53qYxP8uc17pP
 scqmPlYQZfQ1XASW4LxYc755kCjnkaBZFUcjDtSOan8XUv3KHBdvXHluIzXfasjV
 GymBiOprhmIWgxpK61K0wXp98kztg9tAFRti6cl6zn+Sz22306KVFlf8wynH9XNt
 3K9r/q8xql6g43lgtokATYvZ5tSnuH0QX8YFB4QkBVRa1sSWWymkcmrOfjKKv2sf
 4/rGaA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxpaf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Jun 2025 12:23:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CNhQO020702
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 9 Jun 2025 12:23:43 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:23:39 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:33 +0800
Subject: [PATCH v2 14/38] drm/msm/dp: Add catalog support for 3rd/4th
 stream MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-14-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Yongxing Mou" <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471756; l=16804;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=YyOdfjR+mo8FFl+lDB6jODrHf7EZgoZQZrvRXDPltIM=;
 b=XKYUrEA7DJZmPURgNerxRHB4nfVF1TFvjmgPWJ4xPj0wPAIjfKrH5AwWYauwb69OmxjObuB0U
 nvCDT2EZp6gBZO3PqAjOGH2y53ULmpu7aH62YwEpZPpjUIFIrtuccuc
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YH_LwvlOoPsJxUmuaSDUNdG-R0yY1Zcc
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6846d25a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=9qUns-RCWyWEfIQEW78A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: YH_LwvlOoPsJxUmuaSDUNdG-R0yY1Zcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX/993mZowCikz
 TJ0Je0t6+oyF20/jhuZ44nuMNzUZ5I54NhmL93H8sqhGwbbVBeo2UVYcBaPBbwzuNPSkVgkveaK
 l6BDDlEHM3wEeHCvbphOrrHcB2q4nQ3Qr9agJP+XZIsJoPKZjKrR/LK85hIjfTzMV8FxMOReMsA
 Cx1QVIRKF3a6q+fDwJJLCQm3SS+amIro19M5UhKGdyGszJ6DXPQ55C+58hLXga34AFMogzzAbi5
 A3D0tQLloRlTBa6GHwYkmeEz2JrOv+ARrJB9BI0bpCMm+JH7pFh9fkSKrxzFz7r/Gl9zbecpA5l
 a1qCbX7XkfwPm1hXQcl8YULFWTIEkOpGosA/nkwrWY/JMiO8qxXz3Qmd5KCYh38yLiYmsiPih0g
 67HCj3HClUMrbSVEQ8Sh5UEjbFkUqgXZs9g+ijhtk7Q3kOQYDEAgoZSb78chLFbN0AU7bjHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093
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

To support the 4 streams MST, the link clocks for stream 3/4
are controlled by MST_2_LCLK and MST_3_LCLK. They share the same
definition but have different base addresses. Add corresponding
catalog support to be able to proggram this block.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 182 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_reg.h     |  14 +++
 2 files changed, 169 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 0f23f69765f63a25650ed6612f1b83338483a142..07d06cd36eea5ea1dd90daf01422b8ecdffb13fe 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -72,6 +72,8 @@ struct dss_io_data {
 	struct dss_io_region ahb;
 	struct dss_io_region aux;
 	struct dss_io_region link;
+	struct dss_io_region mst2_link;
+	struct dss_io_region mst3_link;
 	struct dss_io_region pixels[DP_STREAM_MAX];
 };
 
@@ -93,6 +95,10 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 	msm_disp_snapshot_add_block(disp_state, dss->ahb.len, dss->ahb.base, "dp_ahb");
 	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
 	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, dss->mst2_link.len, dss->mst2_link.base,
+				    "dp_mst2_link");
+	msm_disp_snapshot_add_block(disp_state, dss->mst3_link.len, dss->mst3_link.base,
+				    "dp_mst3_link");
 	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
 		sprintf(reg_name, "dp_p%d", i);
 		msm_disp_snapshot_add_block(disp_state, dss->pixels[i].len,
@@ -165,6 +171,36 @@ static inline void msm_dp_write_link(struct msm_dp_catalog_private *catalog,
 	writel(data, catalog->io.link.base + offset);
 }
 
+static inline u32 msm_dp_read_mst_link(struct msm_dp_catalog_private *catalog,
+				       enum msm_dp_stream_id stream_id, u32 offset)
+{
+	u32 ret = 0;
+
+	if (stream_id == DP_STREAM_2)
+		ret = readl_relaxed(catalog->io.mst2_link.base + offset);
+	else if (stream_id == DP_STREAM_3)
+		ret = readl_relaxed(catalog->io.mst3_link.base + offset);
+	else
+		DRM_ERROR("invalid stream id");
+
+	return ret;
+}
+
+static inline void msm_dp_write_mst_link(struct msm_dp_catalog_private *catalog,
+					 enum msm_dp_stream_id stream_id, u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	if (stream_id == DP_STREAM_2)
+		writel(data, catalog->io.mst2_link.base + offset);
+	else if (stream_id == DP_STREAM_3)
+		writel(data, catalog->io.mst3_link.base + offset);
+	else
+		DRM_ERROR("invalid stream id");
+}
+
 /* aux related catalog functions */
 u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
 {
@@ -329,7 +365,10 @@ void msm_dp_catalog_ctrl_config_ctrl(struct msm_dp_catalog *msm_dp_catalog,
 	if (stream_id == DP_STREAM_1)
 		reg_offset = REG_DP1_CONFIGURATION_CTRL - REG_DP_CONFIGURATION_CTRL;
 
-	msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL + reg_offset, cfg);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_CONFIGURATION_CTRL, cfg);
+	else
+		msm_dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL + reg_offset, cfg);
 
 	drm_dbg_dp(catalog->drm_dev, "stream_id:%d DP_CONFIGURATION_CTRL=0x%x\n",
 		stream_id, cfg);
@@ -416,7 +455,10 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	if (stream_id == DP_STREAM_1)
 		reg_offset = REG_DP1_MISC1_MISC0 - REG_DP_MISC1_MISC0;
 
-	misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + reg_offset);
+	if (stream_id > DP_STREAM_1)
+		misc_val = msm_dp_read_mst_link(catalog, stream_id, REG_DP_MST_LINK_MISC1_MISC0);
+	else
+		misc_val = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + reg_offset);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -426,7 +468,11 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(catalog->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
+
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_MISC1_MISC0, misc_val);
+	else
+		msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + reg_offset, misc_val);
 }
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
@@ -506,9 +552,15 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	if (link_rate_hbr3 == rate)
 		nvid *= 3;
 
-	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
-	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
+	drm_dbg_dp(catalog->drm_dev, "stream_id:%d mvid=0x%x, nvid=0x%x\n", stream_id, mvid, nvid);
+	if (stream_id > DP_STREAM_1) {
+		msm_dp_write_mst_link(catalog, stream_id, REG_MST_LINK_SOFTWARE_MVID, mvid);
+		msm_dp_write_mst_link(catalog, stream_id, REG_MST_LINK_SOFTWARE_NVID, nvid);
+	} else {
+		msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID + mvid_reg_off, mvid);
+		msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID + nvid_reg_off, nvid);
+	}
+
 	msm_dp_write_pn(catalog, stream_id, MMSS_DP_DSC_DTO, 0x0);
 }
 
@@ -878,10 +930,21 @@ int msm_dp_catalog_panel_timing_cfg(struct msm_dp_catalog *msm_dp_catalog,
 	if (stream_id == DP_STREAM_1)
 		offset = REG_DP1_TOTAL_HOR_VER - REG_DP_TOTAL_HOR_VER;
 
-	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER + offset, total);
-	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
-	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset, width_blanking);
-	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
+	if (stream_id > DP_STREAM_1) {
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_TOTAL_HOR_VER, total);
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_START_HOR_VER_FROM_SYNC,
+				      sync_start);
+		msm_dp_write_mst_link(catalog, stream_id,
+				      REG_DP_MST_LINK_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_ACTIVE_HOR_VER,
+				      msm_dp_active);
+	} else {
+		msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER + offset, total);
+		msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC + offset, sync_start);
+		msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY + offset,
+				  width_blanking);
+		msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER + offset, msm_dp_active);
+	}
 
 	reg = msm_dp_read_pn(catalog, stream_id, MMSS_DP_INTF_CONFIG);
 
@@ -914,13 +977,24 @@ static void msm_dp_catalog_panel_send_vsc_sdp(struct msm_dp_catalog *msm_dp_cata
 
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0 + msm_dp_generic_offset, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1 + msm_dp_generic_offset, header[1]);
+	if (stream_id > DP_STREAM_1) {
+		msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_GENERIC0_0, header[0]);
+		msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_GENERIC0_1, header[1]);
+	} else {
+		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_0 + msm_dp_generic_offset, header[0]);
+		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_1 + msm_dp_generic_offset, header[1]);
+	}
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i + msm_dp_generic_offset, val);
+
+		if (stream_id > DP_STREAM_1)
+			msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_GENERIC0_2 + i,
+					      val);
+		else
+			msm_dp_write_link(catalog, MMSS_DP_GENERIC0_2 + i + msm_dp_generic_offset,
+					  val);
 	}
 }
 
@@ -938,8 +1012,13 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 
 	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
 	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x01);
-		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x00);
+		if (stream_id > DP_STREAM_1) {
+			msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG3, 0x01);
+			msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG3, 0x00);
+		} else {
+			msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x01);
+			msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3 + sdp_cfg3_offset, 0x00);
+		}
 	}
 }
 
@@ -960,15 +1039,27 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 		sdp_cfg2_offset = MMSS_DP1_SDP_CFG2 - MMSS_DP_SDP_CFG2;
 	}
 
-	cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset);
-	cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
-	misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	if (stream_id > DP_STREAM_1) {
+		cfg = msm_dp_read_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG);
+		cfg2 = msm_dp_read_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG2);
+		misc = msm_dp_read_mst_link(catalog, stream_id, REG_DP_MST_LINK_MISC1_MISC0);
+	} else {
+		cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+		cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+		misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	}
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG, cfg);
+	else
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG2, cfg2);
+	else
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
 	msm_dp_catalog_panel_send_vsc_sdp(msm_dp_catalog, stream_id, vsc_sdp);
 
@@ -979,7 +1070,10 @@ void msm_dp_catalog_panel_enable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 
 	pr_debug("misc settings = 0x%x\n", misc);
 
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_MISC1_MISC0, misc);
+	else
+		msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog, stream_id);
 }
@@ -989,18 +1083,39 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
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
+	if (stream_id > DP_STREAM_1) {
+		cfg = msm_dp_read_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG);
+		cfg2 = msm_dp_read_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG2);
+		misc = msm_dp_read_mst_link(catalog, stream_id, REG_DP_MST_LINK_MISC1_MISC0);
+	} else {
+		cfg = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset);
+		cfg2 = msm_dp_read_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset);
+		misc = msm_dp_read_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset);
+	}
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG, cfg);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG, cfg);
+	else
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG + sdp_cfg_offset, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2, cfg2);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, MMSS_DP_MST_LINK_SDP_CFG2, cfg2);
+	else
+		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG2 + sdp_cfg2_offset, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -1008,7 +1123,10 @@ void msm_dp_catalog_panel_disable_vsc_sdp(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(catalog, REG_DP_MISC1_MISC0, misc);
+	if (stream_id > DP_STREAM_1)
+		msm_dp_write_mst_link(catalog, stream_id, REG_DP_MST_LINK_MISC1_MISC0, misc);
+	else
+		msm_dp_write_link(catalog, REG_DP_MISC1_MISC0 + misc_reg_offset, misc);
 
 	msm_dp_catalog_panel_update_sdp(msm_dp_catalog, stream_id);
 }
@@ -1164,6 +1282,16 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog, int max
 				DRM_DEBUG_DP("unable to remap p%d region: %pe\n", i,
 					      dss->pixels[i].base);
 		}
+
+		dss->mst2_link.base = msm_dp_ioremap(pdev, 7, &dss->mst2_link.len);
+		if (IS_ERR(dss->mst2_link.base))
+			DRM_DEBUG_DP("unable to remap mst2_link region: %pe\n",
+				     dss->mst2_link.base);
+
+		dss->mst3_link.base = msm_dp_ioremap(pdev, 8, &dss->mst3_link.len);
+		if (IS_ERR(dss->mst3_link.base))
+			DRM_DEBUG_DP("unable to remap mst3_link region: %pe\n",
+				     dss->mst3_link.base);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index 623a58163f7028dcaac2f4d4416ee091db9f5024..06b3d570336347e38fba8cd0dfb44d25046e5950 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -123,6 +123,7 @@
 
 #define REG_DP_CONFIGURATION_CTRL		(0x00000008)
 #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
+#define REG_DP_MST_LINK_CONFIGURATION_CTRL	(0x00000034)
 #define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
 #define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
 #define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
@@ -140,15 +141,22 @@
 
 #define REG_DP_SOFTWARE_MVID			(0x00000010)
 #define REG_DP1_SOFTWARE_MVID			(0x00000414)
+#define REG_MST_LINK_SOFTWARE_MVID		(0x00000040)
 #define REG_DP_SOFTWARE_NVID			(0x00000018)
 #define REG_DP1_SOFTWARE_NVID			(0x00000418)
+#define REG_MST_LINK_SOFTWARE_NVID		(0x00000044)
 #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
 #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
+#define REG_DP_MST_LINK_TOTAL_HOR_VER		(0x00000048)
 #define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
+#define REG_DP_MST_LINK_START_HOR_VER_FROM_SYNC	(0x0000004C)
 #define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
+#define REG_DP_MST_LINK_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000050)
 #define REG_DP_ACTIVE_HOR_VER			(0x00000028)
+#define REG_DP_MST_LINK_ACTIVE_HOR_VER		(0x00000054)
 #define REG_DP_MISC1_MISC0			(0x0000002C)
 #define REG_DP1_MISC1_MISC0			(0x0000042C)
+#define REG_DP_MST_LINK_MISC1_MISC0		(0x00000058)
 
 #define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
 #define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
@@ -217,9 +225,11 @@
 
 #define MMSS_DP_SDP_CFG				(0x00000228)
 #define MMSS_DP1_SDP_CFG			(0x000004E0)
+#define MMSS_DP_MST_LINK_SDP_CFG		(0x0000010c)
 #define GEN0_SDP_EN				(0x00020000)
 #define MMSS_DP_SDP_CFG2			(0x0000022C)
 #define MMSS_DP1_SDP_CFG2			(0x000004E4)
+#define MMSS_DP_MST_LINK_SDP_CFG2		(0x0000011c)
 
 #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
 #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
@@ -230,6 +240,7 @@
 
 #define MMSS_DP_SDP_CFG3			(0x0000024c)
 #define MMSS_DP1_SDP_CFG3			(0x000004E8)
+#define MMSS_DP_MST_LINK_SDP_CFG3		(0x00000114)
 
 #define UPDATE_SDP				(0x00000001)
 
@@ -281,6 +292,9 @@
 #define MMSS_DP_GENERIC1_9			(0x0000034C)
 
 #define MMSS_DP1_GENERIC0_0			(0x00000490)
+#define MMSS_DP_MST_LINK_GENERIC0_0		(0x000000BC)
+#define MMSS_DP_MST_LINK_GENERIC0_1		(0x000000C0)
+#define MMSS_DP_MST_LINK_GENERIC0_2		(0x000000C4)
 
 #define MMSS_DP_VSCEXT_0			(0x000002D0)
 #define MMSS_DP_VSCEXT_1			(0x000002D4)

-- 
2.34.1

