Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A79A4463D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB62610E191;
	Tue, 25 Feb 2025 16:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="p9D9LPvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010005.outbound.protection.outlook.com
 [52.103.68.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508AA10E1AB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqe88gfBF9QRLPxqMDVl4tEVtPyBk5IO7V/oAQkj1UR42zdm6krg0GqUV9Fy4/XzmO2e7zVPowU2V0RJl36KnLeT+obLNNIsvYv4DkCweKa9oc8yGt104p+QP+YD0G+uNhB9dSUZyzFh0w1k95Eg7MWtFzJQquPwiK23+QLVfqic8gFMQGhZsBkSTCyfLQLjoH58Dlcj7SBlNZbYmmWx3cp4er6QQkFj9bSVVUQE68RB9nRMMZlSMzLfK0rHUwEBuFH3eXbPZs436uCFpYDSjlaJsVMJSUtWT5Tmg+KU7WrxtaiahXP37w7OkubKYgEYQ9cD+5/L+TFMIGwWWlkhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9whW9Ima5GqTcJsy4PM/Yli40oyFy/gzdz+m+Uya1mw=;
 b=QPfc7Y8FS98LGrt2lSf+L56IPq7YqXIBKQ+DTeGIpDDpULE7bxqL4yTRdYEW+xNre9j6Xodjv0pbRNtunYYr2oUacO5p/YfChQk0Kh5rzvxoccJDnGALclINGeOURBs3nNXA5z+CxFRR6yD6rRBL8oPcfLWskiQJ276i87kG5yZiIzaip37ttxCzAstFEsDPlGh/FXMpL3n4TN9vmpjIG1gFC9+8Urxz6kwgILC9EJnZZB8DMVGuUF7XmrGLJb+BVyzmDJTb4wSk1Jhf0e+mZSvlVJM49jRe8jtfKkla5y4iBKmJHMv5Uj3KuizkYj7a9vHh6j58ZTrP4L5hB2eHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9whW9Ima5GqTcJsy4PM/Yli40oyFy/gzdz+m+Uya1mw=;
 b=p9D9LPvceUI9LDj5gzpVTW6Sh/RpjZmCgdnp7b1mZme5/wk5kqYQe1g4ibTMDz1rJqL9flL46EoumE9H/N/OUrYiWwlsdLU2018Ufv/oEnOVS8B/Rtwk+AtJWhi+0Hp1dkugxaMYYgWRsBTTFtZbeNpnbzjV1ZZRFyBqi6DZflf8LzQsqEnp5rBSGl6+oJQW5nkw/esbRXIXPlfstHYgv9Japx24Bd/FMxvIzgUqdChxSQoiPR5UPOKK/ZIzI1KmlNXPTIoyNACczSxR9APS/kg8P1rjJvesP8hbZ6d61jG0V8kGD9j0oFEdXhZ8SC4tEbz+0tvNtUfC2Q6JXEhY+w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9876.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:37:32 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:37:32 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 2/2] drm/tiny: add driver for Apple Touch Bars in x86 Macs
