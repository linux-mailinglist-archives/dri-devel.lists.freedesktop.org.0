Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC965A2B9A4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 04:23:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A43C10EA12;
	Fri,  7 Feb 2025 03:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YHnTfZ59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C0F10EA13
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 03:21:55 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-30738a717ffso14550941fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2025 19:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738898513; x=1739503313; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jwcmk7k9AC7czFUQf0n+C1hcOeDbMPV004qK25+fyvM=;
 b=YHnTfZ59MMVbfrTJ7EgxBARgv4xF29nte85GQRmVAxO4rF8+P2SZ5bWWrBWL62/wBs
 8RpRGslzNtv5B67qXs5j3MN2N8OHpbg6l/TWBIH+6Q5C04i54BR7lGl9s/JlSfYXSY9t
 tNBQUlQEmkujXs8U28yLWvn4XD2YT74OARZJkD67Rvp+8zuSgdWwGRLOriqSsLOSsCqS
 5HzYlv4VXKgoJ08UUA9Wi6dlMgg+jkvR2lvGd5CLTv9r0X4oSN7nya4CrKCHphAVIzTI
 q3oMHyIEGekRe5LIk2hepc+6yHbbxLk9o/5rw3woBgEU8beEGerUpGpS/J4PZgRYc4NE
 bjLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738898513; x=1739503313;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jwcmk7k9AC7czFUQf0n+C1hcOeDbMPV004qK25+fyvM=;
 b=swQm9J991UfpUd/P7VAS5kZ9y1l0agYHKgLbUVDUaj0KPui4uvVpxGoMgRoaG/4Dch
 KcMQPNQ16D9YAp34tRSWxWG7mk1YCa8H6QcMsOXw5Lr03cTkY3leRYrzxuIZwGa/tQYb
 74es9FmjrbT/58ySZhVl9igmZiB5kHc6ekzzFcV2gWMgsQ4n3NtLNtsPn0EjHj6BxP2G
 oYPqQFNec6LpVGSishMUOVx1nSPJApDjJIZnFRpiGgNfxTsRCg0bfIf2eMLnbwPzdZ6v
 zOAavg5goTF1Dinn/Z1OG5bhPx6g7Gbw89oChWA8sUlAylzeeYRGqYqgnGT4sfdeQNZ8
 e5Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT3xwGqNT8hibNYyUgLqahVEdfmEWnIqjucq6IsI51EfKKlUjnc4G2gjEYOsjU9mFKqGvnUirVAHE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YziQWeqw1nun6ago3ZyPYz5RQSUsdz5UNEup5560Fp7WZHhD7BF
 Rtc7VqgK28YRXcma0b43YlrnvgOuUTr7OCKfE21W2oLkO9qDANEhl1qb5cMLfps=
X-Gm-Gg: ASbGncv72GUsFcGCdZM4Yvcul7alSqxxupH8CwIuZMNE/hhHpbqvK94MXgni8XejR4p
 oov5SkGF7ocdf7Kxorr+sgaa66TsZfKV6yksOhR5M8/JtwsdDdwDJMYhxwUKdrZA6BnA4o04T9+
 GmoscZqA98XvLiIPjoUZaQkVXwlNZQPGonSE1XuDMYVltyJM36jw9g64GBkbEwBh1Xkf4L39IJz
 tQh/miTin9T8kCMj1vcyag59x997YbSpjrSbBSOSZ4JknW07jwRlfPbZjsGGXKGMsmqftGrYwnA
 hkxYOdAtgvxJNVcmQVtES0X9idRkHs3m+xPzqX78kBEnP8Z46UKYulJImgpGYSbm24HMaVo=
X-Google-Smtp-Source: AGHT+IGXPxYYkbFiwpsaOKJBOzOC8iwJk/HxhUGnU6Jn7j20z0rhZR/XSqLWFXE34k0c+Sb2YWRUKA==
X-Received: by 2002:a2e:bccb:0:b0:306:1524:20e with SMTP id
 38308e7fff4ca-307e581946dmr5062581fa.18.1738898513349; 
 Thu, 06 Feb 2025 19:21:53 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de2b9c95sm2960931fa.82.2025.02.06.19.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 19:21:52 -0800 (PST)
Date: Fri, 7 Feb 2025 05:21:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] drm/bridge: minor cleanups
Message-ID: <zp2jw3plc26v3vm4d22jetolcxhmcsikadt33ecfi64t6rw6zx@u3mi35nxisdo>
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
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

On Thu, Feb 06, 2025 at 06:02:32PM +0100, Luca Ceresoli wrote:
> This series removes some unnecessary #includes and and unused forward
> declarations, which I noticed while preparing a way more complex series
> (bridge hotplug). I decided to split these trivial patches to a separate
> series to limit the noise on the larger series.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (8):
>       drm/panel: remove unnecessary forward declaration
>       drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
>       drm/bridge: parade-ps8622: remove unused drm_panel.h include
>       drm/bridge: parade-ps8640: remove unused drm_panel.h include
>       drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
>       drm/bridge: tc358775: remove unused drm_panel.h include
>       drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
>       drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include
> 
>  drivers/gpu/drm/bridge/nxp-ptn3460.c   | 1 -
>  drivers/gpu/drm/bridge/parade-ps8622.c | 1 -
>  drivers/gpu/drm/bridge/parade-ps8640.c | 1 -
>  drivers/gpu/drm/bridge/tc358762.c      | 2 +-
>  drivers/gpu/drm/bridge/tc358775.c      | 1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c  | 1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c  | 1 -
>  include/drm/drm_panel.h                | 1 -
>  8 files changed, 1 insertion(+), 8 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250206-drm-cleanups-b78703e04e9f
> 

For the series:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
