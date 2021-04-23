Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DFB36951A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 16:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0734A6EBA8;
	Fri, 23 Apr 2021 14:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A396EBA8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:50 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id r186so21626464oif.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 07:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f26salV1YONwthrr9i5IByzy2v+Ur3hR9OqqinAL1Ug=;
 b=HCf1U1iQ4B4smQ+qxODrbF29uSIY+cWfhHMTASKdmajsJcSAgNlRFEOv1jVm32LR9U
 xD3SoRkKn5gItx+pabT3s0MQCxRnKoJB0UeFiMWtWCT6hwOn8O971+5oBXnzU6sZbK+1
 cC6qa3DrbBxN5vceGGgMfKYcS8qNzxt6tZUYSGJmyweS4huG2zmNa1XlM1PW3Rl//kp8
 Qu5oYOGhNwlEhE7h/qNbgJrWY0He4thJKrqwfJXkcdOY9c1ALoxyN302hU9TU3cK7JWS
 so+f+n6rNIlRcOFcschbb95/pFDuqwPkpR/8bP1B/HlME1VAKv9/p3bxm52+RLmfevfV
 tBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f26salV1YONwthrr9i5IByzy2v+Ur3hR9OqqinAL1Ug=;
 b=ZcrBO8hx0Si4QdnKPu0MI5JzHOs8HJdfWSXPrpccwAme/dCanq9rKKEsPaWohP4VXw
 HGZiUq9k6FGN53jAWWfcdaiXf/chCVICdid8dkb2YORdGnhGne20ovrp/49VXZNaZ359
 VMLpjUyNyblavZpIT86j1YEsNA31DMR/xjp1ScZxIVs19sohiUaSB8Bw+sbUTKJKca97
 enzyvo5rG7DljxDS/UqiThsdX4UJoB3tsU1c8FGJ4wMzMNp2XYnUiQpjpXNBwUG55+A/
 jQUib6jfob7i45GPdk6HQueNjmLQKhqONqC29ZumUQzJ5aE+2o2v4U6pfOUrYU8TShvG
 kQvw==
X-Gm-Message-State: AOAM531aGYVjOxqarAgtoF6o7dx22IxAbFGSVGyZ7aOiiwOoGQVi2KDA
 idJYkvbDZe24Z5022OC5FZFPlA==
X-Google-Smtp-Source: ABdhPJyWTiOMQqGgTo0m+fFWWeOjgdIvyqP6jE16dXn/PMChAYrJ+ebmGllRDk6dz3Nt1YvTqqZ82g==
X-Received: by 2002:aca:dfc1:: with SMTP id w184mr3145515oig.79.1619189450134; 
 Fri, 23 Apr 2021 07:50:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l9sm1244933oog.32.2021.04.23.07.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 07:50:49 -0700 (PDT)
Date: Fri, 23 Apr 2021 09:50:47 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 16/27] drm/panel: panel-simple: Get rid of hacky HPD
 chicken-and-egg code
Message-ID: <YILex5oaMUQy5zs/@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.16.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.16.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
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
Cc: robdclark@chromium.org, Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
 Stephen Boyd <swboyd@chromium.org>, Wolfram Sang <wsa@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> When I added support for the hpd-gpio to simple-panel in commit
> 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying
> prepare()"), I added a special case to handle a circular dependency I
> was running into on the ti-sn65dsi86 bridge chip. On my board the
> hpd-gpio is actually provided by the bridge chip. That was causing
> some circular dependency problems that I had to work around by getting
> the hpd-gpio late.
> 
> I've now reorganized the ti-sn65dsi86 bridge chip driver to be a
> collection of sub-drivers. Now the GPIO part can probe separately and
> that breaks the chain. Let's get rid of the old code to clean things
> up.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 24 +++++-------------------
>  1 file changed, 5 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6b22872b3281..90a17ca79d06 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -366,8 +366,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  	return 0;
>  }
>  
> -static int panel_simple_get_hpd_gpio(struct device *dev,
> -				     struct panel_simple *p, bool from_probe)
> +static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
>  {
>  	int err;
>  
> @@ -375,17 +374,10 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
>  	if (IS_ERR(p->hpd_gpio)) {
>  		err = PTR_ERR(p->hpd_gpio);
>  
> -		/*
> -		 * If we're called from probe we won't consider '-EPROBE_DEFER'
> -		 * to be an error--we'll leave the error code in "hpd_gpio".
> -		 * When we try to use it we'll try again.  This allows for
> -		 * circular dependencies where the component providing the
> -		 * hpd gpio needs the panel to init before probing.
> -		 */
> -		if (err != -EPROBE_DEFER || !from_probe) {
> +		if (err != -EPROBE_DEFER)
>  			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
> -			return err;
> -		}
> +
> +		return err;
>  	}
>  
>  	return 0;
> @@ -416,12 +408,6 @@ static int panel_simple_prepare_once(struct panel_simple *p)
>  		msleep(delay);
>  
>  	if (p->hpd_gpio) {
> -		if (IS_ERR(p->hpd_gpio)) {
> -			err = panel_simple_get_hpd_gpio(dev, p, false);
> -			if (err)
> -				goto error;
> -		}
> -
>  		if (p->desc->delay.hpd_absent_delay)
>  			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
>  		else
> @@ -682,7 +668,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  
>  	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
>  	if (!panel->no_hpd) {
> -		err = panel_simple_get_hpd_gpio(dev, panel, true);
> +		err = panel_simple_get_hpd_gpio(dev, panel);
>  		if (err)
>  			return err;
>  	}
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
