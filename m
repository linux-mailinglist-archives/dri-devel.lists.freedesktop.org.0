Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B137D2B87
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B094F10E156;
	Mon, 23 Oct 2023 07:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D754D10E156
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:40:17 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-4a403fdebedso1078152e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698046817; x=1698651617; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LTwZL7ZB+4qPOTcj2G/meZmbL6HBlSSmbTIpmPj/DWo=;
 b=vo+9DRj/nt7UaWsCNlmSjLwqmq7ofKW5fjK6jUm9sZjQdcW1Opf2g0hpMiNTlCp0Zr
 8UbdT5OnDSpcDB0NTWKS454x9bpU/x/vTwnAawu1V8jqyn3R5287/oqgM5InH7FoxxbE
 u0vnJFlfYqmy5hSgG/SG3FsoH1g+hmuHLPCUlmozaeEwYdnjV2G1w33C6LM5geypqsZT
 bdUNNrrYzreHA5ZwMBioVqxRMPIk60AHjW2FHJ+RFpasHi5CGl8SQKzpFihE8YafS5Sh
 4+SrFo/o5P5ztTrIHBP9i7PsxJYifhCnsFy3FMNRSe54Gnnh/A0n5R5cWWcHsXQO8ZOy
 cBGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698046817; x=1698651617;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTwZL7ZB+4qPOTcj2G/meZmbL6HBlSSmbTIpmPj/DWo=;
 b=oo0SPFnc7+Ek5xsUdq5j+yuAoOcWeTGk9Uinv2dXPuqHdo0ovBeRODnVaJAGbfe8SV
 bzK4bikkFt0hrQNrsCHRXQeigZR+xrqicobe+5ZnhA9ffNiyKXVMSzVqzgcUPpq/Ejte
 MFQe+kAOWszMRPV0qKNaIWsJt/6rIde/E1B3O0ArJHV6ZC0isDUKsEHl8C6kaYoNC2Dc
 aBlkFKGJePL8gaaH3NQNgeBcqJlCNuVKghxtzJB/1I8TuoK7NfdGc1hsBT9EUbX/YJkj
 1pS6M95K/7jSC70ti4mUSYjy/6tHjkSz+DbJTBQSNbl4jUNB9ZbnKz8TkF4KwLXdBRse
 49ww==
X-Gm-Message-State: AOJu0Yx7qfH1Zfy+BFSmY5NL640bpoyM9egE9HJDEZhJcSR9RBh8golU
 4iAADWyHZRWWQccjZvH8h5JVAnTlUBxrdWGQRfxzpg==
X-Google-Smtp-Source: AGHT+IFIuNOE5csO/dEMQna24sjlvo6iAi0uk2UHGNbT+8VHC5+6qCdvQw7xewHtIa5zcWhbY15Yzb9NZ+ZLP2wfiNg=
X-Received: by 2002:a1f:fc07:0:b0:49b:adce:e2d1 with SMTP id
 a7-20020a1ffc07000000b0049badcee2d1mr7498986vki.10.1698046816744; Mon, 23 Oct
 2023 00:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
 <20231016165355.1327217-4-dmitry.baryshkov@linaro.org>
 <d941462e-1ac8-4dce-bd09-ddb99d79578a@linaro.org>
In-Reply-To: <d941462e-1ac8-4dce-bd09-ddb99d79578a@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 23 Oct 2023 10:40:05 +0300
Message-ID: <CAA8EJpqB6eMCEEg3Ptg531mTiOsnP=3qE_C6dyA1_TO4ZbJAbw@mail.gmail.com>
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over
 the DSI link power state
To: neil.armstrong@linaro.org
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Marek Vasut <marex@denx.de>,
 Robert Foss <rfoss@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023 at 10:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 16/10/2023 18:53, Dmitry Baryshkov wrote:
