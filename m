Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7513E46A1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 15:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B2E89B3B;
	Mon,  9 Aug 2021 13:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8154D89B3B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 13:28:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35AD76101E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 13:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628515707;
 bh=4w4q1rrTPB95pnKDDq1uvOnYJ5o7QbA8j+zMNYnGm5k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PpqiS52FmYrP1hfNs1Wk6Go9x+KmSQFgo4efnnCTRKQe9vUX4BN/iBZptNDGdQ/Wo
 4YQ5mQSXFoAORSdE8pxzjY/u+chmniQmdYBd4HSLSUTLtpILh9dskeEAYFMXhCt03g
 P5+vARLumWNstu3rb671DWBnXJeWOvJumibd/5lXC7m3o+PG4AZFb191XGoHSyyiKh
 TQEG301JN3CIucyoS5cUoOhy67fxlW6kXIYZTEjM7nnHgqXNyJkavh4Zs8r0GX6EXH
 mN3rsIfswatH3ICBalSb4+l7RVT7udTyXX2TqQ1ehgzDWHbZaL+/R4cJIXdcJQgn1x
 DwLcXo8S8XY7w==
Received: by mail-ej1-f53.google.com with SMTP id oz16so12781764ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Aug 2021 06:28:27 -0700 (PDT)
X-Gm-Message-State: AOAM530YBbZFkTiSog37MiCxVP5EdyEsthXo32poPGP47p6MzD+nIxt6
 eEdYRLK8RGjBck9KfSu7qtIMJYF6NRKGbbCEUg==
X-Google-Smtp-Source: ABdhPJzdQ/c2qmdNF0JCwqqXaweAroY36smC92CG5lTcuEhHzMILG9foEMgD54Sz0mj/gysVObCVhYAYZMxNsvCXqAc=
X-Received: by 2002:a17:906:3707:: with SMTP id
 d7mr22723483ejc.127.1628515705629; 
 Mon, 09 Aug 2021 06:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210624090126.8167-1-tzimmermann@suse.de>
In-Reply-To: <20210624090126.8167-1-tzimmermann@suse.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 21:28:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-GekVvWFQVt693_7KLkFWprzybcD1=JzQZU--2mSL6oA@mail.gmail.com>
Message-ID: <CAAOTY_-GekVvWFQVt693_7KLkFWprzybcD1=JzQZU--2mSL6oA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi, Thomas:

