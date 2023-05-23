Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C9970D04C
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 03:15:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0010E02F;
	Tue, 23 May 2023 01:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F4410E02F;
 Tue, 23 May 2023 01:15:32 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34N0VfJa025455; Tue, 23 May 2023 01:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=NJsnDXG7NP3VGxheSNXVdJdP+EBMt4Bc6FXxE1MXp08=;
 b=OYEQ++LrCbetZqIEfkVzbNaa1vfx8WoNVSlCkWR1B0TLcCApsFa4HVuvxqfXksr6Vylv
 TQGAy2ImXwyP83rw0H4IoMP/JT6o8krMlT7FnY/XWO+uu09JmYNaYwKX8m2wd8y02doI
 M/fMMc7G8lMXWmq5HRHDVbW0Xqm6kwFYhHcrR3Qvhl5Xcwp3esdCZb7S+YEmNtu3xdRL
 oWBhfMmHXUy8i8pQA2Rc9UemGGhMWn5EoG5d0vhVFaPdSIBcs0XPNd7jTQzWx7Ajast8
 +YcjLpgZfoxva6xniLchIRtjYHkxTfafq9dpnRGEYbMczeLFqH9ikUTWkAOarPTEpo3Q Lg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qr53w9tec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:15:28 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34N1FRpq006804
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 May 2023 01:15:27 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 22 May 2023 18:15:27 -0700
From: Bjorn Andersson <quic_bjorande@quicinc.com>
To: 
Subject: [PATCH v2 0/3] drm/msm/adreno: GPU support on SC8280XP
Date: Mon, 22 May 2023 18:15:19 -0700
Message-ID: <20230523011522.65351-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: rcbLYq7Q68gYXqClC25bKcpds3uNCBW9
X-Proofpoint-ORIG-GUID: rcbLYq7Q68gYXqClC25bKcpds3uNCBW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-22_18,2023-05-22_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=719
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305230008
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, johan@kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces support for A690 in the DRM/MSM driver and
enables it for the two SC8280XP laptops.

Bjorn Andersson (3):
  drm/msm/adreno: Add Adreno A690 support
  arm64: dts: qcom: sc8280xp: Add GPU related nodes
  arm64: dts: qcom: sc8280xp: Enable GPU related nodes

 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  26 +++
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  26 +++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 169 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 113 +++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c         |  33 ++++
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  14 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  11 +-
 7 files changed, 387 insertions(+), 5 deletions(-)

-- 
2.39.2

