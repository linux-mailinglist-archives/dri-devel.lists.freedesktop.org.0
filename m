Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C9421BB2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 03:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D0F26EB11;
	Tue,  5 Oct 2021 01:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0E16EB11
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:17:54 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so23887814otb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 18:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=//pLozTA8u5eFnxFu8er53lY2pAhu8eBVOwRBYt2X1s=;
 b=I/kVd2YdmrI2kxc2z7oeHnSD5Cr+EEZDK+ix6jYsyn6MW8vIn6r1qToC3ZVca7Qdb1
 dcHdopFYD8otXHm7X82duo+QgJ0KWWxNdfhz9ZcbqlDIVUc2KIc2qWDSNUrNLYgiMpIZ
 GOZa0EPrWtSUeixHsZumJMwreXLgpfpP7/y5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=//pLozTA8u5eFnxFu8er53lY2pAhu8eBVOwRBYt2X1s=;
 b=D1y87VOioK102zQ9bzoaIY4h1yBWh+v+n62KgYB24Wfw2kJBjNnUqM7v/AUFusaiwf
 wGrcS3RSrxiXeD3FuRaIAStZ1xd8EkAfQSjzXksCBKpIldkYF5nu/toHHm4VFKoYaJi6
 7a70KcnNj368k6VZS0ma1VBOf1ovsqUlNqS1onZ8w3k4bJRXseIt2IXMugFElKEPqL2c
 Rqdx51N/WjCxrtWV4g+eLr53CaI/KhyEqo0YeDpZZJ+9m+hxy1xCyt4ZXfqab222f7/T
 1Aro6fDFj4QaFRtTmVNAb6EoRe05lH4N6oW0yASk+zaCA30p2mZ0k2SPlp78Ay+yxb1X
 Fx6w==
X-Gm-Message-State: AOAM533ggsmCfCzoQygfND9DS03fPgAJKfjKjOjeCaapZmNyKuk81YfO
 depi82qhQlgeqpWx+bzOtNeh3VxYRtZ0+Q80Lo8UiQVhYuY=
X-Google-Smtp-Source: ABdhPJyi14nOivxBbnxQ9FAWy0+8VzK3sX3N1t0eLXp7aKLS9/flSudUXSSOxGDvnEi5+ONzUB45UpFxzNDiShYJqdI=
X-Received: by 2002:a9d:1f4:: with SMTP id e107mr11759575ote.77.1633396673725; 
 Mon, 04 Oct 2021 18:17:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:17:53 -0400
MIME-Version: 1.0
In-Reply-To: <YVunKNXj+fxH/e1L@ripper>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
 <20211001180058.1021913-4-bjorn.andersson@linaro.org>
 <CAE-0n50=EWg1GKuTnRi=zA0ufO1Xg4mucYaqNUZ+wgYNDRcWLA@mail.gmail.com>
 <YVunKNXj+fxH/e1L@ripper>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 4 Oct 2021 21:17:53 -0400
Message-ID: <CAE-0n50UcL_ZcZ9isVC2ptnn0OiHHZnU0pTWe3fMd7jRS8z2Tw@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dp: Support up to 3 DP controllers
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Kalyan Thota <kalyan_t@codeaurora.org>, Kuogee Hsieh <khsieh@codeaurora.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Quoting Bjorn Andersson (2021-10-04 18:15:20)
> On Mon 04 Oct 17:58 PDT 2021, Stephen Boyd wrote:
>
> > Quoting Bjorn Andersson (2021-10-01 11:00:56)
> > > Based on the removal of the g_dp_display and the movement of the
> > > priv->dp lookup into the DP code it's now possible to have multiple
> > > DP instances.
> > >
> > > In line with the other controllers in the MSM driver, introduce a
> > > per-compatible list of base addresses which is used to resolve the
> > > "instance id" for the given DP controller. This instance id is used as
> > > index in the priv->dp[] array.
> > >
> > > Then extend the initialization code to initialize struct drm_encoder for
> > > each of the registered priv->dp[] and update the logic for associating
> > > each struct msm_dp with the struct dpu_encoder_virt.
> > >
> > > Lastly, bump the number of struct msm_dp instances carries by priv->dp
> > > to 3, the currently known maximum number of controllers found in a
> > > Qualcomm SoC.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >
> > Some nits below.
> >
> > >
> > > Changes since v2:
> > > - Added MSM_DRM_DP_COUNT to link the two 3s
> > > - Moved NULL check for msm_dp_debugfs_init() to the call site
> > > - Made struct dp_display_private->id unsigned
> > >
> > > I also implemented added connector_type to each of the DP instances and
> > > propagated this to dp_drm_connector_init() but later dropped this again per
> > > Doug's suggestion that we'll base this on the presence/absence of a associated
> > > drm bridge or panel.
> >
> > Sad but OK. We can take up that topic in another patch.
> >
>
> So you don't agree with the solution from sn65dsi86?
>
> The only reason I haven't yet send this other patch is the of_graph
> thing Doug an I are discussing on the RFC. But if we agree to base this
> on compatible we could decide to look only for panels for the edp
> instances and avoid that problem...
>
> We would however never be able to describe the USB-less DP instance with
> a panel explicitly described in DT going that route.

I'll reply on that thread.

>
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > index f655adbc2421..875b07e7183d 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > > @@ -203,8 +204,10 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
> > >         dpu_debugfs_vbif_init(dpu_kms, entry);
> > >         dpu_debugfs_core_irq_init(dpu_kms, entry);
> > >
> > > -       if (priv->dp)
> > > -               msm_dp_debugfs_init(priv->dp, minor);
> > > +       for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> > > +               if (priv->dp[i])
> > > +                       msm_dp_debugfs_init(priv->dp[i], minor);
> >
> > This seems to cause a bunch of debugfs warnings when there are multiple
> > nodes created with the same name.
> >
>
> Yes, that's true. I have a half-baked follow up that attempts to create
> instance-specific debugfs directories. Can we take that in a follow up?

Sure.

>
> > > +       }
> > >
> > >         return dpu_core_perf_debugfs_init(dpu_kms, entry);
> > >  }
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 5d3ee5ef07c2..ff3477474c5d 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1180,10 +1192,31 @@ int dp_display_request_irq(struct msm_dp *dp_display)
> > >         return 0;
> > >  }
> > >
> > > +static int dp_display_find_id(struct platform_device *pdev)
> > > +{
> > > +       const struct msm_dp_config *cfg = of_device_get_match_data(&pdev->dev);
> > > +       struct resource *res;
> > > +       int i;
> > > +
> > > +
> >
> > Nitpick: Remove a newline here.
> >
> > > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > > +       if (!res)
> > > +               return -EINVAL;
> > > +
> > > +       for (i = 0; i < cfg->num_descs; i++) {
> > > +               if (cfg->io_start[i] == res->start)
> > > +                       return i;
> > > +       }
> >
> > Nitpick: Drop braces on single line if inside for loop.
> >
>
> Not when the loop spans multiple lines?

Kernel style is to remove braces from single "statement" for loops where
in this case the statement is the if condition.

>
> > > +
> > > +       dev_err(&pdev->dev, "unknown displayport instance\n");
> > > +       return -EINVAL;
> > > +}
> > > +
