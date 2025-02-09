Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C8A2DB4A
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 07:18:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297710E054;
	Sun,  9 Feb 2025 06:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GmmbV+I0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095A810E054
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 06:18:16 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-307d1ab59c6so31622111fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Feb 2025 22:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739081894; x=1739686694; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lE2oPH+NznWU+A7rTznQcQge7zD1TQE7PnYcq5zX9eI=;
 b=GmmbV+I0GUmDXVzPNsvvTHpnxAuxSlRPX/AbiqANmzPqkiwt4wbstIUH4ERpKVie7I
 XifqpIXATHeFKF+VkaFjehHrqeAlu9zAHDpjYOZHptoC04qdRxLVYnVdw3FWDxub99Lm
 NRnVB9uUu2Wr9WH+8xLjmpTXTVaHHJwUg/33Cg52wfc6ndfwfUL13BqYIB6cDExmASWy
 aPH17A5nIftx2UO0fOU4SJtd9vsisF4y+9bW9qj54VXn2P1S9s7eZht0hELxwH7ri7qi
 vhxY3+lZ2bE6qlCpacEyISU7xyITKT1EajcMY8mT+v9+4yyNm1mPTTlI2V8S/qsEX6Fo
 b3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739081894; x=1739686694;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE2oPH+NznWU+A7rTznQcQge7zD1TQE7PnYcq5zX9eI=;
 b=dWzBA/AAqCfHn+sxgOZ8ZVkcIbaLJgMgfkMvtDwto1rZvUPiLS08Yo3ntGq6qVPaI8
 JHQhgZU4oYrJAllJq42xqK9JtA6iKTls8ThEDj2+mU/6/cQuObRMO+R14JhADgLOMt+e
 23rE+S64mhUt7vOw7TkjLbTBALRd7iEEE+zndvQjWG1A9K1bX2GVEw0Ud07nRIobX4VX
 3L4uL3eVmVXgE42opYhfwL5iNKBwOciyehr1jk7z6zQJ9l1ESvjQ1FSKXeUVpuHKbHLp
 STKHSiWpgE3IxszbSmWUMaxDiBLvHILYedKhPVami/AMQF0BTRz+1VlB1kbStNZBp/9J
 /FBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Eag8ZVxnJBdi9wxqU0zxC7dveeAYw7cKbWj5IK79Iq1qDHdROO6te9wb+M+OWc5o1L5OZyklSEk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztQFOxbx9QjHBpau93hNkNzJzi7ROP/jrdrarsaCAstVoWfus8
 dFid6kpgmfhfI2RsI1Qcoj4lzX4ZkD0kQQ90mIv4BY1l0YwBgehGNlqS2qm/dXw=
X-Gm-Gg: ASbGnctvFIJ1n9MZFuBmUEKhv8Kt/llz9uVdhXD273TesJ9xdRY0muzfzw4clClaxpO
 +3FtV/+ttw5X0YxJqLEiF1mRrU9iRnU1lDUGh2eB2G24wkapt4cbfbRHObVvne2LXKxacItief6
 nQfUMoQ/sJtj46FKJcM5V9tw4FIry33bdDUJTI8ALQV31jLzG/Ypysv1JHBdFqKfrc4VKF24b40
 gbjUrbJyurN2QxNQbZ19hWOJZqp4zXhJgsdpV9xrkcsGn5pKQ8KzJDSwZrgUxdKTKRl/6ysIiUf
 8CytD/jNok5gEtLnyC39uF7MYiQb8OiT87KNQhVKPJYFcBJjFBedCWk00UkGH+scSChYtt4=
X-Google-Smtp-Source: AGHT+IHgotXqPVdJ6aQX/zwyOsyj2WFgiPHoaaDkjyauV80cVRyVG+Oohw1MRE4f5iPbev+BKf+rdg==
X-Received: by 2002:a05:651c:555:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-307e57cb001mr26580311fa.3.1739081894132; 
 Sat, 08 Feb 2025 22:18:14 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2f511esm8864481fa.104.2025.02.08.22.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 22:18:12 -0800 (PST)
Date: Sun, 9 Feb 2025 08:18:10 +0200
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
Subject: Re: [PATCH v2 29/35] drm/bridge: Assume that a bridge is atomic if
 it has atomic_reset
Message-ID: <stisurekwcm2jmh7qb5rm3nvh4us2oy2c26mhdvqf2nivoa4en@xs5m6rygbxkp>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-29-35dd6c834e08@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-29-35dd6c834e08@kernel.org>
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

On Tue, Feb 04, 2025 at 03:57:57PM +0100, Maxime Ripard wrote:
> A bridge is considered atomic-enabled if it has an atomic_check

I think this part of the explanation is a bit misleading. This code just
checks if there is a need to atomic_check() it.

> implementation. However, atomic_check is optional and thus a driver
> might very well not provide an implementation, and yet still be atomic.

I think the change is correct, but I'd rather suggest implementing
separate drm_bridge_has_atomic_state() helper and using it here and in
two other cases.

> 
> Switch to atomic_reset, which allocates the initial bridge state and is
> thus a better candidate.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_bridge.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index d7c17a26e86fd9a3e5a39f335edff4ffce30dd79..ad91a0ac375a9c8cf82834354ec7f654a59a7292 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -794,23 +794,25 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_enable);
>  
>  static int drm_atomic_bridge_check(struct drm_bridge *bridge,
>  				   struct drm_crtc_state *crtc_state,
>  				   struct drm_connector_state *conn_state)
>  {
> -	if (bridge->funcs->atomic_check) {
> +	if (bridge->funcs->atomic_reset) {
>  		struct drm_bridge_state *bridge_state;
>  		int ret;
>  
>  		bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
>  							       bridge);
>  		if (WARN_ON(!bridge_state))
>  			return -EINVAL;
>  
> -		ret = bridge->funcs->atomic_check(bridge, bridge_state,
> -						  crtc_state, conn_state);
> -		if (ret)
> -			return ret;
> +		if (bridge->funcs->atomic_check) {
> +			ret = bridge->funcs->atomic_check(bridge, bridge_state,
> +							  crtc_state, conn_state);
> +			if (ret)
> +				return ret;
> +		}
>  	} else if (bridge->funcs->mode_fixup) {
>  		if (!bridge->funcs->mode_fixup(bridge, &crtc_state->mode,
>  					       &crtc_state->adjusted_mode))
>  			return -EINVAL;
>  	}
> 
> -- 
> 2.48.0
> 

-- 
With best wishes
Dmitry
