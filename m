Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A9060E536
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 18:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85D10E4F3;
	Wed, 26 Oct 2022 16:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8DA10E4F3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 16:05:56 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id t25so17088680ejb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gy9lnatI+idv0wfVA4PCjrB1av5GQo89IHVX6FEEu3g=;
 b=TScHVi0L08eESt+XzunmlEydMGWiiMffiZYRqzJjFu+kN8+8XjYjRIxn/LBxbTC0eX
 8ljZb0epE91p9D/NMVRgIzhhE5eM4NYUBt3gy2FVQbRlq1P32HOhDDqcmGpcWF5TIDt/
 Ne5FZrmZMo9WReu8jF9Z4Ws/5veueBgI1EOJAsOOhULMhAPWXWIlxG6S8ZbGgbamrcuW
 NjvKsXVPgthGXadfrv/QXWAkU9Hei4dJjtkUrIBIU7VPiwg2FjolEgunmNlgsPJiVA9v
 PnsdWzejMbpWMvMpcMn/cFsMF/CnHh35whzQn54nhye9UoLOp8Z7UShP4t/VTI+Dt4L/
 pLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gy9lnatI+idv0wfVA4PCjrB1av5GQo89IHVX6FEEu3g=;
 b=qJjSf5aL3Aczq7dBE1vJvvxqvMACHjQW3ENkGszRBDNi70MGs9TouOcjEMvSZHzl4U
 u93gfUbD8IgtRdFFC06GZNlx9juMqCn1hVXLdg6vcZeHpfaIjM+MtuR9sgEaHc1O8jdj
 cbzrA3vzEsFuiNOaGaN2HN+lsezl0tEfwtRN4sBWqIPhJKvxFr82BItur56tnNYE0In7
 JMOravde54y02LHGDiOdZ6S4yZ/OhgfZScukZTqvAyKKTF6o/NT0Vl7gTXHkilRMRHaU
 STuzhFZDn5G5IU+73TSAQoQNOgVKJkmFl4T94DjddBd7amMqySMdA2zuWXcD9mM+1sCF
 vd0w==
X-Gm-Message-State: ACrzQf0xBFVIT+SPx7RZp1Gxz+cnnWm4IodH+lM8kFXC7w9cpvjVYlgf
 hpKFkvEqn/ZZbP657tTRJ2WscVJDaYunQ0Wth1NN+g==
X-Google-Smtp-Source: AMsMyM6+EBdhOBXGhtCJrpxytVHNJz1d0SNEMwgO8O2dtf4tYw36MwISR1CucJMvfIdcCf79+5ytILIeyuWNJ2/Afho=
X-Received: by 2002:a17:907:2cf1:b0:78d:cafc:caba with SMTP id
 hz17-20020a1709072cf100b0078dcafccabamr38531914ejc.154.1666800354786; Wed, 26
 Oct 2022 09:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220815-rpi-fix-4k-60-v4-0-a1b40526df3e@cerno.tech>
 <20220815-rpi-fix-4k-60-v4-5-a1b40526df3e@cerno.tech>
 <CAPY8ntBUJRKOkw4VxWL97zj13+DLtMG6rBgGCrvA+HHaAZ7Zvg@mail.gmail.com>
In-Reply-To: <CAPY8ntBUJRKOkw4VxWL97zj13+DLtMG6rBgGCrvA+HHaAZ7Zvg@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 26 Oct 2022 17:05:39 +0100
Message-ID: <CAPY8ntCgfLvUuSh=zHxxNPok4ygp1P0Nz--SV-hXKd_jQOL8Uw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
 code
To: maxime@cerno.tech
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Emma Anholt <emma@anholt.net>, Stephen Boyd <sboyd@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I knew there was something else