Thomas Zimmermann <tzimmermann@suse.de> =E6=96=BC 2021=E5=B9=B46=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:01=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> The respective mediatek functions are being removed. The file_operations
> structure fops is now being created by the helper macro
> DEFINE_DRM_GEM_FOPS().

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 13 ++------
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 44 +++++++-------------------
>  drivers/gpu/drm/mediatek/mtk_drm_gem.h |  3 --
>  3 files changed, 14 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/med=
iatek/mtk_drm_drv.c
> index b46bdb8985da..bbfefb29c211 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -300,16 +300,7 @@ static void mtk_drm_kms_deinit(struct drm_device *dr=
m)
>         component_unbind_all(drm->dev, drm);
>  }
>
> -static const struct file_operations mtk_drm_fops =3D {
> -       .owner =3D THIS_MODULE,
> -       .open =3D drm_open,
> -       .release =3D drm_release,
> -       .unlocked_ioctl =3D drm_ioctl,
> -       .mmap =3D mtk_drm_gem_mmap,
> -       .poll =3D drm_poll,
> -       .read =3D drm_read,
> -       .compat_ioctl =3D drm_compat_ioctl,
> -};
> +DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
>
>  /*
>   * We need to override this because the device used to import the memory=
 is
> @@ -332,7 +323,7 @@ static const struct drm_driver mtk_drm_driver =3D {
>         .prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
>         .gem_prime_import =3D mtk_drm_gem_prime_import,
>         .gem_prime_import_sg_table =3D mtk_gem_prime_import_sg_table,
> -       .gem_prime_mmap =3D mtk_drm_gem_mmap_buf,
> +       .gem_prime_mmap =3D drm_gem_prime_mmap,
>         .fops =3D &mtk_drm_fops,
>
>         .name =3D DRIVER_NAME,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index 280ea0d5e840..d0544962cfc1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -14,11 +14,14 @@
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_gem.h"
>
> +static int mtk_drm_gem_object_mmap(struct drm_gem_object *obj, struct vm=
_area_struct *vma);
> +
>  static const struct drm_gem_object_funcs mtk_drm_gem_object_funcs =3D {
>         .free =3D mtk_drm_gem_free_object,
>         .get_sg_table =3D mtk_gem_prime_get_sg_table,
>         .vmap =3D mtk_drm_gem_prime_vmap,
>         .vunmap =3D mtk_drm_gem_prime_vunmap,
> +       .mmap =3D mtk_drm_gem_object_mmap,
>         .vm_ops =3D &drm_gem_cma_vm_ops,
>  };
>
> @@ -145,11 +148,19 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_o=
bject *obj,
>         struct mtk_drm_gem_obj *mtk_gem =3D to_mtk_gem_obj(obj);
>         struct mtk_drm_private *priv =3D obj->dev->dev_private;
>
> +       /*
> +        * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and ma=
p the
> +        * whole buffer from the start.
> +        */
> +       vma->vm_pgoff =3D 0;
> +
>         /*
>          * dma_alloc_attrs() allocated a struct page table for mtk_gem, s=
o clear
>          * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap=
().
>          */
> -       vma->vm_flags &=3D ~VM_PFNMAP;
> +       vma->vm_flags |=3D VM_IO | VM_DONTEXPAND | VM_DONTDUMP;
> +       vma->vm_page_prot =3D pgprot_writecombine(vm_get_page_prot(vma->v=
m_flags));
> +       vma->vm_page_prot =3D pgprot_decrypted(vma->vm_page_prot);
>
>         ret =3D dma_mmap_attrs(priv->dma_dev, vma, mtk_gem->cookie,
>                              mtk_gem->dma_addr, obj->size, mtk_gem->dma_a=
ttrs);
> @@ -159,37 +170,6 @@ static int mtk_drm_gem_object_mmap(struct drm_gem_ob=
ject *obj,
>         return ret;
>  }
>
> -int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj, struct vm_area_stru=
ct *vma)
> -{
> -       int ret;
> -
> -       ret =3D drm_gem_mmap_obj(obj, obj->size, vma);
> -       if (ret)
> -               return ret;
> -
> -       return mtk_drm_gem_object_mmap(obj, vma);
> -}
> -
> -int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -       struct drm_gem_object *obj;
> -       int ret;
> -
> -       ret =3D drm_gem_mmap(filp, vma);
> -       if (ret)
> -               return ret;
> -
> -       obj =3D vma->vm_private_data;
> -
> -       /*
> -        * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and ma=
p the
> -        * whole buffer from the start.
> -        */
> -       vma->vm_pgoff =3D 0;
> -
> -       return mtk_drm_gem_object_mmap(obj, vma);
> -}
> -
>  /*
>   * Allocate a sg_table for this GEM object.
>   * Note: Both the table's contents, and the sg_table itself must be free=
d by
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.h b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.h
> index 6da5ccb4b933..9a359a06cb73 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.h
> @@ -39,9 +39,6 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct drm_d=
evice *dev, size_t size,
>                                            bool alloc_kmap);
>  int mtk_drm_gem_dumb_create(struct drm_file *file_priv, struct drm_devic=
e *dev,
>                             struct drm_mode_create_dumb *args);
> -int mtk_drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
> -int mtk_drm_gem_mmap_buf(struct drm_gem_object *obj,
> -                        struct vm_area_struct *vma);
>  struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj);
>  struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *=
dev,
>                         struct dma_buf_attachment *attach, struct sg_tabl=
e *sg);
> --
> 2.32.0
>
