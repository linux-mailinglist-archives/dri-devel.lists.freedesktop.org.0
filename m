Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB56CFA5A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 06:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBC710ECD4;
	Thu, 30 Mar 2023 04:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF1610ECD4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 04:44:39 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Pn9nH5Xj3z9sW9;
 Thu, 30 Mar 2023 06:44:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oltmanns.dev;
 s=MBO0001; t=1680151475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Scw9GnQ38qy4L9yW8NU1qFZ8sCslAjUOVuTv4AxjKs=;
 b=0cAPL4EucscPGnjt8TkvhJ236LPfnYqc+03YuCGy7AVKY/Co+HQiHxKkXiDdC9cyAeUwy3
 bwxhcRl58mVQii9a4u/SsB1IdpulDrkuXjGNUjBxK8/VJSTn6yAQG/17QOdTiNHSSRgEL9
 p8faqcuKdAEofHpSmqGkuIKWqXMiXHqNzx1djrYNVr/LkGhr9Pqgyg53/PIGeeR7Lton+6
 aFZU5ZictHNrzEmIaA5PAsyC7Gj6d717rVZJi4Kpf888qKc7alKuaHWFXFLGXPTh3ZaTN5
 0ppHQn0B4qwyam1y3dDZ9lYbvPF+CwZ2EkkqhGDFHswpJx6G7pKIEqmJ4ILKjg==
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev> <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <87bkkc3bzc.fsf@oltmanns.dev> <20230329195639.iep4rv5rcigu3gj2@penduick>
From: Frank Oltmanns <frank@oltmanns.dev>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Date: Thu, 30 Mar 2023 06:41:44 +0200
In-reply-to: <20230329195639.iep4rv5rcigu3gj2@penduick>
Message-ID: <87bkkaonkr.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4Pn9nH5Xj3z9sW9
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

On 2023-03-29 at 21:56:39 +0200, Maxime Ripard <maxime@cerno.tech> wrote:
> Hi,
>
> On Tue, Mar 28, 2023 at 09:28:19PM +0200, Frank Oltmanns wrote:
>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>> @@ -819,6 +819,34 @@ static void sun6i_dsi_encoder_disable(struct drm_encoder *encoder)
>>  	regulator_disable(dsi->regulator);
>>  }
>>
>> +static bool sun6i_dsi_encoder_mode_fixup(
>> +				   struct drm_encoder *encoder,
>> +				   const struct drm_display_mode *mode,
>> +				   struct drm_display_mode *adjusted_mode)
>
> So, mode_fixup is kind of deprecated in favour of atomic_check

I see. Thanks for pointing that out.

>> +{
>> +	if (encoder->encoder_type == DRM_MODE_ENCODER_DSI) {
>> +		/*
>> +		 * For DSI the PLL rate has to respect the bits per pixel and
>> +		 * number of lanes.
>> +		 *
>> +		 * According to the BSP code:
>> +		 * PLL rate = DOTCLOCK * bpp / lanes
>> +		 *
>> +		 * Therefore, the clock has to be adjusted in order to set the
>> +		 * correct PLL rate when actually setting the clock.
>> +		 */
>> +		struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
>> +		struct mipi_dsi_device *device = dsi->device;
>> +		u8 bpp = mipi_dsi_pixel_format_to_bpp(device->format);
>> +		u8 lanes = device->lanes;
>> +
>> +		adjusted_mode->crtc_clock = mode->crtc_clock
>> +				 * bpp / (lanes * SUN6I_DSI_TCON_DIV);
>
> And that's visible to the userspace, so it's not where we should store
> that value. I guess the best way to do something similar would be to
> store it into crtc_state, and then reuse it there. But it starts to make
> a lot of rather complicated code compared to your previous patch.

Ah, interesting. But I agree, let's stick to the simpler aproach.

Thanks,
  Frank

>
> Maxime
>
> [[End of PGP Signed Part]]

--
