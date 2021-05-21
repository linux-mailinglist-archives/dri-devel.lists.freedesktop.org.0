Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C43F38CCE9
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEA26E509;
	Fri, 21 May 2021 18:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0956E0C5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 18:06:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c14so20123923wrx.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D5LwmNVFsSfy6EyRs7Ealr4gzA97VJM1KuOHtzH0Li0=;
 b=VE0HakH5HjuuQJKCxvKI5+8hyL5a8G9LX7e9Rjffwcw2UeJqvG6j3fhS10puSV5X73
 CzlMG7QORuLeT3EXZg9T8bZIkO8xrHlT2wpEP4OnnbJoc0oPrrWSgA+q5wH7tZAkEPEI
 Teb+xPMKbuRZkdkwfW3WTLZWr+hC8Q5tG1i79mkvCsjSMt5yoou1NHoE53Ch4NCuv4bJ
 +eZyR5P+TZLyyHfG5boD/jGH6HdO+Uw2wRoiFdKyjn2X1cUuY6cUb03Zuh4aOh9ZjjYt
 76J1DYOvCEVREhQe7M3CagXt/C7/CwqijicoI/cX4WWJ0ntUZpy1nIbU0CQ6TkW/E9k7
 8wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5LwmNVFsSfy6EyRs7Ealr4gzA97VJM1KuOHtzH0Li0=;
 b=VKMM+PaNpeQR0YZk1HgTDDzPnYe3syLbw00z1ozmi5dLQeKr9l4cB1DK3C982Xk4sk
 SMUxCs3pyLrsvYpLq1y5TzRDGeATPByjchEnHnT8KakCC5R3CURUxGngxt63jgK1f7FQ
 KvIBeLSWT8pHB8t412MROct2jNgkcgLIMi4hcP2C1YIZBAvJYPh/3R2iacgErECukPoY
 oNvO1sUUXERfTxnY9aFynn5uMuhGfvZcByBQsC4zTadir0EOzw08d4ae1sc38G+ddZsY
 UHsyaD7A7Bln6wMkDckfFg7beTKUHZnSf5aRk+VLTWSyiBD5vbfNeysYtKltU73wWT+A
 ocLQ==
X-Gm-Message-State: AOAM530UpKD9KQxC84wRt0hD9T5sBRxXGCqYqCAd1aKfjO7Ea3ZbC7ie
 vYOWPjoUj1sEN7Jo8LWbQUmaw/vYMDoed0qZu1SPog==
X-Google-Smtp-Source: ABdhPJzX2Eq4rQeY4gzgDvqnd7rQnzuIshDnGr5EuwboV/EfaHrQg8AH54RsVMdP1TD5pJIaYTw1SphxHZ1NIv/2R+c=
X-Received: by 2002:a5d:4351:: with SMTP id u17mr10693936wrr.47.1621620370129; 
 Fri, 21 May 2021 11:06:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210507150515.257424-1-maxime@cerno.tech>
 <20210507150515.257424-7-maxime@cerno.tech>
In-Reply-To: <20210507150515.257424-7-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 May 2021 19:05:53 +0100
Message-ID: <CAPY8ntACvEvvEgRY_Y-fHANLW+0K9iariwpicDGOVM+Xje_CeQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/12] drm/vc4: hdmi: Prevent clock unbalance
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
 Daniel Vetter <daniel.vetter@intel.com>, stable@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 7 May 2021 at 16:05, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Since we fixed the hooks to disable the encoder at boot, we now have an
> unbalanced clk_disable call at boot since we never enabled them in the
> first place.
>
> Let's mimic the state of the hardware and enable the clocks at boot if
> the controller is enabled to get the use-count right.
>
> Cc: <stable@vger.kernel.org> # v5.10+
> Fixes: 09c438139b8f ("drm/vc4: hdmi: Implement finer-grained hooks")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index 1fda574579af..9c919472ae84 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1995,6 +1995,14 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (vc4_hdmi->variant->reset)
>                 vc4_hdmi->variant->reset(vc4_hdmi);
>
> +       if ((of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi0") ||
> +            of_device_is_compatible(dev->of_node, "brcm,bcm2711-hdmi1")) &&
> +           HDMI_READ(HDMI_VID_CTL) & VC4_HD_VID_CTL_ENABLE) {
> +               clk_prepare_enable(vc4_hdmi->pixel_clock);
> +               clk_prepare_enable(vc4_hdmi->hsm_clock);
> +               clk_prepare_enable(vc4_hdmi->pixel_bvb_clock);
> +       }
> +
>         pm_runtime_enable(dev);
>
>         drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_TMDS);
> --
> 2.31.1
>
