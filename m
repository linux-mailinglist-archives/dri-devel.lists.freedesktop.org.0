Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6551E3253C0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 17:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53516E159;
	Thu, 25 Feb 2021 16:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DAD86E159
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 16:44:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id x16so5172502wmk.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 08:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6iPK6uivn8FFkX3yHN1+4B6rSK87b8XBOG8TYCDXX44=;
 b=Kzmkjd4ootJtYamFrgEptXlT20fDyCoRFqBNzr49bd2VescRZE13IAcfwVgJeoDcBP
 RvT8tzPsyBgeIhblwcPiNrce6dTV4kf2lSNQnIIioTLxyUjnoxJlOYx/IUHZAbi+a/ew
 X7lOC8lIHyokARQ55OywZDk9b4aUxbAYpb292dulEhpo1KDMUJ1uxDigTwnKF1aWCMsL
 uJdYBz1b5ZBaeeEScLhzELr/Q6VTt7E9WP1VtNluB0tq0d8D+6oeAkO1NbR7cwq9np51
 zOatApTcSLI1HN7oRJHKLKUNm3bvwM4I6LxpeVfEnoQxNTILyYTEne7R03V1h+DeFTCq
 IsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6iPK6uivn8FFkX3yHN1+4B6rSK87b8XBOG8TYCDXX44=;
 b=lU1zlmyRyseQPxpEW1StEfuUWYvC0FSO+UT+FXb91wXTjyepQ+kwhP8iOs+/wNTeub
 4CW4hqAmPC02pYD33GTT5dFV0RCUXFDHgzerNPgK5O4Np+Osh2bKSMiC6S8oCNEEfm8x
 zdB6AxstMvHkeykKP4Yc/EbiP9TdMirAiJW4RALOBQT0wSSn9uxLG6aS0u9QG6S67lJ3
 RpCP8TNeH4QpLC+r8hzc0xlRsmUTzxjlddlPzF7Wq/QrP0wbdpuEsoGtKZjhW2hdrCFr
 zf3hKzE9ZxsUC2Rhh6CohjJkXHE1JeNlFFl/boEftNvZUBM/aH9zqobxyAEYQdMut1zc
 vFqw==
X-Gm-Message-State: AOAM530F0+Ltgp6kHF0UZEpggFbeTFIz84xwDpx8VMr19Sy+zF91zTsB
 RJjZGcoP4wtm2y145O09tnsvVQZwsA9hKQr2TTohdQ==
X-Google-Smtp-Source: ABdhPJz8YavJqOPhv1n1aVPWC1SJiwSPzls+Uo6e5WTyIH8p4pWZiir/kx9JJ5VQ3WYCnzJxmPmmoJLfmxg1w79fOYs=
X-Received: by 2002:a1c:a916:: with SMTP id s22mr4144063wme.82.1614271494646; 
 Thu, 25 Feb 2021 08:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-4-maxime@cerno.tech>
In-Reply-To: <20210225155909.1853812-4-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 16:44:39 +0000
Message-ID: <CAPY8ntDMm_o8O-SOk7Tkh=yh5czQ0iS37p==DyhxBVPVmriGWw@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/vc4: hdmi: Properly compute the BVB clock rate
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Stephen Boyd <sboyd@kernel.org>,
 Mike Turquette <mturquette@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Phil Elwell <phil@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BVB clock rate computation doesn't take into account a mode clock of
> 594MHz that we're going to need to support 4k60.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index eee9751009c2..b5bc742993a4 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -91,7 +91,6 @@
>  # define VC4_HD_M_ENABLE                       BIT(0)
>
>  #define CEC_CLOCK_FREQ 40000
> -#define VC4_HSM_MID_CLOCK 149985000
>
>  #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
>
> @@ -739,7 +738,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>                 conn_state_to_vc4_hdmi_conn_state(conn_state);
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> -       unsigned long pixel_rate, hsm_rate;
> +       unsigned long bvb_rate, pixel_rate, hsm_rate;
>         int ret;
>
>         ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> @@ -793,12 +792,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>
>         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
>
> -       /*
> -        * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
> -        * at 300MHz.
> -        */
> -       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
> -                              (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> +       bvb_rate = roundup(mode->clock * 1000 / 2, 75000000);

Minor hesitation here that I would need to check the hardware over.
As I read your code, if the clock falls 300MHz and 450MHz then you'd
ask for a bvb_rate of 225MHz. Depending on what the source clock is
that may not be valid.
The firmware goes for 75, 150, or 300MHz only.

  Dave

> +       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
>         if (ret) {
>                 DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
>                 clk_disable_unprepare(vc4_hdmi->hsm_clock);
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
