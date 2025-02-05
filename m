Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B91DA287CB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 11:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860F210E76C;
	Wed,  5 Feb 2025 10:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K//76SRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0B110E778
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 10:20:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg008mWt66jKsrTFB9quOnWDOqo6p2H0OZsRfkS74Hl4jN/+irjXaYXAdc/gdD2bKfdMD6sXUgphtRFIghApNDVrWQ7hRdaofFshyo2nwua7xd9hab0YRbdckcg5HzSZWN2IU9mzIo2qHkWEQT04V+ELORW2wvsPm6Uo1ehhowZKCpt5yj5fkl0w7X6yl3IXxp1GSPq6oEYbfjdjVNjMSx0qSbPnk8qJlgVhksItDHzUPb6IQ2wMB3Gy7mGekPX1DPVX9daf+XKWs6S37RbyMmbAKQhGbYHGEbr87HCALU7edHusMAP8TW3yX36z6Gxi5XkPvdECNe3MGBaAeCsrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCIbQ6cB6xJ+wWom7n5WryIT8WV4hAdSjrMiFOADH+M=;
 b=yju93IkPtz8H4EVPHrokUF+KL83TKeygCUaPEVcPM9CDopb4r5AhOUX9eX3eit0HtX4BXV8c6Qqoe4HJt1p17Tgyuic1T27qjna/hnsm9aD18HGgbuBF/WQIW5mc2qn2Am0VbVsYnSoZRcikCX0xlO23n89c+Wver3LBxscggQJoUBBWXR/4hDyiA+3/oUEmicBTYCLTVX7Z/Xi/l0qdGYvo/j/ZEUIDoWQutwi0FTLqpyIgad009z8BhHyKB5IfhiLrnEc1vQrCtV00eKTSzD8+7pNtizldvV/K40v/chKOoxW7kvzT7MbzjUwnFjdtpG7vAebgXXY+llK6JH8jDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCIbQ6cB6xJ+wWom7n5WryIT8WV4hAdSjrMiFOADH+M=;
 b=K//76SRPm4nMH8HGHvU2x34LcukheAVCPISkzX9G8JdjPCEQBrkLCivvDjEfcgmL2DFkt6w5MedfwnN3h39X3l9X04APTXuQvOPSOpMTUyzWXEkl/kkjMEQyPaDcKB1OEWK5iOGPYjiR3fe8E49PJBsZIeM53KkpiZurJ2geHb8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11396.jpnprd01.prod.outlook.com (2603:1096:400:401::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 10:20:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 10:20:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>
Subject: RE: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Thread-Topic: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Thread-Index: AQHbdJgP9S/z2tVCcU2bggWheT9O97M1bgOAgAFv+jCAAGrLgIAAAF2AgAAre4CAAQPygA==
Date: Wed, 5 Feb 2025 10:20:06 +0000
Message-ID: <TY3PR01MB11346E21DC023B3972A7A380686F72@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
 <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn>
