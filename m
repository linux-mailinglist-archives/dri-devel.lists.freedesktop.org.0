Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C655F099B
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 13:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D8E10E145;
	Fri, 30 Sep 2022 11:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3AF10E145
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 11:11:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id a8so6311539lff.13
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=Sgn0jbVWHofRicUPwIWtoRVU1IAonD5a9H2Y+2tFXBY=;
 b=RVz8TT6mPp0AGYzJusb6FU0UA/cKVLVeY7UL1uwh3Kky28nngpvzP1LIAv5v+Hx0AB
 KA8JClZeXPuauYhXoJe5cwCAyZGnLekdrimqOWgXCKqnRHbMuViMaaxjDZNdtoI8jR5r
 IjHLR3UE7+9m28SADB307RWeBdyr/jfJ+xXi101tlDZW0BQNQOByXvW1lxrFeHDu25fE
 Yg2Zec1e43Iw5wAtV7+jg/ZkxpEmMtx/IHIx1uN6xlPaSiKNLxeHiOvTf9ewlvlTBl8O
 gTuTIGmz8Oy6gWHehSJ8yrftFD4EtXHPeWnH+wi2cvuMI07iOv1HaXjuD1YwWvx9Unmr
 P91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Sgn0jbVWHofRicUPwIWtoRVU1IAonD5a9H2Y+2tFXBY=;
 b=HOWfO6koBYtkrD80iT1x6BXIE+NGse4lWjpJiG8ixcYvk6hQ/Foqh/Apkj/WA+TqE8
 MWdY24EJ3CERt60FtEnibKmJG+tp0Stc/d3dHlnTYaePZ/BwI6mePslDQ3MnqC9R7igp
 swjFlZ1uLPXTmQUDitxHmhlC5wjQlvRQfVcUOuhvnbqtDEBwiuDpuUsLbOPNmCSifBDo
 7A86Zoeju206h/P/TAeGCQgzPHJMVahgW0FM+hXFQWK/1tcjxXZrdEO1Bt0yZE71uxl5
 UJCfyplxHJb+X5WNayJ99d5BKOZ/IAOcDTod0v55SAqTkmQi2L5OI6F3r8/rr5M18WW6
 2Lfg==
X-Gm-Message-State: ACrzQf2rbLx3T5apcRNVwFez+0KuXv1tmuOAMcgWetLFIM//l4gSS/lx
 1QvFZHWsShrc8C307iJpxCU=
X-Google-Smtp-Source: AMsMyM5b/KUNqhUaeLqKtRLGlpqJqLgvv/2loCxJAOtMeocrpkjnKhRrArpbhHBtF4iVk/uanmYHtw==
X-Received: by 2002:a05:6512:108e:b0:49f:54bd:bf59 with SMTP id
 j14-20020a056512108e00b0049f54bdbf59mr3039045lfg.502.1664536273331; 
 Fri, 30 Sep 2022 04:11:13 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05651222cc00b0049472efaf7asm257523lfu.244.2022.09.30.04.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 04:11:12 -0700 (PDT)
Date: Fri, 30 Sep 2022 13:11:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH 2/4] drm/tegra: dsi: Clear enable register if powered by
 bootloader
Message-ID: <YzbOzoGDtY2kI2Dv@orome>
References: <20220929170502.1034040-1-diogo.ivo@tecnico.ulisboa.pt>
 <20220929170502.1034040-3-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6mCUNG/5PtLGjds5"
