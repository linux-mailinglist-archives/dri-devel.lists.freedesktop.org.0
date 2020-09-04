Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0E625DE05
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 17:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D2B16EC49;
	Fri,  4 Sep 2020 15:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1956E6EC49
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 15:42:51 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a9so6512171wmm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 08:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UFt5VYp91zERLEDHeaE+RW9pXHUGaLWnGfwWTh4Sc2U=;
 b=fU31qie4kt2TV9lPfFAfIIE0WAv8mDvUqhU1LLlYfB8UsatCipj8RgKEIFsNAc6ocA
 xG5uup6s1fR/dqAgzERNBs1S+XEZ6SNWmkahGKmG0CN08m2kz4XzOMvv6F0SDvBIT2qC
 wwZZDieY4lzyH3DTqG+DOaZgYgqgdTegIxpjpRBWVbTACjeTaAxRe1XDf4prKT4CyiPR
 S4C6gpk6BSh+GiEs63wlu6eyxtO0I2XXbLJNQXeR0jNlfDzTSir6ah3Adnxf3Z9sMrKC
 RZxxyTWdhtr1be/4hfo8j9Q1RBviQ3jtYMRbW5VWDj+IVf1QVbLFY+ZDb6MlmseawrnF
 r3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UFt5VYp91zERLEDHeaE+RW9pXHUGaLWnGfwWTh4Sc2U=;
 b=f2AxiTcygECZYdRG4JyWUaN1/8VEOxEINaGM9FVFKtqLiA8xVh71iYyKbzkfROxdhb
 1gmLIKi8pb7i83Hz5qHen7/FNw5Cn5hh7VvLESNiC/r0iCy6fPHL+5JntmjldtHxnu9R
 a1yNib8SGCjbSl768HbVUCSb253SFjPun1BPqDMPeGBwhtVi0k2Yd83a3mHXGOJeEGqz
 La3K1VxsWb1g5RBYCn0EVnJvAfyXoeHrXaPL/4xM1aJVihTfC8qHFQQN8DyyQljyY3dD
 j5Qt6Sia8t4yh4GPb+W57bvTOlq+FFEhfcSdpVdZglbDm+n/qs4aOaCrLtKQG51M6rsH
 lHnA==
X-Gm-Message-State: AOAM532Hi0QoVpEg73hRBYrTEIpBlqUvRqS8BMgH0lhhEPuJ1sJzoIUZ
 F3ac/9DrivkeQLmdowQ3BHrP1AcXyAFBPNSneDMWQg==
X-Google-Smtp-Source: ABdhPJxLkBJqCTGf+urDE22psZ9kQBs7jd5tDjfYTwq0eIZiLv8gjpbdFkfhT1WGAohsQRYRqyhPHhMeA9xiVx5bOPw=
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr8761629wmd.82.1599234169816; 
 Fri, 04 Sep 2020 08:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.dddc064d8bb83e46744336af67dcb13139e5747d.1599120059.git-series.maxime@cerno.tech>
 <a712d2b70aaee20379cfc52c2141aa2f6e2a9d5b.1599120059.git-series.maxime@cerno.tech>
In-Reply-To: <a712d2b70aaee20379cfc52c2141aa2f6e2a9d5b.1599120059.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 4 Sep 2020 16:42:35 +0100
Message-ID: <CAPY8ntBuPWFU-xEoLwR=C1ccbA5CoxcQ1Gx_zvWf+VQzRg=E1g@mail.gmail.com>
Subject: Re: [PATCH v5 13/80] drm/vc4: kms: Convert to for_each_new_crtc_state
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Tim Gover <tim.gover@raspberrypi.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Thu, 3 Sep 2020 at 09:02, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The vc4 atomic commit loop has an handrolled loop that is basically
> identical to for_each_new_crtc_state, let's convert it to that helper.
>
> Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> Tested-by: Stefan Wahren <stefan.wahren@i2se.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Based on your comment to the previous revision, I'm happy.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_kms.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 210cc2408087..a41d105d4e3c 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -152,14 +152,16 @@ vc4_atomic_complete_commit(struct drm_atomic_state *state)
>         struct drm_device *dev = state->dev;
>         struct vc4_dev *vc4 = to_vc4_dev(dev);
>         struct vc4_hvs *hvs = vc4->hvs;
> -       struct vc4_crtc *vc4_crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +       struct drm_crtc *crtc;
>         int i;
>
> -       for (i = 0; i < dev->mode_config.num_crtc; i++) {
> -               if (!state->crtcs[i].ptr || !state->crtcs[i].commit)
> +       for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +               struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
> +
> +               if (!new_crtc_state->commit)
>                         continue;
>
> -               vc4_crtc = to_vc4_crtc(state->crtcs[i].ptr);
>                 vc4_hvs_mask_underrun(dev, vc4_crtc->channel);
>         }
>
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
