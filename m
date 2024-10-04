Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96829990144
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 12:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0D010E2A0;
	Fri,  4 Oct 2024 10:31:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pk7iSuk1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3845810E286;
 Fri,  4 Oct 2024 10:31:01 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493I0Pqq031312;
 Fri, 4 Oct 2024 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:message-id:subject:to; s=qcppdkim1; bh=bxrxFrtH6bW0
 HeKMnp9MknT77pwNQoSsvbOCnN7b2eo=; b=pk7iSuk1VoyuRuAZT0nz8DOzyV7v
 os13dCfdaB7DAiuLH7O5PsxOnVQEjAl7Q8rPvtIH7J/6oiQo3NEI6JmUu23QNTe/
 hBYTFi+9LJEXZ5BqgArDC55oNTYH9X/rBeLt3mPH7xrx/PoN3V/H3lEixLzUhpXE
 +VhOtEgnXS3KGX6bHu2Gq5h/PD5GkHM96wcVlNqeR1FM61GO3Fq4E6+Y1uq9eXhR
 1TlkUyVllBK2yDi6hj59d6R0/Rc4qwDOvtA3L6+s1DSc2sWZGbq7rWXkMVDgFWSU
 Scgh+TzM8CZOyxgxiiwg02qAsbMF0pVBZOuHzngz5Nnkx2IVAf9/G8NwgA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205nhs2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Oct 2024 10:30:55 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 494AUoRn005781; 
 Fri, 4 Oct 2024 10:30:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41xavmrk0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 04 Oct 2024 10:30:50 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 494AUnSP005750;
 Fri, 4 Oct 2024 10:30:49 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com
 [10.147.244.250])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 494AUnxR005743;
 Fri, 04 Oct 2024 10:30:49 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
 id BA8B25000AB; Fri,  4 Oct 2024 16:00:48 +0530 (+0530)
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
Subject: [PATCH v4 0/5] Add support for DisplayPort on SA8775P platform
Date: Fri,  4 Oct 2024 16:00:41 +0530
Message-Id: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KS5tIy_fXol3w3iNe_CgQ_wJdmLVRWO4
X-Proofpoint-ORIG-GUID: KS5tIy_fXol3w3iNe_CgQ_wJdmLVRWO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410040076
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
	- Updated commit message.
	 
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

