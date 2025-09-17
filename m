Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184E6B82033
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 23:46:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7219810E5A2;
	Wed, 17 Sep 2025 21:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="HQyz0yLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B086410E5A2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 21:45:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAZYV3cGKSVB2jl1hsLOtnPzTA8xY/lLKK+csjNnJYMnU9c+gwjyS3e4gh5ye+nx8YZqtQT/bLWIoXGnP5fYtwwVkMAJWzH7u/Yk+Cal00/Ycm/BVLTJSQEgDSS6Y/Ak1OYt4+y1KzXXGtnJNd/GAlxcgYB0s9qcCNFG6zGqLO2D8qChS+tpIKc/tGjtRR9enNEO3RZGw3v8O84wW3K1HyMwXcJ+x2PR+wUVAh0GF6HrYrpkS0pgfG/yd3fvf4CkyzBqLQLR8IG9kmZrlOZZlcz6ol7u+QX/g0EhzcHqPM7WCsyVHfqgPuYx5UOqAntVM8nWQ50R2QTiBQ4q6HuNjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKQruO0NYCDl0YDcke6fdzMKEEqrYpXysXekNNG0Jyk=;
 b=Az+no+yhHB7z72aL1HK/eM5hf3LbguZjVOl3jnxF1bfI4LZeiLCMfquEXCL76S+Cgn+YiBErolwD7LtQ7T1IyJXm2U8StFHB8I7lyaUcZcm/jzXlwSYWVAP8FPNJS+Gd9D5iiG4SCJqd8QzaEd+4hIsOUNwmML8JUEvxLYfYsH1ORPtpBXYiRzG9SOTgKM69ZkmQ5HEgd8zc6lhwidHAEcbmtL/GOiEa9Rrlop8OEqQlGX40tXkSwu3XYCFVBJjlNoLI3B9iVoqVwCISEJb2lhW1V09u0cpkh2sA3a2Loz8jsU3tnft1QWoWsh1/qzS3nO4GoCKG15HZYsvUGC4PWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKQruO0NYCDl0YDcke6fdzMKEEqrYpXysXekNNG0Jyk=;
 b=HQyz0yLNMBjDsN7TyTjrUnTfdmwqMMOdL9uLWELZmhsdvU7VR0NjfJNsFtluky9/1Q9ppx+Tvn8Phrynn4jem5iNBYGGeKgac6UVMFgXCTp4QFd61JKz3Oz2BfsbuL2dsum+F1P9rnF/UIQwzZbsx3OHuaDM0E+8PrszEKQbWDo=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY4PR01MB13839.jpnprd01.prod.outlook.com (2603:1096:405:1fc::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 21:45:55 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%3]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 21:45:55 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
Thread-Topic: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
Thread-Index: AQHcI/ChlVR/Fbx/a0e8x1EYnqi/TbSX22MAgAAPyWA=
Date: Wed, 17 Sep 2025 21:45:55 +0000
Message-ID: <OS3PR01MB831915ED0F0E2452BEBC37098A17A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-3-chris.brandt@renesas.com>
 <20250917162832.02100f4bbe896c878eccca8e@hugovil.com>
