Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D425A7CCC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 14:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B9310E329;
	Wed, 31 Aug 2022 12:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7950210E329
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 12:03:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtwL5dNqKb++G7A7V3rSqzuL4gdgUz1KcOhMBLsZ4gperyjl6dwB++qhJ0LaqT3wDaQhUW/mP5DjxKKYunEDQFcAnT8JoHZoDlVuaSp2fW9Z6j8XAae15gX3ge+/9XEVuNF7jJY9u7OHYvFd4JTB79Xd0BdRN3mTgTYgKAALrggc0f3tT2oxSPJYNeQC6UsC0gZpqQBjIqYr/78tB80+D1zzgKZKGP48Tf3PyzBZyZfntyycujseRJI9cDhZB/ApyRLKV4pk/C1jgxUwCCOP+w9lvoaFt0kgW72Ocos6kI2DZG+kTevFt8/vRiHJ3ewx3gwDfzw3ytSeYhzJi9C2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cb/rg1OCN97l869Sbv5Flqzzg3aGOvtmIxhP4smGKHM=;
 b=gZarCbVDkUqm2sob1NYuuJyEWalRtv2JCbZoX33P4VbnXz4Y4ODGUy2dqP3vJqotscVRF69SwmAHXG5qz42Oug6jQf7VJLfv04a4mkp7Z8EPH1LvJeW8HdIWFiDwXIUWggqdMzWP5NA2PP6L23Yd8VmGyEoHg5JChKh8nD5HHk1Wpu0yk822IV85JK+hRR1CmI1njlnFI3R8751XU9dfZfQ1JCFXXnw6oYV6xf98FnhFIh98pW3TV1UAnIs2tzIyAM64fvN7Qnuvamr2lT3MZPRhgY6J2ria2VySLUjlFSIo3uqOpsifsj1ZFEkZf1V53snBYQSm0Yv7a5OLZSmN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cb/rg1OCN97l869Sbv5Flqzzg3aGOvtmIxhP4smGKHM=;
 b=Dm0q2Je40iy7/lCIpWEhTNOxIiYE152SUhMEMunXu6rlzqsScW+u1iFt6VmTzTBTRZEwOfQEuMY3RWRkhaMz7ehs6PWAo6hINawHzK5nUXlbf7TorA78K3JvBou3NoV94Q5a1NW+f63fafBzQgNqf3A9+VFCxl0najD9jRE2eN3icNRjeJmgqnJrcW8N6mM2ePzmxbChGINffI0FnGGAXqvxocrLUxqJFzLKJkx/hAYUXAnXUtFdGaEF+HGdF8FpmZXevIb8gHYQuYwoyH++WwqD8ZtwLmkbf5vgI04eELj9BrsEczlWiJdgtmu1ch8gKnTnTDXzJfstf+sa/GZC3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 12:03:02 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::bd0e:9ec:167b:a19d]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::bd0e:9ec:167b:a19d%6]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 12:03:02 +0000
Date: Wed, 31 Aug 2022 14:02:54 +0200
From: Thierry Reding <treding@nvidia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH linux-next] drm/gem: Remove the unneeded result variable
Message-ID: <Yw9N7lMunu9XjXo5@orome>
References: <20220831033301.302121-1-ye.xingchen@zte.com.cn>
 <8735dcepcv.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wwaXRVMgg64Q3zs8"
Content-Disposition: inline
In-Reply-To: <8735dcepcv.fsf@intel.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.7 (2022-08-07)
X-ClientProxiedBy: AS9PR06CA0360.eurprd06.prod.outlook.com
 (2603:10a6:20b:466::16) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d89091-e577-4b63-e5ab-08da8b48c15a
