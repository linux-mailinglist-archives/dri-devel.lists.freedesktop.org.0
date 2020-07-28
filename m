Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1055230D0B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 17:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9BE96E30F;
	Tue, 28 Jul 2020 15:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192426E30F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 15:07:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so18658149wrw.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/YdhzEx/vyaHEVhqUuCRX7czWchwkSBVhpXRtjSYY4=;
 b=VTagqeDR8jA/cF11iGP906j2K3kIJGUg0PT91VJQtmmZWW40RJOhkg3WHkLVXNY3SN
 8kZL8SgF28l5FAI1pi6of5htR3Sku6yW86xTYzKWrTQl61N9+/x2/WZD5sGraNT7KJQL
 ix+K3lboyDRkQZM2P146zwHgkvOSDIZZU9Fo0omMt4cNlJeM0gIo045JbvVe3Y/1SmeG
 yZMt9nPrwBdeiAyd9MzuBGM0VPDpTspHJgnGIXCU1guC4RPPMgbCos1Z86nAd3DEH7H2
 Khv5iijZps9LdpFz9ub/q7nEwMs8O1ca+kwQRiAgm8aom4oubq+9tzIoc/GEghsZE8b3
 lOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/YdhzEx/vyaHEVhqUuCRX7czWchwkSBVhpXRtjSYY4=;
 b=QmydLtKLm5r4gA9MbOslTBRsYUZu4S+1qgd0SrnyVj2dgmQkV31+tIS2d631dC0Ejv
 l7HoR8fklUQGHW3wAS2HWoyNlaXdZD2Sk5TWXahCRDRikk6R1rmqp526naTClDpKpl3u
 j+rnWjC6VWtHahwWaxLGTX4lKMqtADJ3rAnasuroWBWxjau2e0cNl0ewlG8UrfDz7cPa
 vVPNDFsnCL+KIdF3Ny5g59pmUA28Ba6UwwBTVP+rG+wt8roktC9ryJSuKMAgKl6qMxpn
 fzGpi9Thx5xT5UDXxCKJu3D0dVb+KduKlQ+pWx5zAUQs8IMvJTmyP1Z8Kyywg8PYQ/Dr
 gSZQ==
X-Gm-Message-State: AOAM530ezUUduaW2qbgOuxJNplxZalSzan1SegUq87eeMcD2BL76knTs
 o1380pQoTB4rbdhIfeVw77UX0ylddfO05fKRWUnmqg==
X-Google-Smtp-Source: ABdhPJygKAtASQ39NVxPtwZTd0cui+1aL7Ldd3aiUrbNsVByMnrKvu4bejQSYxT36FPuweRrJ+bGO2xF63DlnnP2678=
X-Received: by 2002:a5d:5383:: with SMTP id d3mr18384224wrv.42.1595948827769; 
 Tue, 28 Jul 2020 08:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <06921938439fdf7da952fb8d148932fc9403f82a.1594230107.git-series.maxime@cerno.tech>
In-Reply-To: <06921938439fdf7da952fb8d148932fc9403f82a.1594230107.git-series.maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Jul 2020 16:06:48 +0100
Message-ID: <CAPY8ntAaH9hOXQuVaSyCNrU5fKKHgk=+3wV3eKcR84-pw_PjeQ@mail.gmail.com>
Subject: Re: [PATCH v4 72/78] drm/vc4: hdmi: Do the VID_CTL configuration at
 once
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

On Wed, 8 Jul 2020 at 18:44, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The VID_CTL setup is done in several places in the driver even though it's
> not really required. Let's simplify it a bit to do the configuration in one
> go.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index bbe521ab000b..f56a718a3643 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -428,10 +428,6 @@ static void vc4_hdmi_set_timings(struct vc4_hdmi *vc4_hdmi,
>
>         HDMI_WRITE(HDMI_VERTB0, vertb_even);
>         HDMI_WRITE(HDMI_VERTB1, vertb);
> -
> -       HDMI_WRITE(HDMI_VID_CTL,
> -                  (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
> -                  (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
>  }
>
>  static void vc4_hdmi_recenter_fifo(struct vc4_hdmi *vc4_hdmi)
> @@ -520,8 +516,6 @@ static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *encoder)
>         if (vc4_hdmi->variant->phy_init)
>                 vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
>
> -       HDMI_WRITE(HDMI_VID_CTL, 0);
> -
>         HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
>                    HDMI_READ(HDMI_SCHEDULER_CONTROL) |
>                    VC4_HDMI_SCHEDULER_CONTROL_MANUAL_FORMAT |
> @@ -555,15 +549,19 @@ static void vc4_hdmi_encoder_pre_crtc_enable(struct drm_encoder *encoder)
>
>  static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder)
>  {
> +       struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>         struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
>         struct vc4_hdmi_encoder *vc4_encoder = to_vc4_hdmi_encoder(encoder);
> +       bool hsync_pos = mode->flags & DRM_MODE_FLAG_PHSYNC;
> +       bool vsync_pos = mode->flags & DRM_MODE_FLAG_PVSYNC;
>         int ret;
>
>         HDMI_WRITE(HDMI_VID_CTL,
> -                  HDMI_READ(HDMI_VID_CTL) |
>                    VC4_HD_VID_CTL_ENABLE |
>                    VC4_HD_VID_CTL_UNDERFLOW_ENABLE |
> -                  VC4_HD_VID_CTL_FRAME_COUNTER_RESET);
> +                  VC4_HD_VID_CTL_FRAME_COUNTER_RESET |
> +                  (vsync_pos ? 0 : VC4_HD_VID_CTL_VSYNC_LOW) |
> +                  (hsync_pos ? 0 : VC4_HD_VID_CTL_HSYNC_LOW));
>
>         if (vc4_encoder->hdmi_monitor) {
>                 HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
> --
> git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
