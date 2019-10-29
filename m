Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34501E82C4
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 08:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01296E102;
	Tue, 29 Oct 2019 07:51:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF8E6E102
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 07:51:22 +0000 (UTC)
Received: from localhost (unknown [91.217.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12A6320862;
 Tue, 29 Oct 2019 07:51:20 +0000 (UTC)
Date: Tue, 29 Oct 2019 08:45:58 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH] drm: sun4i: Add support for suspending the display driver
Message-ID: <20191029074558.rarf2avdwg6r365j@hendrix>
References: <20191028214313.3463732-1-megous@megous.com>
MIME-Version: 1.0
In-Reply-To: <20191028214313.3463732-1-megous@megous.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572335481;
 bh=6tlkf+68BBehN6NWoxxSf2mpJUjTFaOogiNKGoJC7bY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qV00x03f338JdvJ8sD/N37vqFpuGbrwN7BQvxXmDTNpn7dHPEk2t3zHB5EAarZMah
 NE93pTwnI5a7XjKftR2rVc8OPq2N3Uu3XkgoZKiTta6Z8OsNHLrUgGz+B7nS2DzKEc
 OYa7bgOM7aEXanYx0H/FiEjifC3Xvy1boi1qvMkM=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 linux-sunxi@googlegroups.com,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1982972757=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1982972757==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="etwovadxcnmgzzzn"
Content-Disposition: inline


--etwovadxcnmgzzzn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Oct 28, 2019 at 10:43:13PM +0100, Ondrej Jirman wrote:
> Shut down the display engine during suspend.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index a5757b11b730..c519d7cfcf43 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -346,6 +346,27 @@ static int sun4i_drv_add_endpoints(struct device *dev,
>  	return count;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int sun4i_drv_drm_sys_suspend(struct device *dev)
> +{
> +        struct drm_device *drm = dev_get_drvdata(dev);
> +
> +        return drm_mode_config_helper_suspend(drm);
> +}
> +
> +static int sun4i_drv_drm_sys_resume(struct device *dev)
> +{
> +        struct drm_device *drm = dev_get_drvdata(dev);
> +
> +        return drm_mode_config_helper_resume(drm);
> +}
> +#endif

It looks like you've used spaces instead of tabs to indent. The rest
of the patch is fine though.

Maxime

--etwovadxcnmgzzzn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbfuNgAKCRDj7w1vZxhR
xavJAP4yYAzBMFxdoeP+c8qATt84FYIsJ8KJOBusx6+6zRv0swD9ETG+/4EFeHLd
11lcmTIUtbetqxDMq0qB9BUz4ozo0g8=
=T1AE
-----END PGP SIGNATURE-----

--etwovadxcnmgzzzn--

--===============1982972757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1982972757==--
