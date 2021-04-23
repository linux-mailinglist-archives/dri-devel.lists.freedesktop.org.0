Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAA3696AD
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C856E10F;
	Fri, 23 Apr 2021 16:12:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A78C6E10F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:12:49 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 v19-20020a0568300913b029028423b78c2dso37105199ott.8
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t2yrefWokbt33zTb8tmxj08fAqkU3+m9KUoV5do9LC0=;
 b=PJ/zA3NEHcqEnhs54KzGFdXCkq4oVc/gAhKk8CPtOzBSe3RpJxzCnR8t0i5EWQ2rUn
 cBvcR75IV7rT/nCF4fzK4L8JBnVnV4fvzgBFlVnTefFtn/sUFAydBkgugBPl4u093wYZ
 UDBgcLOOuPdIfospceeYriu21HsVIX0XCEve5L1FragZ4PenxTOH+fi3cwYSG5rMeTin
 LtV8ITJCs8Q93hancAReZ5D8emnlNbC2HuKZKWPu6z95xsaBrZUQkp97rZArr0f5ra/j
 sXNPosDBmufG4qNw09oYtxTfSW/XWSxeGYTLVEb3D4jQD5sG/i5PvthnYHoL+Z7V9PIh
 FDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t2yrefWokbt33zTb8tmxj08fAqkU3+m9KUoV5do9LC0=;
 b=fRqYFcbntrnkeQNH9v09/b5su3b7CdbJ8/ZD2YdlfaVlLZ5cMlfUjuZDjACs5xtItV
 lYKg4v0Xet5RFzxdMIebDUmeKlDWg/wpjgQlhLNN0rSYdtxtLGNKsxRzHn7JORxjPC/a
 StZJfIENxepY69iAbS4+NqIM8CSgIB7ercf34bFenMtTb/QSA00Wvnq+NYqCTlwNDVQ4
 6cWVIpH6QSFYdSNNzqKbY6EK/ZL/J8gAE6Qogty7lR7JOBQqjuvxRxF24jrM65QKTkD2
 pDY6AviNoc45BEBEPWKqL4GpN6cmMSd75eBa+WoUH2Gc+uFnftB4pxKFHNlI/D5iIYPo
 g+1A==
X-Gm-Message-State: AOAM531m49Sp2RsXo5KM6rUjvgqX41m7Sa1WwwuaDKZST+85Ww1ahvvz
 t7pvOf5/iSB4NXhSjcpTSEG1Zw==
X-Google-Smtp-Source: ABdhPJz1tp/EQchiVjH4auFBqgFjc0Uz3XgKzC1NFD0VSi1F0QaLnrO+79sKOL4PwuCs206USDCV7A==
X-Received: by 2002:a9d:5a1a:: with SMTP id v26mr4123172oth.50.1619194368866; 
 Fri, 23 Apr 2021 09:12:48 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x24sm1465060otk.16.2021.04.23.09.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 09:12:48 -0700 (PDT)
Date: Fri, 23 Apr 2021 11:12:46 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 24/27] drm/panel: panel-simple: Cache the EDID as long
 as we retain power
Message-ID: <YILx/iODs+DFWWwm@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.24.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.24.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
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

> It doesn't make sense to go out to the bus and read the EDID over and
> over again. Let's cache it and throw away the cache when we turn power
> off from the panel. Autosuspend means that even if there are several
> calls to read the EDID before we officially turn the power on then we
> should get good use out of this cache.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/panel/panel-simple.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 40382c1be692..5a2953c4ca44 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -189,6 +189,8 @@ struct panel_simple {
>  	struct gpio_desc *enable_gpio;
>  	struct gpio_desc *hpd_gpio;
>  
> +	struct edid *edid;
> +
>  	struct drm_display_mode override_mode;
>  
>  	enum drm_panel_orientation orientation;
> @@ -345,6 +347,9 @@ static int panel_simple_suspend(struct device *dev)
>  	regulator_disable(p->supply);
>  	p->unprepared_time = ktime_get();
>  
> +	kfree(p->edid);
> +	p->edid = NULL;

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


But separate of this, shouldn't the driver have a pm_runtime_disable()
in the remove path to synchronize the autosleep? Or is that not how that
works?

Regards,
Bjorn

> +
>  	return 0;
>  }
>  
> @@ -510,15 +515,13 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>  
>  	/* probe EDID if a DDC bus is available */
>  	if (p->ddc) {
> -		struct edid *edid;
> -
>  		pm_runtime_get_sync(panel->dev);
>  
> -		edid = drm_get_edid(connector, p->ddc);
> -		if (edid) {
> -			num += drm_add_edid_modes(connector, edid);
> -			kfree(edid);
> -		}
> +		if (!p->edid)
> +			p->edid = drm_get_edid(connector, p->ddc);
> +
> +		if (p->edid)
> +			num += drm_add_edid_modes(connector, p->edid);
>  
>  		pm_runtime_mark_last_busy(panel->dev);
>  		pm_runtime_put_autosuspend(panel->dev);
> -- 
> 2.31.1.368.gbe11c130af-goog
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
