Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A225E579E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 02:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BD610E349;
	Thu, 22 Sep 2022 00:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A7310E349;
 Thu, 22 Sep 2022 00:49:46 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28M0Airo028107;
 Thu, 22 Sep 2022 00:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=PN/7ta7F0HtVzQdU2+3zrO7RHO+VpPR/M3VIY/oy9ao=;
 b=K6Ahwmmqtc8TRP1mqLHHdB0xfox+q1jLIins0ItK/YZkYoiwXO2SkgGchbbp69fJAANN
 bUya6uOFQM1XcOZZLAE/XqgRowbSqwSNPTy3A7kyyC8YsKc25xlJLsNY0RvD6wzmmWSL
 AnwHZL96zAy+G5qpHFaoSoR3OH8ExwpR6hCzlfSj/pnjAQ8hhbaeEzFDTsGvcfyaYxiX
 MKbeFwXTucL1H+BUdCMHwP5pMFEDxXxJof7x/EjvCTsB1YvXkDua9gJ0ivsgmGSsDy22
 rbTD7zGAtEotbvvJ6QOd3m0JNy/7dpwA1jwENSum1UdIaNBforFbbdWD7Q0Vgup3wX9m sQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jr8y1rmhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 00:49:44 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28M0nh69024373
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Sep 2022 00:49:43 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 21 Sep 2022 17:49:42 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/msm/dsi: add a helper method to compute the dsi byte
 clk
Date: Wed, 21 Sep 2022 17:49:27 -0700
Message-ID: <1663807768-23969-1-git-send-email-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2zH1txjgMyAsYE0VyOoFDUfc-tcW1Whf
X-Proofpoint-GUID: 2zH1txjgMyAsYE0VyOoFDUfc-tcW1Whf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_13,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209220002
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
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re-arrange the dsi_calc_pclk method to two helpers, one to
compute the DSI byte clk and the other to compute the pclk.

This makes the separation of the two clean and also allows
clients to compute and use the dsi byte clk separately.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 27 +++++++++++++++++++--------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 2a96b4fe7839..60ba8e67f550 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -118,6 +118,8 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
 void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
 void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
+unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_dsi,
+		const struct drm_display_mode *mode);
 int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
 int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
 void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 57a4c0fa614b..32b35d4ac1d3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -569,9 +569,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
-static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
 {
-	struct drm_display_mode *mode = msm_host->mode;
 	unsigned long pclk_rate;
 
 	pclk_rate = mode->clock * 1000;
@@ -588,12 +587,18 @@ static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bo
 	return pclk_rate;
 }
 
-static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_dsi,
+		const struct drm_display_mode *mode)
 {
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
-	u64 pclk_bpp = (u64)pclk_rate * bpp;
+	unsigned long pclk_rate;
+	u64 pclk_bpp;
+
+	pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
+
+	pclk_bpp = (u64)pclk_rate * bpp;
 
 	if (lanes == 0) {
 		pr_err("%s: forcing mdss_dsi lanes to 1\n", __func__);
@@ -606,8 +611,14 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 	else
 		do_div(pclk_bpp, (8 * lanes));
 
-	msm_host->pixel_clk_rate = pclk_rate;
-	msm_host->byte_clk_rate = pclk_bpp;
+	return pclk_bpp;
+}
+
+static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+{
+	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
+	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
+			msm_host->mode);
 
 	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
 				msm_host->byte_clk_rate);
@@ -635,7 +646,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
-- 
2.7.4

