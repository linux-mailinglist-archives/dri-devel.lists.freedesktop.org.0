Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7DB49C02B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 01:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5513710E3B3;
	Wed, 26 Jan 2022 00:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DCA110E3B3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 00:33:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41BBF113E;
 Tue, 25 Jan 2022 16:33:18 -0800 (PST)
Received: from [10.57.68.26] (unknown [10.57.68.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CABA3F766;
 Tue, 25 Jan 2022 16:33:17 -0800 (PST)
Message-ID: <5c154629-98ef-8de4-7018-b31f8763a582@arm.com>
Date: Wed, 26 Jan 2022 00:33:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] [RFC] fbcon: Add option to enable legacy hardware
 acceleration
Content-Language: en-GB
To: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <YfBLiUMokw6tLq0O@p100>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YfBLiUMokw6tLq0O@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2022-01-25 19:12, Helge Deller wrote:
> Add a config option CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION to
> enable bitblt and fillrect hardware acceleration in the framebuffer
> console. If disabled, such acceleration will not be used, even if it is
> supported by the graphics hardware driver.
> 
> If you plan to use DRM as your main graphics output system, you should
> disable this option since it will prevent compiling in code which isn't
> used later on when DRM takes over.
> 
> For all other configurations, e.g. if none of your graphic cards support
> DRM (yet), DRM isn't available for your architecture, or you can't be
> sure that the graphic card in the target system will support DRM, you
> most likely want to enable this option.
> 
> 
> This patch is the first RFC.
> 
> 
> Independed of this patch I did some timing experiments with a qemu
> virtual machine running a PA-RISC Debian Linux installation with a
> screen resolution of 2048x1024 with 8bpp. In that case qemu emulated the
> graphics hardware bitblt and fillrect acceleration by using the native
> (x86) CPU.
> 
> It was a simple testcase which was to run "time dmesg", where the syslog
> had 284 lines. The results showed a huge speedup:
> a) time dmesg (without acceleration):
>     -> 19.0 seconds
> b) time dmesg (with acceleration):
>     ->  2.6 seconds
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index 840d9813b0bc..da84d1c21c21 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -78,6 +78,17 @@ config FRAMEBUFFER_CONSOLE
>   	help
>   	  Low-level framebuffer-based console driver.
> 
> +config FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +	bool "Framebuffer Console hardware acceleration support"
> +	depends on FRAMEBUFFER_CONSOLE
> +	default y if !DRM
> +	default y if !(X86 || ARM)

You probably mean ARM64 there, if you're trying to encapsulate "modern 
systems where this really isn't relevant". Some supported ARM platforms 
do date back to the days of weird and wonderful fbdev hardware.

Conversely I recently cobbled an ancient PCI VGA card into an arm64 
machine and was slightly disappointed that there didn't seem to be any 
driver that was usable straight off :)

(Yes, I might give v86d + uvesafb a go at some point...)

Robin.

