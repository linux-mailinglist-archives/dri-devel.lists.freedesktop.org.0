Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4632370BA69
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 12:51:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3481B10E2A7;
	Mon, 22 May 2023 10:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB3810E2B0
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 10:51:41 +0000 (UTC)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34MAgHDO007729; Mon, 22 May 2023 10:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=b8q2DmoMsfj4F/v2Ts1VW2FDB06swjG5JGKrv4f4VxI=;
 b=Qx10tu8hhLAi13BKAd8BhyqIotJ6jZJ76EcAwIt9qV70+KY8xOAogS6Kev0/MajJYUX3
 swddvU754ydwZ+3cHPtRhJZlsqKzm34aqMg/eU4TLbRPkfFL7JiYMDws7gPis994R0vJ
 oNry0N3GKxm3g6FOBJLUdWeRY8NvNJl5MACQCBqnoPtnCy8BEPtS5fKS1wW44ZoxbHRT
 jY0QFSAMDL294VPAKM2ubTDK33JInhFcake4LdNwnLYIhVH+6lG+xryd7sKKog0moz+E
 oSiT1HMHQ5vW2vttqV3PEbewQt2bSm+O/mq1lT0l5Vmk2Qa0krT/7Q6juOuYYjQxtB/E Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qq7qjgngy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 10:51:31 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34MAc2bB006803;
 Mon, 22 May 2023 10:51:30 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qq7qjgng5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 10:51:30 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34M2w3SP026203;
 Mon, 22 May 2023 10:51:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qppcu8wf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 May 2023 10:51:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34MApPPk5309136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 10:51:25 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B95F520040;
 Mon, 22 May 2023 10:51:25 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5751220043;
 Mon, 22 May 2023 10:51:25 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 22 May 2023 10:51:25 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH v5 39/44] vgacon: add HAS_IOPORT dependencies
Date: Mon, 22 May 2023 12:50:44 +0200
Message-Id: <20230522105049.1467313-40-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522105049.1467313-1-schnelle@linux.ibm.com>
References: <20230522105049.1467313-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LV5EOaymfYP7rhb8NgmHVTonkJwmdvjv
X-Proofpoint-GUID: kT7KET0bdYLvgfoQ5_h0OkbD9Dzu_Gug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_06,2023-05-22_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=950 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305220089
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 linux-fbdev@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
not being declared. We thus need to add HAS_IOPORT as dependency for
those drivers using them.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/video/console/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
index 22cea5082ac4..64974eaa3ac5 100644
--- a/drivers/video/console/Kconfig
+++ b/drivers/video/console/Kconfig
@@ -10,6 +10,7 @@ config VGA_CONSOLE
 	depends on !4xx && !PPC_8xx && !SPARC && !M68K && !PARISC &&  !SUPERH && \
 		(!ARM || ARCH_FOOTBRIDGE || ARCH_INTEGRATOR || ARCH_NETWINDER) && \
 		!ARM64 && !ARC && !MICROBLAZE && !OPENRISC && !S390 && !UML
+	depends on HAS_IOPORT
 	select APERTURE_HELPERS if (DRM || FB || VFIO_PCI_CORE)
 	default y
 	help
-- 
2.39.2

