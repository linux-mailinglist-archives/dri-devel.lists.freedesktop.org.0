Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBD100608
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 14:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B046E50D;
	Mon, 18 Nov 2019 13:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5946E50D
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 13:00:25 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B143920692;
 Mon, 18 Nov 2019 13:00:24 +0000 (UTC)
Date: Mon, 18 Nov 2019 14:00:22 +0100
From: Maxime Ripard <mripard@kernel.org>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 1/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code in
 sun4i_hdmi_init_regmap_fields
Message-ID: <20191118130022.GM4345@gilmour.lan>
References: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
 <1574080484-48744-2-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1574080484-48744-2-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1574082025;
 bh=yMlle1zES9xaN+aEPbZNhheFoOd8gQ4VPQ5SX1kP0LI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1IrXyyznrSS2Cj/U63mpwxxFgQBlCUFFBQ78ES+fvwXSjNxRr9VWoLDmsN98ZQ/2X
 44wycoJV+EFush/w5grKyqyzssh+dAOcKprDjBOwhvxco/Ar0k1eWZ2sUMWZ5DyHKf
 EZdZAvz+BYehg9cfcLpXyGQ3BxKdtN1abDH6h2bw=
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
Cc: airlied@linux.ie, wens@csie.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0415593450=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0415593450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="86iauDJ7Z6qm7j1O"
Content-Disposition: inline


--86iauDJ7Z6qm7j1O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2019 at 08:34:40PM +0800, zhengbin wrote:
> Fixes coccicheck warning:
>
> drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c:281:1-3: WARNING: PTR_ERR_OR_ZERO can be used
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> index b66fa27..ac435e5 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_i2c.c
> @@ -278,10 +278,7 @@ static int sun4i_hdmi_init_regmap_fields(struct sun4i_hdmi *hdmi)
>  	hdmi->field_ddc_sck_en =
>  		devm_regmap_field_alloc(hdmi->dev, hdmi->regmap,
>  					hdmi->variant->field_ddc_sck_en);
> -	if (IS_ERR(hdmi->field_ddc_sck_en))
> -		return PTR_ERR(hdmi->field_ddc_sck_en);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(hdmi->field_ddc_sck_en);

These 5 patches are not clearer and just make it more difficult to
maintain. I guess we should just get rid of the coccinelle rule here,
there's a lot of false positive with it.

Maxime

--86iauDJ7Z6qm7j1O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXdKV5gAKCRDj7w1vZxhR
xXumAQDqUOAgT9LM/zBv6uxGBHnhpWiVVdY4Rc3r2oBo+ATR3AD/UNJfy5GHgLEu
A48L6TZrjizd5jTry+jnYeEVlCiiWww=
=KTyX
-----END PGP SIGNATURE-----

--86iauDJ7Z6qm7j1O--

--===============0415593450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0415593450==--
