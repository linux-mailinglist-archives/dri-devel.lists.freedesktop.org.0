Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CC04D22CB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:46:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F0610E5CB;
	Tue,  8 Mar 2022 20:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3558610E5CB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:46:08 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so243202oti.5
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 12:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qe1LhIMqN4RZQTRLXSERf1M5wJaST1IELaEQcXdM3sc=;
 b=OfTM6XMaCZ1v6xUfy52AIuAn5s6mb3H21MNHrTRywECDW7YvX1V7O2e++K3M8Fz9J4
 pGgEmgqr9LrE9KKqYdEoimldHsAL9bzWs/WgfmGiCXwOm9ZQ34yDKKoy+XMV6iXqiTBy
 BIWboNtqLpLrTmYfdDNlA6Z2P3pevwBShg/dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qe1LhIMqN4RZQTRLXSERf1M5wJaST1IELaEQcXdM3sc=;
 b=ua/cN/MXB0O0vlBrsviiVyO44TKa2TexSn7l2n01vYUGsBfjvqIxqUK214K73cblg0
 vXpjcaX6EqoJUGYpdJreadChu0sUJRmmeo+By44zCabbW7Yy+4QpVJqGPvOEAvEmYgb6
 GqcRyKqIzd2DWFI30hGeVs4IwIMvKdcJVifr50jiipz/3qAEmUtFjWJ3W+kmeFSxOFnH
 sqpZK8RFMbLQ+6FWE/U3VNb33roPyiBqiXi/Df/PRkAZWxWu12SqbTxHwnK1Fj5ERyFQ
 JL4kprSL4qk1JplOeBFMxpfbXooPW0ho/cyzUDCujCp4cgpFAtcCB9srYWoBPFy9iBPB
 2aeA==
X-Gm-Message-State: AOAM5302mD20/W09mwexGIh7rLzAPENziX5IJwMctYKT2p/Umtt2kX65
 3GDy8CPOYyN2RIuBLt2a7Sp0ZyRv1EYjELobEYvVXQ==
X-Google-Smtp-Source: ABdhPJyKap0aEvvu3WyMrkRJai97vAdB/WSok0/0vs4gIlOc2OoN/D3VHoMtEGuU4iSo3yV/T2GjwnbWNRdBAkEkvEU=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr9309236otl.77.1646772367338; Tue, 08 Mar
 2022 12:46:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:46:06 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
 <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
 <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
 <CAA8EJpq4fXHH6GEJO=m3Ckw0A2p7B_X0D3SiXi1xnJ=4VZOC=g@mail.gmail.com>
 <CAE-0n50h=REsyLsjNMaMaZtH7Dptowink7Tq0nzmBRYNas9OmQ@mail.gmail.com>
 <CAA8EJppT9O+bDjfEZv9tWCWpeCDMDPTf+VV0a0HxDw2mXhiMtw@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:46:06 -0800
Message-ID: <CAE-0n522eve3K1ou-sFgNnfwtb6qSzOssB0=Ewu53PnBYkzO-g@mail.gmail.com>
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

