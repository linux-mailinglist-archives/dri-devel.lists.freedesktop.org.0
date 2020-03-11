Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A496181E2B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 17:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0337F894A7;
	Wed, 11 Mar 2020 16:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BC3894A7
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 16:44:34 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jC4T9-0003M8-IN; Wed, 11 Mar 2020 17:44:31 +0100
Message-ID: <1b7e79c25704c7fc78b09bb99f6920e62ffed7c6.camel@pengutronix.de>
Subject: Re: [PATCH v2 07/17] drm/etnaviv: remove check for return value of
 drm_debugfs_create_files()
From: Lucas Stach <l.stach@pengutronix.de>
To: Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie,
 daniel@ffwll.ch,  Russell King <linux+etnaviv@armlinux.org.uk>, Christian
 Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 11 Mar 2020 17:44:29 +0100
In-Reply-To: <20200310133121.27913-8-wambui.karugax@gmail.com>
References: <20200310133121.27913-1-wambui.karugax@gmail.com>
 <20200310133121.27913-8-wambui.karugax@gmail.com>
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

On Di, 2020-03-10 at 16:31 +0300, Wambui Karuga wrote:
> Since commit 987d65d01356 (drm: debugfs: make
> drm_debugfs_create_files() never fail), drm_debugfs_create_files() never
> fails and only returns 0. Therefore, remove the unnecessary check of its
> return value and error handling in etnaviv_debugfs_init() and have the
> function return 0 directly.
> 
> v2: have etnaviv_debugfs_init() return 0 instead of void to ensure
> individual compilation and avoid build breakage.
> 
> References: https://lists.freedesktop.org/archives/dri-devel/2020-February/257183.html
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Acked-by: Lucas Stach <l.stach@pengutronix.de>

> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6b43c1c94e8f..a65d30a48a9d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -233,19 +233,11 @@ static struct drm_info_list etnaviv_debugfs_list[] = {
>  
>  static int etnaviv_debugfs_init(struct drm_minor *minor)
>  {
> -	struct drm_device *dev = minor->dev;
> -	int ret;
> -
> -	ret = drm_debugfs_create_files(etnaviv_debugfs_list,
> -			ARRAY_SIZE(etnaviv_debugfs_list),
> -			minor->debugfs_root, minor);
> +	drm_debugfs_create_files(etnaviv_debugfs_list,
> +				 ARRAY_SIZE(etnaviv_debugfs_list),
> +				 minor->debugfs_root, minor);
>  
> -	if (ret) {
> -		dev_err(dev->dev, "could not install etnaviv_debugfs_list\n");
> -		return ret;
> -	}
> -
> -	return ret;
> +	return 0;
>  }
>  #endif
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
