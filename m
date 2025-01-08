Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E83A0664C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 21:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807C10E5CF;
	Wed,  8 Jan 2025 20:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Nq43vne/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC7710E5CF;
 Wed,  8 Jan 2025 20:40:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508HbqhR011371;
 Wed, 8 Jan 2025 20:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wADXqIrY+qPwTvqLv5shbT7qMpXxzjIzS8x2sIAn57A=; b=Nq43vne/VLV0FvNm
 SCUkHxh6SlfSj5dPdDLUxCt/1j7ETjlRIDaa7NC3QFm3L11Ht7ZIHoUM+bJ3NGQf
 ZQJsZYSmgtIyEqvdFTiZyiTPDIHNnuGLzoaywHZtfsSCHNwMNPirjPlrw5wjah+t
 fETAGn3/UHgnqQSYXNT2DTx3tiUw9nliMJhlA15BdkVOHXr2fGFAexzrnmXQKFhX
 TL6dPE7oCdQEJ7wua2+PBxFsWLMAhL902a2apE7YvZ3plj9H0HATVTIEU9paHzOl
 S/XtKBGmhJuZpRH99TcEE/8izUK5j3ucStCPrwH9GSjvWwuQ97LMBb9TjHrsie3t
 2eJQ5w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441wx60dw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 20:40:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508KedY8027015
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 8 Jan 2025 20:40:39 GMT
Received: from [10.213.111.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 12:40:33 -0800
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Date: Thu, 9 Jan 2025 02:09:58 +0530
Subject: [PATCH v4 2/7] drm/msm/a6xx: Increase HFI response timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-gpu-acd-v4-2-08a5efaf4a23@quicinc.com>
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
In-Reply-To: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
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
 <andersson@kernel.org>, Maya Matuszczyk <maccraft123mc@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736368821; l=1345;
 i=quic_akhilpo@quicinc.com; s=20240726; h=from:subject:message-id;
 bh=5ytAEPpk+peT5jTuxMqYIAb/yYLt5D+AFkmAX3LLTf4=;
 b=/5QY9TjFLZqW9f8LBK7QibCaUsdVTtq05I1XVM7UX44QB1jlDUZ5Y1qUqEERi70cgaEEIyP6p
 RoBLJumSb+gAGcZBftgNPIRgWr5zI31liwgW95kLiko9/mxaB5+5ONz
X-Developer-Key: i=quic_akhilpo@quicinc.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: LZ_psyO6nuU7RMn3T_RKWLeAU2kEEwjt
X-Proofpoint-ORIG-GUID: LZ_psyO6nuU7RMn3T_RKWLeAU2kEEwjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501080168
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

When ACD feature is enabled, it triggers some internal calibrations
which result in a pretty long delay during the first HFI perf vote.
So, increase the HFI response timeout to match the downstream driver.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 3c183c1c6266..7d04b242363c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 
 	/* Wait for a response */
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
+		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
 
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev,
@@ -725,7 +725,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 	}
 
 	/* Send ACD table to GMU */
-	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg), NULL, 0);
+	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, acd_table, sizeof(*acd_table), NULL, 0);
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret);
 		return ret;

-- 
2.45.2

