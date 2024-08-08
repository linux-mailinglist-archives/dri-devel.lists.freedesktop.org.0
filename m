Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC294BCE6
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 14:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1CB10E049;
	Thu,  8 Aug 2024 12:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="FHHIkrdH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2076.outbound.protection.outlook.com [40.92.103.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A4810E049
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 12:06:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUOlNQUAMdCw0Br+NyZfxW7uKL9k4RCkHuMT+D5V8HDqjTp1KC9eOXd5E5nz9Q8Uow7Z/VUsL0YrmJ3lxoOul7J35rEVH75UVRvuM3M1WMsTY2ZMsFdnsZZMqZOqsUhxQdQNxYDqtIlHAkTFfCMySj3EOjjz87HtbzIOlfcJNwDF4Yc6QQQkwRP9B9+SePXZJBkiCL1HTvs13tFqkHCSKX4sn7JA7otkE1tAUgTf1yaQQHX8eJL9T67lYkaCnlQgyjDj8WDZXGlVWqS1OhLGIAsp8rVi/MriA58QxntblcDAza2lBAMkGpjjy1aQIYXJCPawk6uRrnc48Z6P6d4Eaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOUbGrF+b2BonyYuam42yF6r12JT1Gq3gTCmyY1qiE0=;
 b=j911Ne2Mx1uYQBZUxcYVnxdrWffOWYCDpB9Eku01Gr1CSdkkxVjAJY23RaMTbyCi4kAGsO+7HvTkkm2j3mFozrPvgGWtHoVBP7YlnMYhbEkDmQPQRYtqwskLYN82/jW05jzpN3Ulqvcn6khR9Plv+7XqcA7S3UJvFoxVanv0UsPozaADd4/CG5V6pv5y0YuA7cL115bXR9WpL766CWyxzVHQCr2j0C+fdbsPkZ1DqePHrD7x+eyxxR6w18V1i3kxpMa2txdlq12MV/8/HMyaL2iKuIA5kxAEzUv/rKLFv/1cZm6Z5QngRyN6y+EC+W4qmRkOrg4DfXzBxOgDBgBNVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dOUbGrF+b2BonyYuam42yF6r12JT1Gq3gTCmyY1qiE0=;
 b=FHHIkrdHe67LcbUGloJdcUwDJ+Pf/t4GBu7rXN3dmB7ESSh1jeYaY2sCj6v6oYq7fWyBFql3pvzG3tJ9OMKY7LG3ytJ5EhPQHt7kRqXr6+dnK6WGfKrjMUXZEsvSEX7eBcW+IEjoS74TEu/CmieiVmvJswmOlt71PngRAO9loKBZU/G0e/xo0g1BJmuvo7EdgdAsmDblfk/lxJlR48Zt/X+P1LEXBHXvSBRKBvI1foeb5TRcGfiz0RHWYZ/LRCA1aF/iJbH/qoOxrNFb89098sd8xUoA4O+5r3hpjmyT2vssxEDTMyqHqlffRBDahRglNOmOeJJeA/Y6O9l9OFaiBQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB1977.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d1::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 12:06:15 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:06:14 +0000
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
Subject: [PATCH RESEND v2 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH RESEND v2 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6YtdumX412t+T0eZdbiMYDzhUQ==
Date: Thu, 8 Aug 2024 12:06:14 +0000
Message-ID: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [0QfNuKxjC2bdCo5GfvijRgsEGwCPPYBotvabNFPhxT+7sdM1fP94haxG5WQIqghLN9NE3GjZrlI=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB1977:EE_
x-ms-office365-filtering-correlation-id: 9e563a3c-a593-4784-a5d3-08dcb7a2801e
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|15080799003|461199028|1602099012|4302099013|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: 6wHWtCLhCA9lccSRuFIXW+xntbMDZ5/9aloCht33BI6QyvEVmKMmbe0en2e6UN5wxsIfUxiModZj0r7tlHrj2c6aSbl0XSH1nBktwu/c+Fg7dCsFuh9GYEdtXnKVObODOWh8DxMZKwBjKVUITczy1VTebNM+XaTK2nGPAqod5YWt/tMAZI3kVLGR+bcuXpez9M72yiMev+2kw8DHKzPiB6y1dK2tssbCT+nbGtZxfeRQFnnPhiTiV3LXL5XcWcR7x20Zs9Rdyn797fwyuTluuNB6Yifvh2K3aLlZGCW6X09XfrmPVzP+eJ1vJDs09lKq5Zn47AiDqqSI1oI9EdDZyBmMss1CtUWWdLs5dBUgDeaa/0y6kJJJNALpoGi8mCxEucESMczcrsXqF+ThQadynzN3V9RVWqqUAOO8h520Lj6SyjiCHh/5w/GB+QJPqvLl9KRbWgSw+JMP3AGtahxangO243nR53viURse1Z3cc+/JwGgsKlrAKQpmLsPU6aiaw1AhIQJjiZwWb5Kqbm5wnysJxnazY5rZvWUcSDxNxaaZ+P0KbFJIqzEBhSAULGLJL3lR6r1y2I8M6Sr3bU+fL1teQDGTnPaO/LS021dAte29sih7Utw8cPuxpAGYNisrK2Niv1DxWg1N/8ebC3gCbjxH6q7M11qYmiyQt7HD6ySzZoSPuIEWfbbWIEfFojo2JzXdEAbVqM8VB7BQIShcucpUnZxKNDezjdVzYo5LBXiGXo3fvPjTcbXt9g59IPdQQVQ+fNrMdxY6Vj+Zld2tmWll3y3stINDjFVHPjTyoWk=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E3Od+8/ZjOntSeNjKlUidBTddP6KEzelp/dKZkR3WDA19ORD++IYEvDSqPNV?=
 =?us-ascii?Q?8AbVgzofYmIBuc3YMo5GJFxBHM9a1sKK64iMidqPak7RpR/+FzUvjRtcROIr?=
 =?us-ascii?Q?sc96CsVH+/+HzHPILbiNAS9d/6qxWvu1c7WNw+FfxbLa+0t5lsRbLs9W6ceX?=
 =?us-ascii?Q?ULcnAGsnGqHqAQWvRF6pMSE/gfxcgnYLYnmyE0AMgOVysDE7o2yk2hm9FXnu?=
 =?us-ascii?Q?ZJBarVvBA3SMrrDvDcRr16sd0Kg4FDQcU4U/VnM8dqxCTXgRhNQpxZ2NxuMX?=
 =?us-ascii?Q?lvtMIpdE1wb9pYX/Ci2HPsF3fMv2jQLEiqp4zz0XbTe0Aq6jUUXtvEJ9M5B4?=
 =?us-ascii?Q?QGe1TuKNk+tYZM0LghL7Mk2moeaFcVNa6mBXxEz+xbtLMQi2SPBxM71x7QFD?=
 =?us-ascii?Q?oU9AkmpXHcHKrHLELMx8Ge4ZHO1LHZ/BK7PqbiCoHplg6Z7YVeaspWu/DDGQ?=
 =?us-ascii?Q?TFclx2UWuKYfaApiQbNZKXuqF12UISoC6OvW02JgYV8n4oQx/JNWT7vUzm5U?=
 =?us-ascii?Q?OL+H9jiAUVtKz7ONhUJRSoseP6tUN6PQgQSdmXH8yzClti6Qsv4uS7yiQz3j?=
 =?us-ascii?Q?WgdFm9TtgbuEZ8FZa7VymDcJttjlLAqNo91WW5I0iAshIbzeH+fyMlL+YRlb?=
 =?us-ascii?Q?6raBWd9cpCjIAO1lFzN13NyfomWl5ZgV6eP/H1Nr97EZhwhmH80H/nHqkyAR?=
 =?us-ascii?Q?QCimWy3NTvvMYwFDPfjYQidUm4UM+C+FLNNt6L9x1PMrGsqR27KJTr2yTIbJ?=
 =?us-ascii?Q?7RtbjuD3lsfZ4B5oSOmWJOkzosu4gS0dafVNw/GFoUdeK3WCvsSNyEteD+bP?=
 =?us-ascii?Q?r5geJ3U1yYdPi4F3XwWIPVnqtnw4XRyxhvrRERUOhLkNPdH71T+OZBJe9FMu?=
 =?us-ascii?Q?0bbfYefYX9WRbkm3SAgElFpQkYI6jmM+pgdGTjPjB0ASFMD3GyYd0RfDkOxk?=
 =?us-ascii?Q?4/uQ/gfp0tVYP33tOPzoUCfuoYHt6VCMihAN5CJtQMpNtcF0rixoiTAgVKa2?=
 =?us-ascii?Q?DognChC78zdg6RNE9GcvVEX/HqknwoNQrFgIXhb/hz1KGP7vOumj+mlss5Xn?=
 =?us-ascii?Q?sDVDMJsXVfjs0FSMvLQK5MHcVCSY1HZgMYPrXIj2nLF9oan2NDHom+drY4h4?=
 =?us-ascii?Q?CxpcT+OzEeemYdmwJGnsHeRsRpmT1BhRW9xwtP+9Y3n0q3gBD3YheHaUtITz?=
 =?us-ascii?Q?1VyQVtGtDJXITJroYAz1le5SYQrOzUqWGQz502fx3hWDKbyXzpEZH/YErl0O?=
 =?us-ascii?Q?v5Gb6O1tDiqiXk7G6rgChg8yvMw2S1TE9yPhpUHjI3O+kVcaV9veDt0glcyy?=
 =?us-ascii?Q?ENiKnjtWo/y6q/WJznGqIhxM?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1924A9511EDECC449272213F23A99E59@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e563a3c-a593-4784-a5d3-08dcb7a2801e
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:06:14.1402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1977
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
 drivers/hid/hid-appletb-kbd.c                 | 303 +++++++++
 drivers/hid/hid-multitouch.c                  |  60 +-
 drivers/hid/hid-quirks.c                      |   8 +-
 include/drm/drm_format_helper.h               |   3 +
 14 files changed, 1385 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hid-appletb-kbd
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c
 create mode 100644 drivers/hid/hid-appletb-bl.c
 create mode 100644 drivers/hid/hid-appletb-kbd.c

--=20
2.39.3 (Apple Git-146)

