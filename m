Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F252F1729D7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 22:01:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048E16E97C;
	Thu, 27 Feb 2020 21:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144FE6E97A;
 Thu, 27 Feb 2020 21:01:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9A499804F6;
 Thu, 27 Feb 2020 22:01:03 +0100 (CET)
Date: Thu, 27 Feb 2020 22:01:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Message-ID: <20200227210102.GC29498@ravnborg.org>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-10-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227181522.2711142-10-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=SJz97ENfAAAA:8 a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8
 a=Z4Rwk6OoAAAA:8 a=szsXqpMNSBKf4TzjhrUA:9 a=wPNLvfGTeEIA:10
 a=vFet0B0WnEQeilDPIY6i:22 a=cvBusfyB2V15izCimMoJ:22
 a=E9Po1WZjFZOl8hwRPBS3:22 a=HkZW87K1Qel5hWWM3VKY:22
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
 m.felsch@pengutronix.de, DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 07:14:40PM +0100, Daniel Vetter wrote:
> With this we can drop the final kfree from the release function.
> =

> I also noticed that cirrus forgot to call drm_dev_fini().
> =

> v2: Don't call kfree(cirrus) after we've handed overship of that to
> drm_device and the drmm_ stuff.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: virtualization@lists.linux-foundation.org

Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cir=
rus.c
> index d2ff63ce8eaf..2232556ce34c 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -35,6 +35,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_ioctl.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_simple_kms_helper.h>
> @@ -527,10 +528,8 @@ static void cirrus_mode_config_init(struct cirrus_de=
vice *cirrus)
>  =

>  static void cirrus_release(struct drm_device *dev)
>  {
> -	struct cirrus_device *cirrus =3D dev->dev_private;
> -
>  	drm_mode_config_cleanup(dev);
> -	kfree(cirrus);
> +	drm_dev_fini(dev);
>  }
>  =

>  DEFINE_DRM_GEM_FOPS(cirrus_fops);
> @@ -575,9 +574,12 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  =

>  	dev =3D &cirrus->dev;
>  	ret =3D drm_dev_init(dev, &cirrus_driver, &pdev->dev);
> -	if (ret)
> -		goto err_free_cirrus;
> +	if (ret) {
> +		kfree(cirrus);
> +		goto err_pci_release;
> +	}
>  	dev->dev_private =3D cirrus;
> +	drmm_add_final_kfree(dev, cirrus);
>  =

>  	ret =3D -ENOMEM;
>  	cirrus->vram =3D ioremap(pci_resource_start(pdev, 0),
> @@ -618,8 +620,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  	iounmap(cirrus->vram);
>  err_dev_put:
>  	drm_dev_put(dev);
> -err_free_cirrus:
> -	kfree(cirrus);
>  err_pci_release:
>  	pci_release_regions(pdev);
>  	return ret;
> -- =

> 2.24.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
