Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6293C91AB04
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 17:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C58910E138;
	Thu, 27 Jun 2024 15:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="A3xf0qzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4818010E034
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 10:43:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R2Lpt1025820;
 Thu, 27 Jun 2024 10:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=iA8+6w72zoBMreAJjV6Ek8
 9Djj0QZCYy7QrStROEU2k=; b=A3xf0qzNKiZZdyqe6OKfvymzlRqQxpLrjvKaep
 TedWGqQ+2xvjqkOS66ptOaTpLLVPKi3J3qtsuKfcR792szIkAzJrEG1f6cownWsN
 N8d8KqpsSF07wmBeveJtcroCIpT/CuQfO7CS1tvP4q5Gnrk89D/toBdnSyYtXeEh
 7TQ69YZ6t5syCrj46rKXn5bvdTgubmFCGGwqtwMGDPSTs0/2JXc3X8Vq/GI0TvIf
 yfM6dD5mwQz8GX67GOcmmGg8laYi6ZhUUHO1HIkajliTTkEw1JX51I91ADQUV3Zm
 Ma4CONAXhJ8ILAVXQ7JRFx6tg0sOi2m/5pVE0HBBzSrU5pLw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywnjs3mqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 10:42:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 45RAguTf018652
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jun 2024 10:42:56 GMT
Received: from hu-ekangupt-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 27 Jun 2024 03:42:53 -0700
From: Ekansh Gupta <quic_ekangupt@quicinc.com>
To: <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>
CC: <gregkh@linuxfoundation.org>, <quic_bkumar@quicinc.com>,
 <linux-kernel@vger.kernel.org>, <quic_chennak@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <arnd@arndb.de>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Date: Thu, 27 Jun 2024 16:12:44 +0530
Message-ID: <20240627104245.1651214-1-quic_ekangupt@quicinc.com>
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
X-Proofpoint-GUID: dLYOfPu00OXOTMin-9_gv63TYftyLbt2
X-Proofpoint-ORIG-GUID: dLYOfPu00OXOTMin-9_gv63TYftyLbt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_06,2024-06-27_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=792
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270080
X-Mailman-Approved-At: Thu, 27 Jun 2024 15:21:11 +0000
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
  - Updated Kconfig.
Changes in v3:
  - Added newline in kconfig.

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
index 0b99543d9c6e..55d0fecd1a74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18502,7 +18502,7 @@ L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
-F:	drivers/misc/fastrpc.c
+F:	drivers/misc/fastrpc/
 F:	include/uapi/misc/fastrpc.h
 
 QUALCOMM HEXAGON ARCHITECTURE
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index faf983680040..630e8ccd8669 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -276,18 +276,6 @@ config QCOM_COINCELL
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
@@ -602,4 +590,5 @@ source "drivers/misc/cardreader/Kconfig"
 source "drivers/misc/uacce/Kconfig"
 source "drivers/misc/pvpanic/Kconfig"
 source "drivers/misc/mchp_pci1xxxx/Kconfig"
+source "drivers/misc/fastrpc/Kconfig"
 endmenu
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 153a3f4837e8..f83d73844ea5 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -16,7 +16,6 @@ obj-$(CONFIG_TIFM_CORE)       	+= tifm_core.o
 obj-$(CONFIG_TIFM_7XX1)       	+= tifm_7xx1.o
 obj-$(CONFIG_PHANTOM)		+= phantom.o
 obj-$(CONFIG_QCOM_COINCELL)	+= qcom-coincell.o
-obj-$(CONFIG_QCOM_FASTRPC)	+= fastrpc.o
 obj-$(CONFIG_SENSORS_BH1770)	+= bh1770glc.o
 obj-$(CONFIG_SENSORS_APDS990X)	+= apds990x.o
 obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
@@ -69,3 +68,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
+obj-y				+= fastrpc/
diff --git a/drivers/misc/fastrpc/Kconfig b/drivers/misc/fastrpc/Kconfig
new file mode 100644
index 000000000000..0f238560f855
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