> > The MIPI DSI links do not fully fall into the DRM callbacks model. The
> > drm_bridge_funcs abstraction. Instead of having just two states (off and
> > on) the DSI hosts have separate LP-11 state. In this state the host is
> > on, but the video stream is not yet enabled.
> >
> > Introduce API that allows DSI bridges / panels to control the DSI host
> > power up state.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/drm_mipi_dsi.c | 31 +++++++++++++++++++++++++++++++
> >   include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
> >   2 files changed, 56 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> > index 14201f73aab1..c467162cb7d8 100644
> > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > @@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
> >   }
> >   EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
> >
> > +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *host)
> > +{
> > +     const struct mipi_dsi_host_ops *ops = host->ops;
> > +
> > +     return ops && ops->power_up;
> > +}
> > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
> > +
> > +int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
> > +{
> > +     const struct mipi_dsi_host_ops *ops = host->ops;
> > +
> > +     if (!mipi_dsi_host_power_control_available(host))
> > +             return -EOPNOTSUPP;
> > +
> > +     return ops->power_up ? ops->power_up(host) : 0;
> > +}
> > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
> > +
> > +void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
> > +{
> > +     const struct mipi_dsi_host_ops *ops = host->ops;
> > +
> > +     if (!mipi_dsi_host_power_control_available(host))
> > +             return;
> > +
> > +     if (ops->power_down)
> > +             ops->power_down(host);
> > +}
> > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
> > +
> >   static ssize_t mipi_dsi_device_transfer(struct mipi_dsi_device *dsi,
> >                                       struct mipi_dsi_msg *msg)
> >   {
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 167742e579e3..e503c3e4d057 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -68,6 +68,8 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
> >    * @attach: attach DSI device to DSI host
> >    * @detach: detach DSI device from DSI host
> >    * @transfer: transmit a DSI packet
> > + * @power_up: enable DSI link and bring it to the LP-11 state
> > + * @power_down: fully disable DSI link
> >    *
> >    * DSI packets transmitted by .transfer() are passed in as mipi_dsi_msg
> >    * structures. This structure contains information about the type of packet
> > @@ -81,10 +83,18 @@ int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
> >    * function will seldomly return anything other than the number of bytes
> >    * contained in the transmit buffer on success.
> >    *
> > - * Also note that those callbacks can be called no matter the state the
> > - * host is in. Drivers that need the underlying device to be powered to
> > - * perform these operations will first need to make sure it's been
> > - * properly enabled.
> > + * Note: currently there are two modes of DSI power control. Legacy drivers
> > + * will call those callbacks no matter the state the host is in. DSI host
> > + * drivers that need the underlying device to be powered to perform these
> > + * operations will first need to make sure it's been properly enabled.
> > + *
> > + * Newer drivers will set the @MIPI_DSI_MANUAL_POWERUP flag to indicate that
> > + * they will call @mipi_dsi_power_up() and @mipi_dsi_power_down() to control
> > + * the link state of the DSI host or they will set @MIPI_DSI_AUTO_POWERUP to
> > + * indicate that the driver is fine with the link being powered up in DSI
> > + * host's (atomic_)pre_enable() callback and then being disabled in the
> > + * (atomic_)post_disable() callback. The transfer callback must only be called
> > + * if the DSI host has been powered up and was not brought down.
> >    *
> >    * Note: some hosts (sunxi) can not send LP commands between HS video
> >    * packets. Thus all DSI transfers sent in LP mode should be limited to the
> > @@ -97,6 +107,8 @@ struct mipi_dsi_host_ops {
> >                     struct mipi_dsi_device *dsi);
> >       ssize_t (*transfer)(struct mipi_dsi_host *host,
> >                           const struct mipi_dsi_msg *msg);
> > +     int (*power_up)(struct mipi_dsi_host *host);
> > +     void (*power_down)(struct mipi_dsi_host *host);
> >   };
> >
> >   /**
> > @@ -143,6 +155,10 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >   #define MIPI_DSI_MODE_LPM           BIT(11)
> >   /* transmit data ending at the same time for all lanes within one hsync */
> >   #define MIPI_DSI_HS_PKT_END_ALIGNED BIT(12)
> > +/* DSI peripheral driver manually controls DSI link powerup */
> > +#define MIPI_DSI_MANUAL_POWERUP              BIT(13)
> > +/* DSI peripheral driver is fine with automatic DSI link power control */
> > +#define MIPI_DSI_AUTO_POWERUP                BIT(14)
>
> What happens if none of the bits are in the flags ?
>
> Can't we implement "opportunistic power-up" on the first DSI command sent?

Not really. Such an opportunistic power up was expected to be there
and ... it failed, as you can see from the pre_enable_prev_first and
then by this series.

If the device doesn't set either of these flags, the DSI host can not
make any guesses about the time to power up the link. So, it should
follow the previous approach of enabling the DSI link no later than
mode_set. Otherwise the DSI sink might not be able to send DSI
commands from pre_enable callback.

>
> If a bridge/panel sends a DSI command, and if it happens before the DSI host enable, then
> the DSI host will "pre-enable" the host and put the link in LP-11.
>
> This would be simpler and would work whatever the pre_enable order.
>
> But this won't work for the tc358767, except if we add a dummy DSI host command
> which powers up the DSI link.
>
> This won't fix the PS8640 either who also needs a disabled DSI link to initialize.

Well, you have said it. The automatic enabling doesn't work if the DSI
host has no information about the DSI sink.

>
> Neil
>
> >
> >   enum mipi_dsi_pixel_format {
> >       MIPI_DSI_FMT_RGB888,
> > @@ -235,6 +251,11 @@ void mipi_dsi_device_unregister(struct mipi_dsi_device *dsi);
> >   struct mipi_dsi_device *
> >   devm_mipi_dsi_device_register_full(struct device *dev, struct mipi_dsi_host *host,
> >                                  const struct mipi_dsi_device_info *info);
> > +
> > +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host *host);
> > +int mipi_dsi_host_power_up(struct mipi_dsi_host *host);
> > +void mipi_dsi_host_power_down(struct mipi_dsi_host *host);
> > +
> >   struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np);
> >   int mipi_dsi_attach(struct mipi_dsi_device *dsi);
> >   int mipi_dsi_detach(struct mipi_dsi_device *dsi);
>


-- 
With best wishes
Dmitry
