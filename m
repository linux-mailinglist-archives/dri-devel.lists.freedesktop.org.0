Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6C9162D23
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 18:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8FC6EA56;
	Tue, 18 Feb 2020 17:38:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B43B6E37F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 17:38:10 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1j46ov-00013U-MI; Tue, 18 Feb 2020 18:38:05 +0100
Message-ID: <71275b167f41ca424216c2bda0459bf305a1162c.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: remove check for return value of
 drm_debugfs function
From: Lucas Stach <l.stach@pengutronix.de>
To: Wambui Karuga <wambui.karugax@gmail.com>, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, airlied@linux.ie, daniel@ffwll.ch
Date: Tue, 18 Feb 2020 18:38:04 +0100
In-Reply-To: <20200218172821.18378-4-wambui.karugax@gmail.com>
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-4-wambui.karugax@gmail.com>
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
Cc: gregkh@linuxfoundation.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Di, 2020-02-18 at 20:28 +0300, Wambui Karuga wrote:
> As there is no need to check the return value if
> drm_debugfs_create_files,

And here is where the commit message skips a very important
information: Since 987d65d01356 (drm: debugfs: make
drm_debugfs_create_files() never fail) this function never returns
anything other than 0, so there is no point in checking. This
information should be in the commit message, so the reviewer doesn't
need to look up this fact in the git history.

Regards,
Lucas

>  remove the check and error handling in
> etnaviv_debugfs_init and have the function return 0 directly.
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> index 6b43c1c94e8f..a65d30a48a9d 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> @@ -233,19 +233,11 @@ static struct drm_info_list
> etnaviv_debugfs_list[] = {
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
> -		dev_err(dev->dev, "could not install
> etnaviv_debugfs_list\n");
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
