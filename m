Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 041B55A6C53
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 20:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE52D10E35D;
	Tue, 30 Aug 2022 18:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6367C10E35D;
 Tue, 30 Aug 2022 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jpEYN07ng1p1k4JMUOjV6laIOSRv7F+n3Ots9iXgaiI=; b=P5mpqSBO2bmeMCABz1L/7uZ1rK
 KXueoPKIqk3NZ/awAOvafdjGp/1wJnjdkkxFIcDfuVZWVFeyrdvtdinB23o/BX1y3uNPmPrcq+U+4
 4u+p8NTm8pomQcLkfRhAYNp2J2QbywiIoQEEGpfTZOtAxsfvA9baPJwO3xplisnqFXdXZEP5GE5W2
 CKOqzs1/u9hN6RU0gp3IeYL7JIYUvlI7b8vjIhCYipEyxo960qBRd7XTSZmv4vt4eNRPbNKiQErGJ
 HQ3F9UJzCly7+02p26u/sjZ1OvXv/G0w5ZSOvV8CAjO92/jAJ87abobBMUPYEvEJbrShsdJ6NgX+l
 g1ayhYdA==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=62540)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oT66c-0006sf-4N; Tue, 30 Aug 2022 20:36:58 +0200
Message-ID: <24d5ee78-ccd1-1427-691b-152cb734a188@tronnes.org>
Date: Tue, 30 Aug 2022 20:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 29/41] drm/vc4: vec: Switch for common modes
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
 <20220728-rpi-analog-tv-properties-v2-29-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-29-459522d653a7@cerno.tech>
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
> Now that the core has a definition for the 525 and 625 lines analog TV
> 
> modes, let's switch to it for vc4.
> 
> 
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> 
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> 
> index d1d40b69279e..63e4e617e321 100644
> 
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> 
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> 
> @@ -224,38 +224,24 @@ static const struct debugfs_reg32 vec_regs[] = {
> 
>  	VC4_REG32(VEC_DAC_MISC),
> 
>  };
> 
>  
> 
> -static const struct drm_display_mode ntsc_mode = {
> 
> -	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
> 
> -		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
> 
> -		 480, 480 + 7, 480 + 7 + 6, 525, 0,
> 
> -		 DRM_MODE_FLAG_INTERLACE)
> 
> -};
> 
> -
> 
> -static const struct drm_display_mode pal_mode = {
> 
> -	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
> 
> -		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
> 
> -		 576, 576 + 4, 576 + 4 + 6, 625, 0,
> 
> -		 DRM_MODE_FLAG_INTERLACE)
> 
> -};
> 
> -
> 
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
> 
>  	[VC4_VEC_TV_MODE_NTSC] = {
> 
> -		.mode = &ntsc_mode,
> 
> +		.mode = &drm_mode_480i,
> 

I can't find drm_mode_480i anywhere, maybe the compiler doesn't complain
since you remove the reference in a later patch?

Noralf.

>  		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  	[VC4_VEC_TV_MODE_NTSC_J] = {
> 
> -		.mode = &ntsc_mode,
> 
> +		.mode = &drm_mode_480i,
> 
>  		.config0 = VEC_CONFIG0_NTSC_STD,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  	[VC4_VEC_TV_MODE_PAL] = {
> 
> -		.mode = &pal_mode,
> 
> +		.mode = &drm_mode_576i,
> 
>  		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  	[VC4_VEC_TV_MODE_PAL_M] = {
> 
> -		.mode = &pal_mode,
> 
> +		.mode = &drm_mode_576i,
> 
>  		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
> 
>  		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> 
>  		.custom_freq = 0x223b61d1,
> 
> 
> 
