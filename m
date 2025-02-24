Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA288A420D1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A826F10E29F;
	Mon, 24 Feb 2025 13:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="UOsA4auP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010003.outbound.protection.outlook.com [52.103.67.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3051D10E29F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 13:37:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhUFNvNTiQuJvlmq9u7Wve4JJ+yG1Kj9fGTCZJQA6cyugxZuoKAV29WzI9EmQJce3uxmRK8TQy4e1QjbqIoXzMhJuua8ptV1MEFp2GMC3ZKlbIJc22/KH10ktU1CrRloTzmcdQXvZ04e+kB0c0aaAsa5mzjlusG1v54VASk9SUWCFY5Qo1BdzS5+c8gP5uqkPM+bhNxuxz7MtEMMOuCliWQtk+u5Pvg/qSMQw3bWydVE27ymk4nJFq+eJYNmnIffoys3/L6Gg7VuWWXkHALMj1z1sbSOp45maVnGr2go5dwUROENH91Y63q5Eg9xLOMS8YQO9GiYR/zEioYSdAMRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB7xhKlkJH0vocogEkfmCRubN9slCyqTuAoJZKkFwOI=;
 b=NZJZa39RTb8A8Mhv2eSITskFt60OHNdPcqprJOS0hRdlHa+oi1EZ+f7b8OwI5kZOZW8eXlfcXHCDFOkeaVTtgjErHhFEpRwLj3O8NtJKl74U04A+9Yy6TJAOAmkMfLSmMqJvNLxPjkzpZQPHDXUlK914yuE9JNkMaCNzI9M+gjg5Oj18q+Ve83Of6Q6byudRXuak1pAnTRBN0DUI+oCgZDdS3x9UPBJLZThdbAE9ERj5EYt5luvnMX+n16jfUBhQW4RK7oj7ALXPUAfOlXMVEUMqDYVz67qaSHmR6O4KqI1miLGz+/pPQe8Pcj3SfhWiVtqQ/GRKenAEHmGG9+45BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB7xhKlkJH0vocogEkfmCRubN9slCyqTuAoJZKkFwOI=;
 b=UOsA4auPKIEE7d1nwLB+HMC0QvtY0Xi5oWWqKjQvlsLVRHaQHwF4kIwbNRfkXRYNdxa2SGjowzNFlI0sH/2Qf8AUE31NYfpee6uXZi+8/ku3LOKwYt3Y2Na4RQyUwdx/u4I5wSipeEaTVw2CrvdPpwgDXwoW71HzcUSSPn4OEVeCKa3C41Y6Gdlc7tdEgjn2zp3cOEsKPZ/bSjSxv4BtuDdc5el447CQvCVSJpgNhK/6gR6Ki9VLQNIV/p37+mNDu4aNSQafWsh7JWtQX3ihRCgkL+x27d/0nOYyUDcpZ9X4iBByZEU1JzCZbZamT53XT9zOOrjMF49DIttCnJmhIw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB4330.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:18::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 13:37:23 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 13:37:23 +0000
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
Subject: [PATCH v4 0/2] Touch Bar DRM driver for x86 Macs
Thread-Topic: [PATCH v4 0/2] Touch Bar DRM driver for x86 Macs
Thread-Index: AQHbhsE8eh6wU9Xf40u6zDzj+/N8Vg==
Date: Mon, 24 Feb 2025 13:37:23 +0000
Message-ID: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB4330:EE_
x-ms-office365-filtering-correlation-id: 65acebc2-2ca2-448b-fcc9-08dd54d85e94
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|19110799003|8060799006|7092599003|15080799006|440099028|3412199025|10035399004|102099032;
x-microsoft-antispam-message-info: =?us-ascii?Q?jBojukXMLnpZnAeqL9ZKZ2KyosCgDTvq1nyShU9MP3HZeDOxiXROatwuhbyz?=
 =?us-ascii?Q?uYEhFP0n33AW6v9aD0RT7MgGutfZp+YR6FFoZ7WzV15xsJMiw60Tx+G/02K2?=
 =?us-ascii?Q?3t3TdWXqcJeVeraWEpgiCMfK6Dyse+dUZOIP4azqmA8H+3Z1La/pTOcLD9Ia?=
 =?us-ascii?Q?e14tWt4Ndf8lpFQe4PbCcKQXwHt1ThRKTTatDSdnKf5P/tYQqzMCYgQJJwTz?=
 =?us-ascii?Q?7bc6asR0VglzO1ZaWBoQQz0WkVOmv8zldpB566OwP82DQp46bzQzxNj+Ea9k?=
 =?us-ascii?Q?ANwxAPewc1zAnykf7/QN5KSXrvx8C+twtq95kKW+tEA2n1VMYqn0Oi/wTHJA?=
 =?us-ascii?Q?qKK22a8YMB5ri/qIE2RQu9bE4igjmlP+xGT8Xrrv0/KP9LU5/jKIXoLbE/+B?=
 =?us-ascii?Q?XVAxzX1w76j4Agl618E/6R4tdX8LsVFOhDea+kwvCONx4sapzAyht8e56mdS?=
 =?us-ascii?Q?MKqPIm3N4WwxQHcQKrV3KsW1u1AWyzwgHj7h17gY9AzFUgx6V48qs7cmZ1zO?=
 =?us-ascii?Q?9qncaZAcA4LzGixpqlK92RJKJv8EsXHOlui9KH9cV6qw/5ywhlHvKBwvxuIv?=
 =?us-ascii?Q?IaO9ri2ngBTfdpXNVY6qlCG/5s2/gz3E4kGVqwE9YmYE/wi1UNzerynboLzB?=
 =?us-ascii?Q?UCC4rg8Q5hYoXx/p3RrxahhXValOu3Dx1FMQGOb6CBrlXw24pl8DCx7PKIZK?=
 =?us-ascii?Q?mnVgFjp0Lch/J3uXuDMM/H1xIK6ZI0/0j/+g6xBqHSyjazZee9+FDHL57El4?=
 =?us-ascii?Q?BEvM0YZ14glk3LY8/wQHdrmnOSzj5amGyGswxTk295P27agtLnJIPyNh9tFP?=
 =?us-ascii?Q?eVcn01q3ZgHK24/7ICukZBlkG9XSkvGE1moq1BWJuYAW4KkFncU+WhBA9mDN?=
 =?us-ascii?Q?mVu16zfoWxvB08y6pAmXpAoXaX01GPgKslYcNUl5u4FY+PUDNBHKLQqGVU7P?=
 =?us-ascii?Q?P125v8fOQ4dZgmzt8YSMp5BF3T6XcIRWq5kump0adswFELUXy19wtIk5QYFR?=
 =?us-ascii?Q?aLgke8ilTOgDq/qSvEilGkFaqPDp/ZTjlmn+iPHELLbeQjHFmH0VTPAfDute?=
 =?us-ascii?Q?xvhiN/bB1PUg2pvPO41q43WSwsw5j3470qsrqRu3GB/45bW++KM5RK7/hq2+?=
 =?us-ascii?Q?oq+8QS7dcWTS?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9NY3KVRZIZNf9AZ7WDGCEbSVK/KtE5UqCa27Jcvps5ZDuA/ztrcgTcdN387v?=
 =?us-ascii?Q?KdvX6PiWawiOOefiPubwTOQhFU5mVOIJ0AiUANOD8ozjto7lYBOKr7GlUDRM?=
 =?us-ascii?Q?TGwcQizIEve4k2jseG4J4ZVZqo2ugv+YejNNKtkWlunSN5gvC20fUGnHy2um?=
 =?us-ascii?Q?v/1yMZIj8Ozp9MTnIq1d5XRk6DHTwn1vN5U0l89NERYPnMzBvhVC5CJ3CuY2?=
 =?us-ascii?Q?mriRTRoohM5JmJwrGN8CjCtrRDSwnniRotEWwB90l2HoYceje1GXW9iy5Y64?=
 =?us-ascii?Q?evbpZowgKBcsD2aCAD3M6OmzADpbk3jVvt2KfXPRNXnNdW5DL3OtJ5a3i0b5?=
 =?us-ascii?Q?XYw8mmvBziJXwJXNZfIf21pAZyI71z0jDOtjX5msDxQFyIrEmfrubFljroCV?=
 =?us-ascii?Q?vm67mLtIB6xJDEMbQT2HScglYv4oRebZf3iEJgFiWcPFUHBxvOyXPRMQi7/Z?=
 =?us-ascii?Q?KgaaJ5lpHGoCKDoyfHfnmuPwh0dvZRU2Tciif09Cg9Z+rYQp7Fh+LsB3dyL0?=
 =?us-ascii?Q?xk5AoZ6hAyKq0HmGHQOTt1/CJA6Jtg1c1SKOXiU6G3VXvZfRg+q4s+biAnMZ?=
 =?us-ascii?Q?HkcnzbNujBiHm6S5OCsgPy/JrWaUivV3F0IQQsC+E1paYlfy07tPllgdKnke?=
 =?us-ascii?Q?tfm7CYo3xQ+JtSpvdHzlv3PPhlWgmMOgvROL1JjC88yJ+a7Xs4B28x3sGi8J?=
 =?us-ascii?Q?qaGSU83LxPZR8P+b07wgq4m1ZcekxWVbnTBndnDdLtkzSmt5NVzSXL5hTwdK?=
 =?us-ascii?Q?vVn+W/5qCnxEmvunTuMX0ieTeLhwvNNIZ9kTx2+By4vl2DfoP6RW/c0xyeNh?=
 =?us-ascii?Q?IkV6furlTT2j8IkT6Ltc0Jny2FOtg0JAoYT1t1LiVUPGRsQNYCJxWo5lnBG4?=
 =?us-ascii?Q?TnRizZwLjtXA7Q5TMT76QsI3v3KmVMr9cLeITVpOThGJc2fO9tZH/B0Hha+z?=
 =?us-ascii?Q?SePbPWHH2CxfooEaLTU9DwOXQda+BhZD5A+BbRanU9XE9Oq+YBuwKzkAaLA+?=
 =?us-ascii?Q?xNTvHUI+ENgC36MO1l6fo3v64CqOJ/3ilP2dze3Rg3hFzhpz9xEl2Wndd5Il?=
 =?us-ascii?Q?InC7MmAcn7WVCxeEbOs8tWtkfS2o7nR9Ra0iDFLV6BMKdQcK6t3LozVs0T/a?=
 =?us-ascii?Q?+wGPujABybXwklfK5go5ID8m2j+mlEpuyS1gLaRjamJ371y/8J4xJ5MWPlw0?=
 =?us-ascii?Q?3e/9jMf5ngjELrs6C3FldkWwTvRiBOurut/wDzp/jse6RhS51CF0w+vuyirI?=
 =?us-ascii?Q?RcTsH/opFjfeFioL1kS7YoLz/+aPMvbh0eqsQV0J74KwBdY259hnhZZBImvN?=
 =?us-ascii?Q?FTmFnwrl9iYP3VPnvh3zeQUE?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D036294E01CFC5428573860A3CC607BD@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 65acebc2-2ca2-448b-fcc9-08dd54d85e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 13:37:23.2559 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4330
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

