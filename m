Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAD74AE1C8
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 20:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1C110E1FA;
	Tue,  8 Feb 2022 19:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23BCF10E135
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 19:00:45 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 90d0ca10-8911-11ec-ac19-0050568cd888;
 Tue, 08 Feb 2022 19:01:47 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3DFC3194B5C;
 Tue,  8 Feb 2022 20:00:41 +0100 (CET)
Date: Tue, 8 Feb 2022 20:00:38 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 21/21] fbdev: Make registered_fb[] private to fbmem.c
Message-ID: <YgK91i6zHWPBwYOq@ravnborg.org>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-22-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131210552.482606-22-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Jens Frederich <jfrederich@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Zheyu Ma <zheyuma97@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Mon, Jan 31, 2022 at 10:05:52PM +0100, Daniel Vetter wrote:
> Well except when the olpc dcon fbdev driver is enabled, that thing
> digs around in there in rather unfixable ways.
> 
> Cc oldc_dcon maintainers as fyi.
> 
> Cc: Jens Frederich <jfrederich@gmail.com>
> Cc: Jon Nettleton <jon.nettleton@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
> Cc: Zhen Lei <thunder.leizhen@huawei.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Xiyu Yang <xiyuyang19@fudan.edu.cn>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Zheyu Ma <zheyuma97@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

with the build thingy fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

I do wonder if there is a more clean way to trigger a blank
in the main fbdev driver from the olpc driver.

The current hack is not nice and it would be good to see it gone.

	Sam

> ---
>  drivers/video/fbdev/core/fbmem.c | 8 ++++++--
>  include/linux/fb.h               | 7 +++----
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> index 904ef1250677..dad6572942fa 100644
> --- a/drivers/video/fbdev/core/fbmem.c
> +++ b/drivers/video/fbdev/core/fbmem.c
> @@ -48,10 +48,14 @@
>  static DEFINE_MUTEX(registration_lock);
>  
>  struct fb_info *registered_fb[FB_MAX] __read_mostly;
> -EXPORT_SYMBOL(registered_fb);
> -
>  int num_registered_fb __read_mostly;
> +#if IS_ENABLED(CONFIG_OLPC_DCON)
> +EXPORT_SYMBOL(registered_fb);
>  EXPORT_SYMBOL(num_registered_fb);
> +#endif
> +#define for_each_registered_fb(i)		\
> +	for (i = 0; i < FB_MAX; i++)		\
> +		if (!registered_fb[i]) {} else
>  
>  bool fb_center_logo __read_mostly;
>  
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index a8a00d2ba1f3..e236817502c2 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -622,16 +622,15 @@ extern int fb_get_color_depth(struct fb_var_screeninfo *var,
>  extern int fb_get_options(const char *name, char **option);
>  extern int fb_new_modelist(struct fb_info *info);
>  
> +#if IS_ENABLED(CONFIG_OLPC_DCON)
>  extern struct fb_info *registered_fb[FB_MAX];
> +
>  extern int num_registered_fb;
> +#endif
>  extern bool fb_center_logo;
>  extern int fb_logo_count;
>  extern struct class *fb_class;
>  
> -#define for_each_registered_fb(i)		\
> -	for (i = 0; i < FB_MAX; i++)		\
> -		if (!registered_fb[i]) {} else
> -
>  static inline void lock_fb_info(struct fb_info *info)
>  {
>  	mutex_lock(&info->lock);
> -- 
> 2.33.0
