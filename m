Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89F38CCCD
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D03289789;
	Fri, 21 May 2021 17:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEAD89C9A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:58:24 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id z17so21865153wrq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z4UPkdAETElY8CE5R1/XdSazK5Qz+lJk4BEU0MOMZSI=;
 b=b+kvebj13rLEmw+fxFi1/ebO2RLXB62bwasf0W8fck9af45XdYb87TjB0NIG13ZQXX
 ZV2pa1hpIQXAkz37IHuJjd/H3D7pxXMUL0aklHPm28wWYcOpoRJlKP0WY2cW/o9B9C5d
 GlepTRpJasKxkAGfzjTKfo6E6zE1ayu79tktEmZbR+pqtY3OUV/Unoc132tun3gv51Xc
 kxJka0onSj+SKKRYaSTZb3oIjmxooyQc/rpF4Myul72Hv1b5K/sJ9kOmhbi0AFPghpHW
 CEDnLLyPwaOBF6QHV+IHmR8WXmSUoSdLae5vyqJVDlX3H0i5rKRS2vQki2VidMN3xV7Q
 OrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z4UPkdAETElY8CE5R1/XdSazK5Qz+lJk4BEU0MOMZSI=;
 b=XPhxffbjTx1lNHKPAZkNzNzMgXGfUEP79xIQXRxs5L85jPh//v0Y2cvtWlKwBLCmaB
 SBtO5g7C3/BrORReRt+FEHxW1/8ahK0VYvxegTpTbXwanBhFpLfpignjM7R3FUlUZLb6
 VUQQbYDGDmO8PD84S6O8PYVwYsDWQGY3ffG+Ug7U9T2Vr3cZPLD2waG/S9eE17I7Hjtj
 Mcz5JkGwgHM+10amS5J5ceHEAjL5Vq6xrI3AL1o6e7DGeAveCG/k1EW/KdMJfCOAoIEi
 ATHW4RcBQrrQMYXilyHQQCO2Se47QYSGtkjwBXQdZ7zmhCbFflLJh0rrrY5KPKldygd0
 s3tQ==
X-Gm-Message-State: AOAM531Vc9G8+ZwtBPqrMqw3gDGet4j5QPwoUkJ0xbVKsBUjwQbpz95V
 rg7LdjgnotpQ6S23TUiYxumK3YJAqxoxidMMkd614g==
X-Google-Smtp-Source: ABdhPJz0OURHGGTLgcEshabcsCSN10Z5JJOefPXqXbtqa7/XYh303oD8IqGr6x4WAjJiIqFblb//uXxSrKDJiGrO/kc=
X-Received: by 2002:a5d:618f:: with SMTP id j15mr10644394wru.273.1621619903001; 
 Fri, 21 May 2021 10:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210507150515.257424-1-maxime@cerno.tech>
 <20210507150515.257424-6-maxime@cerno.tech>
In-Reply-To: <20210507150515.257424-6-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 May 2021 18:58:06 +0100
Message-ID: <CAPY8ntDCv-+1AUz_dcKmjxRe6sxEyDABhY6OnKBWeBJGtf3o1A@mail.gmail.com>
Subject: Re: [PATCH v4 05/12] drm/vc4: crtc: Lookup the encoder from the
 register at boot
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
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Fri, 7 May 2021 at 16:05, Maxime Ripard <maxime@cerno.tech> wrote:
>
> At boot, we can't rely on the vc4_get_crtc_encoder since we don't have a
> state yet and thus will not be able to figure out which connector is
> attached to our CRTC.
>
> However, we have a muxing bit in the CRTC register we can use to get the
> encoder currently connected to the pixelvalve. We can thus read that
> register, lookup the associated register through the vc4_pv_data
> structure, and then pass it to vc4_crtc_disable so that we can perform
> the proper operations.
>
> Fixes: 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot time")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c | 38 ++++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 36ea684a349b..f715648f89dd 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -413,11 +413,10 @@ static void require_hvs_enabled(struct drm_device *dev)
>  }
>
>  static int vc4_crtc_disable(struct drm_crtc *crtc,
> +                           struct drm_encoder *encoder,
>                             struct drm_atomic_state *state,
>                             unsigned int channel)
>  {
> -       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> -                                                          drm_atomic_get_old_connector_state);
>         struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>         struct drm_device *dev = crtc->dev;
> @@ -458,10 +457,29 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
>         return 0;
>  }
>
> +static struct drm_encoder *vc4_crtc_get_encoder_by_type(struct drm_crtc *crtc,
> +                                                       enum vc4_encoder_type type)
> +{
> +       struct drm_encoder *encoder;
> +
> +       drm_for_each_encoder(encoder, crtc->dev) {
> +               struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
> +
> +               if (vc4_encoder->type == type)
> +                       return encoder;
> +       }
> +
> +       return NULL;
> +}
> +
>  int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
>  {
>         struct drm_device *drm = crtc->dev;
>         struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +       enum vc4_encoder_type encoder_type;
> +       const struct vc4_pv_data *pv_data;
> +       struct drm_encoder *encoder;
> +       unsigned encoder_sel;
>         int channel;
>
>         if (!(of_device_is_compatible(vc4_crtc->pdev->dev.of_node,
> @@ -480,7 +498,17 @@ int vc4_crtc_disable_at_boot(struct drm_crtc *crtc)
>         if (channel < 0)
>                 return 0;
>
> -       return vc4_crtc_disable(crtc, NULL, channel);
> +       encoder_sel = VC4_GET_FIELD(CRTC_READ(PV_CONTROL), PV_CONTROL_CLK_SELECT);
> +       if (WARN_ON(encoder_sel != 0))
> +               return 0;
> +
> +       pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
> +       encoder_type = pv_data->encoder_types[encoder_sel];
> +       encoder = vc4_crtc_get_encoder_by_type(crtc, encoder_type);
> +       if (WARN_ON(!encoder))
> +               return 0;
> +
> +       return vc4_crtc_disable(crtc, encoder, NULL, channel);
>  }
>
>  static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -489,6 +517,8 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         struct drm_crtc_state *old_state = drm_atomic_get_old_crtc_state(state,
>                                                                          crtc);
>         struct vc4_crtc_state *old_vc4_state = to_vc4_crtc_state(old_state);
> +       struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, state,
> +                                                          drm_atomic_get_old_connector_state);
>         struct drm_device *dev = crtc->dev;
>
>         require_hvs_enabled(dev);
> @@ -496,7 +526,7 @@ static void vc4_crtc_atomic_disable(struct drm_crtc *crtc,
>         /* Disable vblank irq handling before crtc is disabled. */
>         drm_crtc_vblank_off(crtc);
>
> -       vc4_crtc_disable(crtc, state, old_vc4_state->assigned_channel);
> +       vc4_crtc_disable(crtc, encoder, state, old_vc4_state->assigned_channel);
>
>         /*
>          * Make sure we issue a vblank event after disabling the CRTC if
> --
> 2.31.1
>
