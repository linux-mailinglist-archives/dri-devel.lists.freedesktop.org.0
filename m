Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED82D6F526D
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 09:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B1010E1DE;
	Wed,  3 May 2023 07:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5F410E1DE
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 07:59:23 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-546eca4afc2so602449eaf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 00:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1683100762; x=1685692762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TaGSfCLCemp7s6H8viMDc0YOvT2xAL3xFCHV/axut+o=;
 b=aDBOAVIbJoBSeL0ejejvH31HahRyxqwTeFsmucjja57zJ4BzU7JEeNG8CJwxCRe8v8
 cgzbNPnO7dCLIMFyE6BD80IRfAEegeMW8vEmHADrVf7wy9qcYnrFtZrELB2A9+sFwVC2
 QDDGAWb5JbhX2xC6NIhqwXNJiajeG7FsKJKwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683100762; x=1685692762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TaGSfCLCemp7s6H8viMDc0YOvT2xAL3xFCHV/axut+o=;
 b=WQE6jNTn22lsLph6GmwVh+4ZFzj+flt4zUHrGe9XXtl0Vs9IUl31IKtwMWTbpozKQ3
 jplIWN5J41VAUVXANvde2ZYXV8iuNS0OvIF5oWU9I0Nwk+hd07V3Z0gCsz0HqQqcLoRi
 2yq4AKyP9gD5GmSXpqRc6wjZKCr+1GzZNFu4NxTfDpKrtHxuvgZqmp0NHwcEG0/SGRY3
 rH1iDslsSt/a1qeDeomrPuXw5JFcxMAPzIeWYcwAzwnjDmXYzuTWqU2yGS5UaUFNPPne
 RTDyz0dWEYb52c8jN5Qa6z25NBBgW4Ooi6I6hZkg7dc8KUVAGTcQYFpSp9XtC4Hy+w6T
 JmLQ==
X-Gm-Message-State: AC+VfDzrdREiYFmdDrrIkbwJU3K1usuEtyk4CoIDcdY0fiSgt1Lo5z+q
 FHBcnxLKBIc2IT2BbQC+lE9A8XSY594oWF1zKGELcg==
X-Google-Smtp-Source: ACHHUZ7y+p7TDYBZoUBIAtXpB4m2beBqaoSH1mlQOZbZRJkPYvQ9xQFvshTwZ6Yi9PONxNt+/riqztEZ+UbO7QhwCpc=
X-Received: by 2002:aca:6206:0:b0:38e:ca01:3a65 with SMTP id
 w6-20020aca6206000000b0038eca013a65mr6403755oib.1.1683100762343; Wed, 03 May
 2023 00:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-3-zack@kde.org>
In-Reply-To: <20220712033246.1148476-3-zack@kde.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 May 2023 09:59:11 +0200
Message-ID: <CAKMK7uFn+GhVf+wFbhr4GZmnrDr_1X-TkzdFd3k3YP0ztewuOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/atomic: Add support for mouse hotspots
To: Zack Rusin <zackr@vmware.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 krastevm@vmware.com, ppaalanen@gmail.com,
 Thomas Zimmermann <tzimmermann@suse.de>, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 12 Jul 2022 at 05:33, Zack Rusin <zack@kde.org> wrote:
>
> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting code lacked support for specifying mouse cursor
> hotspots. The legacy kms DRM_IOCTL_MODE_CURSOR2 had support for setting
> the hotspot but the functionality was not implemented in the new atomic
> paths.
>
> Due to the lack of hotspots in the atomic paths userspace compositors
> completely disable atomic modesetting for drivers that require it (i.e.
> all paravirtualized drivers).
>
> This change adds hotspot properties to the atomic codepaths throughtout
> the DRM core and will allow enabling atomic modesetting for virtualized
> drivers in the userspace.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 14 +++++++
>  drivers/gpu/drm/drm_atomic_uapi.c         | 20 ++++++++++
>  drivers/gpu/drm/drm_plane.c               | 47 +++++++++++++++++++++++
>  include/drm/drm_plane.h                   | 15 ++++++++
>  4 files changed, 96 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index bf31b9d92094..9c4fda0b35e8 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -275,6 +275,20 @@ void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *plane_state,
>                         plane_state->normalized_zpos = val;
>                 }
>         }
> +
> +       if (plane->hotspot_x_property) {
> +               if (!drm_object_property_get_default_value(&plane->base,
> +                                                          plane->hotspot_x_property,
> +                                                          &val))
> +                       plane_state->hotspot_x = val;
> +       }
> +
> +       if (plane->hotspot_y_property) {
> +               if (!drm_object_property_get_default_value(&plane->base,
> +                                                          plane->hotspot_y_property,
> +                                                          &val))
> +                       plane_state->hotspot_y = val;
> +       }
>  }
>  EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
>
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 79730fa1dd8e..6132540c97a9 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -575,6 +575,22 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
>         } else if (plane->funcs->atomic_set_property) {
>                 return plane->funcs->atomic_set_property(plane, state,
>                                 property, val);
> +       } else if (property == plane->hotspot_x_property) {
> +               if (plane->type != DRM_PLANE_TYPE_CURSOR) {
> +                       drm_dbg_atomic(plane->dev,
> +                                      "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> +                                      plane->base.id, plane->name, val);
> +                       return -EINVAL;
> +               }
> +               state->hotspot_x = val;
> +       } else if (property == plane->hotspot_y_property) {
> +               if (plane->type != DRM_PLANE_TYPE_CURSOR) {
> +                       drm_dbg_atomic(plane->dev,
> +                                      "[PLANE:%d:%s] is not a cursor plane: 0x%llx\n",
> +                                      plane->base.id, plane->name, val);
> +                       return -EINVAL;
> +               }
> +               state->hotspot_y = val;
>         } else {
>                 drm_dbg_atomic(plane->dev,
>                                "[PLANE:%d:%s] unknown property [PROP:%d:%s]]\n",
> @@ -635,6 +651,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
>                 *val = state->scaling_filter;
>         } else if (plane->funcs->atomic_get_property) {
>                 return plane->funcs->atomic_get_property(plane, state, property, val);
> +       } else if (property == plane->hotspot_x_property) {
> +               *val = state->hotspot_x;
> +       } else if (property == plane->hotspot_y_property) {
> +               *val = state->hotspot_y;
>         } else {
>                 return -EINVAL;
>         }
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index e1e2a65c7119..0a6a1b5adf82 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -343,6 +343,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
>                 drm_object_attach_property(&plane->base, config->prop_src_w, 0);
>                 drm_object_attach_property(&plane->base, config->prop_src_h, 0);
>         }
> +       if (drm_core_check_feature(dev, DRIVER_VIRTUAL) &&
> +           type == DRM_PLANE_TYPE_CURSOR) {
> +               drm_plane_create_hotspot_properties(plane);
> +       }
>
>         if (format_modifier_count)
>                 create_in_format_blob(dev, plane);
> @@ -1054,6 +1058,11 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
>
>                         fb->hot_x = req->hot_x;
>                         fb->hot_y = req->hot_y;
> +
> +                       if (plane->hotspot_x_property && plane->state)
> +                               plane->state->hotspot_x = req->hot_x;
> +                       if (plane->hotspot_y_property && plane->state)
> +                               plane->state->hotspot_y = req->hot_y;
>                 } else {
>                         fb = NULL;
>                 }
> @@ -1582,3 +1591,41 @@ int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>         return 0;
>  }
>  EXPORT_SYMBOL(drm_plane_create_scaling_filter_property);
> +
> +/**
> + * drm_plane_create_hotspot_properties - creates the mouse hotspot
> + * properties and attaches them to the given cursor plane
> + *
> + * @plane: drm cursor plane
> + *
> + * This function lets driver to enable the mouse hotspot property on a given
> + * cursor plane.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_plane_create_hotspot_properties(struct drm_plane *plane)
> +{

So I don't really like the DRIVER_VIRTUAL flag as mentioned in another
reply, but that's a bit a bikeshed so *meh*.

What is more real is that driver flags in general have the issue that
you need to keep two entirely separate things in sync: The actual
driver code in the cursor support and the flag somewhere totally else.
That's why I don't like them, and a flag on the plane would be a lot
better. And this function here could then set that flag to make sure
things _never_ get out of sync.

Minimally we need a WARN_ON here that asserts that the DRIVER_VIRTUAL
flag is set.
-Daniel

> +       struct drm_property *prop_x;
> +       struct drm_property *prop_y;
> +
> +       prop_x = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_X",
> +                                                 INT_MIN, INT_MAX);
> +       if (IS_ERR(prop_x))
> +               return PTR_ERR(prop_x);
> +
> +       prop_y = drm_property_create_signed_range(plane->dev, 0, "HOTSPOT_Y",
> +                                                 INT_MIN, INT_MAX);
> +       if (IS_ERR(prop_y)) {
> +               drm_property_destroy(plane->dev, prop_x);
> +               return PTR_ERR(prop_y);
> +       }
> +
> +       drm_object_attach_property(&plane->base, prop_x, 0);
> +       drm_object_attach_property(&plane->base, prop_y, 0);
> +       plane->hotspot_x_property = prop_x;
> +       plane->hotspot_y_property = prop_y;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_plane_create_hotspot_properties);
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 89ea54652e87..09d3e3791e67 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -116,6 +116,10 @@ struct drm_plane_state {
>         /** @src_h: height of visible portion of plane (in 16.16) */
>         uint32_t src_h, src_w;
>
> +       /** @hotspot_x: x offset to mouse cursor hotspot */
> +       /** @hotspot_y: y offset to mouse cursor hotspot */
> +       int32_t hotspot_x, hotspot_y;
> +
>         /**
>          * @alpha:
>          * Opacity of the plane with 0 as completely transparent and 0xffff as
> @@ -748,6 +752,16 @@ struct drm_plane {
>          * scaling.
>          */
>         struct drm_property *scaling_filter_property;
> +
> +       /**
> +        * @hotspot_x_property: property to set mouse hotspot x offset.
> +        */
> +       struct drm_property *hotspot_x_property;
> +
> +       /**
> +        * @hotspot_y_property: property to set mouse hotspot y offset.
> +        */
> +       struct drm_property *hotspot_y_property;
>  };
>
>  #define obj_to_plane(x) container_of(x, struct drm_plane, base)
> @@ -907,5 +921,6 @@ drm_plane_get_damage_clips(const struct drm_plane_state *state);
>
>  int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
>                                              unsigned int supported_filters);
> +int drm_plane_create_hotspot_properties(struct drm_plane *plane);
>
>  #endif
> --
> 2.34.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
