Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF56A43CB4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047B610E4B9;
	Tue, 25 Feb 2025 11:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="bDBcPXdN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011025.outbound.protection.outlook.com
 [52.103.68.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D67010E4B9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPPmjORme1xK63vbmN8un7WUe1ERf/ofboa6KmeB/LCkx4Ko6IauEWP1WCxx0vVd1ApPKA8/9GSSHcNpVx+XSgMac/QDEMgLgs6qCYz7UZ4PumLrNoq0tXtGJyCjlNnkg7cUqE6wbsL6I09ezvUsoSSeBCapJx03Xam3u4DicoAtZx7sWPcsV24BVbalgailaN1uzZlV4WC3/kz7K/ysPcesvFeYeG+7mxAztjYO91PfL2ElO0l16hfLoyguOjid2CBrrTWNoC2kMz8HLHG2HY79jDmtE0NooBPin2l4PPH/HF7a4+HqvM1MgLoWOG4OtOqSvpmmSSIw59U/AO9hIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLWwzwbpbd5xpPF3ZCQL8jDvqsW4lMuOOmP/GFwm/p8=;
 b=sWn/qW6IOWuCBawWuT03eS76P5r0jaujC17H01epSNjNTMMcxC8uHfsDo9b8tJZkVE7FicqjbTok5phvCpBHhZUDUtvmHTf55TnpgGkOpFMbXPKeBFnt+2b5PxL7MYIY/wp4QTF0nJ4iFbGZdAcfxO+dqX9G213fbEaoGJiWena1qjaFwL/H8ikTVW6+Z6yLJfnmqaIWwSY4xl7qdAzU929c5KZCKkfFycMTVLFIuNPQ0GGZNa9pn+1nWn8stBpDzi3Wfgy8GhWIr+dhXGgh3Yr/hH9fwLYIyxFw/INfDGyXn6oKJxcaBo0L0uQdW5SOzXPZZkJzDgJOHcmt8wYgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLWwzwbpbd5xpPF3ZCQL8jDvqsW4lMuOOmP/GFwm/p8=;
 b=bDBcPXdN0lxs4hAbGCrsFPG3A7Yh/CYTYKsL/cd603/GhhQU16uu1EgbGScMXbjikzXiY+8t3x96858g4judwko1PdaFWXHYTHC2waFWi6bg9Ud9VlIVt1fKRZTHUj/VKVBVdFdH7G9xMdFWVFZ+apsldVs63OL+nQBfdbIlis9qeOr2r+2R5VXoOccj8tNWPl0tHfX1LzqT6s9DbG3k8Ffxo2pXfU2Vt594FSWrcazJcaGxKp8nc693EwnHyd95f10odOCphrRSZODIuOAu9WLu2i+WaRmotugN+jmhp5hRrwKkibeV1+xrFCqwBU0cX4VqJCprne8xWRwF2xTSwQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8050.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:83::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.23; Tue, 25 Feb
 2025 11:05:24 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:05:24 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "jfalempe@redhat.com" <jfalempe@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "javierm@redhat.com" <javierm@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 0/6] drm: remove redundant else across drivers
