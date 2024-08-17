Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9D395578A
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 13:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9024B10E089;
	Sat, 17 Aug 2024 11:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Ob3IOl6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2019.outbound.protection.outlook.com [40.92.103.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2A010E089
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 11:44:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXaHCtF9ywsYy9g8rJc+4tsp2mGBVzMrfzFRa1Lbcmk9u16OW2qvTz4Ng/2202EY8UWBJIvGo/3fbp7d+LorIqW4jjXQYkgWFrnR3bR2UA8lh3PVpFMSTLLTG8vo9IRRUVqEU9GhgldYbPYjrhvlnipbcb7fNnT25hX18rqS9dq/f3tnd2PCKNdynIUCXN1CNUAiMxbwbp05ggnb6o1fHmN4Bu8nFj4HkiSPquKZaPu7ioAjcwSH9TsSrHYOkSIviZQfjbvSkaZv44BE+ZEB9o0/QjYpzPO2acbuOnGzl5KfmozLhp1NRxc7hXMAaWriw5wtVxFO1T3XoTEK4QNxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhZrkGA9yqBj03qmGTdQPxYaTe/9Oi9decRyNaof5a0=;
 b=cpINYWI7vgOj93qlUxLhz/KC5sp8/J0AUGevd1lKFKNi2ityMYL2emIvH5x56Tru28C0yUxRwD6mRtJEvFJNiMgWF8a+X1TLx9PXZvrTjPn0C3qc4rfUwRtJnU4m/R6mwvv5YrbemgIbmlFyv5rdPNIVyRNfB92UoTkQsJRTvXJQxM1R9M897QisjHD0gbOl/Qtpu3SPGa7IrOMeZs/CkmcWz4w9GCFmXDJMByMYeCRAE4W9KuiGEYzISNeQ7DYX96n4dF7imOO1ta89QPVSEJ0yMNVwtV5IN55V7ASKS5MBSpoVF6XLMndW04MH2qAYTfPIoKMwbWVTX1oaZUOPAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhZrkGA9yqBj03qmGTdQPxYaTe/9Oi9decRyNaof5a0=;
 b=Ob3IOl6o0ljAf0IFODOG0ZEbb8+S8FQwqxwHXfP4eQC83NsJtRSZljichrAxQRczVCeN5zTDPmFzPOj9rsyQpE6IMCu+6bI/HwBkiIEiq/hD4MAvCMCy9EvgOWPPfGqrvpK6Y4AHzMuVdWzOIKoFq6Oru9ZxGffNi+zN/K1eWhG2m3yfGrIA5LCXUlVh1I9BVFE8+PPkhJJnxgLuU7GDpVjaDa3akzLxUrNZBQK+reV2XH8cfSh8fc6q2lp7mE+YL4wEpMpCbdQI4G0s6ZCS975KruVD0zub3YQ5TWZ4FQ5hlv9Zg+HUaZOM5jUAzNmpg9Gfk3rIFV+hd4uK8qDKqA==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB0673.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:15b::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.20; Sat, 17 Aug 2024 11:44:53 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%6]) with mapi id 15.20.7875.016; Sat, 17 Aug 2024
 11:44:53 +0000
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
Thread-Index: AQHa8JrfIb1jtHKrZ0idpFPXYn5yiw==
Date: Sat, 17 Aug 2024 11:44:53 +0000
Message-ID: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [u8veQd/j0oZnldflgVZL/JKNrUkaqy9+eUWAqRBIu0VFu1zdj3ariVvPH0VteAJF]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB0673:EE_
x-ms-office365-filtering-correlation-id: d5507e3f-2ab7-4f40-f368-08dcbeb20264
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|440099028|3412199025|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info: XQfvK9RhhnNuKyFmuAnOHPghmhglH8mtEKqRZC7f97ShkTYy2uf/7I6Cspr+oxp7bvXUtDJgGVYFqXQaYcU38mwgyBJr0X/5kkSjxWyM6o3CfCtYrgZWHhPm1uaNNQwUmJd6j9A7KsFQnH24OiztrdIilBo5/0cJ3OYgA/4vslve9trh1NYszGnq9vSatZQkqfvFxh5HTUW1QK3RKyRJHphg5/df+qHykvU2yaDYsb0uLhDgt4kNMnb0dhziBcA38wAQTm9/f7zWJCV1EWwv/lnDANH6wOJtGXmZrYXNbmji4AajIM8wBrWyZeqkQ31C/nKQ5wOzTmjjJ7VJNNV+Nrx94/lL6Q3+/vKyjJ6KhurrZ2PpQgPrU2En5Uo5H+fio3/WYXvp+eg0w55VwfeRQ0tsW6hKFFlB5exlY/FOPW5LXPCikvYT9HsYEWwmgUNcd4xGofh9XfO+Gtl3yDfBMmV1ZSN3L6qMkq0QLDrcN0855E/jkOgFit0OSMX9RgR5rhrAr2DuO9h+H+NdCR4Bh3WneSJHWGmyEo6pipkB1SH4H6Ze/E1EJqdE6IMT2w89no1oi44iLoDlOjaVQcRN6lPAzSIdE5gijwegtcAvolUDgHt/danHPQaxX4/TxN9CSL5g+nW1M7PTrmAIG3JnkUAP5CfomaQEKz7RJ/OEni9Yi0mztKosiiHhM1QBmnqrr7RoVgBpfZdGii0Ci2n8WSqURF6SF2I8VW/v4UIWn/i6kcYXQgPf9t0GVtfLPUgI6OE6UX4sgqNWR02uy0Wk6meNopsj+ruWq7MCdqJrhqs=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?wEVZrMjhQIu9gvLjzDLFeh3KHZe3vSZcSWVl3X32dg66w3/R9Ws0LMoy3e?=
 =?iso-8859-1?Q?Ze7g4uoqyQGy8GXNO494mRe1jmUn1W0hzzckic6edbcFfB8FDgXLhGznrF?=
 =?iso-8859-1?Q?NZNuInZXWJZU934mFPrHrh1+gm0kpsiMaZpR87Fmqv+JgqyRw/d3DooYrD?=
 =?iso-8859-1?Q?RCScUgsLKe0BaJvJbsxfTIx+tLYFXXIlxXsGl+MT7v2v0FCYD1A6kfe6Cj?=
 =?iso-8859-1?Q?8fqvoyt3RAcsE/PqbeZrJIFXO6LIutPUWEDsOuubG5xlVY/Vb3Nk2YbU7V?=
 =?iso-8859-1?Q?zXhgLH2hIeUeXuAsB6/uqBNP3jwpsxHdvETXBp23k8nSATL20YNcc/ro6K?=
 =?iso-8859-1?Q?0n8XvS1OrdFZSL2m1p+2p2uH/cMTgtRAPrjziNS2kcMYlmcSbTyp9piWy+?=
 =?iso-8859-1?Q?rE4hM3QOzuT7RGyQbZbniu7Y61h2XcedkexGOKm0uTtoP41xN2bu+YfUwW?=
 =?iso-8859-1?Q?uQTSEOeuzknm+sGlgtzHYJhTmDFxnTdZ+hEz+iPmGedNqSvEKjAG9n/kR0?=
 =?iso-8859-1?Q?U8jdJOelDYYEdhl+urjaCPq9CO4niyc1P5vEym5qri+9Niafl1AEQQPZRs?=
 =?iso-8859-1?Q?vmRE5e41lIvASKaOgGYhbYBZ7sQc2vSU2OcVYJxNX8QJL/z9JFL6p9ZOJE?=
 =?iso-8859-1?Q?v4R99DL3vhl/0gg7UAYdGUYkaNoZxICRcp7EbYIzy7bBIDeHHloh/MnVgQ?=
 =?iso-8859-1?Q?Mwl8d0c+n8q/kUcq2Rdc97cbLxnpk+3GyXq6UgJkhlsMMg6uhLz1TBW1Uv?=
 =?iso-8859-1?Q?WEOEH43fRIVATQs26vlFLbRlEsN+hTMtIjiHk8KjDo7Hhk5RUZwOqBq9HA?=
 =?iso-8859-1?Q?OhpdI8O8J3cW3JHhQxQicUGPsbS1xmRk9es7nb0z+q+tCPhH3I/i8acAwl?=
 =?iso-8859-1?Q?TxlKacb9H41eLX5wndlbTlSpNONRTPNRu7RVjIl5t4J9OmkNnzj7NJgA6o?=
 =?iso-8859-1?Q?28do144W3eTeJ5Q6kbj/MZOZwYJLhfDqO4GLyjWHvN4EoMBTrd5+I9KqtI?=
 =?iso-8859-1?Q?J7ym0fmZS6pkKNtkwpM7A9k7F85HEhqss0Sz5PV2AToP+3d/HBknvgAKSO?=
 =?iso-8859-1?Q?TOPcX/YJJx+Kg4xWnayKm+N7ZGNzF1GRbuk33GQwzXWL9sOraGYjyV56YW?=
 =?iso-8859-1?Q?eGrePFyOgczQ6f+BkTF1DvptEHqibUss5wtv2E5GtIqM59j7mS7tRohQq7?=
 =?iso-8859-1?Q?s2IJ1c+y/8TgPolrU36reFOaFmMxdiq3iBIzJ1dgzY3qmxX+ECD7g9bIKO?=
 =?iso-8859-1?Q?1VSRcm1pQwZI64shJjW/cOqT+ayydvD0T/SNWD7/QQDzEMhhvZ5bC++8uQ?=
 =?iso-8859-1?Q?OM1sf8lLK8251ywqgcxjH9/gbfrWV4ll71dxlWF3qHLFPoX04fMaMyu5D2?=
 =?iso-8859-1?Q?eWxYmkkEjI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2F8AADA89FEEBE458DC7A62DE6496453@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d5507e3f-2ab7-4f40-f368-08dcbeb20264
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 11:44:53.3302 (UTC)
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

