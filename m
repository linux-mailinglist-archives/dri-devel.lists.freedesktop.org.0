Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D881171707
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 13:23:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596126EC94;
	Thu, 27 Feb 2020 12:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD6EA6EC94
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 12:23:16 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E6212468E;
 Thu, 27 Feb 2020 12:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582806196;
 bh=2zPnlV0ZH+D2gKvuwb636d2VVVPT90Hpg9RA/haF8ww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RhGbIY7R/Y/9wdj2JrTB0IWT+V6WY/fdbRIzuk2c74jsyICgj1YC/bl4NFDTanvoT
 Sf62Zbx9p/M70y4IvsJ1I2E+EiIM2VzeKReKfieuL69ecKOGAmYFM3LsIALK5cKU2F
 L5mwXjPTJeO8SQFYb3b4n9yAiyShX8kIbZNF/Xi4=
Date: Thu, 27 Feb 2020 13:23:13 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Subject: Re: [PATCH 02/21] drm: convert the drm_driver.debugfs_init() hook to
 return void.
Message-ID: <20200227122313.GB896418@kroah.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-3-wambui.karugax@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227120232.19413-3-wambui.karugax@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 03:02:13PM +0300, Wambui Karuga wrote:
> As a result of commit 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail) and changes to various debugfs
> functions in drm/core and across various drivers, there is no need for
> the drm_driver.debugfs_init() hook to have a return value. Therefore,
> declare it as void.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  include/drm/drm_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 97109df5beac..c6ae888c672b 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -323,7 +323,7 @@ struct drm_driver {
>  	 *
>  	 * Allows drivers to create driver-specific debugfs files.
>  	 */
> -	int (*debugfs_init)(struct drm_minor *minor);
> +	void (*debugfs_init)(struct drm_minor *minor);


Doesn't this patch break the build, or at least, cause lots of build
warnings to happen?

Fixing it all up later is good, but I don't think you want to break
things at this point in the series.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
