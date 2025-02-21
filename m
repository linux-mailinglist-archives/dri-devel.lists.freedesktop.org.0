Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF89BA3F311
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 12:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1D710EA54;
	Fri, 21 Feb 2025 11:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="NIO2z3tG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011037.outbound.protection.outlook.com
 [52.103.68.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2710EA54
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 11:38:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9d/IPttiadWiS4gsWUiYXuNbj9WuQ3swjW1cKLOospnnmHmtRP3lIxrDEHp7BAXEFanAGRL3UHkgpboFVfVSuLwELzLMTa8bTXHWvh0roacUSuqb5Iwf+daRhi+1+gtJT3krcXybY/f7b+oy/IMvQeA+GibSGrAPVho7DR/oa2upn/mTzk1wj1twildj8fO+1tV514iMnNBUJaOUumK7jK3GnPaV4tSYT7qduWTdYCm5IJuedlYSHEBXKtVuSSe7DeJUn58EfK5k2KMHD36mEn6u8ROTNuVFL0ewAJ9SDkyrpTjod8TltHI1mPSTTecgD5c2cGvvCWCCb7yBB/7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2k5zCvwqyOOz11llCzBmntKwQ/marnl1k0i/LvvSNgU=;
 b=YwxdI6mCJWZhzCb00h7DbTLQF40rglQvgX7PVaBNNf4xqJQ2oPoIj2GNRJbVIRvkEVsxc29KuaWiHmGaAx51lGTGhr/aLNNXklhL6nQyijcWr1CSgLF7wJFc1NV1BR7X/saubzb+ZrSLMOIHikd74AK02arQ+47P0pkRCWQI4fOvlhiW76CfkbsYQfQ/iVWP8TjqaJs/0VhPAQCdO5hpS8obxRzvygeesaQkUBSTzutWBb6GoHRSAYEZk+u3YtSyXRv6W5uom562RhANuVJ59GQJJQXzc4w/Ef/5oMsJKK9p+Cgky0C1RuXQ/LNqgDaKvEk4bDIVfFNcbe5awdbqSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2k5zCvwqyOOz11llCzBmntKwQ/marnl1k0i/LvvSNgU=;
 b=NIO2z3tGFd5wePraoFrXUSvQJIRhqOnGXIHt0FHPrg5SA7Ytd/uGsbjLVnridMOhUgRHhwnhIzqoH09cyQxDN4oBRpiORRmQz/EG1Ah9+m11K7d4KNJzdCk8tAfdB5CWlkOMY57PTotZLCzUlcNS3TTIK8SEOe13plHMJeP3BS4vWPirjhsntOSKP1kTVJCiD0m3tF7BouCxseBWwnD3QiiBomj2txCXNV0/mc6hNIK/g2rdH90420VSAaiCPS5buCvv+x+d1jevokLRpCUIZ+6q7brh1XAw3qCSPjskkm59WYe0aR4XYi+Uv8ZcLthFmlIcnfP/bmfAQRAdqUj+ag==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by MA0PR01MB10284.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 11:37:57 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 11:37:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>, "linux@rasmusvillemoes.dk"
 <linux@rasmusvillemoes.dk>, "senozhatsky@chromium.org"
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
CC: Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Atharva Tiwari
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhFUNHlw/FROyp0uigtAT/tjzfA==
Date: Fri, 21 Feb 2025 11:37:57 +0000
Message-ID: <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
In-Reply-To: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|MA0PR01MB10284:EE_
x-ms-office365-filtering-correlation-id: b3e924ef-cedc-4939-8e97-08dd526c3023
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|12121999004|19110799003|15080799006|461199028|8060799006|7092599003|4302099013|440099028|10035399004|3412199025|41001999003|12091999003|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?GsQqayPSipeKHl7jNNphs5tRhjOFPOpE2YE4A2HZInRUUzA+NVkiKloW3ZwH?=
 =?us-ascii?Q?kTjFbLWjOUSwQqGUArNz+FuyNy1cowqxcpJ/kVavCOvebI2tY0xdQ/rBBHzR?=
 =?us-ascii?Q?yjq5E4Ss8BuO9CtPCLvBe81Su2gt3x2Bl1RK/Ov8d5b73h992UjkOYR0OxIm?=
 =?us-ascii?Q?8ygIcaiChuZdvR4Gw87uH9zxhpqM6stRe5xcxAyIGFftKrjFET/e4KLJd0qE?=
 =?us-ascii?Q?zh/kpw7d1U+G+4Bnel9JegOLctXTPgJnGkT8o3Nofmt6SpYAwTXJgqHjPFcn?=
 =?us-ascii?Q?66C1qGPDyEA4gBorCZr/FgOGIKdJPuM5CarDw8L3UDIXziEo1FPRTY6e0wHN?=
 =?us-ascii?Q?HKEe1a22grh9gteXR26Xbi4OqVbI0KdCkos1i9pLVr1FXlUJi2tlo6VkKqvm?=
 =?us-ascii?Q?hMZu96clyO1N0Zbm4BUXNQxqULr88hM7QF+Hp29TwY8laeZ1cOeL7Bd9+lxm?=
 =?us-ascii?Q?A8SjGLiuu0Q3Vz27Gm408FDcky7Xddmb3pkivo7XtWpNxuYSbvci+KSSvXWm?=
 =?us-ascii?Q?O1j0SUv50HB/NAo6inPfLlnOaWxcusQI4VC9C1piE1dDpNcvQkhXuvz2PVem?=
 =?us-ascii?Q?QAcT8AD354rdUYWQM0jclCF0eSWVbCOcG9ChsrxViV7hkpACp2CVPiPFPEtD?=
 =?us-ascii?Q?NIDB5Ll2rgQJZQhsonaU2bvxnj758nQ4wHvFg8Yppc9jATraj1UE8tp7uJDo?=
 =?us-ascii?Q?8WhS2xosY8OQCNZq37RHTIB0IZhaUIh+pSDZcTOTSTDQnATYd4ZaYa5yp1rV?=
 =?us-ascii?Q?2RjltBI5cRaao5Mxeqs/jeFD9agCKvAZJkgg6lAgDbWWMxqV9ELi0arASX5A?=
 =?us-ascii?Q?SKNexat/59QRWP4LOrqNgZc8XEiDFgY7C3qxzxjP5PG9pQKDZHO6KYaaO+qg?=
 =?us-ascii?Q?SAjEQWZzAGmrzd6Al8bczwDJ/qNlo01eHQup4V4VFR5BOqJh3lJTKJIhWJ5R?=
 =?us-ascii?Q?0yC01XKFa9itbbKVeOTV7mp2JiYocRa8LSWFfDnyDwV1xYqEnA7JEWvd90I7?=
 =?us-ascii?Q?Csz3PmeE0MqYGF9s2s3LQjGDsqkmHTLYKiyqHDIgwxCV5fVI5g+GAVJPB7s/?=
 =?us-ascii?Q?MAsKT7nA7TavIoXUJWU2QBonexOBjLSYXfUW+c3KsTkLtzPVtn1obHnfeIOO?=
 =?us-ascii?Q?REIGQ3ScB8qhIhf9a8CLZ3AfgCY/egLQbsaeNuyKnzU+fIVnZgwr7Jn3Xwqv?=
 =?us-ascii?Q?WFh6GVNVP1MuVfKmKOFKUOSttd35bdK2SQUqHr2+RWAns7gK6SFespLzPFKT?=
 =?us-ascii?Q?HEY6ycHGNr5pUo86S1Xp1quRyazC78mVfsh4V3ApxCp8c4WcoUY9x3HZnnJL?=
 =?us-ascii?Q?gsk=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?si6/RA2LN8U35kwUp+Gskfv0hEGL/F3xqehoNNG5ro/ymseK+pqtvsY1vt7U?=
 =?us-ascii?Q?0Y/A661w6f/JJrcljLNnF0ooFno1knipktCuphywJ9+ORBbTMGxuxN3T5cfz?=
 =?us-ascii?Q?NhecF3+Su13KrFxJloe7A5bWDlff2tx34Mj1f265lqbcWy51kv+GzJB1/7V+?=
 =?us-ascii?Q?1pAyTngzaCjqi0HPuvmUaun3TwRKar5ZhJu3SRJCpFdIr6IOMAgxIA/6QxAG?=
 =?us-ascii?Q?QZdlx9s8XF/wx1VavZ2rJ+8hlLtv43u++9DrlMWOD0ya6cCfK10tHUPizruq?=
 =?us-ascii?Q?+JaoeXXBZ8Z21tLhmi/CL/jmQhOLaY/bd+8zLuaTMAGYsVg5BEBZNSK9pkyK?=
 =?us-ascii?Q?7jK8FsilspU9vO3ur18zKQhl2DbkKndiZvyWmKwpZ24ieqoShEkKSoQnWMs6?=
 =?us-ascii?Q?aoPbPfdm3oya0k5khfKgTImV7buFdQHHR1bvm7q31uk1favT5MIi2St9bYGt?=
 =?us-ascii?Q?lKhXrprinEFGSx8hN4VUv+D2gy4ygBMnd1EyXRyU1aZw/M+ra7igzpT19KG6?=
 =?us-ascii?Q?IBFtr1YdR1Hq9YUxsG/IwgSFELJKXQWp7QtDNMNDBBQac4kYbj7Ss76iGt1I?=
 =?us-ascii?Q?ZUauTAQpnMWjVDx0s94mO1rqvKjYVqBWLXjvMmgoSozm1IvMmYE2DBZUoNqG?=
 =?us-ascii?Q?o+Kjk+c8wzZGvNZNi7N6ycnKozTi/tuFuGOvAT9lEiusJVOF0w8fPWlM52kR?=
 =?us-ascii?Q?24VntPIYvbFtHJOiquq6n8qcU6Fuhy8YRu+mjeB/ZaxRKCFrdiMTcZRC2y6C?=
 =?us-ascii?Q?R+CLZkSQ4yYFPhqt+R9p8MD9qUfbJ6qp1SqAFhKHS733jRwB7iJ+onMIL41S?=
 =?us-ascii?Q?ovdNZAq9D0Bq9T8EFl6Rif/PShwIVkvoWyXYtISqpkF4J24D07c6Hjb8J96F?=
 =?us-ascii?Q?ulkFC+3Pz8Oj2Lo68wuaJAynqtwR0QGEBx5z1ZXe0xW9B1oc871q3jtSNbLV?=
 =?us-ascii?Q?o/XI7MFocqSA7ks5aOH6hi1NcJ+8x3cCTyBIMGhlCTFUCczm/p/y5RFEaRqg?=
 =?us-ascii?Q?Rckh8H1wRubDkY9YDYeY7RK0pV/YrGsxc+ixrN+CDu0miET9rYRVxnCIXvFk?=
 =?us-ascii?Q?gXcuzl5oK7DFpJSiXK9vQAqWnQtSUr1Hc3xhbZ8rqVGBl+nMYATJIx9IdQpg?=
 =?us-ascii?Q?vvmT7ZOAi2LYszyFL16jn7mVXnExELH5kKF/ExYKsPqy25Czt76wlGqBIZHI?=
 =?us-ascii?Q?9iDlb3YTw/rmUM+4aMrm65OY3P/aBJCbQALNFTPhpVNEYPyIpbvPJGUAxO6c?=
 =?us-ascii?Q?+nqMVGu378C4J5KeUyykyDAATANT16ForyexVY88U/mHzETzK6wF4CSSxvPX?=
 =?us-ascii?Q?ZQtFjWhI8IKG86fUXuxYGnuN?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E2D6E26D6D2E8F4993C810A8A7FA0E5B@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e924ef-cedc-4939-8e97-08dd526c3023
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2025 11:37:57.3915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB10284
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

Credit goes to Ben (Bingxing) Wang on GitHub [1] for reverse engineering
most of the protocol.

[1]: https://github.com/imbushuo/DFRDisplayKm

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Atharva Tiwari <evepolonium@gmail.com>
Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aun-Ali Zaidi <admin@kodeit.net>
---
v2 ->
- Add the driver to MAINTAINERS.
- Allocate memory for request and response in plane's atomic-check helper
- Void the use of drm_fb_blit()
- Implement atomic_disable
- Make PRIME work
- Remove the date field from struct drm_driver=20
- intersect damage with dst_clip
- Register DRM device in appletbdrm_probe
- Clear the display as the final call in probe
- Select hid_multitouch as well in kconfig

v3 ->
- Change commit message to credit Ben (Bingxing) Wang
 MAINTAINERS                       |   7 +
 drivers/gpu/drm/tiny/Kconfig      |  14 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c | 806 ++++++++++++++++++++++++++++++
 4 files changed, 828 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea5..43fafaab3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7148,6 +7148,13 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
=20
+DRM DRIVER FOR APPLE TOUCH BARS
+M:	Aun-Ali Zaidi <admin@kodeit.net>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/tiny/appletbdrm.c
+
 DRM DRIVER FOR ARM PL111 CLCD
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94cbdb133..25471791c 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+config DRM_APPLETBDRM
+	tristate "DRM support for Apple Touch Bars"
+	depends on DRM && USB && MMU
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
+	select HID_APPLETB_BL
+	select HID_MULTITOUCH
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
index 000000000..a17a3ecc3
--- /dev/null
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -0,0 +1,806 @@
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
+#include <drm/drm_framebuffer.h>
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
+	struct device *dmadev;
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
+struct appletbdrm_plane_state {
+	struct drm_shadow_plane_state base;
+	struct appletbdrm_fb_request *request;
+	struct appletbdrm_fb_request_response *response;
+	size_t request_size;
+	size_t frames_size;
+};
+
+static inline struct appletbdrm_plane_state *to_appletbdrm_plane_state(str=
uct drm_plane_state *state)
+{
+	return container_of(state, struct appletbdrm_plane_state, base.base);
+}
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
+	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_stat=
e(state, plane);
+	struct drm_crtc *new_crtc =3D new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state =3D NULL;
+	struct appletbdrm_plane_state *appletbdrm_state =3D to_appletbdrm_plane_s=
tate(new_plane_state);
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
+	size_t frames_size =3D 0;
+	size_t request_size;
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
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, new_plane_stat=
e);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		frames_size +=3D struct_size((struct appletbdrm_frame *)0, buf, rect_siz=
e(&damage));
+	}
+
+	if (!frames_size)
+		return 0;
+
+	request_size =3D ALIGN(sizeof(struct appletbdrm_fb_request) +
+		       frames_size +
+		       sizeof(struct appletbdrm_fb_request_footer), 16);
+
+	appletbdrm_state->request =3D kzalloc(request_size, GFP_KERNEL);
+
+	if (!appletbdrm_state->request)
+		return -ENOMEM;
+
+	appletbdrm_state->response =3D kzalloc(sizeof(*appletbdrm_state->response=
), GFP_KERNEL);
+
+	if (!appletbdrm_state->response)
+		return -ENOMEM;
+
+	appletbdrm_state->request_size =3D request_size;
+	appletbdrm_state->frames_size =3D frames_size;
+
+	return 0;
+}
+
+static int appletbdrm_flush_damage(struct appletbdrm_device *adev,
+				   struct drm_plane_state *old_state,
+				   struct drm_plane_state *state)
+{
+	struct appletbdrm_plane_state *appletbdrm_state =3D to_appletbdrm_plane_s=
tate(state);
+	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_plane=
_state(state);
+	struct appletbdrm_fb_request_response *response =3D appletbdrm_state->res=
ponse;
+	struct appletbdrm_fb_request_footer *footer;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_framebuffer *fb =3D state->fb;
+	struct appletbdrm_fb_request *request =3D appletbdrm_state->request;
+	struct drm_device *drm =3D &adev->drm;
+	struct appletbdrm_frame *frame;
+	u64 timestamp =3D ktime_get_ns();
+	struct drm_rect damage;
+	size_t frames_size =3D appletbdrm_state->frames_size;
+	size_t request_size =3D appletbdrm_state->request_size;
+	int ret;
+
+	if (!frames_size)
+		return 0;
+
+	ret =3D drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret) {
+		drm_err(drm, "Failed to start CPU framebuffer access (%d)\n", ret);
+		goto end_fb_cpu_access;
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
+		struct drm_rect dst_clip =3D state->dst;
+		struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR(frame->buf);
+		u32 buf_size =3D rect_size(&damage);
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
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
+		switch (fb->format->format) {
+		case DRM_FORMAT_XRGB8888:
+			drm_fb_xrgb8888_to_bgr888(&dst, NULL, &shadow_plane_state->data[0], fb,=
 &damage, &shadow_plane_state->fmtcnv_state);
+			break;
+		default:
+			drm_fb_memcpy(&dst, NULL, &shadow_plane_state->data[0], fb, &damage);
+			break;
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
+
+	return ret;
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
+static void appletbdrm_primary_plane_helper_atomic_disable(struct drm_plan=
e *plane,
+							   struct drm_atomic_state *state)
+{
+	struct drm_device *dev =3D plane->dev;
+	struct appletbdrm_device *adev =3D drm_to_adev(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	appletbdrm_clear_display(adev);
+
+	drm_dev_exit(idx);
+}
+
+static void appletbdrm_primary_plane_reset(struct drm_plane *plane)
+{
+	struct appletbdrm_plane_state *appletbdrm_state;
+
+	WARN_ON(plane->state);
+
+	appletbdrm_state =3D kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
+	if (!appletbdrm_state)
+		return;
+
+	__drm_gem_reset_shadow_plane(plane, &appletbdrm_state->base);
+}
+
+static struct drm_plane_state *appletbdrm_primary_plane_duplicate_state(st=
ruct drm_plane *plane)
+{
+	struct drm_shadow_plane_state *new_shadow_plane_state;
+	struct appletbdrm_plane_state *old_appletbdrm_state;
+	struct appletbdrm_plane_state *appletbdrm_state;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	old_appletbdrm_state =3D to_appletbdrm_plane_state(plane->state);
+	appletbdrm_state =3D kmemdup(old_appletbdrm_state, sizeof(*appletbdrm_sta=
te), GFP_KERNEL);
+	if (!appletbdrm_state)
+		return NULL;
+
+	/* Request and response are not duplicated and are allocated in .atomic_c=
heck */
+	appletbdrm_state->request =3D NULL;
+	appletbdrm_state->response =3D NULL;
+
+	new_shadow_plane_state =3D &appletbdrm_state->base;
+
+	__drm_gem_duplicate_shadow_plane_state(plane, new_shadow_plane_state);
+
+	return &new_shadow_plane_state->base;
+}
+
+static void appletbdrm_primary_plane_destroy_state(struct drm_plane *plane=
,
+						   struct drm_plane_state *state)
+{
+	struct appletbdrm_plane_state *appletbdrm_state =3D to_appletbdrm_plane_s=
tate(state);
+
+	kfree(appletbdrm_state->request);
+	kfree(appletbdrm_state->response);
+
+	__drm_gem_destroy_shadow_plane_state(&appletbdrm_state->base);
+
+	kfree(appletbdrm_state);
+}
+
+static const struct drm_plane_helper_funcs appletbdrm_primary_plane_helper=
_funcs =3D {
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check =3D appletbdrm_primary_plane_helper_atomic_check,
+	.atomic_update =3D appletbdrm_primary_plane_helper_atomic_update,
+	.atomic_disable =3D appletbdrm_primary_plane_helper_atomic_disable,
+};
+
+static const struct drm_plane_funcs appletbdrm_primary_plane_funcs =3D {
+	.update_plane =3D drm_atomic_helper_update_plane,
+	.disable_plane =3D drm_atomic_helper_disable_plane,
+	.reset =3D appletbdrm_primary_plane_reset,
+	.atomic_duplicate_state =3D appletbdrm_primary_plane_duplicate_state,
+	.atomic_destroy_state =3D appletbdrm_primary_plane_destroy_state,
+	.destroy =3D drm_plane_cleanup,
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
+static struct drm_gem_object *appletbdrm_driver_gem_prime_import(struct dr=
m_device *dev,
+								 struct dma_buf *dma_buf)
+{
+	struct appletbdrm_device *adev =3D drm_to_adev(dev);
+
+	if (!adev->dmadev)
+		return ERR_PTR(-ENODEV);
+
+	return drm_gem_prime_import_dev(dev, dma_buf, adev->dmadev);
+}
+
+DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
+
+static const struct drm_driver appletbdrm_drm_driver =3D {
+	DRM_GEM_SHMEM_DRIVER_OPS,
+	.gem_prime_import	=3D appletbdrm_driver_gem_prime_import,
+	.name			=3D "appletbdrm",
+	.desc			=3D "Apple Touch Bar DRM Driver",
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
+	return 0;
+}
+
+static int appletbdrm_probe(struct usb_interface *intf,
+			    const struct usb_device_id *id)
+{
+	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
+	struct device *dev =3D &intf->dev;
+	struct appletbdrm_device *adev;
+	struct drm_device *drm;
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
+	drm =3D &adev->drm;
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
+	ret =3D appletbdrm_setup_mode_config(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to setup mode config\n");
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register DRM device\n");
+
+	ret =3D appletbdrm_clear_display(adev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to clear display\n");
+
+	return 0;
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

