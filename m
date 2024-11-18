Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D79D0B0E
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 09:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280E810E355;
	Mon, 18 Nov 2024 08:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Y5n9JnYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 419F410E355
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 08:41:05 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RdJt020056;
 Mon, 18 Nov 2024 08:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 51UUDPKPn/m2eeZSZmRJhQ1BqI3NkwvgTuCMl8Xh+Uw=; b=Y5n9JnYC6mdO7PwL
 7M3F4ypocrUyxN7uf51cqvpwq3PNga93HkqlvHDZbwqO9YPNaTsbzAVgB6xB86kE
 u5J2zfjVyMUvIroMmim9qbd0kFNhjEO6DlSP9VROP/EjdLZp6kkb242YOoTANeTo
 MEw+ixzEpWaFJt69nmlNdLOsl8LiJGnqg+Hde0h0ByHLr3pIicRcWOLCfe5fcFUr
 S68LzcilWM06Yo8M0Tw1SM5bybCn2KwGHCdXb9yRAqgaQRIuum2PegqKGDSavjnX
 E0qqMG4nZXYqlx9V1IoeZ0U+giZkxI+aE+KnihfZZ22vKJ9Nh78xqXVHldvLbfLy
 sayikg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xksqkx90-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI8f0og020710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2024 08:41:00 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 00:40:57 -0800
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>
Subject: [PATCH v1 1/4] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Date: Mon, 18 Nov 2024 14:10:43 +0530
Message-ID: <20241118084046.3201290-2-quic_ekangupt@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jCR-s6R03MPdCxMHBD16fGzf29QOqzHz
X-Proofpoint-ORIG-GUID: jCR-s6R03MPdCxMHBD16fGzf29QOqzHz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 mlxlogscore=976 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxscore=0
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

Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
to be added for PD notifications and other missing features. Adding
and maintaining new files from within fastrpc directory would be easy.

Example of feature that is being planned to be introduced in a new C
file:
https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/

Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
---
 MAINTAINERS                          |  2 +-
 drivers/misc/Kconfig                 | 13 +------------
 drivers/misc/Makefile                |  2 +-
 drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
 drivers/misc/fastrpc/Makefile        |  2 ++
 drivers/misc/{ => fastrpc}/fastrpc.c |  0
 6 files changed, 21 insertions(+), 14 deletions(-)
 create mode 100644 drivers/misc/fastrpc/Kconfig
 create mode 100644 drivers/misc/fastrpc/Makefile
 rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index b878ddc99f94..280f07d722b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19036,7 +19036,7 @@ L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
-F:	drivers/misc/fastrpc.c
+F:	drivers/misc/fastrpc/
 F:	include/uapi/misc/fastrpc.h
 
 QUALCOMM HEXAGON ARCHITECTURE
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index 3fe7e2a9bd29..fd02acc3f444 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -286,18 +286,6 @@ config QCOM_COINCELL
 	  to maintain PMIC register and RTC state in the absence of
 	  external power.
 
-config QCOM_FASTRPC
-	tristate "Qualcomm FastRPC"
-	depends on ARCH_QCOM || COMPILE_TEST
-	depends on RPMSG
-	select DMA_SHARED_BUFFER
-	select QCOM_SCM
-	help
-	  Provides a communication mechanism that allows for clients to
-	  make remote method invocations across processor boundary to
-	  applications DSP processor. Say M if you want to enable this
-	  module.
-
 config SGI_GRU
 	tristate "SGI GRU driver"
 	depends on X86_UV && SMP
@@ -628,4 +616,5 @@ source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
 source "drivers/misc/keba/Kconfig"
+source "drivers/misc/fastrpc/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index a9f94525e181..efbf69c3b47c 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -17,7 +17,6 @@ obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
 obj-$(CONFIG_PHANTOM)		+= phantom.o
 obj-$(CONFIG_RPMB)		+= rpmb-core.o
 obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
-obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
 obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
 obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
@@ -72,3 +71,4 @@ obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
 obj-$(CONFIG_MARVELL_CN10K_DPI)	+= mrvl_cn10k_dpi.o
 obj-y				+= keba/
+obj-y				+= fastrpc/
diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
new file mode 100644
index 000000000000..7179a44eda84
--- /dev/null
+++ b/drivers/misc/fastrpc/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Qualcomm FastRPC devices
+#
+
+config QCOM_FASTRPC
+	tristate "Qualcomm FastRPC"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on RPMSG
+	select DMA_SHARED_BUFFER
+	select QCOM_SCM
+	help
+	  Provides a communication mechanism that facilitate high-speed
+	  Remote Procedure Call (RPC) mechanisms between the host CPU and
+	  offload processors Qualcomm Digital Signal Processors (DSPs).
+	  Say M if you want to enable this module.
\ No newline at end of file
diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
new file mode 100644
index 000000000000..77fd2b763b6b
--- /dev/null
+++ b/drivers/misc/fastrpc/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc/fastrpc.c
similarity index 100%
rename from drivers/misc/fastrpc.c
rename to drivers/misc/fastrpc/fastrpc.c
-- 
2.34.1

