Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F06477AD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 22:06:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17310E070;
	Thu,  8 Dec 2022 21:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C0F10E070;
 Thu,  8 Dec 2022 21:06:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDB9262070;
 Thu,  8 Dec 2022 21:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A378AC433EF;
 Thu,  8 Dec 2022 21:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670533586;
 bh=J4NaD5DiaIrHO6Wu1hSOZE75QqEaTQJzKrEN8RtbCZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fx5D9dQKhmKha4DqL4ADNc9N56jaJFC4a0Nav9VsD8KQd98OJHhuzqUkzIcDQrLEa
 AHi8dWrttK1cGwRkcYhv7geKPay8pRJecRwfc8Ddf9NIcLieKc5IsmVeoKiwoCIwKj
 ++TFWpeL2+Lt/PA9B/Qw43ZicB8TkCJubzrSVcFoUpJ0hvnRzbY70WOzpuwWSexGtt
 Yjrotj7A0caG42eBy7j5uhVnZTI1iN/Dyd+SKspNtH9nJM0+SMTAFhOGxfZViTsQaq
 qb5DsyPkTWjNl7Xcn0eAR3zdgcTmu3scbuF5XkmDx5Mpl6MwfFhAmq/fKxWTyZQqI0
 pBngKijQukMBQ==
Date: Thu, 8 Dec 2022 15:06:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v7 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
Message-ID: <20221208210622.x656vbf7rum5hrl7@builder.lan>
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221201225705.46r2m35ketvzipox@builder.lan>
 <CAPDyKFofsqcoFbYt-9BcisbPdreLGqAAMWorqHi0_D1kwCdYhg@mail.gmail.com>
 <20221207165457.kwdwwiycbwjpogxl@builder.lan>
 <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpYgYkDdJ79xxkwr-Mqnj5CoBrV+ZZe6Xz4hGLNR4zUVw@mail.gmail.com>
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <sboyd@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, krzysztof.kozlowski@linaro.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 08, 2022 at 02:40:55PM +0100, Ulf Hansson wrote:
> On Wed, 7 Dec 2022 at 17:55, Bjorn Andersson <andersson@kernel.org> wrote:
> >
> > On Wed, Dec 07, 2022 at 05:00:51PM +0100, Ulf Hansson wrote:
> > > On Thu, 1 Dec 2022 at 23:57, Bjorn Andersson <andersson@kernel.org> wrote:
> > > >
> > > > On Wed, Oct 05, 2022 at 02:36:58PM +0530, Akhil P Oommen wrote:
> > > > >
> > > >
> > > > @Ulf, Akhil has a power-domain for a piece of hardware which may be
> > > > voted active by multiple different subsystems (co-processors/execution
> > > > contexts) in the system.
> > > >
> > > > As such, during the powering down sequence we don't wait for the
> > > > power-domain to turn off. But in the event of an error, the recovery
> > > > mechanism relies on waiting for the hardware to settle in a powered off
> > > > state.
> > > >
> > > > The proposal here is to use the reset framework to wait for this state
> > > > to be reached, before continuing with the recovery mechanism in the
> > > > client driver.
> > >
> > > I tried to review the series (see my other replies), but I am not sure
> > > I fully understand the consumer part.
> > >
> > > More exactly, when and who is going to pull the reset and at what point?
> > >
> > > >
> > > > Given our other discussions on quirky behavior, do you have any
> > > > input/suggestions on this?
> > > >
> > > > > Some clients like adreno gpu driver would like to ensure that its gdsc
> > > > > is collapsed at hardware during a gpu reset sequence. This is because it
> > > > > has a votable gdsc which could be ON due to a vote from another subsystem
> > > > > like tz, hyp etc or due to an internal hardware signal. To allow
> > > > > this, gpucc driver can expose an interface to the client driver using
> > > > > reset framework. Using this the client driver can trigger a polling within
> > > > > the gdsc driver.
> > > >
> > > > @Akhil, this description is fairly generic. As we've reached the state
> > > > where the hardware has settled and we return to the client, what
> > > > prevents it from being powered up again?
> > > >
> > > > Or is it simply a question of it hitting the powered-off state, not
> > > > necessarily staying there?
> > >
> > > Okay, so it's indeed the GPU driver that is going to assert/de-assert
> > > the reset at some point. Right?
> > >
> > > That seems like a reasonable approach to me, even if it's a bit
> > > unclear under what conditions that could happen.
> > >
> >
> > Generally the disable-path of the power-domain does not check that the
> > power-domain is actually turned off, because the status might indicate
> > that the hardware is voting for the power-domain to be on.
> 
> Is there a good reason why the HW needs to vote too, when the GPU
> driver is already in control?
> 
> Or perhaps that depends on the running use case?
> 
> >
> > As part of the recovery of the GPU after some fatal fault, the GPU
> > driver does something which will cause the hardware votes for the
> > power-domain to be let go, and then the driver does pm_runtime_put().
> 
> Okay. That "something", sounds like a device specific setting for the
> corresponding gdsc, right?
> 
> So somehow the GPU driver needs to manage that setting, right?
> 
> >
> > But in this case the GPU driver wants to ensure that the power-domain is
> > actually powered down, before it does pm_runtime_get() again. To ensure
> > that the hardware lost its state...
> 
> I see.
> 
> >
> > The proposal here is to use a reset to reach into the power-domain
> > provider and wait for the hardware to be turned off, before the GPU
> > driver attempts turning the power-domain on again.
> >
> >
> > In other words, there is no reset. This is a hack to make a normally
> > asynchronous pd.power_off() to be synchronous in this particular case.
> 
> Alright, assuming I understood your clarifications above correctly
> (thanks!), I think I have got a much better picture now.
> 
> Rather than abusing the reset interface, I think we should manage this
> through the genpd's power on/off notifiers (GENPD_NOTIFY_OFF). The GPU
> driver should register its corresponding device for them
> (dev_pm_genpd_add_notifier()).
> 
> The trick however, is to make the behaviour of the power-domain for
> the gdsc (the genpd->power_off() callback) conditional on whether the
> HW is configured to vote or not. If the HW can vote, it should not
> poll for the state - and vice versa when the HW can't vote.
> 

Per Akhil's description I misunderstood who the other voters are; but
either way it's not the same "HW configured" mechanism as the one we're
already discussing.


But if we based on similar means could control if the power_off() ops
should be blocking, waiting for the status indication to show that the
hardware is indeed powered down, I think this would meet the needs.

And GENPD_NOTIFY_OFF seems to provide the notification that it was
successful (i.e. happened within the timeout etc).

> Would this work?
> 

If we can control the behavior of the genpd, I think it would.

Thanks,
Bjorn
