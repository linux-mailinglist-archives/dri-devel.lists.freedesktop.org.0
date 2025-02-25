Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6BA43AB6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:07:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAC310E5EF;
	Tue, 25 Feb 2025 10:07:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="lAb+X3tR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011025.outbound.protection.outlook.com
 [52.103.67.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0C210E5EF
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UZf02gNA9krj0YDuDJYFAA3D35zrPbl8sEXcH/INmKx27WKlTfefKd7Xrp9jrNdMzmMXulBHLH8bWhwkIAzGqMqvDMteJrN0FnuPJP3gQU/KinV2ohjjmo+D8+/h83CMQRgwQqfc8F6HmB1sRxLJsurFx+ks5a5mRL0EGRPbBFgMG4RBt6S0FWmojqDa3du0oo4MzLQKpLEZjaAzM7mIGhdkh0NhuCYGq0+f8pjs96CohQ0GUvnC1qOdBFu286AL4OVtEf00OYzoEatNkj2BVFGs0NCvInl6j5qMmFn9+cIuY1fs/53DJBEBMbKzWxJHgNh2+MM1P4paeCxT1FKphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrRHHC7oqituIgsFV504np49h9R3IfVUCymLOUY7pjM=;
 b=VLP3z+BTt1F0MBrZXC54CmP7mkASR8+qvm3shsK99Xa2nXGWTozIr16bDw05VLCB2ffZIE6d5udn3YtyYX2703jDnVcZAZ6UpVAp/Ys+kl2+wLyocGjMrqyec8/6hGh3f/AIUPcdH4JNOyoVQB4Rg7LRVavnayS6V+5CxjDyEGjVvnl5sIag+nEJbChKm8LmwYb8dMqtuAaSJmmuEWfzZrqVpFGN6N+CPEg3pOSjBxGKbGQWCqRYC9qHpi8DjogJdzIeY8hxZKXPblk+2pf2WmfESELhI/7gtraQ+pKIE/LIIEbDJIoHPiNYHf5pV/dH1xAL9J9aPpCvhWGG0nz3gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrRHHC7oqituIgsFV504np49h9R3IfVUCymLOUY7pjM=;
 b=lAb+X3tRpalSncoKZobMUeyPnnPwcT0EFV9bMrESO0rlAjeVhMx6sNw3ff76gg3huRX9TCfI4vzSCmR9+BLBqmNHPqq+qkqD7RpPb5lEXEH2uCj3PjSkcAUrOU5PKchBIRuUN3SV0UTAje2YQWlZgBxNx7yj0z39CUeYJ1dEAy6F1cDurVURKFf5KBYaHgiIbt3NAAUCMAKSZ3MxHMRnQ0iI+7NjnIQYbqJFWUXswDd1U+UvD/d9n+6hd5nnb0v26sWXHKqAGmm5Ba/IqZ7T2M9edn4eWM2v7AkyUCBsUbTryRYGGR9U36OtWrpGjPHWONMGObTdE7iRzNigk2rf1g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7966.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:35::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 10:06:49 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:06:49 +0000
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
Subject: [PATCH v5 0/2] Touch Bar DRM driver for x86 Macs
Thread-Topic: [PATCH v5 0/2] Touch Bar DRM driver for x86 Macs
Thread-Index: AQHbh2z8jbAjUQblGUW5lXIZ3XfKkA==
Date: Tue, 25 Feb 2025 10:06:49 +0000
Message-ID: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB7966:EE_
x-ms-office365-filtering-correlation-id: a04773ad-2ecf-435b-3444-08dd55841e89
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|7092599003|461199028|8060799006|8062599003|102099032|1602099012|4302099013|3412199025|440099028|10035399004;
x-microsoft-antispam-message-info: =?us-ascii?Q?DEQfCxAFZpNzRDLo6PGIc9gfc0uDVCMI41b9oqo7HJAuyI+A+ZGev1vYF3zt?=
 =?us-ascii?Q?L08LvjJp2wbhE6/DozNgNpq9oImr4acWe1tBwpnJhihHd8UJMQexDqXi3O3m?=
 =?us-ascii?Q?UB+HIdaV/JaWXLVzudNvKM+8kccqJY6hCPoJctIRihBTlnjPctglcqiJnBn0?=
 =?us-ascii?Q?YQVPIgiI+A8Bbm4PrWW+VaUNQBvOvsVXEHtnISxOn3bGMXqzvgzYL59S+e2u?=
 =?us-ascii?Q?/WeyN0lZDh/54qfsUkrge6TKju9NoLxJkC91/5zmspTmSBcvu05+eIA6TdDH?=
 =?us-ascii?Q?22Yzw6kSK0y0LZXYustZqzNR9yticvjRl0+2O9l4Rl/FRPWoQvyt1q9R0oej?=
 =?us-ascii?Q?5WURi6QogaQ313tB/DyjMeKacvQ79niVdeBrl90nQgDM/7LgIFd2hzLAxNlF?=
 =?us-ascii?Q?8t3mZbi8VlBAqIMWkrgNAaHmrJhpouD6MunAZ7xisHJpRCtdw4toB47nkJwz?=
 =?us-ascii?Q?cXdLTVPqwQrvwmr5hqI9p7/hynMZxg7MCehN3Qsl/iMXPd+ROxH8f/i5DlGD?=
 =?us-ascii?Q?pRewpmJtL62Z8D7+XYmFVH9yFWIxBqMgb2l6PQ3JSC+iXpuUKyj5t5G3JoVt?=
 =?us-ascii?Q?3mwE6KdFhJF5IT4XazfY3NLSVsIaCKlJyKgjYP/iVc7AJYo91YCFMleMKqSe?=
 =?us-ascii?Q?pQJ1DYE1QIq42gOZmbByWXlZjpBeVW0Bextd/s90/bTSaMvV9xOamqDPFFSo?=
 =?us-ascii?Q?9FE49hFa1Ii0x2y4mm1/1fMQ1+U2xHLh6zXFiN7KHoxAD3FE4bxmsUHKe+PU?=
 =?us-ascii?Q?C3eBdK3YTpKBlQ7nVq3oj2/mjCCutQcTbiMZItzVqDcZOp8hTvemvceJJzI0?=
 =?us-ascii?Q?CP68pNZpEpgbU5SUM9HVQmNr68ivxZzYFhQQl63Py8tYmQFTJeNTyMez7h3a?=
 =?us-ascii?Q?xf3kd0mqHEjvje8wyA5i2D7G4kG4bOpDemiZg/TAG8Txm0efzaRHwcHiuzWT?=
 =?us-ascii?Q?GoJ/g98uLHuc1OvobEAKTTDfJqx0I0V0HcB8JukvS5tur1u8oJ3jGfqzKJ3q?=
 =?us-ascii?Q?v0W4TzyJExHkE4W+kWmvkM9Wm5jsNRvNBThpviUcSa8qQm3avJzIdrPIlTQS?=
 =?us-ascii?Q?69KH0s7WsU4GUswl9Mk55oDG7PY/ykgPeSfiwLT/+cPf5sS740UjUiOIrySG?=
 =?us-ascii?Q?qva/f3xcsuQC/4Pq7e4Ffh39Zp6584L6v5oSMsc/E0jbwFdtwOO/jbbBGzpm?=
 =?us-ascii?Q?76Ba8Zn1ZmywEd83?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZvSB++YP5VQo/s9b8V2r1V7fuHMuQbFrtHzzISbFw47SWc82wncL7Q721v/p?=
 =?us-ascii?Q?Z0r+sziOstLW59H8KZ/h7aBYziFeCyIAp8+M6ee3Y1yXNi7MxGXmKly0Szzy?=
 =?us-ascii?Q?3GC4wTDVN6Z80i91CXEJbA7wyNkxJrgI/bZ45QfOlNDX3okZboOt64AkYCPU?=
 =?us-ascii?Q?0441s5jDAnU+HvA7/VAkkg0XG2/qzf0KUByh55apSugfBvzQMeY9l8erj9vB?=
 =?us-ascii?Q?Xf0wBN7un75bYcNl7/WdfReGeSIt9Vz4fO/Yef0HWFsLUHdZiHh96xyK8IJo?=
 =?us-ascii?Q?zWdU3NwUApcb7qGz7f3XVEWqicj9hWtGeYdQlsex0ZLdZRLMQp6n9bmzY2rF?=
 =?us-ascii?Q?VEamykQWDaILogpiM/OqKmGePiOEoiZd+h6DDLGF1WmvFx3pPWBHPwx4cut+?=
 =?us-ascii?Q?eCc+tbW5t8jpJGyEXgCvnU7PfqhrVWM9ZEckFyipZSfx0Vy89V5odLqaNs/W?=
 =?us-ascii?Q?5ZYdJrNhOAqZExouq/2UtJcWL16Nqh7p/iMElDhyr+HzmguCiLfaK9rhqyo4?=
 =?us-ascii?Q?aPVMuha0Gfnk8bmfKmmybL8ebRkGPSTW+LufXURNvR1wkqtPcIGOwhQHycVE?=
 =?us-ascii?Q?95VPAqUXi/rXnSRI7dnyoNCMB3/ThqdoxONbYv7YddIuIESD+aXs0rQ5/o3B?=
 =?us-ascii?Q?SwxK484ijYGqXFKhoho8YmRzfL+IWlBSjYTMIj4OHsgYLCSasrpkfwAORabb?=
 =?us-ascii?Q?k2r3C0OFQmyzDY7+wUruKs60zcccaP/jgI1vR3et3LYRgS4nZihkutQMFG7j?=
 =?us-ascii?Q?ntJ+DxF8tBOethImxWyAafDHZKZMYsTWkP1alEOlBcCrMhEZZ+PQ7SfnW5wA?=
 =?us-ascii?Q?9WIeMS0c/hThAOPZKfTvb9CHIyJvPUeEJhAQBHfmFCuD+WeVqpCD6GqLMlFb?=
 =?us-ascii?Q?C2s7QxWEnKFS7jsE0HfhRqRTX2dG9NxFHEwtemDAehCJVmpAh6cawa0i5bt7?=
 =?us-ascii?Q?UPMxV+OqIZKN+GPeQcxWzZHSkocOkTLzrJkjda4dFtGTn0GQy8rhvwu05xo3?=
 =?us-ascii?Q?jMCt2QqnzXPe/1kdOZKTPJgrgJq6DKjtVTMINOtZAh0ZZSvV/j984w2clWV4?=
 =?us-ascii?Q?pa0XobsAGC4QGGc+gRPje519FoR3etxsrXsSogyTPH9QOY00ena8qZrLbHot?=
 =?us-ascii?Q?9yGsG7CIpgewfX/3vQf0l4G5NXAGFHCGj3F7cMeba3vDKJDIXZ+mszLlB7sj?=
 =?us-ascii?Q?PgelgYoHw/7rOgLbAyCB8zdJRDWFHdebEgX8xjq5oIqRsXQISHATQw+CA9VC?=
 =?us-ascii?Q?inWUbSftZWqp87sYD3gV6Q5BRBBnK1AF/id8zYFOCEzT6MQrOWcm1s/1TyrA?=
 =?us-ascii?Q?0mC4aHAqBXvNTXYk2p6+n+9N?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <690FC4CF83C2984C842BD80A466A8877@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a04773ad-2ecf-435b-3444-08dd55841e89
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:06:49.2215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7966
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
 drivers/gpu/drm/tiny/appletbdrm.c             | 844 ++++++++++++++++++
 include/drm/drm_format_helper.h               |   3 +
 7 files changed, 1003 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

--=20
2.43.0

