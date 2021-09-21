Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0A3413918
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07186E9F7;
	Tue, 21 Sep 2021 17:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391136E9F5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 17:47:29 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id z12so152372qvx.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 10:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4l5ZtjnLCSfnNUm/SUyiEJZChY9LohQtTBo/12x3KdY=;
 b=tJJ87gBFlMcuO2yBB/X9ovReI6co+cU6/xSuv5b51aWeWliHA3JbKhaTnD+puKkDYl
 Vlk983EV3MyIUqMRcQEoN1rTxAgb3YqfOFZ380A6JJc+iccoM5Ls3YfC5HVIeRkbINWS
 qvfmJwaK3+ORwKxTlZjUP74AlrDoBnPtRdRtHvEOoQvntgWf0BFsjybksf5xS20LAGqq
 ++KRveCiiMGLylIB+k1nGUeFooCpyBBVyFnWZfSRHlQZC0C8X0M+GLq/q1IEEentZpJQ
 Y94VJFRbhYHkmj3CcT91c+edspql8GU1dFHYz6/nr+alVq4LEiH8ltIRNUnkvYdp/2Un
 uXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4l5ZtjnLCSfnNUm/SUyiEJZChY9LohQtTBo/12x3KdY=;
 b=pU0kIyxAWb/PN8jUMSmy3Mi9MVmuIQPTWxsIVYW/txQdiNJwBxoPb9hnIM2BNqZCDT
 3vI2s0FeUxbFM4+3Sk5ZsKD6Bt73QHS67+7TFhtIZHv2OwNFQBdlvi+mMabERe39uLpn
 whmswcWK0D+y2oI4WOX6n0qOnG5np1PXCKkiFEETcTwGNYEvhdEraCgAlMExszH+7OD8
 MbdBLpnQZN4eUYS8PhahqrHY2IrJYKWJWEDmhE39EgynmdE/41dZUDOOM8cj6cFLj0kB
 t1G03x2SWChDKrhkSh+Ah6P5y4oRn14y5I78qvMl3VxnpPiSh+H6B4LnYWf68F2puMkq
 eBTg==
X-Gm-Message-State: AOAM532w5GbDdVvfQ0z+bfAywJfUUws9O7s3X8JKHSQn3wSSGJaL/l+L
 6p3rI8ZhqUSyIF1JRMLqb+m4TctoujLTvHLqM1Y/VQ==
X-Google-Smtp-Source: ABdhPJxTkhe8AQytg6rwWsCiqLE1hSuP4wEcBHBtxA0TXo5Hqn/hog3r7h35LGSfmOp3tfNEOero6RYTTmOkk9NlMYY=
X-Received: by 2002:a0c:da8b:: with SMTP id z11mr3937835qvj.3.1632246448201;
 Tue, 21 Sep 2021 10:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
 <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
In-Reply-To: <0c275df228a1925e43a4dc59ceeab6b7@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Sep 2021 20:47:17 +0300
Message-ID: <CAA8EJppLDpmT81OhdpWjHh4joPL=mNaG8eZN2cZOZk8mSpbd+w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: do not install irq handler
 before power up the host
To: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, David Heidelberg <david@ixit.cz>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 21 Sept 2021 at 20:01, <abhinavk@codeaurora.org> wrote:
>
> On 2021-09-21 09:22, Dmitry Baryshkov wrote:
> > The DSI host might be left in some state by the bootloader. If this
> > state generates an IRQ, it might hang the system by holding the
> > interrupt line before the driver sets up the DSI host to the known
> > state.
> >
> > Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
> > so that we can be sure that the interrupt is delivered when the host is
> > in the known state.
> >
> > Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> This is a valid change and we have seen interrupt storms in downstream
> happening
> when like you said the bootloader leaves the DSI host in unknown state.
> Just one question below.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
> >  1 file changed, 12 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > index e269df285136..cd842347a6b1 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct
> > mipi_dsi_host *host,
> >               return ret;
> >       }
> >
> > -     ret = devm_request_irq(&pdev->dev, msm_host->irq,
> > -                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > -                     "dsi_isr", msm_host);
> > -     if (ret < 0) {
> > -             DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
> > -                             msm_host->irq, ret);
> > -             return ret;
> > -     }
> > -
> >       msm_host->dev = dev;
> >       ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
> >       if (ret) {
> > @@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host
> > *host,
> >       if (msm_host->disp_en_gpio)
> >               gpiod_set_value(msm_host->disp_en_gpio, 1);
> >
> > +     ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
> > +                     dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> > +                     "dsi_isr", msm_host);
> > +     if (ret < 0) {
> > +             DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
> > +                             msm_host->irq, ret);
> > +             return ret;
> > +     }
> > +
> > +
>
> Do you want to move this to msm_dsi_host_enable()?
> So without the controller being enabled it is still in unknown state?

msm_dsi_host_power_on() reconfigures the host registers, so the state
is known at the end of the power_on().

> Also do you want to do this after dsi0 and dsi1 are initialized to
> account for
> dual dsi cases?

I don't think this should matter. The host won't generate 'extra'
interrupts in such case, will it?

>
> >       msm_host->power_on = true;
> >       mutex_unlock(&msm_host->dev_mutex);
> >
> > @@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host
> > *host)
> >               goto unlock_ret;
> >       }
> >
> > +     devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
> > +
> >       dsi_ctrl_config(msm_host, false, NULL, NULL);
> >
> >       if (msm_host->disp_en_gpio)



-- 
With best wishes
Dmitry
