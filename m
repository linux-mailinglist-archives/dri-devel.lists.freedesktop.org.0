Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D88BA30BA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 11:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5078210EA0A;
	Fri, 26 Sep 2025 09:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="dyWOr4Hw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703FE10EA08;
 Fri, 26 Sep 2025 09:00:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8ve43030682;
 Fri, 26 Sep 2025 09:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=aqd2eDmrkeC3w4Dfvl97dNyWi3y0TKz0aJm
 td8UTkC0=; b=dyWOr4Hw/F/ADSk7SjeJt6ert2C9brqEx+l74gY5eAqcYnFeU+6
 9ln3I7jUFqxnWsStfqNGb1y/Fwdmcbichido7Hkmnphc3x7nCtggVCbhIVZBdlyQ
 BvV0NP52rZqQ7ZSbijZFnXdkIkKKArM7jUQ8F7iAePtbSJiopnKDVy5k7M9OChrx
 JYgw7O1umxsQorIOo6N+CcouL4jPRa3LLwYrF6tlJ1CoGDR+sacWSt7Jn0RbiA7V
 4II2zsMaOpwd6GYBcnf89GBx3uSc0OMxyP+TMIRN/NXgy2Q0xLChvX0+HwAQyhe6
 FwHffRjvoqlSdsBmAYSGqk3tMttSh+to/HA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u26ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:00:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q90AWj008599; 
 Fri, 26 Sep 2025 09:00:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 499nbmgtnv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:00:10 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 58Q90AMI008577;
 Fri, 26 Sep 2025 09:00:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com
 [10.213.97.145])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 58Q90AZ7008571
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Sep 2025 09:00:10 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
 id 88291580; Fri, 26 Sep 2025 14:30:09 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_riteshk@quicnic.com, quic_amitsi@quicnic.com
Subject: [PATCH 0/4] Enable mdss1 Display Port for Qualcomm lemans-ride
 platform
Date: Fri, 26 Sep 2025 14:29:52 +0530
Message-Id: <20250926085956.2346179-1-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KD6IFI7IWs3ly7cAUhb6pCs4hwd1-ZBO
X-Proofpoint-GUID: KD6IFI7IWs3ly7cAUhb6pCs4hwd1-ZBO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXwqPTaC0l9ATj
 9H2gTSI4kvGxXJA7VO0atwozp9staAOnwPwPGrIWQq2rC/KZFiF6IKLILw2ksiIr4sgjEznI+FI
 nxnfg29u8Ha9Aj+H/V+2ReZZdKkZOkMdtWiWupV+bAHMI0hOGdTz49pye8e4WOt52Ze41ml5F+I
 Oxiwsi5NpS9CJZ91eaMKsJQ0aS2fTh5Z6zzzrDU0V4a0WMjKZ2NeNf6Rs21CpSwl/3qwoCEaw/P
 CAnci6GSG6ZztbQOrwnDQ4N8fm5Ty3904qw4QFqDainU+O3jYU69BXqjoXQOe9aI8XeZ0PoFcVa
 PskF3Uz0aRR/h4sP9pL4ty6qdCzxu90zLW4vAwJPVhIpgTnwbIQusdb8gR5Nolllhy9TEuVF+Cr
 9bFzbxlz6cGq39xkHL8ehcO1KLmsnQ==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d65625 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kQfU4T83tE8Kale-oXQA:9
 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

This series adds the DPTX0 and DPTX1 nodes, as a part of mdss1
on Qualcomm lemans SoC. It also enables Display Port on Qualcomm
lemans-ride platform.

---
The Devicetree patches are dependent on following patch:
https://lore.kernel.org/all/20250925-lemans_dual-v1-1-9c371803198d@oss.qualcomm.com/

Mani Chandana Ballary Kuntumalla (4):
  drm/msm/dp: Update msm_dp_controller IDs for sa8775p
  arm64: dts: qcom: lemans: add mdss1 displayPort device nodes
  arm64: dts: qcom: lemans-ride: Enable dispcc1
  arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

 .../boot/dts/qcom/lemans-ride-common.dtsi     |  84 ++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 245 ++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c           |   4 +-
 3 files changed, 331 insertions(+), 2 deletions(-)

-- 
2.34.1

