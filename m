Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B955955787
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1A710E086;
	Sat, 17 Aug 2024 11:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="dg0JoJbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2081.outbound.protection.outlook.com [40.92.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BEA10E086
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9HH/a6tPazHXGoSQQwlesr+uvREifmYjiIugllRX1W2WulFlGqU8qNcefUJiSxRUmhMxdwu9WMrlOOh96xdCRKGvHvw7CqzaCyIZNJ+o1fXITRQ+Jp5+ZSy5xWnkLuKrlh9tU2NjGzsA3tmp719vGUsNrXceC11+bCQCDLIZbqh8qAjDxINPi5wuPQXSBYEbqdpQTxxxzC/3VnT/MNTUzu3lxWJnmF0mujrX5iaqKbh3qp+2LLBXfdcAiSOIsmzr53urrXEAH0hHIQaA8iBgqsawZZq+VKpbZicUIDgfBFbMxM5WC4AXBzmI7bU3kvDtSYsYAjzN0vooR7qx1x85w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Duh1T7H8r6VogsX0x5yVLigf6Y7TcnB77H087z/Kv0w=;
 b=ImqsNXkbxVCDKUraybHxZvX/19uC7V0NA3Ro/1dx0fYTttc2nN5yO0C0pCDXqH8rgv7xq8dVncI+Mr7UHejpgYJkBme4s/bglL7ofq7jz2cWCur++UI6yN1HUhHlqvlL6nqGk2vovMSc0wtjDUnxT0SSOpWiFUDgpRtPhWs27cuCQoBdc9EIj1wWjOxkLIgXEmdMyShGufQWHPxbcRRh0wnfL+lMODZ/QDAZYgrebQ/qyx7yywCBdO8jjo6KD8/GnCZtvmsKKNKCIJcxw6KVPdNOOAZXIRZRLX4peauDVM3wFyUlThgDW/Ad72vrblmO5vTd8h2WljW8104LHciQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Duh1T7H8r6VogsX0x5yVLigf6Y7TcnB77H087z/Kv0w=;
 b=dg0JoJbHI4qzBRad7ty0L+mpxR8Da8gKYZtC0yXzxthONo14evvz8ocZDfecTNxqhE/swUf5jqoECbz7a9nF8pmoXjQSSw95l2LOEIjYwe53hL+01Yq8iyGs8rJ696NMKJxRFKj3P4Pocd5GRwkRcYHMeY1Yi/R0ZsZfooBoqQCmIqgPPUG47CpyfoLC0Mwvvk1u3s5ZKD6u3x6mJwsIEU0QSuJW5jGgxhaU1jq/Pdv1P+5jiGy6Tq6xBzdf3QIGBSerjeH+CVJOzKUw94SZ7wm7Ib3PK2/m6QSlIkgW0n7NzUnQRd4ByoTZneAJwTj5VZXXXHwm7Xa1mPtHHSvXWA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0673.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:42:59 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:42:59 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
 =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 0/10] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v5 0/10] Touch Bar support for T2 Macs
