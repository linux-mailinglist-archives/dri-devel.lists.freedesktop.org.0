Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B143A9F37D3
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 18:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1440D10E73A;
	Mon, 16 Dec 2024 17:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="twU0VzcI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EA310E73A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 17:49:51 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-540201cfedbso4498986e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 09:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734371390; x=1734976190; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=;
 b=twU0VzcIxb0osKHY9vICnUr7IEhg7W3wMv2byAT/hyXOq6AOhjjWP+Krry/Un7cDOZ
 7yK0cfOGNNVTV4gpRj97isbZ5vaVt9yF8MUo5B1C5JWGoQeDcXrWDzDdK+r3tLM+TibU
 3IuKyIw2TIN2SuMhNcAos7C2XXmKlgbFNDWSfE9r4kt9sZFfxmwzzi5tjpR41IMakr2h
 hgeu/r3NjhTjAlNoFNDBEHhOs/M7wp2pvZe8Yxz8hNVSxtomS4ABo08aL34C0rvuQen/
 gMnhyCvl2Le/qOsP4ivhD4QZJt5Jz2cP/26C3vf25jQueoTvhYeXGTNVTR7DplHiEgqs
 ZNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734371390; x=1734976190;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=29HZw9kHGxpHsgmlYwTPoFjON5PsGOojd/3ISS3t80s=;
 b=to87U+YCrQwTxeRDC52qGd2ir7myykIaZ5I+JHDZcoiO61Sy6ZvTluLs1VIXqLZd8I
 UJ+ySPxtEbQPCU/bPZWKOybsPX1aDRfG4qgMDuGmhEyw72z0G5OkGTBfIHEAAE7wrCVD
 SPBZ1+2GXoOQbkbBDWDnyGsz+oXSZMewnKoo9VwIJ8yd1EZluI3/MCBjuGCVze95s70/
 opCyJl7Ry4V3gxxnwUmVwwk5Z51+2tcSksUfyYHaCA0cO81jeEeDF1TWx7OkChUzDqmb
 h65yXncs2jG7qWl0b3lwIJP3gVJZiUSbu4oEuXc5d8aKYqMzDG99wYJNbSY4YmEYeXz5
 XQDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmS0fgJmyt8espFULBvuxCoPnoq02Qeq6uLRhx/9KqTdgedOAhOQXSDsgcG85Y5q0e01qenIW8368=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymDoFHxzsRar+aWpWZSzIIgCPlqb8UKTz2dBeFhwHPZAY6HB65
 Vrvn4R/rriXKMOP+HbcXqF689Jq+lbM4/efQ4rfbXcdAMTW+ZAZubtzAkjNG01g=
X-Gm-Gg: ASbGncu9A7H3Uqe29XjyoIBdUhds1hu3DyYlytFkNBKXTcNK5c+vY07M+cXR1ITPSC9
 q5bFkJ1XvDoPlKflrdvesAF4cI1veeC3cI+tgZcZkmBTUDMGpg7/xLt0srf+5beI6Ff5G3S7E5a
 9S2bndNIY9BQWXj09o+PY6oMz7YPISOCsiObn69sW06k9/hsrBRJn0KMDFCX2q3DEk8VKjtNtGI
 Qz69TzivgMK2QqjoPnm69/HikYVJvxBoR+trgwHGY/AxLgjn/algtgPiVd/iaZtWRUWlgRPPIby
 8nPPzwKRrNAVrWCUjKEVCPUSKhnufEopYXuv
X-Google-Smtp-Source: AGHT+IGejqU6hvp6CTUn8Lo7kd3aSi6GmIf9oBeaAY0N0VSQP5YDDaQsXS6dw98iZgXbtRgL0xzwjQ==
X-Received: by 2002:a05:6512:31c6:b0:540:3561:666f with SMTP id
 2adb3069b0e04-5409055837amr4736533e87.20.1734371390228; 
 Mon, 16 Dec 2024 09:49:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c0031dsm921971e87.117.2024.12.16.09.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 09:49:49 -0800 (PST)
Date: Mon, 16 Dec 2024 19:49:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 04/10] drm/bridge: connector: add support for HDMI
 codec framework
Message-ID: <3su4cgtkkysztdvog24tkltvcflfbhdb24c2acelmbtt3dbm3n@dxtsuiqnxawz>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-4-50dc145a9c06@linaro.org>
 <20241216-benign-amiable-grebe-e0b3e1@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-benign-amiable-grebe-e0b3e1@houat>
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

On Mon, Dec 16, 2024 at 06:14:43PM +0100, Maxime Ripard wrote:
> On Fri, Dec 06, 2024 at 12:15:58PM +0200, Dmitry Baryshkov wrote:
> > Add necessary glue code to be able to use new HDMI codec framework from
> > the DRM bridge drivers. The drm_bridge implements a limited set of the
> > hdmi_codec_ops interface, with the functions accepting both
> > drm_connector and drm_bridge instead of just a generic void pointer.
> > 
> > This framework is integrated with the DRM HDMI Connector framework, but
> > can also be used for DisplayPort connectors.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 100 ++++++++++++++++++++++++-
> >  include/drm/drm_bridge.h                       |  38 ++++++++++
> >  2 files changed, 134 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 512ced87ea18c74e182a558a686ddd83de891814..4fa1bb73d430d02d5b79a1a184c203ec9e9c66e7 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -21,6 +21,8 @@
> >  #include <drm/display/drm_hdmi_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >  
> > +#include <sound/hdmi-codec.h>
> > +
> >  /**
> >   * DOC: overview
> >   *
> > @@ -368,10 +370,80 @@ static int drm_bridge_connector_write_infoframe(struct drm_connector *connector,
> >  	return bridge->funcs->hdmi_write_infoframe(bridge, type, buffer, len);
> >  }
> >  
> > +static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
> > +{
> > +	struct drm_bridge_connector *bridge_connector =
> > +		to_drm_bridge_connector(connector);
> > +	struct drm_bridge *bridge;
> > +
> > +	bridge = bridge_connector->bridge_hdmi;
> > +	if (!bridge)
> > +		return -EINVAL;
> > +
> > +	if (bridge->funcs->hdmi_codec_audio_startup)
> > +		return bridge->funcs->hdmi_codec_audio_startup(connector, bridge);
> > +	else
> > +		return 0;
> > +}
> 
> Nit: it looks like you return in other cases, and there's no need for
> that else.
> 
> I'd remove the else.

Ack

> 
> Looks good otherwise, once fixed
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime



-- 
With best wishes
Dmitry
