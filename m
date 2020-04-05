Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392A519EA56
	for <lists+dri-devel@lfdr.de>; Sun,  5 Apr 2020 12:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA5F6E0DB;
	Sun,  5 Apr 2020 10:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D5996E0DB;
 Sun,  5 Apr 2020 10:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/hp6TTjug/gxDGbzE5XaxuyPur0U2kqvbRKr5DBowV4=; b=fj08DIFON7xuEN1bsFrwdoIZTh
 5MQroxSS2nMIiQYRAWhDRXgD5kghg/LLQce3wE950YGyXddiHyLx8w2+FaCfuUtZ8PjhaiQwu5xtr
 Z5SgLX0U+hhctzJ1H40qpzMinFlaikAUCE5jSiDLfH+evKMIh0OiRjCWNP0tglAVqamx5PYOCRRFL
 TLNU2qJax/TtXjjVmP5zvoZYTWE+NJiLrGgHfxnJDMbCQEdZ1sbAzbOrLns8Ek844p1reWYvY1WQa
 XPxutG1oYQeBbsvqtgPpYgCAy/BP13mPA3iEVXlwIzkXUyx0N5AHPtg/KbkPBIjGJRJgRG41SmqvL
 aV3lt4sQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:51701
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jL2M4-0006go-En; Sun, 05 Apr 2020 12:18:16 +0200
Subject: Re: [PATCH 15/44] drm/udl: Use demv_drm_dev_alloc
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-16-daniel.vetter@ffwll.ch>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <3e3f7726-f1d2-c29f-4fc8-c42002e7da13@tronnes.org>
Date: Sun, 5 Apr 2020 12:18:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-16-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 03.04.2020 15.57, skrev Daniel Vetter:
> Also init the fbdev emulation before we register the device, that way
> we can rely on the auto-cleanup and simplify the probe error code even
> more.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 36 +++++++++++------------------------
>  1 file changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 1ce2d865c36d..4ba5149fdd57 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -57,27 +57,20 @@ static struct udl_device *udl_driver_create(struct usb_interface *interface)
>  	struct udl_device *udl;
>  	int r;
>  
> -	udl = kzalloc(sizeof(*udl), GFP_KERNEL);
> -	if (!udl)
> -		return ERR_PTR(-ENOMEM);
> -
> -	r = drm_dev_init(&udl->drm, &driver, &interface->dev);
> -	if (r) {
> -		kfree(udl);
> -		return ERR_PTR(r);
> -	}
> +	udl = devm_drm_dev_alloc(&interface->dev, &driver,
> +				 struct udl_device, drm);
> +	if (IS_ERR(udl))
> +		return udl;
>  
>  	udl->udev = udev;
>  	udl->drm.dev_private = udl;
> -	drmm_add_final_kfree(&udl->drm, udl);
>  
>  	r = udl_init(udl);
> -	if (r) {
> -		drm_dev_put(&udl->drm);
> +	if (r)
>  		return ERR_PTR(r);
> -	}
>  
>  	usb_set_intfdata(interface, udl);
> +
>  	return udl;
>  }
>  
> @@ -91,23 +84,17 @@ static int udl_usb_probe(struct usb_interface *interface,
>  	if (IS_ERR(udl))
>  		return PTR_ERR(udl);
>  
> +	r = drm_fbdev_generic_setup(&udl->drm, 0);

It doesn't feel right to have a client open the device before the DRM
device itself is registered. I would prefer to keep it where it is but
ignore any errors. A failing client shouldn't prevent the driver from
probing. drm_fbdev_generic_setup() do print errors if it fails. So yeah,
in hindsight I should have made drm_fbdev_generic_setup() return void.

Noralf.

> +	if (r)
> +		return r;
> +
>  	r = drm_dev_register(&udl->drm, 0);
>  	if (r)
> -		goto err_free;
> +		return r;
>  
>  	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
>  
> -	r = drm_fbdev_generic_setup(&udl->drm, 0);
> -	if (r)
> -		goto err_drm_dev_unregister;
> -
>  	return 0;
> -
> -err_drm_dev_unregister:
> -	drm_dev_unregister(&udl->drm);
> -err_free:
> -	drm_dev_put(&udl->drm);
> -	return r;
>  }
>  
>  static void udl_usb_disconnect(struct usb_interface *interface)
> @@ -117,7 +104,6 @@ static void udl_usb_disconnect(struct usb_interface *interface)
>  	drm_kms_helper_poll_fini(dev);
>  	udl_drop_usb(dev);
>  	drm_dev_unplug(dev);
> -	drm_dev_put(dev);
>  }
>  
>  /*
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