Thread-Index: AQHa8JqcCAO7RXvcd024xcw72HSENQ==
Date: Sat, 17 Aug 2024 11:42:59 +0000
Message-ID: <A04EE659-FBEC-4B06-9643-A304C077298C@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [a3/uP0w64vAd/eQ6qpH7Twzbp8aP0tqK2K2fXA+tDKJKuu1OwCZ8Cw/z2DFsPlleZBVLanTc8IE=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0673:EE_
x-ms-office365-filtering-correlation-id: 818692fd-5f7e-42cb-a465-08dcbeb1be97
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info: wcYdP4wQ7Q+MtDSuqAti1GcMQ011hVRWBEFecRlr3THhc789uYEvuAwjSLb7XGjBd3NDfIJqRLof/JwGCdoIqegNha87aNdY98I4rjQe2vS9futwc2Q30lBFo5HGI1nt6ozl+VWFyyiUbpizawU2dFaAiTag3PXQbf+A7vs1nHHZG9IoP+ldGj/r7Kq6TwByv+ZByyb7RMQAOJPWmzQIeoa1bsOH9q4B8zUj8htln9fKhthyC7ueSkpkY7UGETJuErZm1p5U0X+rahhmVk6nzq+24m/cUNMLICyIlBBk4UfPUNipFheMz9e7O+56EC4NDnM0JjQSNdHs4OhBI/+N2nZOPtcu7tMDrs5Z7H/6mqiCWdLsXMWqSP4riXGSxTXmKMOylXnV7XiV7Vf+KGSjDLRiHNg/97y+FQJwiD4NZZee1qgxwOB1ASCxy3S5aZu2C3Wx2E+AJD73+sigY468w/lC6At34DjZKL30puPBX+D5vUoYr+M6NG5iY5m0r5yuacS3fofxxBx1c52pviRLZbqCx2weowBsulKSYydW3Z3Yliu4M+LX//fO0tDwNbPxD4Z13ranj6oyRpVmHJ4G5EnWQ5HUG7Qv0g9ZeHK/dOfpqLAbuwcjyHsv9lx/2+XyFfojmFXAq9aAG2exOSO+arjBpivTOSI0zJ++xS/2tRAghJ5S1IYebeRWZxIBdV8u/CaREgokm1G9ywlyiFE1wtp7XoMyv1a7zbcmxRHM0umwHO6Q8JedYFdoACpu2hLWqJCEOUuQ4UPqpFCu1n++AXqZe0WdnX7dcy7nUUqi8Jc=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nJn5+HAyuODlDPz+RyKPgcCY1vyeM4s2D12nYvIK7OHFRlmz8lh1NykT0r?=
 =?iso-8859-1?Q?EoHNhZBWfnkEWWF+fd2uETAtErY8a5q+kBU+J6T0BLZslYqKU4F9CefoQG?=
 =?iso-8859-1?Q?6/rNuuGLua8+IlGm+nHGNM8a1QPoTu4A/LrIHdobWX0bvwWZcF50zO9dUG?=
 =?iso-8859-1?Q?BwUSTmIzwoztSWkOHKNsZsHprkUb4YW61LnkT07jcJ5fM5fOYtIktToDbm?=
 =?iso-8859-1?Q?+fVTCEv5+6p6bksrElhdd2Ug3DyFFXUaNkufhRt/9ZYv+pqbmL3AbS1w1/?=
 =?iso-8859-1?Q?SkgInQx9b2eQK8zZHrJWoD9xNbjRmf4LCGXPEVDcCSi2JjYuw2xifNBPYP?=
 =?iso-8859-1?Q?lyXkXiyFwpPOuNNg3FFldeLEC7RFimPkzUxzvST/hKcZah2YzNTnsL21r3?=
 =?iso-8859-1?Q?SWI1X4dS4Vwbh+TAQHuRdLuz4axAfLJWge6Nj819Fiv7DMwsWRhEXLQncg?=
 =?iso-8859-1?Q?GsABw0cgzDiFFAQC3nRUv/SMiUM31IL2Whhxig3Rwb+zuLlyBNulLv3MvX?=
 =?iso-8859-1?Q?4RohvIvmihi/MZ7VQTRjVuB7T8pXRveQCIRazdnZEWa8QRevJFYWqgQklE?=
 =?iso-8859-1?Q?0jfoPTbuvT1l4pXY88iRx5mSBd6wlhqafFf9uwQDUgCCTvnHbWppYCt28X?=
 =?iso-8859-1?Q?1MX/MYZKC6Kz7v98LUmUFpGzD0DHGqf0yWNtqpi9Gz5Hor3Kb96Xae2tNg?=
 =?iso-8859-1?Q?FS/Oje/wkLEJLXTYZekXEMDwUHK3nycLoc7p1NkmXMHXE5Uy0ODjLZJGtQ?=
 =?iso-8859-1?Q?ctfe/YSlZ6SBhIB90qt1he4Pjjq4Z0monN5ANiUOAluRot5UIGbYbh9wqd?=
 =?iso-8859-1?Q?nN+lSMcPKiBQEgIDXwt77g0mKMXup0NplKD6nXsKZF4ic0tvc1hs7UpL3L?=
 =?iso-8859-1?Q?bjK7I8qhhzXg9MQ9VVc7gywA2QOmElmCGtb7tOIXUNZL6PeYEEI0cByJsg?=
 =?iso-8859-1?Q?IFFyQcVBxund+z+4cyaErw7yFG84cxDfLPRkETBaqbqjLB+Q+fox1MkHfT?=
 =?iso-8859-1?Q?e70mPRYui9tjz3fWm6jdE9BLcSh7PLTWeM/Y3sG92Vz2A4P5ivQPrj46kq?=
 =?iso-8859-1?Q?wYewi5X/Ct/oE4ldKPEQ+ehmXsIEu82w1eG4tzEj+bWq/cYGsnMz6pymll?=
 =?iso-8859-1?Q?/AVY6F/zOrAKnQxSkotnmRvayFoVEJRaP31xhfXUqg0kL1QhQp3ZMQ5tXu?=
 =?iso-8859-1?Q?NcIEXPkXgn0hQQ2BpJqQcjeiLLnA7IVK5t78yt8Rbav5FSsYWhpqFlKRFv?=
 =?iso-8859-1?Q?5ovvu1ZARrSjC7UwELs5PYNXTgZEyh28G+kHhmwpolzOu1rqwpPKG8lBlm?=
 =?iso-8859-1?Q?LTB6mwChDyefqPJ+o5uGPeyqWzmlVuxBBm53ZxAqEYp5Ih8381mvEgTT2w?=
 =?iso-8859-1?Q?xCHljW18Bo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F0F02128D8AD1E4E87B272E16DF8B7E7@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 818692fd-5f7e-42cb-a465-08dcbeb1be97
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:42:59.5821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0673
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

Hi Maintainers

The Touch Bars found on x86 Macs support two USB configurations: one
where the device presents itself as a HID keyboard and can display
predefined sets of keys, and one where the operating system has full
control over what is displayed.

This patch series adds support for both the configurations.

The hid-appletb-bl driver adds support for the backlight of the Touch Bar.
This enables the user to control the brightness of the Touch Bar from
userspace. The Touch Bar supports 3 modes here: Max brightness, Dim and Off=
.
So, daemons, used to manage Touch Bar can easily manage these modes by writ=
ing
to /sys/class/backlight/appletb_backlight/brightness. It is needed by both =
the
configurations of the Touch Bar.

The hid-appletb-kbd adds support for the first (predefined keys) configurat=
ion.
There are 4 modes here: Esc key only, Fn mode, Media keys and No keys.
Mode can be changed by writing to /sys/bus/hid/drivers/hid-appletb-kbd/<dev=
>/mode
This configuration is what Windows uses with the official Apple Bootcamp dr=
ivers.

Rest patches support the second configuration, where the OS has full contro=
l
on what's displayed on the Touch Bar. It is achieved by the patching the
hid-multitouch driver to add support for touch feedback from the Touch Bar
and the appletbdrm driver, that displays what we want to on the Touch Bar.
This configuration is what macOS uses.

The appletbdrm driver is based on the similar driver made for Windows by
imbushuo [1].

Currently, a daemon named tiny-dfr [2] is being used to display function ke=
ys
and media controls using the second configuration for both Apple Silicon an=
d
T2 Macs.

A daemon for the first configuration is being developed, but that's a users=
pace
thing.

[1]: https://github.com/imbushuo/DFRDisplayKm
[2]: https://github.com/WhatAmISupposedToPutHere/tiny-dfr

v2:
 1. Cleaned up some code in the hid-appletb-kbd driver.
 2. Fixed wrong subject in drm/format-helper patch.
 3. Fixed Co-developed-by wrongly added to hid-multitouch patch.

v3:
 1. Fixed key mapping for Function keys in hid-appletb-kbd driver.

v4:
 1. Added support for fn key toggle in the hid-appletb-kbd driver.

v5:
 1. Do required changes to hid-appletb-bl as requested by upstream.

Aditya Garg (1):
 HID: hid-appletb-kbd: add support for fn toggle between media and
   function mode

Kerem Karabay (9):
 HID: hid-appletb-bl: add driver for the backlight of Apple Touch Bars
 HID: hid-appletb-kbd: add driver for the keyboard mode of Apple Touch
   Bars
 HID: multitouch: support getting the contact ID from
   HID_DG_TRANSDUCER_INDEX fields
 HID: multitouch: support getting the tip state from HID_DG_TOUCH
   fields
 HID: multitouch: take cls->maxcontacts into account for devices
   without a HID_DG_CONTACTMAX field too
 HID: multitouch: allow specifying if a device is direct in a class
 HID: multitouch: add device ID for Apple Touch Bars
 drm/format-helper: Add conversion from XRGB8888 to BGR888 conversion
 drm/tiny: add driver for Apple Touch Bars in x86 Macs

.../ABI/testing/sysfs-driver-hid-appletb-kbd  |  13 +
MAINTAINERS                                   |   6 +
drivers/gpu/drm/drm_format_helper.c           |  54 ++
.../gpu/drm/tests/drm_format_helper_test.c    |  81 +++
drivers/gpu/drm/tiny/Kconfig                  |  12 +
drivers/gpu/drm/tiny/Makefile                 |   1 +
drivers/gpu/drm/tiny/appletbdrm.c             | 624 ++++++++++++++++++
drivers/hid/Kconfig                           |  22 +
drivers/hid/Makefile                          |   2 +
drivers/hid/hid-appletb-bl.c                  | 207 ++++++
drivers/hid/hid-appletb-kbd.c                 | 432 ++++++++++++
drivers/hid/hid-multitouch.c                  |  60 +-
drivers/hid/hid-quirks.c                      |   8 +-
include/drm/drm_format_helper.h               |   3 +
14 files changed, 1509 insertions(+), 16 deletions(-)
create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
create mode 100644 drivers/hid/hid-appletb-bl.c
create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0

