Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62E1E4B08
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 18:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA3C6E351;
	Wed, 27 May 2020 16:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868EC6E351
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 16:52:47 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id b6so29816710ljj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3s8Z6TqgZ6rWtKMmi0vz86r9c3ZptE+7p8K+InML9XA=;
 b=hheOM/T3hgh3E9Yc0l9MkrAt26GKtRqNh6+lDuuRkJ/Z+uJHoSZl2dSFjgqp7BBq2L
 /SLxlWegH7b1a2tMbGhTqU9tk1RRu8RG6IgFKbDUfWCaHOMYtga8OzWAy6QPqhf6afE4
 BPHSLALrgxXbCKxk2lUBsDW7mQzcA5W1z6ovU9gQF7mTlBL1LR3YrrkKMxwQdgJtC1Ut
 U7d3H4vDH+D55QCG6JckSgD+23dcS96mwHuITUzmtasl8ytZgd9iNVVwwbWAHw1fvaPE
 kCJTA2dYBT45FIiwBmfqzZzr0+fDKMIxtpDKto1RUd6bnbcf/FYbBHHIeQMNoFLcbZ4N
 gfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3s8Z6TqgZ6rWtKMmi0vz86r9c3ZptE+7p8K+InML9XA=;
 b=ffz6x1QJ8d0gw/Cx25WrojF5ixR3VbcTdAt1ck4rBXlZ3YOEsmvC5S57w1zc05pCOG
 7/sqZrzDSMFThT6Khdh5kTwqvQldYpfzj2RnSr0WV6hCieiHVUQ9SSNNsZqAx5uUeM9c
 ctlF1ZEDeq7fBxBxrcUR2UEUwq+MignkSXbZuKOJL/I/iiKdOhhBxZxqWy74nx02irYg
 VL5WopbU3J6dGa4mGxc4aD7mRYayydvRd13pjHB35ImPBPfa4n+pQzkUXdrsj578DIFA
 MvKPyv/5XiKHgghYZAvKe1VjoOHVqB53WiBsSXt+GNPWaK7prHnHlK79W6oa8P2cdlFW
 UAAw==
X-Gm-Message-State: AOAM533eG40zxDfxXL0/6QSAhX8pnSLmV4XbipdqIxZeuq05rQP9Hcod
 2/ti6lWeOu4KePlPVPRXz2EjGG8ch7ma6SVBbrOxBw==
X-Google-Smtp-Source: ABdhPJykPtRUbq3wuH3bc4nCEgiCAkTCt706TKmwFiZu59fzrGES6YLoGp3T1oNdU87IWiuXxpt7gGN7IYPEMgs6uZM=
X-Received: by 2002:a2e:b0ec:: with SMTP id h12mr3253838ljl.269.1590598365768; 
 Wed, 27 May 2020 09:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <74d84c75511974bc1ff4bc044413894a43a907a6.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <74d84c75511974bc1ff4bc044413894a43a907a6.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 09:52:34 -0700
Message-ID: <CADaigPWzgP=C86D6zWN-z_tajFP8-F8GrQ-TcSzUt2cHcM8=8A@mail.gmail.com>
Subject: Re: [PATCH v3 020/105] drm/vc4: plane: Create overlays for any CRTC
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 8:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Now that we have everything in place, we can now register all the overlay
> planes that can be assigned to all the CRTCs.
>
> This has two side effects:
>
>   - The number of overlay planes is reduced from 24 to 8. This is temporary
>     and will be increased again in the next patch.
>
>   - The ID of the various planes is changed again, and we will now have all
>     the primary planes, then all the overlay planes and finally the cursor
>     planes. This shouldn't cause any issue since the ordering between
>     primary, overlay and cursor planes is preserved.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Honestly, I'd squash this with the previous two patches, the
individual refactors don't make much sense on their own or simplify
this patch I think.  Either way, patch 17-29 r-b.




> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 35 +++++++++++++++++-----------------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 824c188980b0..5335123ae2a0 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -1378,26 +1378,27 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
>         struct drm_crtc *crtc;
>         unsigned int i;
>
> -       drm_for_each_crtc(crtc, drm) {
> -               /* Set up some arbitrary number of planes.  We're not limited
> -                * by a set number of physical registers, just the space in
> -                * the HVS (16k) and how small an plane can be (28 bytes).
> -                * However, each plane we set up takes up some memory, and
> -                * increases the cost of looping over planes, which atomic
> -                * modesetting does quite a bit.  As a result, we pick a
> -                * modest number of planes to expose, that should hopefully
> -                * still cover any sane usecase.
> -                */
> -               for (i = 0; i < 8; i++) {
> -                       struct drm_plane *plane =
> -                               vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
> +       /* Set up some arbitrary number of planes.  We're not limited
> +        * by a set number of physical registers, just the space in
> +        * the HVS (16k) and how small an plane can be (28 bytes).
> +        * However, each plane we set up takes up some memory, and
> +        * increases the cost of looping over planes, which atomic
> +        * modesetting does quite a bit.  As a result, we pick a
> +        * modest number of planes to expose, that should hopefully
> +        * still cover any sane usecase.
> +        */
> +       for (i = 0; i < 8; i++) {
> +               struct drm_plane *plane =
> +                       vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
>
> -                       if (IS_ERR(plane))
> -                               continue;
> +               if (IS_ERR(plane))
> +                       continue;
>
> -                       plane->possible_crtcs = drm_crtc_mask(crtc);
> -               }
> +               plane->possible_crtcs =
> +                       GENMASK(drm->mode_config.num_crtc - 1, 0);
> +       }
>
> +       drm_for_each_crtc(crtc, drm) {
>                 /* Set up the legacy cursor after overlay initialization,
>                  * since we overlay planes on the CRTC in the order they were
>                  * initialized.
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
