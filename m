Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525501E4AAC
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 18:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32E386E0CD;
	Wed, 27 May 2020 16:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4E16E0CD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 16:45:09 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q2so29718051ljm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 09:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x5U/zKfkvmSEww+vSURoUmS0s1xUIVHLA1Nb4AtxJis=;
 b=W1Cxi2bY3PkaST1Z8OpeWGbMyEmo5P8jlNIwCdvVr+EjtPpX+j4R/HBMaMD7y4Dbz2
 sN2rfypqEM2mZkwCR0i0VC8WXHwpnf1WoXE9veH7nmHE1qcnAYL60rYjN5GtdbL7Er1s
 WzhIsrXN6NswcPYYrH1wEJ9LKSW6ea64X8zPbj5KzHqu6v6U4SOTWTD1ACj2AgEXeE6n
 Ow7zyaPtpdsM5IvuEpbGg6vrgBYIUyUwC4ri2NUosucaU5RmpJLrkxfAuYYsbvPM+u9v
 L7aHcngTSiHdWHOweNSQYkka0AxBsVpDzpNMA5BjYV4Hv/uBtOwPuqzDoOR/heOa38Sr
 dgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x5U/zKfkvmSEww+vSURoUmS0s1xUIVHLA1Nb4AtxJis=;
 b=G3SAJ9UQnUvAD+B87lvDfY0/chSO4XmN/yO2tEtI+o+pqRnfIH34Y61ICfILL9izDv
 vPuB2LIpwgrfLY6JYlsTf5sO08o5xU1Gn6cTCYYjSf/qoiZftxP3xWUgRJZ6mD9PhmN3
 CSIOyc2/KwBHohDKaMELccUngl7JmwttT6U2yHJSAaeyxmdoYhqyFFHutGH3bjsOWatw
 SVjNiOYs1nzzz1q8FHix07E3dvQhJj5FlgffpKMnYrPVV6xG9t9Rt0ffhH3OE1IKdwZd
 aeDUCBOhak5q4nmJvvE16CTPlYhQ4ZkZAHPZ32yp7cySuWD8koQOADRKu7HK8OFl5fti
 f+/g==
X-Gm-Message-State: AOAM532bovt1vfQKLuhoKayZnfvws1JR51a6ERoZ1bysOVle3/1MrZyy
 L/MCkF1JtPMOHzLZtfb1jrKC3UZA5b4XiuX+qYD+Pw==
X-Google-Smtp-Source: ABdhPJzlE2zCA4ef3RAWHj2biI9Q1eAsYK7BNlo9EXKXBDmBQL0WWpSKBn/3tA9ID11/ogPIYEhxoy1NogcPeGz3zR4=
X-Received: by 2002:a2e:b0ec:: with SMTP id h12mr3241295ljl.269.1590597907811; 
 Wed, 27 May 2020 09:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <44e3ec27ee6c0d81c440cd2d6cdd1bf93ea102e7.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <44e3ec27ee6c0d81c440cd2d6cdd1bf93ea102e7.1590594512.git-series.maxime@cerno.tech>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 27 May 2020 09:44:56 -0700
