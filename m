Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93034439EF6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C036E1E6;
	Mon, 25 Oct 2021 19:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DCE6E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:07:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C645C60E08;
 Mon, 25 Oct 2021 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1635188849;
 bh=QkD0aIubb77MfLaXkA4RVCyqVSSVXP4CNLjP63IkeVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DnQBmEObnLjI/kHoynHgptbLC0L02jt4LCdyS243gJXYt4vnvNZH6UY6PEbgoGTVG
 5KdBh4stQvZ3HONTL7xdIip44r91p1GA6+gDA1AYLFmGXeeRmAWIckxf8z8xuw2JSi
 uJO2d46gy/OVFAn9XCzstEo1zMAssIl4zYYHXs58=
Date: Mon, 25 Oct 2021 21:07:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: George Kennedy <george.kennedy@oracle.com>
Cc: tzimmermann@suse.de, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide
 by zero
Message-ID: <YXcAbXJfg/jKCo5h@kroah.com>
References: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
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

On Mon, Oct 25, 2021 at 02:01:30PM -0500, George Kennedy wrote:
> Do a sanity check on pixclock value before using it as a divisor.
> 
> Syzkaller reported a divide error in cirrusfb_check_pixclock.
> 
> divide error: 0000 [#1] SMP KASAN PTI
> CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
> RIP: 0010:cirrusfb_check_var+0x6f1/0x1260
> 
> Call Trace:
>  fb_set_var+0x398/0xf90
>  do_fb_ioctl+0x4b8/0x6f0
>  fb_ioctl+0xeb/0x130
>  __x64_sys_ioctl+0x19d/0x220
>  do_syscall_64+0x3a/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> ---
>  drivers/video/fbdev/cirrusfb.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
> index 93802ab..099ddcb 100644
> --- a/drivers/video/fbdev/cirrusfb.c
> +++ b/drivers/video/fbdev/cirrusfb.c
> @@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
>  	struct cirrusfb_info *cinfo = info->par;
>  	unsigned maxclockidx = var->bits_per_pixel >> 3;
>  
> +	if (!var->pixclock)
> +		return -EINVAL;

Shouldn't you be checking further up the call chain where this got set
to 0?

What logic allows this to be a valid value?  What about all other fb
drivers?

thanks,

greg k-h
