Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB905A6CAC
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 21:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430E310E3AE;
	Tue, 30 Aug 2022 19:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759AE10E3AE;
 Tue, 30 Aug 2022 19:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rllac/XBbPbgc0gXaatB94fUM3CKp+p+IW8GoH/lPX8=; b=JVyR6ILGL5tXGtsY/mj8MZRAtl
 ml2JCOZF22V4aySHRZaADzfFTFWNoHLi3MyzwokAbfdOA1uauqNPjjDS4/i3XTzlgKnYBAsw36vYb
 tJF7QCR7MWAL5ErWDQg64sfKTlxTkcSimRhrzhxOb1BuPl8yFrbBaUzqonjjc8ZPezh17iLL2yEhJ
 Q/BU4R8sKuIR2tlMffCI2Ttglr57w7F6U7khQ2sSDlaHmHrR11DOmp+amCXXWeLau14MniH0u3QdF
 n9w/mAKmdSN6E8uJvyURSmrdse6FJTsb3xOLAzDZ6Ojd6qu4E93AxkgPjPUx4yM+DWUmM77foeYQZ
 9vkumwxg==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=63560)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oT6U7-0004Rm-3e; Tue, 30 Aug 2022 21:01:15 +0200
Message-ID: <199cf4b3-8ace-e047-3050-b810cf0c6b63@tronnes.org>
Date: Tue, 30 Aug 2022 21:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 32/41] drm/vc4: vec: Convert to the new TV mode property
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>, Lyude Paul <lyude@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Karol Herbst <kherbst@redhat.com>,
 Emma Anholt <emma@anholt.net>, Daniel Vetter <daniel@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-32-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.08.2022 15.11, skrev Maxime Ripard:
> Now that the core can deal fine with analog TV modes, let's convert the vc4
> 
> VEC driver to leverage those new features.
> 
> 
> 
> We've added some backward compatibility to support the old TV mode property
> 
> and translate it into the new TV norm property.
> 
> 
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> 
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> 
> index ba6f81908923..58286acf4b9e 100644
> 
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> 
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c

> @@ -192,7 +200,7 @@ enum vc4_vec_tv_mode_id {
> 
>  };
> 
>  
> 
>  struct vc4_vec_tv_mode {
> 
> -	const struct drm_display_mode *mode;
> 
> +	unsigned int mode;
> 
>  	u32 config0;
> 
>  	u32 config1;
> 
>  	u32 custom_freq;
> 
> @@ -226,28 +234,50 @@ static const struct debugfs_reg32 vec_regs[] = {
> 
>  };
> 
>  
> 
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
> 
> -	[VC4_VEC_TV_MODE_NTSC] = {
> 
> -		.mode = &drm_mode_480i,
> 
> +	{
> 
> +		.mode = DRM_MODE_TV_MODE_NTSC_M,
> 
>  		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
> -	[VC4_VEC_TV_MODE_NTSC_J] = {
> 
> -		.mode = &drm_mode_480i,
> 
> +	{
> 
> +		.mode = DRM_MODE_TV_MODE_NTSC_J,
> 
>  		.config0 = VEC_CONFIG0_NTSC_STD,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
> -	[VC4_VEC_TV_MODE_PAL] = {
> 
> -		.mode = &drm_mode_576i,
> 
> +	{
> 
> +		.mode = DRM_MODE_TV_MODE_PAL_B,
> 
>  		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
> -	[VC4_VEC_TV_MODE_PAL_M] = {
> 
> -		.mode = &drm_mode_480i,
> 
> +	{
> 
> +		.mode = DRM_MODE_TV_MODE_PAL_M,
> 
>  		.config0 = VEC_CONFIG0_PAL_M_STD,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  };
> 
>  
> 
> +static inline const struct vc4_vec_tv_mode *
> 
> +vc4_vec_tv_mode_lookup(unsigned int mode)
> 
> +{
> 
> +	unsigned int i;
> 
> +
> 
> +	for (i = 0; i < ARRAY_SIZE(vc4_vec_tv_modes); i++) {
> 
> +		const struct vc4_vec_tv_mode *tv_mode = &vc4_vec_tv_modes[i];
> 
> +
> 
> +		if (tv_mode->mode == mode)
> 
> +			return tv_mode;
> 
> +	}
> 
> +
> 
> +	return NULL;
> 
> +}
> 
> +
> 
> +static const struct drm_prop_enum_list tv_mode_names[] = {

Maybe call it legacy_tv_mode_enums?

> 
> +	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
> 
> +	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
> 
> +	{ VC4_VEC_TV_MODE_PAL, "PAL", },
> 
> +	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },

If you use DRM_MODE_TV_MODE_* here you don't need to translate the value
using the switch statement in get/set property, you can use the value
directly to get/set tv.mode.

Noralf.

> 
> +};
