Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 402C3A38B95
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 19:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7E010E5B0;
	Mon, 17 Feb 2025 18:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="cweJk9mI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011026.outbound.protection.outlook.com
 [52.103.68.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DEB10E5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 18:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXnbr5DK8FKSoyHn2hdUYyJKg59noRCOvdprm/jD+W9GHU/WPKjJcTS4TIWvpDAYNmaUe/9HDRIpI29F/vpX84pljqid5J9qHRoqaTjUu+ct38ClTvpLa6ABiu2Uo0490Zn/1ePC1pxbZDPtXsLbRXIrHvgHwOgD4L5OR7IE7fQxokHy/Jtbfe+OpgS7rKp4GnBZYVkOBK5eVnP+i81UJrgFjytmNAmCiJap7LkmCNUnERLfslcnmnp33370bl1C8XZqPO1+mO0ssuYOIaDKAC8/uWLJPTYraqmqDGIdDPjIGsh+MMxJYvgT1m4KyU4r7OOPId8AvgfJ2XP+nYeh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6Qn9ehu2xPykMinfdj26E61At6Hjl0kF4kqJH79VE0=;
 b=OU/uZWSlWDkhKL4ta8YpKsINnoLncTaEkJfUhCrcoE8K0SsWtMqeI7H6gnl38LdRVHi+Ux1ZZc0MxlCPPdb7mC9CQex/AaueaVbk1d/Qylt02Oz3qHhV/e0JKW2H8HKWFtcjTKZ7QUytb97lF8qXiENo2UGUlEbDoGfLSqL53tFw0zG8IXTosRtZv+9MLUIYMuEwZ9wS7fWCAmIRtgKHAp+yQpjEjsAX2FrnFef/rTFGaJW8p4m5p5U+5RL9IuRxz7ob2oeZA3jciNGiJL6rYVSYb3q5Uel5XYCibR9v7H9G/2HtbQmQA5jCuWRj1wOANNFBltzudJWfflG6plpx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6Qn9ehu2xPykMinfdj26E61At6Hjl0kF4kqJH79VE0=;
 b=cweJk9mItluHJOWGeHQAip84/uRt95f8sF2RMh3IlLw8rxlK+J1fBvYjCI8iQ5TDh4Hv5v5OgLlXOwGOE5PNF+N/0e2ICzv2eK14Co5wFHvCkomsnxbocT18a6WbC4GF3DwIPrE4Y9WjbFSHANeSW1cV/1xKizuvV8yltoreU6QkjZ0cHlUXpCzY+ErPSR/NbZoDOU44KJTTivCwVHmNIoJ1Xp/D5zjTfNlznWGchhyabt91qBbnze5bQwBPH6aw0P7M9fNCRJXRIdDZ4J2CZoYZko2mtrTyJH9uNhnn+xrIVsTDKDw2xwnwLllVK5nHJU1XvmJ4hlPVPI1+CluQZQ==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PR01MB4457.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:11::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Mon, 17 Feb
 2025 18:52:48 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 18:52:48 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Index: AQHbgW0j4SMdiswUREqfUMya4pSK2g==
Date: Mon, 17 Feb 2025 18:52:48 +0000
Message-ID: <F16BB9EB-632C-4BC4-A8BA-492BF32E43C1@live.com>
References: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
In-Reply-To: <4BAFD886-84E0-4C4C-94B3-90BF911ED0E7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PR01MB4457:EE_
x-ms-office365-filtering-correlation-id: e2a53e79-679a-4773-9fef-08dd4f8445c0
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|7092599003|461199028|15080799006|12121999004|8062599003|8060799006|440099028|3412199025|102099032|41001999003|12091999003;
x-microsoft-antispam-message-info: =?us-ascii?Q?c4H1HoQAQt6N6EdkrxgUgF5g4ZiKcgBB7c+lYaquISoDda67iSz14Ldg+sQS?=
 =?us-ascii?Q?Vc7PMZ0tPa6+0RoPZKsJuX8hVqmcDaKyRo66yWhOOfKCpOX/F9//Y36lHWga?=
 =?us-ascii?Q?6HHIl6PNI014FmnW4bO2KG0IlChoVes9IxKXy5g+3+81A+QhALkcuOvij9IY?=
 =?us-ascii?Q?gKx/DRvQodsA7SNbvroXbhy7F4StiEOcFN2vq0PsZ8LNpCqqROzO2O9vy4Ag?=
 =?us-ascii?Q?NXWHeAvkqqQ1svcYqXbB/jKFFRE9UEUgXz/YDk+S5AkouvvV5PuUk0KuD3CO?=
 =?us-ascii?Q?cH6L22lfxijW9oy6B6XWIM33X9cFP3VYIrjQd0dXFC1EUxv/OGV8xRYwWTnY?=
 =?us-ascii?Q?qgmUopWowJPovIRNi2vmrltgfGeFm238+iTIz1EDS/4F9vXIdFSlTT7u6Guf?=
 =?us-ascii?Q?zZt/xs1jz2ms2XULBB1mhZy7VuJJLDWEdrOsZXY06l5JA7z5oPnhT+HHdVRX?=
 =?us-ascii?Q?zFNPYkmsX1150Ez2GjJguwKhq+zNp9fj9W1sj8AHpgvJMUUauLVr5ThWqKJt?=
 =?us-ascii?Q?+6NUc4Z4jLI1nREfc2AY6lM1kET0AQRWKPViS3s8Jt7AkmpQfdhrcwl0FmSI?=
 =?us-ascii?Q?NlKBumQ+50JXhoOZvQzoL24tSK0nHyYjIoTXNtd9yx0qFeRtJSyNMHONsK7Q?=
 =?us-ascii?Q?hVfdBmWQkx/7UW/sEUBTaVpvkb5u6v1XeIyGoAoVezCNp5tdYzLGgLgzmUVb?=
 =?us-ascii?Q?DJ+zgfv+n0+6P0Gj6UOhh90Z2MYYFYcKTMWbVef1OyWQ4uUMpwAjTJty8sv0?=
 =?us-ascii?Q?dA9ndNuuBdZSOVlI0AhfK6XRlgYd4ELeFI+tJ/PQIO9QvB+gX8uH0+XWVp0J?=
 =?us-ascii?Q?wdh+XuSeBtQgIGfba2tcPmVQSZN/dyD5tHMmAgPLVQw5sUY7lKAw+nA0dIVY?=
 =?us-ascii?Q?59q4HyxzbQ9WfxI2GqcTlsP4yn9b1qiLAyEiTGGn7c2C01coM9bHYKR/Z/HF?=
 =?us-ascii?Q?FefnLasEK5KJcjBKAHcMRUugFNtEcqs6XNTYrEaqgQsID3WzN0CZwQawI7kF?=
 =?us-ascii?Q?tjniwpP4PRDtSXafrtyyyJuYb6HPZIdjFAUUCZtaumnni1LOYjdxNRT1LEJT?=
 =?us-ascii?Q?SlmquOa2NkJEdjq/dXHB8Q+w/1I+IU4TZxtlnEdJxvlLzVCwwMTV41S34SbD?=
 =?us-ascii?Q?b37tM+oIiCPWRtgFkxbtyC4zwbf9tWhkBfiTPHmBVMIytWWD22OU9QU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?38euEszdkjB6ve5TSfy2hnhEgp3j+BTvYKrjn4m/zo8/jGY/b83Dbm120P3B?=
 =?us-ascii?Q?semD3OMzijuFqxb2DsQPSZT8RVihh+9RISGyzzW7TdNozq5tEXSOgXdY97Hx?=
 =?us-ascii?Q?nVnSExXwKadegeXBDLqCLMoh8J7BsFIpbtcnfEBJp/9wEy6lKBSX+Jw8N96O?=
 =?us-ascii?Q?J5aaCkh3VwkW6CiDMIXFKIZgOkYIHaH0ZdXlZ1+Jk1SYOl/7z583GBfQeaXO?=
 =?us-ascii?Q?Mz6yANITMGOYLTwKXDBcnq6xsuixqDJ4tpVH4JHyu4xeHT/TdYTdULSxNNLj?=
 =?us-ascii?Q?LSMHDgPN/GUx8LKHLTfEnGuh2EA3RU7l7I1gtHGArcn93paLz/s1+LUEfuSp?=
 =?us-ascii?Q?BVzTJYkaHEuCDON53ksXAqij5G2gXLav2+HnOOiIyi8vFWEsWphQqgM84oLq?=
 =?us-ascii?Q?AmM8GPk+n7KBtfXQcCWgkRszWPBhm8lyunPvDZB8W4aN41LklCWdiEGSJUHG?=
 =?us-ascii?Q?sq/JRD0hkdm0e/TkHYXLe3lnsDiCIt3ddhhVExmrgsif5hlMa+B/xU51nqGs?=
 =?us-ascii?Q?CIhyo4kKGL+v1V78OTGB7L7T30Hot0z2pIBksQI2vGjwir4k50C+5KvUB9tS?=
 =?us-ascii?Q?4wyXPilOemzKtusRGhi8h7ekQpnOikjLwJIPgoo++wJgPQ7pDuayysL+DzmY?=
 =?us-ascii?Q?T+eCxaDRg0UbH9+3w/JFeCn69GjXvQgeedafp9Y0q/Xw9hvrF5dpStKxxQur?=
 =?us-ascii?Q?SJtt3MbKHzWhVS1oeLmaVp+u+zu5qzXT90Q+5MrFZ/NYo5/DdHV/0Bqq2PhR?=
 =?us-ascii?Q?B2BxcGamRb3ib56GawU4IJKENd4rSTs0AEqoxEC7nizvSS7Bd0nBtpYjh0gb?=
 =?us-ascii?Q?sKzXWM0Rr4YIg33MFbzHqTpgsFhnHvaKnKs+4A6PjlD72RHv3a7IltGN2ULN?=
 =?us-ascii?Q?eQN53f0Jk17ddaGZo2+o1XACTeqYS1ErzmnUmRVb8nROzwD/LxB1jStgkrDy?=
 =?us-ascii?Q?zap4ihVbjc8Nsw/cCopr4nBQ20oPn7XQAHVvD0EbEtBKsvrJ1aVMvFBpf7Fr?=
 =?us-ascii?Q?sFTp5a1PEWO6WmT4+SrrRQVG66k7h8F9SXk0a21nAUmRLbB/Zx9gC9X/08vt?=
 =?us-ascii?Q?QZeFpSv7jbERzuVINes1pzMMAQOBDEyXZEPeYjJbmYuAWaz72YSgKWD4tjQV?=
 =?us-ascii?Q?cMzKv7o29FZVeBDuF4O0fMMgETy+VPx6vhApP1Wd4O/FwvQWgbutOEILrJGT?=
 =?us-ascii?Q?B27ZaKTI2FKCGyBmyq0Tms7f63kK2qzWr4jmA2yq7kEepYFH1VO1+d6pIMXY?=
 =?us-ascii?Q?qzN0N30+93ug9i4FxJhVHsqrYQQVEndyf1nEMlyExC9yvhSvzvNkfnilTi5c?=
 =?us-ascii?Q?C5MBgMR41G6FOYsPgcZtBIoJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <33535CF447888045B990D68A9FC8CCDF@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a53e79-679a-4773-9fef-08dd4f8445c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2025 18:52:48.0715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4457
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

From: Kerem Karabay <kekrby@gmail.com>

The Touch Bars found on x86 Macs support two USB configurations: one
where the device presents itself as a HID keyboard and can display
predefined sets of keys, and one where the operating system has full
control over what is displayed.

This commit adds support for the display functionality of the second
configuration. Functionality for the first configuration has been
merged in the HID tree.

Note that this driver has only been tested on T2 Macs, and only includes
the USB device ID for these devices. Testing on T1 Macs would be
appreciated.

Credit goes to @imbushuo on GitHub for reverse engineering most of the
protocol.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Atharva Tiwari <evepolonium@gmail.com>
Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/gpu/drm/tiny/Kconfig      |  13 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c | 702 ++++++++++++++++++++++++++++++
 3 files changed, 716 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94cbdb133..76d1a2f9f 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+config DRM_APPLETBDRM
+	tristate "DRM support for Apple Touch Bars"
+	depends on DRM && USB && MMU
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select HID_APPLETB_BL
+	help
+	  Say Y here if you want support for the display of Touch Bars on x86
+	  MacBook Pros.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called appletbdrm.
+
 config DRM_ARCPGU
 	tristate "ARC PGU"
 	depends on DRM && OF
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 60816d2eb..0a3a7837a 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+obj-$(CONFIG_DRM_APPLETBDRM)		+=3D appletbdrm.o
 obj-$(CONFIG_DRM_ARCPGU)		+=3D arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+=3D bochs.o
 obj-$(CONFIG_DRM_CIRRUS_QEMU)		+=3D cirrus-qemu.o
diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/apple=
tbdrm.c
new file mode 100644
index 000000000..f056f6280
--- /dev/null
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -0,0 +1,702 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Touch Bar DRM Driver
+ *
+ * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/unaligned.h>
+#include <linux/usb.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_format_helper.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_plane.h>
+#include <drm/drm_probe_helper.h>
+
+#define __APPLETBDRM_MSG_STR4(str4)	((__le32 __force)((str4[0] << 24) | (s=
tr4[1] << 16) | (str4[2] << 8) | str4[3]))
+#define __APPLETBDRM_MSG_TOK4(tok4)	__APPLETBDRM_MSG_STR4(#tok4)
+
+#define APPLETBDRM_PIXEL_FORMAT		__APPLETBDRM_MSG_TOK4(RGBA) /* The actual=
 format is BGR888 */