X-MS-TrafficTypeDiagnostic: MW4PR12MB5603:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pqfLdhSUoRDLLKXs/cMqN6rwiLFY/8kjvJzaQv6RaNvpzdi41rfhGOATyg882l38g1yWAIE9oBhLSCMRuJiaP9LDOIbOEEB9Z9uLPrxRPbjQZQRlISwQVk2ZPQ2Ft0sZhV1w2x/EuNelz8CFwUCNk5v7Wc7rOzHyz8pgzc78YXpZqMFT1DrwdM7YYt/9kupsf8hxj6uUwXZeYeF9OTfx46UqBc/Fqw5D71uu88GgbcmoSAZ/OtMGAW30FTK5THKuic7lPVd9oxe3YixcMx9YcktDUIvku6nGow5USV2DSxR7DWJHxakLWutERm0qdvdU73iywKMmEhrnBHVSurQ5U2rDtjneUsb5P+l196tuu0/ucFmbtbgX7+XYBiV1qenvnaqSrO21uqL3q/++XbUtEO54HN7SzFQRmz1LspHOZlN9y6nAGxLvYI2aeNelVWxnIjqTzKlT8ADqWzvQXuA7S2CCoY06CscwcYkIxn/R0L9RvuCwO0UX9WL9dVBDV/XIST1qnnKLXxtht1Ep29W1GOji3D2XXM08uviLmKRp6m8ebQFqI9mmNVRHrwyMHKbylW0zfi97OSR4fNdMHyShmTkNhkggGDQbl/r6JVYq/p1UTSPRafGqUwaC4+3Wz/HcT22yU0VQ6yCaplJGqXjNWGG1Wp9oAXtFjdLI8aLQJmbpGdv40maQcak9tWgT9EuBmwyscPgrnxfidpPTPVzgG+KgKbhUTdTFBPX58IDLxqMOhudxNzltn7L4jETj4aGSV6652t7jt3fr9JM0WS4ndw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(7916004)(366004)(136003)(39860400002)(396003)(346002)(376002)(6506007)(33716001)(44144004)(66556008)(4326008)(8676002)(316002)(8936002)(6512007)(6666004)(66476007)(86362001)(478600001)(6486002)(6916009)(38100700002)(54906003)(41300700001)(186003)(2906002)(66946007)(9686003)(7416002)(83380400001)(5660300002)(21480400003)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NbEOrjJ6zYf1RyVqdVqSx2dHimsilhj96EvsHUtWoCygJDJFAJm8/u5xnzqF?=
 =?us-ascii?Q?q+FS2HWD197LJrh/32qY4jJtsQA8NuHpZ8phjvgTi/ekHz4HuLE1Mf/ECrsJ?=
 =?us-ascii?Q?bhkawjFXMtyi9OtHgQrU3jXRzt9PqvrZpiJD0Aehl89j4x2A2h5ItU646xUm?=
 =?us-ascii?Q?6zDoMp6Y/6iPdReNT4UCtWgvhnRPDjhI45BAo9mpSQ8Z8Jjx5ANPirzSOUvW?=
 =?us-ascii?Q?7jObiDRi8LCfovsoM7AiBuBDNwndDY7jQhTa5UAffOxkvo3QMoVcCfqfeTMU?=
 =?us-ascii?Q?OsAVI12Qf3mGsgF7kRGtzMG8EARqC5UDnPKxhMukWME5fhbO4J7yypcaYbp1?=
 =?us-ascii?Q?Ajne1paNweLhZamuRjWRM3IPLm6c5C/sLbkhuSobWtYy3sOU6/UFIFH5r08c?=
 =?us-ascii?Q?hifYNEriqj7xphl5lJ4FAyH2d1UxZ2oNBEeMDAgNddeCK10rymAWqiFtNum/?=
 =?us-ascii?Q?0LE3nG//3kWX/BAu5+z+mmAXpqf0w+V+CGB6BvLLIsOYdS2/A0z/tUlEMjQi?=
 =?us-ascii?Q?y1z9QnI5nDeksF/sNRFEWxYh4PUVgBhZ9RZ5KGR+ALwyL71CRixVpy/J1/Zb?=
 =?us-ascii?Q?QHSJK+ihQRXTzM0GI7GGz+r4iGrOJWqUumqug8D6pBJVWawyi2NdV3dS5C60?=
 =?us-ascii?Q?uLjWWhEaLTlAdE2z1/+WmdHk1fjFc+4OglcctoSy43VLQi/wT3LY9ygMDdy/?=
 =?us-ascii?Q?9gaqhnkx8QLL+hMX2nVLRlUEMfLq/f1K2/+qF1iZ9OMKsfX5XKHIeD5rabL6?=
 =?us-ascii?Q?JZC9Zf0X/YdA4aVHu3gCfoXpgniSjEhokpz0mdUgRKA3uGLRoy8MP9JnK4Vy?=
 =?us-ascii?Q?O+pEy5rhmaOSDG59J+ms76W+FtXUi+m8YjJdQLjY11l4F15Hvrpj1tuybZh5?=
 =?us-ascii?Q?XizFq8CkPwFwjwE+UVCSL3oUAxkleUyEvsQUv9cZ52dvie56tl6fsaqCXYoF?=
 =?us-ascii?Q?7HmlOaxodLXnXugagkc0JTqhc9EBhfexLK8fuHQgMseulTGCqyIeGTgFWB59?=
 =?us-ascii?Q?yb6aCJk4+T9t8/JXJnBIx7oABOYVNse/fbcqhvZliRhcyBcSIOjsxEER5uMJ?=
 =?us-ascii?Q?4zNQwGRTZ8GCmwVRQwEoxYQwyrK0/dGWKbF3mbhtyJpsqimcLlxWxAb7doI4?=
 =?us-ascii?Q?GycuSPXU8HRGK7Zp4yPcfdFqZXH/a9GeSzh+Gsn5fUnYDhEQd/IwUhStH6Lz?=
 =?us-ascii?Q?hkMCIDTgpGeo3Ous9CXeyM/9J98bI1432gDb8TeEAr/qRMYUnyaM6/+dj2wV?=
 =?us-ascii?Q?DW7ACnx/O6BuP8fQ9zxQ8jdywdKopaUEJVrYf5r1hpane0O58KWXkENfQ0t/?=
 =?us-ascii?Q?/1yAYAqzazN6IhqY2N6+PrZdmIKnodfeUYZ/Nx+Brc8nd/CdBFZ8G/UPlidd?=
 =?us-ascii?Q?GcF9GulvGkzG1eydtuhPPdYCt3wii4zaRKk5482LHQaOYAZp8PALAVQOoe43?=
 =?us-ascii?Q?KNPbeO4IQC5A/JEz4/N0opbn3kfSwXjWoms1npcGqZVnUlLAL7B17Hd18WDw?=
 =?us-ascii?Q?SJ3PANtw2I92WqxoiLXTWkv1ZbOS9lFGXzU20wAfhKjNCDBOewJADqC49L7/?=
 =?us-ascii?Q?/H4zpvueFaOCmTTsGZ/51p4SAR1foVc+Zwby7x23gdgQfGBF1wf+R4JkhbgA?=
 =?us-ascii?Q?v9a94dUNZz9VjFbpbhGvxx1tg9EWGHQGvrVbsi5y4CJL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d89091-e577-4b63-e5ab-08da8b48c15a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 12:03:02.6243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2k8UM5undshxXg75xPUZg5ycVy1odqFqdVpzYNiiqUK0y7B7SxOhGOj0ukpjN/XEF/RnkstwTni9Bsjn1KyXig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603
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
Cc: airlied@linux.ie, cgel.zte@gmail.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Julia Lawall <julia.lawall@inria.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 tzimmermann@suse.de, ye xingchen <ye.xingchen@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--wwaXRVMgg64Q3zs8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2022 at 12:25:52PM +0300, Jani Nikula wrote:
> On Wed, 31 Aug 2022, cgel.zte@gmail.com wrote:
> > From: ye xingchen <ye.xingchen@zte.com.cn>
> >
> > Return the value drm_gem_handle_delete() directly instead of storing it
> > in another redundant variable.
>=20
> Personally, I generally prefer keeping these types of variables, because
> they make future changes on the code easier. For example, adding a new
> call where you need to check the return value, or having to deal with
> the error value right there. Or just adding ad hoc debug logging of the
> return value.
>=20
> Related, but not exactly the same, see commit b784c7707502
> ("coccinnelle: Remove ptr_ret script"). Adding Cc's from that commit for
> input.
>=20
> BR,
> Jani.
>=20
> > Reported-by: Zeal Robot <zealci@zte.com.cn>
> > Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> > ---
> >  drivers/gpu/drm/drm_gem.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index ad068865ba20..3fa0deff3014 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -782,14 +782,11 @@ drm_gem_close_ioctl(struct drm_device *dev, void =
*data,
> >  		    struct drm_file *file_priv)
> >  {
> >  	struct drm_gem_close *args =3D data;
> > -	int ret;
> > =20
> >  	if (!drm_core_check_feature(dev, DRIVER_GEM))
> >  		return -EOPNOTSUPP;
> > =20
> > -	ret =3D drm_gem_handle_delete(file_priv, args->handle);
> > -
> > -	return ret;
> > +	return drm_gem_handle_delete(file_priv, args->handle);
> >  }
> > =20
> >  /**

I agree with Jani here. If I recall correctly, the pattern that the
coccinelle script was dealing with was slightly different and in this
example would've looked like this.

	ret =3D drm_gem_handle_delete(file_priv, args->handle);
	if (ret)
		return ret;

	return 0;

You can collapse that in the same way, but I think it makes it even
clearer than the original why it makes sense to keep this construct.

If you even need to add any other cleanup code between the "return ret;"
and "return 0;" lines, you can do so without rearranging the rest of the
code.

It's obviously highly subjective which one is preferable, which is why
the recommendation at the time was not to provide a script that would
make any suggestions as to the "right" style.

In my opinion, if you write the code in the condensed form, that's fine,
but if you prefer the more verbose variant, that's equally fine. Trying
to "fix" this up after the fact for no other reason than to save a few
lines and/or a variable, however, is a complete waste of time.

Thierry

--wwaXRVMgg64Q3zs8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMPTe4ACgkQ3SOs138+
s6EB/hAAvy/t9LLfH8ZoYSIwzY3MtjeHZY7eOQ5rbBcGXdrhP8XhP0npQlcSEYm6
GqaasiB1ZHfp051K3E/EVnoHUnyXW2bT3mxZFPVojx/bLyFaCiXBmtUb/mPkykz3
7umvaIU527qXRIM0NykHcyICs9NJpcCXtPBGq/ZXts2sBmjqNZrZZlFPkxIihaID
o0pd2GIV4a4PoUuyS4dvddFSn38T02czw4FfjaeGD3kxUgh0Cak19iDj6KRqDYKa
75+ZE8j83eUPK1tFsao7YAhQAUcxeqXwCg+n6IR0rkYztvfwA75GR6zLTjWGrlgo
sqP0PT0tgr1o5+6y7DjAmMPYIzEgERaHCgQTDK7P9+ez1gEBWgwgRqu2LAgkjtvP
8zv3utfECT6ZnbOht4fNcBPtkC9DKa0aWtIbtpO1Jd/g8m7wGdS4xRA7tBvzw+bQ
6nDgzDK44ezAFHjc3STdXZscq/yYZrJhbcV0IIUNfAZEAQ28DIkvilphF4lt2MxO
76xXu2VwoF4gH3KLgf60L2VI+eZAVof+F9cAnjiNO1Q0TgztXgupNGacNWpusQwU
2zhZr6JuoEcMAc3xZBYDtCoeGFHLDhrsOsfjhwwaB4ZEL8cJ/YfYqC7oMptmZZxe
gjRR+EKoMMueUs8+EUey/jIIhAouoRiYo1EdMGXhvj9Hl721c58=
=t0EP
-----END PGP SIGNATURE-----

--wwaXRVMgg64Q3zs8--
