Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE26A4DD1B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 12:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF11410E26D;
	Tue,  4 Mar 2025 11:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ivET0tlO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5A410E26D
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:56:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 26ED8A450D5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B97AC4CEE5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741089359;
 bh=l5mtb61jZYcJKzgCMFCt7VLTLj+l06ZqLcaKSixiNR0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ivET0tlOcMbs0TJbfsMyRUhkZnLoes4cUo/MWw2FvrRiKpHpQjCR6duBsEBxR+6Z9
 UjldU1NGQSllJMv1s3qgSp4iWgkGHKjhIqohqFbF+M59dW654Onvpp1Aon2QDGV17s
 UpDHuoL4IKE37DCUhxCEctMlVAoUc7B92x118QyVnBDD+f6Sr20RyJIQG1IJvsjC6o
 JZ0jcsexLIuGGxzAkj8Z/in19ZRUoNEGXLZIHhUwWq8uDY85H/Y/65mAAD29D1ZQhe
 tmXdI3KM0+6hBD8GljN8zPppZC6gJ3Bg9JDbd1vMEM92MDKdHRpfxPaWBB+so+4b7+
 lFEgVo5eztPiQ==
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e538388dd1so3091391a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Mar 2025 03:55:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOX4wWjsvXt7WnEZhgrVQXGmu1UBNB+ykBiZpnI4k1YGm0Xp72a71HcXsFFMSsgWqSvqa1OogEOt0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhwzeYuY6eODAZhTuxFxLYB5GEfuK2/v8LgDdAujvfTg2TatsB
 4KWrUpsr3YYE3gQwVWYNOSWelNOCrnMTI7As/mRfFPnbHa7EYaLR5fpIuEVTMDcabL9BPnZOt8s
 iVH3m5oNgCCE4fJ+Rkf38ZpkwlTs=
X-Google-Smtp-Source: AGHT+IF/7E6yWJBcecTk4wmEpbjiShbXRY4dP3W9wZwfd9eQl71YdLH0EpAVlYS98g0VPPaveQAijbkNiiMMmJBTBiY=
X-Received: by 2002:a17:907:2d0c:b0:abe:cccd:9222 with SMTP id
 a640c23a62f3a-abf26888da0mr2004856566b.54.1741089358034; Tue, 04 Mar 2025
 03:55:58 -0800 (PST)
MIME-Version: 1.0
References: <20250304063351.3975323-1-chenhuacai@loongson.cn>
 <5314b1bb-5208-4342-a7a4-5c985ea0ce52@suse.de>
 <CAAhV-H4kBZ52E_4iju-mH=NgYOQb-TiiwBbmeTytcy0_wVkUiQ@mail.gmail.com>
 <0e1a7eaf-5fd1-451a-9b62-8fec108e351c@suse.de>
In-Reply-To: <0e1a7eaf-5fd1-451a-9b62-8fec108e351c@suse.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Mar 2025 19:55:46 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6DLxiC63TrEnVj6Sy5vQfG=j5nmtxYoh2b9iT=crbnvA@mail.gmail.com>
X-Gm-Features: AQ5f1JpGCBtxLKsn81JFdgurIu3gsQaBewSRXBcbBWDMqFT2zvJ0dcgrHgIl-hk
Message-ID: <CAAhV-H6DLxiC63TrEnVj6Sy5vQfG=j5nmtxYoh2b9iT=crbnvA@mail.gmail.com>
Subject: Re: [PATCH] drm/ast: Support both SHMEM helper and VRAM helper
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
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