Thread-Topic: [PATCH v6 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh6OR8jR6BcTzsU2nOnP9tkpoLg==
Date: Tue, 25 Feb 2025 16:37:32 +0000
Message-ID: <F8BB11DB-1E2B-407E-9FB2-F02AAA82D4FE@live.com>
References: <0BAB26BE-5BB6-467F-BED3-9AA8DE25433B@live.com>
In-Reply-To: <0BAB26BE-5BB6-467F-BED3-9AA8DE25433B@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9876:EE_
x-ms-office365-filtering-correlation-id: d56022e5-432d-48dd-4d0a-08dd55bab395
x-microsoft-antispam: BCL:0;
 ARA:14566002|12121999004|8062599003|8060799006|19110799003|7092599003|15080799006|461199028|440099028|3412199025|10035399004|4302099013|12091999003|41001999003|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?N2GMLG27VRjVX0Vl4d4Dv3hwAqp+37EFVuoE/qtxCrEEnqJSFiw3Ylb1Cpbh?=
 =?us-ascii?Q?NdPvDWxvw2bqGdfFHVZMhgrdWJ6sIP8DYS7JxXGM6G4TBPJ31ubeReR4F251?=
 =?us-ascii?Q?CE0ilN3WRSuLtlBzbgp9VdMkwuFYKIqy1uPf/ZAbQmigy50g8jRtaAHiYrSq?=
 =?us-ascii?Q?T+8X54JFBXT+ZQjv52eVoV+r5Zbel85DQERhlHclChkZJqwHc04gHhxXq/zg?=
 =?us-ascii?Q?4Jt4z5Jy3G2dg1LBJQWPTix6+3dM68c3XVXETi2uxrDKtE7rmV/NwDp8gmii?=
 =?us-ascii?Q?XPGrgyotZA9g4AHT6NS0WBOfIusFHL5NK8WxcsBLItHGm++sTgDprDG8CrZN?=
 =?us-ascii?Q?6/Qp35SM2b91lKtdiWjimbJi+iONy3aIZfIdUXl3YRNLivtqb9Daw440G8eS?=
 =?us-ascii?Q?gbbsZshIRWoSBopHEpGtD4aDYuwFCS3XP02qEqVAFA9ZIu1lkOorLIlpKM5Y?=
 =?us-ascii?Q?fc1Rg2YIjK7QMpr1N6AqXeACl68AdR+VH2p6dxzLU3dkYQXQZw0DJWEOJQbj?=
 =?us-ascii?Q?DYPpLsjxXyxdukEO0Wix+qc/HgjcjpWdrq9dzllBeG9+VKFm5AUUsywPaFJB?=
 =?us-ascii?Q?uAceSFhvsJHAmhABN85eoSKFnACi6dQuvTxVLRGDmXs8AUQNYKjmrVxSzd0z?=
 =?us-ascii?Q?QRrkzszSY++SYOEXfXwhcuOyY0tHeDslzSlxEn8i0R5BLyj+u5p/DEEHTZG6?=
 =?us-ascii?Q?cotA9qYc+pQK3MNzb8Q9HMNAf6EM79c5+aO/5+lSOR1bkezGqAHSaVeQMJP0?=
 =?us-ascii?Q?hkU7aEfoO5lwVhKOyAn+V7OkIQMkob8Q9AeTqQI4d8LfOMEqLd0bCJ3Q+7LS?=
 =?us-ascii?Q?M99YSP8ThCclLeJ7bvsSrnZkS7dU1u93BqIUSGz3xpQKqNfqyvcWpRBfZbkv?=
 =?us-ascii?Q?5GarUeaUd5VTgvQH8AicQ91XstZSFXJ81/xEuBkfqln7IS764AiKYUvQ+7xv?=
 =?us-ascii?Q?9BQUDGH+crzAIkQtnAWfPQ1gluTQwV83C6cso4YR9/sPYea13cSSfbb9QQ6/?=
 =?us-ascii?Q?qWRMCAO25vdTe2Xk0HiNLrj28HB5tz5ptdtReuE9xR2Qlig0uPGXuBrzVlso?=
 =?us-ascii?Q?3jrRYaw/9FR6kBcFdSlrliC5FTdZ1lvbJQpjrM556QYgG7cx0iStAN6pwSFB?=
 =?us-ascii?Q?rVFDDGEvlxK45Jga5qkmzk1Lh6q8c2DWTbgpku43YznnRiCe74cs/Vkg4MM1?=
 =?us-ascii?Q?WYF133ACo4VbC30d0KFa6B9nRDwQ1m793ikSXFwfZpUyaoxoOqzLFO6xClNT?=
 =?us-ascii?Q?YTZRClzD/JDl1TjREkG3M5lx3sK60twELDGb0zCLlyxaI9Pc/1kYqMj+Ohc3?=
 =?us-ascii?Q?ds8=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IUe32U0b/btXyYg+YTUkGT28lfns5tkJG94Cjk/gh2Zm31IbQezufxjb08Tb?=
 =?us-ascii?Q?gAdTYOtH1NV9i6cmIQi9fW4LsGsh3zzjZSO9QsJe9TiQG5vTi5MmmTZh1Mka?=
 =?us-ascii?Q?BBvayvLPshIENdRs0GIN79zo6iu3Tdsin0WLGnPx5BVXg4XJf3UoOMjnSToE?=
 =?us-ascii?Q?rkMZPZRWrTvTFrd3UZpMkngh7EN8jGtC9LKxjuzsMWGh9InpkUJmDapTtnGg?=
 =?us-ascii?Q?MFCc7jXFVt0WpoqnLwkNKvP3l3OCQPVhn7QbYk/gPfnQeUaaCLt+NQ9sDaPz?=
 =?us-ascii?Q?23aOPHFjSW7zO46ZHHWYghktb4y7AYoe+ZhzzHZVEBmbkOtJkrw6JgAqf1WQ?=
 =?us-ascii?Q?fUOr5x3GEY/dTkqGqepbuKCgVAXWK/vuv0VwwKGQbqAlzl9pbu3IxM+cuGSw?=
 =?us-ascii?Q?S38K5zlM4ozqQJeLLdEEDuoPoubaCuyiqh34cLFXXBOPb9sGLsABf/5StX5R?=
 =?us-ascii?Q?qNklLU34Lji48pA/L/PePGnz2vdQ9rfGDU4KVrf3cndBt6a52uKUu3EQBc4c?=
 =?us-ascii?Q?A1NfIE5RoNFGQNV70AONSJJo8wPy2q5NcVLnEcodkoQE/IvCenqT+KOmJ/yJ?=
 =?us-ascii?Q?ccruGpqwYxvWyZ+YldC22xv84eqey4d9hJnJGmFgTRGgtWiE0fEft03eJdIN?=
 =?us-ascii?Q?5keFZxTabwp9i05pESiqSG62xi37V7KaIYmcfEsMR/caoOQOOBQvT8LpLJek?=
 =?us-ascii?Q?TRqgiPCgW7PRyhLREz1+tcGDdwQa/EDx0MzWEnE5gSnZAC/Fm6S61jb734Ds?=
 =?us-ascii?Q?KoAFuODu0/SquZ/8oTleP7/54iOOfL751DG1/teF1DtmmwwJBxJS2KbclR41?=
 =?us-ascii?Q?xoEoU3XlosCvZ2KzGhvMqn622Z5hds++SFrr6+4go1s91RDXJuHwLHWnf/ol?=
 =?us-ascii?Q?gIk/Hm5cuYS+yX3aj/QF9RuPowq3sI9afeZE5rl+IOD/25MyJV/CVHelZCo7?=
 =?us-ascii?Q?gLZR0eJD98BrQO1g5w7cmNIHCCrUZqwQ7cga1ySMIkMxNihH79C1JeKCwgWB?=
 =?us-ascii?Q?guhCQaJeCRFlp0Ep5vtQM6q9N8Gb83ctsNLdeW9XQOpyae85zix078aZEm6h?=
 =?us-ascii?Q?WDUzvQS0FhHNHGmdlVSTsJKaDxGez8HnATQEz5aio0RIgwS4bKeDsEKU8JVH?=
 =?us-ascii?Q?r2I/N/vCbLWp39H7Fye7OFDgsnp1NgxlsCW2RiaaGN6mkY1U3YJB2qtZuo9j?=
 =?us-ascii?Q?DUCfPK8lJSJIbU/2NfVfGYJbD/kv9Hnj4+rQrqOpjchTD8c0ZdF1TMEEJ6YO?=
 =?us-ascii?Q?ti5KoQemxbIjjgiJTXmFRPemsmlvz/7qdsaF4obNvVXM29UXBL80b1zvb03W?=
 =?us-ascii?Q?sjHiEAD+9Sse1CHsgvI7BT6S?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3BD6B651528C0F4FB092850B9FC1A29D@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d56022e5-432d-48dd-4d0a-08dd55bab395
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:37:32.1561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9876
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

Credit goes to Ben (Bingxing) Wang on GitHub for reverse engineering
most of the protocol.

Also, as requested by Andy, I would like to clarify the use of __packed
structs in this driver:

- All the packed structs are aligned except for appletbdrm_msg_information.
- We have to pack appletbdrm_msg_information since it is requirement of
  the protocol.
- We compared binaries compiled by keeping the rest structs __packed and
  not __packed using bloat-o-meter, and __packed was not affecting code
  generation.
- To maintain consistency, rest structs have been kept __packed.

I would also like to point out that since the driver was reverse-engineered
the actual data types of the protocol might be different, including, but
not limited to, endianness.

Link: https://github.com/imbushuo/DFRDisplayKm
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

v4 ->
- Use "Link:" in commit message
- Specify why __packed has been used in commit message
- Use %p4cc instead of %p4ch for errors
- Add myself to Maintainers
- Remove #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
- Add missing header files
- Use return 0; instead of return ret; in static int appletbdrm_send_reques=
t
- Better errno types used in appletbdrm_read_response
- Use BITS_TO_BYTES() to convert APPLETBDRM_BITS_PER_PIXEL to bytes
- Remove redundant else in plane_helper_atomic_check
- Remove unnecessary use of 0xff in request->msg_id =3D timestamp & 0xff;
- Remove duplicated struct device in struct appletbdrm_device
- clear frames_size and request_size as well in primary_plane_helper_atomic=
_update
- Allocate using kzalloc instead of kmemdup
- Use drm_err() instead of dev_err_probe()
- Avoid clearing drm->mode_config.min_width and height to 0
- Use put_device() to release the DMA device in appletbdrm_disconnect

v5 ->
- Convert leftover dev_err_probe to drm_err
- Add missing period in comment
- Use struct device *dmadev instead of struct device *dev in struct appletb=
drm_device
- Instead of using __APPLETBDRM_MSG_STR4(str4) macro, the hex values have b=
een directly used
- Remove modules that were not needed from kconfig

v6 ->
- Clear the drm pointer to NULL in probe
- Add back else if in atomic_check for the sake of consistency with other d=
rm drivers

 MAINTAINERS                       |   8 +
 drivers/gpu/drm/tiny/Kconfig      |  12 +
 drivers/gpu/drm/tiny/Makefile     |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c | 843 ++++++++++++++++++++++++++++++
 4 files changed, 864 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

diff --git a/MAINTAINERS b/MAINTAINERS
index efee40ea5..f7c97eb24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7148,6 +7148,14 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
=20
+DRM DRIVER FOR APPLE TOUCH BARS
+M:	Aun-Ali Zaidi <admin@kodeit.net>
+M:	Aditya Garg <gargaditya08@live.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/gpu/drm/tiny/appletbdrm.c
+
 DRM DRIVER FOR ARM PL111 CLCD
 M:	Linus Walleij <linus.walleij@linaro.org>
 S:	Maintained
diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index 94cbdb133..54c84c980 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
=20
+config DRM_APPLETBDRM
+	tristate "DRM support for Apple Touch Bars"
+	depends on DRM && USB && MMU
+	select DRM_GEM_SHMEM_HELPER
+	select DRM_KMS_HELPER
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
index 000000000..39f5ee556
--- /dev/null
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -0,0 +1,843 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Apple Touch Bar DRM Driver
+ *
+ * Copyright (c) 2023 Kerem Karabay <kekrby@gmail.com>
+ */
+
+#include <linux/align.h>
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/bug.h>
+#include <linux/container_of.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/slab.h>
+#include <linux/types.h>
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
+#define APPLETBDRM_PIXEL_FORMAT		cpu_to_le32(0x52474241) /* RGBA, the actu=
al format is BGR888 */
+#define APPLETBDRM_BITS_PER_PIXEL	24
+
+#define APPLETBDRM_MSG_CLEAR_DISPLAY	cpu_to_le32(0x434c5244) /* CLRD */
+#define APPLETBDRM_MSG_GET_INFORMATION	cpu_to_le32(0x47494e46) /* GINF */
+#define APPLETBDRM_MSG_UPDATE_COMPLETE	cpu_to_le32(0x5544434c) /* UDCL */
+#define APPLETBDRM_MSG_SIGNAL_READINESS	cpu_to_le32(0x52454459) /* REDY */
+
+#define APPLETBDRM_BULK_MSG_TIMEOUT	1000
+
+#define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, dr=
m)
+#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dma=
dev))
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
+	return 0;
+}
+
+static int appletbdrm_read_response(struct appletbdrm_device *adev,
+				    struct appletbdrm_msg_response_header *response,
+				    size_t size, __le32 expected_response)
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
+		return -EINTR;
+	}
+
+	if (actual_size !=3D size) {
+		drm_err(drm, "Actual size (%d) doesn't match expected size (%lu)\n",
+			actual_size, size);
+		return -EBADMSG;
+	}
+
+	if (response->msg !=3D expected_response) {
+		drm_err(drm, "Unexpected response from device (expected %p4cc found %p4c=
c)\n",
+			&expected_response, &response->msg);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int appletbdrm_send_msg(struct appletbdrm_device *adev, __le32 msg)
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
+	__le32 pixel_format;
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
+		drm_err(drm, "Encountered unknown pixel format (%p4cc)\n", &pixel_format=
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
+	return drm_rect_width(rect) * drm_rect_height(rect) *
+		(BITS_TO_BYTES(APPLETBDRM_BITS_PER_PIXEL));
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
+	request->msg_id =3D timestamp;
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
+	appletbdrm_state =3D kzalloc(sizeof(*appletbdrm_state), GFP_KERNEL);
+	if (!appletbdrm_state)
+		return NULL;
+
+	/* Request and response are not duplicated and are allocated in .atomic_c=
heck */
+	appletbdrm_state->request =3D NULL;
+	appletbdrm_state->response =3D NULL;
+
+	appletbdrm_state->request_size =3D 0;
+	appletbdrm_state->frames_size =3D 0;
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
+	int ret;
+
+	ret =3D drmm_mode_config_init(drm);
+	if (ret) {
+		drm_err(drm, "Failed to initialize mode configuration\n");
+		return ret;
+	}
+
+	primary_plane =3D &adev->primary_plane;
+	ret =3D drm_universal_plane_init(drm, primary_plane, 0,
+				       &appletbdrm_primary_plane_funcs,
+				       appletbdrm_primary_plane_formats,
+				       ARRAY_SIZE(appletbdrm_primary_plane_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to initialize universal plane object\n");
+		return ret;
+	}
+
+	drm_plane_helper_add(primary_plane, &appletbdrm_primary_plane_helper_func=
s);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	crtc =3D &adev->crtc;
+	ret =3D drm_crtc_init_with_planes(drm, crtc, primary_plane, NULL,
+					&appletbdrm_crtc_funcs, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to initialize CRTC object\n");
+		return ret;
+	}
+
+	drm_crtc_helper_add(crtc, &appletbdrm_crtc_helper_funcs);
+
+	encoder =3D &adev->encoder;
+	ret =3D drm_encoder_init(drm, encoder, &appletbdrm_encoder_funcs,
+			       DRM_MODE_ENCODER_DAC, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to initialize encoder\n");
+		return ret;
+	}
+
+	encoder->possible_crtcs =3D drm_crtc_mask(crtc);
+
+	/*
+	 * The coordinate system used by the device is different from the
+	 * coordinate system of the framebuffer in that the x and y axes are
+	 * swapped, and that the y axis is inverted; so what the device reports
+	 * as the height is actually the width of the framebuffer and vice
+	 * versa.
+	 */
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
+	if (ret) {
+		drm_err(drm, "Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(connector, &appletbdrm_connector_helper_funcs);
+
+	ret =3D drm_connector_set_panel_orientation(connector,
+						  DRM_MODE_PANEL_ORIENTATION_RIGHT_UP);
+	if (ret) {
+		drm_err(drm, "Failed to set panel orientation\n");
+		return ret;
+	}
+
+	connector->display_info.non_desktop =3D true;
+	ret =3D drm_object_property_set_value(&connector->base,
+					    drm->mode_config.non_desktop_property, true);
+	if (ret) {
+		drm_err(drm, "Failed to set non-desktop property\n");
+		return ret;
+	}
+
+	ret =3D drm_connector_attach_encoder(connector, encoder);
+
+	if (ret) {
+		drm_err(drm, "Failed to initialize simple display pipe\n");
+		return ret;
+	}
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
+	struct drm_device *drm =3D NULL;
+	int ret;
+
+	ret =3D usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_o=
ut, NULL, NULL);
+	if (ret) {
+		drm_err(drm, "Failed to find bulk endpoints\n");
+		return ret;
+	}
+
+	adev =3D devm_drm_dev_alloc(dev, &appletbdrm_drm_driver, struct appletbdr=
m_device, drm);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
+
+	adev->in_ep =3D bulk_in->bEndpointAddress;
+	adev->out_ep =3D bulk_out->bEndpointAddress;
+	adev->dmadev =3D dev;
+
+	drm =3D &adev->drm;
+
+	usb_set_intfdata(intf, adev);
+
+	ret =3D appletbdrm_get_information(adev);
+	if (ret) {
+		drm_err(drm, "Failed to get display information\n");
+		return ret;
+	}
+
+	ret =3D appletbdrm_signal_readiness(adev);
+	if (ret) {
+		drm_err(drm, "Failed to signal readiness\n");
+		return ret;
+	}
+
+	ret =3D appletbdrm_setup_mode_config(adev);
+	if (ret) {
+		drm_err(drm, "Failed to setup mode config\n");
+		return ret;
+	}
+
+	ret =3D drm_dev_register(drm, 0);
+	if (ret) {
+		drm_err(drm, "Failed to register DRM device\n");
+		return ret;
+	}
+
+	ret =3D appletbdrm_clear_display(adev);
+	if (ret) {
+		drm_err(drm, "Failed to clear display\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void appletbdrm_disconnect(struct usb_interface *intf)
+{
+	struct appletbdrm_device *adev =3D usb_get_intfdata(intf);
+	struct drm_device *drm =3D &adev->drm;
+
+	put_device(adev->dmadev);
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

