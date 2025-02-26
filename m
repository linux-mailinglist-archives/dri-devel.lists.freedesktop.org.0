Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25894A465F0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD51110E251;
	Wed, 26 Feb 2025 16:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="QS2fniO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011038.outbound.protection.outlook.com
 [52.103.68.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E0210E27C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 16:03:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMRLR/rZf+hf2mFVJAxQCQ9FEML6fxtLR4zqAJO3c1IRmUeORx3qFmnyoltAQlBjPDhcbQHVvZjNL6X1nQ0gQvME7aqPIuLSxMEz9ID6EFulhMP1XPAIOtRMN54BLTkTGY9jCnoQSN8rHJYl1LfNYPePjXaYpXGVLDTBBpKlntYLAtRsSzLvosnotXPB8STJMaX/6GbdES0JKNOo4RLZnFwXA9rWX+QnOY507H9C2aLCaeLRgMhvYvmW8YjUTLkZS+5PlID4lUO9qzZTuiVLPx/4hpbJib66bvqaW8U6l1c8tqeXfWbWPE1J6W081uVXzqJWCmzKv5H7Ao+DUI/3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+njaGkFX5Vxj7o37aChM+X6SXke6g+dPoOkCFCQNctk=;
 b=BnjqQENzoAFH2cPO52+SrXHwdND8A0Kd++X8PKU6AttI3SPQ2xqk9gTYYP1ix3+RZoACZ/5a5ZB+J0LVweVTiO0ULs803jbO3/pz9HHp5z1gz/+SAijtANl7NeM1NnUZrZK34Hd/BLUIPnCoUUiDnD5WqwOChfm44kE6Bj+pDd9tZ/WEXEmF6Nq3HjCCbmW0Kcp78FNDQ9Has9r2NwlUrOJ/HyrD/g4+P8cjSZAmxKDy7yiGpBoLf3YnyzYJSOPrkjkfEZiNpKc3O37ltk7n7XAWYASDARR0UusxkuVjV1qJm01R0I4fjuuR2p/B9uF62WAP9RUQaryxk/ZpFJXhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+njaGkFX5Vxj7o37aChM+X6SXke6g+dPoOkCFCQNctk=;
 b=QS2fniO1pqez+9+0TIUf6h/5F1qO0sqdseU2hotYmZ9udG/eRKM5X9sOLG5deLVAdKtYLxf+yl/eAzVA1442EpuE7/f/EtYVtMqKTdeCy81aVcfDwtT8/0w1OtJ63OGJp2mz9HxV5VoZzvSnrirG8FGVX0GjlOiFMf3lYKcEb/vvochJ5vYQPiLJ8tngk9GQyHfgcsBAKIqEL3Ids+3C6ZJPqORBtJ4qZt1ZOeTlTqGbQPrxMs+0y7leY6rat+TyVQHsRWsLXkBoLjRL17YFzM38v4o+dfUUEGBLmFHo8hQRsyT2sLZf01oDxcGmCw1lTqHhpqxnwCtvdknUn/QZvA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8842.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:cd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.21; Wed, 26 Feb
 2025 16:03:08 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 16:03:07 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 0/2] Touch Bar DRM driver for x86 Macs
