Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DACD12414F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:13:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889346EA34;
	Wed, 18 Dec 2019 08:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F187589A83
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 16:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1j865ukVwQiFcdbByxTjg1MVj3ESO8twxvwXtt6Bg8=; b=cv0zYoqs+F4UkqTu/F9OYXrIF
 lWcGWg8mOad6d3XS0JOckN48yLCRPN8Gei2Zy5MRiMKAXT8j97UmoFHPgsOKMv9S+gSMr558DI/16
 qUsFknMqLGTnQ/1+QSyVXX2YPr8Kg8+CYroKibb4vG427mNYhj24o9nV0/MZH7oAtckVDzJ//aNgZ
 IZiE3583/knd+XCdofa1109NNYEoxxI07ZkhrPEPlE78rv01VDYcdebvRJCra2aFnLwxNxZY2/BTY
 MZ60rlqgmLeQ72MAGfeUpHb499JxSGRbm4mhbRlwH6IFYl/5xPp5JgBo+ufwFnWEgthtl/zniWIM0
 bQRzepbCA==;
Received: from [2601:1c0:6280:3f0::fee9]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihFei-0002tm-CI; Tue, 17 Dec 2019 16:25:04 +0000
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of
 drm_panel_of_backlight() one more time
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
Date: Tue, 17 Dec 2019 08:25:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/17/19 6:07 AM, Andy Shevchenko wrote:
> The initial commit followed by the fix didn't take into consideration the case
> 
> CONFIG_DRM_PANEL=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> CONFIG_DRM_I915=y
> 
> where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
> Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.
> 
> Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yes, that fixes the build error.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> ---
>  drivers/gpu/drm/drm_panel.c | 2 +-
>  include/drm/drm_panel.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 79ff3fdf6f6e..8c7bac85a793 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -302,7 +302,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_panel);
>  #endif
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  /**
>   * drm_panel_of_backlight - use backlight device node for backlight
>   * @panel: DRM panel
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 5f27b693e1a0..121f7aabccd1 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -198,7 +198,7 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  }
>  #endif
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  int drm_panel_of_backlight(struct drm_panel *panel);
>  #else
>  static inline int drm_panel_of_backlight(struct drm_panel *panel)
> 


-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
