Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C21067849B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 19:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B128710E533;
	Mon, 23 Jan 2023 18:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D99F10E530;
 Mon, 23 Jan 2023 18:24:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NG2lDv009629; Mon, 23 Jan 2023 18:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=N3olDA1LBSSm/dSW++cUAdhvmNppohlf/LTtX63EUdE=;
 b=i0/zEvmElgGqvX2M4Sgf732ZwULy2Utu9di1qsKSSG8MUyvAo4wvum7Kuyc1R8AyPyqZ
 pSS8gFWYl8/LQCGnlJ2eXvG8f49EXnm+AjXO612pmPK7StD2CgzJE+vhtqeAb07Z1sIR
 KfiZMrqnStGxqY1OJ4Q3yQKBEDWAongSDHyA9yQJpXA+6F8APhXDVeqVMp+2pVpVIuda
 FMq5Vcti4pGBxFcBgrhrJHsMsymL8Wn8leBFCpThMvipmVr/e+18Osimv4KhUEL/5IMV
 irq4ryJMAuyuLan2mZ+UbAEzyBjEK+VDnF74CQzzRbs/yiZ7Wq9xzHtBxvDrbSdqhRKl gQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n89gt3h91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30NIOoYs012288
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 18:24:50 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 23 Jan 2023 10:24:49 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
 <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
 <agross@kernel.org>, <dmitry.baryshkov@linaro.org>, <andersson@kernel.org>
Subject: [PATCH v1 02/14] drm/msm/dp: add dsc factor into calculation of
 supported bpp
Date: Mon, 23 Jan 2023 10:24:22 -0800
Message-ID: <1674498274-6010-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ATIqfrpGjY1s0dZTUFTidqitushnfdWL
X-Proofpoint-ORIG-GUID: ATIqfrpGjY1s0dZTUFTidqitushnfdWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230177
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When FEC enabled, it introduces 2.5% overhead into link capacity.
This factor have to be considered into calculation supported bpp.

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 45 +++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 5078247..36dad05 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -11,7 +11,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
-#define DSC_TGT_BPP 8
+#define DSC_TGT_BPP 10
 
 struct dp_panel_private {
 	struct device *dev;
@@ -122,20 +122,51 @@ static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
 	struct dp_link_info *link_info;
-	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
-	u32 bpp = 0, data_rate_khz = 0;
+	struct dp_panel_private *panel;
+	const u32 max_supported_bpp = 30;
+	u32 min_supported_bpp = 18;
+	u32 bpp = 0, link_bitrate = 0, mode_bitrate;
+	s64 rate_fp = 0;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	if (dp_panel->dsc_en)
+		min_supported_bpp = 24;
 
 	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);
 
 	link_info = &dp_panel->link_info;
-	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
-	while (bpp > min_supported_bpp) {
-		if (mode_pclk_khz * bpp <= data_rate_khz)
+	rate_fp = drm_int2fixp(link_info->num_lanes * link_info->rate * 8);
+
+	if (dp_panel->fec_en)
+		rate_fp = drm_fixp_div(rate_fp, dp_panel->fec_overhead_fp);
+
+	link_bitrate = drm_fixp2int(rate_fp);
+
+	for (; bpp > min_supported_bpp; bpp -= 6) {
+		if (dp_panel->dsc_en) {
+			if (bpp == 30 && !(dp_panel->sink_dsc_caps.color_depth & DP_DSC_10_BPC))
+				continue;
+			else if (bpp == 24 && !(dp_panel->sink_dsc_caps.color_depth & DP_DSC_8_BPC))
+				continue;
+
+			mode_bitrate = mode_pclk_khz * DSC_TGT_BPP;
+		} else {
+			mode_bitrate = mode_pclk_khz * bpp;
+		}
+
+		if (mode_bitrate <= link_bitrate)
 			break;
-		bpp -= 6;
 	}
 
+	if (bpp < min_supported_bpp)
+		DRM_ERROR("bpp %d is below minimum supported bpp %d\n", bpp,
+				min_supported_bpp);
+
+	if (dp_panel->dsc_en && bpp != 24 && bpp != 30 && bpp != 36)
+		DRM_ERROR("bpp %d is not supported when dsc is enabled\n", bpp);
+
 	return bpp;
 }
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