Thread-Topic: [PATCH v7 0/2] Touch Bar DRM driver for x86 Macs
Thread-Index: AQHbiGfsOiCAuGGLHU25MkwMvnzS8g==
Date: Wed, 26 Feb 2025 16:03:07 +0000
Message-ID: <361DAD47-01E8-4ED9-BC8C-0F98B08FFA5C@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8842:EE_
x-ms-office365-filtering-correlation-id: 89cfcfc2-3ef1-4932-6e86-08dd567f0f76
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|461199028|15080799006|4302099013|440099028|3412199025|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?5+aqcSbVI9cosOLfXccPP+vvdYO4bLANZd2QNjyZMe7ZEZvMxIQQ0u4YwwE2?=
 =?us-ascii?Q?RQJjfYT1eOb0pFdKqrKhbg7BZepKmfYzFvJJGkGOr+vd2q7S16RJoyLCc57G?=
 =?us-ascii?Q?5Oo6Zm4yA2jYxwi+Ki8D6T+DZ3Soi33wjiaRhw/PqTSgoeSaE/ZciQKUwPxE?=
 =?us-ascii?Q?HFiD8uAIxTsHKRNu4Yg6QDqXaBwND/i/ieQ/px3H7TgUweTCpw1/701DAI1K?=
 =?us-ascii?Q?CYZ4uDdiQyNLEq7tp7EKE595S78hgNiORpGu57M9fGar25GaNPnFzSECDAyP?=
 =?us-ascii?Q?WIRAli9ytN0FblLxh6mQZMtOEEGibD8lbw3hCCYWC8tHcIrUTBiAJ1tfV5vn?=
 =?us-ascii?Q?YZ+WVR+s9/V25XGKAh+YonpproeJvj6cZv7H+hJ053XubqfxHLYIZHVpkOX3?=
 =?us-ascii?Q?5y7vEcbu1v/wZMp+HuMr2L3RBcPNyDn2xpFSgR5QRvSPnG+GCkJ/61H3UpfS?=
 =?us-ascii?Q?DaOdF/uaHhzojJSdYCqE7oR77ToLvvdgb6S1CWw9+2D1Sn5FncZQ/C9th9Oy?=
 =?us-ascii?Q?GQDBuNXaga7aC2KMV8oklCWtgyJKkrwkCAwhvUH5/vIdCCNv2kRGRQ5Kc9q4?=
 =?us-ascii?Q?Tu6ImM+j8afhh2u5jHuefBreU/f3WF+1rpghzY4dsMsW0mPZjH1HINevHpBx?=
 =?us-ascii?Q?mLnq6AOipCXP9VwCpc/EXNIxLTae9P5XLvEkJ/tticSaMsfyuQAkDWwgIb8b?=
 =?us-ascii?Q?qw8UfqjdhLcHoOK/7OaeLOaqVxJltdts+YdniCQSDYSQdmKHlRhPpJZ4zf2M?=
 =?us-ascii?Q?0vZQOBFub18SqssviYeJuh3s79NzfAL3uJ1wTEVEHt2s/eII43uCWSMFeh/j?=
 =?us-ascii?Q?gEuH8SkZwPB3F7wQZnFxCGylBQMgyLAvsePgeA7efCpxpEByTIJRasG+m0Lk?=
 =?us-ascii?Q?HyRIk00G0BOSJYq3hm0mFhzpngmr/4AalJlAg1FTutQ88GHsirCXVtHA2jNH?=
 =?us-ascii?Q?657hgozV/zgX7yiOfxguB9+uYrZhZE/zZ/2nlx/t3J10VP3AIHiOcKG5Qt3n?=
 =?us-ascii?Q?vb/Kap7WDDFsSXs2Y+fGDVV64LxBqaUnAAb489LjTSWDXfGpJYAvscAVIN38?=
 =?us-ascii?Q?bQm7pOIkN72upnSzN9cui4VBVR2/bQ+2gV9Aa7sMiS2oTLDcjTDb2aZiO5O1?=
 =?us-ascii?Q?ng4Fhqs/aVGduVi1QrH9ztf7w66x0kN6FV00WzSV8CG56K6vlugS4p/IoAfs?=
 =?us-ascii?Q?B7ugwRWOsZpHRrru?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EHMyYypcdLcjSWKRbYwp3DRbLUMjSEQ0mu6SkhYHc4wTzFIrIzLaSsdQV7YP?=
 =?us-ascii?Q?uJk8mpMFlTS94CDJPrKZBKOHE/qBLP9fVgUA64zv4/QbypC7VJNNMDFCkDHR?=
 =?us-ascii?Q?o4mRpLvTCgpUY8rnd8RmjBFfHRRNKe8DFAIVFDYJjbgqHd2sMg8GD+N4LXxB?=
 =?us-ascii?Q?WDBI2gIe/ww04JG1yaZZ+2MJ5EBZVx4IYqQSeKIDi4gAwZHvYhyyGDN/yRZb?=
 =?us-ascii?Q?Jz+yE8+5g8E4B6enjBd/O2hGp1qKiHo7TvpGY7O+1NuaL3oh4j5x+ihdtKMX?=
 =?us-ascii?Q?uXhOocJ5pPxbruY7UcUyK5xqVIvfwW60m7F8/EJ6M9nVG3R3z6RgVPsva1Iq?=
 =?us-ascii?Q?MrRl0EeokodsBKWRTKUPsJtyLRis7Ms85mZSTpJ4KBzkwTMzuBa6gYNfABCx?=
 =?us-ascii?Q?liXQZ9u3UTNi08sNfjVUnzQVs/A0QDlmffVzttyJfqynw1MiyHlhGOwHdmam?=
 =?us-ascii?Q?puHnOuOCrEZ+BhamCj+wYGjopMPSNCcjd5s8xN7C6Rvuqd0IszItA4dXK6f8?=
 =?us-ascii?Q?eFCgiqiJR65+xrot304+0NmbT9Hzg4FecZw9zrszT/M4gUewWqo+CBTDYf25?=
 =?us-ascii?Q?AdCD7UOihP04YSTEe96iMLM5nZY+UHSIjLDy+SMITpBDzy2It5qxFGlN067W?=
 =?us-ascii?Q?DzeoAlprjAq9l9SsCQZWLtXwiAlBmNOmsnrdPNh1o/FputYMIs6SMumF8l87?=
 =?us-ascii?Q?rOQeqHNkKacl3BMctRI73wFv0+al4+vK0zZcRdjxb45ULJxnVdaPGIgvY/k4?=
 =?us-ascii?Q?OCjR4873c12+FxTZfSxcM9Zkv9CNOwN0rogXEBgy4Duj4WMo2fGh2m3hzPif?=
 =?us-ascii?Q?RnUF7lO6kY2YePurMgazGKYKvriiHL8U06movrDa/D0ZFEoV4kWrx31qjNmg?=
 =?us-ascii?Q?6kEaMOn5ZzWiSxeM0xL+04Fj1T3BVzj9g2YfpGN0DTmo4ICgSqfpy6aqQa3x?=
 =?us-ascii?Q?1LCzfyVdrolFkz2B4jrpm91ssXN1gYaqUYl5YRM3M/Uh51zGOqNzRjRk9RLy?=
 =?us-ascii?Q?LNPHb+b7dc6bvsjv8qr4vhcFYVHRDglrDRCNsqJ9ZZb8GasxIbCeII4Q7xnu?=
 =?us-ascii?Q?mPQw8CkRzRK3nPmUtJcLkGeQ0hswzYC7818I53/hf9h+BolfJKa1LwVV2F6p?=
 =?us-ascii?Q?zMRzGYoIlTcDIQaG04ru6r4yV9lqIr0t5WV/5X74SdHCDzcCHmv8S4A942YI?=
 =?us-ascii?Q?0hXvF8sqXtxeVydvfI4am1+Eqc1fShhTaHpfukP+w69xDaQE8DZ1rGDtlZ95?=
 =?us-ascii?Q?a5Vmb82UZwF7YHX+gyOGLBxVw4HYKS8qt+rXJ94zgS1hW2R2r4BdxmNDdT4s?=
 =?us-ascii?Q?G6YfSLFT+w5Vn1Xmxf2oWrhJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5DF40557516BBC4EA5EF59311A4F5348@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cfcfc2-3ef1-4932-6e86-08dd567f0f76
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 16:03:07.6336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8842
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