Message-ID: <CADaigPVbUZzo5c8fp9EqZsfrp44-09whu-HPk9c-eNc2KXS4Mg@mail.gmail.com>
Subject: Re: [PATCH v3 016/105] drm/vc4: plane: Improve LBM usage
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
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> LBM allocations were always taking the worst case sizing of
> max(src_width, dst_width) * 16. This is significantly over
> the required sizing, and stops us rendering multiple 4k images
> to the screen.
>
> Add some of the additional constraints to more accurately
> describe the LBM requirements.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
> index 1575c05e3106..602927745f84 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -142,9 +142,10 @@ static const struct hvs_format *vc4_get_hvs_format(u32 drm_format)
>         return NULL;
>  }
>
> -static enum vc4_scaling_mode vc4_get_scaling_mode(u32 src, u32 dst)
> +static enum vc4_scaling_mode vc4_get_scaling_mode(u32 src, u32 dst,
> +                                                 bool chroma_vrep)
>  {
> -       if (dst == src)
> +       if (dst == src && !chroma_vrep)
>                 return VC4_SCALING_NONE;
>         if (3 * dst >= 2 * src)
>                 return VC4_SCALING_PPF;
> @@ -369,9 +370,11 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
>                 return ret;
>
>         vc4_state->x_scaling[0] = vc4_get_scaling_mode(vc4_state->src_w[0],
> -                                                      vc4_state->crtc_w);
> +                                                      vc4_state->crtc_w,
> +                                                      false);
>         vc4_state->y_scaling[0] = vc4_get_scaling_mode(vc4_state->src_h[0],
> -                                                      vc4_state->crtc_h);
> +                                                      vc4_state->crtc_h,
> +                                                      false);
>
>         vc4_state->is_unity = (vc4_state->x_scaling[0] == VC4_SCALING_NONE &&
>                                vc4_state->y_scaling[0] == VC4_SCALING_NONE);
> @@ -384,10 +387,12 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
>
>                 vc4_state->x_scaling[1] =
>                         vc4_get_scaling_mode(vc4_state->src_w[1],
> -                                            vc4_state->crtc_w);
> +                                            vc4_state->crtc_w,
> +                                            v_subsample == 2);
>                 vc4_state->y_scaling[1] =
>                         vc4_get_scaling_mode(vc4_state->src_h[1],
> -                                            vc4_state->crtc_h);
> +                                            vc4_state->crtc_h,
> +                                            v_subsample == 2);
>
>                 /* YUV conversion requires that horizontal scaling be enabled
>                  * on the UV plane even if vc4_get_scaling_mode() returned

The change above isn't mentioned in the commit message and I don't
understand what's going on.  It should be split out with an
explanation.

> @@ -437,10 +442,7 @@ static void vc4_write_ppf(struct vc4_plane_state *vc4_state, u32 src, u32 dst)
>  static u32 vc4_lbm_size(struct drm_plane_state *state)
>  {
>         struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
> -       /* This is the worst case number.  One of the two sizes will
> -        * be used depending on the scaling configuration.
> -        */
> -       u32 pix_per_line = max(vc4_state->src_w[0], (u32)vc4_state->crtc_w);
> +       u32 pix_per_line;
>         u32 lbm;
>
>         /* LBM is not needed when there's no vertical scaling. */
> @@ -448,6 +450,11 @@ static u32 vc4_lbm_size(struct drm_plane_state *state)
>             vc4_state->y_scaling[1] == VC4_SCALING_NONE)
>                 return 0;
>
> +       if (vc4_state->x_scaling[0] == VC4_SCALING_TPZ)
> +               pix_per_line = vc4_state->crtc_w;
> +       else
> +               pix_per_line = vc4_state->src_w[0];

Looks like it's also crtc_w for RGB or 4:4:4 and HPPF in (0.5,1.0].
Maybe drop a note in here that we're not covering that case, but src_w
> crtc_w so it's safe at least.

> +
>         if (!vc4_state->is_yuv) {
>                 if (vc4_state->y_scaling[0] == VC4_SCALING_TPZ)
>                         lbm = pix_per_line * 8;
> @@ -583,7 +590,9 @@ static int vc4_plane_allocate_lbm(struct drm_plane_state *state)
>                 spin_lock_irqsave(&vc4->hvs->mm_lock, irqflags);
>                 ret = drm_mm_insert_node_generic(&vc4->hvs->lbm_mm,
>                                                  &vc4_state->lbm,
> -                                                lbm_size, 32, 0, 0);
> +                                                lbm_size,
> +                                                vc4->hvs->hvs5 ? 64 : 32,
> +                                                0, 0);
>                 spin_unlock_irqrestore(&vc4->hvs->mm_lock, irqflags);
>
>                 if (ret)
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