On Tue, Mar 4, 2025 at 5:39=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 04.03.25 um 10:19 schrieb Huacai Chen:
> > On Tue, Mar 4, 2025 at 4:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Hi
> >>
> >> Am 04.03.25 um 07:33 schrieb Huacai Chen:
> >>> Commit f2fa5a99ca81ce105653 ("drm/ast: Convert ast to SHMEM") convert=
s
> >>> ast from VRAM helper to SHMEM helper. The convertion makesast support
> >>> higher display resolutions, but the performance decreases significant=
ly
> >>> on platforms which don't support writecombine (fallback to uncached).
> >>>
> >>> This patch implements both SHMEM helper and VRAM helper for ast drive=
r
> >>> at the same time. A module parameter ast.shmem is added, 1 means SHME=
M
> >>> hepler, 0 means VRAM helper, and the default (-1) means auto selectio=
n
> >>> according to drm_arch_can_wc_memory().
> >> Sorry won't happen. There's one memory manager and that's it.
> >>
> >> The question is why there is a difference between the two. Because
> >> conceptually, it's both software rendering that copies the final image
> >> into video ram. Why is that much faster with VRAM helpers?
> > Correct me if I'm wrong.
> >
> > SHMEM helper means "copy damage data to a fixed VRAM buffer", VRAM
> > helper means "double buffers and swapping the two". So if WC is not
> > supported, SHMEM helper is slower from visible effect.
>
> First of all, which component is slow? The kernel console, the desktop,
> something else?
"Slow" here means the desktop ui is not smooth, not kernel console,
and not data copy rate.

>
> On your question. This is all software rendering. In the case of
> GEM-SHMEM, we mmap shmem pages to user-space compositors and let them
> draw the UI. That should be fast because these SHMEM pages should be
> mapped with full caching. The WC caching is the exception here. This
> could be the problem. Maybe these pages are uncached for some reason.
> But so far, we've not touched VRAM at all. After rendering to the
> provided pages, the compositor instructs the DRM driver to flush the
> changes to VRAM. That involves a vmap of the I/O range and a
> memcpy_toio(). Without WC caching, this will be slow. It is optimized by
> using damage information; only the updated part of the screen will be
> copied.
>
> With GEM-VRAM, the kernel mmap's the VRAM's I/O range to the compositor.
> The compositor renders into a malloc'ed memory buffer and then copies
> the result over to the mmap'ed range fom the driver. (And essentially
> into the VRAM). If your platform does not have WC caching, this would be
> uncached and fairly slow.  The compositor then instructs the driver to
> swap buffers, which is always fast because we've already done he copying
> in user space.
>
> Now the question is why the GEM-SHMEM code is slower than the GEM-VRAM
> path. In principle, they both do the same work.
Yes, they do the same work, so the data copy rate may be the same. But
GEM-SHMEM is an in-place update while GEM-VRAM is an off-screen
update, so the desktop effect is different.

Huacai

