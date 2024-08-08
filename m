Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D1594BEC5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405FF10E737;
	Thu,  8 Aug 2024 13:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="pmkiImQq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2083.outbound.protection.outlook.com [40.92.103.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BAA10E737
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:49:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTResfPG9FU80HDw2VevsOhHTREq5RZZpFmJFK8hicz48QcEcYdSR41xtjMJAQobsI3rGePiPqhw9/SzoBeHHaPomRU61eiIsBuLXwdEfH1Jq3bzDDaIYcbVELG+F1Z0C31PUsDncrTI+ccUFXpHnsDf677PpGADcH1wGv87a9/OnXVTf0K6+4478QOvoKl4jfIsqepq/d4aHZqjbcO523WWRxFiPYEboAG/2SYTrmsOqA33Jv4nzWkCdrpPe1A0myRFkFqJUaYoeQc2AI9y9JyBvK8W+fYGv0LE5Nuy7tszkPEZ1VR9Rn0MWnrSQHq1dX1oZ+OSaupBc0lZUtIzig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YS99RU97RhcjFMoR07SwFd+TcQZhf83d3HAXg0N8tF8=;
 b=CnhI597kSkeuR2/plxEcSuXy7pi7fCmUpKtSqT/nJxR5gs+hN4PiaObDcSJCAvUc9HUE/CGvCrJ3zGvOSYDJlMn36V46U6NUNvQ4/2wAcER0hTHNblRD3GxOnV20TrZqGovGfhUohT1eYVxc12H/oqAXyZRGON5yv8aLo3aWHS1bB0V7aHOOseJmwIUgq7hQTXJJrZNXfi0sHFCNkeYTnqFNJ2e3sVXexz4qKsZ1tmp7OjzYUHlcA4pUqUfttejS5XMjsIO8HZQ6pC15nVbUMAcEicN0mCjKaTeEHEdgQWAFZ5bPxOapVvQDIzeB4CPb06pSlnOlr1zIWbhyasolyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YS99RU97RhcjFMoR07SwFd+TcQZhf83d3HAXg0N8tF8=;
 b=pmkiImQqoj064dzTGBcBQvjzoSUf9eIwiu5UAC9SdcX2LlvhIT3GzKgaalbC7KtapxiyI5pMQVu+MEcfmZ6dh/wUA6Mbi1ImEH5K55AhUjFr5EVGKWGfxKUQSKjZG0f63rBne0yVIKEq1XKlbt7Taqssc2PNtBIxu2QeuC9WQkWCgddONPtcBrTQFFXmroCWlSF0xtxIfg8ezmd4gXNXblQbSNZ2D6zfFKvMao4jXaJMgMnEZ8owdzLghQTG9d5Gj8eP2x0LtdDDpc3UGw2hnahNjfollW39OljLxMvsMvJeEyCQuLL/DjNbY8DypYh7QKvO7rJ3jfa7nKVbV7Fc0g==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1976.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.13; Thu, 8 Aug 2024 13:49:27 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:49:27 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
 <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
 <kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH v3 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6ZnJ5S1PtCl9AEC7pS90dp+vTQ==
