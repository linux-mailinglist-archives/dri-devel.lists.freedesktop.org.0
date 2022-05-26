Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF295359E8
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 09:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F64E10EE50;
	Fri, 27 May 2022 07:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 518 seconds by postgrey-1.36 at gabe;
 Thu, 26 May 2022 20:11:50 UTC
Received: from 0.smtp.remotehost.it (0.smtp.remotehost.it [213.190.28.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F9610E61F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 20:11:50 +0000 (UTC)
Message-ID: <672f03a9-9ffa-c2f8-a369-e958c79a57f3@0.smtp.remotehost.it>
Date: Thu, 26 May 2022 22:03:05 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] fbdev: vesafb: Fix a use-after-free due early fb_info
 cleanup
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220526194752.307192-1-javierm@redhat.com>
From: Pascal Ernster <dri-devel@hardfalcon.net>
In-Reply-To: <20220526194752.307192-1-javierm@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 27 May 2022 07:09:54 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[2022-05-26 21:47:52] Javier Martinez Canillas:
> Commit b3c9a924aab6 ("fbdev: vesafb: Cleanup fb_info in .fb_destroy rather
> than .remove") fixed a use-after-free error due the vesafb driver freeing
> the fb_info in the .remove handler instead of doing it in .fb_destroy.
> 
> This can happen if the .fb_destroy callback is executed after the .remove
> callback, since the former tries to access a pointer freed by the latter.
> 
> But that change didn't take into account that another possible scenario is
> that .fb_destroy is called before the .remove callback. For example, if no
> process has the fbdev chardev opened by the time the driver is removed.
> 
> If that's the case, fb_info will be freed when unregister_framebuffer() is
> called, making the fb_info pointer accessed in vesafb_remove() after that
> to no longer be valid.
> 
> To prevent that, move the expression containing the info->par to happen
> before the unregister_framebuffer() function call.
> 
> Fixes: b3c9a924aab6 ("fbdev: vesafb: Cleanup fb_info in .fb_destroy rather than .remove")
> Reported-by: Pascal Ernster <dri-devel@hardfalcon.net>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Tested on a bare metal machine and on a test VM that had both crashed 
when booting a kernel lacking this patch.
Again, thanks a lot for the quick fix! :)

Tested-by: Pascal Ernster <dri-devel@hardfalcon.net>


> ---
> 
>   drivers/video/fbdev/vesafb.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index e25e8de5ff67..929d4775cb4b 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -490,11 +490,12 @@ static int vesafb_remove(struct platform_device *pdev)
>   {
>   	struct fb_info *info = platform_get_drvdata(pdev);
>   
> -	/* vesafb_destroy takes care of info cleanup */
> -	unregister_framebuffer(info);
>   	if (((struct vesafb_par *)(info->par))->region)
>   		release_region(0x3c0, 32);
>   
> +	/* vesafb_destroy takes care of info cleanup */
> +	unregister_framebuffer(info);
> +
>   	return 0;
>   }
>   

