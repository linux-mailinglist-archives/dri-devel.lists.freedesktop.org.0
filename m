Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42479A44919
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B3B10E1D6;
	Tue, 25 Feb 2025 17:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gSrAZoQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C9910E1D6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:56:42 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30613802a6bso61463551fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740506201; x=1741111001; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xVWp9Ja2Rjz3r7Z6XrBcybwSqNljM6TcrY1ydtVaEeA=;
 b=gSrAZoQQlIEMmVZOa3uREWicIWSgSrw2J2wIvNHOfT7k+3+9zVxRuhz3uCsCQ2rHAh
 Hw35zowQB8DGXqlSF9fu/0z7d95eZ5pbIWOcAwiHko74Iqlz5mMQnlnMxIsDK7YFPmpx
 w0BYv9laBv4HZa8c8O7Tbm310agl4W7ToIp80npUdLtzNfwHSEHCEMz3gCpafeEcD2XI
 nCN4r+of5RMj/dty8mYWGhV5/j5ULRI0MWf9h1sA5xhtJzJRANCTUQ2e++6/MW4c/Vuz
 F1p9Xfz0xfCqApYQ6a3TbESohqeUMfzGvma0xgZhgbvXYvaxTqV4CSAlhtZdieXLpgSD
 fAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506201; x=1741111001;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xVWp9Ja2Rjz3r7Z6XrBcybwSqNljM6TcrY1ydtVaEeA=;
 b=CWxFcGj5rMT9/L0OnLHkHs/8HeTuhvM4WTAMRLKRzTQJD4IR0CbQXO7ISK+E77cabC
 UlhApDyuorUPmiImcWZqTtGTpLlXjKkvuDf363JapXBhjAUg2W59a1JN5j/b+Vh3zOCj
 q8vxD2FPLgpjrYxyBevWE0ucLr0xEC6DdTE9bkS7UaMwiTQFKf6M7XWMtoMnTOygsuLG
 CLQbqAe2rb/f3cbqpohhmqI6uQKloZDB/KhHMRPve1/ZniTUY6feZvt655uGaA03yWhD
 /xeJpSrugrvXhjnSxkd/XwwJSDvwqWobjFrIctobEOQZNEkh8yzHkU2NNsjBEq/7oNMw
 Extg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJErf+2cwOJEU9hTHO5BXUrpug2Zo83b3gzJuHxYDI2fp1O6qg1FXg42RW0phhq6+BnGxnbYlpfds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygwxgTydOw48eMKgAxolIQ5JWZNCiWQWo89fc/cQ0cXnr3WJ1y
 CVdK2HDEOuFjywY65QrVtPMsAih0JzS8Krv8mamJRPeDrtZF+TM3nhTs+la2Alk=
X-Gm-Gg: ASbGncvAu6DePxD5ATTYV72M6AkJ6IHQNrVGLCnqsR3nWOKlB3bTwoXiG4kXfgR5HjP
 XasFCbQqEP23EHIhZLq58jmeVBJ5ANkTT5paGpnaaYZBjzBp13X41MNk3+TtEct1WZkKMN64BN9
 sZLqsIKzqihXnOI1rJldMPZiY5L6ZIxMH2DAkCGNH3uKIpbVkQyW3w2RlHmM8/vF3Oo4VxIZmpR
 m4GNmT7kQ/ZAQDQIl2lAn9GlVYP5UfBJtvMnsGOgeG2RN8wTg0HEHnt359fZAuABKhHTQNL6Z5d
 FEqN+kWZBsNg0MZMcZ7IoYuRXLy6qcRtHhVwADNHUDex/m9SlOyPXb3ldi1O9lcfEtoCCpYEu6b
 l9zkJbA==
X-Google-Smtp-Source: AGHT+IHXypG52wXkYLxSSmyf4bbr7jeX4L7AiMB7t5V529YkEH03E02hDurhAMGW0udAqKDM+HrsUg==
X-Received: by 2002:a2e:321a:0:b0:309:bc3:36b4 with SMTP id
 38308e7fff4ca-30a80c0f0c9mr19594681fa.6.1740506200764; 
 Tue, 25 Feb 2025 09:56:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30a819e0a5asm2883591fa.19.2025.02.25.09.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:56:39 -0800 (PST)
Date: Tue, 25 Feb 2025 19:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org, 
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org, 
 konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
Subject: Re: [PATCH 09/11] drm/bridge: anx7625: enable HPD interrupts
Message-ID: <l34eya75nmzh5j6jyw6ne4unwnemw4lrjdf2q5hm3d6jji6pvr@rav2vgfwioeu>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-10-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225121824.3869719-10-quic_amakhija@quicinc.com>
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

On Tue, Feb 25, 2025 at 05:48:22PM +0530, Ayushi Makhija wrote:
> When device enters the suspend state, it prevents
> HPD interrupts from occurring. To address this,
> add an additional PM runtime vote during bridge
> attach for DisplayPort. This vote is removed on
> bridge detach.

Well.. You can guess. The bridges have .hpd_enable() and .hpd_disable()
callbacks. Please use those instead.

> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 4be34d5c7a3b..d2655bf46842 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2168,6 +2168,9 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
>  
>  	ctx->bridge_attached = 1;
>  
> +	if (ctx->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort)
> +		pm_runtime_get_sync(dev);
> +
>  	return 0;
>  }
>  
> @@ -2175,6 +2178,9 @@ static void anx7625_bridge_detach(struct drm_bridge *bridge)
>  {
>  	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
>  
> +	if (ctx->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort)
> +		pm_runtime_put_sync(ctx->dev);
> +
>  	drm_dp_aux_unregister(&ctx->aux);
>  }
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
