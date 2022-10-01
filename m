Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6415F1C2F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 14:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D57510E54C;
	Sat,  1 Oct 2022 12:38:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FBC10E2C2;
 Sat,  1 Oct 2022 12:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6NLjqlmPvPzsTA6vBPevXpCXhWVbqtndMWvi9+f1bGI=; b=jhtbUCYzLQSly2Ci/UfjnGhszW
 LuUWNd9yhuchnKssqz1rB56YFTNwc0ZVdSNpo3/U5U5zSIrD0mfTxnNKHzij/Scea9YjsSL5RmiJ6
 H/4F1B8zOfFv0BTvfZj/CUCp4ryGk25X/lHf/WZBglOcR7FB7ENvinvlwD5kQwYdhCLNXkngxHxe8
 SlCYH3cg1OR9tK6CdLQMJS768k2cxhykDj7HGfQ2MGAGIT9GERvUUB6877copsJ0Zh9+urHznyhNi
 UK8OTkzzM9M8eKPor3bJ0ECuUdbJHOkIEPTWKq3oKJNmlj1dszewPzuxHaRI2JrMHXuuMZvky+fbb
 NC2RFcXA==;
Received: from [2a01:799:961:d200:138:ce02:d9d4:d972] (port=58514)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oebkd-00044m-E3; Sat, 01 Oct 2022 14:37:51 +0200
Message-ID: <415275a6-7b3c-0550-6ed4-01245f385331@tronnes.org>
Date: Sat, 1 Oct 2022 14:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v4 30/30] drm/sun4i: tv: Convert to the new TV mode
 property
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Karol Herbst <kherbst@redhat.com>, Samuel Holland <samuel@sholland.org>,
 Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emma Anholt <emma@anholt.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v4-0-60d38873f782@cerno.tech>
 <20220728-rpi-analog-tv-properties-v4-30-60d38873f782@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v4-30-60d38873f782@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.09.2022 18.31, skrev Maxime Ripard:
> Now that the core can deal fine with analog TV modes, let's convert the
> sun4i TV driver to leverage those new features.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tv.c | 148 ++++++++++++++-------------------------
>  drivers/gpu/drm/vc4/vc4_vec.c    |   5 +-
>  2 files changed, 54 insertions(+), 99 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c b/drivers/gpu/drm/sun4i/sun4i_tv.c

> @@ -467,35 +398,46 @@ static const struct drm_encoder_helper_funcs sun4i_tv_helper_funcs = {
>  
>  static int sun4i_tv_comp_get_modes(struct drm_connector *connector)
>  {
> -	int i;
> +	struct drm_display_mode *mode;
> +	int count = 0;
>  
> -	for (i = 0; i < ARRAY_SIZE(tv_modes); i++) {
> -		struct drm_display_mode *mode;
> -		const struct tv_mode *tv_mode = &tv_modes[i];
> -
> -		mode = drm_mode_create(connector->dev);
> -		if (!mode) {
> -			DRM_ERROR("Failed to create a new display mode\n");
> -			return 0;
> -		}
> +	mode = drm_mode_analog_ntsc_480i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
> +	}
>  
> -		strcpy(mode->name, tv_mode->name);
> +	mode->type |= DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_probed_add(connector, mode);
> +	count += 1;
>  
> -		sun4i_tv_mode_to_drm_mode(tv_mode, mode);
> -		drm_mode_probed_add(connector, mode);
> +	mode = drm_mode_analog_pal_576i(connector->dev);
> +	if (!mode) {
> +		DRM_ERROR("Failed to create a new display mode\n");
> +		return -ENOMEM;
>  	}
>  
> -	return i;
> +	drm_mode_probed_add(connector, mode);
> +	count += 1;
> +
> +	return count;

count is always 2 so you can just return 2.

Acked-by: Noralf Trønnes <noralf@tronnes.org>

>  }

This stray hunk belongs to the vc4 TV mode patch I guess:

> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 8d37d7ba9b2a..88b4330bfa39 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -322,7 +322,7 @@ vc4_vec_tv_mode_lookup(unsigned int mode)
>  	return NULL;
>  }
>  
> -static const struct drm_prop_enum_list tv_mode_names[] = {
> +static const struct drm_prop_enum_list legacy_tv_mode_names[] = {
>  	{ VC4_VEC_TV_MODE_NTSC, "NTSC", },
>  	{ VC4_VEC_TV_MODE_NTSC_443, "NTSC-443", },
>  	{ VC4_VEC_TV_MODE_NTSC_J, "NTSC-J", },
> @@ -498,7 +498,8 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
>  				   DRM_MODE_TV_MODE_NTSC);
>  
>  	prop = drm_property_create_enum(dev, 0, "mode",
> -					tv_mode_names, ARRAY_SIZE(tv_mode_names));
> +					legacy_tv_mode_names,
> +					ARRAY_SIZE(legacy_tv_mode_names));
>  	if (!prop)
>  		return -ENOMEM;
>  	vec->legacy_tv_mode_property = prop;
> 

Noralf.
