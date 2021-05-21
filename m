Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D538CC73
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 19:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FDD6E7E5;
	Fri, 21 May 2021 17:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CF56E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 17:44:00 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z130so11558602wmg.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 10:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s7zMtK5TbpLiTmKyeILaqEdqxpmwqJT0/8ypWLLX2zc=;
 b=HioS4PK1YK0kL2GR3KhQjcpI52IwnlLBuaEK2779+beRhAND5NqJOSYjUdOWaYwyft
 D1/IYMhWws7pl+40S2TqUCwcGoQu2g7w9tY/f2hdnIuArcGfxMKpd1+y4WZK3sWGNRBk
 kzkhKQLRdJ+nWu1BTr5c15YwOQeIZaVgJ2M5Pdmu2Zegd0L5o3ArD9OR1io0bXqkhuef
 s2kxyzo0mg7AiOLn5TjDqN9SCE2i7b+G0u0h5T+txPA7DdO969NS7tA+0/B+r4p93qZP
 i5cN58Dzo3O/SlJRneMmXBH0FyCnRe5RR7XGS+iJ3AOjf2mjpSjDaNmmt/wY8+IbnFf/
 SCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s7zMtK5TbpLiTmKyeILaqEdqxpmwqJT0/8ypWLLX2zc=;
 b=KQ4AdsPoe10ng9MrGTZ8HQSbmw96WlLqo2995x8LBwGz0fxm7EgG5OHq1SBqnH5OOX
 RvBBbSuZ521+RRJU5jbf35U0EmTole8XkUFAjepH0PoCoevtNvfUeB8GbM59ExfW4yL5
 PhGHyGOM8g/LLaZtLcFvio5ABWbEcrec7YvRL5rHNkPNP8OPQ6uE1PcF3U97tOeDfRDx
 WvFkVX+qNdwxTJZ3AO8AGFoRn/kAN3/28sgY0ZrWwU1YpHb0WO7CI6vjO2vlZcLQ4ZfN
 SUaQye+ZbXpKr6R+MrPvhYjTWzqgqyhejNK1bmNKKxFI/aes/66KzM7Q0rnIAF8Iwuj3
 xngQ==
X-Gm-Message-State: AOAM5311IBRVoNSErWY2vSSDVGGsHfoviYiUirsdgGJDBmzyfgo8dcM9
 mEm9l5O+mX/7f0VZVdq62uGOA65As721avR4HzzenA==
X-Google-Smtp-Source: ABdhPJxiVvS5U1szKEfzpFHXHj30Ddi96fXRj3+/ZWEaxmA0TIa/gjTeXDRkAeBtzMAtuHjFdp8n1UiDpPM9m+HI1Zs=
X-Received: by 2002:a1c:2786:: with SMTP id n128mr10496706wmn.82.1621619038793; 
 Fri, 21 May 2021 10:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210507150515.257424-1-maxime@cerno.tech>
 <20210507150515.257424-12-maxime@cerno.tech>
In-Reply-To: <20210507150515.257424-12-maxime@cerno.tech>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 21 May 2021 18:43:42 +0100
Message-ID: <CAPY8ntCmQOdXMPth_J3FmWi2a-GZuz5wTyfyQOWgpNBCWnUXFA@mail.gmail.com>
Subject: Re: [PATCH v4 11/12] drm/vc4: hdmi: Add a workqueue to set scrambling
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
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime

Thanks for the patch.

On Fri, 7 May 2021 at 16:06, Maxime Ripard <maxime@cerno.tech> wrote:
>
> It looks like some displays (like the LG 27UL850-W) don't enable the
> scrambling when the HDMI driver enables it. However, if we set later the
> scrambler enable bit, the display will work as expected.
>
> Let's create delayed work queue to periodically look at the display
> scrambling status, and if it's not set yet try to enable it again.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 25 +++++++++++++++++++++++++
>  drivers/gpu/drm/vc4/vc4_hdmi.h |  2 ++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
> index bda12fea0dce..4fa7ea419594 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -482,6 +482,8 @@ static bool vc4_hdmi_supports_scrambling(struct drm_encoder *encoder,
>         return true;
>  }
>
> +#define SCRAMBLING_POLLING_DELAY_MS    1000
> +
>  static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>  {
>         struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
> @@ -498,6 +500,9 @@ static void vc4_hdmi_enable_scrambling(struct drm_encoder *encoder)
>
>         HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) |
>                    VC5_HDMI_SCRAMBLER_CTL_ENABLE);
> +
> +       queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
> +                          msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
>  }
>
>  static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
> @@ -516,6 +521,9 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>         if (crtc && !vc4_hdmi_mode_needs_scrambling(&crtc->mode))
>                 return;
>
> +       if (delayed_work_pending(&vc4_hdmi->scrambling_work))
> +               cancel_delayed_work_sync(&vc4_hdmi->scrambling_work);
> +
>         HDMI_WRITE(HDMI_SCRAMBLER_CTL, HDMI_READ(HDMI_SCRAMBLER_CTL) &
>                    ~VC5_HDMI_SCRAMBLER_CTL_ENABLE);
>
> @@ -523,6 +531,22 @@ static void vc4_hdmi_disable_scrambling(struct drm_encoder *encoder)
>         drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, false);
>  }
>
> +static void vc4_hdmi_scrambling_wq(struct work_struct *work)
> +{
> +       struct vc4_hdmi *vc4_hdmi = container_of(to_delayed_work(work),
> +                                                struct vc4_hdmi,
> +                                                scrambling_work);
> +
> +       if (drm_scdc_get_scrambling_status(vc4_hdmi->ddc))
> +               return;
> +
> +       drm_scdc_set_high_tmds_clock_ratio(vc4_hdmi->ddc, true);
> +       drm_scdc_set_scrambling(vc4_hdmi->ddc, true);
> +
> +       queue_delayed_work(system_wq, &vc4_hdmi->scrambling_work,
> +                          msecs_to_jiffies(SCRAMBLING_POLLING_DELAY_MS));
> +}
> +
>  static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
>                                                struct drm_atomic_state *state)
>  {
> @@ -2031,6 +2055,7 @@ static int vc4_hdmi_bind(struct device *dev, struct device *master, void *data)
>         vc4_hdmi = devm_kzalloc(dev, sizeof(*vc4_hdmi), GFP_KERNEL);
>         if (!vc4_hdmi)
>                 return -ENOMEM;
> +       INIT_DELAYED_WORK(&vc4_hdmi->scrambling_work, vc4_hdmi_scrambling_wq);
>
>         dev_set_drvdata(dev, vc4_hdmi);
>         encoder = &vc4_hdmi->encoder.base.base;
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
> index 3cd021136402..00efcf291c5a 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -126,6 +126,8 @@ struct vc4_hdmi {
>         struct vc4_hdmi_encoder encoder;
>         struct drm_connector connector;
>
> +       struct delayed_work scrambling_work;
> +
>         struct i2c_adapter *ddc;
>         void __iomem *hdmicore_regs;
>         void __iomem *hd_regs;
> --
> 2.31.1
>
