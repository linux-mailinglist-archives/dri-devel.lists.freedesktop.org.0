Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2274A4462F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2048410E15D;
	Tue, 25 Feb 2025 16:36:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="D+LcDvXL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010012.outbound.protection.outlook.com
 [52.103.68.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD11510E15D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GclmxAujFz4j+BF4+wDyZJxa4YWL5NyKoUfAElBEuxRZlZDOVUa4HhI9jkwXmxyY46lCwF45kROom/6MH9G5yQXu2+9bt+Y7QYLJ7iUfjY6Mzva9oWetzyMs3iEpGJ4MriPabPfdD7KKs6bW+CgtwOd3e1pdCgL38VVnN8YlLhgkUrA7IjvTbELXFlL+rXTKFqpg/hBZsIalvAjIzRblWEABQvwqx80f2Shn/I/dnrZZoR/BvAh4aCYeen4JtLJ9TGCe4RWZxxdVmOCr7b4hR6eJ6xZWiiO+n1HuPeIgkYSmU7jJ5kyZZjBxQ8GV77ZxraXjdqWpxI8fO6L2pFKJ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q19QL+OtRoC92Jjntq4MBRDo6A+EUwFde9UHFoySTwA=;
 b=yMPYTia05GXguGYOCc6GkETsyzpZe+iY9USnQhAEGTYM94b50ZWfrcLY1VML1acWN48xDnxKMBsk8e40O1LZOXkKiQNsTX2QQuILWpSgzyh22oM1oCmFILG574eTIRK7yyVNoLHFinAKYtmSqbiv3ZvUuCCcV1kMKQhlCHvuQv/ttC+nDe42B/xZ/1pmkZdSnLDKZPLbEvtBW7Ukow54oObOZSJLB686BEwcvVFm9Dq8Yn+lilYNZ5iInLD4kl3aGIl86ksAnFDak6HpI/kOneypwHR4NartOlIggyKDUYZSRq7FjUQ9jx2l4RFkUx2pUi8L6iyZ9xYsXvp+H0wlqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q19QL+OtRoC92Jjntq4MBRDo6A+EUwFde9UHFoySTwA=;
 b=D+LcDvXLwsq2ytNvYRP6q1jhvHVcVmJPccT2nCR07v6RfiuQpanKOGVSNjiMitEQScvttmQguVoS/98L4oGmL6y0UrDCaJkgDv7hklE+b9WFtfiM8eSKlLVZOTHZEzTLuGLAFxP3kfLTxR9jjDfBerwRUKgu2+cNEyVBbD15V+8j684LzaAUcaIlX0MiaQjdNWhXQTXkk4UbwI5BpjLqxQrQiwd6Ffxb5NMHQTFjd7NZRmQXO/UT42/RHJMRuYURPQd7Wx8cAVGPA2cM5KDPcBr2N9hS1MtWsDiucJpAWSSCf82IOCZ2ifBPZ4E9CS3pp0Q0A3z8dTfxzJb3fRWjsg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9876.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Tue, 25 Feb
 2025 16:35:57 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:35:57 +0000
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
Subject: [PATCH v6 0/2] Touch Bar DRM driver for x86 Macs
Thread-Topic: [PATCH v6 0/2] Touch Bar DRM driver for x86 Macs
Thread-Index: AQHbh6NYhBtU84c3DkSJ+q01Qtt8nQ==
Date: Tue, 25 Feb 2025 16:35:57 +0000
Message-ID: <0BAB26BE-5BB6-467F-BED3-9AA8DE25433B@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9876:EE_
x-ms-office365-filtering-correlation-id: 7d7c26e9-373f-4652-9473-08dd55ba7b41
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|7092599003|15080799006|461199028|440099028|3412199025|10035399004|4302099013|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?ekZYMs2CUuoUhzlIPgjUA2LgNerD7Ws2LjSXIR/QnSidZi4szbk37q64zepI?=
 =?us-ascii?Q?pCK20ao+THyLiVsqe5di9meMDLN3V3aq66LF2xOtlgQGhB4XjJF8GlvPr0A+?=
 =?us-ascii?Q?6B5XCwUZ44btBr2OAXBypF4LdLBXm5ZT84iLClUwiBPEJ8F7kT+CBwVKghSB?=
 =?us-ascii?Q?9H2Yz90N9vtWg7NzraEsgwySyPRX487ddjRyP8z5y+1RJZH6ojQ2PYwNLiHf?=
 =?us-ascii?Q?vQyYug8UIFF4NLw6nro1fit+5ASM34BTlbvgmrzqDxQQumS9AIAbTxrzVy0a?=
 =?us-ascii?Q?Sp+I8LUZXn/NP9MRaRgkDBtqiS6AgCtIx7MDIWJKUMsQiy5Nhj1IScStC4/o?=
 =?us-ascii?Q?YOFwElG1HEQsKbv5CJ9006KThwv+ejy1tOwhAczjL+EPzE2HX1FnIitdPa9c?=
 =?us-ascii?Q?+5llKtZdC6i6EIWAnXUEz6KyqJVoYhYBEpq7DjNwsutm4C/0w1djeHAavj84?=
 =?us-ascii?Q?8sI5nj6rGKOnFD/W1IL8GDPooJvA1u4g5F4HMgJfeg6cb7M+di2R4FTrtU3W?=
 =?us-ascii?Q?dGCtFWy5Yslq33Rmw9LYnYStn98Y9M2TpN8onHu0vJlbWMI1Mb+53nCSyb13?=
 =?us-ascii?Q?YjRbfL4m3GGUqoLpBQYzJO3W4oeXu9llaLjpY/33Omf6WauIQ7t9PrtqcdHM?=
 =?us-ascii?Q?sZMTerwhydxtB0+n2UsSyCHm18bIcfjbtKGHhB85ZopvUPOXpNs9JJnL5M3Z?=
 =?us-ascii?Q?+2T12d87Y8pzBNBE1UClhkL7ORRhQ32C1Ypcz5FHyOBWf1WEqtm0h7c/mD+m?=
 =?us-ascii?Q?L5QABHPkuNOKvyAng6jzclnvpcrtNqBPrGWleEU3F1t1BAl9HmJJtQ4aIG5+?=
 =?us-ascii?Q?qUhAofs7XpNP1NcuApsBfnTGc4atQoLoKAR0gxnjob+PmnwgMxzTm8BlZa7w?=
 =?us-ascii?Q?jORJdswrHMEnpro8WUIwE+QEIwxc0l2P/IUuWzLAxI954OnCojblX3odwkZ8?=
 =?us-ascii?Q?VAXL7vnuVM6ARbA4p3Auk330bpPNOUln2TWhcWZIp+18JOlbXWyvdGAgi+S/?=
 =?us-ascii?Q?cPx6dEHvcTC6fJKHZmKUDr9xAoQPoPnaMvFkwmPDvdV6/u+sJU04E6WYgx35?=
 =?us-ascii?Q?FiFBBEh17HQ6L3vIrswMG5Ha2mAM4ItlHwrA3d2IxhjNKPl3pJmGgOfLfkXc?=
 =?us-ascii?Q?VREqNfWF8iuhozJHg9BrlkthJfhfaUCiXeUlQ1Mz3NQ9S+BDlr8ZJlpCabDl?=
 =?us-ascii?Q?P1klWdk8cBjLLP0D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zTlGRT976HdI7+7DGnw9WMILCwqE3zPM4QkVLKHzficHK3oRx33WrDEXa/YK?=
 =?us-ascii?Q?7vmstxYkMxvp6JJy5MU9+7oa7u/1FJpTqtPOpfOZD3bGFsssDEqyN8MfFu1d?=
 =?us-ascii?Q?XBPUY/Y6sJRok03PcywSZrBcxkIukcNgU6vseyiX9hRIrnjj9jGRtDn/2RzU?=
 =?us-ascii?Q?ypcswgrXTU4mBv41Gps3nBvcciIajyjLZnDasKuYHN+OGaEJjGgNM2oB5YIV?=
 =?us-ascii?Q?gl7EcFoPsfphB06dbpIO0mGMJ2uuSdLV/+QP6MzW0wTLkz8mu4dAS2/V//bn?=
 =?us-ascii?Q?0ZM6UR7VdJLRr0Qld/X8OIaNJmxTTO0drgVbsgGNcmaTVhKElz47CCY8CzBf?=
 =?us-ascii?Q?ws9LUvQMcW/ihJDoSTMtHQgg5z8XJtlJrEtXLyEryOTPDv/Ltf14fx5FTMJR?=
 =?us-ascii?Q?aRn6lhugyxdpuSwb9zqh3QBy4niCNTybnB0z9DS2E4tHenTwtRxIkScm//2l?=
 =?us-ascii?Q?YtFyRzgdPO0YQusG1OFFx8ID1IhzqjRv3vRkb7fRIVDpmvO1uG4d3RgQaABS?=
 =?us-ascii?Q?hXN12Zo8UkA5cZUI5cLalE2noQ+DuLlPyxdA8g0emVkjVYZBDM4oOop0On48?=
 =?us-ascii?Q?d87KFz7JcbbWPIIExCy4Pnz2fc2nqtiyLi/E86yVgYrApw8j25gyP0x12i1j?=
 =?us-ascii?Q?s+KE/PxLPIk+AFg6pyY2zRABdiY/bKjMTACwBFobNl2UNnZl/II8jpcerfrc?=
 =?us-ascii?Q?EN4qCvEsQr/f7rWfW5B5PoNoFiHqI/TKKA/evSa9/hhd6GSkoI6UTGS9NRIG?=
 =?us-ascii?Q?a6gxJE4lN07TKpelaDvkS8MTPoMXYDGC3VX3RS2X+/t/z2P/Gre4HL/UX0fW?=
 =?us-ascii?Q?XFuU7GRma5V9vd/71wdBfdNZWxImpFN1H74548KjKZ36/Qg2sHQGdJh62AER?=
 =?us-ascii?Q?B29MN526510M10pr0AFn42kVCp3DhMXffaWPFiDQeJY/hDFz7vjKU/sgsR2E?=
 =?us-ascii?Q?7zO1bNmKz7cLCVEtJjfa2IwqjQ/iDGgvvH74oVVCWcG27dz9mU/AycM2UPXj?=
 =?us-ascii?Q?s5yBKQROpso2UcxwBEGEkrMk4Wb4YB5uXWVhAQiOE/qWfpF3FHtI0ExPqpKk?=
 =?us-ascii?Q?vquGVrt3NWxEOO+risfZUcsB6dwBiCKXdPp0JIT1ChGue8Z9Oa9e+KrJ7WPP?=
 =?us-ascii?Q?g/KmThF5t1FvjjAPMEtbu6w0Igg4H9kz1mv60IDNNx8XtX7fSLYbWlJUA6zA?=
 =?us-ascii?Q?YFWIV8rUKyTtiMHTnInwsmg6sev543B9H0Y02kT9YvH/Hm9mpo1Aq6QTEUUU?=
 =?us-ascii?Q?v9WhandX6xDFQ3Ym0P2D74SnYXgp/TKlVveKTujC1XaP68LKcqKWFVaO5gbI?=
 =?us-ascii?Q?dvUGovwhecuYpaPjxO15zpre?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <140ABF3348AF2D4398FDDA163731842C@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7c26e9-373f-4652-9473-08dd55ba7b41
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:35:57.6402 (UTC)
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
 drivers/gpu/drm/tiny/appletbdrm.c             | 843 ++++++++++++++++++
 include/drm/drm_format_helper.h               |   3 +
 7 files changed, 1002 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

--=20
2.43.0

