Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C74B3696C1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74416E3F7;
	Fri, 23 Apr 2021 16:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CCD6E3F7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:16:53 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id i81so49669760oif.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=nOQQqBqjHuvjx+mAlIOMyHNRurAecyF6kdkwHEmgzso=;
 b=tLZ9DmttTeYtxODA8GpoGJD3f0Haev5OEYxrAoEu5x/meFKNZ67Xrn6E7wBOaPuifI
 wNlvV52rK5Y2Mywj2ET9283Zs770zV7NHAs07XT9eYniS6gbUuIJBKyK+2B932VNi9sJ
 RcIF2vnKJocRtzBB+uIaJGPbfUfBTaB1x5X3zXN7rIb/K/+YrxSv76g7tdXH/v7NLeJF
 6y4fg0IDpP2fBw3zv4WDH7ovgaWgetiGIPsn2rRTZs8FHo9D9aURjU9P8iAYP8XWlk3D
 AZrQ1Qqx6AtlJhlZdjsp8KQVqUuo45eacaZnE1gjIqpoB6PNVJ3i1CYRPq5KNULETOPN
 QidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nOQQqBqjHuvjx+mAlIOMyHNRurAecyF6kdkwHEmgzso=;
 b=Mcli/ZkQo57TiW9gFjE8Gdpf3psnVN+rZYQwWQiDbVv5DWeYoAVwvUGtMxHSKHR0Md
 NJoeQ7F4TSrer7rZd5PCU9VWfj7RgKZSj47KBTYRYlQH2/ZHZDlePXZC/oYDS/JcQBFE
 gqcYfT+z/dt5X3tRk0c0SpiluqxVi6rJgkk97k+xiIweDJ8AjPwwMPDH4KrW6qUP3kEX
 0/sbh82zZjLceT0s4acE6Gb8qnuTjn8WO6YbYnf3oFpL18N/goBsEbML0Qyn0xpxFNSW
 uxJmExkuyRiyfjf98kV56vcof/Y+xTvWy8xP/3AAqiAckfIJBsKJlxEMD+saoPERI3E5
 eHLw==
X-Gm-Message-State: AOAM5302KQDoW48dhY7TCrVvvZW98JwrvrbPtXM+nxQ9khT3jf69c4AP
 nRiZJ2ZMi2ewR477YYYdsTkGwQ==
X-Google-Smtp-Source: ABdhPJyxj8Hhn+123lQ/JT8X7RLjGQCf0dKzpHIzSwezdnqt5VNuPgWlbYaErNniQIPS+VIKQ6Nmvg==
X-Received: by 2002:aca:db02:: with SMTP id s2mr4534138oig.100.1619194612825; 
 Fri, 23 Apr 2021 09:16:52 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h5sm1359874oth.20.2021.04.23.09.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:16:52 -0700 (PDT)
Date: Fri, 23 Apr 2021 11:16:50 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 27/27] drm/panel: panel-simple: Prepare/unprepare are
 refcounted, not forced
Message-ID: <YILy8jbYcwAt4Bqw@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
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

> Historically simple-panel had code to make sure that if prepare() was
> called on an already-prepared panel that it was a no-op. Similarly if
> unprepare() was called on an already-unprepared panel it was also a
> no-op. Essentially it means that these functions always "forced" the
> value to be whatever the caller wanted it to be. You can see that the
> forcing behavior dates back at least as far as 2014 by looking at
> commit 613a633e7a56 ("drm/panel: simple: Add proper definition for
> prepare and unprepare").
> 
> Apparently the code supporting the historical behavior may not be
> needed [1] and prepare() / unprepare() are supposed to be
> balanced. Let's try removing it and see if anyone breaks! If they do
> then we can have a debate about whether we should change that code or
> revert this patch. :-) If nobody breaks then we've nicely saved a few
> lines of code and some complexity.
> 
> [1] https://lore.kernel.org/r/YHePsQgqOau1V5lD@pendragon.ideasonboard.com
> 

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 14 --------------
>  1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 5a2953c4ca44..a2c3008af7e5 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -176,8 +176,6 @@ struct panel_simple {
>  	bool enabled;
>  	bool no_hpd;
>  
> -	bool prepared;
> -
>  	ktime_t prepared_time;
>  	ktime_t unprepared_time;
>  
> @@ -355,18 +353,12 @@ static int panel_simple_suspend(struct device *dev)
>  
>  static int panel_simple_unprepare(struct drm_panel *panel)
>  {
> -	struct panel_simple *p = to_panel_simple(panel);
>  	int ret;
>  
> -	/* Unpreparing when already unprepared is a no-op */
> -	if (!p->prepared)
> -		return 0;
> -
>  	pm_runtime_mark_last_busy(panel->dev);
>  	ret = pm_runtime_put_autosuspend(panel->dev);
>  	if (ret < 0)
>  		return ret;
> -	p->prepared = false;
>  
>  	return 0;
>  }
> @@ -475,18 +467,12 @@ static int panel_simple_prepare(struct drm_panel *panel)
>  	struct panel_simple *p = to_panel_simple(panel);
>  	int ret;
>  
> -	/* Preparing when already prepared is a no-op */
> -	if (p->prepared)
> -		return 0;
> -
>  	ret = pm_runtime_get_sync(panel->dev);
>  	if (ret < 0) {
>  		pm_runtime_put_autosuspend(panel->dev);
>  		return ret;
>  	}
>  
> -	p->prepared = true;
> -
>  	return 0;
>  }
>  
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
