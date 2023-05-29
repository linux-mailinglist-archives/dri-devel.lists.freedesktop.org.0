Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 692DF714FDD
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 21:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D67810E2DE;
	Mon, 29 May 2023 19:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [46.30.211.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E8F10E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 19:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=gtrZWjlEnUbwphBApryiUmXqhGWom1LpsMN4AJyY7T8=;
 b=QdHWZsq+QRe0afeIenYwD9ZweuhKNCyhuBcxnD5VgsOAEXYiFFaKzdJtsV+Wmb7Ametfr+i2KAcDb
 XsztSN2WQclopuHsTfWL636yiGBXR8zfhpgPFHsNeZmjajF9615hCJ3urRDLl34d4Pk0E9dgikl0ye
 hT+0DgNNEHuMEEpCJZViPDeOnKf8yAyTF27wkhvs3fsvLHedYZiZREQDKYVmiwlVq7P3uheEoCiHfh
 4cXg5oG1KOrY4voEBP4djTwK9hiRjuIxDB89SbEPBbS3KoW49cGFY1JXUrhViFIpKYM8Wk3YhaF532
 voFk66N6eqkuo13V3ZpoCiVzo6KGlRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=gtrZWjlEnUbwphBApryiUmXqhGWom1LpsMN4AJyY7T8=;
 b=NKB18EqU1dC6iCGyDUHyOQCd0uJT8SzZDwRAU1fqhATuDkpLg3uIay+ABzd0nSF7pnKjhkDq46Z3Z
 LNDXeRJBA==
X-HalOne-ID: 7027db7f-fe58-11ed-8a79-592bb1efe9dc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 7027db7f-fe58-11ed-8a79-592bb1efe9dc;
 Mon, 29 May 2023 19:38:53 +0000 (UTC)
Date: Mon, 29 May 2023 21:38:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 11/13] drm/fb-helper: Export helpers for marking
 damage areas
Message-ID: <20230529193851.GF1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524092150.11776-12-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:21:48AM +0200, Thomas Zimmermann wrote:
> Export drm_fb_helper_damage() and drm_fb_helper_damage_range(), which
> handle damage areas for fbdev emulation. This is a temporary export
> that allows to move the DRM I/O helpers for fbdev into drivers. Only
> fbdev-generic and i915 need them. Both will be updated to implement
> damage handling by themselves and the exported functions will be removed.
> 
> v4:
> 	* update interfaces
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Assuming there is a good answer why there is no dirty check:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/drm_fb_helper.c | 22 ++++++++++++++++++++++
>  include/drm/drm_fb_helper.h     |  3 +++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> index f0e9549b6bd7..cb03099fd2e3 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -670,6 +670,28 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
>  	drm_rect_init(clip, x1, y1, x2 - x1, y2 - y1);
>  }
>  
> +/* Don't use in new code. */
> +void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +	struct drm_rect damage_area;
> +
> +	drm_fb_helper_memory_range_to_clip(info, off, len, &damage_area);
> +	drm_fb_helper_damage(fb_helper, damage_area.x1, damage_area.y1,
> +			     drm_rect_width(&damage_area),
> +			     drm_rect_height(&damage_area));
> +}
> +EXPORT_SYMBOL(drm_fb_helper_damage_range);
> +
> +/* Don't use in new code. */
> +void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
> +{
> +	struct drm_fb_helper *fb_helper = info->par;
> +
> +	drm_fb_helper_damage(fb_helper, x, y, width, height);
> +}
> +EXPORT_SYMBOL(drm_fb_helper_damage_area);
> +
>  /**
>   * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
>   * @info: fb_info struct pointer
> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
> index 72032c354a30..7d5804882be7 100644
> --- a/include/drm/drm_fb_helper.h
> +++ b/include/drm/drm_fb_helper.h
> @@ -253,6 +253,9 @@ void drm_fb_helper_fill_info(struct fb_info *info,
>  			     struct drm_fb_helper *fb_helper,
>  			     struct drm_fb_helper_surface_size *sizes);
>  
> +void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len);
> +void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height);
> +
>  void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
>  
>  ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
> -- 
> 2.40.1
