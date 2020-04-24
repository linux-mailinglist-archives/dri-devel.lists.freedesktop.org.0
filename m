Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92051B78A4
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 16:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0176E958;
	Fri, 24 Apr 2020 14:56:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4457F6E471;
 Fri, 24 Apr 2020 14:56:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0815420035;
 Fri, 24 Apr 2020 16:56:02 +0200 (CEST)
Date: Fri, 24 Apr 2020 16:55:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 11/59] drm/udl: Use devm_drm_dev_alloc
Message-ID: <20200424145556.GA20856@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-12-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-12-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ULXz4hXy c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=SJz97ENfAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=2YAvaSaLqpQgbBnbYXwA:9
 a=wPNLvfGTeEIA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=vFet0B0WnEQeilDPIY6i:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Wed, Apr 15, 2020 at 09:39:46AM +0200, Daniel Vetter wrote:
> Also init the fbdev emulation before we register the device, that way
> we can rely on the auto-cleanup and simplify the probe error code even
> more.
> =

> v2: Rebase on top of Thomas' patches to remove the return value from
> drm_fbdev_generic_setup()

with the rebase the changelog in confusing as this patch does nothing of
what is described in the changelog.
Only the title (that is in convinently not available when replying to
email) describes what this patch does.

With the changelog properly adjusted:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> =

> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 9cc6d075cb40..523f60e02a85 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -57,27 +57,20 @@ static struct udl_device *udl_driver_create(struct us=
b_interface *interface)
>  	struct udl_device *udl;
>  	int r;
>  =

> -	udl =3D kzalloc(sizeof(*udl), GFP_KERNEL);
> -	if (!udl)
> -		return ERR_PTR(-ENOMEM);
> -
> -	r =3D drm_dev_init(&udl->drm, &driver, &interface->dev);
> -	if (r) {
> -		kfree(udl);
> -		return ERR_PTR(r);
> -	}
> +	udl =3D devm_drm_dev_alloc(&interface->dev, &driver,
> +				 struct udl_device, drm);
> +	if (IS_ERR(udl))
> +		return udl;
>  =

>  	udl->udev =3D udev;
>  	udl->drm.dev_private =3D udl;
> -	drmm_add_final_kfree(&udl->drm, udl);
>  =

>  	r =3D udl_init(udl);
> -	if (r) {
> -		drm_dev_put(&udl->drm);
> +	if (r)
>  		return ERR_PTR(r);
> -	}
>  =

>  	usb_set_intfdata(interface, udl);
> +
>  	return udl;
>  }
>  =

> @@ -93,17 +86,13 @@ static int udl_usb_probe(struct usb_interface *interf=
ace,
>  =

>  	r =3D drm_dev_register(&udl->drm, 0);
>  	if (r)
> -		goto err_free;
> +		return r;
>  =

>  	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
>  =

>  	drm_fbdev_generic_setup(&udl->drm, 0);
>  =

>  	return 0;
> -
> -err_free:
> -	drm_dev_put(&udl->drm);
> -	return r;
>  }
>  =

>  static void udl_usb_disconnect(struct usb_interface *interface)
> @@ -113,7 +102,6 @@ static void udl_usb_disconnect(struct usb_interface *=
interface)
>  	drm_kms_helper_poll_fini(dev);
>  	udl_drop_usb(dev);
>  	drm_dev_unplug(dev);
> -	drm_dev_put(dev);
>  }
>  =

>  /*
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
