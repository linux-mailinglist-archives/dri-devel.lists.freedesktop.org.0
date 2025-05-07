Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577EEAAE619
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:10:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E16F10E85B;
	Wed,  7 May 2025 16:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rkizce6j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011013.outbound.protection.outlook.com [52.101.125.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B1B10E85C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V15mn9iTTPPwqOtR8fo53x8kwyvU/2rJXoP6j+whOQ1FlwJb7F2+UAExuu4qfYSxk4puTFWY6zMz8Gy/6bRv2yq3RXD4QFunf+p24nqVCaWFQT4bfnMHzvkklsMEImMdDo3/pMDK5wseQ6Uz9ssdN37q0VLspKHL+JkQdJ8GTWnAvZLLXpfT6JJFLkRvVf+aOK1BoZu3VDGtLYSkHvQMGsOaGpqZXp3yZLUtAPzuyZCVVBPqNTXOj1eAVNETzCmag7gdMM1tas5wT46uyIh7j4s5xxSi751BVh2UPFGwavohe8wVH6RMKLwrQXQTEcjbubcyU//IEziJGPqXSVX1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQDmkwNEG2Q5azyj5lMS6klgv3cQGIDFvs1x/0qIBcQ=;
 b=ZndeVnhCzucMPsQ0JLlG+NZT1J2zc480taj4VTTWLL1UXDAp7V5JW0sY3jJh05JnF+26oGvXgXkmSty+VbDH2NwUBbNc16ER7CN12Xy0z6lNpxLZ6/Vl9vr8yIFxOOwlguescFoq0t6eZP+DeUMlB7b9YHhgp5za/0ft87jiK5MDqKBvK5nA9InHPf3Z/BXXqHneG3t6FXBcXRmTKoRAsOVSa+G9AUbI+Abu9XNilwrdRDX5TIhOqNi1dtfZW7PiLr1njBaJvXQO8CgPwaXAxhmYxPNTzj4jFILNAmdIJ/pZAU6oJIO04gW3L9nSnboahnAxycols/DEvIokG3eGeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQDmkwNEG2Q5azyj5lMS6klgv3cQGIDFvs1x/0qIBcQ=;
 b=rkizce6jS8UXCe4v6V3DbE6fSPfwgj7fOHEgpi+6cimSI0ocsWqq8ypLdB8Mkw3IicrfXV8rPSW0QOGF0vEnTWtaqilaIz3bTVRrfn7lw7iLWFnLmfs5+1fPimKKJsstKpUZ+IETPtO+FOhdRmgkediTsA/XoPdLBBq/FLfR6ik=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9746.jpnprd01.prod.outlook.com (2603:1096:400:22f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 7 May
 2025 16:10:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 16:10:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Mikko
 Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Zhang <markz@nvidia.com>, Dave Airlie <airlied@redhat.com>, Terje
 Bergstrom <tbergstrom@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Thread-Topic: [PATCH] drm/tegra: rgb: Fix the unbound reference count
Thread-Index: AQHbd8Aqai4WhmiBF0OEIqjKJRkhe7PH4p8AgAACizA=
Date: Wed, 7 May 2025 16:10:07 +0000
Message-ID: <TY3PR01MB11346CB37650B2F888CFC6DE48688A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250205112137.36055-1-biju.das.jz@bp.renesas.com>
 <a3gzox3ajhvatfmld5ny2lulmp325ycnukksusfbtldg37nqp3@jb4qajtuzczb>
In-Reply-To: <a3gzox3ajhvatfmld5ny2lulmp325ycnukksusfbtldg37nqp3@jb4qajtuzczb>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9746:EE_
x-ms-office365-filtering-correlation-id: ffb21744-fa16-4a65-31b6-08dd8d81a2cd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?RP3X7CD3HcHCDq9Q3c6JBcnh5KJk2/C6VmNL92TLHSZ/aR7r/BU14Nw0iAwI?=
 =?us-ascii?Q?Oy8k4WATEEM2E/IW7YYgdWom8GlBnqfGQraYmDbHjDcfWQ9iDsslj1MwioXN?=
 =?us-ascii?Q?BahMTlsOnw9cExEV6YGgZPghBQBIM1P2dXnu7EvECI0VHPmG4V+b6/BDcZVq?=
 =?us-ascii?Q?4v3rHjgxSF9mICrKmMIx9fbTiGpK2KFWtYU1jPsqi/FZU0EU5TAfWEgz3Bih?=
 =?us-ascii?Q?0C49QicULSYjyP/AXiwCNVdnejOjdJwdmq+I0+7aUHUSLLtmj5TtBAOSnZvA?=
 =?us-ascii?Q?+I0LKHgb7bkFfelwo2b7aDsTVlHMb2Y+PYozLhpvsuMkvIbiaak8dt2LvOSA?=
 =?us-ascii?Q?gphkDDWjo5s3aGy839sHYcbzTiDCvyGHclT2uiOV0AIVjEU8s8U4/RDWURmZ?=
 =?us-ascii?Q?aDEoVar6+FeY+4+fciCvn5ORxTbor2lGct2rn4qSW3A0gYTc1kXqYw0vCj7H?=
 =?us-ascii?Q?aVkcA72lnpRCG9TLhTkABhy+cGP8ks3/GubR+8MNh6lEogc7BNAqFwgcpo1e?=
 =?us-ascii?Q?nGvGqVXJ8cnYtedSPzYEnErzVEMJv0ncnijeffyBk2wGZMhy03z/4mRrN06S?=
 =?us-ascii?Q?diHb8+k//+buv044Q5aeD0BHv8Z/O2cSqxNKcdlNXmfjBzhPcw0FvnSLB51b?=
 =?us-ascii?Q?FjjdcWxFzsAKA4edDLyyUEaNXo9LJHUVqkc/gkARhDksntNpGd/ETVyBhFTX?=
 =?us-ascii?Q?kDLpixyVZCBNY5KpmiQ/TbiHJrQcbH0xkNCe+5goB8ApgYbp7rIHk8sB6O6r?=
 =?us-ascii?Q?68lxe8Br3SnXcDUerIGiVISPz3kPoncYK6vPUQcUaCvvOlHVbOKW1wS4v4f8?=
 =?us-ascii?Q?CtMdaDqgCRJHOgZ/LpWM9HJGKezd80a4XWunmRLmOKrllIL3qeMdMlIDrVbj?=
 =?us-ascii?Q?dAcsL9sb0XUEUJwRsNDgn20lGV3LFsxZfNIQCizvVPfAKomGVjjAjSzNzSa0?=
 =?us-ascii?Q?1Wzv6z2MDBWKy/CYx5PeMARD8+P1wfmfLKM/mE+YLx6zqYBoacglvIro9O6J?=
 =?us-ascii?Q?qPu2graXJ22PxisEV5eNrZo7gGUFdmyLUOf0tfMNExX4fbb+GmgQKqhLP6Vp?=
 =?us-ascii?Q?ZtawyBHu8QdSdEVcSw80PdTutNmbgI4UDUjTUngn/M7ROjdhdchiRkC5r+mg?=
 =?us-ascii?Q?V2s881KWUPWvySnJcEl5Fmri5so3vW0WDcfiwBpZleh0fgL6GpgngtLWtD6+?=
 =?us-ascii?Q?NctjhqISKO3bkYhzB2k9VzxBx60h816zw0Jp/lgkeptKbRtC0J12LPpTfcM7?=
 =?us-ascii?Q?oV34XNHFip2viXfrD4zEKGY+DnNjqg6owSIR8apf/0gGD67CnMG1L5jdP/m8?=
 =?us-ascii?Q?81M0Gg3Y/JpF5ordVEpPgbTkUuI+ouFPL7LQDA3jERwHtSAyE2xBN5LnUOL9?=
 =?us-ascii?Q?qyYdIX+LoAUh8TUglSsVeJkQ1V/3akX1+IhC+ep98WvkoF/U7x4Wc/ZzZvln?=
 =?us-ascii?Q?SFdNabtjR1cQ+fexlGk0fsuOgP43OSMSUT5c2R9m4Z6smS/21lyP3iMCqg+e?=
 =?us-ascii?Q?Ey/dBchZ0UxcHr8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OdRaRwxcXblaJaKd+jdBjPQIvx6q6yfoIZwX5FVJSb91Qk9yF81VHn3oMXkb?=
 =?us-ascii?Q?hQv65vroqtNoWnsNneFvKOIXPnyJlvOC/FhKe57WeNpzE5SdX56p0zfQdKlx?=
 =?us-ascii?Q?1VSp1hWQzFG2WSwuOZVJI8jdMTRRFmsyUC3ocucLF9ZQcZFry8xZHfFvnakO?=
 =?us-ascii?Q?88r5mg3n+rJPE3qh7Cf6jP5c5CNz3jUQx4Ld4egS6S6rM8Xoi/A/7KR1X6P4?=
 =?us-ascii?Q?eDxTkj6kNYW9lJMJvL5Qqgz1T1Z7X9PsgTGY8gNLrfzUnLkvvJiABgE7Lqn9?=
 =?us-ascii?Q?9T8jcpvZAS+TAUmP/JzyudsXBF8IvlHiyr9jc8GZFBKDbBICMzN8bZjJJ61D?=
 =?us-ascii?Q?3t+1rU8SSACkfgmYsVvzfG1rid3cRhCXOK4yhGo71PVElJjeZJ1p0fu8Y4rI?=
 =?us-ascii?Q?CXLbWYEG1zbaJCzJN7Oi6cA3SrlNJE85QgYtjgKtrToBX1LUPuUfkahCyOwM?=
 =?us-ascii?Q?y3ggilZecScgglKlFZPSvnML4g0qHklD8z+N4MBMpygsqW3+5EHkjgSxz7qx?=
 =?us-ascii?Q?qUqKjN47je6E5rrnVNDH7NmIIHF6ltbrZ06uoxQdWUGzGxpzFFXvn6R0fG8h?=
 =?us-ascii?Q?rA5CN5dD3KJtaTuth5Vf6P4D5Aio+ciSP361DnRMtl44BRMzS3FwWqKYng4Y?=
 =?us-ascii?Q?nabwsZKU6P3nPAWvPDdsEMc6MeEqng8W0EHhJ7xReeEE+ioK8MFEXWZW6lGB?=
 =?us-ascii?Q?UqFc8dX2o9xlphL7LuiwvJJR0dADyewz58RDsrGnFlnwfuuRW5kkmBbP9613?=
 =?us-ascii?Q?mX4KfPnlSrXtFCQPpbxfTMGJjgjfMK42xHWEmBiAdN4Rl6C76KHzNjU8fyqq?=
 =?us-ascii?Q?XNQ9oRlg/STZ2GFeB94CC2aGBMshlQ8omg9jaRsglHkZp5JJquOWVaqFdiys?=
 =?us-ascii?Q?cA8LViooRiE8F7SOo6SYQfE5CHGpgXhPojvg2pDk+gB+Hlfx7yixuil5Rx4N?=
 =?us-ascii?Q?VNw4aXfN1WqbsxB9mUbbQuESae3fjyGfJi3cqkhdo7sh//FtdMP4MkVEyPvU?=
 =?us-ascii?Q?tRUxeO7T75F4cvsyNNBcbFGXY5W67JBJcMIRIw3MAkNNDGdqMWqxMpOZtRAs?=
 =?us-ascii?Q?pAJZLrZIkDy5swllx9psgHUh9SQPdAAHF8U7u/ulMIeQ41jrc6rgi4jRt9zF?=
 =?us-ascii?Q?w1Z5nTHhKFI4FHhmhRGvFEYQPrEyCGCzHoAzISwc8W4WXuqjzaIrlT4gk6ld?=
 =?us-ascii?Q?iJRq118sXj1w9QPLbAPFvmVPufdbYfH4wW1WCMCbMSlNJuJKZBqhR0T6eIon?=
 =?us-ascii?Q?ief0axFxJ912XzghK1TpZXN6ht3yZvdje1nAdco39m0ro2yX8VKGBB0zz/61?=
 =?us-ascii?Q?96eW3PWRUGim3cy8L9GaGWzjcYLYSKLVPY6awcR7o35/zh+fG7+EKoHmmE4s?=
 =?us-ascii?Q?8s6hXKVwZSIq6/cZ9NXyu18ehllcr57udNfPheocSbIxpebnGlpUUFLyfZcC?=
 =?us-ascii?Q?UVgpcQY2U+ux65PES9yNoT9kMSHNTQ8teo3ROhM6WPwCJhpCmJGI5DWVyrRe?=
 =?us-ascii?Q?TNdbGHAz6KCDsx8Qm1iuSsC02pP6407obn4D+LA0OTL7e1TpkEb0R/LBEkDv?=
 =?us-ascii?Q?iK0IwKyBf5zoGv+S6OBDueJd8tfmSRyx+f3P/F+CJECwpVKRRC6ZbsWn2xAc?=
 =?us-ascii?Q?Dg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb21744-fa16-4a65-31b6-08dd8d81a2cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 16:10:07.8074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9FMX+EcAxocJ+PcYXTHXDYHyGA0Sr74ZHe0tMFhsIfQNP4AwlUPzdxWjfYsbs4IAsbJyoYIy1BhLo6c+a4wN4YeoDoxVmk+IUcbs4xex4uI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9746
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

Hi Thierry,

> -----Original Message-----
> From: Thierry Reding <thierry.reding@gmail.com>
> Sent: 07 May 2025 17:00
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Subject: Re: [PATCH] drm/tegra: rgb: Fix the unbound reference count
>=20
> On Wed, Feb 05, 2025 at 11:21:35AM +0000, Biju Das wrote:
> > The of_get_child_by_name() increments the refcount in
> > tegra_dc_rgb_probe, but the driver does not decrement the refcount
> > during unbind. Fix the unbound reference count using devm_add_action_or=
_reset() helper.
> >
> > Fixes: d8f4a9eda006 ("drm: Add NVIDIA Tegra20 support")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/tegra/rgb.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> > index 1e8ec50b759e..2065157daab3 100644
> > --- a/drivers/gpu/drm/tegra/rgb.c
> > +++ b/drivers/gpu/drm/tegra/rgb.c
> > @@ -200,6 +200,11 @@ static const struct drm_encoder_helper_funcs tegra=
_rgb_encoder_helper_funcs =3D {
> >  	.atomic_check =3D tegra_rgb_encoder_atomic_check,  };
> >
> > +static void tegra_dc_of_node_put(void *data) {
> > +	of_node_put(data);
> > +}
> > +
> >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> >  	struct device_node *np;
> > @@ -207,7 +212,14 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
> >  	int err;
> >
> >  	np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > -	if (!np || !of_device_is_available(np))
> > +	if (!np)
> > +		return -ENODEV;
> > +
> > +	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put,
> > +dc->dev);
>=20
> Actually, I think this needs to be:
>=20
>   err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, np);
>=20
> otherwise tegra_dc_of_node_put() would attempt to call of_node_put() on
> dc->dev, which won't work, or rather cause corruption of some sort.
>=20
> Shout if you disagree.

I agree, is it something you can do while applying or you want me to send v=
2?
Please let me know.

Cheers,
Biju
