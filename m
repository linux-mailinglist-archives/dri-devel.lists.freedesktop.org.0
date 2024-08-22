Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47C295BC5D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 18:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E746610E0BC;
	Thu, 22 Aug 2024 16:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jeQVMnx+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6252B10E0BC;
 Thu, 22 Aug 2024 16:48:10 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-201e2ebed48so666545ad.0; 
 Thu, 22 Aug 2024 09:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724345290; x=1724950090; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w/SYJbQoNAoEOpdSmC9AviqNRwXCtN2rcgO4mb9jx4U=;
 b=jeQVMnx+7BrEcTX8qyYcTNRAeFi1HZYis5BxSrJEXEAwdHw/G7hPWZPnfYO5MwLMDM
 K8ZQCks6rvgYjTO96sSGxsWrTtBlaNsnJd2BuoDZYTNUNGOHcypdKsclqBz63vdl//4r
 kuwaWQfYtvRH0dFBfy8D+2JaZT9XFM04gm0vPZnGnAj8u5cw5vyTGOiyZsuEkNtvUych
 nUz6vVb4IqHh3jESCX0xMAOj/uNGk0iPXbcWkc9al406WDTKkzM366SWBSWkZfKq5T0y
 LuHvuYq9igBy1G9e8STEJ2iX6atnTTWkgwJYl7pA5UOGpH6oWRsrt4GABO2cI7Hu9grq
 726A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724345290; x=1724950090;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w/SYJbQoNAoEOpdSmC9AviqNRwXCtN2rcgO4mb9jx4U=;
 b=NIYnaZlpqlj+6IJX+IZXZAjjs/E4PKiwpzW9Z+FC31yZ1ZsxUqDE4Lz3AWhyzJqcSz
 aVf6wePJF3tov3RJFdUvfNnxyZWn2P3LzaLsRXz1KbY/RcXq6b/6Nu7I8wUoV5bZPetb
 DRUVPrb7L+lFzhHNK7gt/DO1UgmqsYviu8QWWs2sTZJGqoyyQnitaLBE2uM3uGgbonVN
 jEjtvepnYkUYFBIkWaxDJXzDWnOXvaR+089iZK50rS0zU7SUudbNFMcfyKM+oMrip6s7
 hm/NlUYxhtMjBl1IZ+jrNWltcZN0pNG08eW4P6dzvATfPxXFIeJ+9xaOi6CztTel6oeE
 CIgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb19R6fVQVWqJp/O19+VpO/nJIE41jTKx4L7vSnw06WxI0kF5Mxn3lj35zC4Yce2vIvynvTCx8uA==@lists.freedesktop.org,
 AJvYcCVLgLh+taeHk3bicqVfB8aWbZzcXYj00dWjBH1S4iD+OonWuqC3AVVQ9Zvg+KY9IiKRIk8YVY18@lists.freedesktop.org,
 AJvYcCWS/l4eSL5XPC1gVmLkAEJX8q0cWCyzzKKLqzfOOQFm84h2dldx//Wdp2QIZ0RpRmoiJ0QgBI4b2sc=@lists.freedesktop.org,
 AJvYcCXS1InlOZkzoT4x0gKyzCDBg1kLZWDnq/1HlGRB+cvWrTJepKcfHBPQbyVvpLkjq+w2l0izv0/CQxkJ@lists.freedesktop.org,
 AJvYcCXZkt9EoiMnBKB7u/ot9bY58YfQ9rPuVStMDKNWsk/WFF5YaDG+U/Fr5OJiBiFY8o5boN/et/nAIS6l@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVc0OdqT8TCBeBC75Wbu2zsLEDCm7zuBt9kAcG6zujZsPNwm9R
 qeo9/DEY5x1dRCq1HFf6sd7bH0mig4unU1LBTLU2fZE0pHPnxbQJ3Zf+l65C9HwH3/B5jeTLnqS
 ZvuNP1fgbd9d+Srm7TK96CmPL1wo=
X-Google-Smtp-Source: AGHT+IHvgBbVVa76y+q8upcHev3BPXnF8VPUhaq2Jd/kXLRdgKdqVaa2tatSVZGW4P8sleR3RdFhrJ6JCPe3DriQWwk=
X-Received: by 2002:a17:903:1c7:b0:202:301f:36fe with SMTP id
 d9443c01a7336-20367d203d3mr42552305ad.4.1724345289574; Thu, 22 Aug 2024
 09:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-79-tzimmermann@suse.de>