Thread-Topic: [PATCH 0/6] drm: remove redundant else across drivers
Thread-Index: AQHbh3UrfSW2kiCPIEe4LvWM4YIbiQ==
Date: Tue, 25 Feb 2025 11:05:24 +0000
Message-ID: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8050:EE_
x-ms-office365-filtering-correlation-id: 102750c1-6062-431c-ff2d-08dd558c4dc0
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|8060799006|5062599005|7092599003|15080799006|12121999004|461199028|10035399004|4302099013|3412199025|440099028|41001999003|102099032|1602099012;
x-microsoft-antispam-message-info: =?us-ascii?Q?tg51dGkHr/h1UN+oGDBaEx0qzoskniwD17mJPUgWWg7At8nlZO2rfDVb3404?=
 =?us-ascii?Q?JMh3I13NmtUOj2btXwwrvV7kZAk8j/k4fyT0Ip5zp+jHTQxF3aYrIJj3yzUz?=
 =?us-ascii?Q?hRi6/wG4GvUxtbaDxll9F4AHiSog8+h3WD02/HkyFBPxAxc5K5pILxvqgFj9?=
 =?us-ascii?Q?pJ9x9HQUNAK9CtRry88zwXf1/yEVOaU5f5qTcBqoI/N7IxRx0GzNAMhoIrdc?=
 =?us-ascii?Q?YRgDYEdQNUDqLlrTSX0gAaXzpO9Y5ofHKdWGCseHuFwAOi2ubD/sAOBPTNX5?=
 =?us-ascii?Q?+oggyJjrduEZNWfyLvD+i6S7s9DSozsmWW4zImlSB59LZX02PC6ZuPwWAd2r?=
 =?us-ascii?Q?UWaIc6ejEZ+Uh4ec4Li8OOOYnrBzo6NzkEYaZy5UEWp7xuqDRzjvj2z5ppyh?=
 =?us-ascii?Q?yuYL1rG79G7fgVQ5+KHvVhVrhFAgnbqO/hENjVclaY6E/XQ2WoMSNMSWnud8?=
 =?us-ascii?Q?5nx3s+Q9J1gzMcwWw62aZ8E/W7DQwDp9mnOUQWqkBEjfKXC+yueVSuunVfAn?=
 =?us-ascii?Q?ftJKPGjc9yoSq6zk7yNC6KexDZtytYqMhmt0rrNyUfQNU2A0VbT3jQkylqRJ?=
 =?us-ascii?Q?ODidaMEnHAJmTuP2bsQnzPjvvWwX+adnv3kIKR91YbLjD5o4SmQGSev1Rgau?=
 =?us-ascii?Q?c7AMjgEyHQm9Xznt+mT60DVkaMoM1pYghPJjkbuVbwqmo3+omJg11h8BXKKy?=
 =?us-ascii?Q?jiy9+ylnG3q1x05q+ejie7BMkCrVh7+AD5wWAaVITPHgPZK95ba9jTpg9Lnh?=
 =?us-ascii?Q?FdE0gpSmB7aUgVE5OPkWKE4G8Or/ESHgjQDZFVnPlCxFnfupPjaxhr7vd9Fd?=
 =?us-ascii?Q?D77ngPzJxbteUf76+Yi8Z5PCP69Ly3OMXMGOs7MbzWg0sJJvBTVmh7cfIg5k?=
 =?us-ascii?Q?4GTTmvFCzzJdjEVakGQLpxLXc2X4gay0+c7iF5NX4+JWfsW6W847K7cqHBmZ?=
 =?us-ascii?Q?RTsmjk7orax5Hgze/OcNtSPQ8tteLiZBR7WSoULnMna6+csB6KcZveXUfbG2?=
 =?us-ascii?Q?HJVoIqkAzANPXx3FGKFN1EAg6cfAozK0LFs5Kg9Y09fG0ZJ1ZQYZl2YrX2fZ?=
 =?us-ascii?Q?QSQuDpRUgmlvyJnF0z4AoZALu8SQoOk6ICjx7QmnLdbfqWkmYfu5XzVhlma2?=
 =?us-ascii?Q?wRKfDKDsy+YcF4jCQjCbMwIzg+3zSQsLYkueMOvxAADKorswCv3/ASVb/1jU?=
 =?us-ascii?Q?V4OdrN04Q5cB58VnL6wm0XPeKpsxxCvD9QHEVN/camor6z+haCiYhuJNLuxh?=
 =?us-ascii?Q?Rrdz46o2N0gNrRK8szVquBpHkUoU2cWhFIZlt7XbaPYkRxcg0B6LOcmrPnAy?=
 =?us-ascii?Q?Tq3OevNG1gtpWufFBdOBnx0hankmKE6YEcEbQsMGb/urvQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2eK2l98bw4jx87Jk7NcgN607T4GPeyzbC2MtGPCt/LUOGQbR6HjZ/uj/KUXT?=
 =?us-ascii?Q?4kJnmMX66xuFtLFT0GfTvC5uSqPzGusSJA2jLSdNmf6zTV3c0yi8DCv+N2qr?=
 =?us-ascii?Q?eno8YYAs8SUBKvkOEiwCXk0FDzhhYvrwWJv4yXZTmk9Oowz62u8pytCOCy/K?=
 =?us-ascii?Q?xePaRlAeGknNuxOuLZnhl8wUVvIlZreSW2UT0PbJkAwAMV0M9IPFD05ElHEx?=
 =?us-ascii?Q?GBUyIPijXkvqL5jr71pJysCRcXq5vIjGHKXuMXsOqD754RVRhcSqkxK2o/K3?=
 =?us-ascii?Q?6BQdXmngw3p0x4vVZWPq5nUvbyCntx4xMTx1IyNhtQjPOwhcNuQ13Y7ArU2J?=
 =?us-ascii?Q?UU2jwhgGtqVsQ8djyL2IY8zaI8y+NZKus7Z+zV2wiFbsxNOHjNrdHkBIqUtS?=
 =?us-ascii?Q?JhWd5+pHcKR4crPf3pYtwIvlW98NZahing82VTvhMmU+vaDzRWqEuHHPZKC0?=
 =?us-ascii?Q?X0ueG//jFfyrPf1lI2QN4+JuUWtpYaQDdb/jGRQ9D2Tx2j2ty+Nw0uN11JOV?=
 =?us-ascii?Q?F4MDorSIwc8ZPQmh6txp+EodWopXaZcwQjicqf7DD8WmERmmATtG7ssMUiyL?=
 =?us-ascii?Q?AOyvXmN311Q9J0KscbzYUGEyxSsrsVRN6QDhswMO+y+BImFSulYJJHhqwZSu?=
 =?us-ascii?Q?mw/biU2SCmDnkuBh/+Tm2JFv/axLhPuzX/kyRiGgshjqJiNWcqoXCZoHUCw9?=
 =?us-ascii?Q?5D95MPljUSlEvr0Ju4RevwxwpqXwhMY8rluhmiZ5AxQ7jbByGbbbsv4g3R8O?=
 =?us-ascii?Q?oOnXwL0i+aTpywsROlxVTsNlxKT4PeYjyUd5xWq3HR2k/i2p7tsztd2fobB4?=
 =?us-ascii?Q?9fAhvCZm75KPrf/RzNzPZFbFJOInh1U+DyjqMacCxic9aVO7hA5GxQRwljkR?=
 =?us-ascii?Q?bT5Qt5fJ/cij30+LyPIfNsaL/ZiRniyfbZ1dJztxUuqGtVOJ6WvOEcSF3gDo?=
 =?us-ascii?Q?7CF/z/5QMjY45tNukus8Smogxvv7NVadHwHcv7x5M2ku0YlKLDkELlJ/lyB7?=
 =?us-ascii?Q?zLjldJYJ2tb5+fM+Y7uN88MhSIRF0IXtfFsoPqjfOJ+IoYS2epnW36HVV2A6?=
 =?us-ascii?Q?sTWMBy/PvP9xs5emJ4Cy83+O2UnPxDFKyymEU70YCIbeTAop9hsGBjfrFPxK?=
 =?us-ascii?Q?nfIXS/lVh5/UTLaEeJuymRFbJzLX+8hdKoilWk97os4Vpt4FPQaMCO3R9b+J?=
 =?us-ascii?Q?AmS6+Jy3QtP1qSE7utJOV409OHfUUmJLX081504U3vjUlvZACrEh3+vihb0o?=
 =?us-ascii?Q?X8tg+Edoco9TAP5rDu4R0NMiXiot7MWG+Kym2tvtRuEj6nEICsvrXGyVnE7a?=
 =?us-ascii?Q?unTnVgteBcZ6FV7zqrIChbb9?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B51B9389BCE4B64A8D0AF7B67AAD75E9@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 102750c1-6062-431c-ff2d-08dd558c4dc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:05:24.4705 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8050
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

