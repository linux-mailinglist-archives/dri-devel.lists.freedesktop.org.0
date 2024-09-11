Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C60975C1F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344AE10EAA9;
	Wed, 11 Sep 2024 20:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="nKNl0BsP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864D510E998;
 Wed, 11 Sep 2024 10:08:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3sQuV000751;
 Wed, 11 Sep 2024 10:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:in-reply-to:message-id:references:subject:to; s=
 qcppdkim1; bh=6/Q6te7j6Km/QsRNrSj9MjONRROTvWk1VrWQYtr+ORo=; b=nK
 Nl0BsPsytWWHTlC5ej7DV9iGp3cyRQt/lbFYdv2FyyWpShHr9zGKVfE0NPFRa7oD
 4xMSSvwkgfmIh/TS6h5fDSF32vGn56U+ct6keUGGaCTE8qk8m/AqSx7ON1KcKFXc
 Vo8vk3CPD3uTxD7ZkjzT7uMjdSpfWSnSXOULOYA50sSPJ5hkpvoDlxdjFNoFb4C2
 RUZurI/7N/boCX4mhr9FlI/1LNAkQk4vFhDq4ggvY7rDsaeiJg/FYeO9WL9GtnrA
 cr/nqZ2wgsrJocBADnpQdvkwOD5AxmW4Kun34f9LKxqRR5yMDBMCP8i9NVAyOaSk
 ku/ynePhZAlnoSWHIPcg==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5192cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2024 10:08:25 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48BA8MEh019469; 
 Wed, 11 Sep 2024 10:08:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168s1t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 11 Sep 2024 10:08:22 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48BA8M71019462;
 Wed, 11 Sep 2024 10:08:22 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com
 [10.147.244.250])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48BA8Lwx019459;
 Wed, 11 Sep 2024 10:08:22 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
 id 9F84D5001BA; Wed, 11 Sep 2024 15:38:18 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org,
 andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org,
 abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_khsieh@quicinc.com, konrad.dybcio@linaro.org,
 quic_parellan@quicinc.com, quic_bjorande@quicinc.com
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: [PATCH 5/5] drm/msm/dp: Add DisplayPort controller for SA8775P
Date: Wed, 11 Sep 2024 15:38:13 +0530
Message-Id: <20240911100813.338-6-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240911100813.338-1-quic_mukhopad@quicinc.com>
References: <20240911100813.338-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: YaH-zEEbXzYwnlmem4qpwpvbxvwYY80F
X-Proofpoint-GUID: YaH-zEEbXzYwnlmem4qpwpvbxvwYY80F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110075
X-Mailman-Approved-At: Wed, 11 Sep 2024 20:58:09 +0000
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

The Qualcomm SA8775P platform comes with a DisplayPort controller
with a different base offset than the previous SoCs,
add support for this in the DisplayPort driver.

Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e1228fb093ee..e4954fd99eb0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -118,6 +118,12 @@ struct msm_dp_desc {
 	bool wide_bus_supported;
 };
 
+static const struct msm_dp_desc sa8775p_dp_descs[] = {
+	{ .io_start = 0xaf54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
+	{ .io_start = 0xaf5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{}
+};
+
 static const struct msm_dp_desc sc7180_dp_descs[] = {
 	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
 	{}
@@ -162,6 +168,7 @@ static const struct msm_dp_desc x1e80100_dp_descs[] = {
 };
 
 static const struct of_device_id dp_dt_match[] = {
+	{ .compatible = "qcom,sa8775p-dp", .data = &sa8775p_dp_descs },
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
 	{ .compatible = "qcom,sc7280-edp", .data = &sc7280_dp_descs },
-- 
2.17.1

