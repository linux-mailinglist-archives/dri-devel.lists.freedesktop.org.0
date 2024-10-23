Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E579AC6AE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 11:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE44110E7A7;
	Wed, 23 Oct 2024 09:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="h1ZsddYx";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jj7j6Aiv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Wed, 23 Oct 2024 09:33:44 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B3889E69
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1729676024; x=1761212024;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+BKf5KNrU31RpU4f9DG5CAmvfL+4I9L1qsDYZ+zZzCE=;
 b=h1ZsddYxNBCkmWoI4Fg95rmAMqUN1Q8PLatFLrSVRqnfEMMfewBcl0uF
 fHCyQLDGofbGGVM2u8g9lkI1mARv1yutQWF1FrK0IiuBgZRg08ClOJ5zJ
 0z53mltEU2HYEZfGHMUAPEhR1wHycNKRpV849RO70cOrHuVQhfMTWNvTK
 xAWoEf5+BxmVmdHkpR6JSF72bwofb2+bUZwpktGTja643SMtDkK5bJUVz
 oKGJnYGGK2ciW0Ltas7ojPqsIYqtf7V+DTJ0227VQbHOj0L7zb5s/rgj7
 NJbvJwc43mWSjOl8jI5KzXoUNXPLCBIslNlGw7aoPS4kJkdGVpzGWZfjg Q==;
X-CSE-ConnectionGUID: N5sDUTW0TzWaNZbOIF1DaQ==
X-CSE-MsgGUID: BV9o/6MzQE6vVbNfyAy0Jg==
X-IronPort-AV: E=Sophos;i="6.11,225,1725314400"; d="scan'208";a="39619700"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 23 Oct 2024 11:26:31 +0200
X-CheckPoint: {6718C147-4-21611FC3-DAD22B0C}
X-MAIL-CPID: B425432F9F0D62CAF79F75DB369425F4_4
X-Control-Analysis: str=0001.0A682F25.6718C147.006C, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9D4FB163EF1; Wed, 23 Oct 2024 11:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1729675586;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+BKf5KNrU31RpU4f9DG5CAmvfL+4I9L1qsDYZ+zZzCE=;
 b=jj7j6AivhZGqdOxW9K9Ox6trqW/UaA2OOFLhI/gKvbP1o7poL8tpQ9wuO2AhzuMpDwhlb7
 t9XNkJBSYJ/rqr9suy69zOGSjwhFOGsY6YzPqh+oAilizzZMix+sXu+mOnUc9ARBH9yz0i
 ugvhNjdcQb3KpD6g/VgdvwtFuyDTm2DZVRie0/llR8O/W2R511Z2/GWiveARKmJCYIY5Au
 Yij+bpuudRSNyGbgWleh8E7OSxaOnZcc0FStMNXsJ0Kid5imp8nt5Nad0eKxxliNmigoIl
 qkBxf9W408ds5fwHtbA0eEQ4XWjLRewijHyvjIAlb5tnnsMSHxyZ0/+s9UnV3A==
Message-ID: <e45a5f9a63e6dba8eb57bac3c5001e8a360af393.camel@ew.tq-group.com>
Subject: Re: [PATCH next] drm/fsl-dcu: prevent error pointer dereference in
 fsl_dcu_load()
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Date: Wed, 23 Oct 2024 11:26:24 +0200
In-Reply-To: <e4e078ed-9342-48f4-80c5-28f0f7b711b0@stanley.mountain>
References: <e4e078ed-9342-48f4-80c5-28f0f7b711b0@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
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

On Wed, 2024-10-23 at 11:35 +0300, Dan Carpenter wrote:
>=20
> The syscon_regmap_lookup_by_compatible() function returns -ENODEV if
> there isn't a compatible for it or other error pointers on error.  This
> code only checks for -ENODEV instead of checking for other errors so it
> could lead to an error pointer dereference inside the regmap_update_bits(=
)
> function.
>=20
> Fixes: ffcde9e44d3e ("drm: fsl-dcu: enable PIXCLK on LS1021A")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>



> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/=
fsl-dcu/fsl_dcu_drm_drv.c
> index 91a48d774cf7..5997d9b4a431 100644
> --- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> +++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
> @@ -109,7 +109,9 @@ static int fsl_dcu_load(struct drm_device *dev, unsig=
ned long flags)
>  		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting=
\n");
> =20
>  	scfg =3D syscon_regmap_lookup_by_compatible("fsl,ls1021a-scfg");
> -	if (PTR_ERR(scfg) !=3D -ENODEV) {
> +	if (IS_ERR(scfg) && PTR_ERR(scfg) !=3D -ENODEV)
> +		return dev_err_probe(dev->dev, PTR_ERR(scfg), "failed to find regmap\n=
");
> +	if (!IS_ERR(scfg)) {
>  		/*
>  		 * For simplicity, enable the PIXCLK unconditionally,
>  		 * resulting in increased power consumption. Disabling

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
