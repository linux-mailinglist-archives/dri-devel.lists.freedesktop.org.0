Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B16F8AC3
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 23:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD5B10E67F;
	Fri,  5 May 2023 21:24:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8692410E0DE;
 Fri,  5 May 2023 21:24:07 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 345Jvmgf009940; Fri, 5 May 2023 21:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=NNgxuTByx6ume4kdD6nXKqWOnG0hiha6GhDtLcO0Rcg=;
 b=hLVahI2ZdJ3TXswyhloVdwK4TMHfEYX84EboQKkIyOTI+m/0lSxWWPOwZyVU3CqqJd05
 2jHltdqtZMw+q12dOcqGiVndRp/fK/QttaceF+ZzgWs2du6268FFM/gE0ptIhLidS6nQ
 ICxhQ+hwhITydJISUCTSJlilkMHsKNJyccuWvhbkdUJqAxZTQWviF5SZrBpMM28pJZ3w
 g5+lUQIF7FJyp2fodsv14YORN/qHA0h7fMz+cjIWohdKp3Db6hNf0MQEQq2PXwJOTnfF
 0HPNeUN5vkM1dPsHtbYsJZMz2vsP/986L01UH/e06oLuzsCdkyTz6Zk8z1nOE7dS3MWm ZA== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qckf72qts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 May 2023 21:24:04 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 345LO3jg004028
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 5 May 2023 21:24:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Fri, 5 May 2023 14:24:03 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Fri, 5 May 2023 14:23:48 -0700
Subject: [PATCH v2 1/4] drm/msm/dsi: Adjust pclk rate for compression
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230405-add-dsc-support-v2-1-1072c70e9786@quicinc.com>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
In-Reply-To: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683321843; l=2828;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=6n1T0L02ntmxE0+q2uWO5/DF/EkRCHj6r3frjVC2bss=;
 b=Bt1jmzQ16O2P1SrQWe4cARrdUa4KWBYBdCVkDsycyRPTseHF6hXmT1cdc+tejphR+r8L1Tt6B
 NvTKbj34AnPBqT3phrgorguxVu96pV3SnHCuiEcOsb9+2QxAc7wKbes
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 4tRVdtU4hSjpjd_Gb7YAn7VDF02ypx5u
X-Proofpoint-ORIG-GUID: 4tRVdtU4hSjpjd_Gb7YAn7VDF02ypx5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-05_27,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050173
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

Changes in v2:
- Adjusted pclk_rate math to divide only the hdisplay value by
  compression ratio

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 43a5ec33eee8..0e5778e8091f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -561,7 +561,8 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
 	clk_disable_unprepare(msm_host->byte_clk);
 }
 
-static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool is_bonded_dsi)
+static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode,
+		struct drm_dsc_config *dsc, bool is_bonded_dsi)
 {
 	unsigned long pclk_rate;
 
@@ -576,6 +577,14 @@ static unsigned long dsi_get_pclk_rate(const struct drm_display_mode *mode, bool
 	if (is_bonded_dsi)
 		pclk_rate /= 2;
 
+	/* If DSC is enabled, divide hdisplay by compression ratio */
+	if (dsc) {
+		int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * msm_dsc_get_bpp_int(dsc),
+				dsc->bits_per_component * 3);
+		int fps = DIV_ROUND_UP(pclk_rate, mode->htotal * mode->vtotal);
+		pclk_rate = (new_hdisplay + (mode->htotal - mode->hdisplay)) * mode->vtotal * fps;
+	}
+
 	return pclk_rate;
 }
 
@@ -585,7 +594,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	u8 lanes = msm_host->lanes;
 	u32 bpp = dsi_get_bpp(msm_host->format);
-	unsigned long pclk_rate = dsi_get_pclk_rate(mode, is_bonded_dsi);
+	unsigned long pclk_rate = dsi_get_pclk_rate(mode, msm_host->dsc, is_bonded_dsi);
 	u64 pclk_bpp = (u64)pclk_rate * bpp;
 
 	if (lanes == 0) {
@@ -604,7 +613,7 @@ unsigned long dsi_byte_clk_get_rate(struct mipi_dsi_host *host, bool is_bonded_d
 
 static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
-	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi);
+	msm_host->pixel_clk_rate = dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi);
 	msm_host->byte_clk_rate = dsi_byte_clk_get_rate(&msm_host->base, is_bonded_dsi,
 							msm_host->mode);
 
@@ -634,7 +643,7 @@ int dsi_calc_clk_rate_v2(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
 
-	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, is_bonded_dsi) * bpp;
+	pclk_bpp = (u64)dsi_get_pclk_rate(msm_host->mode, msm_host->dsc, is_bonded_dsi) * bpp;
 	do_div(pclk_bpp, 8);
 	msm_host->src_clk_rate = pclk_bpp;
 

-- 
2.40.1

