Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5012B387960
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 14:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B826E88D;
	Tue, 18 May 2021 12:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04726E88D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 12:58:43 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 b13-20020a17090a8c8db029015cd97baea9so1712570pjo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 05:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mv2uwTbL30jlJAM/eaiNlLKn6+rdPCA/0KtvmGZQeAA=;
 b=DNo0vG/Los+2xPXou0DmP/K7ITFwoVlcYcfGs3JPRFjshrw7yl0Kh/6NURDRr0GZM1
 BrSt4M6vRuTzXy5MC0slfCjxj2bzDBFYZ3bDpnayjvlsrNygJ02FOmPOdIAHb+HjIrd1
 NtLz7QZ2n7B8Ql62a/NR8mCNzr0bPF82QqbjZu2kNgwD7JV5N+Q9hvRwqB1/0Dm4W/Ox
 fAHMCtJkwQ1it3eGHd5KEI38XwQA+2uUh9WMb+X+UoFnniHOa0M84azWvZu5UBuKu/HU
 ZoCjFC77XPvi4D+yLfB67Q4t/OzhgSz6+xnQyCO01oreHsLZAsWNtnBdrN66kkmzWkl8
 Uwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mv2uwTbL30jlJAM/eaiNlLKn6+rdPCA/0KtvmGZQeAA=;
 b=XmVJH/jItyT2DrKk8siQe2JaqAzI1bX+ql6yIEWXm+oQvvRNzIkRl6KV7Ga9yngpAy
 UicqynRJSXU+cy0wC2WPdFVny+4ov/LiZ05h0XugldgEgs7PKr1HzVMnhaEk0SNUKiua
 wKdRYem8q08K46egeKVxEAuE5/ubex62aPB+0uvxTpFbQy2s9LEoO5Sr7WxGUFm2I94E
 ooavCT372qp19NaqMkqpza7AWKngh8SBjcDl2k8cMTqmrzkYKXKtSL0YH+WKJJ/U0SFZ
 h7c7J0s3QVac8WCLLFGUkIuQXKj6BmotFZKBj/zDBqCAue6FjOpoqvhafEO5FI7RmkIB
 UF3w==
X-Gm-Message-State: AOAM533992pBiypx5j1RLRjsRHhv06e7jWkgWwutMwb+OMcmsnLxxW4f
 TD9kBuL5VMFW1BprONcpbGCGLUOI833BbNGv2crMKg==
X-Google-Smtp-Source: ABdhPJwvPJXAq1cWqigGtb0woH3Q8hJnCu15moqg/VmcFxxsKkoR0ESvlmq4tiTL1iWXCRqFKiC/UCsODLkpBrmayDQ=
X-Received: by 2002:a17:90a:e391:: with SMTP id
 b17mr606869pjz.75.1621342723427; 
 Tue, 18 May 2021 05:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210517081601.1563193-1-yukuai3@huawei.com>
 <CAG3jFyvjD+Gf5C+sWA8Qi9Hp-tJHeCjqbWX5Fds3m41nCLreyA@mail.gmail.com>
 <YKNv5fsVaTrslJZw@hovoldconsulting.com>
In-Reply-To: <YKNv5fsVaTrslJZw@hovoldconsulting.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 18 May 2021 14:58:32 +0200
Message-ID: <CAG3jFyu9x0NERFQ78GAX_6TUimB_PmBXkcVJZ9i+HXbK=N0dmQ@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: cdns-mhdp8546: Fix PM reference leak in
 cdns_mhdp_probe()
To: Johan Hovold <johan@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 yi.zhang@huawei.com, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Yu Kuai <yukuai3@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 May 2021 at 09:42, Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, May 17, 2021 at 11:27:38AM +0200, Robert Foss wrote:
> > Hey Yu,
> >
> > On Mon, 17 May 2021 at 10:08, Yu Kuai <yukuai3@huawei.com> wrote:
> > >
> > > pm_runtime_get_sync will increment pm usage counter even it failed.
> > > Forgetting to putting operation will result in reference leak here.
> > > Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> > > counter balanced.
> > >
> > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > index 0cd8f40fb690..305489d48c16 100644
> > > --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> > > @@ -2478,7 +2478,7 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
> > >         clk_prepare_enable(clk);
> > >
> > >         pm_runtime_enable(dev);
> > > -       ret = pm_runtime_get_sync(dev);
> > > +       ret = pm_runtime_resume_and_get(dev);
> > >         if (ret < 0) {
> > >                 dev_err(dev, "pm_runtime_get_sync failed\n");

This error message is a bit confusing now, could you update it.

> > >                 pm_runtime_disable(dev);
> >
> > The code is correct as it is. If pm_runtime_get_sync() fails and
> > increments[1] the pm.usage_count variable, that isn't a problem since
> > pm_runtime_disable() disables pm, and resets pm.usage_count variable
> > to zero[2].
>
> No it doesn't; pm_runtime_disable() does not reset the counter and you
> still need to decrement the usage count when pm_runtime_get_sync()
> fails.

Thanks for chiming in Johan, you're absolutely right and I must have
misread something.

With the above fix, feel free to add my r-b.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
