Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C54443465
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 18:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E4773411;
	Tue,  2 Nov 2021 17:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB60973411
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Nov 2021 17:12:46 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so2627439wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Nov 2021 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExPjvgW5+HgLBD3vwf1sZATM17VIaSiS+5B1wlAARyE=;
 b=r0ryqpPaqC8ZpK6FvWaVj+8+wKpqmkST82PkJs2T1tOWyooCdPnB3QtWbpLKDcMxia
 npuZcOCKv4PMqLFnAET6L2dUsDKUEa6xI9d4oHqAl7tS+MC8kNkwuYW54yZ+WtnDvduM
 pv6TEK1j6ZX6JlYXDUntXSR4xmWb/gnaftPAb+Pwtb/EwrKHxD/lBj2TjyXB7Q7E0TTD
 b7hJOqCir3N2Mz064uT5DNXcaIZ0vC0xDqGTqhL1dAWCg/M6hw6DKyX/cnCJvYalvIR6
 XgeiQn+sa2Ux2COVTs6tiutr1ZDwgoOXcIvizwFqRLGsP4RMxf+8i4MPaSFHOm2w2XXl
 b0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExPjvgW5+HgLBD3vwf1sZATM17VIaSiS+5B1wlAARyE=;
 b=QRl8sTWK97tpxt2H0+t6w5J/BMY4AuktJGvYOp8l8BwfZHUqTFSzkD3g5OIpIgSzoQ
 Zypf+tKCfzTLTRZ3MFYiddmxuYRobJOpbQea6jNpMIrmG7iIZ8OGZz/HDSQQHtRPTGMx
 pgpXtFCPaiXY4QDfnX+zkDnOyeI96p7ARHjWtdesCNvHooi8QvY2Ld1MNRRgz5EUm9LQ
 v7d4NQ9s2qiHBphe0G2Ag8ke2Yd7cW5vHM5BJhgOOUMn+DY7SFVhP4yTrBc96aiDKUwE
 WYeKjpdka9MqROhWiTYZ0EVjpGI/jQjCv/r+0BexMgbC/pVQz/7NB/o5Dp5PPuUl5C//
 VCdA==
X-Gm-Message-State: AOAM530/RSfvSeN6L1o+x0WfJt7KdIgGNskhfiQwi7xPDJ71xDjCrITY
 4Q/FqF1ARFfjgXMM3/M84uow0PBo0PB6vGlT4GqEOw==
X-Google-Smtp-Source: ABdhPJz+h7P3iPYin2I3wqlzcVk8/gWBeYkTnR+JkJTveXfr2TH66/ZNOHBOLXiYTLix9gUL1ZElQ87dmC7VTELRljw=
X-Received: by 2002:a1c:4e04:: with SMTP id g4mr8285788wmh.15.1635873165095;
 Tue, 02 Nov 2021 10:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211025152903.1088803-1-maxime@cerno.tech>
 <20211025152903.1088803-11-maxime@cerno.tech>
In-Reply-To: <20211025152903.1088803-11-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 2 Nov 2021 17:12:29 +0000
Message-ID: <CAPY8ntAwCamnfFDZssuRRJ45Xe8shK+YxiO=Lcr-w34c4L-_2A@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] drm/vc4: Increase the core clock based on HVS
 load
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
> Depending on a given HVS output (HVS to PixelValves) and input (planes
> attached to a channel) load, the HVS needs for the core clock to be
> raised above its boot time default.
>
> Failing to do so will result in a vblank timeout and a stalled display
> pipeline.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

I will make the comment that this does a load of computation of hvs
load when running on hvs4 (BCM2835/6/7), even though it's redundant on
those chips.
The overhead is relatively minimal, but could be bypassed if viewed necessary.

