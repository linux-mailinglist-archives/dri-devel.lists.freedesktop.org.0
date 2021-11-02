Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202C24433A2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FF1732B2;
	Tue,  2 Nov 2021 16:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA9F732B2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 16:47:16 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2562882wmz.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MM4U8OxTTBsC+CGULK+tfZc2fJWm7ZzFiLqrtjhGXgw=;
 b=UM0Z8w3309IL/SgU+FerRT6mAyqaQW5t5HBwCU63gZ/t3BIfWdF8MINXIYscqnxkYR
 5+O42gH7bi8X58hP/k0RGIhypkn9PQRbukbtR3vJwQHK9OyB7SoQIFu6K/mDQTXPrZaW
 skYch/0SwgMOrxu5LREURfwxtzvsKecaRj+Kk4ao5hw6uHcia0F1xuNNHVx5A+DbQPfQ
 29PomrEWSL8iwTOxczG2/39ulYRnpY5z9kmYwMsLH1pKjNYDY3Ur6QuvbqmR73w7o5hE
 X/+DbWuBsXctme/i8GDLbxFIqEEKocbqWpK2fHFh6BGvmxETaZlh4Ua4W0xq6GyQsWJr
 ky2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MM4U8OxTTBsC+CGULK+tfZc2fJWm7ZzFiLqrtjhGXgw=;
 b=1tSjZ4OmDzfSLxV5a5iJsD0M0E35TnnJxa3f3AOtj20B8gCbFVT9USAYC2imgSyS/C
 9KH3ujWo4iUU8HHSkZJu2Y5q9z0jP/SWmeCASuCTu2ORc4DPkXRhns/M+jB/z5QRlsUq
 zmLsYvcLXf1ZNoHqz9R2ZH4+2RoY9l+9qSwPsDu0OOnv7PrS5/x3eRfAXU2md9R2phez
 15UGlfFP417/b8t+6GS54uE1M0Fr9MiQr0kkYEzt00msi6vDisOch25gbWDwB+dkwYyu
 r0cx6wTpsbWj72XYiAY+XwEciZncpvvv9UNC930LWlVP3NwjhXgdY/8DC9e2YEEa4S5D
 OoBg==
X-Gm-Message-State: AOAM532j7hlw8rUQxts7ODVUKotrF0apGitAqlgAR+5a9QNZq4Gfiwrx
 28JAk0tgiZTbfEWNfTdwfvvWm/9LW87yii1BGson7w==
X-Google-Smtp-Source: ABdhPJwqiBEu7rQEr0yiHdHLzzx0ECjHopvd+OCLX7p+1tHVBu7iZ4acoz0A0s0BKq/Z3MdmzPBhH4TBAXbzHK4c+sA=
X-Received: by 2002:a1c:1f06:: with SMTP id f6mr8330799wmf.55.1635871634688;
 Tue, 02 Nov 2021 09:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-8-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-8-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 16:46:58 +0000
