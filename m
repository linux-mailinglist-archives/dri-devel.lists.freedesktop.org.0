Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B69F1809
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 22:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB87410E45D;
	Fri, 13 Dec 2024 21:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="c3gfzzI6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821D510EEA3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 21:34:08 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BDB5ptj023114;
 Fri, 13 Dec 2024 21:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=BsxyIqMH6vbxpmMvpeXYtQ
 USqIYtwIugn0/cFNja/n0=; b=c3gfzzI6/OBtzfqBa30Gxq+mp6wh15/rC9t91v
 6NEGa8FYTXsz9JaFNuaKBqvTXxfotnG45Z73tHkNRfVvfMX3+5do/ZEZL08f3M5k
 f6nVtgR/N4r6HQEnhuUu1+wOv27iJIWtllYn/n6xas+lbJK2Le5WnDQu80eIEn77
 jFT+hdMD8mRUXRTOlo5jGzMxOuapr3A2KJTp5YOe/Erwk+rWaU8DTXGZS25lRz52
 Vn8yZZj+XfsrBCYkSOU0EYbiG0m/fw+/vqxj1DX8diD8Q0LPrZ6po2ZamhodY0Zh
 OT2sLc6znWDoG1C2MY/37MYY+JiSO6sr+3OF78xO0c0s8dkQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd40qknd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:33:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BDLXugq028132
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Dec 2024 21:33:56 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 13 Dec 2024 13:33:55 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <quic_carlv@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
 <quic_yabdulra@quicinc.com>, <quic_mattleun@quicinc.com>,
 <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <lizhi.hou@amd.com>,
 <jacek.lawrynowicz@linux.intel.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <mhi@lists.linux.dev>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>
Subject: [PATCH 0/7] accel/qaic: Initial AIC200 support
Date: Fri, 13 Dec 2024 14:33:33 -0700
Message-ID: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: TuRmQpfhVDiFP_eJDlvcw_nArEU0pcMS
X-Proofpoint-ORIG-GUID: TuRmQpfhVDiFP_eJDlvcw_nArEU0pcMS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130152
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

Initial support to the driver to boot up AIC200. AIC200 uses BHIe
without BHI, which is something that the MHI bus has not supported until
now. While the MHI changes are listed first to facilitate cross-tree
merging, they are not needed until the last change in the series.

Also, AIC200 is a different product from AIC100 with MSI-X, different
BARs, and different MHI configuration so we finally need some
infrastructure in the driver to be able to handle product differences.
This is expected to evolve more over time.

Jeffrey Hugo (2):
  accel/qaic: Add config structs for supported cards
  accel/qaic: Add AIC200 support

Matthew Leung (2):
  bus: mhi: host: Refactor BHI/BHIe based firmware loading
  bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL

Youssef Samir (3):
  accel/qaic: Allocate an exact number of MSIs
  accel/qaic: Add support for MSI-X
  accel/qaic: Mask out SR-IOV PCI resources

 drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
 drivers/accel/qaic/mhi_controller.h |   2 +-
 drivers/accel/qaic/qaic.h           |  14 +-
 drivers/accel/qaic/qaic_drv.c       |  97 +++++---
 drivers/accel/qaic/qaic_timesync.c  |   2 +-
 drivers/accel/qaic/sahara.c         |  39 ++-
 drivers/bus/mhi/host/boot.c         | 223 +++++++++++++----
 drivers/bus/mhi/host/init.c         |   2 +-
 drivers/bus/mhi/host/internal.h     |   8 +
 9 files changed, 641 insertions(+), 106 deletions(-)

-- 
2.34.1