In-Reply-To: <20240821130348.73038-79-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Aug 2024 12:47:58 -0400
Message-ID: <CADnq5_PYMSH8qhA+qZNi_Z3hCg2Wp5XNVeCjm4J6S81BQHHgfA@mail.gmail.com>
Subject: Re: [PATCH v2 78/86] drm/radeon: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 21, 2024 at 9:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The radeon driver specifies a preferred color mode depending on
> the available video memory, with a default of 32. Adapt this for
> the new client interface.
>
> v2:
> - style changes
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Xinhui Pan <Xinhui.Pan@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_drv.c   |  16 +++-
>  drivers/gpu/drm/radeon/radeon_fbdev.c | 114 ++------------------------
>  drivers/gpu/drm/radeon/radeon_mode.h  |  12 ++-
>  3 files changed, 29 insertions(+), 113 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon=
/radeon_drv.c
> index 7bf08164140e..9eb24f653008 100644
> --- a/drivers/gpu/drm/radeon/radeon_drv.c
> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
> @@ -38,8 +38,10 @@
>  #include <linux/pci.h>
>
>  #include <drm/drm_aperture.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_pciids.h>
> @@ -260,6 +262,8 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>  {
>         unsigned long flags =3D 0;
>         struct drm_device *dev;
> +       struct radeon_device *rdev;
> +       const struct drm_format_info *format;
>         int ret;
>
>         if (!ent)
> @@ -314,7 +318,15 @@ static int radeon_pci_probe(struct pci_dev *pdev,
>         if (ret)
>                 goto err_agp;
>
> -       radeon_fbdev_setup(dev->dev_private);
> +       rdev =3D dev->dev_private;
> +       if (rdev->mc.real_vram_size <=3D (8 * 1024 * 1024))
> +               format =3D drm_format_info(DRM_FORMAT_C8);
> +       else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <=3D (32 *=
 1024 * 1024))
> +               format =3D drm_format_info(DRM_FORMAT_RGB565);
> +       else
> +               format =3D NULL;
> +
> +       drm_client_setup(dev, format);
>
>         return 0;
>
> @@ -581,6 +593,8 @@ static const struct drm_driver kms_driver =3D {
>
>         .gem_prime_import_sg_table =3D radeon_gem_prime_import_sg_table,
>
> +       RADEON_FBDEV_DRIVER_OPS,
> +
>         .name =3D DRIVER_NAME,
>         .desc =3D DRIVER_DESC,
>         .date =3D DRIVER_DATE,
> diff --git a/drivers/gpu/drm/radeon/radeon_fbdev.c b/drivers/gpu/drm/rade=
on/radeon_fbdev.c
> index 02bf25759059..4c81f9a87c16 100644
> --- a/drivers/gpu/drm/radeon/radeon_fbdev.c
> +++ b/drivers/gpu/drm/radeon/radeon_fbdev.c
> @@ -198,12 +198,11 @@ static const struct fb_ops radeon_fbdev_fb_ops =3D =
{
>         .fb_destroy =3D radeon_fbdev_fb_destroy,
>  };
>
> -/*
> - * Fbdev helpers and struct drm_fb_helper_funcs
> - */
> +static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs =3D=
 {
> +};
>
> -static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_help=
er,
> -                                          struct drm_fb_helper_surface_s=
ize *sizes)
> +int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
> +                                   struct drm_fb_helper_surface_size *si=
zes)
>  {
>         struct radeon_device *rdev =3D fb_helper->dev->dev_private;
>         struct drm_mode_fb_cmd2 mode_cmd =3D { };
> @@ -243,6 +242,7 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm=
_fb_helper *fb_helper,
>         }
>
>         /* setup helper */
> +       fb_helper->funcs =3D &radeon_fbdev_fb_helper_funcs;
>         fb_helper->fb =3D fb;
>
>         /* okay we have an object now allocate the framebuffer */
> @@ -288,110 +288,6 @@ static int radeon_fbdev_fb_helper_fb_probe(struct d=
rm_fb_helper *fb_helper,
>         return ret;
>  }
>
> -static const struct drm_fb_helper_funcs radeon_fbdev_fb_helper_funcs =3D=
 {
> -       .fb_probe =3D radeon_fbdev_fb_helper_fb_probe,
> -};
> -
> -/*
> - * Fbdev client and struct drm_client_funcs
> - */
> -
> -static void radeon_fbdev_client_unregister(struct drm_client_dev *client=
)
> -{
> -       struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
> -       struct drm_device *dev =3D fb_helper->dev;
> -       struct radeon_device *rdev =3D dev->dev_private;
> -
> -       if (fb_helper->info) {
> -               vga_switcheroo_client_fb_set(rdev->pdev, NULL);
> -               drm_helper_force_disable_all(dev);
> -               drm_fb_helper_unregister_info(fb_helper);
> -       } else {
> -               drm_client_release(&fb_helper->client);
> -               drm_fb_helper_unprepare(fb_helper);
> -               kfree(fb_helper);
> -       }
> -}
> -
> -static int radeon_fbdev_client_restore(struct drm_client_dev *client)
> -{
> -       drm_fb_helper_lastclose(client->dev);
> -       vga_switcheroo_process_delayed_switch();
> -
> -       return 0;
> -}
> -
> -static int radeon_fbdev_client_hotplug(struct drm_client_dev *client)
> -{
> -       struct drm_fb_helper *fb_helper =3D drm_fb_helper_from_client(cli=
ent);
> -       struct drm_device *dev =3D client->dev;
> -       struct radeon_device *rdev =3D dev->dev_private;
> -       int ret;
> -
> -       if (dev->fb_helper)
> -               return drm_fb_helper_hotplug_event(dev->fb_helper);
> -
> -       ret =3D drm_fb_helper_init(dev, fb_helper);
> -       if (ret)
> -               goto err_drm_err;
> -
> -       if (!drm_drv_uses_atomic_modeset(dev))
> -               drm_helper_disable_unused_functions(dev);
> -
> -       ret =3D drm_fb_helper_initial_config(fb_helper);
> -       if (ret)
> -               goto err_drm_fb_helper_fini;
> -
> -       vga_switcheroo_client_fb_set(rdev->pdev, fb_helper->info);
> -
> -       return 0;
> -
> -err_drm_fb_helper_fini:
> -       drm_fb_helper_fini(fb_helper);
> -err_drm_err:
> -       drm_err(dev, "Failed to setup radeon fbdev emulation (ret=3D%d)\n=
", ret);
> -       return ret;
> -}
> -
> -static const struct drm_client_funcs radeon_fbdev_client_funcs =3D {
> -       .owner          =3D THIS_MODULE,
> -       .unregister     =3D radeon_fbdev_client_unregister,
> -       .restore        =3D radeon_fbdev_client_restore,
> -       .hotplug        =3D radeon_fbdev_client_hotplug,
> -};
> -
> -void radeon_fbdev_setup(struct radeon_device *rdev)
> -{
> -       struct drm_fb_helper *fb_helper;
> -       int bpp_sel =3D 32;
> -       int ret;
> -
> -       if (rdev->mc.real_vram_size <=3D (8 * 1024 * 1024))
> -               bpp_sel =3D 8;
> -       else if (ASIC_IS_RN50(rdev) || rdev->mc.real_vram_size <=3D (32 *=
 1024 * 1024))
> -               bpp_sel =3D 16;
> -
> -       fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
> -       if (!fb_helper)
> -               return;
> -       drm_fb_helper_prepare(rdev->ddev, fb_helper, bpp_sel, &radeon_fbd=
ev_fb_helper_funcs);
> -
> -       ret =3D drm_client_init(rdev->ddev, &fb_helper->client, "radeon-f=
bdev",
> -                             &radeon_fbdev_client_funcs);
> -       if (ret) {
> -               drm_err(rdev->ddev, "Failed to register client: %d\n", re=
t);
> -               goto err_drm_client_init;
> -       }
> -
> -       drm_client_register(&fb_helper->client);
> -
> -       return;
> -
> -err_drm_client_init:
> -       drm_fb_helper_unprepare(fb_helper);
> -       kfree(fb_helper);
> -}
> -
>  void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
>  {
>         if (rdev->ddev->fb_helper)
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeo=
n/radeon_mode.h
> index e0a5af180801..8e916729f393 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -38,6 +38,9 @@
>  #include <linux/i2c.h>
>  #include <linux/i2c-algo-bit.h>
>
> +struct drm_fb_helper;
> +struct drm_fb_helper_surface_size;
> +
>  struct edid;
>  struct radeon_bo;
>  struct radeon_device;
> @@ -935,12 +938,15 @@ void dce8_program_fmt(struct drm_encoder *encoder);
>
>  /* fbdev layer */
>  #if defined(CONFIG_DRM_FBDEV_EMULATION)
> -void radeon_fbdev_setup(struct radeon_device *rdev);
> +int radeon_fbdev_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
> +                                   struct drm_fb_helper_surface_size *si=
zes);
> +#define RADEON_FBDEV_DRIVER_OPS \
> +       .fbdev_probe =3D radeon_fbdev_driver_fbdev_probe
>  void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
>  bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_b=
o *robj);
>  #else
> -static inline void radeon_fbdev_setup(struct radeon_device *rdev)
> -{ }
> +#define RADEON_FBDEV_DRIVER_OPS \
> +       .fbdev_probe =3D NULL
>  static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, =
int state)
>  { }
>  static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, s=
truct radeon_bo *robj)
> --
> 2.46.0
>
