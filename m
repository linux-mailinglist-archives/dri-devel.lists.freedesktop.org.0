Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 829DF5A676E
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 17:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33DA710E126;
	Tue, 30 Aug 2022 15:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA9E310E023;
 Tue, 30 Aug 2022 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chx2UAus42BcKyfWBEZ/KdJ6l4ZWVBX1c4YKz57t5sI=; b=C8McFUMfxUhfpKRvR6kJvzOpMZ
 8yLOIXMLIqNfnGWFBbE92rzzTd5e1ESOFqcnvFhiS7F/4NUZn9qjCDQ8sVfHQVnZjyqFZpcQw+TFC
 jT2HnEvO+BGxZlplv05frOEfqlQfoBE5HptP7jvMT7sq/tIho10lSU9kappKME27i3Ak7VWfgU8uM
 KU+kFffgYbB9DLj7jqyu88BlMtY269uy6+0LzfMuHALVNzuou6ToiDFTnWx8fLhvYn3rUfpoyTdcL
 VMwm7mckAbRQi/UUmmp9ciR7ZMD5jzvDyisqmfpsXBoO264JGj8s29mpgEBJ35ue5ZB1g9HlQbqz4
 rMVh+B8A==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=57781)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oT3Bf-0001l4-JF; Tue, 30 Aug 2022 17:29:59 +0200
Message-ID: <f18770de-a206-99c2-fde2-a793209833e6@tronnes.org>
Date: Tue, 30 Aug 2022 17:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 26/41] drm/vc4: vec: Refactor VEC TV mode setting
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
 <20220728-rpi-analog-tv-properties-v2-26-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-26-459522d653a7@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
