Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6BABB8E5A
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 15:57:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC3E110E07A;
	Sat,  4 Oct 2025 13:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="faz60u+V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011060.outbound.protection.outlook.com [40.107.74.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4EB10E07A
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Oct 2025 13:57:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnvpQ0NRLlV0FpZQLfMzdcCI+yVD1XwNhRcacQK2VWsVbM5T2wPd2UFUE/28PDPvueEnroc80m7/czRa4xoiyDiKj01x0bhuM20yHwT2/hSuHwoGsCIKia+FFGIsrM8vCmOkQBBH1cu9DwdU+Ysoh3HdWaEngFsTpPovJ/rQouXCthFuzsv1IOZC/g1A6+BS6U8jNmMT8b5Mfj9WTKNuad+oQewaVTcUxKpmozquPXSkFF/9ud/JQcNJpz3gUqy9KjPhVebfmEIXkOtBrhUHgAQVXjDTsVAqalF5IjBr88LhTvlCW0SbdTa3jqugQ3bvVTIk/B73sJH+QLyrMUYRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WL7ZsoBhfSnKF1Ax31X78Bs+Tvd2yJfPNfcFlgbJPrg=;
 b=wyYGhHCB6JXlritn3vx2nx0qKCn6MZUesp+Mf+QDcF/5wcUWh/HntIPur0NDUIQpYG4K1y4+xQEXx/FPs4VDi6waqif3UYTVsV5eMDQqHlMwkHbS/M3MgyjmNTq3uuqFT9F3ZArrU8u0X5wPdnz9+i0ojOSTfjdRQpDfcHxo6GNIIVVkUyr47AeW1YV7jNgjGK+YKYy+tMaBdce1fZmRF8peldZZT/wNAZmkv7vjlkrHU02A3+QtbW4dAXke0NLKQnGrhEGomGpOKopEP61Ik5FvW/hs4WfbvdvNcADTt25oLMdPL2+tyJQMoD98fINFDiEuha6movFZJlMfnlrPWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL7ZsoBhfSnKF1Ax31X78Bs+Tvd2yJfPNfcFlgbJPrg=;
 b=faz60u+VxyURZjxDjKFYQTrTlxwdqGujxV+25BUg1OzaHPsjksxTHmYVtU3Ilv0ZHJ8IEJJw1iFZvsyS8uKNlMIiYdqEu0YhrgYqK7rzp2MuJaHJMaLKqT2mG/HJnnHW17Y68F+0gzLbHtjQpvPBx5FHezOZxVr4EFoYP91AJ/4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15096.jpnprd01.prod.outlook.com (2603:1096:405:228::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Sat, 4 Oct
 2025 13:56:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9203.007; Sat, 4 Oct 2025
 13:56:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
Thread-Topic: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
Thread-Index: AQHcM5j+LYs0aMv720WmcL8DseL1LbSyBb4g
Date: Sat, 4 Oct 2025 13:56:52 +0000
Message-ID: <TY3PR01MB11346E016CC1F6FB375ADA36586E5A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15096:EE_
x-ms-office365-filtering-correlation-id: e0116a54-e3a8-41a2-0274-08de034ddf68
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pDgSNpFFx9mnBlp6SmA+WSh/j5tz51JiZ7R/cYweqKMBAPUKl31sls28Kl55?=
 =?us-ascii?Q?SHbRJKNvIXBH+8p5pNqzSn8U8OuRHYqiJ2J0h7Jgz91lh/FNkw59HpXSa/5x?=
 =?us-ascii?Q?WULSePS8+8y0Go7kdEskhwmQo9I+lw3rlTVm0eOq5TMDf/sVZV8JuhakF/5p?=
 =?us-ascii?Q?4meQFWTWqdAcAfhdtbX2KKzjUPjGEoiPQdYXuiaLiNP+cb+MjE/CweEsZLEO?=
 =?us-ascii?Q?sJsz5+f0Ma7zbpwbnDocLy+UAi/eNZ/q5nm6/vXr4+sspxNzpQTJ47HLigUl?=
 =?us-ascii?Q?ru6qjnQou5XJs0hvm7VTefo0/g5Ach4io5mnQYlQOn1YleoWoHgSdYIPEqL7?=
 =?us-ascii?Q?BOWwBHwPBl8oLhrSiIz0zYvv/T1o7diiBDsP7Qy/M98n+SLGv4umBBCCx/k5?=
 =?us-ascii?Q?4HgfJfL+WGyygbB2QKpvbj07uN3nJW0xAGw4VDqNLiVJnFvVvZH9B8QnHsWR?=
 =?us-ascii?Q?l5FSErlxcWCIcGFJ+HelWpqthfS/Hy6I7lit5MToFZ/vb8PoubUwPZAAvEdJ?=
 =?us-ascii?Q?F7/s3aUyZF9bc/78LK+pE3vhd1CynP5CFfJrXPVxpSMCx70g/gvXMIr37hpY?=
 =?us-ascii?Q?hgqJIJu0JzghPL0r/8D3qaYmluhb/bLqczfdsTM/lsdrQ7dLvr6te4gddZT7?=
 =?us-ascii?Q?CfRt/58T0slmWaorBIYwpko51XIV5KcSagdZzXhk9W2h8lRNHulbn1aOS0Lj?=
 =?us-ascii?Q?kEikhelIlRPgwlwBqyyakc8Ua0wA6koxY8valfd/Z8AoKeFF6PblFMJLTusj?=
 =?us-ascii?Q?I04rptPO8beGWbpzrlyCbbR5KHxjeHQ4Zs5S3TvNdHNIkDwQBEB+ZAClyRnP?=
 =?us-ascii?Q?DEk1w11pPwpbWkMqCPTnQYv6VDbIIi+B+o7VKz4SEcEDGIIbMiYDHjiuc+v4?=
 =?us-ascii?Q?WxHtTljz6k33Kuv04GVHXygKQ9ls6B18vm9QE30DLGYG901i4PyFSm6jP8I2?=
 =?us-ascii?Q?fGdAXNwMLY/SMd/QQERj8Z0CRATHdygwvh5E6RCdRnRYGM2i1Xqvxyl9THjP?=
 =?us-ascii?Q?k/eso6hT/EV0Mi0oGMBXX0PGnbBobPiEiLbB6kDbRcOt2IoHbPT5f3BPKS3j?=
 =?us-ascii?Q?MQyXWUYR4qQBuvR936zXknduhU0yNXzhsbZ2l/XpmXoY2rDQSh9c5fo8cpQk?=
 =?us-ascii?Q?qfKyUKeBATFkNOfIJTaY+d65wLN4z43Y8VFkHUeWYMRvSUZJFesL7xBe8vay?=
 =?us-ascii?Q?y0pLqDgajwLdQYh+yi1rod3ZH0aRtZlXehYsa6Ep40zanCKbvt2kw0cus5x1?=
 =?us-ascii?Q?XMo64+PebotGHYEf5yAVNc6CgxdgRrsvsY24OuvDQRd15QjJxCCYM0l7Nhe0?=
 =?us-ascii?Q?vP9nIRy85K/fFAG4PdW8Ngtusy7KCI/d7+28TbuuSncX3Wx3JvfXSIy2WDQ1?=
 =?us-ascii?Q?TWnYjAWEqgzRHC9XRljTUNvJDNSnztIhmbqGT9/J08yM0UmUYHYke4x0ny0o?=
 =?us-ascii?Q?AQSc8UED4Kpp2eMDuL1o/boa7z6vCIlq66ibHrfgMNretBGngzY3Qf+uhAL0?=
 =?us-ascii?Q?F9YUajaSy9pI9AGEQtAts8koJgdPu6FeWsyK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ee6qPi2SUT3h2osliR3suiyekNXfHaDD3DHN4sYpH2xxyf9HpFmLvdR9kzq8?=
 =?us-ascii?Q?xC9U/NcUpis16P/mtRUhDcG27zaBrGVodPtjNZ9DyJgWdyzxXEq2WlC2AceY?=
 =?us-ascii?Q?d4dy9iQU8+qNWEWU51xqiPsOtCCgZalbVYrUTcw0a6ZTDVUcwJvADopV/dnU?=
 =?us-ascii?Q?xCsij1qvQv1DPijCydjfZsZFynbtUo1kUzHrz+abBnu4ltDwbheyBmYI5Loq?=
 =?us-ascii?Q?F9paxxlF89kFZS/ZVivzYPTIKcAGEg6XOLFht7a3PKSUYa+t37KgkCPJRXaX?=
 =?us-ascii?Q?ayU/U8hQUc7sW/CW/+XOqbbDdn9/Mbt+MVeDIOn9uGvu9dt3C6RTc+GMIfMQ?=
 =?us-ascii?Q?um3K3CRknF5ZGUOh0FbCFP4tSS1xEIgX2pmZ3XN6nGA0wOYD+E1AxFKVRtS9?=
 =?us-ascii?Q?5lxJoiG7yFMg7ER/lSRpS7ANJVuleO+RjTapX37//Hyb8Blw3NZyuBf2LKZx?=
 =?us-ascii?Q?I4NLN2GcciSmzCkHlnQC7Zsjl3vyv+DTLzgLm8ieKNFQgdPBRJJIi4ECBvKS?=
 =?us-ascii?Q?WPKu0VnT+UjDnIG3vcdmP5ZGbdfsYhZrfLXKnp4DZPcJ1OGkUg/vmZ0FR8yJ?=
 =?us-ascii?Q?vT5+fr/niJXqhjclnxpm4MH60tpAnEerXRDPK9SOfsNf1gPBZJYvEdHlA/BY?=
 =?us-ascii?Q?CtUVeKCD63k+aKOP+GsQHiBs4JvnbEbvtttjFbi+GkkOoQGVfCBxdSSscUSf?=
 =?us-ascii?Q?FQhK438pDaSTX6b8CrtG+BG3l+wiVnt8P9v2/gb/pJR8pCrUVegJgjSR7xyg?=
 =?us-ascii?Q?PEBO3LVsA05m/4EQgJOVID2rIZMyixZk1X3V3+YvT0nvwwexVRqDi/vlV6Je?=
 =?us-ascii?Q?tqX9sb+7A/FMCoXhBrNBDjZVGSzF47VMIEhWPcsk5Kf+/mJhOUkBPPi4j1xy?=
 =?us-ascii?Q?oFNGvQ2wFSK8/aIPNcQ9HId8z9yq9Svv/oSOHzOG+4oMZsIrzdwjIIqUHEbV?=
 =?us-ascii?Q?ai+OMXkJHOyI1/59849Sx9UVUQOmx1FXmsVnB0SZwY/u5XHa9DzPCruP/Co8?=
 =?us-ascii?Q?30AZ9Bu5hNZfVENw0dm+sleMy9meQt/MMpGMx8XUGtlDh9zZYmFwAzaOpU2/?=
 =?us-ascii?Q?XRLHrx+p6CMniLeVjlTqsI4lhNfCdxtpnN1llc3vr55ttZb93HqgH7h+l5UB?=
 =?us-ascii?Q?79a7JIxITC2Em1GjsPoF5oJS/5mbW8CTtNjkEK5wlJ8+RfsDpK2T2stbk81B?=
 =?us-ascii?Q?fXWwBtvejXVcfhKPrD908MjCVy/HsYFVTsDlgl2e1yCl9+a2SfJw3zirbvoA?=
 =?us-ascii?Q?6elDmt84EZo0ee9f/GfkRO5mhbaYP6lqphnmRgdkHawO/xGtjxl7DVe9eq0t?=
 =?us-ascii?Q?WiJroAc/cHVW5RJJa8Xe+Mg41krb7jaam6D+zmmwf7nNTwgYzM4SCILKjDpy?=
 =?us-ascii?Q?XR53depHJqyOZ9gC3zMykLV7ypyW+Vo0GYZ6m78V6gSMAd0bcEa2LfFRDyDI?=
 =?us-ascii?Q?gz2FiFa9ivpSeZeT4lvxYwAjomsn41IIdyLp6lOrowQ/I3+sfNe72z9CecX8?=
 =?us-ascii?Q?UkMkt7IoCMAvpoWy4aKJueUYyd6gAm6pm9ld2ez1MmWQgJZmpZUoj/+PXFgt?=
 =?us-ascii?Q?X9jMY4DaWF/JTEqiNcGGrxnwXvTqR1WjIjeQKlKpGJiFJXxQxPhpRTFEvBVk?=
 =?us-ascii?Q?LA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0116a54-e3a8-41a2-0274-08de034ddf68
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2025 13:56:52.8306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cDjhbIvvTRMSzCpOZGPhM86We5ouYM9TlIbltfAboYCDZ9Pa2fP7C+LGNKwj/9n9r7oACyVIoraDk3qmjIEtFcXgWml39XziULgrDwTi2SE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15096
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

Hi Prabhakar,

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 02 October 2025 13:35
> Subject: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The RZ/G2L DU driver is now also used on other Renesas SoCs such as
> RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it o=
n these newer platforms.
>=20
> Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver t=
o be built on all relevant
> Renesas SoCs.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Applied to drm-misc-next

Cheers,
Biju

> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/rene=
sas/rz-du/Kconfig
> index 34d515eb798b..8bbcc66ca3f0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config DRM_RZG2L_DU
>  	tristate "DRM Support for RZ/G2L Display Unit"
> -	depends on ARCH_RZG2L || COMPILE_TEST
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	depends on DRM && OF
>  	depends on VIDEO_RENESAS_VSP1
>  	select DRM_CLIENT_SELECTION
> --
> 2.51.0

