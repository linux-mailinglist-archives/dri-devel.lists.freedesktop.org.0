Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DC72A1544
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 11:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EF36E20C;
	Sat, 31 Oct 2020 10:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Sat, 31 Oct 2020 10:33:11 UTC
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CFE6E1ED
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 10:33:11 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id maTw2300K4C55Sk01aTwST; Sat, 31 Oct 2020 11:28:07 +0100
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kYo72-001aqJ-33; Sat, 31 Oct 2020 11:27:56 +0100
Date: Sat, 31 Oct 2020 11:27:56 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
In-Reply-To: <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
Message-ID: <alpine.DEB.2.22.394.2010311116530.379363@ramsan.of.borg>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
 <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nouveau@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Peter Rosin <peda@axentia.se>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 	Hi Daniel,

CC linux-fbdev

Thanks for your patch!

On Thu, 29 Oct 2020, Daniel Vetter wrote:
> So ever since syzbot discovered fbcon, we have solid proof that it's
> full of bugs. And often the solution is to just delete code and remove
> features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").
>
> Now the problem is that most modern-ish drivers really only treat
> fbcon as an dumb kernel console until userspace takes over, and Oops
> printer for some emergencies. Looking at drm drivers and the basic
> vesa/efi fbdev drivers shows that only 3 drivers support any kind of
> acceleration:
>
> - nouveau, seems to be enabled by default
> - omapdrm, when a DMM remapper exists using remapper rewriting for
>  y/xpanning
> - gma500, but that is getting deleted now for the GTT remapper trick,
>  and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
>  flag, so unused (and could be deleted already I think).
>
> No other driver supportes accelerated fbcon. And fbcon is the only
> user of this accel code (it's not exposed as uapi through ioctls),
> which means we could garbage collect fairly enormous amounts of code
> if we kill this.

"git grep FBINFO_HWACCEL_COPYAREA" shows me there are 32 more drivers
using acceleration under drivers/video/fbdev/.

> Plus because syzbot only runs on virtual hardware, and none of the
> drivers for that have acceleration, we'd remove a huge gap in testing.
> And there's no other even remotely comprehensive testing aside from
> syzbot.

That sounds like a great argument to remove all hardware drivers from
the kernel ;-)
Seriously, how hard can it be to add "software-accelerated" acceleration
hooks to drivers/video/fbdev/vfb.c, to enable syzbot to exercise the
core acceleration code paths?

> This patch here just disables the acceleration code by always
> redrawing when scrolling. The plan is that once this has been merged
> for well over a year in released kernels, we can start to go around
> and delete a lot of code.

Have you benchmarked the performance impact on traditional fbdev
drivers?

Thanks!

> v2:
> - Drop a few more unused local variables, somehow I missed the
> compiler warnings (Sam)
> - Fix typo in comment (Jiri)
> - add a todo entry for the cleanup (Thomas)
>
> v3: Remove more unused variables (0day)
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Jiri Slaby <jirislaby@kernel.org>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Peilin Ye <yepeilin.cs@gmail.com>
> Cc: George Kennedy <george.kennedy@oracle.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Peter Rosin <peda@axentia.se>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
> Documentation/gpu/todo.rst       | 18 +++++++++++++
> drivers/video/fbdev/core/fbcon.c | 45 ++++++--------------------------
> 2 files changed, 26 insertions(+), 37 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 6b224ef14455..bec99341a904 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -277,6 +277,24 @@ Contact: Daniel Vetter, Noralf Tronnes
>
> Level: Advanced
>
> +Garbage collect fbdev scrolling acceleration
> +--------------------------------------------
> +
> +Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
> +SCROLL_REDRAW. There's a ton of code this will allow us to remove:
> +- lots of code in fbcon.c
> +- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
> +  directly instead of the function table (with a switch on p->rotate)
> +- fb_copyarea is unused after this, and can be deleted from all drivers
> +
> +Note that not all acceleration code can be deleted, since clearing and cursor
> +support is still accelerated, which might be good candidates for further
> +deletion projects.
> +
> +Contact: Daniel Vetter
> +
> +Level: Intermediate
> +
> idr_init_base()
> ---------------
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index cef437817b0d..8d1ae973041a 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1033,7 +1033,7 @@ static void fbcon_init(struct vc_data *vc, int init)
> 	struct vc_data *svc = *default_mode;
> 	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
> 	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
> -	int cap, ret;
> +	int ret;
>
> 	if (WARN_ON(info_idx == -1))
> 	    return;
> @@ -1042,7 +1042,6 @@ static void fbcon_init(struct vc_data *vc, int init)
> 		con2fb_map[vc->vc_num] = info_idx;
>
> 	info = registered_fb[con2fb_map[vc->vc_num]];
> -	cap = info->flags;
>
> 	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
> 		logo_shown = FBCON_LOGO_DONTSHOW;
> @@ -1147,11 +1146,13 @@ static void fbcon_init(struct vc_data *vc, int init)
>
> 	ops->graphics = 0;
>
> -	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
> -	    !(cap & FBINFO_HWACCEL_DISABLED))
> -		p->scrollmode = SCROLL_MOVE;
> -	else /* default to something safe */
> -		p->scrollmode = SCROLL_REDRAW;
> +	/*
> +	 * No more hw acceleration for fbcon.
> +	 *
> +	 * FIXME: Garbage collect all the now dead code after sufficient time
> +	 * has passed.
> +	 */
> +	p->scrollmode = SCROLL_REDRAW;
>
> 	/*
> 	 *  ++guenther: console.c:vc_allocate() relies on initializing
> @@ -1961,45 +1962,15 @@ static void updatescrollmode(struct fbcon_display *p,
> {
> 	struct fbcon_ops *ops = info->fbcon_par;
> 	int fh = vc->vc_font.height;
> -	int cap = info->flags;
> -	u16 t = 0;
> -	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
> -				  info->fix.xpanstep);
> -	int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
> 	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> 	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
> 				   info->var.xres_virtual);
> -	int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
> -		divides(ypan, vc->vc_font.height) && vyres > yres;
> -	int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
> -		divides(ywrap, vc->vc_font.height) &&
> -		divides(vc->vc_font.height, vyres) &&
> -		divides(vc->vc_font.height, yres);
> -	int reading_fast = cap & FBINFO_READS_FAST;
> -	int fast_copyarea = (cap & FBINFO_HWACCEL_COPYAREA) &&
> -		!(cap & FBINFO_HWACCEL_DISABLED);
> -	int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
> -		!(cap & FBINFO_HWACCEL_DISABLED);
>
> 	p->vrows = vyres/fh;
> 	if (yres > (fh * (vc->vc_rows + 1)))
> 		p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> 	if ((yres % fh) && (vyres % fh < yres % fh))
> 		p->vrows--;
> -
> -	if (good_wrap || good_pan) {
> -		if (reading_fast || fast_copyarea)
> -			p->scrollmode = good_wrap ?
> -				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
> -		else
> -			p->scrollmode = good_wrap ? SCROLL_REDRAW :
> -				SCROLL_PAN_REDRAW;
> -	} else {
> -		if (reading_fast || (fast_copyarea && !fast_imageblit))
> -			p->scrollmode = SCROLL_MOVE;
> -		else
> -			p->scrollmode = SCROLL_REDRAW;
> -	}
> }
>
> #define PITCH(w) (((w) + 7) >> 3)
> -- 
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
