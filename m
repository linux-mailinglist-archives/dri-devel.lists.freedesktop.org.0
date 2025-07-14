Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 451CCB03614
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 07:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5867D10E3EE;
	Mon, 14 Jul 2025 05:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="n8uZwMTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F8310E3EE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 05:42:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNKcVS018281;
 Mon, 14 Jul 2025 05:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=Q2oESWDSL/f/D+rHOnIH1Y
 oWvsdaZQhswqRwcCW3X0A=; b=n8uZwMTYrgROZKuxHa9NUUdLnH9v3D2dozqJNS
 FLaUpdbFjCWYzf1T+0WyR08By6D2mloQ3/YxEG8AdJDPCpuapKiDqcVSVCcNf6Uh
 syCQSZIAzJhnCDr6ym5R0IUOx/jCYUNx6ux6ftzgr+e80W4Zz/ccpN9t5liFu8Bw
 cad5PyxL6UN7TUOjLVhytKiwU1fCggzSTsRhH7WmJsZ7AFSn0/SNUsMnJ9Qq7Ayf
 v/tsHXbW6DO43lqkfFIr423600bItNRQj0kns58UJRaETybqPmZNvz0IeZ+j9Moy
 PHxzvxzSSrBKFFiKnLawuh3qwHgp/jLXPRz0BGikEERt84sg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47uftmbcd2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jul 2025 05:41:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56E5fsj1017526
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jul 2025 05:41:55 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 13 Jul 2025 22:41:51 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v7 0/4] Add support for gdsp remoteproc on sa8775p
Date: Mon, 14 Jul 2025 11:11:29 +0530
Message-ID: <20250714054133.3769967-1-quic_lxu5@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Authority-Analysis: v=2.4 cv=AI4FyeZ1 c=1 sm=1 tr=0 ts=687498a4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1uYcMGwCpCOlHB7q24UcZRF1LZeGLj7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzMSBTYWx0ZWRfXzU58alWoEa+O
 QNdhONvKzGQTZpUXyTdZn+B0/JSzAwTwWV+X6HgcKvvAUhp3wbQSEcjXy1pT1M/FOGo0nhwOX8C
 eEV27f3iXHk1ePhbQUqjehCSFW9KVfxMzngF0avlhYdU3teU5vmdrLUABDuoLp7fu0Jr1jRFOMy
 wgz0LPDFDnPn5ge4X7AJqS0LQLa0FVsHGCvHid7xwp1KAlgXqmR6N4OIb7uU2KLFXawibRpmqik
 KTmQX4tmltIObpHL8em46lTuv6ltPBlhKnGS5E4v0kV6jDM729M8pP3DF4q18aYEfgdK4p2buCo
 4uxZh4VdRP/vvkKOr0bkFMU/SeKaVhUkt+xd2OxcvgfPuED3GVyP4qD0d3pa0xNGAXrHFH97hKy
 MwjywHfZRYKK66XK3QcoVdmuPZ52AM7RDTVjmCsyxU1xK1Sw6uux/QSLovGl8a8+LL2j4jEB
X-Proofpoint-GUID: 1uYcMGwCpCOlHB7q24UcZRF1LZeGLj7k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=611 phishscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140031
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

The fastrpc driver has support for 5 types of remoteprocs. There are
some products which support GDSP remoteprocs. GDSP is General Purpose
DSP where tasks can be offloaded. Add fastrpc nodes and task offload
support for GDSP. Also strict domain IDs for domain.
Patch [v6]: https://lore.kernel.org/linux-arm-msm/20250709054728.1272480-1-quic_lxu5@quicinc.com/

Changes in v7:
  - Edit commit message.
Changes in v6:
  - Edit commit message.
  - Remove unused definition.
Changes in v5:
  - Edit commit message and add sapce before comment end.
  - Move domain definitions back to driver.
Changes in v4:
  - Split patch and change to common syntax.
Changes in v3:
  - Restrict domain IDs to represent a domain.
Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (4):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: Cleanup the domain names
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 54 ++++++++----------
 include/uapi/misc/fastrpc.h                   |  2 +-
 4 files changed, 85 insertions(+), 30 deletions(-)

-- 
2.34.1

