Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D691718D3
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 14:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3415B6E8CD;
	Thu, 27 Feb 2020 13:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A536E8CD
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 13:36:46 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j7JLF-0007aW-Ts; Thu, 27 Feb 2020 14:36:41 +0100
Message-ID: <a965d97ddf99d4a335582732dfac7b0948258632.camel@pengutronix.de>
Subject: Re: [PATCH 08/21] drm/etnaviv: remove check for return value of
 drm_debugfs function
From: Lucas Stach <l.stach@pengutronix.de>
To: Wambui Karuga <wambui.karugax@gmail.com>, daniel@ffwll.ch,
 airlied@linux.ie,  Russell King <linux+etnaviv@armlinux.org.uk>, Christian
 Gmeiner <christian.gmeiner@gmail.com>
Date: Thu, 27 Feb 2020 14:36:40 +0100
In-Reply-To: <20200227120232.19413-9-wambui.karugax@gmail.com>
References: <20200227120232.19413-1-wambui.karugax@gmail.com>
 <20200227120232.19413-9-wambui.karugax@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Do, 2020-02-27 at 15:02 +0300, Wambui Karuga wrote:
> Since commit 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_file only
> returns 0, and there is no need to check the return value.
> This change therefore removes the check and error handling in
> etnaviv_debugfs_init() and also makes the function return void.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6b43c1c94e8f..a39735316ca5 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -231,21 +231,11 @@ static struct drm_info_list etnaviv_debugfs_list[] = {
>  		{"ring", show_each_gpu, 0, etnaviv_ring_show},
>  };
>  
> -static int etnaviv_debugfs_init(struct drm_minor *minor)
> +static void etnaviv_debugfs_init(struct drm_minor *minor)
>  {
> -	struct drm_device *dev = minor->dev;
> -	int ret;
> -
> -	ret = drm_debugfs_create_files(etnaviv_debugfs_list,
> -			ARRAY_SIZE(etnaviv_debugfs_list),
> -			minor->debugfs_root, minor);
> -
> -	if (ret) {
> -		dev_err(dev->dev, "could not install etnaviv_debugfs_list\n");
> -		return ret;
> -	}
> -
> -	return ret;
> +	drm_debugfs_create_files(etnaviv_debugfs_list,
> +				 ARRAY_SIZE(etnaviv_debugfs_list),
> +				 minor->debugfs_root, minor);
>  }
>  #endif
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
