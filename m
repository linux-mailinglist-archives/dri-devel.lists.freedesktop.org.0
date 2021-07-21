Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4D83D0F10
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 15:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9346E982;
	Wed, 21 Jul 2021 13:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF5F6E89C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:03:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 113a3e57-ea24-11eb-8d1a-0050568cd888;
 Wed, 21 Jul 2021 13:03:39 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6B1EF194B7B;
 Wed, 21 Jul 2021 15:03:42 +0200 (CEST)
Date: Wed, 21 Jul 2021 15:03:24 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH] video: fbdev: neofb: add a check against divide error
Message-ID: <YPgbHMtLQqb1kP0l@ravnborg.org>
References: <1626871424-27708-1-git-send-email-zheyuma97@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626871424-27708-1-git-send-email-zheyuma97@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Zheyu,
On Wed, Jul 21, 2021 at 12:43:44PM +0000, Zheyu Ma wrote:
> The userspace program could pass any values to the driver through
> ioctl() interface. If the driver doesn't check the value of 'pixclock',
> it may cause divide error because of the 'PICOS2KHZ' macro.
> 
> Fix this by checking whether 'pixclock' is zero first.
> 
> The following log reveals it:
> 
> [   53.093806] divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> [   53.093838] CPU: 3 PID: 11763 Comm: hang Not tainted 5.14.0-rc2-00478-g2734d6c1b1a0 #215
> [   53.093859] RIP: 0010:neofb_check_var+0x80/0xe50
> [   53.093951] Call Trace:
> [   53.093956]  ? neofb_setcolreg+0x2b0/0x2b0
> [   53.093968]  fb_set_var+0x2e4/0xeb0
> [   53.093977]  ? fb_blank+0x1a0/0x1a0
> [   53.093984]  ? lock_acquire+0x1ef/0x530
> [   53.093996]  ? lock_release+0x810/0x810
> [   53.094005]  ? lock_is_held_type+0x100/0x140
> [   53.094016]  ? ___might_sleep+0x1ee/0x2d0
> [   53.094028]  ? __mutex_lock+0x620/0x1190
> [   53.094036]  ? do_fb_ioctl+0x313/0x700
> [   53.094044]  ? mutex_lock_io_nested+0xfa0/0xfa0
> [   53.094051]  ? __this_cpu_preempt_check+0x1d/0x30
> [   53.094060]  ? _raw_spin_unlock_irqrestore+0x46/0x60
> [   53.094069]  ? lockdep_hardirqs_on+0x59/0x100
> [   53.094076]  ? _raw_spin_unlock_irqrestore+0x46/0x60
> [   53.094085]  ? trace_hardirqs_on+0x6a/0x1c0
> [   53.094096]  do_fb_ioctl+0x31e/0x700
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>

I looked if we could move this check up to the caller, but it seems
better to keep it per driver.
Added the patch to drm-misc-next, it will appera in -next in around one
week.

	Sam

> ---
>  drivers/video/fbdev/neofb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
> index c0f4f402da3f..966df2a07360 100644
> --- a/drivers/video/fbdev/neofb.c
> +++ b/drivers/video/fbdev/neofb.c
> @@ -585,7 +585,7 @@ neofb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>  
>  	DBG("neofb_check_var");
>  
> -	if (PICOS2KHZ(var->pixclock) > par->maxClock)
> +	if (var->pixclock && PICOS2KHZ(var->pixclock) > par->maxClock)
>  		return -EINVAL;
>  
>  	/* Is the mode larger than the LCD panel? */
> -- 
> 2.17.6
