Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F8E2D7654
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F71E6EDDA;
	Fri, 11 Dec 2020 13:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D77426EDDA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:14:20 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id w124so6625108oia.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GIwHB0YrQqZISBcn/NxMnRKcOgnqSxa34tESDPNXPsw=;
 b=B8GXdPzOQxibmOO/p2L3C+rhlkyOaCXeOvqU58qCrTGw+woOvsiGs1ngG+HZazsEyI
 nGI7O+DFaHjpXVMkShlJHWiztvXRCWYl/cJ1r8u3svuEa6ZCG24m5/3mWYxMZGhJ5z7q
 5+MYY/SkIj/vj1KF8MCk4PNHPlNYjDGc+IoV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GIwHB0YrQqZISBcn/NxMnRKcOgnqSxa34tESDPNXPsw=;
 b=cEZNH5T8JCwqPF2jCEmb1FHUl9ZGrKBydNhihKDnrZjpD9si+fMr08sMcIcaKSC1mZ
 oEKDo8Y+aMzYbVT579TkrMA0EO9u/flSUXTimUDEzaovxAa69DhG5ywTkAtPy/3p4oHV
 +brghyGZ9fIxZsn4gGafvkViuf1uWl6tt+oh6fsMAY9MQGh7buXpF1sRk+L3ViZq9jhN
 Toro/GpRKgF3/XXJtZZxsvRFRPeyLECn01UbR6IsF+q/Pqhy+ZI3YJVgFpou0EgsUA7b
 qf52lPgV5UbmS5OWXVG2Pbxz8a9w7+dQ+S3RObu3HZ2HMIeM6JsDjxclbM3V6XvBaqKp
 Qygg==
X-Gm-Message-State: AOAM532fzakemfYGGOccvHV35AdfHYhgg40/MY2TtQJfkzMPmUDatS+U
 +17rVEoE1tS+0HFx42Hed4wnjAW/rABmnjV1g2BnGw==
X-Google-Smtp-Source: ABdhPJzjD3EIdFRkgXm0iEDo94xjo7T9kXtAdOoafFU+x06/eKejCNxsWERt+ufJmRC0vrkBnRKYqKxuF4SLdM93Dvs=
X-Received: by 2002:aca:4d08:: with SMTP id a8mr9316493oib.128.1607692460250; 
 Fri, 11 Dec 2020 05:14:20 -0800 (PST)
MIME-Version: 1.0
References: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
In-Reply-To: <diZcSZPAu0GrvVEqzkkXk1LYv1pDkE536hsLoYTUoUw@cp3-web-016.plabs.ch>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 11 Dec 2020 14:14:08 +0100
Message-ID: <CAKMK7uHYVbN=vv1iCfz7WpiwmgM02Lr8GS4qXCPBWcY0-qThjQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm: require each CRTC to have a unique primary
 plane
To: Simon Ser <contact@emersion.fr>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 2:08 PM Simon Ser <contact@emersion.fr> wrote:
>
> User-space expects to be able to pick a primary plane for each CRTC
> exposed by the driver. Make sure this assumption holds in
> drm_mode_config_validate.
>
> Use the legacy drm_crtc.primary field to check this, because it's
> simpler and we require drivers to set it anyways. Accumulate a set of
> primary planes which are already used for a CRTC in a bitmask. Error out
> if a primary plane is re-used.
>
> v2: new patch
>
> v3:
> - Use u64 instead of __u64 (Jani)
> - Use `unsigned int` instead of `unsigned` (Jani)
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>

Yeah makes sense to also check this.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/drm_plane.c       |  6 ++++++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index fbe680035129..c5cf5624c106 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -626,6 +626,9 @@ void drm_mode_config_validate(struct drm_device *dev)
>  {
>         struct drm_encoder *encoder;
>         struct drm_crtc *crtc;
> +       struct drm_plane *plane;
> +       u64 primary_with_crtc = 0, cursor_with_crtc = 0;
> +       unsigned int num_primary = 0;
>
>         if (!drm_core_check_feature(dev, DRIVER_MODESET))
>                 return;
> @@ -647,12 +650,30 @@ void drm_mode_config_validate(struct drm_device *dev)
>                              "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
>                              crtc->primary->base.id, crtc->primary->name,
>                              crtc->base.id, crtc->name);
> +                       WARN(primary_with_crtc & BIT(crtc->primary->index),
> +                            "Primary plane [PLANE:%d:%s] used for two CRTCs",
> +                            crtc->primary->base.id, crtc->primary->name);
> +                       primary_with_crtc |= BIT(crtc->primary->index);
>                 }
>                 if (crtc->cursor) {
>                         WARN(!(crtc->cursor->possible_crtcs & BIT(crtc->index)),
>                              "Bogus cursor plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
>                              crtc->cursor->base.id, crtc->cursor->name,
>                              crtc->base.id, crtc->name);
> +                       WARN(cursor_with_crtc & BIT(crtc->cursor->index),
> +                            "Primary plane [PLANE:%d:%s] used for two CRTCs",
> +                            crtc->cursor->base.id, crtc->cursor->name);
> +                       cursor_with_crtc |= BIT(crtc->cursor->index);
>                 }
>         }
> +
> +       drm_for_each_plane(plane, dev) {
> +               if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
> +                       num_primary++;
> +               }
> +       }
> +
> +       WARN(num_primary != dev->mode_config.num_crtc,
> +            "Must have as many primary planes as there are CRTCs, but have %u primary planes and %u CRTCs",
> +            num_primary, dev->mode_config.num_crtc);
>  }
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 49b0a8b9ac02..a1f4510efa83 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -54,6 +54,12 @@
>   * enum drm_plane_type). A plane can be compatible with multiple CRTCs, see
>   * &drm_plane.possible_crtcs.
>   *
> + * Each CRTC must have a unique primary plane userspace can attach to enable
> + * the CRTC. In other words, userspace must be able to attach a different
> + * primary plane to each CRTC at the same time. Primary planes can still be
> + * compatible with multiple CRTCs. There must be exactly as many primary planes
> + * as there are CRTCs.
> + *
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
>   * relies on the driver to set the primary and optionally the cursor plane used
>   * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
> --
> 2.29.2
>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
