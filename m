Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A352850209
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 02:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB36D1120EB;
	Sat, 10 Feb 2024 01:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Smc+nguN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1D610F83A;
 Sat, 10 Feb 2024 01:52:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41A1m0H0024174; Sat, 10 Feb 2024 01:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 qcppdkim1; bh=2ZrslyT/MmvhB3mFLrLBWr8zzoqK0YatDu4hnEu8ydk=; b=Sm
 c+nguNzrs8aIgyzcudwJVq01LM+05SHNNOAj65X6GMeOvuvU2Ltw23ir2ISO6TBz
 F0+MSlOGDD6v9JBx4uDjDD+2tNkmX/4aYUUNwXOVq5hxnbUSgIie+Urdvr9eqYkg
 mfVOjyPMwJEh6YchZN3ZNaRHpL/Jq1mSU1ANBOOuTqmnM4pbJVA4sZUliHbXpCdD
 LgW6q9+9I9xP6gicJxdG2BKy0WUGLXI+rCJKcDa8Pbx7UIzrysrLn6GajSYXpyX1
 D9R3WWmwSb64fzZMcjSJP6a5CEWS0QwbKHcqXnOvk3wqXzyQCVBHlGKGC1Y6yrNt
 Csi4FaTNtjJS8U9QbVJA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w5gk2hxhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41A1qcDF027998
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Feb 2024 01:52:38 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 9 Feb 2024 17:52:38 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
 <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
 <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
 <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v2 03/19] drm/msm/dpu: pass mode dimensions instead of fb size
 in CDM setup
Date: Fri, 9 Feb 2024 17:51:54 -0800
Message-ID: <20240210015223.24670-4-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240210015223.24670-1-quic_parellan@quicinc.com>
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: rTlsK2Snwh64liixHhApD_E9INVfcyhu
X-Proofpoint-GUID: rTlsK2Snwh64liixHhApD_E9INVfcyhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-10_01,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401310000
 definitions=main-2402100012
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

Modify the output width and height parameters of hw_cdm to utilize the
physical encoder's data instead of obtaining the information from the
framebuffer. CDM is to be set up to utilize the actual output data since
at CDM setup, there is no difference between the two sources.

Changes in v2:
	- Move the modification of the dimensions for CDM setup to this
	  new patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4cd2d9e3131a4..ec9e053d3947d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -306,8 +306,8 @@ static void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc)
 
 	memset(cdm_cfg, 0, sizeof(struct dpu_hw_cdm_cfg));
 
-	cdm_cfg->output_width = wb_job->fb->width;
-	cdm_cfg->output_height = wb_job->fb->height;
+	cdm_cfg->output_width = phys_enc->cached_mode.hdisplay;
+	cdm_cfg->output_height = phys_enc->cached_mode.vdisplay;
 	cdm_cfg->output_fmt = dpu_fmt;
 	cdm_cfg->output_type = CDM_CDWN_OUTPUT_WB;
 	cdm_cfg->output_bit_depth = DPU_FORMAT_IS_DX(dpu_fmt) ?
-- 
2.39.2

