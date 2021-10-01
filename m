Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCFD41F018
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 16:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355F56EE0D;
	Fri,  1 Oct 2021 14:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8FB6EE0D
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 14:55:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id i4so40307205lfv.4
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HF8DBMItzWWxaU367RAPSYKUXH5BnlS9jAZczRe4ePU=;
 b=aqXBI8UqLDWeTuVHGIBErjDsxio9yrdPfisehV9T9mJJk+ppF2b/RSy8QKzqoblHaJ
 hktrYJaeXtvLqskrzNnGhVJzexc6aEdc98fBbQvK69Gb12EAMd3ESJqlkrS5oD7OvNgG
 P97muReS34kLGu9NjHY+j5dwj2WyCWNHYTaed7xbvTrI2JzTGDs8qi8N0Qw7LkdjcWZX
 LXXkcViUSEK9vm+haTULi+cNSHJvU7ahpKWlcRMN7cX+R5RpA0/f3OUd7Bkg7+NCE+Fi
 1p1K49QgqzjgYEL1VL7M/h/E3btzs6Z5y5Av95Pp0dtJLF67v2p4aNsixGXoHBfrryKU
 UTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HF8DBMItzWWxaU367RAPSYKUXH5BnlS9jAZczRe4ePU=;
 b=G2t80zuLUgDWyCIerdvWakcDQajcURfmprYskonn2sUAF60lX4ZSiwjMhFMDK/QrBN
 bTfqRuiR/xKsAsPXjgEk8DrpoBPoEZgjC0BjpHaxNkttQcvtnMv16WRDFxGApGVe5gnF
 NzQ/mnPWp3BTenb6kq4wZTm4MonIe2TIOFFmoLri6QImdDZIGgZIxDgTeoMuiE15DAHZ
 H4SGZxlo669LcQBZSLb2Gu9nNzWmKErnrj1ewpIBcmhMmrlvJC1XM/hoi8Nu8FXfKYOV
 Dg36bcQ9vA4Q/rBv8G/fa7MABsZB/8ITMnAFE/UcntZ4ih4IKqSY0ifpDDAnao1/Vd+3
 MITg==
X-Gm-Message-State: AOAM532sRZHJQhByovEYyoekOzABxQbGle76wdUy2IRZ4MxmXSg1uxW3
 TkI5a480uXaJiXIVTHOKSt7OarwQetXIHJ8cOn3ztA==
X-Google-Smtp-Source: ABdhPJy2ug8Cm3POxLOQxU+SWQ8ZDieYeZsYoVZxo62Idbb6vc9hck4xUmbalsRsefa0nQdQjDMqTs5I8HVxPDG4gAE=
X-Received: by 2002:a05:6512:3095:: with SMTP id
 z21mr5935006lfd.167.1633100147608; 
 Fri, 01 Oct 2021 07:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-14-digetx@gmail.com>
 <CAPDyKFpzhv1UxjM0q5AWHVxTWC_cCO_Kg_6exO0o_=EoVvjo+w@mail.gmail.com>
 <aad7a508-7fb5-3418-f902-def80c365094@gmail.com>
In-Reply-To: <aad7a508-7fb5-3418-f902-def80c365094@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 1 Oct 2021 16:55:11 +0200
Message-ID: <CAPDyKFppSuP6FfaBaGn3o+8WvTT=vJ8XMzZ47WPQ1JKiUYyEpw@mail.gmail.com>
Subject: Re: [PATCH v13 13/35] drm/tegra: gr2d: Support generic power domain
 and runtime PM
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Peter Chen <peter.chen@kernel.org>, Lee Jones <lee.jones@linaro.org>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, 
 linux-mmc <linux-mmc@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 DTML <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 Mark Brown <broonie@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, 
 Stefan Agner <stefan@agner.ch>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 David Heidelberg <david@ixit.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, 1 Oct 2021 at 16:29, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.10.2021 16:39, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, 27 Sept 2021 at 00:42, Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >>
> >> Add runtime power management and support generic power domains.
> >>
> >> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> >> Tested-by: Paul Fertser <fercerpav@gmail.com> # PAZ00 T20
> >> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T12=
4
> >> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  drivers/gpu/drm/tegra/gr2d.c | 155 +++++++++++++++++++++++++++++++++-=
-
> >
> > [...]
> >
> >>  static int gr2d_remove(struct platform_device *pdev)
> >> @@ -259,15 +312,101 @@ static int gr2d_remove(struct platform_device *=
pdev)
> >>                 return err;
> >>         }
> >>
> >> +       pm_runtime_dont_use_autosuspend(&pdev->dev);
> >> +       pm_runtime_disable(&pdev->dev);
> >
> > There is no guarantee that the ->runtime_suspend() has been invoked
> > here, which means that clock may be left prepared/enabled beyond this
> > point.
> >
> > I suggest you call pm_runtime_force_suspend(), instead of
> > pm_runtime_disable(), to make sure that gets done.
>
> The pm_runtime_disable() performs the final synchronization, please see [=
1].
>
> [1]
> https://elixir.bootlin.com/linux/v5.15-rc3/source/drivers/base/power/runt=
ime.c#L1412

pm_runtime_disable() end up calling _pm_runtime_barrier(), which calls
cancel_work_sync() if dev->power.request_pending has been set.

If the work that was punted to the pm_wq in rpm_idle() has not been
started yet, we end up just canceling it. In other words, there are no
guarantees it runs to completion.

Moreover, use space may have bumped the usage count via sysfs for the
device (pm_runtime_forbid()) to keep the device runtime resumed.

>
> Calling pm_runtime_force_suspend() isn't correct because each 'enable'
> must have the corresponding 'disable'. Hence there is no problem here.

pm_runtime_force_suspend() calls pm_runtime_disable(), so I think that
should be fine. No?

Kind regards
Uffe