Message-ID: <CAPY8ntBo+xpeRSmOGLJNw_Kd2F-Azz-P244mxtvqyWM7ugZFZA@mail.gmail.com>
Subject: Re: [PATCH v8 07/10] drm/vc4: Leverage the load tracker on the BCM2711
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 25 Oct 2021 at 16:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The load tracker was initially designed to report and warn about a load
> too high for the HVS. To do so, it computes for each plane the impact
> it's going to have on the HVS, and will warn (if it's enabled) if we go
> over what the hardware can process.
>
> While the limits being used are a bit irrelevant to the BCM2711, the
> algorithm to compute the HVS load will be one component used in order to
> compute the core clock rate on the BCM2711.
>
> Let's remove the hooks to prevent the load tracker to do its
> computation, but since we don't have the same limits, don't check them
> against them, and prevent the debugfs file to enable it from being
> created.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_debugfs.c |  7 +++++--
>  drivers/gpu/drm/vc4/vc4_drv.h     |  3 ---
>  drivers/gpu/drm/vc4/vc4_kms.c     | 16 +++++-----------
>  drivers/gpu/drm/vc4/vc4_plane.c   |  5 -----
>  4 files changed, 10 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
> index 6da22af4ee91..ba2d8ea562af 100644
> --- a/drivers/gpu/drm/vc4/vc4_debugfs.c
> +++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
> @@ -7,6 +7,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/ctype.h>
>  #include <linux/debugfs.h>
> +#include <linux/platform_device.h>
>
>  #include "vc4_drv.h"
>  #include "vc4_regs.h"
> @@ -26,8 +27,10 @@ vc4_debugfs_init(struct drm_minor *minor)
>         struct vc4_dev *vc4 = to_vc4_dev(minor->dev);
>         struct vc4_debugfs_info_entry *entry;
>
> -       debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
> -                           minor->debugfs_root, &vc4->load_tracker_enabled);
> +       if (!of_device_is_compatible(vc4->hvs->pdev->dev.of_node,
> +                                    "brcm,bcm2711-vc5"))
> +               debugfs_create_bool("hvs_load_tracker", S_IRUGO | S_IWUSR,
> +                                   minor->debugfs_root, &vc4->load_tracker_enabled);
>
>         list_for_each_entry(entry, &vc4->debugfs_list, link) {
>                 drm_debugfs_create_files(&entry->info, 1,
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 60826aca9e5b..813c5d0ea98e 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -202,9 +202,6 @@ struct vc4_dev {
>
>         int power_refcount;
>
> -       /* Set to true when the load tracker is supported. */
> -       bool load_tracker_available;
> -
>         /* Set to true when the load tracker is active. */
>         bool load_tracker_enabled;
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 028f19f7a5f8..41cb4869da50 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -552,9 +552,6 @@ static int vc4_load_tracker_atomic_check(struct drm_atomic_state *state)
>         struct drm_plane *plane;
>         int i;
>
> -       if (!vc4->load_tracker_available)
> -               return 0;
> -
>         priv_state = drm_atomic_get_private_obj_state(state,
>                                                       &vc4->load_tracker);
>         if (IS_ERR(priv_state))
> @@ -629,9 +626,6 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
>  {
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>
> -       if (!vc4->load_tracker_available)
> -               return;
> -
>         drm_atomic_private_obj_fini(&vc4->load_tracker);
>  }
>
> @@ -639,9 +633,6 @@ static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
>  {
>         struct vc4_load_tracker_state *load_state;
>
> -       if (!vc4->load_tracker_available)
> -               return 0;
> -
>         load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
>         if (!load_state)
>                 return -ENOMEM;
> @@ -869,9 +860,12 @@ int vc4_kms_load(struct drm_device *dev)
>                                               "brcm,bcm2711-vc5");
>         int ret;
>
> +       /*
> +        * The limits enforced by the load tracker aren't relevant for
> +        * the BCM2711, but the load tracker computations are used for
> +        * the core clock rate calculation.
> +        */
>         if (!is_vc5) {
> -               vc4->load_tracker_available = true;
> -
>                 /* Start with the load tracker enabled. Can be
>                  * disabled through the debugfs load_tracker file.
>                  */
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 19161b6ab27f..ac761c683663 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -529,11 +529,6 @@ static void vc4_plane_calc_load(struct drm_plane_state *state)
>         struct vc4_plane_state *vc4_state;
>         struct drm_crtc_state *crtc_state;
>         unsigned int vscale_factor;
> -       struct vc4_dev *vc4;
> -
> -       vc4 = to_vc4_dev(state->plane->dev);
> -       if (!vc4->load_tracker_available)
> -               return;
>
>         vc4_state = to_vc4_plane_state(state);
>         crtc_state = drm_atomic_get_existing_crtc_state(state->state,
> --
> 2.31.1
>
