Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D6B21E15D
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 22:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1D76E824;
	Mon, 13 Jul 2020 20:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49EB6E823;
 Mon, 13 Jul 2020 20:25:44 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2EA892075D;
 Mon, 13 Jul 2020 20:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594671944;
 bh=+jPAZ3C7SWxUuRUQs+Sr6Y2DGrQqPWecmS58fVnwjRg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DOQurS/Ibt581N9zjmP/Pqa8hl78moJnuITh6tQCapRRRq3lmxAkJao/TRTea4zip
 M3IgIl+ogsfoJJPTcHZUxX93MDkAakZHpcmyPOpXRWk2Tc9UVg/06l2MQwzMxTTpA7
 cZj7SPprMA2NR6Y6IEGnVzak4K3X+xXevHfSU7AU=
Received: by mail-oi1-f180.google.com with SMTP id k6so12057733oij.11;
 Mon, 13 Jul 2020 13:25:44 -0700 (PDT)
X-Gm-Message-State: AOAM532oMw+tYuf6ifUWamiAskxSF+Po5ZtTl9LXKyR7pz2VQhq+H4zs
 bt9FhO4ea2Qgi9cFpP/WwyfN53dRMzY5A/ngYQ==
X-Google-Smtp-Source: ABdhPJz4yVpioDr20qd9s5LSTk+AV4nU2x5TPIq7IEfqTgA5EioBNPLPC36euXlnKruM3zNGoxsQBu0ZdZFRaXmekfM=
X-Received: by 2002:aca:4844:: with SMTP id v65mr1078680oia.152.1594671943516; 
 Mon, 13 Jul 2020 13:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
 <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
In-Reply-To: <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 13 Jul 2020 14:25:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
Message-ID: <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm/msm: Avoid possible infinite probe deferral and
 speed booting
To: Doug Anderson <dianders@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 9:08 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > >
> > > I found that if I ever had a little mistake in my kernel config,
> > > or device tree, or graphics driver that my system would sit in a loop
> > > at bootup trying again and again and again.  An example log was:
> >
> > Why do we care about optimizing the error case?
>
> It actually results in a _fully_ infinite loop.  That is: if anything
> small causes a component of DRM to fail to probe then the whole system
> doesn't boot because it just loops trying to probe over and over
> again.  The messages I put in the commit message are printed over and
> over and over again.

Sounds like a bug as that's not what should happen.

If you defer during boot (initcalls), then you'll be on the deferred
list until late_initcall and everything is retried. After
late_initcall, only devices getting added should trigger probing. But
maybe the adding and then removing a device is causing a re-trigger.

> > >   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
> > >   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
> > >   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
> > >   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
> > >   ...
> > >
> > > I finally tracked it down where this was happening:
> > >   - msm_pdev_probe() is called.
> > >   - msm_pdev_probe() registers drivers.  Registering drivers kicks
> > >     off processing of probe deferrals.
> > >   - component_master_add_with_match() could return -EPROBE_DEFER.
> > >     making msm_pdev_probe() return -EPROBE_DEFER.
> > >   - When msm_pdev_probe() returned the processing of probe deferrals
> > >     happens.
> > >   - Loop back to the start.
> > >
> > > It looks like we can fix this by marking "mdss" as a "simple-bus".
> > > I have no idea if people consider this the right thing to do or a
> > > hack.  Hopefully it's the right thing to do.  :-)
> >
> > It's a simple test. Do the child devices have any dependency on the
> > parent to probe and/or function? If so, not a simple-bus.
>
> Great!  You can see in the earlier patch in the series that the very
> first thing that happens when the parent device probes is that it
> calls devm_of_platform_populate().  That means no dependencies, right?

It should. But then I reviewed the MDSS binding today and it looks
like the MDSS is the interrupt parent for at least some child devices?

>  So that means it's fine/correct to add "simple-bus" here?
>
>
> > > Once I do this I notice that my boot gets marginally faster (you
> > > don't need to probe the sub devices over and over) and also if I
> >
> > Can you quantify that?
>
> I'd say < 100 us.  I can try to quantify more if needed, but it wasn't
> the point of this patch.
>
>
> > Have you run with devlinks enabled. You need a command line option to
> > enable. That too should reduce deferred probes.
>
> Ah, good idea!  I will try it.  However, even with devlinks, if there
> is any chance of deferred probes then we need a fix like this.  The
> point of the patch isn't about speeding things up but about avoiding
> an infinite loop at bootup due to a small bug.

I think a deferred probe would only happen if there's a dependency we
don't track (but we're tracking about everything that's common). But
if there's some error, I'm not sure what would happen. Seems like a
good test case. :)

> > > have a problem it doesn't loop forever (on my system it still
> > > gets upset about some stuck clocks in that case, but at least I
> > > can boot up).
> >
> > Deferred probe only runs when a device is added, so it's not like it
> > is continually running.
>
> If you don't mind looking at the code patch, see:
>
> https://lore.kernel.org/r/20200710160131.4.I358ea82de218ea5f4406572ade23f5e121297555@changeid/
>
> Specifically you can see that each time we try to probe we were
> calling of_platform_populate().  That appeared to be enough to trigger
> things.

Like I said, sounds like a bug. Even if 'simple-bus' is the
appropriate thing to do here, it should be fixed or at least
understood.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
