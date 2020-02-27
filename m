Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF4E1729CF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 21:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7D289319;
	Thu, 27 Feb 2020 20:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E7E89319;
 Thu, 27 Feb 2020 20:57:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 56566804E0;
 Thu, 27 Feb 2020 21:57:28 +0100 (CET)
Date: Thu, 27 Feb 2020 21:57:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 06/51] drm/udl: Use drmm_add_final_kfree
Message-ID: <20200227205727.GB29498@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-7-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-7-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=P1BnusSwAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=SJz97ENfAAAA:8
 a=7gkXJVJtAAAA:8 a=N7rU1HuOYSZEaKf2LHIA:9 a=wPNLvfGTeEIA:10
 a=D0XLA9XvdZm18NrgonBM:22 a=vFet0B0WnEQeilDPIY6i:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
 Emil Velikov <emil.l.velikov@gmail.com>, m.felsch@pengutronix.de,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:14:37PM +0100, Daniel Vetter wrote:
> With this we can drop the final kfree from the release function.
> =

> v2: We need drm_dev_put to unroll the driver creation (once
> drm_dev_init and drmm_add_final_kfree suceeded), otherwise
> the drmm_ magic doesn't happen.
> =

> v3: Actually squash in the fixup (Laurent).
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---

Acked-by: Sam Ravnborg <sam@ravnborg.org>
>  drivers/gpu/drm/udl/udl_drv.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index e6c1cd77d4d4..6a5594946096 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_print.h>
> @@ -38,7 +39,6 @@ static void udl_driver_release(struct drm_device *dev)
>  	udl_fini(dev);
>  	udl_modeset_cleanup(dev);
>  	drm_dev_fini(dev);
> -	kfree(dev);
>  }
>  =

>  static struct drm_driver driver =3D {
> @@ -77,11 +77,11 @@ static struct udl_device *udl_driver_create(struct us=
b_interface *interface)
>  =

>  	udl->udev =3D udev;
>  	udl->drm.dev_private =3D udl;
> +	drmm_add_final_kfree(&udl->drm, udl);
>  =

>  	r =3D udl_init(udl);
>  	if (r) {
> -		drm_dev_fini(&udl->drm);
> -		kfree(udl);
> +		drm_dev_put(&udl->drm);
>  		return ERR_PTR(r);
>  	}
>  =

> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
