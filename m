Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2239689DDFA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 17:08:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E4D10E05E;
	Tue,  9 Apr 2024 15:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="d2D+Q96a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885E310E05E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 15:08:14 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7c8ae457b27so160063439f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 08:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712675293; x=1713280093;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HvWds0DUH89UAYZu4JudvglYlMQ7DGGycOOQEFUqXnM=;
 b=d2D+Q96a1bQ8nHTf3PU8DEIPqukUd4Ooz5DXwnpNXBJgzSJxyPG6qLEKaKpY90lGB/
 rhSp01aZi2Bm8yuwt0GW/880K6bIs0nLa8GXQBMy5Gv+Mdwk42kgjDVPqiux5toXbaD/
 k8iAhQeT6A+XkSYBS0QDpvPsbNwfrf3KYeiLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712675293; x=1713280093;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HvWds0DUH89UAYZu4JudvglYlMQ7DGGycOOQEFUqXnM=;
 b=eud2b0OtifQAt5MVj9UC2f4WOEHPc4APiQd3KlqhXz/OsZB1dKzB0vPdK53ky1EF9e
 6sGTrGtWzxGUdpHKSesupW+IoKV+bTvTKAGPnVWIplV4MJFwXW4EOGu9elorZDguvfQ2
 TwnA8aXld70WX6l4a19/DyvjQKPA/mEjXWHJuuzcJcocWCY2kiySBtkKWhS1XVZNvF3L
 vRyk6mcnKw1n52OwCBLMcXXiNeOC7rZRYB/kgmoWew2kH9Z40VZEbi+8bJVhUmpsGcnT
 Pt03/P0Inq7aMJfjmd765dp1HIq0+Jkdi/LzqktvzYTfHrA6LOjZMOF2rgQxdgD0uDaf
 9VZw==
X-Gm-Message-State: AOJu0Yw51vSDKGLqEcnS4zcq86C5dx4Dll3E/1l3+gjzC/Km9cds3/VF
 coreWi8mVawKoxD34hL/sGuq8P4O5isui5POEosY/4KCKjGc1UP5Qs0sM23d98VIXxjTBFPe/CW
 UVCt/W9VWwRS8+hmqkI4Mf+5kp8CGqVNe0Z8m
X-Google-Smtp-Source: AGHT+IEhrsnkCn2BNqrKUkca/rBwIfoGG+Mjv6ET2a1AcNrP9oiI/9WQDzMllEG89/vO6xEuzcJuAV8unpb16H9mfuA=
X-Received: by 2002:a05:6602:3f02:b0:7d0:bef0:3317 with SMTP id
 em2-20020a0566023f0200b007d0bef03317mr43020iob.12.1712675293218; Tue, 09 Apr
 2024 08:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-3-zack.rusin@broadcom.com>
In-Reply-To: <20240402232813.2670131-3-zack.rusin@broadcom.com>
From: Martin Krastev <martin.krastev@broadcom.com>
Date: Tue, 9 Apr 2024 18:08:02 +0300
Message-ID: <CAKLwHdXcmyf+HaR4yGvEgS9XovQa+poTgUgZHNdJbCs-vE0i6Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/vmwgfx: Implement virtual crc generation
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 ian.forbes@broadcom.com, maaz.mombasawala@broadcom.com
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

On Wed, Apr 3, 2024 at 2:28=E2=80=AFAM Zack Rusin <zack.rusin@broadcom.com>=
 wrote:
>
> crc checksums are used to validate the output. Normally they're part
> of the actual display hardware but on virtual stack there's nothing
> to automatically generate them.
>
> Implement crc generation for the vmwgfx stack. This works only on
> screen targets, where it's possibly to easily make sure that the
> guest side contents of the surface matches the host sides output.
>
> Just like the vblank support, crc generation can only be enabled via:
> guestinfo.vmwgfx.vkms_enable =3D "TRUE"
> option in the vmx file.
>
> Makes IGT's kms_pipe_crc_basic pass and allows a huge number of other
> IGT tests which require CRC generation of the output to actually run
> on vmwgfx. Makes it possible to actually validate a lof of the kms and
> drm functionality with vmwgfx.
>
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c      |   1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |   2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      |  31 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.h      |  15 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  32 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c     |  22 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c     | 453 ++++++++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h     |  28 +-
>  8 files changed, 550 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index e34c48fd25d4..89d3679d2608 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -1198,6 +1198,7 @@ static void vmw_driver_unload(struct drm_device *de=
v)
>
>         vmw_svga_disable(dev_priv);
>
> +       vmw_vkms_cleanup(dev_priv);
>         vmw_kms_close(dev_priv);
>         vmw_overlay_close(dev_priv);
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 4f5d7d13c4aa..ddbceaa31b59 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -616,6 +616,7 @@ struct vmw_private {
>         uint32 *devcaps;
>
>         bool vkms_enabled;
> +       struct workqueue_struct *crc_workq;
>
>         /*
>          * mksGuestStat instance-descriptor and pid arrays
> @@ -811,6 +812,7 @@ void vmw_resource_mob_attach(struct vmw_resource *res=
);
>  void vmw_resource_mob_detach(struct vmw_resource *res);
>  void vmw_resource_dirty_update(struct vmw_resource *res, pgoff_t start,
>                                pgoff_t end);
> +int vmw_resource_clean(struct vmw_resource *res);
>  int vmw_resources_clean(struct vmw_bo *vbo, pgoff_t start,
>                         pgoff_t end, pgoff_t *num_prefault);
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.c
> index e763cf0e6cfc..e33e5993d8fc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -40,14 +40,14 @@
>
>  void vmw_du_init(struct vmw_display_unit *du)
>  {
> -       hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> -       du->vkms.timer.function =3D &vmw_vkms_vblank_simulate;
> +       vmw_vkms_crtc_init(&du->crtc);
>  }
>
>  void vmw_du_cleanup(struct vmw_display_unit *du)
>  {
>         struct vmw_private *dev_priv =3D vmw_priv(du->primary.dev);
> -       hrtimer_cancel(&du->vkms.timer);
> +
> +       vmw_vkms_crtc_cleanup(&du->crtc);
>         drm_plane_cleanup(&du->primary);
>         if (vmw_cmd_supported(dev_priv))
>                 drm_plane_cleanup(&du->cursor.base);
> @@ -963,6 +963,7 @@ int vmw_du_crtc_atomic_check(struct drm_crtc *crtc,
>  void vmw_du_crtc_atomic_begin(struct drm_crtc *crtc,
>                               struct drm_atomic_state *state)
>  {
> +       vmw_vkms_crtc_atomic_begin(crtc, state);
>  }
>
>  /**
> @@ -2029,6 +2030,29 @@ vmw_kms_create_hotplug_mode_update_property(struct=
 vmw_private *dev_priv)
>                                           "hotplug_mode_update", 0, 1);
>  }
>
> +static void
> +vmw_atomic_commit_tail(struct drm_atomic_state *old_state)
> +{
> +       struct vmw_private *vmw =3D vmw_priv(old_state->dev);
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *old_crtc_state;
> +       int i;
> +
> +       drm_atomic_helper_commit_tail(old_state);
> +
> +       if (vmw->vkms_enabled) {
> +               for_each_old_crtc_in_state(old_state, crtc, old_crtc_stat=
e, i) {
> +                       struct vmw_display_unit *du =3D vmw_crtc_to_du(cr=
tc);
> +                       (void)old_crtc_state;
> +                       flush_work(&du->vkms.crc_generator_work);
> +               }
> +       }
> +}
> +
> +static const struct drm_mode_config_helper_funcs vmw_mode_config_helpers=
 =3D {
> +       .atomic_commit_tail =3D vmw_atomic_commit_tail,
> +};
> +
>  int vmw_kms_init(struct vmw_private *dev_priv)
>  {
>         struct drm_device *dev =3D &dev_priv->drm;
> @@ -2048,6 +2072,7 @@ int vmw_kms_init(struct vmw_private *dev_priv)
>         dev->mode_config.max_width =3D dev_priv->texture_max_width;
>         dev->mode_config.max_height =3D dev_priv->texture_max_height;
>         dev->mode_config.preferred_depth =3D dev_priv->assume_16bpp ? 16 =
: 32;
> +       dev->mode_config.helper_private =3D &vmw_mode_config_helpers;
>
>         drm_mode_create_suggested_offset_properties(dev);
>         vmw_kms_create_hotplug_mode_update_property(dev_priv);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_kms.h
> index 9e83a1553286..bf9931e3a728 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -378,9 +378,22 @@ struct vmw_display_unit {
>         int set_gui_y;
>
>         struct {
> +               struct work_struct crc_generator_work;
>                 struct hrtimer timer;
>                 ktime_t period_ns;
> -               struct drm_pending_vblank_event *event;
> +
> +               /* protects concurrent access to the vblank handler */
> +               atomic_t atomic_lock;
> +               /* protected by @atomic_lock */
> +               bool crc_enabled;
> +               struct vmw_surface *surface;
> +
> +               /* protects concurrent access to the crc worker */
> +               spinlock_t crc_state_lock;
> +               /* protected by @crc_state_lock */
> +               bool crc_pending;
> +               u64 frame_start;
> +               u64 frame_end;
>         } vkms;
>  };
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index ca300c7427d2..848dba09981b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -1064,6 +1064,22 @@ void vmw_resource_dirty_update(struct vmw_resource=
 *res, pgoff_t start,
>                                            end << PAGE_SHIFT);
>  }
>
> +int vmw_resource_clean(struct vmw_resource *res)
> +{
> +       int ret =3D 0;
> +
> +       if (res->res_dirty) {
> +               if (!res->func->clean)
> +                       return -EINVAL;
> +
> +               ret =3D res->func->clean(res);
> +               if (ret)
> +                       return ret;
> +               res->res_dirty =3D false;
> +       }
> +       return ret;
> +}
> +
>  /**
>   * vmw_resources_clean - Clean resources intersecting a mob range
>   * @vbo: The mob buffer object
> @@ -1080,6 +1096,7 @@ int vmw_resources_clean(struct vmw_bo *vbo, pgoff_t=
 start,
>         unsigned long res_start =3D start << PAGE_SHIFT;
>         unsigned long res_end =3D end << PAGE_SHIFT;
>         unsigned long last_cleaned =3D 0;
> +       int ret;
>
>         /*
>          * Find the resource with lowest backup_offset that intersects th=
e
> @@ -1106,18 +1123,9 @@ int vmw_resources_clean(struct vmw_bo *vbo, pgoff_=
t start,
>          * intersecting the range.
>          */
>         while (found) {
> -               if (found->res_dirty) {
> -                       int ret;
> -
> -                       if (!found->func->clean)
> -                               return -EINVAL;
> -
> -                       ret =3D found->func->clean(found);
> -                       if (ret)
> -                               return ret;
> -
> -                       found->res_dirty =3D false;
> -               }
> +               ret =3D vmw_resource_clean(found);
> +               if (ret)
> +                       return ret;
>                 last_cleaned =3D found->guest_memory_offset + found->gues=
t_memory_size;
>                 cur =3D rb_next(&found->mob_node);
>                 if (!cur)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_stdu.c
> index 665bde7e0be0..2041c4d48daa 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -409,11 +409,6 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_c=
rtc *crtc)
>                           crtc->x, crtc->y);
>  }
>
> -
> -static void vmw_stdu_crtc_helper_prepare(struct drm_crtc *crtc)
> -{
> -}
> -
>  static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
>                                          struct drm_atomic_state *state)
>  {
> @@ -783,6 +778,9 @@ static const struct drm_crtc_funcs vmw_stdu_crtc_func=
s =3D {
>         .enable_vblank          =3D vmw_vkms_enable_vblank,
>         .disable_vblank         =3D vmw_vkms_disable_vblank,
>         .get_vblank_timestamp   =3D vmw_vkms_get_vblank_timestamp,
> +       .get_crc_sources        =3D vmw_vkms_get_crc_sources,
> +       .set_crc_source         =3D vmw_vkms_set_crc_source,
> +       .verify_crc_source      =3D vmw_vkms_verify_crc_source,
>  };
>
>
> @@ -1414,6 +1412,17 @@ vmw_stdu_primary_plane_atomic_update(struct drm_pl=
ane *plane,
>                 vmw_fence_obj_unreference(&fence);
>  }
>
> +static void
> +vmw_stdu_crtc_atomic_flush(struct drm_crtc *crtc,
> +                          struct drm_atomic_state *state)
> +{
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> +       struct vmw_screen_target_display_unit *stdu =3D vmw_crtc_to_stdu(=
crtc);
> +
> +       if (vmw->vkms_enabled)
> +               vmw_vkms_set_crc_surface(crtc, stdu->display_srf);
> +       vmw_vkms_crtc_atomic_flush(crtc, state);
> +}
>
>  static const struct drm_plane_funcs vmw_stdu_plane_funcs =3D {
>         .update_plane =3D drm_atomic_helper_update_plane,
> @@ -1454,11 +1463,10 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_hel=
per_funcs =3D {
>  };
>
>  static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs =3D=
 {
> -       .prepare =3D vmw_stdu_crtc_helper_prepare,
>         .mode_set_nofb =3D vmw_stdu_crtc_mode_set_nofb,
>         .atomic_check =3D vmw_du_crtc_atomic_check,
>         .atomic_begin =3D vmw_du_crtc_atomic_begin,
> -       .atomic_flush =3D vmw_vkms_crtc_atomic_flush,
> +       .atomic_flush =3D vmw_stdu_crtc_atomic_flush,
>         .atomic_enable =3D vmw_vkms_crtc_atomic_enable,
>         .atomic_disable =3D vmw_stdu_crtc_atomic_disable,
>  };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_vkms.c
> index ff76bfd70f91..5138a7107897 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c
> @@ -28,33 +28,179 @@
>
>  #include "vmwgfx_vkms.h"
>
> +#include "vmwgfx_bo.h"
>  #include "vmwgfx_drv.h"
>  #include "vmwgfx_kms.h"
>  #include "vmwgfx_vkms.h"
>
> +#include "vmw_surface_cache.h"
> +
>  #include <drm/drm_crtc.h>
> +#include <drm/drm_debugfs_crc.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
>
> +#include <linux/crc32.h>
> +#include <linux/delay.h>
> +
>  #define GUESTINFO_VBLANK  "guestinfo.vmwgfx.vkms_enable"
>
> -enum hrtimer_restart
> +static int
> +vmw_surface_sync(struct vmw_private *vmw,
> +                struct vmw_surface *surf)
> +{
> +       int ret;
> +       struct vmw_fence_obj *fence =3D NULL;
> +       struct vmw_bo *bo =3D surf->res.guest_memory_bo;
> +
> +       vmw_resource_clean(&surf->res);
> +
> +       ret =3D ttm_bo_reserve(&bo->tbo, false, false, NULL);
> +       if (ret !=3D 0) {
> +               drm_warn(&vmw->drm, "%s: failed reserve\n", __func__);
> +               goto done;
> +       }
> +
> +       ret =3D vmw_execbuf_fence_commands(NULL, vmw, &fence, NULL);
> +       if (ret !=3D 0) {
> +               drm_warn(&vmw->drm, "%s: failed execbuf\n", __func__);
> +               ttm_bo_unreserve(&bo->tbo);
> +               goto done;
> +       }
> +
> +       dma_fence_wait(&fence->base, false);
> +       dma_fence_put(&fence->base);
> +
> +       ttm_bo_unreserve(&bo->tbo);
> +done:
> +       return ret;
> +}
> +
> +static int
> +compute_crc(struct drm_crtc *crtc,
> +           struct vmw_surface *surf,
> +           u32 *crc)
> +{
> +       u8 *mapped_surface;
> +       struct vmw_bo *bo =3D surf->res.guest_memory_bo;
> +       const struct SVGA3dSurfaceDesc *desc =3D
> +               vmw_surface_get_desc(surf->metadata.format);
> +       u32 row_pitch_bytes;
> +       SVGA3dSize blocks;
> +       u32 y;
> +
> +       *crc =3D 0;
> +
> +       vmw_surface_get_size_in_blocks(desc, &surf->metadata.base_size, &=
blocks);
> +       row_pitch_bytes =3D blocks.width * desc->pitchBytesPerBlock;
> +       WARN_ON(!bo);
> +       mapped_surface =3D vmw_bo_map_and_cache(bo);
> +
> +       for (y =3D 0; y < blocks.height; y++) {
> +               *crc =3D crc32_le(*crc, mapped_surface, row_pitch_bytes);
> +               mapped_surface +=3D row_pitch_bytes;
> +       }
> +
> +       vmw_bo_unmap(bo);
> +
> +       return 0;
> +}
> +
> +static void
> +crc_generate_worker(struct work_struct *work)
> +{
> +       struct vmw_display_unit *du =3D
> +               container_of(work, struct vmw_display_unit, vkms.crc_gene=
rator_work);
> +       struct drm_crtc *crtc =3D &du->crtc;
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> +       bool crc_pending;
> +       u64 frame_start, frame_end;
> +       u32 crc32 =3D 0;
> +       struct vmw_surface *surf =3D 0;
> +       int ret;
> +
> +       spin_lock_irq(&du->vkms.crc_state_lock);
> +       crc_pending =3D du->vkms.crc_pending;
> +       spin_unlock_irq(&du->vkms.crc_state_lock);
> +
> +       /*
> +        * We raced with the vblank hrtimer and previous work already com=
puted
> +        * the crc, nothing to do.
> +        */
> +       if (!crc_pending)
> +               return;
> +
> +       spin_lock_irq(&du->vkms.crc_state_lock);
> +       surf =3D du->vkms.surface;
> +       spin_unlock_irq(&du->vkms.crc_state_lock);
> +
> +       if (vmw_surface_sync(vmw, surf)) {
> +               drm_warn(crtc->dev, "CRC worker wasn't able to sync the c=
rc surface!\n");
> +               return;
> +       }
> +
> +       ret =3D compute_crc(crtc, surf, &crc32);
> +       if (ret)
> +               return;
> +
> +       spin_lock_irq(&du->vkms.crc_state_lock);
> +       frame_start =3D du->vkms.frame_start;
> +       frame_end =3D du->vkms.frame_end;
> +       crc_pending =3D du->vkms.crc_pending;
> +       du->vkms.frame_start =3D 0;
> +       du->vkms.frame_end =3D 0;
> +       du->vkms.crc_pending =3D false;
> +       spin_unlock_irq(&du->vkms.crc_state_lock);
> +
> +       /*
> +        * The worker can fall behind the vblank hrtimer, make sure we ca=
tch up.
> +        */
> +       while (frame_start <=3D frame_end)
> +               drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32)=
;
> +}
> +
> +static enum hrtimer_restart
>  vmw_vkms_vblank_simulate(struct hrtimer *timer)
>  {
>         struct vmw_display_unit *du =3D container_of(timer, struct vmw_di=
splay_unit, vkms.timer);
>         struct drm_crtc *crtc =3D &du->crtc;
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> +       struct vmw_surface *surf =3D NULL;
>         u64 ret_overrun;
> -       bool ret;
> +       bool locked, ret;
>
>         ret_overrun =3D hrtimer_forward_now(&du->vkms.timer,
>                                           du->vkms.period_ns);
>         if (ret_overrun !=3D 1)
> -               DRM_WARN("%s: vblank timer overrun\n", __func__);
> +               drm_dbg_driver(crtc->dev, "vblank timer missed %lld frame=
s.\n",
> +                              ret_overrun - 1);
>
> +       locked =3D vmw_vkms_vblank_trylock(crtc);
>         ret =3D drm_crtc_handle_vblank(crtc);
> -       /* Don't queue timer again when vblank is disabled. */
> -       if (!ret)
> -               return HRTIMER_NORESTART;
> +       WARN_ON(!ret);
> +       if (!locked)
> +               return HRTIMER_RESTART;
> +       surf =3D du->vkms.surface;
> +       vmw_vkms_unlock(crtc);
> +
> +       if (du->vkms.crc_enabled && surf) {
> +               u64 frame =3D drm_crtc_accurate_vblank_count(crtc);
> +
> +               spin_lock(&du->vkms.crc_state_lock);
> +               if (!du->vkms.crc_pending)
> +                       du->vkms.frame_start =3D frame;
> +               else
> +                       drm_dbg_driver(crtc->dev,
> +                                      "crc worker falling behind, frame_=
start: %llu, frame_end: %llu\n",
> +                                      du->vkms.frame_start, frame);
> +               du->vkms.frame_end =3D frame;
> +               du->vkms.crc_pending =3D true;
> +               spin_unlock(&du->vkms.crc_state_lock);
> +
> +               ret =3D queue_work(vmw->crc_workq, &du->vkms.crc_generato=
r_work);
> +               if (!ret)
> +                       drm_dbg_driver(crtc->dev, "Composer worker alread=
y queued\n");
> +       }
>
>         return HRTIMER_RESTART;
>  }
> @@ -78,8 +224,21 @@ vmw_vkms_init(struct vmw_private *vmw)
>         if (!ret && vmw->vkms_enabled) {
>                 ret =3D drm_vblank_init(&vmw->drm, VMWGFX_NUM_DISPLAY_UNI=
TS);
>                 vmw->vkms_enabled =3D (ret =3D=3D 0);
> -               drm_info(&vmw->drm, "vkms_enabled =3D %d\n", vmw->vkms_en=
abled);
>         }
> +
> +       vmw->crc_workq =3D alloc_ordered_workqueue("vmwgfx_crc_generator"=
, 0);
> +       if (!vmw->crc_workq) {
> +               drm_warn(&vmw->drm, "crc workqueue allocation failed. Dis=
abling vkms.");
> +               vmw->vkms_enabled =3D false;
> +       }
> +       if (vmw->vkms_enabled)
> +               drm_info(&vmw->drm, "VKMS enabled\n");
> +}
> +
> +void
> +vmw_vkms_cleanup(struct vmw_private *vmw)
> +{
> +       destroy_workqueue(vmw->crc_workq);
>  }
>
>  bool
> @@ -133,6 +292,8 @@ vmw_vkms_enable_vblank(struct drm_crtc *crtc)
>
>         drm_calc_timestamping_constants(crtc, &crtc->mode);
>
> +       hrtimer_init(&du->vkms.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> +       du->vkms.timer.function =3D &vmw_vkms_vblank_simulate;
>         du->vkms.period_ns =3D ktime_set(0, vblank->framedur_ns);
>         hrtimer_start(&du->vkms.timer, du->vkms.period_ns, HRTIMER_MODE_R=
EL);
>
> @@ -148,7 +309,46 @@ vmw_vkms_disable_vblank(struct drm_crtc *crtc)
>         if (!vmw->vkms_enabled)
>                 return;
>
> -       hrtimer_try_to_cancel(&du->vkms.timer);
> +       hrtimer_cancel(&du->vkms.timer);
> +       du->vkms.surface =3D NULL;
> +       du->vkms.period_ns =3D ktime_set(0, 0);
> +}
> +
> +enum vmw_vkms_lock_state {
> +       VMW_VKMS_LOCK_UNLOCKED     =3D 0,
> +       VMW_VKMS_LOCK_MODESET      =3D 1,
> +       VMW_VKMS_LOCK_VBLANK       =3D 2
> +};
> +
> +void
> +vmw_vkms_crtc_init(struct drm_crtc *crtc)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +
> +       atomic_set(&du->vkms.atomic_lock, VMW_VKMS_LOCK_UNLOCKED);
> +       spin_lock_init(&du->vkms.crc_state_lock);
> +
> +       INIT_WORK(&du->vkms.crc_generator_work, crc_generate_worker);
> +       du->vkms.surface =3D NULL;
> +}
> +
> +void
> +vmw_vkms_crtc_cleanup(struct drm_crtc *crtc)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +
> +       WARN_ON(work_pending(&du->vkms.crc_generator_work));
> +       hrtimer_cancel(&du->vkms.timer);
> +}
> +
> +void
> +vmw_vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> +                          struct drm_atomic_state *state)
> +{
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> +
> +       if (vmw->vkms_enabled)
> +               vmw_vkms_modeset_lock(crtc);
>  }
>
>  void
> @@ -170,6 +370,9 @@ vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
>
>                 crtc->state->event =3D NULL;
>         }
> +
> +       if (vmw->vkms_enabled)
> +               vmw_vkms_unlock(crtc);
>  }

