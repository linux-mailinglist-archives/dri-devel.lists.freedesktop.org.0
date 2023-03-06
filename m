Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039196AD0A1
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 22:35:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2193E10E48E;
	Mon,  6 Mar 2023 21:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFC610E48A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 21:34:52 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326He9kx018016; Mon, 6 Mar 2023 21:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=XX+FC1BIZxtzK5PwlkKf6emR7cy7+JRs2N+VSe0LXqQ=;
 b=MkuIRhSd8xliITq+kHiYQgcXGRLWcUukzX0QpLB2L0m5jnuWXszU5PCz1QGx0xeAukgM
 4umDwWAN7s/5xDzZ/6YYFgESknRw1XU7PvutUNzMMub18XLmWAyIHDJuwgIUsRTutrcz
 lFvJhE1WkJOlnYugWNQqei3FZBFOQY27Cigex63WNkmxOZYve9PVLndjzhANWKcCcunG
 gcATvEu2ItN/ugOZA04yw/+rJHr0OxGfGq87sJXRw67+/EVbcEH1hqVh2JHZixVMtlN6
 OoFjZvxXS25RbvibmaCsvvPDnxxJ+Ct4p3pUmaPng5aR7pazG0GCk6h4oPlEOX0us+t6 3Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p417ep1ge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Mar 2023 21:34:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 326LYjP0013944
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 6 Mar 2023 21:34:45 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Mon, 6 Mar 2023 13:34:44 -0800
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
To: <dafna@fastmail.com>, <ogabbay@kernel.org>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <jacek.lawrynowicz@linux.intel.com>,
 <stanislaw.gruszka@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 7/8] accel/qaic: Add qaic driver to the build system
Date: Mon, 6 Mar 2023 14:34:02 -0700
Message-ID: <1678138443-2760-8-git-send-email-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
References: <1678138443-2760-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: II2AHvFgsS3lrsfmRGTzAPLebWatZp05
X-Proofpoint-GUID: II2AHvFgsS3lrsfmRGTzAPLebWatZp05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=866 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060187
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

Now that we have all the components of a minimum QAIC which can boot and
run an AIC100 device, add the infrastructure that allows the QAIC driver
to be built.

Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
---
 drivers/accel/Kconfig       |  1 +
 drivers/accel/Makefile      |  1 +
 drivers/accel/qaic/Kconfig  | 23 +++++++++++++++++++++++
 drivers/accel/qaic/Makefile | 13 +++++++++++++
 4 files changed, 38 insertions(+)
 create mode 100644 drivers/accel/qaic/Kconfig
 create mode 100644 drivers/accel/qaic/Makefile

diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index c437206..64065fb 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -26,5 +26,6 @@ menuconfig DRM_ACCEL
 
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
+source "drivers/accel/qaic/Kconfig"
 
 endif
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index f22fd44..ab3df93 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -2,3 +2,4 @@
 
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
+obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
new file mode 100644
index 0000000..a9f8662
--- /dev/null
+++ b/drivers/accel/qaic/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm Cloud AI accelerators driver
+#
+
+config DRM_ACCEL_QAIC
+	tristate "Qualcomm Cloud AI accelerators"
+	depends on DRM_ACCEL
+	depends on PCI && HAS_IOMEM
+	depends on MHI_BUS
+	depends on MMU
+	select CRC32
+	help
+	  Enables driver for Qualcomm's Cloud AI accelerator PCIe cards that are
+	  designed to accelerate Deep Learning inference workloads.
+
+	  The driver manages the PCIe devices and provides an IOCTL interface
+	  for users to submit workloads to the devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qaic.
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
new file mode 100644
index 0000000..d5f4952
--- /dev/null
+++ b/drivers/accel/qaic/Makefile
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for Qualcomm Cloud AI accelerators driver
+#
+
+obj-$(CONFIG_DRM_ACCEL_QAIC)	:= qaic.o
+
+qaic-y := \
+	mhi_controller.o \
+	mhi_qaic_ctrl.o \
+	qaic_control.o \
+	qaic_data.o \
+	qaic_drv.o
-- 
2.7.4