> +	help
> +	  If you use a system on which DRM is fully supported you usually want to say N,
> +	  otherwise you probably want to enable this option.
> +	  If enabled the framebuffer console will utilize the hardware acceleration
> +	  of your graphics card by using hardware bitblt and fillrect features.
> +
>   config FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
>          bool "Map the console to the primary display device"
>          depends on FRAMEBUFFER_CONSOLE
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index b813985f1403..f7b7d35953e8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1136,11 +1136,13 @@ static void fbcon_init(struct vc_data *vc, int init)
> 
>   	ops->graphics = 0;
> 
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>   	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
>   	    !(cap & FBINFO_HWACCEL_DISABLED))
>   		p->scrollmode = SCROLL_MOVE;
>   	else /* default to something safe */
>   		p->scrollmode = SCROLL_REDRAW;
> +#endif
> 
>   	/*
>   	 *  ++guenther: console.c:vc_allocate() relies on initializing
> @@ -1705,7 +1707,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>   			count = vc->vc_rows;
>   		if (logo_shown >= 0)
>   			goto redraw_up;
> -		switch (p->scrollmode) {
> +		switch (fb_scrollmode(p)) {
>   		case SCROLL_MOVE:
>   			fbcon_redraw_blit(vc, info, p, t, b - t - count,
>   				     count);
> @@ -1795,7 +1797,7 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>   			count = vc->vc_rows;
>   		if (logo_shown >= 0)
>   			goto redraw_down;
> -		switch (p->scrollmode) {
> +		switch (fb_scrollmode(p)) {
>   		case SCROLL_MOVE:
>   			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
>   				     -count);
> @@ -1946,12 +1948,12 @@ static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy,
>   		   height, width);
>   }
> 
> -static void updatescrollmode(struct fbcon_display *p,
> +static void updatescrollmode_accel(struct fbcon_display *p,
>   					struct fb_info *info,
>   					struct vc_data *vc)
>   {
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>   	struct fbcon_ops *ops = info->fbcon_par;
> -	int fh = vc->vc_font.height;
>   	int cap = info->flags;
>   	u16 t = 0;
>   	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> @@ -1972,12 +1974,6 @@ static void updatescrollmode(struct fbcon_display *p,
>   	int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
>   		!(cap & FBINFO_HWACCEL_DISABLED);
> 
> -	p->vrows = vyres/fh;
> -	if (yres > (fh * (vc->vc_rows + 1)))
> -		p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> -	if ((yres % fh) && (vyres % fh < yres % fh))
> -		p->vrows--;
> -
>   	if (good_wrap || good_pan) {
>   		if (reading_fast || fast_copyarea)
>   			p->scrollmode = good_wrap ?
> @@ -1991,6 +1987,27 @@ static void updatescrollmode(struct fbcon_display *p,
>   		else
>   			p->scrollmode = SCROLL_REDRAW;
>   	}
> +#endif
> +}
> +
> +static void updatescrollmode(struct fbcon_display *p,
> +					struct fb_info *info,
> +					struct vc_data *vc)
> +{
> +	struct fbcon_ops *ops = info->fbcon_par;
> +	int fh = vc->vc_font.height;
> +	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> +	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> +				   info->var.xres_virtual);
> +
> +	p->vrows = vyres/fh;
> +	if (yres > (fh * (vc->vc_rows + 1)))
> +		p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> +	if ((yres % fh) && (vyres % fh < yres % fh))
> +		p->vrows--;
> +
> +	/* update scrollmode in case hardware acceleration is used */
> +	updatescrollmode_accel(p, info, vc);
>   }
> 
>   #define PITCH(w) (((w) + 7) >> 3)
> @@ -2148,7 +2165,7 @@ static int fbcon_switch(struct vc_data *vc)
> 
>   	updatescrollmode(p, info, vc);
> 
> -	switch (p->scrollmode) {
> +	switch (fb_scrollmode(p)) {
>   	case SCROLL_WRAP_MOVE:
>   		scrollback_phys_max = p->vrows - vc->vc_rows;
>   		break;
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
> index 9315b360c898..c5c043f38162 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -29,7 +29,9 @@ struct fbcon_display {
>       /* Filled in by the low-level console driver */
>       const u_char *fontdata;
>       int userfont;                   /* != 0 if fontdata kmalloc()ed */
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
>       u_short scrollmode;             /* Scroll Method */
> +#endif
>       u_short inverse;                /* != 0 text black on white as default */
>       short yscroll;                  /* Hardware scrolling */
>       int vrows;                      /* number of virtual rows */
> @@ -208,6 +210,17 @@ static inline int attr_col_ec(int shift, struct vc_data *vc,
>   #define SCROLL_REDRAW	   0x004
>   #define SCROLL_PAN_REDRAW  0x005
> 
> +static inline u_short fb_scrollmode(struct fbcon_display *fb)
> +{
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION
> +	return fb->scrollmode;
> +#else
> +	/* hardcoded to SCROLL_REDRAW if acceleration was disabled. */
> +	return SCROLL_REDRAW;
> +#endif
> +}
> +
> +
>   #ifdef CONFIG_FB_TILEBLITTING
>   extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
>   #endif