The following patch series aims to add support for the DRM mode of the
Touch Bar found on x86 Macs. The DRM mode enables the Touch Bar to act
as a second display, just like macOS.

The first patch adds emulation helper from XRGB8888 to BGR888 which is
needed by this device and the driver.

The second patch is the main DRM driver, required for the DRM mode.
Currently, only T2 Macs are supported.

Currently, a daemon named tiny-dfr [1] by Asahi Linux supports the
Touch Bar in this mode by displaying the Function and Media keys.
More such daemons can be made with more customisation in the future.

[1]: https://github.com/AsahiLinux/tiny-dfr

Kerem Karabay (2):
  drm/format-helper: Add conversion c
  drm/tiny: add driver for Apple Touch Bars in x86 Macs

 MAINTAINERS                                   |   8 +
 drivers/gpu/drm/drm_format_helper.c           |  54 ++
 .../gpu/drm/tests/drm_format_helper_test.c    |  81 ++
 drivers/gpu/drm/tiny/Kconfig                  |  14 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/appletbdrm.c             | 835 ++++++++++++++++++
 include/drm/drm_format_helper.h               |   3 +
 7 files changed, 996 insertions(+)
 create mode 100644 drivers/gpu/drm/tiny/appletbdrm.c

--=20
2.43.0

