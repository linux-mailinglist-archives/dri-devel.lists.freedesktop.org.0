Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E72A949617
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 19:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B15C10E3C9;
	Tue,  6 Aug 2024 17:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="RFNl+eAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2013.outbound.protection.outlook.com [40.92.102.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1810E36C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 13:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3Khzy+/syvLMDdWobWmW+fQXGr73Bg9+7snllIJaJVAZhXaoCPtnWBKc6W78RnuRsTrbGPKIAXev6PhfEmihB5G6IMOedAVNDL11uz53NseMzUbVozLEv1Kkc5/3cuzx2voA8ohHxLzyDeY9Tqm+MF5DFW9uNpbpoGpGhOIJaNwsaTW6j2qg5s84J7qjA+4w+MZ73Tmo9KD9VR3KjLDYvKckVQI45h5OiP4fp6o54Ww0naWqRNnsSBotHVXr/OIkssPksbkCwwPfaX3kt877w3VSk9ecmmHn0QDQCZHPaggemXwpy1Gk6yk9YGtAlyRh48Ek+cxdjod9yvbq2AOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoSvTHKg6l/zGz7gGWzWGp0Ja3c1HhCjuYKgcbhVug0=;
 b=krGOVtFA3+rBfWzWVib9C5Cpa1sqDKc3NPRgSQyhi8DU6jIoJI1lvo1knr5QIFc9tC1SYrBnVN4xxwSh9Lw1t9IdphdhmENcz1vhaEyf0YnXNpZN8iWj6G9DctGO8eogL1sTP5MDTbnzsDWBbS4/l28OxIoW4XtGHzW3o4UR8s2raiEXALmMEuwlw4VpBfWH/0pfpQwIv/wmiG6qYyp6JOaKXgevgGH526jDHP1SaDOilGG0VI7ip0VMbqGP8BOcNu/HD6brQaP4L17v+4QWFBDN2HuIbBGfE3bGkWBvSovSo5Luqfm1mX2SvboIgEcU9Z8lUa/TG0Br6dLwwmfgqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoSvTHKg6l/zGz7gGWzWGp0Ja3c1HhCjuYKgcbhVug0=;
 b=RFNl+eAMz4EPwOWLJMTFSqtX8ukFQtyx0e0YyveuRqRBPG1GCdmgVSA6V5/1GhT4aGmfzg87ruJ414yY1kgvtRRMipqxEozeGrCjh8ptx2n3l68JXixL1TtjB4hXi/H4crDpM7qzw9UzH+LOejOUOisXVI1Kf55X5qSDz0OOGdWZKLOH2+WeNRBRhFkMCKmyKLAdvCILAJTyzYzeaVF3jMkXDgDb0mE72tJVl7qjj0E8NYmHNlhXgoW7vOP/no1UZ8MwK9eQUi9s/s+Ae3be7qGjqWWW3aS67GXw6M6M1ZscFBGfBYyQjxRIW62Dxdrnz+XQJua1unWIohVinl4EkQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB1605.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:191::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:46:48 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:46:48 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
 <linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6AcVBO9C+i1kUUSrZRhqtoN3ag==
