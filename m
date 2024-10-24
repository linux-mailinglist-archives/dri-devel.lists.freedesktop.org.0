Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C89AEEC6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 19:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF52A10E98E;
	Thu, 24 Oct 2024 17:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="fDeoDc05";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC6E10E98C;
 Thu, 24 Oct 2024 17:56:22 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OC9Td3027830;
 Thu, 24 Oct 2024 17:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=pp1; bh=VbfXQY
 ANgEWCm6x/VB28NaHFMe4eUcS2/0JibYvZQMk=; b=fDeoDc05ebGS0XoBgpBKBh
 wPUyl33wAinAzCoWCe1aV/1JGcUy21EUOfVDHNSp5dEmS2LKLh4X4lvbbqaj4niS
 GxelQfas6XRCg3BI3aMm3IBgZZv5xXTodoLPLsR7irL5cPS+i5F2gA9frVXNRF9r
 F7FRpwQLE/01f5LIJ+eH8KdJFhWNq1BjSN2d85CAKJTCJYRdxQESvg1bLps7aEBe
 nClD/aX3Sc06m2rNbiXJapKFK2Sx2NgLqG1mqUmaTmpAMo5lWQGsj+qrwnS/Laga
 KVsDoltoSVqMQNsvL/P9VFwjzag/MacO3XSSQf8IIgjIz7Nw3zRXwbbXTpPgdx0Q
 ==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emaf21sm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2024 17:56:11 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49OHuBdP019640;
 Thu, 24 Oct 2024 17:56:11 GMT
