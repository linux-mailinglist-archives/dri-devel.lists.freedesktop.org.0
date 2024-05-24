Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B733B8CE3A0
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF0D10E1E8;
	Fri, 24 May 2024 09:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P2X4DTms";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE7B10E1E8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:38:59 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5295a66e775so751633e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716543538; x=1717148338; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1UiVMlQXjply1VngH6o2XoUEZglHfPuzLqUP2/PP/7Y=;
 b=P2X4DTmspqHxD6/nGouCgwSjJLemF/sQ4aNiIMklLGuidy6bdfdLud0ZcdriSW4gkQ
 cPZdclvns1MDWQLMSynuaYTucxkXsTmV8HhPm0g1oFn10VOmRV3cXeKjhEznYr18FtvA
 PkNJWAt3RsfBKQgQI6hzC68pbAdhPoDy2Myl3VXjH/LrTGY+J5Rd8t5ArsNvy5TXpCle
 kW+/+cLVzI4IHrMkJNcchMsef4ZHwczLMdl982+N1PUuO/OnkM+iD00k5iSfi4ORasyU
 cgYyevhe/FZpA5ztHoY7bAtg1aaKR6VaSvziZW6sfBKCpWQEdnk1FIUFT2ZNPVqz/kb9
 xGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716543538; x=1717148338;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1UiVMlQXjply1VngH6o2XoUEZglHfPuzLqUP2/PP/7Y=;
 b=jKbsv+BbARNfsur8hutmlWx/Rc4HkH7DAgVWAom6KzpKNLniIECAatp+6FjYWaqd0P
 PMDnGJ86JVu8CCVZKeCIyhz4XThFIujtXPmjicmJiKGUTQ5rVBoff9QIaZfZfRQYDLLw
 Infrcd9DdxXAsPT2sokx2eGhRrFtbY9iEDF5q1d02F2nNcJii374y81nqA1F1wFA4V/K
 6diJslh/mgPzHyVlJapFHC7Y2NnbVV9S6Ihyt1Ag4H/S5+Td/8jC12I0+OV+LTr7T43S
 BB564RrW46UYCCMN41MfzDNf2E9L500/JGb8D5IW8tcormnSDlNxMq/nmuc71kdTpY85
 TK8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj8gq9c7+UAg5nGncYn0DfmTSyUXTUppQrbST+L+yqzkUuyjvIlXGQ9WnlTA0N28+x7UE9e2KpUmXkrcU3mbUgSMVdxCmZrsBJ3YqPIqXJ
X-Gm-Message-State: AOJu0YyrmT369izQrbbdlQ92gxnvmgvxzPPmRIol3iME9uERYAMah29E
 A673DnVDGxEOvX64M0y5pGFjdUrK52zFzvWjZpfGdqyHTv2kJvUa6f/6BPW5WDA=
X-Google-Smtp-Source: AGHT+IE4TTyrwkC+wTvXlOzD5CzFSyyWoJsL8cfv3TMk9wFDEcVkoiyKpWFB6joTttF+9lXtGcsMjg==
X-Received: by 2002:a05:6512:2fa:b0:51c:d05b:6b8d with SMTP id
 2adb3069b0e04-5296547ae1dmr1416752e87.23.1716543537852; 
 Fri, 24 May 2024 02:38:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529713e8c7bsm137617e87.284.2024.05.24.02.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 02:38:57 -0700 (PDT)
Date: Fri, 24 May 2024 12:38:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, a-bhatia1@ti.com
Subject: Re: [PATCH v2 1/2] drm/bridge: sii902x: Fix mode_valid hook
Message-ID: <gcfssxqggszg4tc6o5jx7swtpw3fwdaynnqvndrhleaap4jrld@cp2pjxwf3gqn>
References: <20240524073305.107293-1-j-choudhary@ti.com>
 <20240524073305.107293-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524073305.107293-2-j-choudhary@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 24, 2024 at 01:03:04PM +0530, Jayesh Choudhary wrote:
> Currently, mode_valid hook returns all mode as valid and it is
> defined only in drm_connector_helper_funcs. With the introduction of
> 'DRM_BRIDGE_ATTACH_NO_CONNECTOR', connector is not initialized in
> bridge_attach call for cases when the encoder has this flag enabled.
> So add the mode_valid hook in drm_bridge_funcs as well with proper
> clock checks for maximum and minimum pixel clock supported by the
> bridge.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 38 ++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 2fbeda9025bf..ef7c3ab3386c 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -163,6 +163,14 @@
>  
>  #define SII902X_AUDIO_PORT_INDEX		3
>  
> +/*
> + * The maximum resolution supported by the HDMI bridge is 1080p@60Hz
> + * and 1920x1200 requiring a pixel clock of 165MHz and the minimum
> + * resolution supported is 480p@60Hz requiring a pixel clock of 25MHz
> + */
> +#define SII902X_MIN_PIXEL_CLOCK_KHZ		25000
> +#define SII902X_MAX_PIXEL_CLOCK_KHZ		165000
> +
>  struct sii902x {
>  	struct i2c_client *i2c;
>  	struct regmap *regmap;
> @@ -310,12 +318,26 @@ static int sii902x_get_modes(struct drm_connector *connector)
>  	return num;
>  }
>  
> +static enum
> +drm_mode_status sii902x_validate(struct sii902x *sii902x,
> +				 const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>  static enum drm_mode_status sii902x_mode_valid(struct drm_connector *connector,
>  					       struct drm_display_mode *mode)
>  {
> -	/* TODO: check mode */
> +	struct sii902x *sii902x = connector_to_sii902x(connector);
> +	const struct drm_display_mode *mod = mode;
>  
> -	return MODE_OK;
> +	return sii902x_validate(sii902x, mod);

If you have a mode_valid for the bridge, I don't think you need to
perform the same check for the connector.

>  }
>  
>  static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs = {
> @@ -499,11 +521,22 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
>  	 * There might be flags negotiation supported in future but
>  	 * set the bus flags in atomic_check statically for now.
>  	 */
> +
>  	bridge_state->input_bus_cfg.flags = bridge->timings->input_bus_flags;
>  
>  	return 0;
>  }
>  
> +static enum drm_mode_status
> +sii902x_bridge_mode_valid(struct drm_bridge *bridge,
> +			  const struct drm_display_info *info,
> +			  const struct drm_display_mode *mode)
> +{
> +	struct sii902x *sii902x = bridge_to_sii902x(bridge);
> +
> +	return sii902x_validate(sii902x, mode);
> +}
> +
>  static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.attach = sii902x_bridge_attach,
>  	.mode_set = sii902x_bridge_mode_set,
> @@ -516,6 +549,7 @@ static const struct drm_bridge_funcs sii902x_bridge_funcs = {
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_get_input_bus_fmts = sii902x_bridge_atomic_get_input_bus_fmts,
>  	.atomic_check = sii902x_bridge_atomic_check,
> +	.mode_valid = sii902x_bridge_mode_valid,
>  };
>  
>  static int sii902x_mute(struct sii902x *sii902x, bool mute)
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry
