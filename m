Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1468798722C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 13:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B1E10E17B;
	Thu, 26 Sep 2024 11:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NorRxzaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37FB310E173;
 Thu, 26 Sep 2024 11:02:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48Q7UxEu013240;
 Thu, 26 Sep 2024 11:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=QFlKmRY6ufpuU3OIhekqn0mKR1IMfWPajb9
 clKzK1Sw=; b=NorRxzaUHgMt1PBtyIeSj2fEvKfkb24TyhCgbZpZbbw+hQUHKa/
 +j8Rwh6VZfFOouKHS6ljVEUJPfugJJWxnUWCG5oK3sCcQN8fTOxJ2BP4B8BXNqVj
 i7+pnC7hpY5zosY/mj46hPsbb5yfy3htZMl+3Xa1DdFRO1IE37XlRqo5r95YIkgv
 HMi+pPDDgQNs7dpN6SNTyHRtHIGTmnd7ePxdMsKaUdUr7xwyNohr55YCOmaDoh7M
 Rs2J3A5t+f/rO6w6Ki2gPAZfnGujK8cU6+2yNC35oiBXZfNvrVTsgqv/XD7lYT25
 VkE+FqoBJ70gbsBHgTx9ZqKMxV7z0nZ9W7g==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyq9xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2024 11:02:02 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48QB1x7S024954; 
 Thu, 26 Sep 2024 11:01:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41sq7mg025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2024 11:01:59 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48QB1xYZ024941;
 Thu, 26 Sep 2024 11:01:59 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com
 [10.213.96.84])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48QB1wxp024937
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Sep 2024 11:01:59 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
 id BB1DBAEA; Thu, 26 Sep 2024 16:31:57 +0530 (+0530)
From: Mahadevan <quic_mahap@quicinc.com>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, swboyd@chromium.org, konrad.dybcio@linaro.org,
 danila@jiaxyga.com, bigfoot@classfun.cn, neil.armstrong@linaro.org,
 mailingradian@gmail.com, quic_jesszhan@quicinc.com, andersson@kernel.org
Cc: Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com,
 quic_vpolimer@quicinc.com
Subject: [PATCH v2 0/5] Display enablement changes for Qualcomm SA8775P
 platform
Date: Thu, 26 Sep 2024 16:31:32 +0530
Message-Id: <20240926110137.2200158-1-quic_mahap@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: NH3GmPhXY83HubuCbTipKwDXWUVL0tar
X-Proofpoint-ORIG-GUID: NH3GmPhXY83HubuCbTipKwDXWUVL0tar
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=923
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260073
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

This series introduces support to enable the Mobile Display Subsystem (MDSS)
and Display Processing Unit (DPU) for the Qualcomm SA8775P target. It
includes the addition of the hardware catalog, compatible string,
relevant device tree changes, and their YAML bindings.

---

In this series PATCH 5: "arm64: dts: qcom: sa8775p: add display dt nodes"
depends on the clock enablement change:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/

---

[v2]
- Updated cover letter subject and message. [Dmitry]
- Use fake DISPCC nodes to avoid clock dependencies in dt-bindings. [Dmitry]
- Update bindings by fixing dt_binding_check tool errors (update includes in example),
  adding proper spacing and indentation in the binding example, droping unused labels,
  droping status disable, adding reset node. [Dmitry, Rob, Krzysztof]
- Reorder compatible string of MDSS and DPU based on alphabetical order.[Dmitry]
- add reg_bus_bw in msm_mdss_data. [Dmitry]
- Fix indentation in the devicetree. [Dmitry]

---

Mahadevan (5):
  dt-bindings: display/msm: Document MDSS on SA8775P
  dt-bindings: display/msm: Document the DPU for SA8775P
  drm/msm: mdss: Add SA8775P support
  drm/msm/dpu: Add SA8775P support
  arm64: dts: qcom: sa8775p: add display dt nodes

 .../display/msm/qcom,sa8775p-dpu.yaml         | 122 +++++
 .../display/msm/qcom,sa8775p-mdss.yaml        | 239 +++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  87 ++++
 .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c                |  11 +
 8 files changed, 950 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h

-- 
2.34.1

