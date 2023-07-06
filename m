Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135BA749F05
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 16:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CC210E414;
	Thu,  6 Jul 2023 14:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D460210E414
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 14:31:19 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbc656873eso9930685e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688653878; x=1691245878;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BfK6mL0CAW9cRLGQh5z5lGHSzxdYBSDvIO3r0YTOb4=;
 b=EcjKpBRGSJPQZ6koQdW65O4RxHFWzf5C4MtZ+MbbZLdqdvl43hb8Til4k+Z5EVaqMv
 rT8bm+GaqmNouYJcoz8a/kHGpsiNVfNTH+IPL+DCWsTQinpDyhCBjEbGl5SsD+bP28eg
 nIEdXTME43b1XTmJ8rRvt6YbvWwxs+ioADYHSjtBvIz3QN8aTtN9GkFJ7zI85X7w/cDp
 IpC8nqPOz5AcYe/rWm4aq8P+cAScb7b8MjfQ/6hUOD0RCUOE41sJwmzQ455FcX37k2V5
 k52beCuXCZdx0/EpEeU2minQJ92sO5WhsyjWDgWILRQMwxUZM5KZpLUMcsHb1M7/MBDT
 WE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688653878; x=1691245878;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BfK6mL0CAW9cRLGQh5z5lGHSzxdYBSDvIO3r0YTOb4=;
 b=OMYfk+nC44BrxOVxo94pi04wHU74+PjdCWVoqlWsnueRQ+OznqSCXj5e5O3DJ1VNDt
 1qP4nkz0EeCIXVbVOt2962yrbT54vSake/Pdi6fOSVcsypYIewHLs4L/DhlDnLPexIUx
 cjvIIKkoC/WCslQh/Avr1R6Zxt86A4J4Ta9goYr7gDUFVWO1jFPfXhIeQ7WcpzhfdskK
 AgiLjATt/aH4FFps0mqerHX1Gbru88a+5S1yJzpcB4FIRP5yCCxN1CwHFijPKvsgBiDi
 Oa9B+xTI8fto3jRWgmJgAfaON4H3x5Af2qUvfS9/hbmpv1dE8lYcwKB8RfdEB+yqRFfb
 Z5KA==
X-Gm-Message-State: ABy/qLZku3n4Pk4x+hIboKmE/ZL/0UUgVCcu+efBIKCLeWoScFe97hCI
 GPXUerGhqchhhFxitkPoMME=
X-Google-Smtp-Source: APBJJlFpDtHgsq7ZEl+hG3y7dOzmaQoskbso+Ohovk8RGJLaUU8io1Zng2d1+s3Tfkfx1F8em5pfzA==
X-Received: by 2002:a7b:cc15:0:b0:3fb:9ef1:34ef with SMTP id
 f21-20020a7bcc15000000b003fb9ef134efmr2604348wmh.37.1688653877505; 
 Thu, 06 Jul 2023 07:31:17 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a7bc415000000b003fbd1c8d230sm5330980wmi.20.2023.07.06.07.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 07:31:17 -0700 (PDT)
Date: Thu, 6 Jul 2023 16:31:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 04/11] drm/tegra: Set fbdev FBINFO_VIRTFB flag
Message-ID: <ZKbQM2SsPcdiWXnB@orome>
References: <20230706124905.15134-1-tzimmermann@suse.de>
 <20230706124905.15134-5-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vrhicOe/j+jrVKaL"
Content-Disposition: inline
In-Reply-To: <20230706124905.15134-5-tzimmermann@suse.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, mripard@kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vrhicOe/j+jrVKaL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 02:46:42PM +0200, Thomas Zimmermann wrote:
> Mark the framebuffer with FBINFO_VIRTFB. The framebuffer range is
> in DMA-able memory and should be accessed with the CPU's regular
> memory ops.
>=20
> v2:
> 	* drop FBINFO_DEFAULT
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/fbdev.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
> index 82577b7c88da..d8460c5dc91e 100644
> --- a/drivers/gpu/drm/tegra/fbdev.c
> +++ b/drivers/gpu/drm/tegra/fbdev.c
> @@ -132,6 +132,7 @@ static int tegra_fbdev_probe(struct drm_fb_helper *he=
lper,
>  		}
>  	}
> =20
> +	info->flags |=3D FBINFO_VIRTFB;
>  	info->screen_base =3D (void __iomem *)bo->vaddr + offset;

As part of this, do we also need to set info->screen_buffer instead of
info->screen_base? The drm_fbdev_dma_helper functions do that.

Thierry

>  	info->screen_size =3D size;
>  	info->fix.smem_start =3D (unsigned long)(bo->iova + offset);
> --=20
> 2.41.0
>=20

--vrhicOe/j+jrVKaL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSm0DMACgkQ3SOs138+
s6Fjeg//fr4fG7EVgzEb/L1XXu8YavCnzEPlhTRugvRBKvP8qRwLNUsrBghflCDD
lH+DBq74ll+pDejf++k5bC7Dn5AO//WsA2VUv5P2+WHsGooWYKLIIU9Q+ewE7HuQ
ghinHwALz2Iiu2t16kSsodfxQGV56iGFJ7lwdtS1WzLu6kEkaIWmuVAtAuvbPWV6
73lzQ4lnZg667aOHOwg+hFvRegWv3nzVHrI4ymWgRzFtUr0uOqucx4Xbf26d0O+R
NUi7kb4ljAmqkccBu3e6USjdrExoJDdCX7hfRecjhTE1DE3QSViUKnTVBBCCFPd7
gNBVc90QeEV2L6DRu4jfsELjz4jjnj5/lXNPARk7BzU6BKV7fu4drAIpPt5XsTm7
yZoDUyFyClVltHlR7VA9yW3Ry5PEjHSYlpgPP8gvRiCCDCgDkCzGfLN4Bz0RJ9Nb
ilBoMeECKyfllAv3aGf4HiE2kQoug2StRdiBnfbt4GoeDWV5u+0DhR9WBTzSX1lp
SaPpRP4r4mZzofmDhHkc/CRi6twW2m/fMzBugRdpcEepawbqqhOf9srCd4yogQmF
+WQeKj+dEDEz6v77lrMJAaoBoAc+EJg+i53LaHqRTyLDPMtygcxABnKMbaZxpM+q
d08kKQXuM+IDon3QXQbqx0b9UlUvCPzZxqU9eFt/ewxZelSRS50=
=Hdmt
-----END PGP SIGNATURE-----

--vrhicOe/j+jrVKaL--
