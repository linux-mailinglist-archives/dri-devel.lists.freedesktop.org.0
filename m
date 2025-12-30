Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D35CE8FCF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 09:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1787B10E08F;
	Tue, 30 Dec 2025 08:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GPb/ywq4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4073110E08F
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 08:13:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 395576000A;
 Tue, 30 Dec 2025 08:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2696DC4CEFB;
 Tue, 30 Dec 2025 08:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767082406;
 bh=G8nLpdyPnI4knpugpRjPCh+o+t2Hpj90sjZYs9C5D1o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GPb/ywq4q3IenYBh2lbFP5+7w+SHLJORitfE//9rQxYxGNZj9TkurWOcRp1sSaxv+
 z6dp2a/LiTmA3RZCwIj3kWq2IPkui9NS+8X3Fp4BJpIVNV0rWSAJuzfB4wCUZ6GKUs
 D1tneyXTRbnDLoduN6WLXYsTLVYo1+Egz+B/rgAroZAZFDZY9aKuDXnMfAxljC5MBk
 ak4Wnhotnu3MfEjNQ5ZClshE1pX1tfwekILlhmu7CHZ4MRU8acWF64U8jnKTczvRAg
 f5K7meB5B6WKANWu8I3k0vaBygpb8mC9oDbim47gmBvtJr34p2H86LMafAnV9KflOK
 yaAOcaXQaiVFg==
Date: Tue, 30 Dec 2025 09:13:22 +0100
From: Helge Deller <deller@kernel.org>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Message-ID: <aVOJovo-k6-0KnVg@carbonx1>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-5-chintanlike@gmail.com>
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

* Chintan Patel <chintanlike@gmail.com>:
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
> core driver does not require CONFIG_FB_DEVICE.
> 
> Make sysfs support optional by defining overlay_sysfs_groups conditionally
> using PTR_IF(). The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.
> 
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index dd950e4ab5ce..cb7ed1ff9165 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
>  	&dev_attr_overlay_rop3.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(overlay_sysfs);

Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
isn't it possible to just mark the overlay_sysfs_attrs[] array
_maybe_unused, and just do:
+ #ifdef CONFIG_FB_DEVICE
+ ATTRIBUTE_GROUPS(overlay_sysfs);
+ #endif

?

Helge


> +
> +#ifdef CONFIG_FB_DEVICE
> +static const struct attribute_group overlay_sysfs_group = {
> +	.attrs = overlay_sysfs_attrs,
> +};
> +#endif
> +
> +static const struct attribute_group *overlay_sysfs_groups[] = {
> +	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
> +	NULL,
> +};
>  
>  static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
>  	.id =		"SH Mobile LCDC",
> -- 
> 2.43.0
> 
> 
