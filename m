Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEAD35143B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 13:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D9D6E3DF;
	Thu,  1 Apr 2021 11:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFB66E3DF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Apr 2021 11:10:12 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v11so1396127wro.7
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Apr 2021 04:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DeM4AnQkk5f3Vo+nj9h7h2ErYQTY8FSNM9r28vNr+34=;
 b=VuUpLWyjIaZLWQBWyAFkV4o8Z0fCo/n1Ap+8UBB7KmZd+obMHO4CopUnMr+peMb1HF
 kSEHePKf4Unfp/CKLD9NSKIP9HcmQuCJXx1uWFeXVjPNpWijQd4+0o2TPRy5XzmyjHOB
 asPSczqzcc6EPJKrJ/+Iu4K+78l2jMtHiENErXR+UT8U1gzdHBMzgzuFz15B8EW+Y10X
 EjT0MjBDpv99ZXaDvOW7Q7Qzmx8AF4A8OorpF4dS6xKUNox2kmNqzqXQMiF5Bvivah8U
 zzyTTzb1KJ/RM4ufC2EIG/9YSSwjJRASj/5IKxljj4NPSPGjnXWSvQQAkf8ORQ8woLo7
 yfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DeM4AnQkk5f3Vo+nj9h7h2ErYQTY8FSNM9r28vNr+34=;
 b=pCR0Gau4f+natkPwYhY788RvyyuHfyk2iclyKbj3nSgHyrIfxohmLnHwjz3Xv+jXtm
 8G8IqHyxUiKjroEE0QHrF9ZzuqdbFg8WADPk+O0fN/wQ3Q7mf+l7GGUbr6cmuRcTNgkV
 sBxKRyUu8ahT5PwJhfxChuBANiGmi/vDYfngSkPObW2vFpXypWZHdyJowGz9yj5I6S+W
 o+3cN2ivuCoxPBBizmPSzyoyKgdOQ6agdXH8mgr2hcw7hApogn9EWIrN+BPPESCq7sVa
 IJviR8rWj1I9rPkj+VUkM0cVjbaqh7Z8KV6Nh4Y13nefMfzPyBWiFkIHzjFj5tCohhZi
 44aA==
X-Gm-Message-State: AOAM531PtJVjUlpNQgCfaOdhhUyKTdL9LNbZwCKAlPioXVdrxwKZ1fXY
 TUCpWgla6WoVAl64yugx1+D3rVWc+eg1iYQUc/yExw==
X-Google-Smtp-Source: ABdhPJwzMdSzxA6pJhb7r6MJ8jYn1OlqllFpSimHVaKH8BaHBKTAaZdjtWmX6EoJs6cOwgxBXFecKKyTJVF+OQHQXJs=
X-Received: by 2002:adf:d1cd:: with SMTP id b13mr8962534wrd.47.1617275411310; 
 Thu, 01 Apr 2021 04:10:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210318092917.831995-1-maxime@cerno.tech>
 <20210318092917.831995-3-maxime@cerno.tech>
In-Reply-To: <20210318092917.831995-3-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 1 Apr 2021 12:09:56 +0100
Message-ID: <CAPY8ntAuT3k3+CmVSUKAMSkpoNAYOu+GTMf7fiFZxxzTXTfOPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/vc4: hdmi: Properly compute the BVB clock rate
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Sorry for the delay in reviewing these patches.

On Thu, 18 Mar 2021 at 09:29, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BVB clock rate computation doesn't take into account a mode clock of
> 594MHz that we're going to need to support 4k60.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index eee9751009c2..eaee853bb404 100644
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
> @@ -793,12 +792,14 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
>
>         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
>
> -       /*
> -        * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
> -        * at 300MHz.
> -        */
> -       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
> -                              (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> +       if (pixel_rate > 297000000)
> +               bvb_rate = 300000000;
> +       else if (pixel_rate > 148500000)
> +               bvb_rate = 150000000;
> +       else
> +               bvb_rate = 75000000;
> +
> +       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
>         if (ret) {
>                 DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
>                 clk_disable_unprepare(vc4_hdmi->hsm_clock);
> --
> 2.30.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
