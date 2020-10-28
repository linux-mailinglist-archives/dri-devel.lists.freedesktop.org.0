Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BBB29D18B
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 19:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CA189E2B;
	Wed, 28 Oct 2020 18:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3637D89E2B;
 Wed, 28 Oct 2020 18:50:36 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 21B6A80617;
 Wed, 28 Oct 2020 19:50:30 +0100 (CET)
Date: Wed, 28 Oct 2020 19:50:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] fbcon: Disable accelerated scrolling
Message-ID: <20201028185029.GA683411@ravnborg.org>
References: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028160600.3752105-1-daniel.vetter@ffwll.ch>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fu7ymmwf c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=kYlPfVeDKtV2c73IBp4A:9 a=CjuIK1q_8ugA:10
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, George Kennedy <george.kennedy@oracle.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Oct 28, 2020 at 05:06:00PM +0100, Daniel Vetter wrote:
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
>   y/xpanning
> - gma500, but that is getting deleted now for the GTT remapper trick,
>   and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
>   flag, so unused (and could be deleted already I think).
> 
> No other driver supportes accelerated fbcon. And fbcon is the only
> user of this accel code (it's not exposed as uapi through ioctls),
> which means we could garbage collect fairly enormous amounts of code
> if we kill this.
> 
> Plus because syzbot only runs on virtual hardware, and none of the
> drivers for that have acceleration, we'd remove a huge gap in testing.
> And there's no other even remotely comprehensive testing aside from
> syzbot.
> 
> This patch here just disables the acceleration code by always
> redrawing when scrolling. The plan is that once this has been merged
> for well over a year in released kernels, we can start to go around
> and delete a lot of code.

See below for a warning fix.

Some figures from trying to toss accel code out from a few fbdev drivers:

 drivers/video/fbdev/cirrusfb.c | 300 +----------------------------------------
 1 file changed, 4 insertions(+), 296 deletions(-)

 drivers/video/fbdev/aty/radeon_accel.c | 174 ---------------------------------
 drivers/video/fbdev/aty/radeon_base.c  |  43 ++------
 drivers/video/fbdev/aty/radeon_pm.c    |   7 --
 drivers/video/fbdev/aty/radeonfb.h     |   3 -
 4 files changed, 7 insertions(+), 220 deletions(-)

This may open up the discussion if the right course of action would be
to drop the drivers in favour of drm counterparts - but thats another
story.

	Sam

> @@ -1961,7 +1963,6 @@ static void updatescrollmode(struct fbcon_display *p,
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  	int fh = vc->vc_font.height;
> -	int cap = info->flags;
>  	u16 t = 0;
>  	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
>  				  info->fix.xpanstep);
> @@ -1969,37 +1970,12 @@ static void updatescrollmode(struct fbcon_display *p,
>  	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>  	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>  				   info->var.xres_virtual);
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

Some bot will likely tell you that this causes warnings.
At least it did in my sparc64 build.

Fix:

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 398914e035e9..e8b009c621d8 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2150,10 +2150,6 @@ static void updatescrollmode(struct fbcon_display *p,
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	int fh = vc->vc_font.height;
-	u16 t = 0;
-	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
-				  info->fix.xpanstep);
-	int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
 	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
 				   info->var.xres_virtual);



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