In-Reply-To: <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11396:EE_
x-ms-office365-filtering-correlation-id: c40008d2-1675-4dce-35e2-08dd45cea98b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?xqF57PP7ZYkpJJSo39Q+icbf3A2+7BSASTTPhkx0OMRY8BsMzX07uS1bPEIC?=
 =?us-ascii?Q?pUwU2AiEPj/IHUqhQ7kuq+5hzi369Wa7qQfE/OxndsZLaK8unDYHidNvU3EM?=
 =?us-ascii?Q?P7a3Zx2qXoEIVcXR0nOaZbPUsOThq2e8ryGMuBjEeNpV0iNsT/9GiAhSDl5y?=
 =?us-ascii?Q?E62EIFvQ4j/ERJf88pJf1mIGpoHWpD+O8LJDEak/G8OO7IWei4YfyXZxXolE?=
 =?us-ascii?Q?v0RCkbc3HGQdaW0hflJFjVdLgiNBFmB6bNAzpWDvzMeI9h+CLJJ3qH93KDc1?=
 =?us-ascii?Q?CbI/Q0hy5VtllL+PTEQKCJ0vn3wxHLrSskWppRqHGH+8EvCYu4dim3aws9zL?=
 =?us-ascii?Q?zNEwq0V3eGrdyx1jYyxOMfflctELmHI/2wsCCo3C6VwF5VWvrR2tlOdAmPN1?=
 =?us-ascii?Q?NNk+f9phdskBCjRr4tVSSdd861Wa5dy3vnF2m0UFnUwmqI429VM4knfdelto?=
 =?us-ascii?Q?17IqtG9N5Yvc8c7XkRYZgqXMhxCu0imaxyJtwxWapaAy/6VVZzNxBuIkHryQ?=
 =?us-ascii?Q?hDu+4arpDHOdePu4fYQN1aMF6wFfVMcHZNx0NoC1VH20DxMQZCpeGMvTH4zQ?=
 =?us-ascii?Q?JyRvO+GpsbmWvtY9mZ92ldo71Poq880X2ON6hfpWp/48dUDG0LNhAFiSmURs?=
 =?us-ascii?Q?sxUZgw8+dti6kojP2UUmFyyMFsbJWH4vzMx3WfUAlbbc65O0vh793mszAZGM?=
 =?us-ascii?Q?k+yyAh8aczstPQJpZ3HXkmpPzHqv0fTalWxfFnsrrrnF8BGHaE6qRU+sP9w/?=
 =?us-ascii?Q?TkEZ55UEkrKAgs2KyjhudMbbmOy044a/DLdpPMFZ95cH6iDUPZasbvVEWo87?=
 =?us-ascii?Q?BJJqTFlPGgl2vxEurlCL/mct5ut2tOF5/Tdf/h4onIcepZpaCLwR6KoAxUAb?=
 =?us-ascii?Q?BzmK+E6ZVrSDv0Dh2K0Audev46A8Ok0VSAWersUkm+TLphmMMQp7emApFuEZ?=
 =?us-ascii?Q?eKV53R7GuuvD+iMRa1Wj+Q61/pgadvH8chDw2d3DI2pbIFFoqlUhI4d0dgqp?=
 =?us-ascii?Q?4WXlR+PHN3z77YJcPK4lwHUUGNR1C+EvwaEa0KhSsKRbgPyF4K8gWUmToKVo?=
 =?us-ascii?Q?UgRnNlhuS8JnQH9UUs70rpncwqdsQShYaUd/n2WFZgEZE9uUPN45Y3obwEFf?=
 =?us-ascii?Q?+5XQi+kLRW7Ow4NoAwRun3CDWrumcUFf030xUdSOi57KpxgSZmsItI52xm9d?=
 =?us-ascii?Q?YK/6zl5dZxPavj9WYnUd2ie2GO4aFaEAB20EJ7Itq/YzNV9ipbB6kPLNAgUt?=
 =?us-ascii?Q?bLGJ60aokZrMSZ0s42YcIXnKo09vSpFX17V86XDdl3z86aKdun+ReTWmKlCI?=
 =?us-ascii?Q?3kCSe1y3MQ2/6lXYKer1FHzKR9hDimZLWsYfIH/ORdWiiT0V8K3aSsp+o39m?=
 =?us-ascii?Q?0SweG3ZDQu1Dbq8XJcn957ht6sYwJhBqTMmbvsTUg6iRW4ewJQTCn4QZpIdb?=
 =?us-ascii?Q?XhMiRpkLsk2WGtCSevyOqDvVEMjaqNEW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ft3ZBYYJQNGUh2sfNg8BH5sCzWJIY8lj/+0Hyap5ixOtywq24PMmpebzbiKK?=
 =?us-ascii?Q?3QeubxxGGP29Y812IaBcFt1YJRsQvrihW0JPDBTsXJ+/zkRLaZ3fIvgOCMPL?=
 =?us-ascii?Q?/ashCf4zLtaDlPilLp0Je5Bia2MsQj+YgoM5ablsgl5GwmO5dD7oHSwyucFq?=
 =?us-ascii?Q?WHyCcvRwtd+c46oYJvJ8CtNXvCVl/d2w6Py8QIjgmRSqtPlliDLhJm6WJ3Ds?=
 =?us-ascii?Q?llzfO09SExv+fXoZWdDJGNXiST3h2xlCU7p/bgen+H5RvZLVRFMe7tZBdWQb?=
 =?us-ascii?Q?bhv8S0gy6tK+b4h57IWIks2pcE0n8t5xRF8tGzHMuJxrYkgWdTX4P7ZY32uK?=
 =?us-ascii?Q?JUNKV/i/n8rqko7EneCYzXY3jL+hrsJlw3+iy1GMD7N0TJi7IJAFqe/JzvXg?=
 =?us-ascii?Q?RFEbG8vj5xOE33FqXjBVrK+Boke9vf+k2t2ZBBiKJp9VttEaLCgTg2hWPKlL?=
 =?us-ascii?Q?aqEWoBQk7Tzs3GHycTa9WVUFNswj6OfLe3KEjkaZb27aEe+Zm1UXHQunCM3G?=
 =?us-ascii?Q?UB3n3zrV4RsL4bM13ebS+78i3oV5a/a+HuAKazYC13a1i6R4pJOgQJeygekw?=
 =?us-ascii?Q?hAc8+zsEkZi1QlSSokDgrzDXzcrcCTwSQLK9RvPxybf0AkF/Q4YD07S40hog?=
 =?us-ascii?Q?jC+hwGkB3+liWDhPpq+toZ319zcFuC1paNmpmHg0CBgezlmNOCl7Tisj75m6?=
 =?us-ascii?Q?MeXyARRKk7pEU7xV2/K/KAMFtUM1Z8+gJ48fhJ3iVqUZwwmdC5MjvzJjArta?=
 =?us-ascii?Q?k2JY5uVk6LJi56zl6hbAEiP7ruHz4/KCvOxw7PfFegRKdwh4/121ilRvr1QG?=
 =?us-ascii?Q?3pn6eHY5H5i91ZocuQAMuds19kQbu+s/kwpUZFOc91po33S4djrUwfDriLkZ?=
 =?us-ascii?Q?0OPw3zQAWdYcrqNAUOcQW1Bn4PX4wm7lhMvuAcY0Yuyeu8cfSwAX04ImoXq1?=
 =?us-ascii?Q?Lr8Lkr/W1vQqhqzRwiG3gKwisWqtMHj7hA3fQ7dh+n0//cqosXTJkKNa+a7H?=
 =?us-ascii?Q?D3U491v8h/lwwi9MBVL5JE5f/c3u2F4ocQvUIoZDoPWw6WIvaGsXP0CkcoGY?=
 =?us-ascii?Q?kUh0j5wRhUpyxPt9DpG8AhQC6zNVk0KY3eDDR559x+PlHd43N+Sd7ZowLiSG?=
 =?us-ascii?Q?L7dDg07BXn5gTDHZMiciiF9yNfNEWWPtAV6y6zSycZLmbO9N8KoV+GuEp2tH?=
 =?us-ascii?Q?kMDw7pYA9gciYjUsVZ5FOmlFKXravSkKahotK4x9TXUPafyJHr4ijXY/DRxi?=
 =?us-ascii?Q?YWyrqvn7tLEo8PZDBBdvjHthqJFEDcft5jUf/6Whh5IAaIm7mH81rwmzgCm2?=
 =?us-ascii?Q?MsI3eZzkfHDZeIvFZ8jYCIWoULOoaywXbUegVsmQMih0Q7QKGNP5YdSeC8F/?=
 =?us-ascii?Q?pvuQWFc2v9sIOaP/Lfj5/KHYnc1usGSZwO8KtzWOItodPGCx3puaEW+RdfLq?=
 =?us-ascii?Q?lZWH/95GSfCOm+OZI/3Qgti05fzaYMpo1BvLP/CAXOvRxi6T4XN+ewZA+Mnb?=
 =?us-ascii?Q?E25OQZ7X9jCPdPZd4OeOGk+HbjcSQ8fXI+CYareELhSkxfndk0KrFVa3jvoH?=
 =?us-ascii?Q?bhSZn6y9VLYAk7/dZl87n5U0VFIwDThWbYiYpb0GZKzEnnQ6St+myAxq1lDD?=
 =?us-ascii?Q?8Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40008d2-1675-4dce-35e2-08dd45cea98b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 10:20:06.6211 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k7EVSgCYj0jCad5hVuO/GsRQyCZBZ6d9qE6hNdO4AdDufTFqSjQ8lZcr5e2zYF0l+8BepqFCQ44nGag4Nxd6r4cfPEvfhLQEubVLtrE5p3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11396
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

