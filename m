Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122E3666677
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3161210E82C;
	Wed, 11 Jan 2023 22:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2485A10E825;
 Wed, 11 Jan 2023 22:53:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30BMdn1l031144; Wed, 11 Jan 2023 22:53:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=JN/B4N8cmVkipSfz8rN0Pwrrp0Q6iMXwc2+8rg/bci4=;
 b=mPnxofi/+u8Aex19vx6CO216zYYUaXOpCgWilldRSpF+eiXUOuo21Lwozs1oRjLKoGKB
 te73Z+nK+34dKarXNA8A1LKI/BE5X04zM20e2TkvZm2KtOUsp5krQElUym2YqsqmVa1m
 DQJZftEkeS6zztiSxPyzfCsb9Vq5RXykkf46GFhs12Oz8d2pyXC7eRyK7dXz2RkyCE6y
 aUTR9INRlTUIMJrNIbTWey+MCkSoAkj4EP4xSU/QPIwm6go0f9gx8VDRbHQmPFXuinDL
 qLfZjkiCBw8ETvMkv1DN8Vw/jmYgY95A/eQ5hSlium6eblfmbXW9QjZ26O9yY68omdgh qw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n1k9j2ek0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 22:53:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30BMrB1u010104
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Jan 2023 22:53:11 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 11 Jan 2023 14:53:11 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/msm/dsi: add a helper method to compute the dsi
 byte clk
Date: Wed, 11 Jan 2023 14:52:56 -0800
Message-ID: <20230111225257.7510-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4Sg1YDHHs0CnYRZKYcUZqYpM02TYvLCY
X-Proofpoint-ORIG-GUID: 4Sg1YDHHs0CnYRZKYcUZqYpM02TYvLCY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-11_10,2023-01-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301110167
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
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Re-arrange the dsi_calc_pclk method to two helpers, one to
compute the DSI byte clk and the other to compute the pclk.

This makes the separation of the two clean and also allows
clients to compute and use the dsi byte clk separately.

changes in v2:
	- move the assignments to definition lines

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.h      |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 2a96b4fe7839..1a551cc0e889 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -118,6 +118,8 @@ int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host);
 int dsi_link_clk_enable_v2(struct msm_dsi_host *msm_host);
 void dsi_link_clk_disable_6g(struct msm_dsi_host *msm_host);
 void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host);
+unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_dsi,
+				    const struct drm_display_mode *mode);
 int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size);
 int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
 void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index c3cd96de7f7d..c145fd359ed5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -570,9 +570,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
-static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
 {
-	struct drm_display_mode *mode = msm_host->mode;
 	unsigned long pclk_rate;
 
 	pclk_rate = mode->clock * 1000;
@@ -589,11 +588,13 @@ static unsigned long dsi_get_pclk_rate(struct msm_dsi_host *msm_host, bool is_bo
 	return pclk_rate;
 }
 
-static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_dsi,
+				    const struct drm_display_mode *mode)
 {
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	unsigned long pclk_rate = dsi_get_pclk_rate(msm_host, is_bonded_dsi);
+	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
 	u64 pclk_bpp = (u64)pclk_rate * bpp;
 
 	if (lanes == 0) {
@@ -607,8 +608,14 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
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
+							msm_host->mode);
 
 	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
 				msm_host->byte_clk_rate);
@@ -636,7 +643,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 
-- 
2.39.0

