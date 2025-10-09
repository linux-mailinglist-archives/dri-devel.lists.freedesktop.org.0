Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A896DBC7A01
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B5F10E927;
	Thu,  9 Oct 2025 07:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Z3/d6znV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D2710E922;
 Thu,  9 Oct 2025 07:11:56 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EPQA005152;
 Thu, 9 Oct 2025 07:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:date:from:message-id:subject:to; s=qcppdkim1; bh=PBgSZOSR5fHa
 CLJtGpDCar+N1XjgrHzJg8ZdWv4pkcE=; b=Z3/d6znVqjGrbX3vR2L3zWUOra+H
 VBv0dya+PNyzK3LNJvZQMCzXqsHi5BrewE+d25HJ8AA1YtUUa2xqZZ7Pu27sf8OW
 WJac7a1mOM7LpfF6MlR1oP6oJHeoYYUc+ugH22RzG6aIrxPy8PWxL4s8f03wmgC8
 dKLTwDFvyk1JLN6Eo9pJ/b4MoCiZcN9VaWdAvgLlCtaxyFrr8OgrRxoQXs3UikUr
 uDPGS0NYzzedbboWg7eKjHOhDWFEEWp7hlXj3g123W5UorBL+c7vGAVWzBZwflWo
 kvFwB817QAqrFm+7KVJ+H3sYNzXl7RVrm3+Ldsp4h3BBcdpATyzkwmENfQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u1tx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Oct 2025 07:11:47 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5997Bhg0002157; 
 Thu, 9 Oct 2025 07:11:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 49jvnmbgxv-1;
 Thu, 09 Oct 2025 07:11:43 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5997BgSO002130;
 Thu, 9 Oct 2025 07:11:42 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-riteshk-hyd.qualcomm.com
 [10.147.241.247])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5997Bg3X002129;
 Thu, 09 Oct 2025 07:11:42 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2314801)
 id 96CB55001CB; Thu,  9 Oct 2025 12:41:41 +0530 (+0530)
From: Ritesh Kumar <quic_riteshk@quicinc.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mahap@quicinc.com, andersson@kernel.org,
 konradybcio@kernel.org, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 vkoul@kernel.org, kishon@kernel.org, cros-qcom-dts-watchers@chromium.org
Cc: Ritesh Kumar <quic_riteshk@quicinc.com>, linux-phy@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 quic_vproddut@quicinc.com
Subject: [PATCH 0/5] Add eDP reference clock voting support
Date: Thu,  9 Oct 2025 12:41:22 +0530
Message-Id: <20251009071127.26026-1-quic_riteshk@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e76033 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=W8fnRyYtc_bum-QUD2UA:9 a=nl4s5V0KI7Kw-pW0DWrs:22
 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: zwWDmzhOqW_7qm7Iwf8op00koXptZ8Yq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7q3DJvU3hqt0
 15E8n7axYll6HAkF3Q42eBhlHwm5PQCgfkHmNwyRgYXrLjEer8MgVnOshNfQiFf5QPwQYTlKEc4
 CRjn6s8EFoHZMyxVubtdvJQPOnpv23D/cSg6PsM0qICgaWW6/1MyRhWkpfgPhY0ulFbO6XiQq4D
 scBHkmmpXK7psMgQidkOikMK9IPi1KsNxIhp5nYuwUeR88kYCCW3k1+1+uC99MVaYgncaCfXmfq
 3gSHuBueMCgQt95tI2pyF59JxKbqAEemxkiQCDgi1eAKvHdt6Ve7aySB6CqmnWFR7kbOT4s6fQ4
 Z2fAp8SLDC2ecnqtMwpZWDbD18qE7DvisJlPSL027rf3TxI/r50ETti5VsuqCIBWC605Pkb+iml
 lR6RrkbgkaCPMrEckiO0IQAkrxWsxA==
X-Proofpoint-ORIG-GUID: zwWDmzhOqW_7qm7Iwf8op00koXptZ8Yq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

eDP reference clock is required to be enabled before eDP PHY
initialization. On lemans chipset it is being voted from
qmp ufs phy driver. This series adds support for voting the clock
from eDP PHY driver.

---
Ritesh Kumar (5):
  dt-bindings: phy: Add edp reference clock for qcom,edp-phy
  dt-bindings: display/msm: update edp phy example
  phy: qcom: edp: Add support for edp reference clock vote
  arm64: dts: qcom: Add edp reference clock for edp phy
  arm64: dts: qcom: Add edp reference clock for edp phy

 .../display/msm/qcom,sa8775p-mdss.yaml        |  6 ++--
 .../display/msm/qcom,sc7280-mdss.yaml         |  6 ++--
 .../devicetree/bindings/phy/qcom,edp-phy.yaml |  7 ++--
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 12 ++++---
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  6 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         | 11 ++++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 36 ++++++++++++-------
 arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 12 ++++---
 drivers/phy/qualcomm/phy-qcom-edp.c           |  3 +-
 9 files changed, 67 insertions(+), 32 deletions(-)

-- 
2.17.1