Quoting Dmitry Baryshkov (2022-03-03 23:58:58)
> On Fri, 4 Mar 2022 at 07:31, Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Dmitry Baryshkov (2022-03-03 20:23:06)
> > > On Fri, 4 Mar 2022 at 01:32, Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> > > > > The only clock for which we set the rate is the "stream_pixel". Rather
> > > > > than storing the rate and then setting it by looping over all the
> > > > > clocks, set the clock rate directly.
> > > > >
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > [...]
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > index 07f6bf7e1acb..8e6361dedd77 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > > > @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
> > > > >         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
> > > > >
> > > > >         if (num)
> > > > > -               cfg->rate = rate;
> > > > > +               clk_set_rate(cfg->clk, rate);
> > > >
> > > > This looks bad. From what I can tell we set the rate of the pixel clk
> > > > after enabling the phy and configuring it. See the order of operations
> > > > in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
> > > > is the one that eventually sets a rate through dp_power_clk_set_rate()
> > > >
> > > >         dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
> > > >                                         ctrl->link->link_params.rate * 1000);
> > > >
> > > >         phy_configure(phy, &dp_io->phy_opts);
> > > >         phy_power_on(phy);
> > > >
> > > >         ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
> > >
> > > This code has been changed in the previous patch.
> > >
> > > Let's get back a bit.
> > > Currently dp_ctrl_set_clock_rate() doesn't change the clock rate. It
> > > just stores the rate in the config so that later the sequence of
> > > dp_power_clk_enable() -> dp_power_clk_set_rate() ->
> > > [dp_power_clk_set_link_rate() -> dev_pm_opp_set_rate() or
> > > msm_dss_clk_set_rate() -> clk_set_rate()] will use that.
> > >
> > > There are only two users of dp_ctrl_set_clock_rate():
> > > - dp_ctrl_enable_mainlink_clocks(), which you have quoted above.
> > >   This case is handled in the patch 1 from this series. It makes
> >
> > Patch 1 form this series says DP is unaffected. Huh?
> >
> > > dp_ctrl_enable_mainlink_clocks() call dev_pm_opp_set_rate() directly
> > > without storing (!) the rate in the config, calling
> > > phy_configure()/phy_power_on() and then setting the opp via the
> > > sequence of calls specified above
>
> Note, this handles the "ctrl_link" clock.
>
> > >
> > > - dp_ctrl_enable_stream_clocks(), which calls dp_power_clk_enable()
> > > immediately afterwards. This call would set the stream_pixel rate
> > > while enabling stream clocks. As far as I can see, the stream_pixel is
> > > the only stream clock. So this patch sets the clock rate without
> > > storing in the interim configuration data.
> > >
> > > Could you please clarify, what exactly looks bad to you?
> > >
>
> Note, this handles the "stream_pixel" clock.
>
> >
> > I'm concerned about the order of operations changing between the
> > phy being powered on and the pixel clk frequency being set. From what I
> > recall the pixel clk rate operations depend on the phy frequency being
> > set (which is done through phy_configure?) so if we call clk_set_rate()
> > on the pixel clk before the phy is set then the clk frequency will be
> > calculated badly and probably be incorrect.
>
> But the order of operations is mostly unchanged. The only major change
> is that the opp point is now set before calling the
> phy_configure()/phy_power_on()

Yes that's my concern. The qmp phy driver has a couple clk_set_rate()
calls in the .configure_dp_phy callback. That is called from
phy_power_on() (see qcom_qmp_phy_power_on() and qcom_qmp_phy_dp_ops).
Looking at qcom_qmp_v3_phy_configure_dp_phy() it does

        clk_set_rate(dp_clks->dp_link_hw.clk, dp_opts->link_rate * 100000);
        clk_set_rate(dp_clks->dp_pixel_hw.clk, pixel_freq);

and I believe the child of dp_pixel_hw is find_clock("stream_pixel").
Looks like that is DISP_CC_MDSS_DP_PIXEL_CLK which is
disp_cc_mdss_dp_pixel_clk_src for the rate settable part. That has
clk_dp_ops which is clk_rcg2_dp_set_rate() for the set rate part. That
wants the parent clk frequency to be something non-zero to use in
rational_best_approximation(). If the clk_set_rate("stream_pixel") call
is made before phy_power_on() then the parent_rate in
clk_rcg2_dp_set_rate() won't be valid and the pixel clk frequency will
be wrong.

>
> For the pixel clock the driver has:
> static int dp_ctrl_enable_stream_clocks(struct dp_ctrl_private *ctrl)
> {
>         int ret = 0;
>
>         dp_ctrl_set_clock_rate(ctrl, DP_STREAM_PM, "stream_pixel",
>                                         ctrl->dp_ctrl.pixel_rate * 1000);
>
>         ret = dp_power_clk_enable(ctrl->power, DP_STREAM_PM, true);
> [skipped the error handling]
> }
>
> dp_power_clk_enable() doesn't have any special handlers for the the
> DP_STREAM_PM,
> so this code would be equivalent to the following pseudo code (given
> that there is only one stream clock):
>
> unsigned int rate = ctrl->dp_ctrl.pixel_rate * 1000;
>
> /* dp_ctrl_set_clock_rate() */
> cfg = find_clock_cfg("stream_pixel");
> cfg->rate = rate;
>
> /* dp_power_clk_enable() */
> clk = find_clock("stream_pixel")
> clk_set_rate(clk, cfg->rate);
> clk_prepare_enable(clk);
>
> The proposed patch does exactly this.
>
> Please correct me if I'm wrong.
>