In-Reply-To: <20250917162832.02100f4bbe896c878eccca8e@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY4PR01MB13839:EE_
x-ms-office365-filtering-correlation-id: 174518f8-e25b-40d0-b998-08ddf63394d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?N90AE+k2T3KzebOHvZ+wGbz7suUbNfR2O7PQUV/Rn5+XyZMt/d+CAI5Fb9TW?=
 =?us-ascii?Q?Dy3n3e+FKpvKzSO6548TTnsoVSw/83lkIxbcnST5qI/RoS5RI2i2jniM5PMx?=
 =?us-ascii?Q?iv+vjqazZWXVR3zvzSwKKb1Maw7rYNpWPoseJsJ2Q6paS9x3wKJVqEw9IWpH?=
 =?us-ascii?Q?VckyAycI1EgyZTwDmzPyRPGH5WH2+YZM74E3vQbIdCJd7xvZMFH5xmZxrlne?=
 =?us-ascii?Q?Z2Z0WUvwPthE9K5hoPwN6yGpeK+liLzP0Lypwv4ahy5hYQbHHeW4CCkeEhOy?=
 =?us-ascii?Q?8l32cCX5lJIxLMzHjDdHsPTumLiuOudwDiGRu8t5CBywZ8VMZctAGEwEc2oZ?=
 =?us-ascii?Q?zsFugmU2yH9ky4rNjt5gn0xer+NsUj1mT6obuIC5ovMs2IQ0FMR22zylH5OV?=
 =?us-ascii?Q?XEsvICNWUbCdeWaRqnIEdb8RtdMPRiG0nvKjsDR5hUDhqS3NbezKOZLtsCqX?=
 =?us-ascii?Q?2ZoadlUUe18jqDI+21yeYGyYR58b1VQ1eDCIMS29PJ546XmMIjgUYmF7L6it?=
 =?us-ascii?Q?++Op2XwSt/02gexo/v5pGeJXfttKcx2Eqkm4AlycL+TjSsXzkA8kdZdFk3OM?=
 =?us-ascii?Q?HvZ+/OJZH8AWqg4XTnI9VZlIbVQJRBadVQ5AK9fxT0RlJoO49Ei/SdvKI3PA?=
 =?us-ascii?Q?N469ecH4WisFO3U07EjHbT6/jzUqCX4w8GJR7MhiP1V5R98VNtkoufIddvQ8?=
 =?us-ascii?Q?bBK8EU8sP/1+g/3J3DzJ1M7GtUaRJHZbUsDxT6+K/u1E+D1L/3rs/P4XVlbn?=
 =?us-ascii?Q?57WJWmyoZTjdSRJhwr6FEoKBfpfdtTEbaMpNmNktSlPFd5/vK3qflWk7AC56?=
 =?us-ascii?Q?bm0AOs5ZfWgZSdXDM8LesqTYGZUv/eDzPyRWzYBCbjk+wfp9vfQwz4XuherH?=
 =?us-ascii?Q?M48phczQ4D4f2VDKmO71uABztAoWODWT+4j9Akzl9N0898xVbyeLn4GHteky?=
 =?us-ascii?Q?W8p1x608XXnMRVErQ1RU89m4W4s6TzLX1rGlRmXovoLyfI6XW4SD8aUiQqsD?=
 =?us-ascii?Q?90JiJAYJ5XkLWloHWYalnb/n+FhF2TieS3rVzNYpuBhaSjYVztkSL8Oc1lix?=
 =?us-ascii?Q?jtYRUGarnDyUB8xzG/lCUywm8oFjAtGno1W/gZ1yw+lwVfeHtVoyUQ2bjE3d?=
 =?us-ascii?Q?s34+riQq/Ardhb1Tf2AduGO1Jeu+dbVRbvuJfVrZw0fpuMCEdp7HthRJ8UQt?=
 =?us-ascii?Q?4OZjiVth+f/dpslqoyf3VBvAxdWsRtY3lajrW/tTkWF4gBuDXCGJUZ62TUR3?=
 =?us-ascii?Q?kcC9v4caVZwZSP7LqCa+mah4g+A99vIuBWLa/bQ4z6Pjv73UrwS/F2prhnfP?=
 =?us-ascii?Q?kfQTAfW9XebGgO4lXeAv7zsC9cAM4E/Hs5uXNp9/SQQBhbttUolhGHME7ED6?=
 =?us-ascii?Q?eghHT7aCZZfAH2LAbAzVyoawG+IE9yAbhE6R8lgoa1gJKpuLQwtNTvpRDyHJ?=
 =?us-ascii?Q?mS+YADHF5JOn2OFvWLSZqCOvykAElrIlF8L7dYHi2FlnHpst6rWfHQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ei/0tKmQutNCc934YMP+4/PhSmVmSEtXknS/B3NCoN2eHcyCMHPmgRXtzSjp?=
 =?us-ascii?Q?UvBlr0Bm67PL2lubj0HyLER8vo8IEhqlMHXAIIbwZZmRy3Dc2yL/QGUJfxSb?=
 =?us-ascii?Q?bwlzhaGkS0L2FX55WpG5Dcub0XgkxIm6gVP9BobJpqDsnJVse42yjvGZQD3u?=
 =?us-ascii?Q?JXrWXx/zP5sose5PereVpk80TrNCYyNt4BrtF03Y7W19vRDyMsviHguihwcW?=
 =?us-ascii?Q?2tFEW73VB8THKh6t39yaXh7kVjYcSmjm9MkSNY5c0mzQoB9XJlT6a45fgLRs?=
 =?us-ascii?Q?XStIW1QFf9MKGCT58Wz8CZrKScolTjzoEM3xkp23H7KuEPdJfP71wb2ndXqD?=
 =?us-ascii?Q?w1E86IaZkeCUK0weetw7Fim/JgvJoOyEPqw9XY1/Oor4coyM6pL2UwPJ5t2/?=
 =?us-ascii?Q?RPFFMsES+MwJmPi0yaQxWrJIjRQvl6PhrMfENjurPfbBSMHHpwXst0SMTCZF?=
 =?us-ascii?Q?XQ0mkVzH0xkK7tm/5Dvo17vmAU7+3p//k3gMcjaISd81BEcLj2oyspKrjhIJ?=
 =?us-ascii?Q?cj3r5oXr8+zgFWazw5UQSrZ/OiB5zWslvfIzwJ3Fkymw1GNdQkRxVSV7suoh?=
 =?us-ascii?Q?uUB44zEeX4DxWYRQT5xs0Ir5MfoDP4/NiT8WIwPDjyxdhNSHGQtXmL+zwGOR?=
 =?us-ascii?Q?yhz59E7zf7R330YyrkSZW/BTGnvQbHKqgVusOnqfAeKAMIMRRnmgvz8Gahh8?=
 =?us-ascii?Q?7B0NReJLV9rIg2e5Jp95KCUmZ01Yy01oHJgBWR7lSK9/zf/EgwqqkTpZggsB?=
 =?us-ascii?Q?rIbXd/rTu8K9VekvuOEhYruXS1hCL1CNT0krWuQRmmeXf4pHWZZyRxkL2sRs?=
 =?us-ascii?Q?cb42ZfR1xWLSds0k794pv1EN1LKv1/sU81Xcb/gLewWBQ49aGzfZAc9zHFB7?=
 =?us-ascii?Q?xPkhZ2q1SpACz4VHSl5REwORs9M+Mc1OExlY6gOuV7d5h5vRyrGbHh7U5JOW?=
 =?us-ascii?Q?ecI/6Hm7jcdMkv/9+AmtfdmzACW2b/m9mTrICFcAqQ1pvcy9FdeVcdg7O5g3?=
 =?us-ascii?Q?qL3CTXP4vTLvWrMaHcqqUijY/hJivP46mO/3SarlV4b5K4su6zWrptwVv21N?=
 =?us-ascii?Q?REbiIPzAhCozkh/WI388zmqgM/EPaOS46rhWOXRIuGmNouviLfujn7l5MdFf?=
 =?us-ascii?Q?HFxeDrqz3XXpTJaZpr5Rc13x0roFPKM+i6uoiKlZKTY1b3gRcX+7LvG1vnqh?=
 =?us-ascii?Q?auvYdArKpzfSHixKIZrbCUoVcx0ELzbayfsAUNs/SQJ7HQ8x9cTJsEesfxre?=
 =?us-ascii?Q?XTYCmdtLUz+T70QILRsBLscqWgniQx5ujQEoeZD601DCjGpn+Pf753gr02gB?=
 =?us-ascii?Q?mZpTscbtswShMf7BLmBHCadrWRPBAnR5r1vHr56KFHREvQypZus7qP5d4xMf?=
 =?us-ascii?Q?u1q/p55AI3s22W1LWnD4hzJ31JQpc28j9tIgfHU9YvHDm6FosM7t7UOavD87?=
 =?us-ascii?Q?AThvc8+vnAo74gai9CfXKvyWd0RGPXiOssKe3463bPLGAB1sMUsaRNTj5gzC?=
 =?us-ascii?Q?04QPzXZLPn33mzocTQucdoXFil4x7x+HGGdaj2UFMIOf6oh/3PAjySP2ZUvu?=
 =?us-ascii?Q?LxlZDLxosisYKSYS87NSSjQzuAoeWOM+ISki85RM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174518f8-e25b-40d0-b998-08ddf63394d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 21:45:55.7124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SLNNoRq2CPEFuMqixLFbhwL0QjUOwDQmlrW3Z9HNy1ZFAavDPt7zIu9fKCjGLJzSIFXTuInz+1fwvce28QS48/RzJ6hs4Saa8cxSSY9EM38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13839
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

