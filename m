Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 141739D0B14
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6C310E457;
	Mon, 18 Nov 2024 08:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YmmbyvQT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1800B10E457
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:41:18 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5SFmi020604;
 Mon, 18 Nov 2024 08:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=D/ecP6hf5e7oCT4ilNkdMX
 VyoZZdR+8QDoAbAQq9LPI=; b=YmmbyvQTNrcuj5UBT/24cwt+GWgA9Hcxq9j8CL
 8LYlXqWJfurKzbo2bLKnwZYHIkZ4UVkNHlsq4NG1qJoppF8rxpz6Myl1/08hyARD
 4Qij6UqYmEVpPbC/LW6bTe75cc7r5q6BOnTVTsKS3sqkI22cAQOzlRsT6chnBZyQ
 JakToNqb5vMLKpmfylxfjrH4AAoxGzTI/qYXFPWCaOQkQrQ8wxmcLnHphmGGs08Z
 yvHA5LtLOAwaA/1BYCtvkDYXZKw1+TBZZwsakvJcwUBLRysTrVfQhgVORNMTLvOl
 9/mowZuTyZpGmX9pVgwBPpik7juyjv7Xx16iMXELJrq2+J8g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkqs3yy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI8evcZ022160
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:40:57 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 00:40:54 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 0/4] Add debugfs support for fastrpc driver
Date: Mon, 18 Nov 2024 14:10:42 +0530
Message-ID: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: dN2USy7Hd5NGGEyZDHp-TpsOEyhgnzVw
X-Proofpoint-GUID: dN2USy7Hd5NGGEyZDHp-TpsOEyhgnzVw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=895
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180071
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

Following changes are getting added as part of this patch series:
  - Move fastrpc driver to /misc/driver/ to enable maintainance of new
    files to support additional features.
  - Move macro and structure definitions to a new header file. These
    date are consumed by features to be added in new files.
  - Add support for debugfs for fastrpc driver. Most of the fastrpc
    user and channel context information are getting capture as part of
    patch.

Ekansh Gupta (4):
  misc: fastrpc: Move fastrpc driver to misc/fastrpc/
  misc: fastrpc: Rename fastrpc.c to fastrpc_main.c
  misc: fastrpc: Introduce fastrpc_shared.h header
  misc: fastrpc: Add debugfs support for fastrpc

 MAINTAINERS                                   |   2 +-
 drivers/misc/Kconfig                          |  13 +-
 drivers/misc/Makefile                         |   2 +-
 drivers/misc/fastrpc/Kconfig                  |  16 ++
 drivers/misc/fastrpc/Makefile                 |   4 +
 drivers/misc/fastrpc/fastrpc_debug.c          | 156 ++++++++++++++++++
 drivers/misc/fastrpc/fastrpc_debug.h          |  31 ++++
 .../{fastrpc.c => fastrpc/fastrpc_main.c}     | 154 ++---------------
 drivers/misc/fastrpc/fastrpc_shared.h         | 155 +++++++++++++++++
 9 files changed, 382 insertions(+), 151 deletions(-)
 create mode 100644 drivers/misc/fastrpc/Kconfig
 create mode 100644 drivers/misc/fastrpc/Makefile
 create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
 create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
 rename drivers/misc/{fastrpc.c => fastrpc/fastrpc_main.c} (94%)
 create mode 100644 drivers/misc/fastrpc/fastrpc_shared.h

-- 
2.34.1

