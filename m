Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852F622F98F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 21:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A47689DC0;
	Mon, 27 Jul 2020 19:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E721389DC0;
 Mon, 27 Jul 2020 19:55:12 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F8622072E;
 Mon, 27 Jul 2020 19:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595879712;
 bh=Eihzj9yY4QhXjvJiGtP5cGNyIPMsxel19lv/3GimdaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cIeEb6PNzza0iwI8PApMML3SFVNmb2l/86jCWN8qMkxnxHpVLbGi7g8vqsCSG3l6l
 GwATFf6nweneG2V8IPskGfFQsKFd1rCDcXOFfZhUA4THOMmJGpjDEf9b3MEHCHLue3
 uvbmXVlHia5Frt1tZY/Dc96rxzLpiSWN5QFPMTm8=
Date: Mon, 27 Jul 2020 21:55:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Steve Cohen <cohens@codeaurora.org>
Subject: Re: [PATCH V2] drm: hold gem reference until object is no longer
 accessed
Message-ID: <20200727195507.GA240123@kroah.com>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
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
Cc: adelva@google.com, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 pdhaval@codeaurora.org, seanpaul@chromium.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
> A use-after-free in drm_gem_open_ioctl can happen if the
> GEM object handle is closed between the idr lookup and
> retrieving the size from said object since a local reference
> is not being held at that point. Hold the local reference
> while the object can still be accessed to fix this and
> plug the potential security hole.
> 
> Signed-off-by: Steve Cohen <cohens@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_gem.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 7bf628e..ee2058a 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>   * @file_priv: drm file-private structure
>   *
>   * Open an object using the global name, returning a handle and the size.
> - *
> - * This handle (of course) holds a reference to the object, so the object
> - * will not go away until the handle is deleted.
>   */
>  int
>  drm_gem_open_ioctl(struct drm_device *dev, void *data,
> @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
>  
>  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
>  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
> -	drm_gem_object_put_unlocked(obj);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	args->handle = handle;
>  	args->size = obj->size;
>  
> -	return 0;
> +err:
> +	drm_gem_object_put_unlocked(obj);
> +	return ret;
>  }
>  
>  /**

As this seems to fix an important issue, any reason it wasn't cc: stable
on it so that it gets backported properly?

How about a "Fixes:" tag so that we know what commit id it fixes so we
know how far back to backport things?

And a hint to the maintainers that "this is an issue that needs to get
into 5.8-final, it shouldn't wait around longer please" would have also
been nice to see :)

And what chagned from v1, aren't you supposed to list that somewhere in
the changelog or below the --- line (never remember what DRM drivers
want here...)

Care to send a v3?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
