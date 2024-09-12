Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1449763AC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 09:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51DA010EAEE;
	Thu, 12 Sep 2024 07:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="ebGr2VNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D8510E1E6;
 Thu, 12 Sep 2024 07:15:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2L8Pd006676;
 Thu, 12 Sep 2024 07:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ZxJ7NCNW1Cz6xqRyaiFTCUzzAiDVE4S9pdA
 P/UhJqn0=; b=ebGr2VNR3qSSm2rwiXtjD4yUmGf8u/BKgZzqm9PGcLtKOA/KiMO
 4iuqZPe0waC52XMUcmYLmUA/AaX/m1jB4rHGIh6quQTKp0Z51VBGehd7NxaQ++yh
 c+xueyMpn1TWCcRCb9QvNp6iHivCtpCiOeN84d2skgUGkVrJD//lAMH62sw194gA
 7yDrz8xCzW1JR4USeaOQthnEQwBFITxL2hRxegb0oEvU7YRxgr2tpeKWfRv42UU3
 hJnEiCheTeCI4SCdhKZ0FBsdTFlG3T3W0rXwo7TT51w9Axl6ab49CYGPzk9oL4jf
 o1cBeqHTWh9KcjV4VurLx3a/2m/nqCyU1uw==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pc6rp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:15:00 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48C7Ete3000425; 
 Thu, 12 Sep 2024 07:14:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41h168ypm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:14:55 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48C7Et8j000397;
 Thu, 12 Sep 2024 07:14:55 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mahap-hyd.qualcomm.com
 [10.213.96.84])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 48C7Esms000393
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2024 07:14:55 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2365311)
 id 5B8AFADB; Thu, 12 Sep 2024 12:44:53 +0530 (+0530)
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
Subject: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
Date: Thu, 12 Sep 2024 12:44:32 +0530
Message-Id: <20240912071437.1708969-1-quic_mahap@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: ejgitIFGMrpN6cBJ8c37Bzd_qi-zwMkB
X-Proofpoint-GUID: ejgitIFGMrpN6cBJ8c37Bzd_qi-zwMkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=868 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409120049
X-Mailman-Approved-At: Thu, 12 Sep 2024 07:56:55 +0000
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

Add support for mdss and dpu driver on Qualcomm SA8775P platform.

---
This series depends on following series:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
---

Mahadevan (5):
  dt-bindings: display/msm: Document MDSS on SA8775P
  dt-bindings: display/msm: Document the DPU for SA8775P
  drm/msm: mdss: Add SA8775P support
  drm/msm/dpu: Add SA8775P support
  arm64: dts: qcom: sa8775p: add display dt nodes

 .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
 .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
 .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +
 8 files changed, 931 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h

-- 
2.34.1

