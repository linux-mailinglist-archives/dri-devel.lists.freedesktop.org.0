Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03BB70D024
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 03:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A4110E3B4;
	Tue, 23 May 2023 01:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1A310E2E7;
 Tue, 23 May 2023 01:09:29 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N0TexM016764; Tue, 23 May 2023 01:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=XUZc7JQnN6RD/SnLLsDhKlL79isjK/uJbf01n5mM2us=;
 b=jQHr8xpjb89kfCVg++hCuXyD710CzLIrJWCNmdMnXu80IwR+aT2JAnaHsdRLbEhQPGPt
 YPupOLD5uI2Mr1C620tpkx7QJ8lL0q96Tmhn+bX1XznP3z2H/v2AcBtQ7Wonnre6dv3t
 +6uHlcsDmVovNOrGM0diNrNAjgwrPhsVTw3ii5P/+GgQonTTBlJ1uRkeI9+Hp6+vkiDh
 Gqs5K1Mwfm+lY3AbxSBNLN5yQiUa6RQtkuMkh1IZktB1W+t7vmaCze9naHUGgOrGA3a/
 7BSS1IWBI8G8LK8gE/IgZm8KkXDuI5IbIkOJYYrxKObwWTrrClFUsmfbltc3Wg6lF3Z+ Rg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qracsh3e3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:09:27 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34N1955S017271
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:09:05 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 18:09:05 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 22 May 2023 18:08:56 -0700
Subject: [PATCH v5 2/5] drm/msm/dsi: Adjust pclk rate for compression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v5-2-028c10850491@quicinc.com>
References: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v5-0-028c10850491@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684804144; l=2483;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=+PWGCHnOt8xcrwyI8eYbnXtnqUPskqBr3FdtKgrONa0=;
 b=khMn54VJkCmSEcvPmRojkauTVfTyFYz9LGUn2uSvOIO8YjaVQKMvJhbpzbV0TrCDzNNM3hZ2s
 feWJJUlABjsB5O+C41lMukVmSHa4WJH42qWy5Agzxr+/lsoAMkUMkjl
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2IrhBYXKm6SV4D2xbnRCUOtgG_l3q16C
X-Proofpoint-ORIG-GUID: 2IrhBYXKm6SV4D2xbnRCUOtgG_l3q16C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 mlxscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230007
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adjust the pclk rate to divide hdisplay by the compression ratio when DSC
is enabled.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a448931af804..88f370dd2ea1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -561,7 +561,18 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
-static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
+static unsigned long dsi_adjust_compressed_pclk(const struct drm_display_mode *mode,
+		const struct drm_dsc_config *dsc)
+{
+	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
+			dsc->bits_per_component * 3);
+
+	return (new_hdisplay + (mode->htotal - mode->hdisplay))
+			* mode->vtotal * drm_mode_vrefresh(mode);
+}
+
+static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
+		const struct drm_dsc_config *dsc, bool is_bonded_dsi)
 {
 	unsigned long pclk_rate;
 
@@ -576,6 +587,10 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
 	if (is_bonded_dsi)
 		pclk_rate /= 2;
 
+	/* If DSC is enabled, divide hdisplay by compression ratio */
+	if (dsc)
+		pclk_rate = dsi_adjust_compressed_pclk(mode, dsc);
+
 	return pclk_rate;
 }
 
@@ -585,7 +600,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
+	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
 	unsigned long pclk_bpp;
 
 	if (lanes == 0) {
@@ -604,7 +619,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 
 static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
-	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
+	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
 	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
 							msm_host->mode);
 

-- 
2.40.1

