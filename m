Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4A96CCAAF
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 21:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E36C10E0FE;
	Tue, 28 Mar 2023 19:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CB310E0FE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 19:36:09 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4PmKft0KQbz9sbg;
 Tue, 28 Mar 2023 21:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1680032166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UctDcSLnkPivkt/lZEarG/yH4/UnvtCzaIKp7oU4z5Q=;
 b=oxD0cpNIO7C5J5hVIgVd6Iyoq+y/5F561v/J+JXWEEPjL3r9fSzW0ylGbbfgo+IfTY8lfs
 js7zuhBtZ8Zv+WDFXGwe5gWv9HHt91x7yE2ZhX+semyXoenaCOppvTdmrH630d4A+qZef0
 eOyhPiASVPpLRu+aH+zlbV7k4bNPNoHYysMv3Mu+Od6PbTXxfG7uYyx0t49uluri/ZBl5x
 mbZpJb3td4X2cIq2ErlUAwJEOItYB6N6Yr/6X1JyFCCTWwhgMF9MiWapEdz+mMfIj/qvxL
 Y3oN80duQKuPxnJpjcQqedONgt6SIl/eZPnumD1bnR15ucrC9kteN29tvWKgvQ==
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev> <20230327202045.ceeqqwjug4ktxtsf@penduick>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Date: Tue, 28 Mar 2023 21:28:19 +0200
In-reply-to: <20230327202045.ceeqqwjug4ktxtsf@penduick>
Message-ID: <87bkkc3bzc.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4PmKft0KQbz9sbg
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Roman Beranek <romanberanek@icloud.com>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 2023-03-27 at 22:20:45 +0200, Maxime Ripard <maxime@cerno.tech> wrote:
> Hi,
>
> On Sat, Mar 25, 2023 at 12:40:04PM +0100, Frank Oltmanns wrote:
[...]
>> Actually, I had the following third patch prepared that adjusted the dot=
clock rate so that the
>> required PLL rate is set. But again, this seems very indirect, so that=
=E2=80=99s why I refrained from
>> submitting it and I submitted the linked patch above instead.
>>
>> Anyway, here is the third proposal:
>>
>> =E2=80=94 a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> @@ -819,6 +819,34 @@ static void sun6i_dsi_encoder_disable(struct drm_en=
coder *encoder)
>>  	regulator_disable(dsi->regulator);
>>  }
>>
>> +static bool sun6i_dsi_encoder_mode_fixup(
>> =E2=81=83 struct drm_encoder *encoder,
>> =E2=81=83 const struct drm_display_mode *mode,
>> =E2=81=83 struct drm_display_mode *adjusted_mode)
>> +{
>> =E2=81=83 if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DSI) {
>> =E2=81=83 /*
>> =E2=81=83 * For DSI the PLL rate has to respect the bits per pixel and
>> =E2=81=83 * number of lanes.
>> =E2=81=83 *
>> =E2=81=83 * According to the BSP code:
>> =E2=81=83 * PLL rate =3D DOTCLOCK * bpp / lanes
>> =E2=81=83 *
>> =E2=81=83 * Therefore, the clock has to be adjusted in order to set the
>> =E2=81=83 * correct PLL rate when actually setting the clock.
>> =E2=81=83 */
>> =E2=81=83 struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
>> =E2=81=83 struct mipi_dsi_device *device =3D dsi->device;
>> =E2=81=83 u8 bpp =3D mipi_dsi_pixel_format_to_bpp(device->format);
>> =E2=81=83 u8 lanes =3D device->lanes;
>> =E2=81=83
>>
>> =E2=81=83 adjusted_mode->crtc_clock =3D mode->crtc_clock
>> =E2=81=83 * bpp / (lanes * SUN6I_DSI_TCON_DIV);
>> =E2=81=83 }
>> =E2=81=83
>>
>> =E2=81=83 return true;
>> +}
>> =E2=81=83 static int sun6i_dsi_get_modes(struct drm_connector *connector)
>>   {
>>       struct sun6i_dsi *dsi =3D connector_to_sun6i_dsi(connector);
>> @@ -851,6 +879,7 @@ static const struct drm_connector_funcs sun6i_dsi_co=
nnector_funcs =3D {
>>  static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs=
 =3D {
>>  	.disable	=3D sun6i_dsi_encoder_disable,
>>  	.enable		=3D sun6i_dsi_encoder_enable,
>> =E2=81=83 .mode_fixup =3D sun6i_dsi_encoder_mode_fixup,
>>   };
>
> It's not clear to me what this patch is supposed to be doing, there's no =
mode_fixup implementation
> upstream?
>

Sorry, my mail client tried some fancy formatting. :(

This is the patch again.

--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -819,6 +819,34 @@ static void sun6i_dsi_encoder_disable(struct drm_encod=
er *encoder)
 	regulator_disable(dsi->regulator);
 }

+static bool sun6i_dsi_encoder_mode_fixup(
+				   struct drm_encoder *encoder,
+				   const struct drm_display_mode *mode,
+				   struct drm_display_mode *adjusted_mode)
+{
+	if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DSI) {
+		/*
+		 * For DSI the PLL rate has to respect the bits per pixel and
+		 * number of lanes.
+		 *
+		 * According to the BSP code:
+		 * PLL rate =3D DOTCLOCK * bpp / lanes
+		 *
+		 * Therefore, the clock has to be adjusted in order to set the
+		 * correct PLL rate when actually setting the clock.
+		 */
+		struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
+		struct mipi_dsi_device *device =3D dsi->device;
+		u8 bpp =3D mipi_dsi_pixel_format_to_bpp(device->format);
+		u8 lanes =3D device->lanes;
+
+		adjusted_mode->crtc_clock =3D mode->crtc_clock
+				 * bpp / (lanes * SUN6I_DSI_TCON_DIV);
+	}
+
+	return true;
+}
+
 static int sun6i_dsi_get_modes(struct drm_connector *connector)
 {
 	struct sun6i_dsi *dsi =3D connector_to_sun6i_dsi(connector);
@@ -851,6 +879,7 @@ static const struct drm_connector_funcs sun6i_dsi_conne=
ctor_funcs =3D {
 static const struct drm_encoder_helper_funcs sun6i_dsi_enc_helper_funcs =
=3D {
 	.disable	=3D sun6i_dsi_encoder_disable,
 	.enable		=3D sun6i_dsi_encoder_enable,
+	.mode_fixup	=3D sun6i_dsi_encoder_mode_fixup,
 };

 static u32 sun6i_dsi_dcs_build_pkt_hdr(struct sun6i_dsi *dsi,


I still like the original patch better, but I'd be happy to submit this
as a proper patch, if this is more to your liking.

Thanks,
  Frank


> Maxime
>
--