Content-Disposition: inline
In-Reply-To: <20220929170502.1034040-3-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
Cc: devicetree@vger.kernel.org, arnd@arndb.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, jonathanh@nvidia.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6mCUNG/5PtLGjds5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 06:05:00PM +0100, Diogo Ivo wrote:
> In cases where the DSI module is left on by the bootloader
> some panels may fail to initialize if the enable register is not cleared
> before the panel's initialization sequence. Clear it and add an optional
> device tree property to inform the driver if this is the case.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index de1333dc0d86..f66514379913 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -78,6 +78,8 @@ struct tegra_dsi {
>  	unsigned int video_fifo_depth;
>  	unsigned int host_fifo_depth;
> =20
> +	bool enabled;

There should be no need to track this. DRM/KMS internally already knows,
so we should make use of the built-in mechanisms as much as possible.

> +
>  	/* for ganged-mode support */
>  	struct tegra_dsi *master;
>  	struct tegra_dsi *slave;
> @@ -460,6 +462,8 @@ static void tegra_dsi_enable(struct tegra_dsi *dsi)
>  	value |=3D DSI_POWER_CONTROL_ENABLE;
>  	tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> =20
> +	dsi->enabled =3D true;
> +
>  	if (dsi->slave)
>  		tegra_dsi_enable(dsi->slave);
>  }
> @@ -737,6 +741,8 @@ static void tegra_dsi_disable(struct tegra_dsi *dsi)
>  	value &=3D ~DSI_POWER_CONTROL_ENABLE;
>  	tegra_dsi_writel(dsi, value, DSI_POWER_CONTROL);
> =20
> +	dsi->enabled =3D false;
> +
>  	if (dsi->slave)
>  		tegra_dsi_disable(dsi->slave);
> =20
> @@ -912,6 +918,27 @@ static void tegra_dsi_encoder_enable(struct drm_enco=
der *encoder)
>  	u32 value;
>  	int err;
> =20
> +	/* If the bootloader enabled DSI it needs to be disabled
> +	 * in order for the panel initialization commands to be
> +	 * properly sent.
> +	 */
> +	if (dsi->enabled) {
> +		if (dc) {
> +			value =3D tegra_dc_readl(dc, DC_DISP_DISP_WIN_OPTIONS);
> +			value &=3D ~DSI_ENABLE;
> +			tegra_dc_writel(dc, value, DC_DISP_DISP_WIN_OPTIONS);
> +
> +			tegra_dc_commit(dc);
> +		}
> +
> +		err =3D tegra_dsi_wait_idle(dsi, 100);
> +		if (err < 0)
> +			dev_dbg(dsi->dev, "failed to idle DSI: %d\n", err);
> +
> +		/* disable DSI controller */
> +		tegra_dsi_disable(dsi);
> +	}

This is suboptimal because it is largely a duplication of what we
already have in tegra_dsi_disable(). Also, see below.

> +
>  	err =3D tegra_dsi_prepare(dsi);
>  	if (err < 0) {
>  		dev_err(dsi->dev, "failed to prepare: %d\n", err);
> @@ -1573,6 +1600,8 @@ static int tegra_dsi_probe(struct platform_device *=
pdev)
> =20
>  	dsi->output.connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> =20
> +	/* Check if the DSI module was left on by bootloader. */
> +	dsi->enabled =3D of_property_read_bool(pdev->dev.of_node, "nvidia,boot-=
on");

The isn't a documented property. But before you go and add this, are
there no alternative ways to detect that the DSI controller is active?
Could we not read one of the registers to find out?

DRM/KMS has built-in mechanisms to read back hardware state on boot, so
I wonder if we can hook that up. It'd make the most sense if all sub-
drivers did this, because then we could eventually inherit the
bootloader configuration and transition to the kernel display driver
seamlessly, but doing this in DSI first may help prepare for that more
extended use-case.

A slightly simpler alternative would be to add the reset code to the
encoder's or connector's ->reset() implementation. This is called at the
right time (i.e. when the mode configuration is first reset), so you can
run the workaround from tegra_dsi_encoder_enable() there. That's better
than having this guarded by the dsi->enabled flag so that it is run only
once.

Thierry

--6mCUNG/5PtLGjds5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM2zssACgkQ3SOs138+
s6EZNxAAqALLWOLtMnYed5uXD2Q/7tKrapDh2oO3/ickYPp4M/JcAgJ9Gck5ROln
IKSB7Z91LYorXfO5Y3FXF+xCBGS0Yg+Ci+MWuzEmP5TJ/mQHMEvFB59KStty61vx
1EoEAFJbIaTrY7yqiVOx7aKHODUUEqSa9ZcrL2vOlFwmY6n0XE78iL+dvFcQ+zgx
fTaphYNALU5TnmUFf3pmOhkshaemCfJCa9S8UQ0QQfPuv7f2417gVz3QEd8cDs9K
aumX0mTK8YqRtV+8wI32cr1Vac9xm73g7M1rdOsaFmrmqEh1jk4HjTJNf7v6njZ4
KfCW49dbp/YkfJSO+mPcfwkpmctpBik4braAeW6F1vC44bm0M3PUqd+arxfxfHln
LS8wwZsvVi2RVAtUEzoICodtrUW4+bJlYgi9cEo94QOMtafKFixjEiwxMoZA/el7
WGIi+fLzidZXU/20fUPAEDeZBrPqG4n99BN/GrGlQrEo0VkZ4nvS8zPmKI5XWHGD
+gB0CX/nu+m3Cwgh9pY34epELn0EUYxlw/QkmR80CHCJ6/lvkAhummNzYClBifb2
OO2nArj6XwhGhiTHJj6A6m0Vy1zN97pdCyrhaYmzyMSGOScph67Pn91lSYadHT9u
lvKlT0WRw2svipEkaeAiKGQ4RqvOZx9PmVsH3OgqAPmsS2YRcS4=
=tCCo
-----END PGP SIGNATURE-----

--6mCUNG/5PtLGjds5--
