Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5A0325472
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 18:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49FF6ECEB;
	Thu, 25 Feb 2021 17:16:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959C86ECEB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 17:16:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h98so5988558wrh.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 09:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pgcY/OZF65ERBl6MAK6W0hY0CpUqOvXRa/TDDVIblrs=;
 b=Zvr95u8GzHK4DYlgfOFC4q5TZH1ZlqlxSXULVyDhVfyFnWIaKJsaHiWjQc0YTz4yaI
 BRUtwJSUC8NzJ2TsM1j6CHT6Ykr6rYPFS0HVcn4KFhRQmZTfEvxzQ+QkTdfdcJD7iIwi
 BDOMs35CANJbfFK/EbSGBJoM4MAim9TuKfa9i7feeDcbl6fhlqe5MBtzKKzZiaa4LF0T
 ppuVdkQHuHVQHQD3MplBqeHh8AXqEKHiOhzkE5uoPwTv0qNWbD8ZUNcC9yzKWvYPKJLr
 3UDwV51qh8RjaATBxBzMs3iE+GwBvGJQHPSiDjNZhr6eA2fTAx+OgS7UmM1cKtIPRWs3
 lVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pgcY/OZF65ERBl6MAK6W0hY0CpUqOvXRa/TDDVIblrs=;
 b=WCrjAqxhiAgfcEMXdt/6fQRwPY1PhVhp7vc/JUvzY4gdfjfsrJqzfZxJ9bMYqJWn6Q
 KeLUxuShDHRhJGbL0LNNqt7vmNhWqfThx0DvciyjVPnVYAGYFhsjTCloyExzC7JHJyDH
 hKquW1Ad/VKqm6xDs3RTMJZJgqV7dTbhelmDr4KSe4hPvCKCoo+5yk2aR31hi1orMbDJ
 Ve5tDN3Pzr4Jj3dLEUu5J55dnddFwzPnHZle2GA95RgAY49/RN+dSU4o0yZJsHzB5tHI
 U8gowIQSDKEIOCigzzD7u+HE95r4pIw4D7deSxCrLWwwzOkPXuXzKSNDPrYvxWzlGuPF
 y06w==
X-Gm-Message-State: AOAM533afclcgmBLSevex3RUoeg5MbCa2LVAy5Q4RO2t9W8lIp/jNwhR
 c5jZWvwK8uacZ/XQ3Ya0F9umIq8WmidL1TDfcevvCA==
X-Google-Smtp-Source: ABdhPJzvaaIvsIuZY81xtukaleNmpcL7+wykHbOc4CXehrpeggQQBtBruvil1QLIyGhO/rwHf1v7B3hxb6w/IvNSkJY=
X-Received: by 2002:adf:f681:: with SMTP id v1mr4592118wrp.150.1614273366172; 
 Thu, 25 Feb 2021 09:16:06 -0800 (PST)
MIME-Version: 1.0
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-4-maxime@cerno.tech>
 <CAPY8ntDMm_o8O-SOk7Tkh=yh5czQ0iS37p==DyhxBVPVmriGWw@mail.gmail.com>
In-Reply-To: <CAPY8ntDMm_o8O-SOk7Tkh=yh5czQ0iS37p==DyhxBVPVmriGWw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 25 Feb 2021 17:15:50 +0000
Message-ID: <CAPY8ntDOwhT7XC4v=HNxy8D0mCc03wJKu+xV3coFNxCkE7abSA@mail.gmail.com>
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

On Thu, 25 Feb 2021 at 16:44, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime
>
> On Thu, 25 Feb 2021 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The BVB clock rate computation doesn't take into account a mode clock of
> > 594MHz that we're going to need to support 4k60.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index eee9751009c2..b5bc742993a4 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -91,7 +91,6 @@
> >  # define VC4_HD_M_ENABLE                       BIT(0)
> >
> >  #define CEC_CLOCK_FREQ 40000
> > -#define VC4_HSM_MID_CLOCK 149985000
> >
> >  #define HDMI_14_MAX_TMDS_CLK   (340 * 1000 * 1000)
> >
> > @@ -739,7 +738,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
> >                 conn_state_to_vc4_hdmi_conn_state(conn_state);
> >         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> >         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
> > -       unsigned long pixel_rate, hsm_rate;
> > +       unsigned long bvb_rate, pixel_rate, hsm_rate;
> >         int ret;
> >
> >         ret = pm_runtime_get_sync(&vc4_hdmi->pdev->dev);
> > @@ -793,12 +792,8 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder,
> >
> >         vc4_hdmi_cec_update_clk_div(vc4_hdmi);
> >
> > -       /*
> > -        * FIXME: When the pixel freq is 594MHz (4k60), this needs to be setup
> > -        * at 300MHz.
> > -        */
> > -       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock,
> > -                              (hsm_rate > VC4_HSM_MID_CLOCK ? 150000000 : 75000000));
> > +       bvb_rate = roundup(mode->clock * 1000 / 2, 75000000);
>
> Minor hesitation here that I would need to check the hardware over.
> As I read your code, if the clock falls 300MHz and 450MHz then you'd
> ask for a bvb_rate of 225MHz. Depending on what the source clock is
> that may not be valid.
> The firmware goes for 75, 150, or 300MHz only.

The information I have says it has to be an integer divide of 600MHz
(PLLC @ 3GHz / 5), so 225MHz is not valid.

(Minor contradictory information though as PLLC is bumped to 3.3GHz
with enable_4kp60, but we still appear to get 300MHz for BVB after the
/5. A little more checking warranted around here).

>   Dave
>
> > +       ret = clk_set_min_rate(vc4_hdmi->pixel_bvb_clock, bvb_rate);
> >         if (ret) {
> >                 DRM_ERROR("Failed to set pixel bvb clock rate: %d\n", ret);
> >                 clk_disable_unprepare(vc4_hdmi->hsm_clock);
> > --
> > 2.29.2
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
