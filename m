Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57581A275F3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:34:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C83E010E69C;
	Tue,  4 Feb 2025 15:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TfeonCJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B1910E69B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVeCP2eyD0/FB5OPVZvWCN2HmRA1H6Y/1/SMc9jUnndSzRJgkG0Hrjgx8fOMRFqwY/WNFzluHkVZrzMIQdhnbHEOR1q+UIxpB90qQIEZkGQjEH+C04rjRIRWk0IsFdBFwOycGN7/RCUL1Iixq5Tysl1K7ybPwy/PbrOm2dlMw/umcaqtdkKoE12S6fe7Tv3WILRjsoh6HamGHCNIHiSS8gSsFvfXtXooJfgvOIkbptHuBXl3U8/td/E7U3OT2kPYKtYfgeIOeFJjDDZ4gaFTHlZvy/rE6XUjYB5mnaljPM8i8o2Ur/mMaIt9w8drAYUsXuyvkyYuowblclTAqBnDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y5whwvICYVH9e+gb9/SRjCLmYW8yC98tVcW5jrUCO8=;
 b=FwExnPOeU7jPKRKrJRGAkTPL6Q6pVdw8aVCmxePRWijrTvBpJvl3RkFOBfkbUOk4GpViELh29lwfm+TWzsVw2CvipgYzL/HDYBmZ1ODAClP+5uY6PlTW0B2ZMolQvTYPN/HksoU4ld+GiEjYjbgZqoHguO3quWEMxIWCkNwqu/nXvcnMO1b4OC+VA7XTZK5e7U6qEXceo85D3FjUSkgeCBvb3R6wP5Jw/4cE/jr0hbl54891Li1Z7oHpB+3R1gzTgE3vW0hzpbcQBzZM5aqkd58JNEe1Gap+BOJbDaLLURLP7TJNj0YxE/wAxlFDVKEbMOZQKYHmSBtycOks/K4zZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y5whwvICYVH9e+gb9/SRjCLmYW8yC98tVcW5jrUCO8=;
 b=TfeonCJiWJYasSC2EFPsN7TKPQvtb4B9v+qSpYYZOB6EMbpyzSoRRXwDTg5URWQiVIgSHc1Du/333eo6qXhoVxS8XE3qKC/CkT+6TWfPuZYEyYj7vu0qxPp34jZAICkKmXS4CROkaogq8XiUYq3GpTkTb0eOvwv7EGYrjXEJczk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB10111.jpnprd01.prod.outlook.com (2603:1096:400:1d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Tue, 4 Feb
 2025 15:34:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8422.010; Tue, 4 Feb 2025
 15:33:53 +0000
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
Thread-Index: AQHbdJgP9S/z2tVCcU2bggWheT9O97M1bgOAgAFv+jCAAGrLgIAAAF2A
Date: Tue, 4 Feb 2025 15:33:53 +0000
Message-ID: <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
In-Reply-To: <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB10111:EE_
x-ms-office365-filtering-correlation-id: a317cc9e-f133-4eeb-a027-08dd453154f1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BKHo296GGKbQk/AYy68vIDePXSU/tcWsoIU/BZhHrEusxvAnOoa2wUrUArq7?=
 =?us-ascii?Q?UDQO6lswvB6jS3Shm7ny2nphwCrxBwcl3UyhDyq/gKgPoo2tHPa83z3h/EIj?=
 =?us-ascii?Q?bT1G7VTkWwYJTws2J2rq9kAuf5r7hAWQcBw/0GxocyxKMuVSKPTBNJhx3SDc?=
 =?us-ascii?Q?8UiUXOomOqCS0d30ITfdzMn2VIXDxwosXm8AfGDu5e3sKxgYwhULVjjhsf5i?=
 =?us-ascii?Q?vPyyAAmtuCYU+U7O+pwC49EGoM3wcCtFx3IXUuYItVOk39Qu5JXdFcXFfgHH?=
 =?us-ascii?Q?GJt8ZvuJMq177yToL8xD0PqUX56vY9/1M8BNVn+fX0jG0VP/lddlpvFoUJpM?=
 =?us-ascii?Q?BEW1OX6tfHmEtcbZJn8jOP850/dR2WK1dfAQLrBhTlcS14hxr2tG0hqB7ckO?=
 =?us-ascii?Q?x8o28HFyHKRonXurtfbwIcZxoaxujqkPrCIf4iPzSVxWY8cViPCjtd/1HxKL?=
 =?us-ascii?Q?0slyCHLxZWa0uyWvcepURbplt4Evi7uhvefDFbRyhBWgZlrh0QoBIJTmyLXS?=
 =?us-ascii?Q?48S0m+dyKFnljU6RYOOJH4LythpOGhtINXPy+KeNXM3UJz+YEakDaydq4Jrx?=
 =?us-ascii?Q?0dKEuNCuHhqz5/VYztGtmYR8lTKgFRTpYNSCwDAoMmeT5xsdiQWbFgIzSl2G?=
 =?us-ascii?Q?6gwzjhbJdAO64D7phJ2I+kdQSgijrTbkrT3JLvKOafn+le+1EwDkjlpETpqt?=
 =?us-ascii?Q?vhXcUSn2Xx+fyMVX91pXazixdsdHMbhqoWpVgflxaJ7EKRoY6baAPvkZ+P5P?=
 =?us-ascii?Q?kv90fHdRV5EMPXOim5Mw9h9g7zmLucmxl5pALECSghA8qnLBMfXRN/ZF9mO3?=
 =?us-ascii?Q?F/yAXBt0PwzLPGrWK42LjBt7UBap89uX9gc6XrFoEDEdkfBmQW1MgbhYshnb?=
 =?us-ascii?Q?uluTBgEjxJnwFxc6C2SSZ5AoqtnKARUfBzCaG1n1Oi4x2Ev8KKYkePGq+Gvf?=
 =?us-ascii?Q?PVMbruV7zy6Xap9vSywVWVGmM6kSG2FWtnrKrs7a1A6a3cb498XUtu5X2BPx?=
 =?us-ascii?Q?LVisQreA0B3CyYDHCyqdiC55b2l88sDuM5Mp4Jdu1XVq+h+OFA/jpCj5StK7?=
 =?us-ascii?Q?cn0WqVjVYIw7LRZ7Z8CQF/cdHPVK5WQ/VimDdbr2TO3Z59DmxkoNArC+VjjP?=
 =?us-ascii?Q?gp6PmO52MMtyN6vZ9smcg4ZzT9/JJytN3Gt9ofkU588oUlWpSch/9Seu3zQP?=
 =?us-ascii?Q?DZtaCl3F+yjsDRsWYhVn43NYKOtfMSsMuuKhn78wKzmqq09CKTl3Vz8XjopE?=
 =?us-ascii?Q?HKySFcMFSr4VBSl4ZN4I3WLlSgyVhVPvOqWrSqeUTFv93KWZEtKYJlZ6sg+M?=
 =?us-ascii?Q?RGrx82CbrJMEswU4EAY7U2SBce4Dn/66aaLpIy0bsH6PHI5K8YYVM5SSP1ni?=
 =?us-ascii?Q?910aFmOJ+Vm9QA8Lgb0cWOKfZAfUJhwh6ok2aShOG8nkQq/l0qRgNK7rb9/N?=
 =?us-ascii?Q?PhAOAh47DLoQ/JniM2SVJe+2CSQ85ita?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LyaqDtalMxaHIDBiTDS0JLyjPQf5y/KpWQLuPKQbXlAWe9nUlvH8knZ3rpEv?=
 =?us-ascii?Q?vOD54HED3BQfxyJ5mMaUKS9txalGjW6CfER1l9tKpN06Dc7s4u38p6aTFGfG?=
 =?us-ascii?Q?nYnJjvMxEOm4W4zsaJMmNjYsq78rAJg6Pz8QPdTz0Z69NTrmE2jYnx8LRDPj?=
 =?us-ascii?Q?5RbnsrQ17hmcVKofWPFG+l5oj45PRM5UA3iEE1iZfo1h3K7K7C6a7qjvmeNC?=
 =?us-ascii?Q?Wb/PQ47aY4lOIwbVkJoUwRGxlaCBXk0dXziof14EW1Iqmxavj1PdfJpDdzGr?=
 =?us-ascii?Q?BU14z4atFsLAXuPyM7m+Y1SJzA3u8d4VQtD6JsELXkNQmhbR6TJToQ3/HOHe?=
 =?us-ascii?Q?Gg0I5ANFShFPl74IT5rAEGszyK3SBPs8ZA0sglpR3AWSRLgSBaBBWeqQOLRz?=
 =?us-ascii?Q?rlJAmpUQPeFjQfmsZoKVo4EpSk/FDih7sl/BRsGj8SJFMIf0/uBBdGT9aZpi?=
 =?us-ascii?Q?IVVZ02PpXOElgJsXa9hojrX1mf3agr6Z2/Xnpa7cFBXX3Q4xli/5Fm5Qo4u+?=
 =?us-ascii?Q?q7jjkd4KoLQHBxPV/y8PxyWnrggyDWomHQqTOu+koNP8osxoQ9Ou40hKllRX?=
 =?us-ascii?Q?vyWpv81yg8tixTfsaqDZTHEhqPdFWBBAPX3zJ0qNlOuNtI4X6CB151FX9Lyp?=
 =?us-ascii?Q?7tVsO6JKzgdYso0W/kMJ/8nZ6VmMhAiNkf5iv6eieY0BzS35RMkw5byPX88f?=
 =?us-ascii?Q?SBFJdj4dwx+MPPtzjunKt39F8Oelg0vFioD9nC3z3U9CLVOOSSWfQ7VHNiY3?=
 =?us-ascii?Q?kBzXMjPAllAA6nU2jQHigeSyks/K699DMied/JI77Oo1jC/7jvYvsagZ6Fv/?=
 =?us-ascii?Q?B1YD3fJJpcSzYlJhC9kRxD+p5CxOHxRsdMQiNh+/q2ZbL0C42L5JIxePuuJi?=
 =?us-ascii?Q?dNdreXiLiIYbExSN4VkL4UGEulrMvf+Gs0dTOlP2Sf1QMFT73kTbnHEqKybH?=
 =?us-ascii?Q?xZxzFDuE15msjlkDkrdiX9odG3jif1GgFeulCnzebhO1qWJzupMesee3xlBo?=
 =?us-ascii?Q?Lic/HAy4ptaob/nzIX9UqEWA2+mxE7NfETMJ2KzMKr4ocBaJWh8Vck0jMDTc?=
 =?us-ascii?Q?HgO/VvNA2SLBQGyf+1oUaJsiboIKlCCyn0WSFie+GJ1yrRz/QzTJn7+iQSyn?=
 =?us-ascii?Q?VNOQl0tfh8oPXT4KZP/pVM1duaENsdIGpzS05Fa3HFT6NKpj7u4+eewGe/v/?=
 =?us-ascii?Q?vVro2mTwIm7FlA90/5CcFVXHtOrs3J25ioFRL7c+kCZWKlUh6ihyakQ0WDo8?=
 =?us-ascii?Q?ujAlc9zm/B/sWm3mNeFnTzos6RdTCJnJFeEfa/uiWQwro1a3wte1jmjhKiyq?=
 =?us-ascii?Q?cBG+2KO6dx5RYZqKMznrJ05oGVKY+D4XKOVcy6qMTcuSjg5vbztU9O4LE/mX?=
 =?us-ascii?Q?sYePBskjtCzXe3iiyuKXpqfKckW6pjckiIzyL2bKrQdMCPYqKjkA5vAAiCsi?=
 =?us-ascii?Q?MI7BuJCIhYguGQfbBuPIl7UNECBKbMYeBuBkrLi6DfFxGVImOfMN/N8iS1b4?=
 =?us-ascii?Q?HyYhWcdYIi3+ZEuQEtNbLM2UzEbJX4fM5xscwmLynC3UVRTi3TpL3bSgPFLR?=
 =?us-ascii?Q?Ms5AN2lwM2al2GtEcDvRoeZAS7E5C0R/gLXbJqBxWjax7sZounZEHjt7GcA+?=
 =?us-ascii?Q?Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a317cc9e-f133-4eeb-a027-08dd453154f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 15:33:53.6752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3frVDp1YNHinoc0+rlxg/7qmpXvsO4eho7n7pH0iXPWmBlwxar6FHByjV6x+ACyU9VQ40fgmrqG/NJy9o/ovujwLmhcaR6eQcM1OdNBPdls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10111
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
> Sent: 04 February 2025 15:25
> Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
>=20
> On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> > Hi Geert,
> >
> > Thanks for the feedback.
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > Of Geert Uytterhoeven
> > > Sent: 03 February 2025 11:06
> > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> > >
> > > Hi Biju,
> > >
> > > Thanks for your patch!
> > >
> > > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wr=
ote:
> > > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_na=
me().
> > >
> > > That's not the only thing this patch does...
> > >
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs
> > > > tegra_rgb_encoder_helper_funcs =3D {
> > > >
> > > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > > -       struct device_node *np;
> > > > +       struct device_node *np _free(device_node) =3D
> > >
> > > Adding the _free()...
> >
> > Yes it fixes a memory leak aswell.
> >
> > >
> > > > +               of_get_available_child_by_name(dc->dev->of_node,
> > > > + "rgb");
> > > >         struct tegra_rgb *rgb;
> > > >         int err;
> > > >
> > > > -       np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > > -       if (!np || !of_device_is_available(np))
> > > > +       if (!np)
> > > >                 return -ENODEV;
> > >
> > > ... fixes the reference count in case of an unavailable node...
> > >
> > > >
> > > >         rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> > >
> > > ... but as np is stored below, it must not be freed when it goes out =
of context?
> >
> > OK, But it is used in tegra_output_probe() and never freed.
> > Maybe remove should free it??
>=20
> It's not quite as simple as that. tegra_output_probe() can also store
> output->dev->of_node in output->of_node, so we'd also need to track a
> flag of some sort to denote that this needs to be freed.

OK.

>=20
> Ultimately I'm not sure if it's really worth it. Do we really expect thes=
e nodes to ever be freed (in
> which case this might leak memory)?
> These are built-in devices and there's no code anywhere to remove any suc=
h nodes.

If there is no use case for bind/rebind for the built-in device then no iss=
ue.
Or in .remove() free the node or use dev_action_reset()??

Cheers,
Biju