In primary_plane_helper_atomic_check of various drm drivers, a redundant
else statement is there. All these statements match this pattern:

if (foo)
	return foo;
else if (bar)
	return bar;

Which is equivalent to:

if (foo)
	return foo;

if (bar)
	return bar;

This error was observed by Andy Shevchenko [1] while reviewing the
appletbdrm driver, which has been submitted upstream.

A simple grep was used to find such errors.

Most likely a common code was copied and pasted among these drivers.
Some of them also seem to have been ported to use atomic helpers instead
of simple_display_pipe.

[1]: https://lore.kernel.org/dri-devel/Z7igVXqvRYTVFpXU@smile.fi.intel.com/

Aditya Garg (6):
  drm/ast: Remove redundant else in atomic_check
  drm/cirrus-qemu: Remove redundant else in atomic_check
  drm/offdrm: Remove redundant else in atomic_check
  drm/bochs: Remove redundant else in atomic_check
  drm/simpledrm: Remove redundant else in atomic_check
  drm/mgag200: Remove redundant else in atomic_check

 drivers/gpu/drm/ast/ast_mode.c         | 5 +++--
 drivers/gpu/drm/mgag200/mgag200_mode.c | 3 ++-
 drivers/gpu/drm/tiny/bochs.c           | 3 ++-
 drivers/gpu/drm/tiny/cirrus-qemu.c     | 6 ++++--
 drivers/gpu/drm/tiny/ofdrm.c           | 3 ++-
 drivers/gpu/drm/tiny/simpledrm.c       | 3 ++-
 6 files changed, 15 insertions(+), 8 deletions(-)

--=20
2.43.0

