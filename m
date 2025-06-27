Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D49AAEB4EA
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 12:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C42910E9C2;
	Fri, 27 Jun 2025 10:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fq+LxtBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA5B10E9C2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 10:33:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DtBB015139;
 Fri, 27 Jun 2025 10:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=olCj1v8P/I3CvFhsgigwhz
 rq5RbTz3yGHfA546iFpUw=; b=fq+LxtBANxcTrB8JACHibzXElVGoC7WC2KU6Ck
 UoD7Afvo5UWu0FZeQHuP+5I//Wk3CO/00CqdG1rYfukUr0h+nMAGYdXAnAP2AWY7
 fvcEe+tcbBSy9mK3/oD12GM8OLYKi0awmRx9NMCcT5iRdcY/y1wm1Q8V4vmT7CGq
 /29Qxe+0g7/5XhXQS585VhV93PYeEZcBmClvMWF8gy1RQQ3OMNnch2+UPus/0kB7
 1XQh2dguLugn/Oi0X1PxoJbvwge3k+nqkB/wb67sdNNrZn1w0xzB95SN7gq2tKHl
 nN7oSmjMq88KGh1sDb5DXL1gZfO7GrW+BXoI2n/pT0wJkJZQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm253pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 10:33:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55RAXi9k012595
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jun 2025 10:33:44 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 27 Jun 2025 03:33:41 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v4 0/4] Add support for gdsp remoteproc on sa8775p
Date: Fri, 27 Jun 2025 16:03:15 +0530
Message-ID: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685e7389 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=qgJfyGv91k1fQCYRv54A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: --txrtWjGz-DVbVLqDDqyvF1EEcAq7s9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA4NiBTYWx0ZWRfX5CvdDJrGB8V5
 YPrCP71K7TsRgsZkipN5HwUb0pNbYUmd/xqIXsba5l7l4Isvm5UnHI/g9st4sxtapsU7iefRsxE
 WUKuu2wLQzSSc0ZhAqN1th4xO92+sUwS8TZe4GwS+7D7BBhTZ9N+8rT9KMKzeCPug91SKYXzhRC
 qG5n6cjF/viL8jCbS2UQnubdvFhoBMEe8nhmt+qOWEqgX4hrqWuCJ/pwaNGYtJ9YNXpQVirufcQ
 fCpuSlwbbgA++J5A6xoEnUjrBXQpkVbcAt+0M+Zhec+mhaIV1j0zkZ09UpvqGyIftvPR+E7rd7p
 Qk4hDFsfb0YnVp4c+rLW0Q7zuNncvCG1aL3mDiBFgYfxFop0pIkR46gH3Cpfh2QQL+jGz7lItSB
 FXRcUqlBsrx06TpSnzrS9cWD2KZ0fQ16ixwv9GIrIHW9vRCwwWB5bSF6q3V0IrISk2CTqRs+
X-Proofpoint-ORIG-GUID: --txrtWjGz-DVbVLqDDqyvF1EEcAq7s9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=697
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270086
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
Patch [v3]: https://lore.kernel.org/linux-arm-msm/20250622133820.18369-1-quic_lxu5@quicinc.com/

Changes in v4:
  - Split patch and change to common syntax.
Changes in v3:
  - Restrict domain IDs to represent a domain.
Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (4):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: Refactor domain ID to enforce strict mapping
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 57 ++++++++-----------
 include/uapi/misc/fastrpc.h                   |  8 +++
 4 files changed, 91 insertions(+), 33 deletions(-)

-- 
2.34.1