+#define APPLETBDRM_BITS_PER_PIXEL	24
+
+#define APPLETBDRM_MSG_CLEAR_DISPLAY	__APPLETBDRM_MSG_TOK4(CLRD)
+#define APPLETBDRM_MSG_GET_INFORMATION	__APPLETBDRM_MSG_TOK4(GINF)
+#define APPLETBDRM_MSG_UPDATE_COMPLETE	__APPLETBDRM_MSG_TOK4(UDCL)
+#define APPLETBDRM_MSG_SIGNAL_READINESS	__APPLETBDRM_MSG_TOK4(REDY)
+
+#define APPLETBDRM_BULK_MSG_TIMEOUT	1000
+
+#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, dr=
m)
+#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dev=
))
+
+struct appletbdrm_msg_request_header {
+	__le16 unk_00;
+	__le16 unk_02;
+	__le32 unk_04;
+	__le32 unk_08;
+	__le32 size;
+} __packed;
+
+struct appletbdrm_msg_response_header {
+	u8 unk_00[16];
+	__le32 msg;
+} __packed;
+
+struct appletbdrm_msg_simple_request {
+	struct appletbdrm_msg_request_header header;
+	__le32 msg;
+	u8 unk_14[8];
+	__le32 size;
+} __packed;
+
+struct appletbdrm_msg_information {
+	struct appletbdrm_msg_response_header header;
+	u8 unk_14[12];
+	__le32 width;
+	__le32 height;
+	u8 bits_per_pixel;
+	__le32 bytes_per_row;
+	__le32 orientation;
+	__le32 bitmap_info;
+	__le32 pixel_format;
+	__le32 width_inches;	/* floating point */
+	__le32 height_inches;	/* floating point */
+} __packed;
+
+struct appletbdrm_frame {
+	__le16 begin_x;
+	__le16 begin_y;
+	__le16 width;
+	__le16 height;
+	__le32 buf_size;
+	u8 buf[];
+} __packed;
+
+struct appletbdrm_fb_request_footer {
+	u8 unk_00[12];
+	__le32 unk_0c;
+	u8 unk_10[12];
+	__le32 unk_1c;
+	__le64 timestamp;
+	u8 unk_28[12];
+	__le32 unk_34;
+	u8 unk_38[20];
+	__le32 unk_4c;
+} __packed;
+
+struct appletbdrm_fb_request {
+	struct appletbdrm_msg_request_header header;
+	__le16 unk_10;
+	u8 msg_id;
+	u8 unk_13[29];
+	/*
+	 * Contents of `data`:
+	 * - struct appletbdrm_frame frames[];
+	 * - struct appletbdrm_fb_request_footer footer;
+	 * - padding to make the total size a multiple of 16
+	 */
+	u8 data[];
+} __packed;
+
+struct appletbdrm_fb_request_response {
+	struct appletbdrm_msg_response_header header;
+	u8 unk_14[12];
+	__le64 timestamp;
+} __packed;
+
+struct appletbdrm_device {
+	struct device *dev;
+
+	unsigned int in_ep;
+	unsigned int out_ep;
+
+	unsigned int width;
+	unsigned int height;
+
+	struct drm_device drm;
+	struct drm_display_mode mode;
+	struct drm_connector connector;
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+};
+
+static int appletbdrm_send_request(struct appletbdrm_device *adev,
+				   struct appletbdrm_msg_request_header *request, size_t size)
+{
+	struct usb_device *udev =3D adev_to_udev(adev);
+	struct drm_device *drm =3D &adev->drm;
+	int ret, actual_size;
+
+	ret =3D usb_bulk_msg(udev, usb_sndbulkpipe(udev, adev->out_ep),
+			   request, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
+	if (ret) {
+		drm_err(drm, "Failed to send message (%d)\n", ret);
+		return ret;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int appletbdrm_read_response(struct appletbdrm_device *adev,
+				    struct appletbdrm_msg_response_header *response,
+				    size_t size, u32 expected_response)
+{
+	struct usb_device *udev =3D adev_to_udev(adev);
+	struct drm_device *drm =3D &adev->drm;
+	int ret, actual_size;
+	bool readiness_signal_received =3D false;
+
+retry:
+	ret =3D usb_bulk_msg(udev, usb_rcvbulkpipe(udev, adev->in_ep),
+			   response, size, &actual_size, APPLETBDRM_BULK_MSG_TIMEOUT);
+	if (ret) {
+		drm_err(drm, "Failed to read response (%d)\n", ret);
+		return ret;
+	}
+
+	/*
+	 * The device responds to the first request sent in a particular
+	 * timeframe after the USB device configuration is set with a readiness
+	 * signal, in which case the response should be read again
+	 */
+	if (response->msg =3D=3D APPLETBDRM_MSG_SIGNAL_READINESS) {
+		if (!readiness_signal_received) {
+			readiness_signal_received =3D true;
+			goto retry;
+		}
+
+		drm_err(drm, "Encountered unexpected readiness signal\n");
+		return -EIO;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EIO;
+	}
+
+	if (response->msg !=3D expected_response) {
+		drm_err(drm, "Unexpected response from device (expected %p4ch found %p4c=
h)\n",
+			&expected_response, &response->msg);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int appletbdrm_send_msg(struct appletbdrm_device *adev, u32 msg)
+{
+	struct appletbdrm_msg_simple_request *request;
+	int ret;
+
+	request =3D kzalloc(sizeof(*request), GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+
+	request->header.unk_00 =3D cpu_to_le16(2);
+	request->header.unk_02 =3D cpu_to_le16(0x1512);
+	request->header.size =3D cpu_to_le32(sizeof(*request) - sizeof(request->h=
eader));
+	request->msg =3D msg;
+	request->size =3D request->header.size;
+
+	ret =3D appletbdrm_send_request(adev, &request->header, sizeof(*request))=
;
+
+	kfree(request);
+
+	return ret;
+}
+
+static int appletbdrm_clear_display(struct appletbdrm_device *adev)
+{
+	return appletbdrm_send_msg(adev, APPLETBDRM_MSG_CLEAR_DISPLAY);
+}
+
+static int appletbdrm_signal_readiness(struct appletbdrm_device *adev)
+{
+	return appletbdrm_send_msg(adev, APPLETBDRM_MSG_SIGNAL_READINESS);
+}
+
+static int appletbdrm_get_information(struct appletbdrm_device *adev)
+{
+	struct appletbdrm_msg_information *info;
+	struct drm_device *drm =3D &adev->drm;
+	u8 bits_per_pixel;
+	u32 pixel_format;
+	int ret;
+
+	info =3D kzalloc(sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret =3D appletbdrm_send_msg(adev, APPLETBDRM_MSG_GET_INFORMATION);
+	if (ret)
+		return ret;
+
+	ret =3D appletbdrm_read_response(adev, &info->header, sizeof(*info),
+				       APPLETBDRM_MSG_GET_INFORMATION);
+	if (ret)
+		goto free_info;
+
+	bits_per_pixel =3D info->bits_per_pixel;
+	pixel_format =3D get_unaligned(&info->pixel_format);
+
+	adev->width =3D get_unaligned_le32(&info->width);
+	adev->height =3D get_unaligned_le32(&info->height);
+
+	if (bits_per_pixel !=3D APPLETBDRM_BITS_PER_PIXEL) {
+		drm_err(drm, "Encountered unexpected bits per pixel value (%d)\n", bits_=
per_pixel);
+		ret =3D -EINVAL;
+		goto free_info;
+	}
+
+	if (pixel_format !=3D APPLETBDRM_PIXEL_FORMAT) {
+		drm_err(drm, "Encountered unknown pixel format (%p4ch)\n", &pixel_format=
);
+		ret =3D -EINVAL;
+		goto free_info;
+	}
+
+free_info:
+	kfree(info);
+
+	return ret;
+}
+
+static u32 rect_size(struct drm_rect *rect)
+{
+	return drm_rect_width(rect) * drm_rect_height(rect) * (APPLETBDRM_BITS_PE=
R_PIXEL / 8);
+}
+
+static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
+				   struct drm_plane_state *old_state,
+				   struct drm_plane_state *state)
+{
+	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane=
_state(state);
+	struct appletbdrm_fb_request_response *response;
+	struct appletbdrm_fb_request_footer *footer;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_framebuffer *fb =3D state->fb;
+	struct appletbdrm_fb_request *request;
+	struct drm_device *drm =3D &adev->drm;
+	struct appletbdrm_frame *frame;
+	u64 timestamp =3D ktime_get_ns();
+	struct drm_rect damage;
+	size_t frames_size =3D 0;
+	size_t request_size;
+	int ret;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		frames_size +=3D struct_size(frame, buf, rect_size(&damage));
+	}
+
+	if (!frames_size)
+		return 0;
+
+	request_size =3D ALIGN(sizeof(*request) + frames_size + sizeof(*footer), =
16);
+
+	request =3D kzalloc(request_size, GFP_KERNEL);
+	if (!request)
+		return -ENOMEM;
+
+	response =3D kzalloc(sizeof(*response), GFP_KERNEL);
+	if (!response) {
+		ret =3D -ENOMEM;
+		goto free_request;
+	}
+
+	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret) {
+		drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
+		goto free_response;
+	}
+
+	request->header.unk_00 =3D cpu_to_le16(2);
+	request->header.unk_02 =3D cpu_to_le16(0x12);
+	request->header.unk_04 =3D cpu_to_le32(9);
+	request->header.size =3D cpu_to_le32(request_size - sizeof(request->heade=
r));
+	request->unk_10 =3D cpu_to_le16(1);
+	request->msg_id =3D timestamp & 0xff;
+
+	frame =3D (struct appletbdrm_frame *)request->data;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR(frame->buf);
+		u32 buf_size =3D rect_size(&damage);
+
+		/*
+		 * The coordinates need to be translated to the coordinate
+		 * system the device expects, see the comment in
+		 * appletbdrm_setup_mode_config
+		 */
+		frame->begin_x =3D cpu_to_le16(damage.y1);
+		frame->begin_y =3D cpu_to_le16(adev->height - damage.x2);
+		frame->width =3D cpu_to_le16(drm_rect_height(&damage));
+		frame->height =3D cpu_to_le16(drm_rect_width(&damage));
+		frame->buf_size =3D cpu_to_le32(buf_size);
+
+		ret =3D drm_fb_blit(&dst, NULL, DRM_FORMAT_BGR888,
+				  &shadow_plane_state->data[0], fb, &damage, &shadow_plane_state->fmtc=
nv_state);
+		if (ret) {
+			drm_err(drm, "Failed to copy damage clip (%d)\n", ret);
+			goto end_fb_cpu_access;
+		}
+
+		frame =3D (void *)frame + struct_size(frame, buf, buf_size);
+	}
+
+	footer =3D (struct appletbdrm_fb_request_footer *)&request->data[frames_s=
ize];
+
+	footer->unk_0c =3D cpu_to_le32(0xfffe);
+	footer->unk_1c =3D cpu_to_le32(0x80001);
+	footer->unk_34 =3D cpu_to_le32(0x80002);
+	footer->unk_4c =3D cpu_to_le32(0xffff);
+	footer->timestamp =3D cpu_to_le64(timestamp);
+
+	ret =3D appletbdrm_send_request(adev, &request->header, request_size);
+	if (ret)
+		goto end_fb_cpu_access;
+
+	ret =3D appletbdrm_read_response(adev, &response->header, sizeof(*respons=
e),
+				       APPLETBDRM_MSG_UPDATE_COMPLETE);
+	if (ret)
+		goto end_fb_cpu_access;
+
+	if (response->timestamp !=3D footer->timestamp) {
+		drm_err(drm, "Response timestamp (%llu) doesn't match request timestamp =
(%llu)\n",
+			le64_to_cpu(response->timestamp), timestamp);
+		goto end_fb_cpu_access;
+	}
+
+end_fb_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+free_response:
+	kfree(response);
+free_request:
+	kfree(request);
+
+	return ret;
+}
+
+static int appletbdrm_connector_helper_get_modes(struct drm_connector *con=
nector)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(connector->dev);
+
+	return drm_connector_helper_get_modes_fixed(connector, &adev->mode);
+}
+
+static const u32 appletbdrm_primary_plane_formats[] =3D {
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB8888, /* emulated */
+};
+
+static int appletbdrm_primary_plane_helper_atomic_check(struct drm_plane *=
plane,
+						   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state =3D drm_atomic_get_new_plane_stat=
e(state, plane);
+	struct drm_crtc *new_crtc =3D new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state =3D NULL;
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state =3D drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret =3D drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_sta=
te,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	return 0;
+}
+
+static void appletbdrm_primary_plane_helper_atomic_update(struct drm_plane=
 *plane,
+						     struct drm_atomic_state *old_state)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(plane->dev);
+	struct drm_device *drm =3D plane->dev;
+	struct drm_plane_state *plane_state =3D plane->state;
+	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_stat=
e(old_state, plane);
+	int idx;
+
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
+	appletbdrm_flush_damage(adev, old_plane_state, plane_state);
+
+	drm_dev_exit(idx);
+}
+
+static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper=
_funcs =3D {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check =3D appletbdrm_primary_plane_helper_atomic_check,
+	.atomic_update =3D appletbdrm_primary_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs appletbdrm_primary_plane_funcs =3D {
+	.update_plane =3D drm_atomic_helper_update_plane,
+	.disable_plane =3D drm_atomic_helper_disable_plane,
+	.destroy =3D drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
+};
+
+static enum drm_mode_status appletbdrm_crtc_helper_mode_valid(struct drm_c=
rtc *crtc,
+							  const struct drm_display_mode *mode)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(crtc->dev);
+
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &adev->mode);
+}
+
+static void appletbdrm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *crtc_state)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(crtc->dev);
+	int idx;
+
+	if (!drm_dev_enter(&adev->drm, &idx))
+		return;
+
+	appletbdrm_clear_display(adev);
+
+	drm_dev_exit(idx);
+}
+
+static const struct drm_mode_config_funcs appletbdrm_mode_config_funcs =3D=
 {
+	.fb_create =3D drm_gem_fb_create_with_dirty,
+	.atomic_check =3D drm_atomic_helper_check,
+	.atomic_commit =3D drm_atomic_helper_commit,
+};
+
+static const struct drm_connector_funcs appletbdrm_connector_funcs =3D {
+	.reset =3D drm_atomic_helper_connector_reset,
+	.destroy =3D drm_connector_cleanup,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
+	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
+};
+
+static const struct drm_connector_helper_funcs appletbdrm_connector_helper=
_funcs =3D {
+	.get_modes =3D appletbdrm_connector_helper_get_modes,
+};
+
+static const struct drm_crtc_helper_funcs appletbdrm_crtc_helper_funcs =3D=
 {
+	.mode_valid =3D appletbdrm_crtc_helper_mode_valid,
+	.atomic_disable =3D appletbdrm_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs appletbdrm_crtc_funcs =3D {
+	.reset =3D drm_atomic_helper_crtc_reset,
+	.destroy =3D drm_crtc_cleanup,
+	.set_config =3D drm_atomic_helper_set_config,
+	.page_flip =3D drm_atomic_helper_page_flip,
+	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs appletbdrm_encoder_funcs =3D {
+	.destroy =3D drm_encoder_cleanup,
+};
+
+DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
+
+static const struct drm_driver appletbdrm_drm_driver =3D {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.name			=3D "appletbdrm",
+	.desc			=3D "Apple Touch Bar DRM Driver",
+	.date			=3D "20230910",
+	.major			=3D 1,
+	.minor			=3D 0,
+	.driver_features	=3D DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
+	.fops			=3D &appletbdrm_drm_fops,
+};
+
+static int appletbdrm_setup_mode_config(struct appletbdrm_device *adev)
+{
+	struct drm_connector *connector =3D &adev->connector;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_encoder *encoder;
+	struct drm_device *drm =3D &adev->drm;
+	struct device *dev =3D adev->dev;
+	int ret;
+
+	ret =3D drmm_mode_config_init(drm);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize mode configuration\=
n");
+
+	primary_plane =3D &adev->primary_plane;
+	ret =3D drm_universal_plane_init(drm, primary_plane, 0,
+				       &appletbdrm_primary_plane_funcs,
+				       appletbdrm_primary_plane_formats,
+				       ARRAY_SIZE(appletbdrm_primary_plane_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize universal plane obj=
ect\n");
+	drm_plane_helper_add(primary_plane, &appletbdrm_primary_plane_helper_func=
s);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	crtc =3D &adev->crtc;
+	ret =3D drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					&appletbdrm_crtc_funcs, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize CRTC object\n");
+	drm_crtc_helper_add(crtc, &appletbdrm_crtc_helper_funcs);
+
+	encoder =3D &adev->encoder;
+	ret =3D drm_encoder_init(drm, encoder, &appletbdrm_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize encoder\n");
+	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
+
+	/*
+	 * The coordinate system used by the device is different from the
+	 * coordinate system of the framebuffer in that the x and y axes are
+	 * swapped, and that the y axis is inverted; so what the device reports
+	 * as the height is actually the width of the framebuffer and vice
+	 * versa
+	 */
+	drm->mode_config.min_width =3D 0;
+	drm->mode_config.min_height =3D 0;
+	drm->mode_config.max_width =3D max(adev->height, DRM_SHADOW_PLANE_MAX_WID=
TH);
+	drm->mode_config.max_height =3D max(adev->width, DRM_SHADOW_PLANE_MAX_HEI=
GHT);
+	drm->mode_config.preferred_depth =3D APPLETBDRM_BITS_PER_PIXEL;
+	drm->mode_config.funcs =3D &appletbdrm_mode_config_funcs;
+
+	adev->mode =3D (struct drm_display_mode) {
+		DRM_MODE_INIT(60, adev->height, adev->width,
+			      DRM_MODE_RES_MM(adev->height, 218),
+			      DRM_MODE_RES_MM(adev->width, 218))
+	};
+
+	ret =3D drm_connector_init(drm, connector,
+				 &appletbdrm_connector_funcs, DRM_MODE_CONNECTOR_USB);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize connector\n");
+
+	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
+
+	ret =3D drm_connector_set_panel_orientation(connector,
+						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set panel orientation\n");
+
+	connector->display_info.non_desktop =3D true;
+	ret =3D drm_object_property_set_value(&connector->base,
+					    drm->mode_config.non_desktop_property, true);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to set non-desktop property\n");
+
+	ret =3D drm_connector_attach_encoder(connector, encoder);
+
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize simple display pipe=
\n");
+
+	drm_mode_config_reset(drm);
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
+
+	return 0;
+}
+
+static int appletbdrm_probe(struct usb_interface *intf,
+			    const struct usb_device_id *id)
+{
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+	struct device *dev =3D &intf->dev;
+	struct appletbdrm_device *adev;
+	int ret;
+
+	ret =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_o=
ut, NULL, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to find bulk endpoints\n");
+
+	adev =3D devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdr=
m_device, drm);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	adev->dev =3D dev;
+	adev->in_ep =3D bulk_in->bEndpointAddress;
+	adev->out_ep =3D bulk_out->bEndpointAddress;
+
+	usb_set_intfdata(intf, adev);
+
+	ret =3D appletbdrm_get_information(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get display information\n");
+
+	ret =3D appletbdrm_signal_readiness(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to signal readiness\n");
+
+	ret =3D appletbdrm_clear_display(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to clear display\n");
+
+	return appletbdrm_setup_mode_config(adev);
+}
+
+static void appletbdrm_disconnect(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
+	struct drm_device *drm =3D &adev->drm;
+
+	drm_dev_unplug(drm);
+	drm_atomic_helper_shutdown(drm);
+}
+
+static void appletbdrm_shutdown(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
+
+	/*
+	 * The framebuffer needs to be cleared on shutdown since its content
+	 * persists across boots
+	 */
+	drm_atomic_helper_shutdown(&adev->drm);
+}
+
+static const struct usb_device_id appletbdrm_usb_id_table[] =3D {
+	{ USB_DEVICE_INTERFACE_CLASS(0x05ac, 0x8302, USB_CLASS_AUDIO_VIDEO) },
+	{}
+};
+MODULE_DEVICE_TABLE(usb, appletbdrm_usb_id_table);
+
+static struct usb_driver appletbdrm_usb_driver =3D {
+	.name		=3D "appletbdrm",
+	.probe		=3D appletbdrm_probe,
+	.disconnect	=3D appletbdrm_disconnect,
+	.shutdown	=3D appletbdrm_shutdown,
+	.id_table	=3D appletbdrm_usb_id_table,
+};
+module_usb_driver(appletbdrm_usb_driver);
+
+MODULE_AUTHOR("Kerem Karabay <kekrby@gmail.com>");
+MODULE_DESCRIPTION("Apple Touch Bar DRM Driver");
+MODULE_LICENSE("GPL");
--=20
2.43.0

