Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E672F248
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 03:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471EE10E3FB;
	Wed, 14 Jun 2023 01:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB51C10E3FB;
 Wed, 14 Jun 2023 01:57:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35E1VfKX028571; Wed, 14 Jun 2023 01:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=FxN4q8QkuXQA9+ihr4vdcYVvQmloxqXodO9sRtCiP/Q=;
 b=Abz82k1eI+0QG4xxu2w7sicfUyXuAHg9YzTVwDIi7V6g5swpllBSLlW5opPSdVz2Nf7L
 VpdtEtPmeCkTkVth2pUt2OoPmhhgsAfGmkFhpbBiZxHcxRIg30tXk4sYECXc4OBgdE2J
 MR/vXa74ozUUbO7tIiNWXNR+9VabKavA5o9+QJYv6oNWY8/p17FYeg08dEBejEK3fbY1
 QvrERfG1XR0BIbEqksg8m0Ie01ErHC0S3APmPSX4Lzz5tIOmmChDJNhXyw1q0kTviWo0
 Dr0MIZ+5hW3nlRsgtX02XIyp1Mbk7BJ/4xP9X+SRW3n6D9F0mL7RKJuvSN2UmXdPh7xb Hw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r6f7a2q2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 01:57:34 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35E1vXcn002131
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jun 2023 01:57:33 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 13 Jun 2023 18:57:32 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten
 <marijn.suijten@somainline.org>
Subject: [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN feature flag for
 DPU >= 5.0
Date: Tue, 13 Jun 2023 18:57:11 -0700
Message-ID: <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-c6835
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686707625; l=1689;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=iRagepNFxcgqldgaoKxCA+/LlTZz5r2cTXQldmjd+dQ=;
 b=2Sr9stxHFZUtYWy8LoQKZ4AWf1sMgk25MNnyre2yHS2T2zqINpYJy4FDVAjIwWeOBcp+wvesJ
 hThXXk/dyYODjcnx9KEfiB2LKKsa6fxHsPno1qz8OJ2I5Pse9H/JIHn
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: bEVnjnNvsl4oZABEfDyN_hRAPUDP6uHM
X-Proofpoint-ORIG-GUID: bEVnjnNvsl4oZABEfDyN_hRAPUDP6uHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_24,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=845 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140012
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
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DPU 5.x+ supports a databus widen mode that allows more data to be sent
per pclk. Enable this feature flag on all relevant chipsets.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 36ba3f58dcdf..0be7bf0bfc41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -103,7 +103,8 @@
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
-	 BIT(DPU_DATA_HCTL_EN))
+	 BIT(DPU_DATA_HCTL_EN) | \
+	 BIT(DPU_INTF_DATABUS_WIDEN))
 
 #define INTF_SC7280_MASK (INTF_SC7180_MASK | BIT(DPU_INTF_DATA_COMPRESS))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b860784ade72..b9939e00f5e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -182,6 +182,7 @@ enum {
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
  * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
+ * @DPU_INTF_DATABUS_WIDEN          INTF block has DATABUS_WIDEN register
  * @DPU_INTF_MAX
  */
 enum {
@@ -190,6 +191,7 @@ enum {
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_DATA_COMPRESS,
+	DPU_INTF_DATABUS_WIDEN,
 	DPU_INTF_MAX
 };
 

-- 
2.40.1

