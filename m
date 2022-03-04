Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8764CCC91
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 05:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B839A10E438;
	Fri,  4 Mar 2022 04:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046B610E438
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 04:31:24 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 l21-20020a056830239500b005afd2a7eaa2so6480940ots.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 20:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=VMg0DkOqrHHMOTtJZibBEpv0iO6yFOEjb6DfQ7mlfkk=;
 b=JRkXP7k0i1FaR9s1p+gu3tJzt1LDEtX99RvbN2Wll12w9xfarBzEoaxNLTVbnrpooO
 7mf+CbpNZ9G+2Ok0xJ3cj2UYgERfDo9M17nOSrrk3I562/LS9hLz9Gm1dxuMuaJ54iOm
 JY4qZPxWa1IalCncPG1abhR1/fM64XEmc6uhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=VMg0DkOqrHHMOTtJZibBEpv0iO6yFOEjb6DfQ7mlfkk=;
 b=7hFDl9fAnHEhLjD0FZicuzj5+ayBpKIJWbzzQO8dyJdZZJNPHMOW118tAaL5EsYo4w
 JJC9fjB74/IYI3tBvugjmVtOLhg2q9nk/5ZthU/pUinWj5EExnxRqnceRGnLm2xYLKOC
 tJticG8Tb40/BVLNX6O5L9gM9uQe7TTsia0xcwbAQEUo2VMUxpEkNrmnjaePKvQh+sDt
 41hZby/IEUdCgWEdhcuPlXJSkXLsZRdJWlkaF2/sznf6u1cKfBPkHdgM2Si5ebgw6aff
 IEUxn3rnlio5UXm6O3kAcD3dIdcfYJ6P4FBgWLoca/VQCtqL0iC5MZygbGoY/xpb1BNv
 ZSnQ==
X-Gm-Message-State: AOAM533xcsXfuj+V+WBhpLkOMQYOVJX26rS1AFafr73X8m6dxRhSggKA
 YwbgNitYQfu/rHMPYtuab5hSH8wavqqImJRLIE28/A==
X-Google-Smtp-Source: ABdhPJzzgT92LrK9VaC2u5RzKzK136irtUiGnsoPxZLKz+wfs8AcsdeiJgxZ+t5E7BjKtRxSAhczoP8MXv0HMFKbT0E=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr21487490otl.77.1646368284197; Thu, 03
 Mar 2022 20:31:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 20:31:23 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
 <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 20:31:23 -0800
Message-ID: <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
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

Quoting Dmitry Baryshkov (2022-03-03 20:23:06)
> On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > > The only clock for which we set the rate is the "stream_pixel". Rather
> > > than storing the rate and then setting it by looping over all the
> > > clocks, set the clock rate directly.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > [...]
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 07f6bf7e1acb..8e6361dedd77 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> > >         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> > >
> > >         if (num)
> > > -               cfg->rate = rate;
> > > +               clk_set_rate(cfg->clk, rate);
> >
> > This looks bad. From what I can tell we set the rate of the pixel clk
> > after enabling the phy and configuring it. See the order of operations
> > in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
> > is the one that eventually sets a rate through dp_power_clk_set_rate()
> >
> >         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
> >                                         ctrl->link->link_params.rate * 1000);
> >
> >         phy_configure(phy, &dp_io->phy_opts);
> >         phy_power_on(phy);
> >
> >         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
>
> This code has been changed in the previous patch.
>
> Let's get back a bit.
> Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
> just stores the rate in the config so that later the sequence of
> dp_power_clk_enable() -> dp_power_clk_set_rate() ->
> [dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
> msm_dss_clk_set_rate() -> clk_set_rate()] will use that.
>
> There are only two users of dp_ctrl_set_clock_rate():
> - dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
>   This case is handled in the patch 1 from this series. It makes

Patch 1 form this series says DP is unaffected. Huh?

> dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
> without storing (!) the rate in the config, calling
> phy_configure()/phy_power_on() and then setting the opp via the
> sequence of calls specified above
>
> - dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
> immediately afterwards. This call would set the stream_pixel rate
> while enabling stream clocks. As far as I can see, the stream_pixel is
> the only stream clock. So this patch sets the clock rate without
> storing in the interim configuration data.
>
> Could you please clarify, what exactly looks bad to you?
>

I'm concerned about the order of operations changing between the
phy being powered on and the pixel clk frequency being set. From what I
recall the pixel clk rate operations depend on the phy frequency being
set (which is done through phy_configure?) so if we call clk_set_rate()
on the pixel clk before the phy is set then the clk frequency will be
calculated badly and probably be incorrect.
