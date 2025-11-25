Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E8CC8302F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 02:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CFA10E33B;
	Tue, 25 Nov 2025 01:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="NAphW0z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED96910E338;
 Tue, 25 Nov 2025 01:33:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOJtDon1303807; Tue, 25 Nov 2025 01:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=5s1GUpaHhDBmLyWnK4z7vrDo5bWUi8vrF01
 2fDReU0A=; b=NAphW0z+aOrn3PEicZogyCPqcpzKvyhntTswyOBaqZPEXRGhBQ9
 Bm6tliz156X/am57aNeOyrXhiH5+orHrWX7+BYzZL1374bsLuZCURTzFE2BkYijt
 hi4/l3yyF3DOfmPqR3JD7eEuo9xZRP8DpdHoT8geVkCqjPp4ns3nY73u22xlmgx6
 QOitEr+ZxPvzbdW/IGzAULW6KhJhXWChGzmdRUm0sqDtMuQdupu/w8P0/DbK2HWA
 dS8L8DBUl16B/haI881oA8kWtVPbBDB4yCxlp+2JdoFzi4hdGsFLTIvjTkEpVvsh
 9HpsrhRJnjbNOHyx+lGLwggW7P8/igrNCzQ==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8s9u05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP1X68L027346; 
 Tue, 25 Nov 2025 01:33:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68mvfg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:06 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AP1X5tU027320;
 Tue, 25 Nov 2025 01:33:05 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com
 [10.213.99.91])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AP1X5DN027312
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Nov 2025 01:33:05 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
 id 9D20B596; Tue, 25 Nov 2025 07:03:04 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com
Subject: [PATCH v3 0/5] Add DSI display support for QCS8300 target
Date: Tue, 25 Nov 2025 07:02:57 +0530
Message-Id: <20251125013302.3835909-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 9O6U5txyNqDmYeixXFCyR9gBhRbTx57V
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=69250755 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=RBJW5-z34AXF7GF-XkcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDAxMSBTYWx0ZWRfX5N9V645aOTyS
 h0tHQTCxJO3bxQWdOw3cSnywZzvdfCNkYPMHpqOclvb70fRUDA96xYaSx/PFqhyjiRRbyejm05m
 EknPKLlISwou8M3JouIkUBqm/McpKDkbAhrGnjnFPMfQHX+c/Xwp+7p0AGBK4ocdnzzKbCnFRWU
 3sfjodJ6ga3X7A0xhF8ElZum5oDWKHRaA6O6/I1uHS84TcIro/K1/ODOd334rITTwY5CNsivs19
 U7qN3iZqdASnhopN+0y2BvzlEbffoOL8rqPWApj6pEpRjHM8QB26yBkLg9QoFK+QSXqwjZmYVWO
 6nTCQ1JVngKJHmP8bSMB5CO7n6RMsDszzxqPXFztpP56O1N06r4IjRzAW6rwzkUY7sc2qF9kezZ
 ilhJ6E2Fi8gj+/SrKsBk62ENGsk7rw==
X-Proofpoint-GUID: 9O6U5txyNqDmYeixXFCyR9gBhRbTx57V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250011
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

This series enables the support for DSI to DP bridge port
(labeled as DSI0) of the Qualcomm's QCS8300 Ride platform.

QCS8300 SoC has DSI controller v2.5.1 and DSI PHY v4.2.
The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.

---
This patch depends on following series:
https://lore.kernel.org/all/20251117-dts_qcs8300-v7-0-bf42d39e7828@oss.qualcomm.com/
(Enable DPU and Display Port for Qualcomm QCS8300-ride platform)

Changes in v3: Addressed review comments from konard and Dmitry
   - Patch 2: Remove qcom,qcs8300-dsi-ctrl from clk details. [Dmitry]
   - Remove PHY and CTRL driver support. The CTRL and PHY versions for
     Monaco are the same as LeMans, and Monaco will use the same CTRL
     and PHY based on the fallback compatible string [Dmitry/Konard]
   - Patch 5: Rename the regulator used and arrange the compatible, reg,
     address and size cell for i2cmux in proper order. [Dmitry]
   - Link to v2: https://lore.kernel.org/all/20251006013924.1114833-1-quic_amakhija@quicinc.com/

Changes in v2: Addressed review comments from Konard and Dmitry
   - Patch 1: Documented the qcom,qcs8300-dsi-phy-5nm compatible string.
   - Patch 2: Documented the qcom,qcs8300-dsi-ctrl compatible string.
   - Patch 3:
           - Added qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm compatible strings
             to the Device Tree bindings. [Dmitry/Konard]
           - Fixed indentation issue. [Dmitry]
           - Drop the extra empty line. [Dmitry]
   - Patch 4: Added PHY driver support for qcom,qcs8300-dsi-phy-5nm.
   - Patch 5: Added CTRL driver support for qcom,qcs8300-dsi-ctrl.
   - Patch 6: Included qcom,qcs8300-dsi-ctrl and qcom,qcs8300-dsi-phy-5nm
              compatible strings in the Device Tree. [Dmitry/Konard]
   - Link to v1: https://lore.kernel.org/all/20250925053602.4105329-1-quic_amakhija@quicinc.com/

Ayushi Makhija (5):
  dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
  dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
  dt-bindings: display: msm: document DSI controller and phy on QCS8300
  arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
  arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

 .../display/msm/dsi-controller-main.yaml      |   5 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |  30 ++--
 .../display/msm/qcom,qcs8300-mdss.yaml        | 102 ++++++++++-
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  98 +++++++++-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts     | 170 ++++++++++++++++++
 5 files changed, 391 insertions(+), 14 deletions(-)

base-commit: d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 ("next-20251121")
-- 
2.34.1

