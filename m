Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F373F6AD086
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 22:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179AE10E26F;
	Mon,  6 Mar 2023 21:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A7D10E26F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 21:34:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326JW7gC015080; Mon, 6 Mar 2023 21:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=+m+xg6oBSLb+hDqxmR3eS7hXggsAVG0eCx2mr+yodW8=;
 b=lgQo140JeLjgM3Y/dRDozZB1NSJPJOkhPiN5nDq8Y/N0J31PzQ15UTZGALcgfIWvQtXB
 0Yy324m7oiOuwY6wcJqW44wHAd3AYU/J7ppYGIwnF0wyJ44B43paojmqII1xXJ5c257O
 Ni7GJCG9tGXIBK+qske9hlAiaa4KVbHNwDonYyWtLmpKV1BWhE3TwtxbXXBQSLvyuwpJ
 Cunbpurc9fApB8PbuGR6oLYfdAyPgR5qC+87Zt6h5seb8XGEWL+dgYORZ0OsmFkz1ccx
 d+xcOJ1cAYyTTqVT/WBF/62duxmes3h0mQpZJBjHc1rZTWU6UNzCyWsGTNh8EEANpZ1+ Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p4g3mvvh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 21:34:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326LYU2u019810
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Mar 2023 21:34:30 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 6 Mar 2023 13:34:29 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <jacek.lawrynowicz@linux.intel.com>,
 <stanislaw.gruszka@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/8] QAIC accel driver
Date: Mon, 6 Mar 2023 14:33:55 -0700
Message-ID: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KYjFOp72e6y_EnY8RCV9zlv7VRhaDzFN
X-Proofpoint-GUID: KYjFOp72e6y_EnY8RCV9zlv7VRhaDzFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=760 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060186
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-doc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces a driver under the accel subsystem (QAIC -
Qualcomm AIC) for the Qualcomm Cloud AI 100 product (AIC100).  AIC100 is
a PCIe adapter card that hosts a dedicated machine learning inference
accelerator.

Depends on "accel: Build sub-directories based on config options" found at
https://lore.kernel.org/all/20230301162508.3963484-1-stanislaw.gruszka@linux.intel.com/

The previous version (v2) can be found at:
https://lore.kernel.org/all/1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com/

v3:
-Various style updates and word smithing
-Remove unused function declarations
-Drop iommu workaround for sg lists and outdated reserve_pages()
-Remove unnecessary includes
-Refactor qaic_pci_probe()
-Use FIELD_PREP for ENCODE_SEM
-Gate qaic subdirectory on the kconfig symbol
-Add dri-devel@lists.freedesktop.org to MAINTAINERS entry
-Rename copy_sgt()
-Correct guard macro for qaic.h and cplusplus macro
-Add comment in qaic_mhi_remove
-Fix qaic_open use after free
-Use devm allocs in qaic_mhi_register_controller()
-Remove partition device ioctl.

v2:
-Addressed comments from RFC
-Reduced the code to the core minimum by dropping telemetery, etc
-Conversion to accel subsystem
-Dropped versioning
-Add mhi_qaic_cntl component
-Restructure the documentation
-Pull in a few fixes from the downstream tree

Jeffrey Hugo (7):
  accel/qaic: Add documentation for AIC100 accelerator driver
  accel/qaic: Add uapi and core driver file
  accel/qaic: Add MHI controller
  accel/qaic: Add control path
  accel/qaic: Add datapath
  accel/qaic: Add qaic driver to the build system
  MAINTAINERS: Add entry for QAIC driver

Pranjal Ramajor Asha Kanojiya (1):
  accel/qaic: Add mhi_qaic_cntl

 Documentation/accel/index.rst       |    1 +
 Documentation/accel/qaic/aic100.rst |  501 ++++++++++
 Documentation/accel/qaic/index.rst  |   13 +
 Documentation/accel/qaic/qaic.rst   |  169 ++++
 MAINTAINERS                         |    9 +
 drivers/accel/Kconfig               |    1 +
 drivers/accel/Makefile              |    1 +
 drivers/accel/qaic/Kconfig          |   23 +
 drivers/accel/qaic/Makefile         |   13 +
 drivers/accel/qaic/mhi_controller.c |  563 +++++++++++
 drivers/accel/qaic/mhi_controller.h |   16 +
 drivers/accel/qaic/mhi_qaic_ctrl.c  |  581 +++++++++++
 drivers/accel/qaic/mhi_qaic_ctrl.h  |   11 +
 drivers/accel/qaic/qaic.h           |  282 ++++++
 drivers/accel/qaic/qaic_control.c   | 1496 ++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_data.c      | 1878 +++++++++++++++++++++++++++++++++++
 drivers/accel/qaic/qaic_drv.c       |  648 ++++++++++++
 include/uapi/drm/qaic_accel.h       |  397 ++++++++
 18 files changed, 6603 insertions(+)
 create mode 100644 Documentation/accel/qaic/aic100.rst
 create mode 100644 Documentation/accel/qaic/index.rst
 create mode 100644 Documentation/accel/qaic/qaic.rst
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile
 create mode 100644 drivers/accel/qaic/mhi_controller.c
 create mode 100644 drivers/accel/qaic/mhi_controller.h
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.c
 create mode 100644 drivers/accel/qaic/mhi_qaic_ctrl.h
 create mode 100644 drivers/accel/qaic/qaic.h
 create mode 100644 drivers/accel/qaic/qaic_control.c
 create mode 100644 drivers/accel/qaic/qaic_data.c
 create mode 100644 drivers/accel/qaic/qaic_drv.c
 create mode 100644 include/uapi/drm/qaic_accel.h

-- 
2.7.4

