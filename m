Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4AE496687
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 21:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA7210E446;
	Fri, 21 Jan 2022 20:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42A410E43F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 20:44:54 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id s127so15280789oig.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 12:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=nNz54uRGsVGq1YmuK1HNWWa+LTEnTSopROjQ2zq4zm0=;
 b=m1s4c2vAOxuTO6Lu0LPAgPXMbmvG4gd3tc9bw2TM7FE1U0bPUh6bhXhmEHwvv+fZCl
 z8Z3w303cT/YXM52NPJsTMCWCLGbrmzpF9ha986eX6m7fhkNLbIyDgGxrs92a+Bx8fND
 7aLwNyV2nnstJzfLFfJEZeC31paYHI71CeT5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=nNz54uRGsVGq1YmuK1HNWWa+LTEnTSopROjQ2zq4zm0=;
 b=gOTn5RjWK3Jl1njZ8bVvrBuyaH/TlSuSvBIsTqYF4LTpgwUjyRa8ocen0zZHeziVQs
 eiXlapIJ5gUwd4JqSr5iay2KuJ/6FyDQAuvp89LDkFs48jpO7EGZaGQbEAh28MAFB2L8
 WdXtEnKIiHsMTwbhCyu6z13i8OCcuxx0jAyqgszEINOgSKDSU2OmFzrI9FnjvbKf9NIT
 QpQTqB8tBphgc0WD4KDoquTV6COzI6VoKzyAaOjLWF9PFLGci8+HNplbY3R4T2+1oCaQ
 xRunC0Z9CFnDwxOMREe0X/mcMAKDAuAh7KSXOAzZix3bEC0aL6+JChdY/kCA9Y1OWCiv
 N2sg==
X-Gm-Message-State: AOAM5300TlK0RXLFcm/AWgEh0Io4UzhrAhK1LbPbLM1A9m93abUAxNrS
 xczuZedxLrEj8I0FCFdaz9vk6cGqrxaPzfXH8Wfotg==
X-Google-Smtp-Source: ABdhPJzDcldej/njJqo9IkYjzGOwjYvA2xC1t1LUcIdHN8PEmwRwA+T0bX98AEPzf48OgQoQSBKj/6v9PKUCO5XIZlI=
X-Received: by 2002:a05:6808:cc:: with SMTP id
 t12mr2046276oic.32.1642797894159; 
 Fri, 21 Jan 2022 12:44:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Jan 2022 12:44:53 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com>
References: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
 <20220119221616.3089119-3-dmitry.baryshkov@linaro.org>
 <CAE-0n53=vj53a_u-5rUmrhV79_-c=F5gtjbejoVs+=PR=hc1Nw@mail.gmail.com>
 <CAA8EJprSTDhox33q0d37NQVKrkdhh+Ubq5_8wXqgstFkr_EtaQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 21 Jan 2022 12:44:53 -0800
Message-ID: <CAE-0n53i6yCdFZpgZqyybP1eJEKmrry1LpPxt410fCQ_LGmJ-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: simplify clocks handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-01-20 23:37:45)
> On Fri, 21 Jan 2022 at 07:30, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-01-19 14:16:15)
> > > diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> > > index 7b504617833a..5533c87c7158 100644
> > > --- a/drivers/gpu/drm/msm/msm_io_utils.c
> > > +++ b/drivers/gpu/drm/msm/msm_io_utils.c
>
> >
> > > +       if (rc) {
> > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to get clock refs %d\n", rc);
> > > +               return rc;
> > > +       }
> > > +
> > > +       rc = of_clk_set_defaults(pdev->dev.of_node, false);
> >
> > Why is this needed?
>
> Both mdss and mdp devices use assigned-clocks properties, while not
> being a clock provider (or a child of it).
> So I assumed it should call the of_clk_set_defaults(node, false)

A device node doesn't need to be a clk provider to call
of_clk_set_defaults(). Does the call to of_clk_set_defaults() in
drivers/base/platform.c cover this?

> Not to mention that this call exists in the msm_dss_parse_clock(),
> which is being refactored/replaced.
>

Indeed it's already in the code.

> >
> > > +       if (rc) {
> > > +               DRM_DEV_ERROR(&pdev->dev, "Failed to set clock defaults %d\n", rc);
> > > +               return rc;
> > > +       }
> > > +
> > > +       *clocks = bulk;
> > > +
