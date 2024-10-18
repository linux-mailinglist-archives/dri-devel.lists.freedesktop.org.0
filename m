Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245D9A3681
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 09:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46E210E8B4;
	Fri, 18 Oct 2024 07:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ZYBihv6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4910E8A4;
 Fri, 18 Oct 2024 07:07:20 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I6cb7l007916;
 Fri, 18 Oct 2024 07:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:message-id:subject:to; s=qcppdkim1; bh=4gI2EaAR2RP1
 cbYenY42QEdfO3dYkKKBNu6etmqE1BM=; b=ZYBihv6x1V6uuIuNpGPEHfwGMbAm
 NLW2B0JWL4rkIwKYHy/vsNVvmME8R0SXItcNCklxkriZSYAwfMTc/rkrndavk4WQ
 hMsgKrJSqlnJC6MuJUY/lvl+rE1USJ3fuUoIfE3Te32qHkq2EUuxlBmMLuXbu3Hn
 K6DBYLRkUe5HDKt4sTpqRTCfzrHtn0wIlvzlrPlzsuDtYxy5xdG7Kq+a1TMV6DQJ
 MfF490ITVRIrhIgwQGKOZryAvPWIIfWJdU8cSLPfSgJTR6F+5HJczMjVfaSUDR41
 gyfuFhuEahE4RWbMmNjrp/xA7n3eD3hXjPlcD/G8PgTgH/VLkaNhGuWKbw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42b5hst4kf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Oct 2024 07:07:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49I779eF019792; 
 Fri, 18 Oct 2024 07:07:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 427j6mpjap-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 18 Oct 2024 07:07:09 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49I779Xa019763;
 Fri, 18 Oct 2024 07:07:09 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com
 [10.147.244.250])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49I778sX019760;
 Fri, 18 Oct 2024 07:07:09 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
 id E3BD05001B8; Fri, 18 Oct 2024 12:37:07 +0530 (+0530)
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
Subject: [PATCH v5 0/5] Add support for DisplayPort on SA8775P platform
Date: Fri, 18 Oct 2024 12:37:01 +0530
Message-Id: <20241018070706.28980-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ODZhLeN98i8_m4voZ9EuYP7Bf_w0Z9Yq
X-Proofpoint-ORIG-GUID: ODZhLeN98i8_m4voZ9EuYP7Bf_w0Z9Yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180043
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

This series adds support for the DisplayPort controller
and eDP PHY v5 found on the Qualcomm SA8775P platform.

---
v2: Fixed review comments from Dmitry and Bjorn
	- Made aux_cfg array as const.
	- Reused edp_swing_hbr_rbr and edp_swing_hbr2_hbr3 for v5.

v3: Fixed review comments from Dmitry, Konrad and Bjorn
	- Used a for loop to write the dp_phy_aux_cfg registers.
	- Pre-defined the aux_cfg size to prevent any magic numbers.
	- Added all the necessary DPTX controllers for this platform.

v4: Fixed review comments from Dmitry and Krzysztof
	- Removed the "reviewed by" and kept only the "acked by" for 
	  patch 1.
	- Updated the commit message of patch 5 to mention specifically
	  about the validation of "only" MDSS0 DPTX0 and DPTX1.

v5: Fixed review comment from Dmitry in patch 5
	- Aligned the register starting address for display port as part 
	  of device description with respect to other targets.

Below patches are applied:

[1/5] dt-bindings: phy: Add eDP PHY compatible for sa8775p
      commit: 7adb3d221a4d6a4f5e0793c3bd35f1168934035c
[2/5] phy: qcom: edp: Introduce aux_cfg array for version specific aux settings
      commit: 913463587d528d766a8e12c7790995e273ec84fb
[3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
      commit: 3f12bf16213c30d8e645027efd94a19c13ee0253

---

Soutrik Mukhopadhyay (5):
  dt-bindings: phy: Add eDP PHY compatible for sa8775p
  phy: qcom: edp: Introduce aux_cfg array for version specific aux
    settings
  phy: qcom: edp: Add support for eDP PHY on SA8775P
  dt-bindings: display: msm: dp-controller: document SA8775P compatible
  drm/msm/dp: Add DisplayPort controller for SA8775P

 .../bindings/display/msm/dp-controller.yaml   |  1 +
 .../devicetree/bindings/phy/qcom,edp-phy.yaml |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c           |  9 +++
 drivers/phy/qualcomm/phy-qcom-edp.c           | 74 +++++++++++++------
 4 files changed, 61 insertions(+), 24 deletions(-)

-- 
2.17.1

