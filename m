Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33063D5AAA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 15:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BB86E8FB;
	Mon, 26 Jul 2021 13:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD646E8FB
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 13:45:27 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id c518c79b-ee17-11eb-8d1a-0050568cd888;
 Mon, 26 Jul 2021 13:45:42 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E4582194B7A;
 Mon, 26 Jul 2021 15:45:42 +0200 (CEST)
Date: Mon, 26 Jul 2021 15:45:21 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: =?utf-8?B?dGNzX2tlcm5lbCjohb7orq/kupHlhoXmoLjlvIDlj5HogIUp?=
 <tcs_kernel@tencent.com>
Subject: Re: [PATCH] fbcon: Out-Of-Bounds write in sys_imageblit, add range
 check
Message-ID: <YP68cQ4WVVusCv0N@ravnborg.org>
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "george.kennedy@oracle.com" <george.kennedy@oracle.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "yepeilin.cs@gmail.com" <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Mon, Jul 26, 2021 at 11:32:37AM +0000, tcs_kernel(腾讯云内核开发者) wrote:
> yres and vyres can be controlled by user mode paramaters, and cause p->vrows to become a negative value. While this value be passed to real_y function, the ypos will be out of screen range.
> This is an out-of-bounds write bug.

Please investigate if you can validate the user-supplied values for yres
and vyres earlier so the code never reaches the below statements.
This would also make it much more explicit what is going on.

	Sam

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