Hi Thierry Reding,

> -----Original Message-----
> From: Thierry Reding <thierry.reding@gmail.com>
> Sent: 04 February 2025 18:02
> Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
>=20
> On Tue, Feb 04, 2025 at 03:33:53PM +0000, Biju Das wrote:
> > Hi Thierry Reding,
> >
> > > -----Original Message-----
> > > From: Thierry Reding <thierry.reding@gmail.com>
> > > Sent: 04 February 2025 15:25
> > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> > >
> > > On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> > > > Hi Geert,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > -----Original Message-----
> > > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On
> > > > > Behalf Of Geert Uytterhoeven
> > > > > Sent: 03 February 2025 11:06
> > > > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify
> > > > > tegra_dc_rgb_probe()
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > Thanks for your patch!
> > > > >
> > > > > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > > > > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_b=
y_name().
> > > > >
> > > > > That's not the only thing this patch does...
> > > > >
> > > > > >
> > > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > > @@ -202,12 +202,12 @@ static const struct
> > > > > > drm_encoder_helper_funcs tegra_rgb_encoder_helper_funcs =3D {
> > > > > >
> > > > > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > > > > -       struct device_node *np;
> > > > > > +       struct device_node *np _free(device_node) =3D
> > > > >
> > > > > Adding the _free()...
> > > >
> > > > Yes it fixes a memory leak aswell.
> > > >
> > > > >
> > > > > > +
> > > > > > + of_get_available_child_by_name(dc->dev->of_node,
> > > > > > + "rgb");
> > > > > >         struct tegra_rgb *rgb;
> > > > > >         int err;
> > > > > >
> > > > > > -       np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > > > > -       if (!np || !of_device_is_available(np))
> > > > > > +       if (!np)
> > > > > >                 return -ENODEV;
> > > > >
> > > > > ... fixes the reference count in case of an unavailable node...
> > > > >
> > > > > >
> > > > > >         rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL)=
;
> > > > >
> > > > > ... but as np is stored below, it must not be freed when it goes =
out of context?
> > > >
> > > > OK, But it is used in tegra_output_probe() and never freed.
> > > > Maybe remove should free it??
> > >
> > > It's not quite as simple as that. tegra_output_probe() can also
> > > store
> > > output->dev->of_node in output->of_node, so we'd also need to track
> > > output->dev->a
> > > flag of some sort to denote that this needs to be freed.
> >
> > OK.
> >
> > >
> > > Ultimately I'm not sure if it's really worth it. Do we really expect
> > > these nodes to ever be freed (in which case this might leak memory)?
> > > These are built-in devices and there's no code anywhere to remove any=
 such nodes.
> >
> > If there is no use case for bind/rebind for the built-in device then no=
 issue.
> > Or in .remove() free the node or use dev_action_reset()??
>=20
> Bind/rebind is possible, but that's not even a problem. Worst case the re=
ference count on the device
> node will keep increasing, so we'll just keep leaking the same node over =
and over again. I guess
> potentially there's a problem when we rebind for the 2^32-th time, but I'=
m not sure that's something
> we need to consider.

Agreed.

>=20
> That said, devm_add_action_or_reset() sounds like a good solution if we r=
eally want to make sure that
> this doesn't leak, so yeah, I'm in favour of that.

OK, Will send a patch after of_get_available_child_by_name() [1] hit on mai=
nline.

https://lore.kernel.org/all/TY3PR01MB1134656CBDAF5FFCEB6C8D20F86F42@TY3PR01=
MB11346.jpnprd01.prod.outlook.com/



Cheers,
Biju