An efficiency/codegen-related nitpick that spans two of the changes in this=
 set:

The predicate here -- vmw->vmks_enabled, is also used in the previous
if-then statement as:


if (vmw->vkms_enabled && crtc->state->event) {
    ...
}

if (vmw->vkms_enabled)
    vmw_vkms_unlock(crtc);


Basically, all work in vmw_vkms_crtc_atomic_flush() is conditioned on
that particular predicate, so we can just as well early-out on
vkms_enabled low. Alternatively, if early-out is to be avoided, we can
fetch the predicate just once, as we don't expect it to change for the
duration of the function.

>
>  void
> @@ -191,3 +394,237 @@ vmw_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>         if (vmw->vkms_enabled)
>                 drm_crtc_vblank_off(crtc);
>  }
> +
> +static bool
> +is_crc_supported(struct drm_crtc *crtc)
> +{
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> +
> +       if (!vmw->vkms_enabled)
> +               return false;
> +
> +       if (vmw->active_display_unit !=3D vmw_du_screen_target)
> +               return false;
> +
> +       return true;
> +}
> +
> +static const char * const pipe_crc_sources[] =3D {"auto"};
> +
> +static int
> +crc_parse_source(const char *src_name,
> +                bool *enabled)
> +{
> +       int ret =3D 0;
> +
> +       if (!src_name) {
> +               *enabled =3D false;
> +       } else if (strcmp(src_name, "auto") =3D=3D 0) {
> +               *enabled =3D true;
> +       } else {
> +               *enabled =3D false;
> +               ret =3D -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +const char *const *
> +vmw_vkms_get_crc_sources(struct drm_crtc *crtc,
> +                        size_t *count)
> +{
> +       *count =3D 0;
> +       if (!is_crc_supported(crtc))
> +               return NULL;
> +
> +       *count =3D ARRAY_SIZE(pipe_crc_sources);
> +       return pipe_crc_sources;
> +}
> +
> +int
> +vmw_vkms_verify_crc_source(struct drm_crtc *crtc,
> +                          const char *src_name,
> +                          size_t *values_cnt)
> +{
> +       bool enabled;
> +
> +       if (!is_crc_supported(crtc))
> +               return -EINVAL;
> +
> +       if (crc_parse_source(src_name, &enabled) < 0) {
> +               drm_dbg_driver(crtc->dev, "unknown source '%s'\n", src_na=
me);
> +               return -EINVAL;
> +       }
> +
> +       *values_cnt =3D 1;
> +
> +       return 0;
> +}
> +
> +int
> +vmw_vkms_set_crc_source(struct drm_crtc *crtc,
> +                       const char *src_name)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +       bool enabled, prev_enabled, locked;
> +       int ret;
> +
> +       if (!is_crc_supported(crtc))
> +               return -EINVAL;
> +
> +       ret =3D crc_parse_source(src_name, &enabled);
> +
> +       if (enabled)
> +               drm_crtc_vblank_get(crtc);
> +
> +       locked =3D vmw_vkms_modeset_lock_relaxed(crtc);
> +       prev_enabled =3D du->vkms.crc_enabled;
> +       du->vkms.crc_enabled =3D enabled;
> +       if (locked)
> +               vmw_vkms_unlock(crtc);
> +
> +       if (prev_enabled)
> +               drm_crtc_vblank_put(crtc);
> +
> +       return ret;
> +}
> +
> +void
> +vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
> +                        struct vmw_surface *surf)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +       struct vmw_private *vmw =3D vmw_priv(crtc->dev);
> +
> +       if (vmw->vkms_enabled) {
> +               WARN_ON(atomic_read(&du->vkms.atomic_lock) !=3D VMW_VKMS_=
LOCK_MODESET);
> +               du->vkms.surface =3D surf;
> +       }
> +}
> +
> +/**
> + * vmw_vkms_lock_max_delay - Return the max wait for the vkms lock
> + * @du: The vmw_display_unit from which to grab the vblank timings
> + *
> + * Returns the maximum wait time used to acquire the vkms lock. By
> + * default uses a time of a single frame and in case where vblank
> + * was not initialized for the display unit 1/60th of a second.
> + */
> +static inline u64
> +vmw_vkms_lock_max_wait_ns(struct vmw_display_unit *du)
> +{
> +       s64 nsecs =3D ktime_to_ns(du->vkms.period_ns);
> +
> +       return  (nsecs > 0) ? nsecs : 16666666;
> +}
> +
> +/**
> + * vmw_vkms_modeset_lock - Protects access to crtc during modeset
> + * @crtc: The crtc to lock for vkms
> + *
> + * This function prevents the VKMS timers/callbacks from being called
> + * while a modeset operation is in process. We don't want the callbacks
> + * e.g. the vblank simulator to be trying to access incomplete state
> + * so we need to make sure they execute only when the modeset has
> + * finished.
> + *
> + * Normally this would have been done with a spinlock but locking the
> + * entire atomic modeset with vmwgfx is impossible because kms prepare
> + * executes non-atomic ops (e.g. vmw_validation_prepare holds a mutex to
> + * guard various bits of state). Which means that we need to synchronize
> + * atomic context (the vblank handler) with the non-atomic entirity
> + * of kms - so use an atomic_t to track which part of vkms has access
> + * to the basic vkms state.
> + */
> +void
> +vmw_vkms_modeset_lock(struct drm_crtc *crtc)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +       const u64 nsecs_delay =3D 10;
> +       const u64 MAX_NSECS_DELAY =3D vmw_vkms_lock_max_wait_ns(du);
> +       u64 total_delay =3D 0;
> +       int ret;
> +
> +       do {
> +               ret =3D atomic_cmpxchg(&du->vkms.atomic_lock,
> +                                    VMW_VKMS_LOCK_UNLOCKED,
> +                                    VMW_VKMS_LOCK_MODESET);
> +               if (ret =3D=3D VMW_VKMS_LOCK_UNLOCKED || total_delay >=3D=
 MAX_NSECS_DELAY)
> +                       break;
> +               ndelay(nsecs_delay);
> +               total_delay +=3D nsecs_delay;
> +       } while (1);
> +
> +       if (total_delay >=3D MAX_NSECS_DELAY) {
> +               drm_warn(crtc->dev, "VKMS lock expired! total_delay =3D %=
lld, ret =3D %d, cur =3D %d\n",
> +                        total_delay, ret, atomic_read(&du->vkms.atomic_l=
ock));
> +       }
> +}
> +
> +/**
> + * vmw_vkms_modeset_lock_relaxed - Protects access to crtc during modese=
t
> + * @crtc: The crtc to lock for vkms
> + *
> + * Much like vmw_vkms_modeset_lock except that when the crtc is currentl=
y
> + * in a modeset it will return immediately.
> + *
> + * Returns true if actually locked vkms to modeset or false otherwise.
> + */
> +bool
> +vmw_vkms_modeset_lock_relaxed(struct drm_crtc *crtc)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +       const u64 nsecs_delay =3D 10;
> +       const u64 MAX_NSECS_DELAY =3D vmw_vkms_lock_max_wait_ns(du);
> +       u64 total_delay =3D 0;
> +       int ret;
> +
> +       do {
> +               ret =3D atomic_cmpxchg(&du->vkms.atomic_lock,
> +                                    VMW_VKMS_LOCK_UNLOCKED,
> +                                    VMW_VKMS_LOCK_MODESET);
> +               if (ret =3D=3D VMW_VKMS_LOCK_UNLOCKED ||
> +                   ret =3D=3D VMW_VKMS_LOCK_MODESET ||
> +                   total_delay >=3D MAX_NSECS_DELAY)
> +                       break;
> +               ndelay(nsecs_delay);
> +               total_delay +=3D nsecs_delay;
> +       } while (1);
> +
> +       if (total_delay >=3D MAX_NSECS_DELAY) {
> +               drm_warn(crtc->dev, "VKMS relaxed lock expired!\n");
> +               return false;
> +       }
> +
> +       return ret =3D=3D VMW_VKMS_LOCK_UNLOCKED;
> +}
> +
> +/**
> + * vmw_vkms_vblank_trylock - Protects access to crtc during vblank
> + * @crtc: The crtc to lock for vkms
> + *
> + * Tries to lock vkms for vblank, returns immediately.
> + *
> + * Returns true if locked vkms to vblank or false otherwise.
> + */
> +bool
> +vmw_vkms_vblank_trylock(struct drm_crtc *crtc)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +       u32 ret;
> +
> +       ret =3D atomic_cmpxchg(&du->vkms.atomic_lock,
> +                            VMW_VKMS_LOCK_UNLOCKED,
> +                            VMW_VKMS_LOCK_VBLANK);
> +
> +       return ret =3D=3D VMW_VKMS_LOCK_UNLOCKED;
> +}
> +
> +void
> +vmw_vkms_unlock(struct drm_crtc *crtc)
> +{
> +       struct vmw_display_unit *du =3D vmw_crtc_to_du(crtc);
> +
> +       /* Release flag; mark it as unlocked. */
> +       atomic_set(&du->vkms.atomic_lock, VMW_VKMS_LOCK_UNLOCKED);
> +}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h b/drivers/gpu/drm/vmwgf=
x/vmwgfx_vkms.h
> index 0f6d4ab9ebe3..69ddd33a8444 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_vkms.h
> @@ -32,22 +32,44 @@
>  #include <linux/hrtimer_types.h>
>  #include <linux/types.h>
>
> -struct vmw_private;
> -struct drm_crtc;
>  struct drm_atomic_state;
> +struct drm_crtc;
> +struct vmw_private;
> +struct vmw_surface;
>
>  void vmw_vkms_init(struct vmw_private *vmw);
> +void vmw_vkms_cleanup(struct vmw_private *vmw);
> +
> +void vmw_vkms_modeset_lock(struct drm_crtc *crtc);
> +bool vmw_vkms_modeset_lock_relaxed(struct drm_crtc *crtc);
> +bool vmw_vkms_vblank_trylock(struct drm_crtc *crtc);
> +void vmw_vkms_unlock(struct drm_crtc *crtc);
> +
>  bool vmw_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
>                                    int *max_error,
>                                    ktime_t *vblank_time,
>                                    bool in_vblank_irq);
>  int vmw_vkms_enable_vblank(struct drm_crtc *crtc);
>  void vmw_vkms_disable_vblank(struct drm_crtc *crtc);
> +
> +void vmw_vkms_crtc_init(struct drm_crtc *crtc);
> +void vmw_vkms_crtc_cleanup(struct drm_crtc *crtc);
> +void  vmw_vkms_crtc_atomic_begin(struct drm_crtc *crtc,
> +                                struct drm_atomic_state *state);
>  void vmw_vkms_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic=
_state *state);
> -enum hrtimer_restart vmw_vkms_vblank_simulate(struct hrtimer *timer);
>  void vmw_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
>                                  struct drm_atomic_state *state);
>  void vmw_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
>                                   struct drm_atomic_state *state);
>
> +const char *const *vmw_vkms_get_crc_sources(struct drm_crtc *crtc,
> +                                           size_t *count);
> +int vmw_vkms_verify_crc_source(struct drm_crtc *crtc,
> +                              const char *src_name,
> +                              size_t *values_cnt);
> +int vmw_vkms_set_crc_source(struct drm_crtc *crtc,
> +                           const char *src_name);
> +void vmw_vkms_set_crc_surface(struct drm_crtc *crtc,
> +                             struct vmw_surface *surf);
> +
>  #endif
> --
> 2.40.1
>

Regards,
Martin