> From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> 
> 
> Change the mode_set function pointer logic to declarative config0,
> 
> config1 and custom_freq fields, to make TV mode setting logic more
> 
> concise and uniform.
> 
> 
> 
> Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> 
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> 
> index 72eee0cbb615..9a37c3fcc295 100644
> 
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> 
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> 
> @@ -194,7 +194,9 @@ enum vc4_vec_tv_mode_id {
> 
>  
> 
>  struct vc4_vec_tv_mode {
> 
>  	const struct drm_display_mode *mode;
> 
> -	void (*mode_set)(struct vc4_vec *vec);
> 
> +	u32 config0;
> 
> +	u32 config1;
> 
> +	u32 custom_freq;
> 
>  };
> 
>  
> 
>  static const struct debugfs_reg32 vec_regs[] = {
> 
> @@ -224,34 +226,6 @@ static const struct debugfs_reg32 vec_regs[] = {
> 
>  	VC4_REG32(VEC_DAC_MISC),
> 
>  };
> 
>  
> 
> -static void vc4_vec_ntsc_mode_set(struct vc4_vec *vec)
> 
> -{
> 
> -	struct drm_device *drm = vec->connector.dev;
> 
> -	int idx;
> 
> -
> 
> -	if (!drm_dev_enter(drm, &idx))
> 
> -		return;
> 
> -
> 
> -	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN);
> 
> -	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
> 
> -
> 
> -	drm_dev_exit(idx);
> 
> -}
> 
> -
> 
> -static void vc4_vec_ntsc_j_mode_set(struct vc4_vec *vec)
> 
> -{
> 
> -	struct drm_device *drm = vec->connector.dev;
> 
> -	int idx;
> 
> -
> 
> -	if (!drm_dev_enter(drm, &idx))
> 
> -		return;
> 
> -
> 
> -	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_NTSC_STD);
> 
> -	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
> 
> -
> 
> -	drm_dev_exit(idx);
> 
> -}
> 
> -
> 
>  static const struct drm_display_mode ntsc_mode = {
> 
>  	DRM_MODE("720x480", DRM_MODE_TYPE_DRIVER, 13500,
> 
>  		 720, 720 + 14, 720 + 14 + 64, 720 + 14 + 64 + 60, 0,
> 
> @@ -259,37 +233,6 @@ static const struct drm_display_mode ntsc_mode = {
> 
>  		 DRM_MODE_FLAG_INTERLACE)
> 
>  };
> 
>  
> 
> -static void vc4_vec_pal_mode_set(struct vc4_vec *vec)
> 
> -{
> 
> -	struct drm_device *drm = vec->connector.dev;
> 
> -	int idx;
> 
> -
> 
> -	if (!drm_dev_enter(drm, &idx))
> 
> -		return;
> 
> -
> 
> -	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);
> 
> -	VEC_WRITE(VEC_CONFIG1, VEC_CONFIG1_C_CVBS_CVBS);
> 
> -
> 
> -	drm_dev_exit(idx);
> 
> -}
> 
> -
> 
> -static void vc4_vec_pal_m_mode_set(struct vc4_vec *vec)
> 
> -{
> 
> -	struct drm_device *drm = vec->connector.dev;
> 
> -	int idx;
> 
> -
> 
> -	if (!drm_dev_enter(drm, &idx))
> 
> -		return;
> 
> -
> 
> -	VEC_WRITE(VEC_CONFIG0, VEC_CONFIG0_PAL_BDGHI_STD);
> 
> -	VEC_WRITE(VEC_CONFIG1,
> 
> -		  VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ);
> 
> -	VEC_WRITE(VEC_FREQ3_2, 0x223b);
> 
> -	VEC_WRITE(VEC_FREQ1_0, 0x61d1);
> 
> -
> 
> -	drm_dev_exit(idx);
> 
> -}
> 
> -
> 
>  static const struct drm_display_mode pal_mode = {
> 
>  	DRM_MODE("720x576", DRM_MODE_TYPE_DRIVER, 13500,
> 
>  		 720, 720 + 20, 720 + 20 + 64, 720 + 20 + 64 + 60, 0,
> 
> @@ -300,19 +243,24 @@ static const struct drm_display_mode pal_mode = {
> 
>  static const struct vc4_vec_tv_mode vc4_vec_tv_modes[] = {
> 
>  	[VC4_VEC_TV_MODE_NTSC] = {
> 
>  		.mode = &ntsc_mode,
> 
> -		.mode_set = vc4_vec_ntsc_mode_set,
> 
> +		.config0 = VEC_CONFIG0_NTSC_STD | VEC_CONFIG0_PDEN,
> 
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  	[VC4_VEC_TV_MODE_NTSC_J] = {
> 
>  		.mode = &ntsc_mode,
> 
> -		.mode_set = vc4_vec_ntsc_j_mode_set,
> 
> +		.config0 = VEC_CONFIG0_NTSC_STD,
> 
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  	[VC4_VEC_TV_MODE_PAL] = {
> 
>  		.mode = &pal_mode,
> 
> -		.mode_set = vc4_vec_pal_mode_set,
> 
> +		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
> 
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS,
> 
>  	},
> 
>  	[VC4_VEC_TV_MODE_PAL_M] = {
> 
>  		.mode = &pal_mode,
> 
> -		.mode_set = vc4_vec_pal_m_mode_set,
> 
> +		.config0 = VEC_CONFIG0_PAL_BDGHI_STD,
> 
> +		.config1 = VEC_CONFIG1_C_CVBS_CVBS | VEC_CONFIG1_CUSTOM_FREQ,
> 
> +		.custom_freq = 0x223b61d1,
> 
>  	},
> 
>  };
> 
>  
> 
> @@ -470,7 +418,16 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
> 
>  	/* Mask all interrupts. */
> 
>  	VEC_WRITE(VEC_MASK0, 0);
> 
>  
> 
> -	vec->tv_mode->mode_set(vec);
> 
> +	VEC_WRITE(VEC_CONFIG0, vec->tv_mode->config0);
> 
> +	VEC_WRITE(VEC_CONFIG1, vec->tv_mode->config1);
> 
> +
> 
> +	if (vec->tv_mode->custom_freq != 0) {

Nit: '!= 0' is not necessary and not common either in kernel code.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

> 
> +		VEC_WRITE(VEC_FREQ3_2,
> 
> +			  (vec->tv_mode->custom_freq >> 16) &
> 
> +			  0xffff);
> 
> +		VEC_WRITE(VEC_FREQ1_0,
> 
> +			  vec->tv_mode->custom_freq & 0xffff);
> 
> +	}
> 
>  
> 
>  	VEC_WRITE(VEC_DAC_MISC,
> 
>  		  VEC_DAC_MISC_VID_ACT | VEC_DAC_MISC_DAC_RST_N);
> 
> 
> 
