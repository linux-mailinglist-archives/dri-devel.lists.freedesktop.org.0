Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F29FEAE0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 22:11:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B653410E591;
	Mon, 30 Dec 2024 21:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="l/cAwYbW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DEA10E590;
 Mon, 30 Dec 2024 21:11:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BUJr0qb020786;
 Mon, 30 Dec 2024 21:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s0wRUiY8vAjGesEaJhQA+W2SjHVAeRkNYjaOj1bFXzo=; b=l/cAwYbWyCSiKk+X
 Jl69qogN3ahCVMfAuuVBeupmUlLRvlSMpUM1THubSD0qqBEvU7WpQtMXkfz0WUS/
 r21qrjvqfnpRrs+0wH0800eLIjyegtD/EXBviqjjVXM/khMLzJp0sloIXljzp2jp
 fk5tPMJPz1rEOUDyYkA7vQXYy52wMmJyEWUePUPI4N1uJoeWFBlM+IFf/4n3HqjP
 fDf1QA1tsI887tjt0IeQS+RHkjUrXFgdK3ximat6y36V4gIgKVk1PG5GwfQ3yyI5
 pjPLjYYzG3KKijpkUnl0uRb8l6Hj3L9kdkodHw+fhQhgNEo9l/wlqZlJmIcpvh/l
 0eHzVg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43v22g837w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BULBe8L031272
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Dec 2024 21:11:40 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Dec
 2024 13:11:34 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Tue, 31 Dec 2024 02:41:04 +0530
Subject: [PATCH v3 3/6] drm/msm/adreno: Add module param to disable ACD
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241231-gpu-acd-v3-3-3ba73660e9ca@quicinc.com>
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
In-Reply-To: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735593076; l=1711;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=lpNlkaAqDtGPqRgiubmBGv2n/ovMOYsokcd/+h9OBho=;
 b=sOr2aJQWROaa3nLhC2l8DCdK1I/G7GXbiFaNYHE9t2BHsXj7tFTfFGtnTCNoTe/sWQx441QnK
 8AIHtoMP5EBAZcUrorNfbs3sxWdFvWy4EQXB0kJ7rHn2pMditbgNkGB
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NAYz6TGJw9tR8m-H8f51kBm4sLQ-TZlp
X-Proofpoint-ORIG-GUID: NAYz6TGJw9tR8m-H8f51kBm4sLQ-TZlp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412300182
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

Add a module param to disable ACD which will help to quickly rule it
out for any GPU issues.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 7 +++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 1f213a0fc61b..ce08eed572c8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1475,6 +1475,13 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	int ret, i, cmd_idx = 0;
+	extern bool disable_acd;
+
+	/* Skip ACD probe if requested via module param */
+	if (disable_acd) {
+		DRM_DEV_ERROR(gmu->dev, "Skipping GPU ACD probe\n");
+		return 0;
+	}
 
 	cmd->version = 1;
 	cmd->stride = 1;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 236b25c094cd..f4552b8c6767 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -24,6 +24,10 @@ int enable_preemption = -1;
 MODULE_PARM_DESC(enable_preemption, "Enable preemption (A7xx only) (1=on , 0=disable, -1=auto (default))");
 module_param(enable_preemption, int, 0600);
 
+bool disable_acd;
+MODULE_PARM_DESC(disable_acd, "Forcefully disable GPU ACD");
+module_param_unsafe(disable_acd, bool, 0600);
+
 extern const struct adreno_gpulist a2xx_gpulist;
 extern const struct adreno_gpulist a3xx_gpulist;
 extern const struct adreno_gpulist a4xx_gpulist;

-- 
2.45.2