Received: from ppma12.dal12v.mail.ibm.com
 (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emaf21se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2024 17:56:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
 by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49OHmPrn001552;
 Thu, 24 Oct 2024 17:56:10 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emk9hp0r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Oct 2024 17:56:10 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 49OHu8DS15401724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Oct 2024 17:56:08 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75D3F5805A;
 Thu, 24 Oct 2024 17:56:08 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC9105805D;
 Thu, 24 Oct 2024 17:56:03 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Thu, 24 Oct 2024 17:56:03 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Thu, 24 Oct 2024 19:54:42 +0200
Subject: [PATCH v9 3/5] drm: handle HAS_IOPORT dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-b4-has_ioport-v9-3-6a6668593f71@linux.ibm.com>
References: <20241024-b4-has_ioport-v9-0-6a6668593f71@linux.ibm.com>
In-Reply-To: <20241024-b4-has_ioport-v9-0-6a6668593f71@linux.ibm.com>
To: Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-serial@vger.kernel.org,
 linux-arch@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5508;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=HZwqeFaaTSS7URzB9A1ZSRTSgG+6j9wM8acPAGyArFo=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGNKluvju2rY4yHsZ+SbO2bvbV9xn8emES6riRou55rGZK
 /4M/rC7o5SFQYyLQVZMkWVRl7PfuoIppnuC+jtg5rAygQxh4OIUgInMaWb4H96y6f7vlfYc1+9t
 sTTalbSd37SsM/51bafdiXtvK8wvMDH8j1TlY9rAF8lXFmc77cbr5mQjlc1BanydV29PvZRc2Te
 bFQA=
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IAVTxaF_IXFrchF6cu2DB7gF36C2Nr6l
X-Proofpoint-ORIG-GUID: uUvDX5e-Fp4dwQuDpS3wII80AcfSLFBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240145
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

In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
compile time. We thus need to add HAS_IOPORT as dependency for those
drivers using them. In the bochs driver there is optional MMIO support
detected at runtime, warn if this isn't taken when HAS_IOPORT is not
defined.

There is also a direct and hard coded use in cirrus.c which according to
the comment is only necessary during resume.  Let's just skip this as
for example s390 which doesn't have I/O port support also doesen't
support suspend/resume.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Acked-by: Lucas De Marchi <lucas.demarchi@intel.com> # xe
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/gpu/drm/gma500/Kconfig |  2 +-
 drivers/gpu/drm/qxl/Kconfig    |  2 +-
 drivers/gpu/drm/tiny/bochs.c   | 19 ++++++++++++++-----
 drivers/gpu/drm/tiny/cirrus.c  |  2 ++
 drivers/gpu/drm/xe/Kconfig     |  2 +-
 5 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index efb4a2dd2f80885cb59c925d09401002278d7d61..23b7c14de5e29238ece939d5822d8a9ffc4675cc 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
-	depends on DRM && PCI && X86 && MMU
+	depends on DRM && PCI && X86 && MMU && HAS_IOPORT
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select I2C
diff --git a/drivers/gpu/drm/qxl/Kconfig b/drivers/gpu/drm/qxl/Kconfig
index ca3f51c2a8fe1a383f8a2479f04b5c0b3fb14e44..17d6927e5e23402786117fd0f99186978956c1c2 100644
--- a/drivers/gpu/drm/qxl/Kconfig
+++ b/drivers/gpu/drm/qxl/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_QXL
 	tristate "QXL virtual GPU"
-	depends on DRM && PCI && MMU
+	depends on DRM && PCI && MMU && HAS_IOPORT
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 31fc5d839e106ea4d5c8fe42d1bfc3c70291e3fb..e738bb85831667f55c436e21e761435def113b9a 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <linux/bug.h>
 #include <linux/module.h>
 #include <linux/pci.h>
 
@@ -95,12 +96,17 @@ struct bochs_device {
 
 /* ---------------------------------------------------------------------- */
 
+static __always_inline bool bochs_uses_mmio(struct bochs_device *bochs)
+{
+	return !IS_ENABLED(CONFIG_HAS_IOPORT) || bochs->mmio;
+}
+
 static void bochs_vga_writeb(struct bochs_device *bochs, u16 ioport, u8 val)
 {
 	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
 		return;
 
-	if (bochs->mmio) {
+	if (bochs_uses_mmio(bochs)) {
 		int offset = ioport - 0x3c0 + 0x400;
 
 		writeb(val, bochs->mmio + offset);
@@ -114,7 +120,7 @@ static u8 bochs_vga_readb(struct bochs_device *bochs, u16 ioport)
 	if (WARN_ON(ioport < 0x3c0 || ioport > 0x3df))
 		return 0xff;
 
-	if (bochs->mmio) {
+	if (bochs_uses_mmio(bochs)) {
 		int offset = ioport - 0x3c0 + 0x400;
 
 		return readb(bochs->mmio + offset);
@@ -127,7 +133,7 @@ static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
 {
 	u16 ret = 0;
 
-	if (bochs->mmio) {
+	if (bochs_uses_mmio(bochs)) {
 		int offset = 0x500 + (reg << 1);
 
 		ret = readw(bochs->mmio + offset);
@@ -140,7 +146,7 @@ static u16 bochs_dispi_read(struct bochs_device *bochs, u16 reg)
 
 static void bochs_dispi_write(struct bochs_device *bochs, u16 reg, u16 val)
 {
-	if (bochs->mmio) {
+	if (bochs_uses_mmio(bochs)) {
 		int offset = 0x500 + (reg << 1);
 
 		writew(val, bochs->mmio + offset);
@@ -228,7 +234,7 @@ static int bochs_hw_init(struct drm_device *dev)
 			DRM_ERROR("Cannot map mmio region\n");
 			return -ENOMEM;
 		}
-	} else {
+	} else if (IS_ENABLED(CONFIG_HAS_IOPORT)) {
 		ioaddr = VBE_DISPI_IOPORT_INDEX;
 		iosize = 2;
 		if (!request_region(ioaddr, iosize, "bochs-drm")) {
@@ -236,6 +242,9 @@ static int bochs_hw_init(struct drm_device *dev)
 			return -EBUSY;
 		}
 		bochs->ioports = 1;
+	} else {
+		dev_err(dev->dev, "I/O ports are not supported\n");
+		return -EIO;
 	}
 
 	id = bochs_dispi_read(bochs, VBE_DISPI_INDEX_ID);
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus.c
index 751326e3d9c374baf72115492aeefff2b73869f0..e31e1df029ab0272c4a1ff0ab3eb026ca679b560 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus.c
@@ -509,8 +509,10 @@ static void cirrus_crtc_helper_atomic_enable(struct drm_crtc *crtc,
 
 	cirrus_mode_set(cirrus, &crtc_state->mode);
 
+#ifdef CONFIG_HAS_IOPORT
 	/* Unblank (needed on S3 resume, vgabios doesn't do it then) */
 	outb(VGA_AR_ENABLE_DISPLAY, VGA_ATT_W);
+#endif
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 7bbe46a98ff1f449bc2af30686585a00e9e8af93..116f58774135fc3a9f37d6d72d41340f5c812297 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -49,7 +49,7 @@ config DRM_XE
 
 config DRM_XE_DISPLAY
 	bool "Enable display support"
-	depends on DRM_XE && DRM_XE=m
+	depends on DRM_XE && DRM_XE=m && HAS_IOPORT
 	select FB_IOMEM_HELPERS
 	select I2C
 	select I2C_ALGOBIT

-- 
2.45.2

