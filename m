Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611552786A5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 14:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3F6ECA4;
	Fri, 25 Sep 2020 12:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295B16ECA4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 12:05:35 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v12so3013430wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HbQ0u2l5t2kEFMiKumV+nGrG5cx2O7O3dacIJr+VITI=;
 b=X0EW9lJRYuZAUlh5FNrx/0cANlUOv/AHF0hswM4vTedIkRzUAYdQzLp7Z4U9iOrsXa
 pc3gHo0IPfRIj7miFHL0AWTcpjxdO1je6tm+Uskado8Y+KZJhS+lud2+OSO4cFA3m7Mw
 Go0DTI5wNQiWgB5rEwiQ6J9d7Iq0DgLFHNMxYAUkc/rvvT6mVVVeXQJ2bLwV7grGJm3J
 HmcFtJYCS0XLMv9HE4vO53y4pWnCREVkqQwrF9j3nNDeNFrfukXqlxkut8mMHf2Xm6Kg
 FyRZWWQyLjFET/lnassh756E4emiqmJgtR4lCeqoi4U5I3iwVshqd6xuJC6/jW/6UZpc
 zwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HbQ0u2l5t2kEFMiKumV+nGrG5cx2O7O3dacIJr+VITI=;
 b=m0dIO4EvhlGLkVoek/vy7zWFX2kQGpTx01Vl9k0DGUhIJKmbR8URzlQMCcn0+mzWM9
 TrhuS7MpFrBntPbvE9QTKnm3LN9A+9QFbt3eA+24Cm5oQj7kGlUQSqUIe3tY67oX63eU
 ppan8fiOZljAc63anSkzqKk8FVnOpcPm2eA7FLAA+CaEnXtaFSGPCDuIcnsAh4+9XfXU
 gMsqSn+qIxrmlsNnyKF9imkh++LABX5fkRaKa3DooqtQ346WPqN8tJxq3gzLd9dLdwym
 JMtm1ueE2Y0qIZjGQbfOsufYmsosesl2s2eM3J4b+lBDLhG+4gKKT1HrnlIXoDRkQwNI
 7n6g==
X-Gm-Message-State: AOAM53092uY5oTwxJDliIPJ6laiNU78qI0Q0JatnLOCi3ZGAzit+rKZJ
 RJDgZdDBAwUsBrAh2GrOUj1Q5VnlEh+cM+9HxlcGoA==
X-Google-Smtp-Source: ABdhPJy4uYKJzJH2awpHV068zdYg+xWcjnOyL2dHIS0TmBd4BZy9lq59L281c9qXZ+n6J014Rx7FbTKxBM9ZodeZB/s=
X-Received: by 2002:a1c:9a10:: with SMTP id c16mr2619443wme.96.1601035533597; 
 Fri, 25 Sep 2020 05:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200923084032.218619-1-maxime@cerno.tech>
 <20200923084032.218619-2-maxime@cerno.tech>
In-Reply-To: <20200923084032.218619-2-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Sep 2020 13:05:16 +0100
Message-ID: <CAPY8ntAqOKvS7DNfidKU0LFJQevDa9tbaTNDERz9uAA0sFtDWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/vc4: crtc: Keep the previously assigned HVS
 FIFO
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Sorry for the delay.

On Wed, 23 Sep 2020 at 09:40, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The HVS FIFOs are currently assigned each time we have an atomic_check
> for all the enabled CRTCs.
>
> However, if we are running multiple outputs in parallel and we happen to
> disable the first (by index) CRTC, we end up changing the assigned FIFO
> of the second CRTC without disabling and reenabling the pixelvalve which
> ends up in a stall and eventually a VBLANK timeout.
>
> In order to fix this, we can create a special value for our assigned
> channel to mark it as disabled, and if our CRTC already had an assigned
> channel in its previous state, we keep on using it.
>
> Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatically")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I retested too and had triple output (HDMI-0, HDMI-1, and DPI) working
happily! Switching around resolutions on the HDMI outputs was working
fine. DPI was an Adafruit Kippah and 800x480 LCD, so no options on
resolution.
We may finally have this muxing nailed.

  Dave

> ---
>
> Changes from v1:
>   - Split away the crtc state reset refactoring
>   - Fixed the checkpatch warnings
> ---
>  drivers/gpu/drm/vc4/vc4_crtc.c |  1 +
>  drivers/gpu/drm/vc4/vc4_drv.h  |  2 ++
>  drivers/gpu/drm/vc4/vc4_kms.c  | 22 ++++++++++++++++------
>  3 files changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
> index 7ef20adedee5..482219fb4db2 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -863,6 +863,7 @@ void vc4_crtc_reset(struct drm_crtc *crtc)
>                 return;
>         }
>
> +       vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
>         __drm_atomic_helper_crtc_reset(crtc, &vc4_crtc_state->base);
>  }
>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 8c8d96b6289f..90b911fd2a7f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -532,6 +532,8 @@ struct vc4_crtc_state {
>         } margins;
>  };
>
> +#define VC4_HVS_CHANNEL_DISABLED ((unsigned int)-1)
> +
>  static inline struct vc4_crtc_state *
>  to_vc4_crtc_state(struct drm_crtc_state *crtc_state)
>  {
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 01fa60844695..149825ff5df8 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -616,7 +616,7 @@ static int
>  vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>  {
>         unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
> -       struct drm_crtc_state *crtc_state;
> +       struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>         struct drm_crtc *crtc;
>         int i, ret;
>
> @@ -629,6 +629,8 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>          * modified.
>          */
>         list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> +               struct drm_crtc_state *crtc_state;
> +
>                 if (!crtc->state->enable)
>                         continue;
>
> @@ -637,15 +639,23 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                         return PTR_ERR(crtc_state);
>         }
>
> -       for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> -               struct vc4_crtc_state *vc4_crtc_state =
> -                       to_vc4_crtc_state(crtc_state);
> +       for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
> +               struct vc4_crtc_state *new_vc4_crtc_state =
> +                       to_vc4_crtc_state(new_crtc_state);
>                 struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
>                 unsigned int matching_channels;
>
> -               if (!crtc_state->enable)
> +               if (old_crtc_state->enable && !new_crtc_state->enable)
> +                       new_vc4_crtc_state->assigned_channel = VC4_HVS_CHANNEL_DISABLED;
> +
> +               if (!new_crtc_state->enable)
>                         continue;
>
> +               if (new_vc4_crtc_state->assigned_channel != VC4_HVS_CHANNEL_DISABLED) {
> +                       unassigned_channels &= ~BIT(new_vc4_crtc_state->assigned_channel);
> +                       continue;
> +               }
> +
>                 /*
>                  * The problem we have to solve here is that we have
>                  * up to 7 encoders, connected to up to 6 CRTCs.
> @@ -674,7 +684,7 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>                 if (matching_channels) {
>                         unsigned int channel = ffs(matching_channels) - 1;
>
> -                       vc4_crtc_state->assigned_channel = channel;
> +                       new_vc4_crtc_state->assigned_channel = channel;
>                         unassigned_channels &= ~BIT(channel);
>                 } else {
>                         return -EINVAL;
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
