Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88574AE3019
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jun 2025 15:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37110E322;
	Sun, 22 Jun 2025 13:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="pkltTDe3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B74B10E322
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jun 2025 13:38:47 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M5TXCf009849;
 Sun, 22 Jun 2025 13:38:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=bCbTyKNkXtYcXkx/TJ3uwl
 I70UfFZLRjaXHwsQSyVXo=; b=pkltTDe3oPlo26QWjNR6MpCnyyOsxLlpC29Z4X
 W0+OTjTS/gkxqI+O09Q3eMjQpIBt4G7dejpUAhNrBI2W3pSLgsd55ap4+DddAKTs
 UeKY/cQQ6/4hGMf2f3vUjnl/X8ZSl1FIGO0SvFoG22NPP9TIYxHnCNy0245UDJj9
 zxHzZ02uv2dnQXFR2Szgt1+B1m/h14pzY7aesJc2BsCzcM1LlxM8rQf2FBFwTHEU
 9uXEfsqZcNfkLRZlgqdHRddSNGbGz5caR4dIurZEKia+e6fve4WE5zWGF/l2ee56
 Pk/cIEwAFzU/xVUm+1lsEqLkg3pahc+RdpokzYKTEOZ84z9g==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7rh97-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Jun 2025 13:38:41 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com
 [10.45.79.139])
 by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55MDceGL009504
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 22 Jun 2025 13:38:40 GMT
Received: from hu-lxu5-sha.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Jun 2025 06:38:37 -0700
From: Ling Xu <quic_lxu5@quicinc.com>
To: <srini@kernel.org>, <amahesh@qti.qualcomm.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
 <konradybcio@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
CC: <quic_kuiw@quicinc.com>, <ekansh.gupta@oss.qualcomm.com>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Ling Xu
 <quic_lxu5@quicinc.com>
Subject: [PATCH v3 0/3] Add support for gdsp remoteproc on sa8775p
Date: Sun, 22 Jun 2025 19:08:17 +0530
Message-ID: <20250622133820.18369-1-quic_lxu5@quicinc.com>
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
X-Proofpoint-ORIG-GUID: JJJn2_CuFBQbh1GRY4hOUxxtqxYMOUYK
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=68580761 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=s0CkNgkO2cT-0G377o4A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA4NSBTYWx0ZWRfXzjpwWl418nCR
 qABThAnymkkBgpJ3taDzluHjyzXe19hK7h5VCqOcFPpXru+YJkNvT4DelrTTQPsEu5szKOJRzIq
 C38uESsOt1SehucdZPz/Szv1xTeDbI4a7SqhkaFJKaLdvZqtWclXMFfnaKcYNCnhJMbjBOOh/sk
 Pcweliy4G8Os16YcX0sZtxTAf6rArt+fs5To6GIgCzhnbl6fcPuLHGvL4mDo04sAW5tNY0vwaVu
 xZZFsn90JVuTIjFm+d46Sid2JmM7hBd6NYMgdtWLOwOfraR04A1QoZ8HxnqXBEfDdGIXaNONU14
 XHkmTQXoW02uXspcIgqbz0hHDP+6Tco0KWzyGeNY57IyVE9x0kozH1InGRKlz68m7fWfc06GFPF
 54c0f1ZsEc07sEkdNOXP7LMFFPHryisDQid2f1XMgIBK4oEz5VJTIip8ozzzicUJzDG9MsOJ
X-Proofpoint-GUID: JJJn2_CuFBQbh1GRY4hOUxxtqxYMOUYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_04,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=716 clxscore=1011 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220085
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
some products which support GDSP remoteprocs. GDSPs are General
Purpose DSPs where tasks can be offloaded. Add changes to support GDSP
remoteprocs and also add GDSP fastrpc nodes.
Patch [v2]: https://lore.kernel.org/linux-arm-msm/20250320091446.3647918-1-quic_lxu5@quicinc.com/

Changes in v3:
  - Restrict domain IDs to represent a domain.
Changes in v2:
  - Add GPDSP labels in dt-bindings.

Ling Xu (3):
  dt-bindings: misc: qcom,fastrpc: Add GDSP label
  arm64: dts: qcom: sa8775p: add GDSP fastrpc-compute-cb nodes
  misc: fastrpc: add support for gdsp remoteproc

 .../bindings/misc/qcom,fastrpc.yaml           |  2 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 57 +++++++++++++++++++
 drivers/misc/fastrpc.c                        | 57 ++++++++-----------
 include/uapi/misc/fastrpc.h                   | 11 +++-
 4 files changed, 92 insertions(+), 35 deletions(-)

-- 
2.34.1