Hi Hugo,

Thank you for your review.

> > +rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->forma
> > +t) / dsi->lanes, 1);
>
> What is this "1" value meaning? This is hard to decipher.

That is true (unless you know to look in the other file)

> If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_* macros shou=
ld be added to the renesas.h header file and used here.

I was not clear how much I should be adding to that renesas.h file. But lik=
e you said, it would make the code
easier to read.

I was also waiting to hear what Geert thought about adding a new API to the=
 clock driver.


Chris


-----Original Message-----
From: Hugo Villeneuve <hugo@hugovil.com>=20
Sent: Wednesday, September 17, 2025 4:29 PM
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Michael Turquette <mturqu=
ette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Biju Das <biju.das.jz@=
bp.renesas.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Max=
ime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; D=
avid Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Hien Huyn=
h <hien.huynh.px@renesas.com>; Nghia Vo <nghia.vo.zn@renesas.com>; linux-re=
nesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; dri-devel@lists.freed=
esktop.org
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on t=
arget MIPI device

On Fri, 12 Sep 2025 10:20:56 -0400
Chris Brandt <chris.brandt@renesas.com> wrote:

> Before the MIPI DSI clock source can be configured, the target divide=20
> ratio needs to be known.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>=20
> ---
> v1->v2:
> - Add spaces around '/' in comments
> - Add target argument in new API
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18=20
> ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c=20
> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index f87337c3cbb5..ca0de93d5a1a 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -7,6 +7,7 @@
> =20
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
> +#include <linux/clk/renesas.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
> @@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct=20
> mipi_dsi_host *host,
> =20
>  	drm_bridge_add(&dsi->bridge);
> =20
> +	/*
> +	 * Report required division ratio setting for the MIPI clock=20
> +dividers

Add missing dot at end of sentence.

> +	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to =
the DSI-PHY, but also
> +	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
> +	 *
> +	 * pllclk / 2 =3D vclk * DSI divider
> +	 * pllclk =3D vclk * DSI divider * 2
> +	 *
> +	 * hsclk =3D (vclk * DSI divider * 2) / 16
> +	 *
> +	 * vclk * bpp =3D hsclk * 8 * num_lanes
> +	 * vclk * bpp =3D ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
> +	 *   which simplifies to...
> +	 * DSI divider =3D bpp / num_lanes
> +	 */
> +=09
> +rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->forma
> +t) / dsi->lanes, 1);

What is this "1" value meaning? This is hard to decipher.

If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_* macros should=
 be added to the renesas.h header file and used here.

> +
>  	return 0;
>  }
> =20
> --
> 2.50.1
>=20
>=20


--
Hugo Villeneuve
