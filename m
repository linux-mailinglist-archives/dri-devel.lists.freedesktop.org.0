Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F29E425FFF
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 00:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830BD6E03F;
	Thu,  7 Oct 2021 22:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065E66E03E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 22:34:55 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 w9-20020a4adec9000000b002b696945457so1860952oou.10
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Oct 2021 15:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=xvLkmQK9Bybd4TfsJEOa13aU7h3LNEaMsTOh+C5eBTg=;
 b=RrC+LQ4p5RknyhummIEgUPYOa5Fz91+AtAnA3rEUlbkmAuwRbsdE6lfznJHa0LlbJD
 gHeKxZrbTLMQqWWXvsiNBMMeaRwgA2mRA/n0nVIfo+Vcylr2NHZLoSz93AavNudYmQay
 JhoZXgGqu43xpmqTbQ4Z52i8Am0AOPbAQSlwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=xvLkmQK9Bybd4TfsJEOa13aU7h3LNEaMsTOh+C5eBTg=;
 b=JmdXLoc5ZmzxH2+gvYSrksgigUnDVOP4lJk6B26pJFz4BbwmBS9Q9hQJ1aAuyCmoxK
 FngzLQpFmFToLCDri7SIxHG4zXkrUBhIbblP60hUsKaEikx91NDmsFqjgePcPlhXFhjn
 QRyqFgQC9Lgamb4QHDWwA3Z3lo0zTh5W53RPDMKUkOZuvW1JkpfLedleSANI5OIe3ZnP
 Twlo6lAig1LDObw9TnP1aAolBLcyJtVtO0IUs8TZ/T28w+P2ZalOmvOhy0rSKQu/thVq
 NBeIOII6lhlMOOdgHnk1+T4FPSnmOj8Uu98SNvE51hO3pTvE72df3qzAnI06n312JGHH
 Wdcg==
X-Gm-Message-State: AOAM5307WYQcJNLHJ6bJBM/EolkQNaflfNrFtWT5l8bkj+rq5gTZ8FIr
 Frrjb4w2Zha8WC8pwMpKWGYPuX9hyE+iZxwvLSA7k0orBeY=
X-Google-Smtp-Source: ABdhPJxw5GB+L1Z2oveCShSFbqavZMVrh82r2Kmb+640p8VfkAcz3rr6nqKCzxe0QKBNen93cGn02/Y5v97GrzlGfSM=
X-Received: by 2002:a4a:e2d3:: with SMTP id l19mr5401226oot.1.1633646094225;
 Thu, 07 Oct 2021 15:34:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 18:34:53 -0400
MIME-Version: 1.0
In-Reply-To: <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org> <YV0FlTyMEzlyNsN9@ripper>
 <3dbe0fe48da88af9dee396a85b940e76@codeaurora.org> <YV3dddt/GOidTmlN@ripper>
 <9dc50145fb3e9b189fd38857b20f326a@codeaurora.org> <YV9TQEKPh4SXYFF/@ripper>
 <0c72f3fd8c49cdada09bb6ee366b53a6@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 18:34:53 -0400
Message-ID: <CAE-0n51bvKXmHj0X_cvR2fdk4-mh4SRsrEE33H0e1Q+p=7iPxA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
To: Bjorn Andersson <bjorn.andersson@linaro.org>, khsieh@codeaurora.org
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sankeerth Billakanti <sbillaka@codeaurora.org>
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

Quoting khsieh@codeaurora.org (2021-10-07 13:28:12)
> On 2021-10-07 13:06, Bjorn Andersson wrote:
> > On Thu 07 Oct 12:51 PDT 2021, khsieh@codeaurora.org wrote:
> >
> >> On 2021-10-06 10:31, Bjorn Andersson wrote:
> >> > On Wed 06 Oct 08:37 PDT 2021, khsieh@codeaurora.org wrote:
> >> >
> >> > > On 2021-10-05 19:10, Bjorn Andersson wrote:
> >> > > > On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:
> >> > > >
> >> > > > > On 2021-10-05 15:36, Stephen Boyd wrote:
> >> > > > > > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> >> > > > > > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> >> > > > > > >
> >> > > > > > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> >> > > > > > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> >> > > > > > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> >> > > > > > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> >> > > > > > > > > eDP this reduction improves the user experience dramatically - i.e.
> >> > > > > > > > > removes 9.9s of bland screen time at boot.
> >> > > > > > > > >
> >> > > > > > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> >> > > > > > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> > > > > > > > > ---
> >> > > > > > > >
> >> > > > > > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> >> > > > > > > > re-read the code a couple times to understand that it's waiting 100ms
> >> > > > > > > > times the 'delay' number. Whaaaaat?
> >> > > > > > > >
> >> > > > > > >
> >> > > > > > > I assume you're happy with the current 10s delay on the current
> >> > > > > > > devices, so I don't think we should push for this to be backported.
> >> > > > > > > I have no need for it to be backported on my side at least.
> >> > > > > > >
> >> > > > > >
> >> > > > > > Sure. Fixes tag != backported to stable trees but it is close.
> >> > > > > >
> >> > > > > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> >> > > > > > >
> >> > > > >   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> >> > > > >
> >> > > > > This patch will prevent usb3 from working due to dp driver
> >> > > > > initialize phy
> >> > > > > earlier than usb3 which cause timeout error at power up usb3 phy
> >> > > > > when both
> >> > > > > edp and dp are enabled.
> >> > > >
> >> > > > Can you please help me understand what you mean here, I use this on my
> >> > > > sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
> >> > > > work? Or am I just lucky in some race condition?
> >> > > >
> >> > > > Thanks,
> >> > > > Bjorn
> >> > > >
> >> > > The problem is seen at sc7280.
> >> > > Apple dongle have both  hdmi and usb port.
> >> > > plug Apple dongle into type-c, then plug DP into apple's hdmi port
> >> > > and usb
> >> > > mouse into apple's usb port.
> >> > > If edp enabled at this time, then usb mouse will not work due to
> >> > > timeout at
> >> > > phy power up.
> >> > >
> >> >
> >> > Okay, so you're saying that if the DP driver invokes phy_power_on()
> >> > before the USB driver does, USB initialization fails (or at least USB
> >> > doesn't work)?
> >>
> >> if dp driver call qcom_qmp_phy_init() before usb3 call
> >> qcom_qmp_phy_init(),
> >> usb3 driver will timeout at readl_poll_timeout(status, val, (val &
> >> mask) ==
> >> ready, 10, PHY_INIT_COMPLETE_TIMEOUT) of qcom_qmp_phy_power_on().
> >
> > Thanks, I will try to reproduce this on my side. So the 10 seconds here
> > is strictly to give good enough time for the dwc3 driver to probe...
> >
> > Any idea why you're saying that this is specific to sc7280, what
> > changed
> > from sc7180?
>
> I did not have sc7180 with edp before so that i am not sure it will
> happen on sc7180 or not.
> The usb3 does not work when both edp and dp enabled I just seen at
> sc7280.
> Current at sc7280 EC is not boot up correctly when system power up.
> I have to manual reboot EC from linux kernel shell before DP/usb3 can
> work.
> I am not sure this contribute to this problem or not.
>

Can you make the usb driver into a module and only load that module
later in boot after the DP driver calls qcom_qmp_phy_init()? That would
be an easy way to move usb probe after DP probe and expose this problem.
