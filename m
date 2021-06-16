Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696913A96F3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE8E89B51;
	Wed, 16 Jun 2021 10:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1F689B51
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 10:09:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso1373087wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pnPqh9N14clerujBTsaFymDQrrCAmrrrodGlT/qhT1A=;
 b=a6YsDy3EfJHT4noQ6OCK4HVcjoNdt2+UP3CahKSdO5dpXPL+vt/vN1fsaCjvLR9P91
 ekSB9nDNntyTOwfQ3HGXPpq9DNagIfuMpw/K3MkmSuC12x5F35V1HRW4JBllabvfCm96
 t9eIj0orBMh62HB7s+esbOTrUq16QTXN1rNVzQU/XHvWPSEEdD7ERSDq9tlO49L9G9gF
 LUoxtAhlNQUpxyVh3Sk9vpJkMyqQT5hQsomUHEto2Ob+fdrRj+1pbr+NlS2qzsdVg5De
 2Wk7Q69jUqy/q/9fffbw0dAlSf1Nzx7M7JRZfckwgn97iRNxyj45ADvBzxR3NuFKxU5X
 ftBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pnPqh9N14clerujBTsaFymDQrrCAmrrrodGlT/qhT1A=;
 b=Tkvm2BRpbM5dfvuBpom+JlzmCDciuaApohQ4jY8xdwVpl1aBwsreOpEKeCBqq0epyh
 zZEhRlJNN23S54g15HTBvbAkxlr3L9ocORMTuRYVhi6Ws2DDZtt/fpM61Jx8J+IsEI47
 WPdxRzO5fqKkLlKJ2SMdHApJOCLu4IMCWI5OKuJMW8emn81DWaaGHh29TbkZ2OjC8Se5
 yg+4XKMCO4sosdh+JrNm9xDjNXorpYBGYuAfiF2Hdca4vXdVh2v/WprNNEr8L/RR6zYH
 2ptrb+bB1B7oHjCGmABk7vy6/jWJ1Pdl1xgoVMU0GLzYLWlikJZmN0nHy5gOHDLMQfJH
 XZWg==
X-Gm-Message-State: AOAM532d0dLnhSZmZ5H6YHsacN7W9APl1go7nx+ug1cO8KVcd/kNbYgW
 uPcyKKPemcdAiZuAMVkpsqy5E62f6JLtsj9Y2EJafw==
X-Google-Smtp-Source: ABdhPJzwSTHY0WLaZOasvU71NaaNjSXnp2erfTSfaBvuAB7Qv3uUl4+8ERP3WHenb8IgpJPpoGZdxkMA6BVJjNDXjIk=
X-Received: by 2002:a7b:c013:: with SMTP id c19mr10270068wmb.158.1623838185332; 
 Wed, 16 Jun 2021 03:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210524132018.264396-1-maxime@cerno.tech>
In-Reply-To: <20210524132018.264396-1-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 16 Jun 2021 11:09:29 +0100
Message-ID: <CAPY8ntAqh2wEhN2wO_RQ2jJ7X3ovwB_5UwbrbPypDOhd1KVN6A@mail.gmail.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Rely on interrupts to handle hotplug
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 May 2021 at 14:20, Maxime Ripard <maxime@cerno.tech> wrote:
>
> DRM currently polls for the HDMI connector status every 10s, which can
> be an issue when we connect/disconnect a display quickly or the device
> on the other end only issues a hotplug pulse (for example on EDID
> change).
>
> Switch the driver to rely on the internal controller logic for the
> BCM2711/RPi4.

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 44 ++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index c27b287d2053..3988969f7410 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -1510,6 +1510,46 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
>
>  }
>
> +static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
> +{
> +       struct vc4_hdmi *vc4_hdmi = priv;
> +       struct drm_device *dev = vc4_hdmi->connector.dev;
> +
> +       if (dev)
> +               drm_kms_helper_hotplug_event(dev);
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int vc4_hdmi_hotplug_init(struct vc4_hdmi *vc4_hdmi)
> +{
> +       struct platform_device *pdev = vc4_hdmi->pdev;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       if (vc4_hdmi->variant->external_irq_controller) {
> +               ret = devm_request_threaded_irq(dev,
> +                                               platform_get_irq_byname(pdev, "hpd-connected"),
> +                                               NULL,
> +                                               vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
> +                                               "vc4 hdmi hpd connected", vc4_hdmi);
> +               if (ret)
> +                       return ret;
> +
> +               ret = devm_request_threaded_irq(dev,
> +                                               platform_get_irq_byname(pdev, "hpd-removed"),
> +                                               NULL,
> +                                               vc4_hdmi_hpd_irq_thread, IRQF_ONESHOT,
> +                                               "vc4 hdmi hpd disconnected", vc4_hdmi);
> +               if (ret)
> +                       return ret;
> +
> +               connector->polled = DRM_CONNECTOR_POLL_HPD;
> +       }
> +
> +       return 0;
> +}
> +
>  #ifdef CONFIG_DRM_VC4_HDMI_CEC
>  static irqreturn_t vc4_cec_irq_handler_rx_thread(int irq, void *priv)
>  {
> @@ -2060,6 +2100,10 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         if (ret)
>                 goto err_destroy_encoder;
>
> +       ret = vc4_hdmi_hotplug_init(vc4_hdmi);
> +       if (ret)
> +               goto err_destroy_conn;
> +
>         ret = vc4_hdmi_cec_init(vc4_hdmi);
>         if (ret)
>                 goto err_destroy_conn;
> --
> 2.31.1
>
