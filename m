Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8FB5A67A3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 17:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879D210E152;
	Tue, 30 Aug 2022 15:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF0210E151;
 Tue, 30 Aug 2022 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Ocmq31Puja4OESZlCsLhCSEzQOMmNoJhX4heKRiwq4=; b=tns5VaTmz03kuJUTzM0RUHOLB4
 +ngDm3NvgS2S0bDwolvt+98eMyESiJrpMoVKNkOMRbz5xHnOiiq+0S8yotNYtN540yDjriQZa+l17
 yhCd5NvwPEJWb3nfx5mYhV8QVFFBdFedj2MV4I6fNxIAq1oPk2o0msMWHU0aa4HD/Um6wC/uAmGmM
 D7+QEUH4yxGGZ4n3ObU7SKMy3tDgS7iP8DsbBimqI+FhGsS2AITUct9vEkRsQ0WbAEqWqqFv+BgkF
 ShctodeiRqxbQO8mPwlbBB6xMNkr/kKKJPRudae4kcUBrVMIHZzJEcywm7y8QiYbMlv0UhUF+nn9/
 eEdWx1yA==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=58133)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oT3Qi-00029u-8W; Tue, 30 Aug 2022 17:45:32 +0200
Message-ID: <daa74061-a11c-dc26-cd41-b64db17fb989@tronnes.org>
Date: Tue, 30 Aug 2022 17:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 27/41] drm/vc4: vec: Remove redundant atomic_mode_set
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
 <20220728-rpi-analog-tv-properties-v2-27-459522d653a7@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v2-27-459522d653a7@cerno.tech>
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
> Let's remove the superfluous tv_mode field, which was redundant with the
> 
> mode field in struct drm_tv_connector_state.
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
> index 9a37c3fcc295..4d7bc7c20704 100644
> 
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> 
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> 
> @@ -171,8 +171,6 @@ struct vc4_vec {
> 
>  
> 
>  	struct clk *clock;
> 
>  
> 
> -	const struct vc4_vec_tv_mode *tv_mode;
> 
> -
> 
>  	struct debugfs_regset32 regset;
> 
>  };
> 
>  
> 
> @@ -316,7 +314,6 @@ static int vc4_vec_connector_init(struct drm_device *dev, struct vc4_vec *vec)
> 
>  	drm_object_attach_property(&connector->base,
> 
>  				   dev->mode_config.legacy_tv_mode_property,
> 
>  				   VC4_VEC_TV_MODE_NTSC);
> 
> -	vec->tv_mode = &vc4_vec_tv_modes[VC4_VEC_TV_MODE_NTSC];
> 
>  
> 
>  	drm_connector_attach_encoder(connector, &vec->encoder.base);
> 
>  
> 
> @@ -360,6 +357,11 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
> 
>  {
> 
>  	struct drm_device *drm = encoder->dev;
> 
>  	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
> 
> +	struct drm_connector *connector = &vec->connector;
> 
> +	struct drm_connector_state *conn_state =
> 
> +		drm_atomic_get_new_connector_state(state, connector);
> 
> +	const struct vc4_vec_tv_mode *tv_mode =
> 
> +		&vc4_vec_tv_modes[conn_state->tv.mode];
> 
>  	int idx, ret;
> 
>  
> 
>  	if (!drm_dev_enter(drm, &idx))
> 
> @@ -418,15 +420,14 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
> 
>  	/* Mask all interrupts. */
> 
>  	VEC_WRITE(VEC_MASK0, 0);
> 
>  
> 
> -	VEC_WRITE(VEC_CONFIG0, vec->tv_mode->config0);
> 
> -	VEC_WRITE(VEC_CONFIG1, vec->tv_mode->config1);
> 
> +	VEC_WRITE(VEC_CONFIG0, tv_mode->config0);
> 
> +	VEC_WRITE(VEC_CONFIG1, tv_mode->config1);
> 
>  
> 
> -	if (vec->tv_mode->custom_freq != 0) {
> 
> +	if (tv_mode->custom_freq != 0) {
> 
>  		VEC_WRITE(VEC_FREQ3_2,
> 
> -			  (vec->tv_mode->custom_freq >> 16) &
> 
> -			  0xffff);
> 
> +			  (tv_mode->custom_freq >> 16) & 0xffff);
> 
>  		VEC_WRITE(VEC_FREQ1_0,
> 
> -			  vec->tv_mode->custom_freq & 0xffff);
> 
> +			  tv_mode->custom_freq & 0xffff);
> 

Nit: This patch will be smaller if you add the tv_mode variable to the
previous patch.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>

>  	}
> 
>  
> 
>  	VEC_WRITE(VEC_DAC_MISC,
> 
> @@ -442,15 +443,6 @@ static void vc4_vec_encoder_enable(struct drm_encoder *encoder,
> 
>  	drm_dev_exit(idx);
> 
>  }
> 
>  
> 
> -static void vc4_vec_encoder_atomic_mode_set(struct drm_encoder *encoder,
> 
> -					struct drm_crtc_state *crtc_state,
> 
> -					struct drm_connector_state *conn_state)
> 
> -{
> 
> -	struct vc4_vec *vec = encoder_to_vc4_vec(encoder);
> 
> -
> 
> -	vec->tv_mode = &vc4_vec_tv_modes[conn_state->tv.mode];
> 
> -}
> 
> -
> 
>  static int vc4_vec_encoder_atomic_check(struct drm_encoder *encoder,
> 
>  					struct drm_crtc_state *crtc_state,
> 
>  					struct drm_connector_state *conn_state)
> 
> @@ -470,7 +462,6 @@ static const struct drm_encoder_helper_funcs vc4_vec_encoder_helper_funcs = {
> 
>  	.atomic_check = vc4_vec_encoder_atomic_check,
> 
>  	.atomic_disable = vc4_vec_encoder_disable,
> 
>  	.atomic_enable = vc4_vec_encoder_enable,
> 
> -	.atomic_mode_set = vc4_vec_encoder_atomic_mode_set,
> 
>  };
> 
>  
> 
>  static int vc4_vec_late_register(struct drm_encoder *encoder)
> 
> 
> 
