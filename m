Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF62704C58
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 13:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C850710E344;
	Tue, 16 May 2023 11:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1659 seconds by postgrey-1.36 at gabe;
 Tue, 16 May 2023 11:28:43 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C8910E344;
 Tue, 16 May 2023 11:28:43 +0000 (UTC)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GAjFuQ030962; Tue, 16 May 2023 11:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Ev8bpmefO3oAmyABiNql71RTv0bousLYpb/GjqSW9Vk=;
 b=UxsF2ZOJeViMfmseMAISvPUmxMmdAi6A5r5kmwv0n/1Ho26lNsab6l7dV2Y1EjPDwZMz
 ZlC2xOTfwWcQEGBMN2UnjGTkNcMS2VaCaa5O6WH8UVMBS+M2J0kD+kcSj8rTMdpTO7M2
 rfkAbjmshTgP+20caiMoxEFcgzFuQ4bX5r17RK/JCNzZZmIMk2cOzlAPeIC8zC48v7i+
 dSdb0WZOqjnf6IYHIqDJipRr+UcdbqKtvDWery0hy3xx+6YakQ/BHCSUY+EiR63pAk7i
 7jTlxQkq7KmJ11zufqPK2WbPwOazDh58YwTHS2LfJAgRV5VP8XlBoDVJAdJDVz6ebfMo Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm8bn0dw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 11:00:51 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34GAksD5004391;
 Tue, 16 May 2023 11:00:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm8bn0dut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 11:00:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34G7b9Xs031123;
 Tue, 16 May 2023 11:00:48 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3qj1tdsjr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 11:00:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34GB0jFf8979086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 May 2023 11:00:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804072004D;
 Tue, 16 May 2023 11:00:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14EC720043;
 Tue, 16 May 2023 11:00:45 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 16 May 2023 11:00:45 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 07/41] drm: handle HAS_IOPORT dependencies
Date: Tue, 16 May 2023 13:00:03 +0200
Message-Id: <20230516110038.2413224-8-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516110038.2413224-1-schnelle@linux.ibm.com>
References: <20230516110038.2413224-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w3sz8-ToMzSokkTdWpKQ8SoNz85SvyXo
X-Proofpoint-ORIG-GUID: L-Vy2aLAmYx74LeQnJJT49DR7ekQwxg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_04,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=811 impostorscore=0 mlxscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305160089
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
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alan Stern <stern@rowland.harvard.edu>, spice-devel@lists.freedesktop.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
not being declared. We thus need to add HAS_IOPORT as dependency for
those drivers using them. In the bochs driver there is optional MMIO
support detected at runtime, warn if this isn't taken when
HAS_IOPORT is not defined.

There is also a direct and hard coded use in cirrus.c which according to
the comment is only necessary during resume.  Let's just skip this as
for example s390 which doesn't have I/O port support also doesen't
support suspend/resume.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
Note: The HAS_IOPORT Kconfig option was added in v6.4-rc1 so
      per-subsystem patches may be applied independently

 drivers/gpu/drm/qxl/Kconfig   |  1 +
 drivers/gpu/drm/tiny/bochs.c  | 17 +++++++++++++++++
 drivers/gpu/drm/tiny/cirrus.c |  2 ++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index ca3f51c2a8fe..d0e0d440c8d9 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -2,6 +2,7 @@
 config DRM_QXL
 	tristate "QXL virtual GPU"
 	depends on DRM && PCI && MMU
+	depends on HAS_IOPORT
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index d254679a136e..3710339407cc 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -2,6 +2,7 @@
 
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <asm/bug.h>
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
@@ -105,7 +106,9 @@ static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
 
 		writeb(val, bochs->mmio + offset);
 	} else {
+#ifdef CONFIG_HAS_IOPORT
 		outb(val, ioport);
+#endif
 	}
 }
 
@@ -119,7 +122,11 @@ static u8 bochs_vga_readb(struct bochs_device *bochs, u16 ioport)
 
 		return readb(bochs->mmio + offset);
 	} else {
+#ifdef CONFIG_HAS_IOPORT
 		return inb(ioport);
+#else
+		return 0xff;
+#endif
 	}
 }
 
@@ -132,8 +139,12 @@ static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
 
 		ret = readw(bochs->mmio + offset);
 	} else {
+#ifdef CONFIG_HAS_IOPORT
 		outw(reg, VBE_DISPI_IOPORT_INDEX);
 		ret = inw(VBE_DISPI_IOPORT_DATA);
+#else
+		ret = 0xffff;
+#endif
 	}
 	return ret;
 }
@@ -145,8 +156,10 @@ static void bochs_dispi_write(struct bochs_device *bochs, u16 reg, u16 val)
 
 		writew(val, bochs->mmio + offset);
 	} else {
+#ifdef CONFIG_HAS_IOPORT
 		outw(reg, VBE_DISPI_IOPORT_INDEX);
 		outw(val, VBE_DISPI_IOPORT_DATA);
+#endif
 	}
 }
 
@@ -229,6 +242,10 @@ static int bochs_hw_init(struct drm_device *dev)
 			return -ENOMEM;
 		}
 	} else {
+		if (!IS_ENABLED(CONFIG_HAS_IOPORT)) {
+			DRM_ERROR("I/O ports are not supported\n");
+			return -EIO;
+		}
 		ioaddr = VBE_DISPI_IOPORT_INDEX;
 		iosize = 2;
 		if (!request_region(ioaddr, iosize, "bochs-drm")) {
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 594bc472862f..c65fea049bc7 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -508,8 +508,10 @@ static void cirrus_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	cirrus_mode_set(cirrus, &crtc_state->mode);
 
+#ifdef CONFIG_HAS_IOPORT
 	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
 	outb(VGA_AR_ENABLE_DISPLAY, VGA_ATT_W);
+#endif
 
 	drm_dev_exit(idx);
 }
-- 
2.39.2

