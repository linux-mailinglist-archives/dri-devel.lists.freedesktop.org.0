Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43A33877D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 09:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121236F494;
	Fri, 12 Mar 2021 08:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF50A6F494
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 08:36:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65DB364FC1;
 Fri, 12 Mar 2021 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615538204;
 bh=yt3pscgj+3rrO5ZHcR6FDbZn+AaiEY8X5A1yvX4PP5E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YQr3pVSTwTFULmBvvQVTsG4vsC+Lw9WtGrVAr1QhfYdBD/KiJ1fGVuSw9OFsFS/Lo
 ktiSmch3ml4MECTMhyl5s47/7oz0RbgG0oS261D/K/u2RavRAo2BV+MdllX859fRTH
 Fe4DB08lghN2oMqm/aZMEstbsj0ySgjSGcD7W07M=
Date: Fri, 12 Mar 2021 09:36:42 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Du Cheng <ducheng2@gmail.com>
Subject: Re: [PATCH] drivers: video: fbcon: fix NULL dereference in
 fbcon_cursor()
Message-ID: <YEsoGqJypKUdPoR+@kroah.com>
References: <20210312081421.452405-1-ducheng2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312081421.452405-1-ducheng2@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 12, 2021 at 04:14:21PM +0800, Du Cheng wrote:
> add null-check on function pointer before dereference on ops->cursor
> 
> Reported-by: syzbot+b67aaae8d3a927f68d20@syzkaller.appspotmail.com
> Signed-off-by: Du Cheng <ducheng2@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 44a5cd2f54cc..3406067985b1 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1333,6 +1333,9 @@ static void fbcon_cursor(struct vc_data *vc, int mode)
>  
>  	ops->cursor_flash = (mode == CM_ERASE) ? 0 : 1;
>  
> +	if (!ops->cursor)
> +		return;
> +
>  	ops->cursor(vc, info, mode, get_color(vc, info, c, 1),
>  		    get_color(vc, info, c, 0));
>  }
> -- 
> 2.27.0
> 

Is this the same issue reported here:
	https://lore.kernel.org/r/20210307105642.112572-1-h.shahbazi.git@gmail.com

And has syzbot testing shown that this fix does solve the issue?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
