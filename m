Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE51365312
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 09:19:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 015996E043;
	Tue, 20 Apr 2021 07:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C285A6E043
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 07:19:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DD2F60C40;
 Tue, 20 Apr 2021 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618903158;
 bh=pktyu9GGKjTObq0rU5/41yUklfwS8kQ21/mqPt8V+QM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hP5I0a8Z6H63iP4GVjgKXs6PS4lmyGeoOI68kBxEG36thouvMInr+buISN7xUY51c
 z03bn/K0dn21GscboQv7l7voWkHt6cw6RQeOwQEVmo8FxRzOyYnpOTMbd8DiMd384D
 wbytYch/wqtQ04/LADGgGHxXABWN3eAW3h6c+jDs=
Date: Tue, 20 Apr 2021 09:19:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Aditya Pakki <pakki001@umn.edu>
Subject: Re: [PATCH] video: fbdev: sm501fb: Fix deallocation of buffers order
Message-ID: <YH6AdPxOE8d51pXy@kroah.com>
References: <20210406233519.2205389-1-pakki001@umn.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406233519.2205389-1-pakki001@umn.edu>
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
Cc: linux-fbdev@vger.kernel.org, kjlu@umn.edu,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 06, 2021 at 06:35:17PM -0500, Aditya Pakki wrote:
> The resource release in sm501fb_remove() is not in the inverse order of
> sm501fb_probe(), for the buffers. Release the info object after
> deallocating the buffers.
> 
> Signed-off-by: Aditya Pakki <pakki001@umn.edu>
> ---
>  drivers/video/fbdev/sm501fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
> index 6a52eba64559..4c32c9e88850 100644
> --- a/drivers/video/fbdev/sm501fb.c
> +++ b/drivers/video/fbdev/sm501fb.c
> @@ -2060,11 +2060,11 @@ static int sm501fb_remove(struct platform_device *pdev)
>  		unregister_framebuffer(fbinfo_pnl);
>  
>  	sm501fb_stop(info);
> -	kfree(info);
>  
>  	framebuffer_release(fbinfo_pnl);
>  	framebuffer_release(fbinfo_crt);
>  
> +	kfree(info);
>  	return 0;
>  }
>  
> -- 
> 2.25.1
> 

There is no function change here at all, please stop it with pointless
patches.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