Date: Thu, 8 Aug 2024 13:49:27 +0000
Message-ID: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [V2lnGgel1H7iyyD2cC99WsxSmnDSpyK05xdDhpOCrqO+IGQ0Bq6s7SM3iKUCHYO6rB+eZKExDUw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1976:EE_
x-ms-office365-filtering-correlation-id: 442b4050-e362-464c-bd31-08dcb7b0eb84
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|15080799003|8060799006|19110799003|102099032|4302099013|3412199025|440099028|1602099012;
x-microsoft-antispam-message-info: GnzAPRVSJ8UCi3fW5IoZ/GDP4KMX4VV4xHl81hNKj7aQMQt6a6Vw6dj2nUQtR3KXz5l0LB4ggQjs05Z9cvq2J3oY4YCUjtvB8BM4ESgn3XRrMsdZBhp+0TVb3E04/NpudfZtwtCpi7BESGgF9U/CLsYqb9y8sIRj+Rc107h32dZbDEVylvfA6zU3FvC6LVnF+Ys41SAK3GFWjWxcm6BAwpQW4JZtb33VfmJfe3o8mOq5DLkEsm3a0cX5pEyc1QqI/E06yrP766iJ9sbHTQHoKv5US95jhUkZ33NR0K0mhEAZsrIoIZyYGFnfwTFKPRIyZPBw+JEk9uReclGBpFBkBF5LjsVCUhHtiK+ypOixmVlz7da9UaRkaDHZVdF9HhcrZ7fBoPCim5zCepXdP2YGYRz1JSNx3LLDk5/+1bCF7ODs/Q3XBol9x5PXWEcz+UHBm7m6W4ZEjx7OPMAmb9K68Y6/Kf8jwzNBnxg2NMIHYzOC3slkb+THKKUdTSpP4rzoiBrvVADU1yFCEQAIPBq+Nk9HaEgcelvtMLA5vF3o7rQa+GdDc4fS7XzppIf7HwW2tVlbCnvsDWqEAJm03jU93bvWoZqmWE5jUkJgcXgNEPAfN00xB8sdxzPDl3buWdo9djv6vOYFtYO1ac9jgjN282cbt18R0ZDta4sH/BzVTVIhiLTC2f5N7p3KaBFDmxqgyz4nVK8A3KXxCcMbDjW740it9+Yw1d4Q1XBXcRCs4uH3I+/ijb4VVPIdsDfTBgxpA5c+LXA2tHuOGTmopdt1N7/8qkUV9UZOYKZbWvE3Las=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b/UQrGvP+HXqATW6pgqbhjQWf77fJu5G3YwyVOr6YIAYMs142qngaU6jQO+V?=
 =?us-ascii?Q?j1MMI4sCbemRaqNEDUrg0Td7yUmAx9RykJrVGBjCqAsunxrZ2ppD+E/qfilx?=
 =?us-ascii?Q?GIGltDm9sNlOvAx61DEna1h90ZM9pkZNXMpV603LEFwpi4OL6uryIgVg/ipv?=
 =?us-ascii?Q?tyUy7v4LtZjlwQTsPEFX97374rdIQFvtIGN+YwA7n5p5O5JZLqyNWRmMXhJB?=
 =?us-ascii?Q?c8JQntWvE1C+lBS8P9pbTNNaDIL8B+xXTwUFu5mlacGrCZLLpF3+6h1xApmJ?=
 =?us-ascii?Q?Jh+z1bt/5UI8md8yhxp+o+BLBIuciHvpnzjt/a5alhpiNY1gbX3ZR5V0PYSL?=
 =?us-ascii?Q?HiFc/adoJx232UGyTWk6DSi3W4aYZe0Y06LNQVw0pwrP/JGJacm790TJnrlF?=
 =?us-ascii?Q?tSTDRJcgABbanf1XLJTFq5KEj6MZ8nyFlqlqSzNvBaORx/DkI1j2L/S5rOBm?=
 =?us-ascii?Q?RQlb2QKs6XxlAfsY/tfgfm5OiJHCXWbBXlcngIZvuDAcdRpTfuDvLtdWksg0?=
 =?us-ascii?Q?qEpmNUmzWrhJw36DfYr1D/9S0jkOW8UE+SrVmAh64qwMjForU8fi5ZNSoC9J?=
 =?us-ascii?Q?cfX5Dh/lu4wjELsX7idFqprSVjsUmtLcYnQxcLUSvIRlsbEVEY3i6fp+wic2?=
 =?us-ascii?Q?XIH2ydoOoKTWAjdGw07gsJIo5OzHIWp7fF5hV8yRZVoR8v7eEF550iyHsH7M?=
 =?us-ascii?Q?03S3kebWUKhhFag8ZoeriNiecgfYQ6vBlUZ7+OMLFME/ZBajR8VV9hQds+yt?=
 =?us-ascii?Q?2i743fYrNJE4IpTjdVDhTEnCgHoWReagq9Xlk+M/Yrcue7DUz40/8N7I9DtD?=
 =?us-ascii?Q?qo1WSU7YRXYsZWSJTopT6iU0NbN+BNpnpBRED93F2dqNDKCQGLypIKRuHvkY?=
 =?us-ascii?Q?YJvF1ZE9Rx7MPec+uLno4waMsxFtYNTNAyP10ueaKjJz7q2HRDii569YZ1EC?=
 =?us-ascii?Q?1HRXvP9Q/N3mfjkUMwO+UJWnTopRcgc3j6sGqz/V9phSUwlcAf5dv1pHMX7+?=
 =?us-ascii?Q?mQ78tIsZNE3E7UbPGA+NYFMjc5vTWsWJvzwtrcm1F+etn7hOqov7g7tJjEP2?=
 =?us-ascii?Q?9ECEWzbh2mk7AGY/r5L642IoIIhvGiMGJMVLXbHOJEG+kXxI7EJ6fC7m1uLk?=
 =?us-ascii?Q?uRuM5HQVApz68MvPojVMGzVgMw5dqLrpEvbyLuabgOI8NDHEZXBm8hjFzlGb?=
 =?us-ascii?Q?ldJdovmb7CO2KxWFugYjgUA1Ut7quY6KuNsir00vh1ZnD4KBsaeg11GXBrXp?=
 =?us-ascii?Q?aopdaoubZYIt6sbkhNo56YXqEYNlHEffRWBJSLRr3wtPDA/hVGXmKkmhIwAx?=
 =?us-ascii?Q?oeBTkuspHhLTjgdh1hcgI7TJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71EA9C36F916B14C9AF0CED28F541476@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 442b4050-e362-464c-bd31-08dcb7b0eb84
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:49:27.3180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1976
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
  drm/format-helper: Add conversion from XRGB8888 to BGR888
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
 drivers/hid/hid-appletb-kbd.c                 | 304 +++++++++
 drivers/hid/hid-multitouch.c                  |  60 +-
 drivers/hid/hid-quirks.c                      |   8 +-
 include/drm/drm_format_helper.h               |   3 +
 14 files changed, 1386 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.43.0

