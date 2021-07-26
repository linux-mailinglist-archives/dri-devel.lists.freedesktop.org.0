Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282BE3D59FA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 15:00:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B60E6E96D;
	Mon, 26 Jul 2021 13:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444B06E96D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 13:00:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E24260EB2;
 Mon, 26 Jul 2021 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627304431;
 bh=Gx/Vu6b5lzcfCCty2qy4h00ua5IDYhArV6JrOmQxNS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o9aDp1ctvx10cMjlC0OosTWfFezUbdRDRuQu1+MFYpb8tIhL5aOmRbXZBg1ZeHtO3
 riGsjq9UYMhSgJdfLhE0CFvjViQRi2xUL9a42dzMsO6zenIWRF2FDoTmRCZbKhcVZd
 qnUoC54u7kjQi2h8T2RlDDwYjiy1q4xjHpU81Nng=
Date: Mon, 26 Jul 2021 15:00:28 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?dGNzX2tlcm5lbCjohb7orq/kupHlhoXmoLjlvIDlj5HogIUp?=
 <tcs_kernel@tencent.com>
Subject: Re: [PATCH] fbcon: Out-Of-Bounds write in sys_imageblit, add range
 check
Message-ID: <YP6x7C1OJg2mVHAd@kroah.com>
References: <D5DF8A1C-5FA2-426B-AAB4-3199AEA0A02E@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D5DF8A1C-5FA2-426B-AAB4-3199AEA0A02E@tencent.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "ducheng2@gmail.com" <ducheng2@gmail.com>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "george.kennedy@oracle.com" <george.kennedy@oracle.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "yepeilin.cs@gmail.com" <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 11:32:37AM +0000, tcs_kernel(腾讯云内核开发者) wrote:
> yres and vyres can be controlled by user mode paramaters, and cause p->vrows to become a negative value. While this value be passed to real_y function, the ypos will be out of screen range.
> This is an out-of-bounds write bug.
> 
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 22bb3892f6bd..0970de46782f 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -1956,11 +1956,12 @@ static void updatescrollmode(struct fbcon_display *p,
>         int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>         int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
>                                    info->var.xres_virtual);
> +       int rows = vc->vc_rows;
>  
>         p->vrows = vyres/fh;
> -       if (yres > (fh * (vc->vc_rows + 1)))
> -               p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
> -       if ((yres % fh) && (vyres % fh < yres % fh))
> +       if ((yres > (fh * (rows + 1))) && (vyres >= (yres - (fh * rows))) && p->vrows)
> +               p->vrows -= (yres - (fh * rows)) / fh;
> +       if ((yres % fh) && (vyres % fh < yres % fh) && p->vrows)
>                 p->vrows--;
>  }
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