Otherwise
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c |  15 +++++
>  drivers/gpu/drm/vc4/vc4_drv.h  |   2 +
>  drivers/gpu/drm/vc4/vc4_kms.c  | 110 ++++++++++++++++++++++++++++++---
>  3 files changed, 118 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 6decaa12a078..287dbc89ad64 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -659,12 +659,27 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
>         struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc_state);
>         struct drm_connector *conn;
>         struct drm_connector_state *conn_state;
> +       struct drm_encoder *encoder;
>         int ret, i;
>
>         ret = vc4_hvs_atomic_check(crtc, state);
>         if (ret)
>                 return ret;
>
> +       encoder = vc4_get_crtc_encoder(crtc, crtc_state);
> +       if (encoder) {
> +               const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +               struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
> +
> +               mode = &crtc_state->adjusted_mode;
> +               if (vc4_encoder->type == VC4_ENCODER_TYPE_HDMI0) {
> +                       vc4_state->hvs_load = max(mode->clock * mode->hdisplay / mode->htotal + 1000,
> +                                                 mode->clock * 9 / 10) * 1000;
> +               } else {
> +                       vc4_state->hvs_load = mode->clock * 1000;
> +               }
> +       }
> +
>         for_each_new_connector_in_state(state, conn, conn_state,
>                                         i) {
>                 if (conn_state->crtc != crtc)
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 813c5d0ea98e..4329e09d357c 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -558,6 +558,8 @@ struct vc4_crtc_state {
>                 unsigned int bottom;
>         } margins;
>
> +       unsigned long hvs_load;
> +
>         /* Transitional state below, only valid during atomic commits */
>         bool update_muxing;
>  };
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 41cb4869da50..79d4d9dd1394 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -39,9 +39,11 @@ static struct vc4_ctm_state *to_vc4_ctm_state(struct drm_private_state *priv)
>
>  struct vc4_hvs_state {
>         struct drm_private_state base;
> +       unsigned long core_clock_rate;
>
>         struct {
>                 unsigned in_use: 1;
> +               unsigned long fifo_load;
>                 struct drm_crtc_commit *pending_commit;
>         } fifo_state[HVS_NUM_CHANNELS];
>  };
> @@ -340,10 +342,19 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>         struct vc4_hvs *hvs = vc4->hvs;
>         struct drm_crtc_state *old_crtc_state;
>         struct drm_crtc_state *new_crtc_state;
> +       struct vc4_hvs_state *new_hvs_state;
>         struct drm_crtc *crtc;
>         struct vc4_hvs_state *old_hvs_state;
>         int i;
>
> +       old_hvs_state = vc4_hvs_get_old_global_state(state);
> +       if (WARN_ON(!old_hvs_state))
> +               return;
> +
> +       new_hvs_state = vc4_hvs_get_new_global_state(state);
> +       if (WARN_ON(!new_hvs_state))
> +               return;
> +
>         for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
>                 struct vc4_crtc_state *vc4_crtc_state;
>
> @@ -354,12 +365,13 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>                 vc4_hvs_mask_underrun(dev, vc4_crtc_state->assigned_channel);
>         }
>
> -       if (vc4->hvs->hvs5)
> -               clk_set_min_rate(hvs->core_clk, 500000000);
> +       if (vc4->hvs->hvs5) {
> +               unsigned long core_rate = max_t(unsigned long,
> +                                               500000000,
> +                                               new_hvs_state->core_clock_rate);
>
> -       old_hvs_state = vc4_hvs_get_old_global_state(state);
> -       if (!old_hvs_state)
> -               return;
> +               clk_set_min_rate(hvs->core_clk, core_rate);
> +       }
>
>         for_each_old_crtc_in_state(state, crtc, old_crtc_state, i) {
>                 struct vc4_crtc_state *vc4_crtc_state =
> @@ -399,8 +411,12 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
>
>         drm_atomic_helper_cleanup_planes(dev, state);
>
> -       if (vc4->hvs->hvs5)
> -               clk_set_min_rate(hvs->core_clk, 0);
> +       if (vc4->hvs->hvs5) {
> +               drm_dbg(dev, "Running the core clock at %lu Hz\n",
> +                       new_hvs_state->core_clock_rate);
> +
> +               clk_set_min_rate(hvs->core_clk, new_hvs_state->core_clock_rate);
> +       }
>  }
>
>  static int vc4_atomic_commit_setup(struct drm_atomic_state *state)
> @@ -657,9 +673,9 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
>
>         __drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
>
> -
>         for (i = 0; i < HVS_NUM_CHANNELS; i++) {
>                 state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
> +               state->fifo_state[i].fifo_load = old_state->fifo_state[i].fifo_load;
>
>                 if (!old_state->fifo_state[i].pending_commit)
>                         continue;
> @@ -668,6 +684,8 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
>                         drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
>         }
>
> +       state->core_clock_rate = old_state->core_clock_rate;
> +
>         return &state->base;
>  }
>
> @@ -822,6 +840,76 @@ static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
>         return 0;
>  }
>
> +static int
> +vc4_core_clock_atomic_check(struct drm_atomic_state *state)
> +{
> +       struct vc4_dev *vc4 = to_vc4_dev(state->dev);
> +       struct drm_private_state *priv_state;
> +       struct vc4_hvs_state *hvs_new_state;
> +       struct vc4_load_tracker_state *load_state;
> +       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
> +       struct drm_crtc *crtc;
> +       unsigned int num_outputs;
> +       unsigned long pixel_rate;
> +       unsigned long cob_rate;
> +       unsigned int i;
> +
> +       priv_state = drm_atomic_get_private_obj_state(state,
> +                                                     &vc4->load_tracker);
> +       if (IS_ERR(priv_state))
> +               return PTR_ERR(priv_state);
> +
> +       load_state = to_vc4_load_tracker_state(priv_state);
> +
> +       hvs_new_state = vc4_hvs_get_global_state(state);
> +       if (!hvs_new_state)
> +               return -EINVAL;
> +
> +       for_each_oldnew_crtc_in_state(state, crtc,
> +                                     old_crtc_state,
> +                                     new_crtc_state,
> +                                     i) {
> +               if (old_crtc_state->active) {
> +                       struct vc4_crtc_state *old_vc4_state =
> +                               to_vc4_crtc_state(old_crtc_state);
> +                       unsigned int channel = old_vc4_state->assigned_channel;
> +
> +                       hvs_new_state->fifo_state[channel].fifo_load = 0;
> +               }
> +
> +               if (new_crtc_state->active) {
> +                       struct vc4_crtc_state *new_vc4_state =
> +                               to_vc4_crtc_state(new_crtc_state);
> +                       unsigned int channel = new_vc4_state->assigned_channel;
> +
> +                       hvs_new_state->fifo_state[channel].fifo_load =
> +                               new_vc4_state->hvs_load;
> +               }
> +       }
> +
> +       cob_rate = 0;
> +       num_outputs = 0;
> +       for (i = 0; i < HVS_NUM_CHANNELS; i++) {
> +               if (!hvs_new_state->fifo_state[i].in_use)
> +                       continue;
> +
> +               num_outputs++;
> +               cob_rate += hvs_new_state->fifo_state[i].fifo_load;
> +       }
> +
> +       pixel_rate = load_state->hvs_load;
> +       if (num_outputs > 1) {
> +               pixel_rate = (pixel_rate * 40) / 100;
> +       } else {
> +               pixel_rate = (pixel_rate * 60) / 100;
> +       }
> +
> +       hvs_new_state->core_clock_rate = max(cob_rate, pixel_rate);
> +
> +       return 0;
> +}
> +
> +
>  static int
>  vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  {
> @@ -839,7 +927,11 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>         if (ret)
>                 return ret;
>
> -       return vc4_load_tracker_atomic_check(state);
> +       ret = vc4_load_tracker_atomic_check(state);
> +       if (ret)
> +               return ret;
> +
> +       return vc4_core_clock_atomic_check(state);
>  }
>
>  static struct drm_mode_config_helper_funcs vc4_mode_config_helpers = {
> --
> 2.31.1
>