On Wed, 26 Oct 2022 at 17:00, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime
>
> On Thu, 20 Oct 2022 at 10:14, <maxime@cerno.tech> wrote:
> >
> > In order to support higher HDMI frequencies, users have to set the
> > hdmi_enable_4kp60 parameter in their config.txt file.
> >
> > This will have the side-effect of raising the maximum of the core clock,
> > tied to the HVS, and managed by the HVS driver.
> >
> > However, we are querying this in the HDMI driver by poking into the HVS
> > structure to get our struct clk handle.
> >
> > Let's make this part of the HVS bind implementation to have all the core
> > clock related setup in the same place.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  drivers/gpu/drm/vc4/vc4_drv.h  | 10 ++++++++++
> >  drivers/gpu/drm/vc4/vc4_hdmi.c | 15 ++++-----------
> >  drivers/gpu/drm/vc4/vc4_hdmi.h |  8 --------
> >  drivers/gpu/drm/vc4/vc4_hvs.c  | 23 +++++++++++++++++++++++
> >  4 files changed, 37 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> > index 418a8242691f..8b2b1af565f9 100644
> > --- a/drivers/gpu/drm/vc4/vc4_drv.h
> > +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> > @@ -326,6 +326,8 @@ struct vc4_hvs {
> >
> >         struct clk *core_clk;
> >
> > +       unsigned long max_core_rate;
> > +
> >         /* Memory manager for CRTCs to allocate space in the display
> >          * list.  Units are dwords.
> >          */
> > @@ -337,6 +339,14 @@ struct vc4_hvs {
> >         struct drm_mm_node mitchell_netravali_filter;
> >
> >         struct debugfs_regset32 regset;
> > +
> > +       /*
> > +        * Even if HDMI0 on the RPi4 can output modes requiring a pixel
> > +        * rate higher than 297MHz, it needs some adjustments in the
> > +        * config.txt file to be able to do so and thus won't always be
> > +        * available.
> > +        */
> > +       bool vc5_hdmi_enable_scrambling;

Name only. This flag isn't to do with scrambling, it's whether we can
achieve pixel rates greater than those defined by HDMI 1.4.

We do have code related to enabling scrambling, which is part of HDMI
2.0, so this currently could cause confusion.

  Dave

> >  };
> >
> >  struct vc4_plane {
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > index 87961d4de5aa..afe3daa2173e 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > @@ -46,7 +46,6 @@
> >  #include <linux/pm_runtime.h>
> >  #include <linux/rational.h>
> >  #include <linux/reset.h>
> > -#include <soc/bcm2835/raspberrypi-clocks.h>
> >  #include <sound/dmaengine_pcm.h>
> >  #include <sound/hdmi-codec.h>
> >  #include <sound/pcm_drm_eld.h>
> > @@ -460,6 +459,7 @@ static int vc4_hdmi_connector_detect_ctx(struct drm_connector *connector,
> >  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> >  {
> >         struct vc4_hdmi *vc4_hdmi = connector_to_vc4_hdmi(connector);
> > +       struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> >         int ret = 0;
> >         struct edid *edid;
> >
> > @@ -483,7 +483,7 @@ static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
> >         ret = drm_add_edid_modes(connector, edid);
> >         kfree(edid);
> >
> > -       if (vc4_hdmi->disable_4kp60) {
> > +       if (!vc4->hvs->vc5_hdmi_enable_scrambling) {
> >                 struct drm_device *drm = connector->dev;
> >                 const struct drm_display_mode *mode;
> >
> > @@ -1757,11 +1757,12 @@ vc4_hdmi_encoder_clock_valid(const struct vc4_hdmi *vc4_hdmi,
> >  {
> >         const struct drm_connector *connector = &vc4_hdmi->connector;
> >         const struct drm_display_info *info = &connector->display_info;
> > +       struct vc4_dev *vc4 = to_vc4_dev(connector->dev);
> >
> >         if (clock > vc4_hdmi->variant->max_pixel_clock)
> >                 return MODE_CLOCK_HIGH;
> >
> > -       if (vc4_hdmi->disable_4kp60 && clock > HDMI_14_MAX_TMDS_CLK)
> > +       if (!vc4->hvs->vc5_hdmi_enable_scrambling && clock > HDMI_14_MAX_TMDS_CLK)
> >                 return MODE_CLOCK_HIGH;
> >
> >         if (info->max_tmds_clock && clock > (info->max_tmds_clock * 1000))
> > @@ -3428,14 +3429,6 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
> >         vc4_hdmi->disable_wifi_frequencies =
> >                 of_property_read_bool(dev->of_node, "wifi-2.4ghz-coexistence");
> >
> > -       if (variant->max_pixel_clock == 600000000) {
> > -               struct vc4_dev *vc4 = to_vc4_dev(drm);
> > -               unsigned long max_rate = rpi_firmware_clk_get_max_rate(vc4->hvs->core_clk);
> > -
> > -               if (max_rate < 550000000)
> > -                       vc4_hdmi->disable_4kp60 = true;
> > -       }
> > -
> >         ret = devm_pm_runtime_enable(dev);
> >         if (ret)
> >                 return ret;
> > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > index db823efb2563..e3619836ca17 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> > @@ -156,14 +156,6 @@ struct vc4_hdmi {
> >          */
> >         bool disable_wifi_frequencies;
> >
> > -       /*
> > -        * Even if HDMI0 on the RPi4 can output modes requiring a pixel
> > -        * rate higher than 297MHz, it needs some adjustments in the
> > -        * config.txt file to be able to do so and thus won't always be
> > -        * available.
> > -        */
> > -       bool disable_4kp60;
> > -
> >         struct cec_adapter *cec_adap;
> >         struct cec_msg cec_rx_msg;
> >         bool cec_tx_ok;
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index 4ac9f5a2d5f9..300ac0b57571 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -28,6 +28,8 @@
> >  #include <drm/drm_drv.h>
> >  #include <drm/drm_vblank.h>
> >
> > +#include <soc/bcm2835/raspberrypi-firmware.h>
> > +
> >  #include "vc4_drv.h"
> >  #include "vc4_regs.h"
> >
> > @@ -791,12 +793,33 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
> >         hvs->regset.nregs = ARRAY_SIZE(hvs_regs);
> >
> >         if (vc4->is_vc5) {
> > +               struct rpi_firmware *firmware;
> > +               struct device_node *node;
> > +               unsigned long max_rate;
>
> As commented on patch 4, the value returned by
> rpi_firmware_clk_get_max_rate is only an unsigned int.
> I guess in this case it is passed into the clock frame work which
> wants unsigned long, but do we need to keep it as an unsigned long?
>
> > +
> > +               node = rpi_firmware_find_node();
> > +               if (!node)
> > +                       return -EINVAL;
> > +
> > +               firmware = rpi_firmware_get(node);
> > +               of_node_put(node);
> > +               if (!firmware)
> > +                       return -EPROBE_DEFER;
> > +
> >                 hvs->core_clk = devm_clk_get(&pdev->dev, NULL);
> >                 if (IS_ERR(hvs->core_clk)) {
> >                         dev_err(&pdev->dev, "Couldn't get core clock\n");
> >                         return PTR_ERR(hvs->core_clk);
> >                 }
> >
> > +               max_rate = rpi_firmware_clk_get_max_rate(firmware,
> > +                                                        RPI_FIRMWARE_CORE_CLK_ID);
> > +               rpi_firmware_put(firmware);
> > +               if (max_rate >= 550000000)
> > +                       hvs->vc5_hdmi_enable_scrambling = true;
> > +
> > +               hvs->max_core_rate = max_rate;
>
> I was going to query the reason for storing this value, but it's used
> when we get to patch 7/7.
> I won't quibble about having it as an unused value for 2 patches.
>
> If you're happy in both cases, then I'll send an R-b.
>
>   Dave
>
> >                 ret = clk_prepare_enable(hvs->core_clk);
> >                 if (ret) {
> >                         dev_err(&pdev->dev, "Couldn't enable the core clock\n");
> >
> > --
> > b4 0.10.1
