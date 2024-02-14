Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746F385515D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 19:04:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04210E982;
	Wed, 14 Feb 2024 18:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="MUqlcaLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F6410E7E6;
 Wed, 14 Feb 2024 18:04:07 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41ECldDc016471; Wed, 14 Feb 2024 18:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=s7GKlOVkfJsJdGPJFzGXijumOoNZH8brsun2KM72eVI=; b=MU
 qlcaLhIUtv3QRrpANqP0sL2b4MfSBZD15SaVSS5QWduyHZIjs94jz06DI/9tfGsd
 OyPy+/WlHYLEnzCcmlrQgdFgt4P59gTr2jeglW417EoCvK2Hf2ghlCr7OQrMzGAp
 QPPcZGyq+D9hhQkhEXXMzirKC4iFUgs/7GGPoxKHh+ietfFQopU6USQAyZOGXxGi
 MtGXr+B1yEmOS4GpnASeR6X3Gv7WPxV5rjyHRd1r3qKfounZXL6W03xibkQ2z5MG
 ZoaKzNmI+yZWn8P+59gjyr1ccRDe6CxtmogUdnPaWL8m5M5aMlwCzlR9VADfaHzj
 aBFDSqa2HhIE/iD5l4Ig==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8myg1s4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI43Yn009230
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Feb 2024 18:04:03 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:03 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 01/19] drm/msm/dpu: allow certain formats for CDM for DP
Date: Wed, 14 Feb 2024 10:03:23 -0800
Message-ID: <20240214180347.1399-2-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mqVcT3kK_wpYF0emRrVuLaQhmE8R0vHb
X-Proofpoint-ORIG-GUID: mqVcT3kK_wpYF0emRrVuLaQhmE8R0vHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxlogscore=471 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402140141
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

CDM block supports formats other than H1V2 for DP. Since we are now
adding support for CDM over DP, relax the checks to allow all other
formats for DP other than H1V2.

Changes in v2:
	- Add fixes tag
	- Move patch to top of series

Fixes: 0afac0ba6024 ("drm/msm/dpu: add dpu_hw_cdm abstraction for CDM block")
Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
index e9cdc7934a499..9016b3ade6bc3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.c
@@ -186,7 +186,7 @@ static int dpu_hw_cdm_enable(struct dpu_hw_cdm *ctx, struct dpu_hw_cdm_cfg *cdm)
 	dpu_hw_cdm_setup_cdwn(ctx, cdm);
 
 	if (cdm->output_type == CDM_CDWN_OUTPUT_HDMI) {
-		if (fmt->chroma_sample != DPU_CHROMA_H1V2)
+		if (fmt->chroma_sample == DPU_CHROMA_H1V2)
 			return -EINVAL; /*unsupported format */
 		opmode = CDM_HDMI_PACK_OP_MODE_EN;
 		opmode |= (fmt->chroma_sample << 1);
-- 
2.39.2