Hi all!

This patch series aims to improve the Touch Bar support for x86 Macs.

Recently, the hid-appletb-kbd and hid-appletb-bl drivers were upstreamed
into the Linux kernel [1]. They enabled the Touch Bar to display a
predefined set of media and function keys, exactly the same it does on
Windows Bootcamp.

Now, we are adding support for the DRM mode of the Touch Bar via these
patches. The DRM mode enables the Touch Bar to act as a second display,
just like macOS. So now you can add a widget, put a clock or anything
else on the Touch Bar as long as you can develop a daemon.

Credits for this driver should goto Ben (Bingxing) Wang on GitHub [2],
who reverse engineered the protocol and made a Windows driver for the
same. Credits also goto Kerem Karabay, the author of this patch series,
who ported this Windows driver to Linux.

The first patch adds emulation helper from XRGB8888 to BGR888 which is
needed by this device and the driver.

The second patch is the main DRM driver, required for the DRM mode.
Currently, only T2 Macs are supported.

Currently, a daemon named tiny-dfr [3] by Asahi Linux supports the
Touch Bar in this mode by displaying the Function and Media keys.
More such daemons can be made with more customisation in the future.

For the case of T2 Macs, apple-bce [4], the driver for the T2 Security
Chip is also needed for all the peripherals, including the Touch Bar
to work. It is still WIP, and will be subsequently sent later to the
appropriate tree. Till then, I'll suggest for get the driver from [4],
or more preferably, get Linux support from https://t2linux.org/.

Cheers
Aditya

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/log/?h=3Df=
or-6.15/apple
[2]: https://github.com/imbushuo/DFRDisplayKm
[3]: https://github.com/AsahiLinux/tiny-dfr
[4]: https://github.com/t2linux/apple-bce-drv

Kerem Karabay (2):
  drm/format-helper: Add conversion from XRGB8888 to BGR888
  drm/tiny: add driver for Apple Touch Bars in x86 Macs

 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/drm_format_helper.c           |  54 ++
 .../gpu/drm/tests/drm_format_helper_test.c    |  81 ++
 drivers/gpu/drm/tiny/Kconfig                  |  12 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c             | 841 ++++++++++++++++++
 include/drm/drm_format_helper.h               |   3 +
 7 files changed, 1000 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

--=20
2.43.0

