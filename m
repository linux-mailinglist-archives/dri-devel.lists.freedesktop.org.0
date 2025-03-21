Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E803A6C2A8
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 19:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DB810E80B;
	Fri, 21 Mar 2025 18:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qVaaG2Qc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010060.outbound.protection.outlook.com [52.101.229.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 379F110E80B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 18:41:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiyaIm2KWx9Mus5okg8AGXfaQ/mgDqaiGDxNVMb8KQ5ot70pu05hwkmMYjvhhULvFaBdCxFTwE1cRlb/lDkGxeo2uJJ5qQgBbDX7jFvmA3Jk3kFq6zmxyxUVJJZUyMFmAGWwJabrSDjDl9/v7KZLPKUEOBCuqLgscWnAB0rfLiwPFQBMB7YMiEmgLHPtx1kEMx2pcDjbGR8oL9TreISn+T1y2HqIwx7R05TKAyrPywRYty3d7H/Yj2p82jQ62pzjSsf2DWdSmGVriG7t7VaoxOzGUZfzhYNY3AfyHcc0aNG7fbWMO6p7mkuol4y5LC2cwuabXJEongOXokBHKPhNUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6o6PfMvG+yJNlM54Tk7630FkVNGQayZh+MzwU8nnCc=;
 b=c8MS5uIwHfJJBT65DM5u7nKB6TNNBi2WdU/JlT4mgMIWlcBUSGkCl3Knq/z7Et97NsaQWz8RkphLN4NwpE+UULwQ6YtSuQK7aqaWTLV8Tf73WwjaV86gUR2htO/Jhx0vDTUX1jfuIzHaJnB0uTSvsqU8rLIOht8tIy29xSPGRh0N+WoIuC1exjHUqaLVzx+M0enfBr4G7tqknSnzGzSgPf5rzPU+uAVpAfkUVceu+VVOXse+bGxXOrOB6rggzhVEW613RaXM171Zkh58jy2b4X3gA4HA7xI842UYem9C2hVTNwExzQpsaBKP0KYF0/YqbEdjglLw2YtFM46OQuMR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6o6PfMvG+yJNlM54Tk7630FkVNGQayZh+MzwU8nnCc=;
 b=qVaaG2QcVWyABgLki226K2zmuPgTg+3MP4ML78CGY9mYr6lz/oZyHN8Byv9j/bUWyW38XH8QETjw2B2ve1E55zbLoJGzqmZKZXcdng974y/NGiLDjkdt8bwDgYpEJ5f5yEUlF2RBXeZD0cEF3L4c4S4bSpnWfG3bPpfP29ve8IE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8320.jpnprd01.prod.outlook.com (2603:1096:604:1a3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Fri, 21 Mar
 2025 18:40:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 18:40:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kieran.bingham <kieran.bingham@ideasonboard.com>, laurent.pinchart
 <laurent.pinchart@ideasonboard.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: RE: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Thread-Topic: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
Thread-Index: AQHbmoXW/Qd0guXlTECRlfOEZqHWarN96oxg
Date: Fri, 21 Mar 2025 18:40:50 +0000
Message-ID: <TY3PR01MB11346C6C1EBF9896A47E9807086DB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20250321172220.867165-1-kieran.bingham@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8320:EE_
x-ms-office365-filtering-correlation-id: 471e927c-567b-4700-e9dc-08dd68a7e748
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4uYI8pttMHTpdsZ38DWzdlpKnwFSud0t++cKx/4MBM9cLKNm0Pm37CJJz0vU?=
 =?us-ascii?Q?+bo85acyKBDCwt5Gl6E9XHryzMSfubWlyQAS3TrviRoVuU6odtfEzqGLc576?=
 =?us-ascii?Q?H3dCRJmKT7W9uAWKfJos9rFRAwOBXD2tLx0MPz0ckxFSaFYrRYSWwonXQzH3?=
 =?us-ascii?Q?2j5mn+fORELdd06+U2Vsb6uUh9Lx/WoNZxUHvPCVpWXqXQiHDUlhfirinRN/?=
 =?us-ascii?Q?godaCV1fxPFuE2zH+ueICwkugR9r4d3GQQcjvNpU9RPOuC1ilLmz2hStZz1q?=
 =?us-ascii?Q?p+2qG+Bc775MdM4/75HD37i66Y4Eo+O5+LAveBc6UOMU0DZbAW+AzZxdz4LH?=
 =?us-ascii?Q?PBfHLpeQEb65iftglqELjN6j+UsLa+7Dvd/Q3DoVZcHPBAXOdzsSggcuFrFA?=
 =?us-ascii?Q?JISIDQygHbXvyw6oDmLAQcqmcVrnQj8HU0NbEvtMdmFA8Cyh5Y0CVa/F2RzF?=
 =?us-ascii?Q?267X6K01oMfbyf3D/lQBcRZybhs6hgGctpI//hLIoo432Blnct/SchWY5LZz?=
 =?us-ascii?Q?ylHij8DZd8O6Wwb0o2XiT4z4YL++eIvHft+F6m+yZqDgthLX/ut6UI4AwAXF?=
 =?us-ascii?Q?1GRz5RG2shOCt+w9GBa2QKXS+5jI+QBrJCizVluguwotC7NnQARZ4RKyIgEp?=
 =?us-ascii?Q?sUKjeBRvEaprSpRU0O2uUnIAS4FzCJpGvaOyetLo2yUUVhTE6cohMVpRfjsy?=
 =?us-ascii?Q?f0U1id1xZOUEv7OsPkB3uCUh+akFshxXxwOmJGgiwSl+vblRUV1ItdT9HBg5?=
 =?us-ascii?Q?5xo7QL1MgMg3ZBi2GKhYYSIhn4FOdYtD3FAPczphGe+T1JmqERHzDfAsDwZT?=
 =?us-ascii?Q?QbdfPVCsJb2c7IYse3QxBFiy1+/vMGZbwtcYllgTz8De2ttdEVVqh2GGjwsI?=
 =?us-ascii?Q?hMGTUxg/O5xii3vXODoHBe9MbIs+lkX/4vdRIHh8kk0zJ2GXDP0NiM2YEzN8?=
 =?us-ascii?Q?xkaHeefidv3W6oAv/Am3kFKdoVklz/3gkSOx5gx2X9YRutpqbPgzM0IJJ9vv?=
 =?us-ascii?Q?h16L19BiMcR6oOa/wyv+hGC2unjIvMAwHEbiy3sTkxNsPssC0MY6fGmyltT5?=
 =?us-ascii?Q?/CcZgjdXm8obLPBWIEn+CPdLW7Xe3zVVp8zm0xobc/gi7iPCIhb+1mBTR+x3?=
 =?us-ascii?Q?chE1pBms2/6qcV9pMByODG6m/6HKEK2xVQKX9TnIlpDMSoJ/vQ0epl45BFTE?=
 =?us-ascii?Q?n1pS38/6BDo6V9ii86dxJQNKPP7VyjRriOfKxXdKpIpWD65JHLs0m3ul0e3l?=
 =?us-ascii?Q?DsDXDhTrL141INIWVXN4vkBPOB0I/abRq0vtE/jszt/DPzRNmxq2kh+Gxlq5?=
 =?us-ascii?Q?duE0yQXF3/izvmHHX6oRwuxvpyTig3VzzVCOE/QbwCIqM6KcMTm/MJiZ8Rvc?=
 =?us-ascii?Q?zFHYT/kq7hihv0MuEPkuHAmZx4U94QaoGVeSTWqSgaO2gPjGXOp/aqn3mbVn?=
 =?us-ascii?Q?RutpE1oTvqi9jz9iktAp3GVpXPcAgAb3?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gHs1txDQrnOie/WZuCDm+tEPdmLSzVGDzYM1v/PLgTLW/ljsxAlOrF7cr1wh?=
 =?us-ascii?Q?loR9elcdEeP6lTeQXksBzmFiJWrG1R+fJGiXnR3CUv/zQL7m8fWHkP5m9wre?=
 =?us-ascii?Q?fSeL4PsDaSptCcoVH4+1VV44YGIFuqQ3SYU8p2r/vb1ZHsu6HKhsR+HpTKiG?=
 =?us-ascii?Q?ugXX4Eskgm5h+4FKbK3e6R9iVgBxb332uyj49lh+Iq9nmJTMDZieMGOCeGWW?=
 =?us-ascii?Q?VsXdbMbxEfmRICWoRCCQ03EhQ34vIdtNmvbhLqs6jPt+FgdmuEmmDHJJWneh?=
 =?us-ascii?Q?VulOS8njit8xogOisrazGDsyiXKYmCy8jYlKOYhb2J1fe7GmOdCRP0T/jDt/?=
 =?us-ascii?Q?cHRQPOpeZHaCoFA/+py8HBOq8OLVswesrNMyTOsImT0LC11XzpfMhAoH3Hct?=
 =?us-ascii?Q?LKjSRqv+QHP/r3nY9aelgA9MWQf3EoR0Hb+n6uSGMX1u0bivGCredTlh85UO?=
 =?us-ascii?Q?MF8BoUk2zQ70Fqi3k5dGHQI3cARQTfGGEGlsK7kmndnP0WENZMGGJ2aSt0VZ?=
 =?us-ascii?Q?zweGjxRXC7Ht94J8Pd3dKos1OL/q4VxCbF2hYsZOaQFh8PzDNUe9Tdd+VKNz?=
 =?us-ascii?Q?isr3pn1JQiE27j0af/mpkBlcwwEQ3qqC4I9knJ2Ti4SR50/xRqqAl8pCkPZX?=
 =?us-ascii?Q?vSrgjlF8O0xvDuwkXaAUpmuOdYr1AVUU07w4UCu2g70i9YA/Z9lH0VGVv9jH?=
 =?us-ascii?Q?DhiUMDJonirn90ogSuRDaF8yBzuycrqZoeGUDOIOWpbksA4QwtzhEvw6QTFf?=
 =?us-ascii?Q?bXJ+9OfG+LKYTZwaLhc3q1jowhtXcsve2WwZgRpCUiS40+IuSTrNxKoRiDmm?=
 =?us-ascii?Q?nOdNybIqV9sv+QQ4WET3rl7sOu9uN6VGVul0J8MXx1SMP1lvZucQcxB2XYl0?=
 =?us-ascii?Q?6HLEAboGuRp9OcpWKwvR6esjHyUDZULENZNJUZ6mWlgkZVvaERafRq/FD9wx?=
 =?us-ascii?Q?jqznH5Pew7ZQZJ7fLPBTy5Ih5dTbAk+8qyrXf8TV7JyRoWiY8tk0uywWiaAj?=
 =?us-ascii?Q?E4fgPHiwZNGYwm9oJVyHu8g/gfbOosl6hUxuvLrP0AenCAk9HN+PWsP458Kl?=
 =?us-ascii?Q?m77E6JbosaZ/oADKQQA5ASmKP3FC1uWMlWaoBNLWZ+AmUbEfZ6OCqxYqAHig?=
 =?us-ascii?Q?SMj8VSdJPUOpgExNET6/SJJudo1zq5CaT2Knt+7irTn0Op2GAfJEMAQhAbKK?=
 =?us-ascii?Q?1CLEQYAT3/Ny98KdgRC8hQypUXbhyLeVxQCcgAC6kjQCZJh1YFVbcf5hqqxc?=
 =?us-ascii?Q?sti1wyNmndQ1EGR/oacyl+ueL26NyDKaRbXH25EQ0h6r3nxqCfw3TrrgfleO?=
 =?us-ascii?Q?KcdlcoufoLzi6/NBZHmAqMSeVBTbsWOIq6UAEGQdkj3QRCi0LVU4DAdEhFqg?=
 =?us-ascii?Q?Jr2F2JuD5hjIOjce5DKpnqhVdRLd8pAj+FmW5h2kKrZuNLysEVo/vEwB1Llm?=
 =?us-ascii?Q?3cktxK5B5egK61/Y0MY5XTbnqKpdHQJrn9gu8qMMgCsX7HAzfiKET210Kryj?=
 =?us-ascii?Q?k8mGKMoOQMr3voacQFQwsFJ8EQBUWdD1h9YTWJSkWjmz6eOh9bb2vk3AeszC?=
 =?us-ascii?Q?Z8lhYMuGItd4YvePs6tsahYXbZFqbA/PGoGdjGEfKLwDTwMsUibUWQUxxDsb?=
 =?us-ascii?Q?BQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 471e927c-567b-4700-e9dc-08dd68a7e748
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2025 18:40:50.5246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcpU4XYcFPMsUvA+NPWwVir31v+0N1991aMz9BVgaGoG4GQWzLLIhUSPp+bDtm/CD5wWqws6gAxhg5G3cKa3Q3s8RDZGgVYjghUeaIR8z7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8320
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

Hi Kieran,

Thanks for the patch.

> -----Original Message-----
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Sent: 21 March 2025 17:22
> Subject: [PATCH] drm: renesas: Extend RZ/G2L supported KMS formats
>=20
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The RZ/G2L driver utilises the VSPD to read data from input sources.
>=20
> The rzg2l_du_kms component lists a restricted subset of the capabilities =
of the VSPd which prevents

VSPD

> additional formats from being used for display planes.
>=20
> The supported display plane formats are mapped in rzg2l_du_vsp_formats[].
>=20
> Extend the rzg2l_du_format_infos[] table with the corresponding mappings =
between the supported DRM
> formats and the formats exposed by the VSP in rzg2l_du_vsp_formats, maint=
aining the same ordering in
> both tables.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 141 ++++++++++++++++++-
>  1 file changed, 136 insertions(+), 5 deletions(-)
>=20
> Prior to this patch, kmstest reports all of these formats as supported by=
 the Planes, but using them
> fails during rzg2l_du_fb_create() as the corresponding format isn't found=
 in rzg2l_du_format_info.
>=20
> This patch now lets me capture and render pixelformats from the Mali-C55 =
direct to an attached DSI
> panel on the Kakip board.

Previously I got a comment to remove all the formats from this table as DSI=
 supports only 3 formats.

I agree VSPD has two planes(2 rpf-instances) which supports all these forma=
ts.

Mali-C55(n formats)-->LCDC(VSPD n formats)->DSI(3 formats)-->Panel

Am I missing anything w.r.to the comment that I received previously.
Otherwise patch LGTM.

Cheers,
Biju

>=20
> Patch tested with kms-tests:
>=20
> PYTHONPATH=3D/usr/lib/aarch64-linux-gnu/python3.11/site-packages ./tests/=
kms-test-formats.py Testing
> plane formats: SUCCESS
>=20
> admin@kakip:~/kms-tests$ cat FormatsTest.log U [66.967523] Testing plane =
formats U [66.975763] Testing
> connector DSI-1, CRTC 36, mode 720x1280 U [66.978480] Testing format Pixe=
lFormat.RGB332 U [70.143998]
> Testing format PixelFormat.ARGB4444 U [73.357056] Testing format PixelFor=
mat.XRGB4444 U [76.574944]
> Testing format PixelFormat.ARGB1555 U [79.805636] Testing format PixelFor=
mat.XRGB1555 U [83.016599]
> Testing format PixelFormat.RGB565 U [86.230362] Testing format PixelForma=
t.BGR888 U [89.444673]
> Testing format PixelFormat.RGB888 U [92.677093] Testing format PixelForma=
t.BGRA8888 U [95.904745]
> Testing format PixelFormat.BGRX8888 U [99.119926] Testing format PixelFor=
mat.ARGB8888 U [102.350298]
> Testing format PixelFormat.XRGB8888 U [105.579499] Testing format PixelFo=
rmat.UYVY U [108.878654]
> Testing format PixelFormat.YUYV U [112.176515] Testing format PixelFormat=
.YVYU U [115.470090] Testing
> format PixelFormat.NV12 U [118.767513] Testing format PixelFormat.NV21 U =
[122.065851] Testing format
> PixelFormat.NV16 U [125.364001] Testing format PixelFormat.NV61 U [128.66=
2145] Testing format
> PixelFormat.YUV420 U [131.978102] Testing format PixelFormat.YVU420 U [13=
5.292284] Testing format
> PixelFormat.YUV422 U [138.623485] Testing format PixelFormat.YVU422 U [14=
1.955083] Testing format
> PixelFormat.YUV444 U [145.336759] Testing format PixelFormat.YVU444 U [14=
8.761832] Test completed
> successfully
>=20
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/d=
rm/renesas/rz-
> du/rzg2l_du_kms.c
> index b1266fbd9598..a5e96f863172 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
> @@ -36,8 +36,61 @@
>=20
>  static const struct rzg2l_du_format_info rzg2l_du_format_infos[] =3D {
>  	{
> -		.fourcc =3D DRM_FORMAT_XRGB8888,
> -		.v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +		.fourcc =3D DRM_FORMAT_RGB332,
> +		.v4l2 =3D V4L2_PIX_FMT_RGB332,
> +		.bpp =3D 8,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ARGB4444,
> +		.v4l2 =3D V4L2_PIX_FMT_ARGB444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XRGB4444,
> +		.v4l2 =3D V4L2_PIX_FMT_XRGB444,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_ARGB1555,
> +		.v4l2 =3D V4L2_PIX_FMT_ARGB555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_XRGB1555,
> +		.v4l2 =3D V4L2_PIX_FMT_XRGB555,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGB565,
> +		.v4l2 =3D V4L2_PIX_FMT_RGB565,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGR888,
> +		.v4l2 =3D V4L2_PIX_FMT_RGB24,
> +		.bpp =3D 24,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_RGB888,
> +		.v4l2 =3D V4L2_PIX_FMT_BGR24,
> +		.bpp =3D 24,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRA8888,
> +		.v4l2 =3D V4L2_PIX_FMT_ARGB32,
> +		.bpp =3D 32,
> +		.planes =3D 1,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_BGRX8888,
> +		.v4l2 =3D V4L2_PIX_FMT_XRGB32,
>  		.bpp =3D 32,
>  		.planes =3D 1,
>  		.hsub =3D 1,
> @@ -48,11 +101,89 @@ static const struct rzg2l_du_format_info rzg2l_du_fo=
rmat_infos[] =3D {
>  		.planes =3D 1,
>  		.hsub =3D 1,
>  	}, {
> -		.fourcc =3D DRM_FORMAT_RGB888,
> -		.v4l2 =3D V4L2_PIX_FMT_BGR24,
> -		.bpp =3D 24,
> +		.fourcc =3D DRM_FORMAT_XRGB8888,
> +		.v4l2 =3D V4L2_PIX_FMT_XBGR32,
> +		.bpp =3D 32,
>  		.planes =3D 1,
>  		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_UYVY,
> +		.v4l2 =3D V4L2_PIX_FMT_UYVY,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUYV,
> +		.v4l2 =3D V4L2_PIX_FMT_YUYV,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVYU,
> +		.v4l2 =3D V4L2_PIX_FMT_YVYU,
> +		.bpp =3D 16,
> +		.planes =3D 1,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV12,
> +		.v4l2 =3D V4L2_PIX_FMT_NV12M,
> +		.bpp =3D 12,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV21,
> +		.v4l2 =3D V4L2_PIX_FMT_NV21M,
> +		.bpp =3D 12,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV16,
> +		.v4l2 =3D V4L2_PIX_FMT_NV16M,
> +		.bpp =3D 16,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_NV61,
> +		.v4l2 =3D V4L2_PIX_FMT_NV61M,
> +		.bpp =3D 16,
> +		.planes =3D 2,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUV420,
> +		.v4l2 =3D V4L2_PIX_FMT_YUV420M,
> +		.bpp =3D 12,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVU420,
> +		.v4l2 =3D V4L2_PIX_FMT_YVU420M,
> +		.bpp =3D 12,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUV422,
> +		.v4l2 =3D V4L2_PIX_FMT_YUV422M,
> +		.bpp =3D 16,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVU422,
> +		.v4l2 =3D V4L2_PIX_FMT_YVU422M,
> +		.bpp =3D 16,
> +		.planes =3D 3,
> +		.hsub =3D 2,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YUV444,
> +		.v4l2 =3D V4L2_PIX_FMT_YUV444M,
> +		.bpp =3D 24,
> +		.planes =3D 3,
> +		.hsub =3D 1,
> +	}, {
> +		.fourcc =3D DRM_FORMAT_YVU444,
> +		.v4l2 =3D V4L2_PIX_FMT_YVU444M,
> +		.bpp =3D 24,
> +		.planes =3D 3,
> +		.hsub =3D 1,
>  	}
>  };
>=20
> --
> 2.48.1

