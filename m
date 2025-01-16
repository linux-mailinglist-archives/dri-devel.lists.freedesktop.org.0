Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D011A1306A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D6110E53B;
	Thu, 16 Jan 2025 01:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z74LWgP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B67610E53B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 01:04:25 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-54287a3ba3cso1408974e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736989464; x=1737594264; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QvA5Q74xpwNEgpSOAlx5Un2CyWiCmELNLOAQOwTtJjU=;
 b=z74LWgP3wHv69V2ld30awls0oS3i56PRhme99ifx0L3ifkQWZ56mnduB0ewEo2w2dx
 wpMD3KmP8NFN+XMhjdhPI8kIrwgzww/QHfKrTw9DhKH/qco1cvn16hqkjDhmCcKRslSk
 IKtz+1ypvCtMV6k+pSTD2W/AnRPwzs1asfw1FGEXWHhDGmytpxGM3B5zf421pnzF1wec
 Zydd6elCl0Y4wDOapmLuhT/kRLx/VLvDxaqiGj211iXIOnPVVbbOtMYYu9/wL/XKZVBg
 IH2G5WUWlAsRaO/YGVB3E61qvN1LzIpA/Mop2J+qSdCRLXi6AY3aYoGx76Sg68d/VnOG
 V/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736989464; x=1737594264;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QvA5Q74xpwNEgpSOAlx5Un2CyWiCmELNLOAQOwTtJjU=;
 b=hOamZa8pDk1iv12QCoaePZgUfHjDXNfjgi2xkhveQYfUEDX3GWbEBScljVdYzx6Wtm
 bztxzumcrKYihhG3lsxL2wf1EY/7TLVr9E6tA9g40F3FhTnQa7iZcZdnpWJJle5cDPIc
 hBJWbc9EeeYiC86xbESELLhc4hQ8RTNrwDoNKeD7nHeGt23MtBcEAM8zIkuuDm6Ohxlo
 /fPhYR4Ysep0C7N40cu/WPiYp/CR0HWwzwt3UlIPLqi3UwNmWvR5mJ1DhIgogaY1WVDh
 FDkWOM2Fw03DlYMNOEgrtVGpKC79pDUzzG1dJqc3oYEypuxVxqUo4cGC17CPH3WlgUWu
 aPIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJYXFD5A17XT6hSMxtLy70Fh/Az53BURkTtx3Gx4k8F4QnewCYZ7mcxZ+oxbEkYfuNz+LFjhpdXss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ7dm4PYM8ZYujf0BisEvQa7RgDObpooY6F0RCOnLdJuUFa1xT
 3Yx2fgo6OINhN58GH8z0yTzvjcVxNqRelIMKWZM+mzCvGe5I7BWusR923A3WLhE=
X-Gm-Gg: ASbGncsW/6C/1iP9mDzjejflYEGCBkWgqMyCDgKAcSbp+TXigPb8RuEB7QaInYf0SY1
 6/NYtHfCqMx0jxOJ9GYEhcTJTinyjnxI/k6qAKrafKPfeEt6VKFd7PlGUe9kjQXaoAL83E6YfH5
 ABy3l0MtF2TRMqO2X/x6LIwSqmD/gSkZ8DhimcpfMjOeCL0w3KmYWHuXzSvMAwxRfdPshn1dJ6+
 +j60xNL5f9Mx0qYq3kibNmKI+HepP0G6WrTCi8sAaAPO4zxnfaI6VPX+FTabfSNyZthKZF2PdMn
 2KMGrnJN5f0SckQgFpvsDtFaD/epgjx6Igjz
X-Google-Smtp-Source: AGHT+IFkxtrNrV629uBfT0xh6BCVF4FnyTSaz4IqgnBCh9BQqDUuN4GDdj46IZp4jMEz00M5Arwy4g==
X-Received: by 2002:a05:6512:2c8a:b0:540:16b3:3699 with SMTP id
 2adb3069b0e04-542abf5d69bmr1812553e87.9.1736989463618; 
 Wed, 15 Jan 2025 17:04:23 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be4a01dsm2139266e87.43.2025.01.15.17.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 17:04:22 -0800 (PST)
Date: Thu, 16 Jan 2025 03:04:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 25/29] drm/bridge: Provide pointers to the connector and
 crtc in bridge state
Message-ID: <eaardp55onpuqxneh4q6a7tmujglp2pu7kubwisoubjbyuqbt3@zttu7txp34xx>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
 <20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115-bridge-connector-v1-25-9a2fecd886a6@kernel.org>
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

On Wed, Jan 15, 2025 at 10:05:32PM +0100, Maxime Ripard wrote:
> Now that connectors are no longer necessarily created by the bridges
> drivers themselves but might be created by drm_bridge_connector, it's
> pretty hard for bridge drivers to retrieve pointers to the connector and
> CRTC they are attached to.
> 
> Indeed, the only way to retrieve the CRTC is to follow the drm_bridge
> encoder field, and then the drm_encoder crtc field, both of them being
> deprecated.
> 
> And for the connector, since we can have multiple connectors attached to
> a CRTC, we don't really have a reliable way to get it.
> 
> Let's provide both pointers in the drm_bridge_state structure so we
> don't have to follow deprecated, non-atomic, pointers, and be more
> consistent with the other KMS entities.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c |  5 +++++
>  drivers/gpu/drm/drm_bridge.c              | 21 +++++++++++++--------
>  include/drm/drm_atomic.h                  | 14 ++++++++++++++
>  3 files changed, 32 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 519228eb109533d2596e899a57b571fa0995824f..66661dca077215b78dffca7bc1712f56d35e3918 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -777,10 +777,15 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_duplicate_state);
>   * that don't subclass the bridge state.
>   */
>  void drm_atomic_helper_bridge_destroy_state(struct drm_bridge *bridge,
>  					    struct drm_bridge_state *state)
>  {
> +	if (state->connector) {
> +		drm_connector_put(state->connector);
> +		state->connector = NULL;
> +	}
> +
>  	kfree(state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
>  
>  /**
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index c937980d6591fd98e33e37d799ebf84e7e6c5529..069c105aa59636c64caffbefcf482133b0db97d9 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -829,19 +829,24 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
>  static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  				   struct drm_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state)
>  {
> +	struct drm_bridge_state *bridge_state;
> +	int ret;
> +
> +	bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> +						       bridge);

It felt like an error to me to call this function for a non-atomic
bridges, until I fully followed the code path to find that it will
return NULL if the bridge isn't registered as a private object.

BTW: if my grep-foo isn't deceiving me, we currently have 34 non-atomic
bridges out of 90. Should we start forcebly updating them to use atomic
interface in attempt to drop the mode_fixup() and other non-atomic
callbacks?

> +	if (WARN_ON(!bridge_state))
> +		return -EINVAL;
> +
> +	bridge_state->crtc = crtc_state->crtc;
> +
> +	drm_connector_get(conn_state->connector);
> +	bridge_state->connector = conn_state->connector;
> +
>  	if (bridge->funcs->atomic_check) {
> -		struct drm_bridge_state *bridge_state;
> -		int ret;
> -
> -		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
> -							       bridge);
> -		if (WARN_ON(!bridge_state))
> -			return -EINVAL;
> -
>  		ret = bridge->funcs->atomic_check(bridge, bridge_state,
>  						  crtc_state, conn_state);
>  		if (ret)
>  			return ret;
>  	} else if (bridge->funcs->mode_fixup) {

-- 
With best wishes
Dmitry
