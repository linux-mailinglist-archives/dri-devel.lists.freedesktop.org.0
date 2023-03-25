Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB86C8DDA
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 13:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B433F10E1F2;
	Sat, 25 Mar 2023 12:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666A210E1F2
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Mar 2023 12:09:57 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4PkHvP2qKjz9sW6;
 Sat, 25 Mar 2023 13:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1679746193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QalUgYTR7L02Pm/gpKnsde2aCBCLEQnrH09k5/MdlqE=;
 b=fK8Dw61CyQMFkvLPY0C5GZzBqzfKwKLL9ub62cJXQZpF70SVtceBlF8/sJaEciLa8exyNp
 dzf43/oEBdYAsXWhujvF3E+HE/SMU812X2riTfovbQtzke/6Q9YE9zDfVIgAe2FRRsqBW+
 VYpIsZEJAslBFZzwj9ERjXeKehSwZSTZMCU3EpfLE9j9xuQSOkiz//Si/hG1cGoCJH5wu1
 fM/frIuk6Rntpszv+Zw2XoMyTkHiMWdF17/2wydEtOnfLwJKKsDAen+zgC/nl19AcbZR3G
 qrZn8jks90hm2z9b93b2CDvoJa5CYGqunGPr2HEWsEQu3cqqoCJZXsKgQ9P+qA==
From: Frank Oltmanns <frank@oltmanns.dev>
To: Roman Beranek <romanberanek@icloud.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Date: Sat, 25 Mar 2023 12:40:04 +0100
References: <20230320161636.24411-1-romanberanek@icloud.com>
In-reply-to: <20230320161636.24411-1-romanberanek@icloud.com>
Message-ID: <87wn356ni4.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
X-Rspamd-Queue-Id: 4PkHvP2qKjz9sW6
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On 2023-03-20 at 17:16:36 +0100, Roman Beranek <romanberanek@icloud.com> wr=
ote:
> In the case of DSI output, the value of SUN4I_TCON0_DCLK_DIV (4) does
> not represent the actual dotclock divider, PLL_MIPI instead runs at
> (bpp / lanes )-multiple [1] of the dotclock. [2] Setting 4 as dotclock
> divder thus leads to reduced frame rate, specifically by 1/3 on 4-lane
> panels, and by 2/3 on 2-lane panels respectively.
>
> As sun4i_dotclock driver stores its calculated divider directly in
> the register, conditional handling of the DSI output scenario is needed.
> Instead of reading the divider from SUN4I_TCON0_DCLK_REG, retrieve
> the value from tcon->dclk_min_div.
>
> [1] bits per pixel / number of DSI lanes
> [2] <https://github.com/BPI-SINOVOIP/BPI-M64-bsp-4.4/blob/66bef0f2f30b367=
eb93b1cbad21ce85e0361f7ae/linux-sunxi/drivers/video/fbdev/sunxi/disp2/disp/=
de/lowlevel_sun50iw1/disp_al.c#L322>
>
> Signed-off-by: Roman Beranek <romanberanek@icloud.com>
> =E2=80=94
>  drivers/gpu/drm/sun4i/sun4i_dotclock.c | 6 +++++-
>  drivers/gpu/drm/sun4i/sun4i_tcon.c     | 5 +++=E2=80=93
>  drivers/gpu/drm/sun4i/sun4i_tcon.h     | 1 +
>  3 files changed, 9 insertions(+), 3 deletions(-)
>
> diff =E2=80=93git a/drivers/gpu/drm/sun4i/sun4i_dotclock.c b/drivers/gpu/=
drm/sun4i/sun4i_dotclock.c
> index 417ade3d2565..26fa99aff590 100644
> =E2=80=94 a/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_dotclock.c
> @@ -11,6 +11,7 @@
>
>  #include =E2=80=9Csun4i_tcon.h=E2=80=9D
>  #include =E2=80=9Csun4i_dotclock.h=E2=80=9D
> +#include =E2=80=9Csun6i_mipi_dsi.h=E2=80=9D
>
>  struct sun4i_dclk {
>  	struct clk_hw  hw;
> @@ -56,6 +57,9 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_=
hw *hw,
>  	struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
>  	u32 val;
>
> +	if (dclk->tcon->is_dsi)
> +		return parent_rate / dclk->tcon->dclk_min_div;
> +
>  	regmap_read(dclk->regmap, SUN4I_TCON0_DCLK_REG, &val);
>
>  	val >>=3D SUN4I_TCON0_DCLK_DIV_SHIFT;
> @@ -116,7 +120,7 @@ static int sun4i_dclk_set_rate(struct clk_hw *hw, uns=
igned long rate,
>  			       unsigned long parent_rate)
>  {
>  	struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
> -	u8 div =3D parent_rate / rate;
> +	u8 div =3D dclk->tcon->is_dsi ? SUN6I_DSI_TCON_DIV : parent_rate / rate;
>
>  	return regmap_update_bits(dclk->regmap, SUN4I_TCON0_DCLK_REG,
>  				  GENMASK(6, 0), div);
> diff =E2=80=93git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/=
sun4i/sun4i_tcon.c
> index 523a6d787921..7f5d3c135058 100644
> =E2=80=94 a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -367,8 +367,9 @@ static void sun4i_tcon0_mode_set_cpu(struct sun4i_tco=
n *tcon,
>  	u32 block_space, start_delay;
>  	u32 tcon_div;
>
> -	tcon->dclk_min_div =3D SUN6I_DSI_TCON_DIV;
> -	tcon->dclk_max_div =3D SUN6I_DSI_TCON_DIV;
> +	tcon->is_dsi =3D true;
> +	tcon->dclk_min_div =3D bpp / lanes;
> +	tcon->dclk_max_div =3D bpp / lanes;

Claiming to set the divider to a different value (bpp / lanes) than what we=
=E2=80=99re actually using in the end (SUN6I_DSIO_TCON_DIV) is somehow bugg=
ing me. I feel like the proposal that I submitted is more direct:
<https://lore.kernel.org/all/20230319160704.9858-2-frank@oltmanns.dev/>

Actually, I had the following third patch prepared that adjusted the dotclo=
ck rate so that the required PLL rate is set. But again, this seems very in=
direct, so that=E2=80=99s why I refrained from submitting it and I submitte=
d the linked patch above instead.

Anyway, here is the third proposal:

=E2=80=94 a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -819,6 +819,34 @@ static void sun6i_dsi_encoder_disable(struct drm_encod=
er *encoder)
 	regulator_disable(dsi->regulator);
 }

+static bool sun6i_dsi_encoder_mode_fixup(
=E2=81=83 struct drm_encoder *encoder,
=E2=81=83 const struct drm_display_mode *mode,
=E2=81=83 struct drm_display_mode *adjusted_mode)
+{
=E2=81=83 if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DSI) {
=E2=81=83 /*
=E2=81=83 * For DSI the PLL rate has to respect the bits per pixel and
=E2=81=83 * number of lanes.
=E2=81=83 *
=E2=81=83 * According to the BSP code:
=E2=81=83 * PLL rate =3D DOTCLOCK * bpp / lanes
=E2=81=83 *
=E2=81=83 * Therefore, the clock has to be adjusted in order to set the
=E2=81=83 * correct PLL rate when actually setting the clock.
=E2=81=83 */
=E2=81=83 struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
=E2=81=83 struct mipi_dsi_device *device =3D dsi->device;
=E2=81=83 u8 bpp =3D mipi_dsi_pixel_format_to_bpp(device->format);
=E2=81=83 u8 lanes =3D device->lanes;
=E2=81=83=20

=E2=81=83 adjusted_mode->crtc_clock =3D mode->crtc_clock
=E2=81=83 * bpp / (lanes * SUN6I_DSI_TCON_DIV);
=E2=81=83 }
=E2=81=83=20

=E2=81=83 return true;
+}
=E2=81=83 static int sun6i_dsi_get_modes(struct drm_connector *connector)
  {
      struct sun6i_dsi *dsi =3D connector_to_sun6i_dsi(connector);
@@ -851,6 +879,7 @@ static const struct drm_connector_funcs sun6i_dsi_conne=
ctor_funcs =3D {
 static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs =
=3D {
 	.disable	=3D sun6i_dsi_encoder_disable,
 	.enable		=3D sun6i_dsi_encoder_enable,
=E2=81=83 .mode_fixup =3D sun6i_dsi_encoder_mode_fixup,
  };

  static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,



Maxime, Roman, CC, what do you think? Can we achieve consensus? If I=E2=80=
=99m not mistaken, all of the three proposal are a step in the right direct=
ion, because they correct faulty behavior. Don=E2=80=99t you think?

Thanks,
  Frank

>
>  	sun4i_tcon0_mode_set_common(tcon, mode);
>
> diff =E2=80=93git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/=
sun4i/sun4i_tcon.h
> index fa23aa23fe4a..d8150ba2f319 100644
> =E2=80=94 a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -271,6 +271,7 @@ struct sun4i_tcon {
>  	struct clk			*dclk;
>  	u8				dclk_max_div;
>  	u8				dclk_min_div;
> +	bool				is_dsi;
>
>  	/* Reset control */
>  	struct reset_control  *lcd_rst;

--=-=-=--