Date: Tue, 6 Aug 2024 13:46:47 +0000
Message-ID: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [Z64+831Mu7sBFnXjSBh7+a7eqPGY01hsViFe494ugMSmXgABtTGRcv6hTiyF0ar5k0FbWzZcKfg=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB1605:EE_
x-ms-office365-filtering-correlation-id: 0cdbe1ad-2b98-4491-712b-08dcb61e37a8
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|19110799003|102099032|4302099013|3412199025|440099028|1602099012;
x-microsoft-antispam-message-info: 2OkfBJ77Aasru40RsNS00Jm1tD75NhH4/Smi5Arz+poiLUDzsXx3BW2R1Be8Nwz1yeNSmuAh8lHsP3dXloKbgpJ5AAu5aA0toB4fiXWZaXMVnlTPJ1GaYdzytk/Bd2yTiofo9PW2DrG4PRw+oiOHqgPUoKKpkT0Ic/A7NhoeA0LNgDHpSbdoBISJO4waQuvC+HPqyxGak1KvcHfA3XWRvnHVt1QQ/6xlXvHxj5aFV27CJYFXzf3YojlWFq/4Oz//D/hnSik/AmGrwHekBmJC3dxvCpxUmGvnlmLMcE8v+Kh6SWvxdcerY8wHWnMA1iisvE2vGGGo8ddzeSYokYeDYLUyldEcUu/RXhktWIXiFTyXDS0SOE30e0JZAz9WWiSOZhgXdGSRc1ZsVFs4p7JGDqDXO5y3GQ3x2m/hbJtfidqs/hnuSE/+IEgDYXRUSBCaccgS1DyImeqt/44F3M/P3++Q5yd+Et4aP9GDzuNpW1lPrHRnxUS1b8p5ngMJqkOTBipB3/phve2jbkYynByy+toyv8+fvtpnGZ5TNxTvCwdOmUYU5mZaYC7UZIPyDORa5r2oMfBHJuv3OfYa/HYi4CC4ODFsn7Oy7Z/ZzbZhoke87Fcax6e1cyz9wQrME1wzP90oyy3I/j8jYp7IvAqKcgehAyVaOe+d0QxCOSSGkAI96a1jOwA+O7pvL+rI94PZwEZuoUpbkZCMVKms/J0bGrgQ+dgKxM9zMymhXOQ86Idldc/mXQymiB/vF4TCDDjJHAXXtWZXuCTBparzOGFi6w==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cZv1PfJRTcJSnVFHZDXzHmmpDAizBtv1Fp69wS1Z+nXgHWowMQqYTj6j1FrV?=
 =?us-ascii?Q?GgXlYiACMj0zIBzwbFsPZlVNvY+cw8PZxL5LhN0i0PGaTASz+gnJt8E51hRY?=
 =?us-ascii?Q?Kj5qIgtJ/NnhuG4vbOHrPB0wQEMkngjIhfHGTCvuz9m80e3b1WkHCN2akLmN?=
 =?us-ascii?Q?jGmv0BGUHu7H8cafVNZXRgzNdaStKzUtxcYPLsbMxGjLQisVOlsuiqIZ4CcM?=
 =?us-ascii?Q?+VO1xFELF+k//MAses0aXFiMoUzQQlDYpxvYM1ZT2GYuQ8Dgxu8ZXfLGaNRn?=
 =?us-ascii?Q?wz3YaXtLKvGGDi1HxEDsMRa9ZdaFnkIji0ERDl2ojN7ePy2Ik2dsHlR3wp7w?=
 =?us-ascii?Q?Br1PJmF22kWxWu7llXN5jS9kGAFvNZrgjbV4uNbmRuoarJgbtZZEopcbJtGC?=
 =?us-ascii?Q?XEBNTt+9zwGZe4U7GP6agPoXkj/rf4FWsGr8zDIbq67zoXWlr6JAWhP5XPjp?=
 =?us-ascii?Q?n0iEmRkfAnX/9m9a2n6Gg3rZLXYZF0+XMe7PEw9uCRctiraNg+C+8ujtfTcs?=
 =?us-ascii?Q?G7UMb2IVLUBVlP0FHdU7YK2r9jffBdnGEDKH05oF1svQ5t1dW5YeBDMpkA28?=
 =?us-ascii?Q?WfLub9t5Lxx4A9ZQWa5PkZfSSOmGubDSJn0HC4jDTngdfEgyZfDXgG4G6mZW?=
 =?us-ascii?Q?be9rIduUuYhwmtZug22G9HWWBa9TlvbWQteBMy14zl+ktAfBaclnPRwugJdI?=
 =?us-ascii?Q?AnEtNyWMoUsXhZMQR4Fm5ept+LTtY5zFTTSPEtDoxerCZgeK4M5yEIy68LUC?=
 =?us-ascii?Q?KO5NBUSOsViiENcbOEKuK5svYR293OfldIv4oZ++xyyPc6fttZ1BANcd5OPy?=
 =?us-ascii?Q?QeAGJ9o63fEmnS1pwY9uOdy3Bh8+1DWAIdb5g+b7hri1873kKTqHC9b118Pw?=
 =?us-ascii?Q?QAeNOyviOlobHKzv1Ok+jttYrtNRk0hnAovMrLFohWE27/zHWZz+JHInbccG?=
 =?us-ascii?Q?EEOZVmMzfGiYF3GSaGNTA2LZt57jn9S0p3oSzxralIRD6+nIblc3R4Ap+Lhw?=
 =?us-ascii?Q?yAWER+6iZkdbURK0wUjqqG4LX9g8teNuNlTQaVzOHnDLcZx7dUDZXGar7bwj?=
 =?us-ascii?Q?WwDDIU1Bk5861AxSyG0MTcZfW4RhY/VyoV7FoKMPaaIk7akiEKJoysqluogz?=
 =?us-ascii?Q?zMbDo15f4yCMUAzM4LKhRF55IaiIogx45M3GbmqhAcR+1eQXfZSHknCXI0v7?=
 =?us-ascii?Q?m4YB8m+yo758Y3Y9gTWajn4rYa796weyE0bmPX13pKZO8vmL41Xb2/TY4Dlo?=
 =?us-ascii?Q?xngFnfi5Jhc6fnRf138Yrlh5eFKykfKaIafBoTUV6vW2mvnbS5ouo1mRgUh8?=
 =?us-ascii?Q?+bwVlA+N2uT2z1jBmfo1pcOq?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EF95B0131C079B48AFAF79953689E9DF@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdbe1ad-2b98-4491-712b-08dcb61e37a8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:46:47.8550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1605
X-Mailman-Approved-At: Tue, 06 Aug 2024 17:01:42 +0000
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
  drm/format-helper: add helper for BGR888 to XRGB8888 conversion
  drm/tiny: add driver for Apple Touch Bars in x86 Macs

 .../ABI/testing/sysfs-driver-hid-appletb-kbd  |  13 +
 MAINTAINERS                                   |  12 +
 drivers/gpu/drm/drm_format_helper.c           |  54 ++
 .../gpu/drm/tests/drm_format_helper_test.c    |  81 +++
 drivers/gpu/drm/tiny/Kconfig                  |  12 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c             | 624 ++++++++++++++++++
 drivers/hid/Kconfig                           |  22 +
 drivers/hid/Makefile                          |   2 +
 drivers/hid/hid-appletb-bl.c                  | 206 ++++++
 drivers/hid/hid-appletb-kbd.c                 | 316 +++++++++
 drivers/hid/hid-multitouch.c                  |  60 +-
 drivers/hid/hid-quirks.c                      |   8 +-
 include/drm/drm_format_helper.h               |   3 +
 14 files changed, 1398 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0

