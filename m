Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B78E94BEF2
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 15:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F68B10E742;
	Thu,  8 Aug 2024 13:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="qM7I6qeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (mail-maxind01olkn2087.outbound.protection.outlook.com [40.92.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5110E742
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2024 13:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2B/BZI8KXWHErbrAJA2hn+mfm4TjIMAth2G+izzR0E5cg4GRyjenyYPL5XhSv1A2oVmlCN38P4mqQLUjrCFpa4LP/b47hl2zJnd6qSnKGd6MFdDmxM7u8bDp7WejOI+zBeZSax3Ev0rgBW7UeGbOIpxN/9mRXadwsKVOH45QwnyGLCDCCoNwFNMrt3zUio43ld9RSx7G/HKNpWNJyLOgJ7bnbROR5bM/c5miSUGacmo8hzgldzEvi6KP5wCQDu7p+OHaDnxetb8AY6MnCK1UO1KuNTZSiEkqG5WcSQN6W5bs60d2u/YRBM5UBpT/EQU7BxWK5jv6ZDDCmSWFPnY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYTtBfwB1Z4ozq3ze/8akHiAuVoHpgeUC6bi3jZ9XwU=;
 b=hcsaAUsaRrQNfXIetY5frZEBlWVEWYbsIfToP0CJUwcqEUgaFurBF0AZvLLh1LMyNshfBxsvsaVvwR6PkUJqxdu7YdUamQVCQGXF41+60stspZqAJzX96zirE7zRhC6UDcXSr0ExSxuVKa/dXpu/XDZ7AQBv3laPtw8PuD/toLW5TTnSQQ4UeqYnd8Gxfrgm8HTDQQkeA6i+FwyOogLgwrkMlP3Uy48benmFHYsnP+lYNuFtxJWa3r5WXm4mtp7qMbbs0ix8WT2bb5SZgzKCWQpAhhcs86/cCnbqkmTu2yM8MyXK8qfs4QTVtQhwAHBTYfxQXcrTUQ5pjEF1ANpc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYTtBfwB1Z4ozq3ze/8akHiAuVoHpgeUC6bi3jZ9XwU=;
 b=qM7I6qeOIPp30pFEo36ZV3Z78VZ3AzNrcrKAjPYFrKANllmlyjlj7CN6YIxadRgXgvDFVmoEiRK2EX8zzICh9LX9mHBGj4mmzM90F+gxtU3IS00ocVNAKLqlBzQokekXZ1g71kJbNIJD+LDbCkaYSmHr23OuUpyT6YGXyzJuuEpw/Ha+AY0P3Yl8RSZJTcwX4Dwr7t8vMTbVCDSjrIK2samzMrdC2GPiTrM3GU3L5x/ShHcSC9qpHQcpwCswgfFh54TFnA5Pk8V7NsbHidqxxnPTkOjuB9y7mjozlX+RjjuLue3CZ6hFB7fF6S3bGynWTrDk73YagoTYTfCt2fDwhg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2013.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 13:59:26 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:59:26 +0000
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
Subject: Re: [PATCH RESEND v2 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH RESEND v2 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6YtdYJRHShGzN0ugXPZJnAzEJbIdYzYA
Date: Thu, 8 Aug 2024 13:59:25 +0000
Message-ID: <2388F686-EAA0-45F4-A46C-402A865D8F46@live.com>
References: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
In-Reply-To: <752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [aBb+yF6O7DCy4jOGYtWVJ6FSFsTup1axLj2993RrZNAvYzpNzDZ3SgVdN44iw+NDSWHxfWBAymw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2013:EE_
x-ms-office365-filtering-correlation-id: 887f37f6-10c5-4e47-efd4-08dcb7b2505c
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799003|461199028|8060799006|19110799003|4302099013|3412199025|440099028|102099032|1602099012;
x-microsoft-antispam-message-info: oA3NoUVorM//MWSv2+tpFBsM03OCWBiqmtQXpNxq/aqIPMO4Pcwy34+gu9ZFaRbmA71+F7qhej43Sk8oPOLFzV4j3FkyIGzeM5g2efT0t0n2EOwv/tjwyU/Bhi3NPPN9Rm5N4ht+CHDRGnguXRoL/Pzx0tHSu8+yGwtlqklIlUU5+MJ7sucGxBgZiOLZVMBlnHyxRomqEKDw3urgxEL8l4nqzcUJOdQEs9Mb136Ums94saoAT2CgTQ4sixG86IFt7cbF7/BCG40Fdlyz2+QPaKBywtDkgWv6m7nmACZTZO8vvp1FETl/qK8ATOcg3PHd4e2QGRHWPA8Zsbf5jGuH/cWs3yGBC1FMfk1MmNAi6f1BppAjG/Cp9z5pGb8lYAuTWSNaLaXvJh3tg4/8+M9JEu9WkhN2weaC/vCHzokpyqXLxnpHVTEVjYM1LRiab7k3pVi018mqksTfCctMLauiJ0bMPaZsbNBPu6guQTvyxKr9HA7OtGUxcol79Mq1GrSZ7z6d+s5a492NPjHHYy0q/zVXYRfieAwF461oGOgRIchVjLEPOzwNXUgkYgKKGseOWRl9mRfNRLrcevz9WL2dX7FSD6Gx860kVWUavsZC318GXl4Ww1PAo+Ji9SpKlZVEWGzdRL8zMnrqP9ZBDdkSFP6wsKtLT7lrauvpwF4KX5LkmSc/iGzcvrlF5n/qEOMT/KWjqjWmksQIbULDkIuQXYCWF2y+vMdbTdl121uJwKICuLmlLXwUv/dy8AVvKp5InkH34BNrosCFWNQTBBKOxw==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f/128AisRdIYnMP187bcnFSv3AYUFq8Fxih0FY4wRSvcPPQKh85+eeQlEKdF?=
 =?us-ascii?Q?niSoWuMXo5uJccUw+WAX43S8ZOnK09zMXgaWHa2Vah0AxdXcljJ1hUv+0qcS?=
 =?us-ascii?Q?/PRqPS8CoW88v45DLaBQ8AuKLgMHAESMNPJHUAvCge2K58RsQp5AljREQqLv?=
 =?us-ascii?Q?2iLOFv81GSfqzizXY502AXm3pp8ZJst12lRDSAIxWxC04uHmKjcYJPeAhLJR?=
 =?us-ascii?Q?M9R4wLyj6zYwsx/pD3v3wuFDeLWr7jsNC15nQTc5LPSEBiXczsXP1PWbzFc7?=
 =?us-ascii?Q?wiov7omWjSCnMAkwvS9FLUEvMQ2oEecMTizeXFgGg+AA/hZlvVj2SHocGZPS?=
 =?us-ascii?Q?Ok6jHpUPPSMnjuwZaUz2f13t5abwPXr19YDh6qILaOwjcbNC2M3DMImR8mt/?=
 =?us-ascii?Q?f2f5xVRnyvDF6EYzJdSRPEmjculakna5arIqx/RtTqSo4cRyucjix4iYLdfs?=
 =?us-ascii?Q?VEs1fgRJsjXmISvdHru4hYwVY4GVdVMMr6wjEJ9QnzLfIVm6rsAxSipJERQZ?=
 =?us-ascii?Q?sp1UYIwkpSCTalCEXdNmLOGOTU6KJfdybLS+pKuL0WPt6ao1BxRI0mmkxHZf?=
 =?us-ascii?Q?Osd6QLDjR2wYfuAqMoHWzTC1DiDKkldBdHmCgcJZEqD5d9zzaus5Lk1oCMag?=
 =?us-ascii?Q?rgmsJrcC9evi7K0LVtzkeejLJAKF3nP6H3Ae04aEyOERcoZaBrm5z/Gxv2sM?=
 =?us-ascii?Q?Nez4x6B75kjpRHgEIK11AdFT7EmC9I3zg/buVmCqO9e50Igg1qfhLDKAec7m?=
 =?us-ascii?Q?QT8fm9q18czUiOIhGqQ8iozvY5tmqMwqBcThMtnsozjUQ0IXXzGa8IFipxFg?=
 =?us-ascii?Q?2T4WdRbUs12ZK0YnarWlMW5AxkYbT83slqA+ySqTE8LtpkPo67RF9F/SX+hO?=
 =?us-ascii?Q?T3Jvxd+Yx0DONun9alP6u4Ru7w1gnTS9XnoL0jwZ/+wHem9vvk+npYCg4yRc?=
 =?us-ascii?Q?oMpHqhssSTVvtOKxiYfuerKA4xUDvPOSUyBu7x6LdMv5diFtcrfFC2JWqwYB?=
 =?us-ascii?Q?prz3HwpzuFUbFw3vhLb+zy/TTs5BzWu508PTF/orAVRo9rLw+DDm08mk8g5T?=
 =?us-ascii?Q?PmPRcgxi3EqMDafN3RsQF/iqADeUVMiewGcLdwF6BhYl6icuf8nW4G15wdcA?=
 =?us-ascii?Q?g0NdHjmNBA5yPK/I8CrK2fg3WFbJ1Q3/Zbd6SiYkK+n614UjtN9zqReELGbk?=
 =?us-ascii?Q?h5zg+DWZqisbkepjY/tpKDOAxTE6znQ/Nx4TazhomZldngu5VL/UHc7TZBJT?=
 =?us-ascii?Q?A7zIz4/P8CSnjV3ezrj8xKR8evLW0wsxvnoIQfgZFMnNSFBtBptF7x5JAKwO?=
 =?us-ascii?Q?ijmuEMv9Tx9dK/vi4rpFeLA8?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A9A849C8AD379D498C0673FB5948AEDF@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 887f37f6-10c5-4e47-efd4-08dcb7b2505c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:59:26.0042 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2013
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

The keyboard driver encountered a bug due to changes in v2, so fixed them i=
n v3 here: https://lore.kernel.org/linux-input/1368FEE8-58BB-41C9-B9AD-7F2F=
68FF1D53@live.com/T/#t=