>
> Best regard
> Thomas
>
> >
> >
> > Huacai
> >
> >> Best regards
> >> Thomas
> >>
> >>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> >>> ---
> >>>    drivers/gpu/drm/ast/Kconfig    |   3 +
> >>>    drivers/gpu/drm/ast/ast_drv.c  |  31 ++++++++--
> >>>    drivers/gpu/drm/ast/ast_drv.h  |   6 +-
> >>>    drivers/gpu/drm/ast/ast_mm.c   |  11 +++-
> >>>    drivers/gpu/drm/ast/ast_mode.c | 105 +++++++++++++++++++++++++----=
----
> >>>    5 files changed, 124 insertions(+), 32 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/ast/Kconfig b/drivers/gpu/drm/ast/Kconfi=
g
> >>> index da0663542e8a..ed07ef70072f 100644
> >>> --- a/drivers/gpu/drm/ast/Kconfig
> >>> +++ b/drivers/gpu/drm/ast/Kconfig
> >>> @@ -5,6 +5,9 @@ config DRM_AST
> >>>        select DRM_CLIENT_SELECTION
> >>>        select DRM_GEM_SHMEM_HELPER
> >>>        select DRM_KMS_HELPER
> >>> +     select DRM_TTM
> >>> +     select DRM_TTM_HELPER
> >>> +     select DRM_VRAM_HELPER
> >>>        select I2C
> >>>        select I2C_ALGOBIT
> >>>        help
> >>> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_=
drv.c
> >>> index ff3bcdd1cff2..a0c693844f1e 100644
> >>> --- a/drivers/gpu/drm/ast/ast_drv.c
> >>> +++ b/drivers/gpu/drm/ast/ast_drv.c
> >>> @@ -33,9 +33,12 @@
> >>>
> >>>    #include <drm/clients/drm_client_setup.h>
> >>>    #include <drm/drm_atomic_helper.h>
> >>> +#include <drm/drm_cache.h>
> >>>    #include <drm/drm_drv.h>
> >>>    #include <drm/drm_fbdev_shmem.h>
> >>> +#include <drm/drm_fbdev_ttm.h>
> >>>    #include <drm/drm_gem_shmem_helper.h>
> >>> +#include <drm/drm_gem_vram_helper.h>
> >>>    #include <drm/drm_module.h>
> >>>    #include <drm/drm_probe_helper.h>
> >>>
> >>> @@ -46,13 +49,18 @@ static int ast_modeset =3D -1;
> >>>    MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
> >>>    module_param_named(modeset, ast_modeset, int, 0400);
> >>>
> >>> +int ast_shmem =3D -1;
> >>> +
> >>> +MODULE_PARM_DESC(shmem, "1 =3D SHMEM helper, 0 =3D VRAM helper, -1 =
=3D Auto");
> >>> +module_param_named(shmem, ast_shmem, int, 0400);
> >>> +
> >>>    /*
> >>>     * DRM driver
> >>>     */
> >>>
> >>>    DEFINE_DRM_GEM_FOPS(ast_fops);
> >>>
> >>> -static const struct drm_driver ast_driver =3D {
> >>> +static struct drm_driver ast_driver =3D {
> >>>        .driver_features =3D DRIVER_ATOMIC |
> >>>                           DRIVER_GEM |
> >>>                           DRIVER_MODESET,
> >>> @@ -63,9 +71,6 @@ static const struct drm_driver ast_driver =3D {
> >>>        .major =3D DRIVER_MAJOR,
> >>>        .minor =3D DRIVER_MINOR,
> >>>        .patchlevel =3D DRIVER_PATCHLEVEL,
> >>> -
> >>> -     DRM_GEM_SHMEM_DRIVER_OPS,
> >>> -     DRM_FBDEV_SHMEM_DRIVER_OPS,
> >>>    };
> >>>
> >>>    /*
> >>> @@ -280,6 +285,24 @@ static int ast_pci_probe(struct pci_dev *pdev, c=
onst struct pci_device_id *ent)
> >>>        struct drm_device *drm;
> >>>        bool need_post =3D false;
> >>>
> >>> +     if (ast_shmem =3D=3D -1)
> >>> +             ast_shmem =3D drm_arch_can_wc_memory() ? 1 : 0;
> >>> +
> >>> +     if (ast_shmem) {
> >>> +             ast_driver.dumb_create =3D drm_gem_shmem_dumb_create;
> >>> +             ast_driver.gem_prime_import_sg_table =3D drm_gem_shmem_=
prime_import_sg_table;
> >>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> >>> +             ast_driver.fbdev_probe =3D drm_fbdev_shmem_driver_fbdev=
_probe;
> >>> +#endif
> >>> +     } else {
> >>> +             ast_driver.dumb_create =3D drm_gem_vram_driver_dumb_cre=
ate;
> >>> +             ast_driver.dumb_map_offset =3D drm_gem_ttm_dumb_map_off=
set;
> >>> +             ast_driver.debugfs_init =3D drm_vram_mm_debugfs_init;
> >>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
> >>> +             ast_driver.fbdev_probe =3D drm_fbdev_ttm_driver_fbdev_p=
robe;
> >>> +#endif
> >>> +     }
> >>> +
> >>>        ret =3D aperture_remove_conflicting_pci_devices(pdev, ast_driv=
er.name);
> >>>        if (ret)
> >>>                return ret;
> >>> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_=
drv.h
> >>> index 6b4305ac07d4..3fcf6717ad8a 100644
> >>> --- a/drivers/gpu/drm/ast/ast_drv.h
> >>> +++ b/drivers/gpu/drm/ast/ast_drv.h
> >>> @@ -29,6 +29,7 @@
> >>>    #define __AST_DRV_H__
> >>>
> >>>    #include <linux/io.h>
> >>> +#include <linux/iosys-map.h>
> >>>    #include <linux/types.h>
> >>>
> >>>    #include <drm/drm_connector.h>
> >>> @@ -53,6 +54,8 @@
> >>>
> >>>    #define __AST_CHIP(__gen, __index)  ((__gen) << 16 | (__index))
> >>>
> >>> +extern int ast_shmem;
> >>> +
> >>>    enum ast_chip {
> >>>        /* 1st gen */
> >>>        AST1000 =3D __AST_CHIP(1, 0), // unused
> >>> @@ -130,7 +133,8 @@ enum ast_config_mode {
> >>>    struct ast_plane {
> >>>        struct drm_plane base;
> >>>
> >>> -     void __iomem *vaddr;
> >>> +     struct drm_gem_vram_object *gbo;
> >>> +     struct iosys_map map;
> >>>        u64 offset;
> >>>        unsigned long size;
> >>>    };
> >>> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_m=
m.c
> >>> index 6dfe6d9777d4..588326b7d53e 100644
> >>> --- a/drivers/gpu/drm/ast/ast_mm.c
> >>> +++ b/drivers/gpu/drm/ast/ast_mm.c
> >>> @@ -28,6 +28,7 @@
> >>>
> >>>    #include <linux/pci.h>
> >>>
> >>> +#include <drm/drm_gem_vram_helper.h>
> >>>    #include <drm/drm_managed.h>
> >>>    #include <drm/drm_print.h>
> >>>
> >>> @@ -87,9 +88,13 @@ int ast_mm_init(struct ast_device *ast)
> >>>
> >>>        vram_size =3D ast_get_vram_size(ast);
> >>>
> >>> -     ast->vram =3D devm_ioremap_wc(dev->dev, base, vram_size);
> >>> -     if (!ast->vram)
> >>> -             return -ENOMEM;
> >>> +     if (!ast_shmem)
> >>> +             drmm_vram_helper_init(dev, base, vram_size);
> >>> +     else {
> >>> +             ast->vram =3D devm_ioremap_wc(dev->dev, base, vram_size=
);
> >>> +             if (!ast->vram)
> >>> +                     return -ENOMEM;
> >>> +     }
> >>>
> >>>        ast->vram_base =3D base;
> >>>        ast->vram_size =3D vram_size;
> >>> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast=
_mode.c
> >>> index 9d5321c81e68..0744d1ac5dfb 100644
> >>> --- a/drivers/gpu/drm/ast/ast_mode.c
> >>> +++ b/drivers/gpu/drm/ast/ast_mode.c
> >>> @@ -41,6 +41,7 @@
> >>>    #include <drm/drm_gem_atomic_helper.h>
> >>>    #include <drm/drm_gem_framebuffer_helper.h>
> >>>    #include <drm/drm_gem_shmem_helper.h>
> >>> +#include <drm/drm_gem_vram_helper.h>
> >>>    #include <drm/drm_managed.h>
> >>>    #include <drm/drm_panic.h>
> >>>    #include <drm/drm_probe_helper.h>
> >>> @@ -566,8 +567,7 @@ static void ast_wait_for_vretrace(struct ast_devi=
ce *ast)
> >>>     */
> >>>
> >>>    static int ast_plane_init(struct drm_device *dev, struct ast_plane=
 *ast_plane,
> >>> -                       void __iomem *vaddr, u64 offset, unsigned lon=
g size,
> >>> -                       uint32_t possible_crtcs,
> >>> +                       u64 offset, unsigned long size, uint32_t poss=
ible_crtcs,
> >>>                          const struct drm_plane_funcs *funcs,
> >>>                          const uint32_t *formats, unsigned int format=
_count,
> >>>                          const uint64_t *format_modifiers,
> >>> @@ -575,7 +575,6 @@ static int ast_plane_init(struct drm_device *dev,=
 struct ast_plane *ast_plane,
> >>>    {
> >>>        struct drm_plane *plane =3D &ast_plane->base;
> >>>
> >>> -     ast_plane->vaddr =3D vaddr;
> >>>        ast_plane->offset =3D offset;
> >>>        ast_plane->size =3D size;
> >>>
> >>> @@ -630,7 +629,7 @@ static void ast_handle_damage(struct ast_plane *a=
st_plane, struct iosys_map *src
> >>>                              struct drm_framebuffer *fb,
> >>>                              const struct drm_rect *clip)
> >>>    {
> >>> -     struct iosys_map dst =3D IOSYS_MAP_INIT_VADDR_IOMEM(ast_plane->=
vaddr);
> >>> +     struct iosys_map dst =3D ast_plane->map;
> >>>
> >>>        iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->fo=
rmat, clip));
> >>>        drm_fb_memcpy(&dst, fb->pitches, src, fb, clip);
> >>> @@ -650,6 +649,7 @@ static void ast_primary_plane_helper_atomic_updat=
e(struct drm_plane *plane,
> >>>        struct drm_crtc *crtc =3D plane_state->crtc;
> >>>        struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_=
state(state, crtc);
> >>>        struct drm_rect damage;
> >>> +     struct drm_gem_vram_object *gbo;
> >>>        struct drm_atomic_helper_damage_iter iter;
> >>>
> >>>        if (!old_fb || (fb->format !=3D old_fb->format) || crtc_state-=
>mode_changed) {
> >>> @@ -660,9 +660,15 @@ static void ast_primary_plane_helper_atomic_upda=
te(struct drm_plane *plane,
> >>>                ast_set_vbios_color_reg(ast, fb->format, vbios_mode_in=
fo);
> >>>        }
> >>>
> >>> -     drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plan=
e_state);
> >>> -     drm_atomic_for_each_plane_damage(&iter, &damage) {
> >>> -             ast_handle_damage(ast_plane, shadow_plane_state->data, =
fb, &damage);
> >>> +     if (!ast_shmem) {
> >>> +             gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> >>> +             ast_plane->offset =3D drm_gem_vram_offset(gbo);
> >>> +             ast_set_start_address_crt1(ast, (u32)ast_plane->offset)=
;
> >>> +     } else {
> >>> +             drm_atomic_helper_damage_iter_init(&iter, old_plane_sta=
te, plane_state);
> >>> +             drm_atomic_for_each_plane_damage(&iter, &damage) {
> >>> +                     ast_handle_damage(ast_plane, shadow_plane_state=
->data, fb, &damage);
> >>> +             }
> >>>        }
> >>>
> >>>        /*
> >>> @@ -704,19 +710,18 @@ static int ast_primary_plane_helper_get_scanout=
_buffer(struct drm_plane *plane,
> >>>    {
> >>>        struct ast_plane *ast_plane =3D to_ast_plane(plane);
> >>>
> >>> -     if (plane->state && plane->state->fb && ast_plane->vaddr) {
> >>> +     if (plane->state && plane->state->fb && ast_plane->map.vaddr_io=
mem) {
> >>>                sb->format =3D plane->state->fb->format;
> >>>                sb->width =3D plane->state->fb->width;
> >>>                sb->height =3D plane->state->fb->height;
> >>>                sb->pitch[0] =3D plane->state->fb->pitches[0];
> >>> -             iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->vaddr=
);
> >>> +             iosys_map_set_vaddr_iomem(&sb->map[0], ast_plane->map.v=
addr_iomem);
> >>>                return 0;
> >>>        }
> >>>        return -ENODEV;
> >>>    }
> >>>
> >>> -static const struct drm_plane_helper_funcs ast_primary_plane_helper_=
funcs =3D {
> >>> -     DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> >>> +static struct drm_plane_helper_funcs ast_primary_plane_helper_funcs =
=3D {
> >>>        .atomic_check =3D ast_primary_plane_helper_atomic_check,
> >>>        .atomic_update =3D ast_primary_plane_helper_atomic_update,
> >>>        .atomic_enable =3D ast_primary_plane_helper_atomic_enable,
> >>> @@ -724,11 +729,10 @@ static const struct drm_plane_helper_funcs ast_=
primary_plane_helper_funcs =3D {
> >>>        .get_scanout_buffer =3D ast_primary_plane_helper_get_scanout_b=
uffer,
> >>>    };
> >>>
> >>> -static const struct drm_plane_funcs ast_primary_plane_funcs =3D {
> >>> +static struct drm_plane_funcs ast_primary_plane_funcs =3D {
> >>>        .update_plane =3D drm_atomic_helper_update_plane,
> >>>        .disable_plane =3D drm_atomic_helper_disable_plane,
> >>>        .destroy =3D drm_plane_cleanup,
> >>> -     DRM_GEM_SHADOW_PLANE_FUNCS,
> >>>    };
> >>>
> >>>    static int ast_primary_plane_init(struct ast_device *ast)
> >>> @@ -737,12 +741,28 @@ static int ast_primary_plane_init(struct ast_de=
vice *ast)
> >>>        struct ast_plane *ast_primary_plane =3D &ast->primary_plane;
> >>>        struct drm_plane *primary_plane =3D &ast_primary_plane->base;
> >>>        void __iomem *vaddr =3D ast->vram;
> >>> -     u64 offset =3D 0; /* with shmem, the primary plane is always at=
 offset 0 */
> >>> +     u64 offset =3D 0; /* the primary plane is initially at offset 0=
 */
> >>>        unsigned long cursor_size =3D roundup(AST_HWC_SIZE + AST_HWC_S=
IGNATURE_SIZE, PAGE_SIZE);
> >>>        unsigned long size =3D ast->vram_fb_available - cursor_size;
> >>>        int ret;
> >>>
> >>> -     ret =3D ast_plane_init(dev, ast_primary_plane, vaddr, offset, s=
ize,
> >>> +     if (ast_shmem) {
> >>> +             ast_primary_plane_funcs.reset =3D drm_gem_reset_shadow_=
plane;
> >>> +             ast_primary_plane_funcs.atomic_duplicate_state =3D drm_=
gem_duplicate_shadow_plane_state;
> >>> +             ast_primary_plane_funcs.atomic_destroy_state =3D drm_ge=
m_destroy_shadow_plane_state;
> >>> +             ast_primary_plane_helper_funcs.begin_fb_access =3D drm_=
gem_begin_shadow_fb_access;
> >>> +             ast_primary_plane_helper_funcs.end_fb_access =3D drm_ge=
m_end_shadow_fb_access;
> >>> +     } else {
> >>> +             ast_primary_plane_funcs.reset =3D drm_atomic_helper_pla=
ne_reset;
> >>> +             ast_primary_plane_funcs.atomic_duplicate_state =3D drm_=
atomic_helper_plane_duplicate_state;
> >>> +             ast_primary_plane_funcs.atomic_destroy_state =3D drm_at=
omic_helper_plane_destroy_state;
> >>> +             ast_primary_plane_helper_funcs.prepare_fb =3D drm_gem_v=
ram_plane_helper_prepare_fb;
> >>> +             ast_primary_plane_helper_funcs.cleanup_fb =3D drm_gem_v=
ram_plane_helper_cleanup_fb;
> >>> +     }
> >>> +
> >>> +     iosys_map_set_vaddr_iomem(&ast_primary_plane->map, vaddr);
> >>> +
> >>> +     ret =3D ast_plane_init(dev, ast_primary_plane, offset, size,
> >>>                             0x01, &ast_primary_plane_funcs,
> >>>                             ast_primary_plane_formats, ARRAY_SIZE(ast=
_primary_plane_formats),
> >>>                             NULL, DRM_PLANE_TYPE_PRIMARY);
> >>> @@ -902,10 +922,11 @@ static void ast_cursor_plane_helper_atomic_upda=
te(struct drm_plane *plane,
> >>>        struct drm_plane_state *old_plane_state =3D drm_atomic_get_old=
_plane_state(state, plane);
> >>>        struct ast_device *ast =3D to_ast_device(plane->dev);
> >>>        struct iosys_map src_map =3D shadow_plane_state->data[0];
> >>> +     struct iosys_map dst_map =3D ast_plane->map;
> >>>        struct drm_rect damage;
> >>>        const u8 *src =3D src_map.vaddr; /* TODO: Use mapping abstract=
ion properly */
> >>>        u64 dst_off =3D ast_plane->offset;
> >>> -     u8 __iomem *dst =3D ast_plane->vaddr; /* TODO: Use mapping abst=
raction properly */
> >>> +     u8 __iomem *dst =3D dst_map.vaddr_iomem; /* TODO: Use mapping a=
bstraction properly */
> >>>        u8 __iomem *sig =3D dst + AST_HWC_SIZE; /* TODO: Use mapping a=
bstraction properly */
> >>>        unsigned int offset_x, offset_y;
> >>>        u16 x, y;
> >>> @@ -967,10 +988,22 @@ static const struct drm_plane_helper_funcs ast_=
cursor_plane_helper_funcs =3D {
> >>>        .atomic_disable =3D ast_cursor_plane_helper_atomic_disable,
> >>>    };
> >>>
> >>> -static const struct drm_plane_funcs ast_cursor_plane_funcs =3D {
> >>> +static void ast_cursor_plane_destroy(struct drm_plane *plane)
> >>> +{
> >>> +     struct ast_plane *ast_plane =3D to_ast_plane(plane);
> >>> +     struct drm_gem_vram_object *gbo =3D ast_plane->gbo;
> >>> +     struct iosys_map map =3D ast_plane->map;
> >>> +
> >>> +     drm_gem_vram_vunmap(gbo, &map);
> >>> +     drm_gem_vram_unpin(gbo);
> >>> +     drm_gem_vram_put(gbo);
> >>> +
> >>> +     drm_plane_cleanup(plane);
> >>> +}
> >>> +
> >>> +static struct drm_plane_funcs ast_cursor_plane_funcs =3D {
> >>>        .update_plane =3D drm_atomic_helper_update_plane,
> >>>        .disable_plane =3D drm_atomic_helper_disable_plane,
> >>> -     .destroy =3D drm_plane_cleanup,
> >>>        DRM_GEM_SHADOW_PLANE_FUNCS,
> >>>    };
> >>>
> >>> @@ -979,6 +1012,8 @@ static int ast_cursor_plane_init(struct ast_devi=
ce *ast)
> >>>        struct drm_device *dev =3D &ast->base;
> >>>        struct ast_plane *ast_cursor_plane =3D &ast->cursor_plane;
> >>>        struct drm_plane *cursor_plane =3D &ast_cursor_plane->base;
> >>> +     struct drm_gem_vram_object *gbo;
> >>> +     struct iosys_map map;
> >>>        size_t size;
> >>>        void __iomem *vaddr;
> >>>        u64 offset;
> >>> @@ -994,10 +1029,25 @@ static int ast_cursor_plane_init(struct ast_de=
vice *ast)
> >>>        if (ast->vram_fb_available < size)
> >>>                return -ENOMEM;
> >>>
> >>> -     vaddr =3D ast->vram + ast->vram_fb_available - size;
> >>> -     offset =3D ast->vram_fb_available - size;
> >>> +     if (ast_shmem) {
> >>> +             vaddr =3D ast->vram + ast->vram_fb_available - size;
> >>> +             offset =3D ast->vram_fb_available - size;
> >>> +             iosys_map_set_vaddr_iomem(&ast_cursor_plane->map, vaddr=
);
> >>> +             ast_cursor_plane_funcs.destroy =3D drm_plane_cleanup;
> >>> +     } else {
> >>> +             gbo =3D drm_gem_vram_create(dev, size, 0);
> >>> +             if (IS_ERR(gbo))
> >>> +                     return PTR_ERR(gbo);
> >>> +
> >>> +             drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM | DRM_G=
EM_VRAM_PL_FLAG_TOPDOWN);
> >>> +             drm_gem_vram_vmap(gbo, &map);
> >>> +             offset =3D drm_gem_vram_offset(gbo);
> >>> +             ast_cursor_plane->gbo =3D gbo;
> >>> +             ast_cursor_plane->map =3D map;
> >>> +             ast_cursor_plane_funcs.destroy =3D ast_cursor_plane_des=
troy;
> >>> +     }
> >>>
> >>> -     ret =3D ast_plane_init(dev, ast_cursor_plane, vaddr, offset, si=
ze,
> >>> +     ret =3D ast_plane_init(dev, ast_cursor_plane, offset, size,
> >>>                             0x01, &ast_cursor_plane_funcs,
> >>>                             ast_cursor_plane_formats, ARRAY_SIZE(ast_=
cursor_plane_formats),
> >>>                             NULL, DRM_PLANE_TYPE_CURSOR);
> >>> @@ -1348,9 +1398,7 @@ static enum drm_mode_status ast_mode_config_mod=
e_valid(struct drm_device *dev,
> >>>        return MODE_OK;
> >>>    }
> >>>
> >>> -static const struct drm_mode_config_funcs ast_mode_config_funcs =3D =
{
> >>> -     .fb_create =3D drm_gem_fb_create_with_dirty,
> >>> -     .mode_valid =3D ast_mode_config_mode_valid,
> >>> +static struct drm_mode_config_funcs ast_mode_config_funcs =3D {
> >>>        .atomic_check =3D drm_atomic_helper_check,
> >>>        .atomic_commit =3D drm_atomic_helper_commit,
> >>>    };
> >>> @@ -1372,6 +1420,15 @@ int ast_mode_config_init(struct ast_device *as=
t)
> >>>        dev->mode_config.min_width =3D 0;
> >>>        dev->mode_config.min_height =3D 0;
> >>>        dev->mode_config.preferred_depth =3D 24;
> >>> +     dev->mode_config.prefer_shadow =3D !ast_shmem;
> >>> +
> >>> +     if (!ast_shmem) {
> >>> +             ast_mode_config_funcs.fb_create =3D drm_gem_fb_create;
> >>> +             ast_mode_config_funcs.mode_valid =3D drm_vram_helper_mo=
de_valid;
> >>> +     } else {
> >>> +             ast_mode_config_funcs.fb_create =3D drm_gem_fb_create_w=
ith_dirty;
> >>> +             ast_mode_config_funcs.mode_valid =3D ast_mode_config_mo=
de_valid;
> >>> +     }
> >>>
> >>>        if (ast->chip =3D=3D AST2100 || // GEN2, but not AST1100 (?)
> >>>            ast->chip =3D=3D AST2200 || // GEN3, but not AST2150 (?)
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstrasse 146, 90461 Nuernberg, Germany
> >> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >> HRB 36809 (AG Nuernberg)
> >>
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
