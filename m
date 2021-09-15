Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B4840BDE2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 04:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E9C6E8AB;
	Wed, 15 Sep 2021 02:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0421D6E8AB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 02:50:11 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso1541041otv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 19:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2yO3vh0zz6n3DfjdGSbOZuIL2GY1SRnRrA0ouZp0EVw=;
 b=YHpuT4aaP/7pRelDYIKhPBxJLKw04TUTFfV2/3iPUvpPdodvC1g9J3/cfEJZdBPmT1
 fyM2vhjY+AlI8+pHdtUlS2RygDvJTLF7toIIZzlJEBYRxslNtM0e4gTmlG+cM95Dbcis
 V1dhWIYSVi7xLa3EBGUwAVBdsTPB/8pLE5Rds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2yO3vh0zz6n3DfjdGSbOZuIL2GY1SRnRrA0ouZp0EVw=;
 b=yD1ATfES/YRq6xu55dsRyuXHrPYWJ6rN6lJ484Ecyfwd8hqU2yMxtCr1z+MfuQ6pqm
 PVopo9cfxEZsiFQFzSWsXPWhGfRl3wllFADstSzFfCXGCQ6e0jo9eYHFk861dJ8QDCEd
 GvdMfIO+lrzg6NkrfMzZ4kosZHJE0p/vY5A2lAkTUBR+1bXZwsPnaLDMExRe5VFl2ELF
 8aIWKnY5sp34xdIwfVEcs5XfBupPIx0MuHyQjE2nC//62ioYq9HH/O6HXe/TMU2mxgMX
 BKzSkiTsdV7Yfga/Ed6nlVJxHYqBX1YGp1INYGg5vILQjPhDEyyRMldBK4A/L1YdvYpq
 B3yw==
X-Gm-Message-State: AOAM530YCMyQpt6ed6TewHOsxqSbxdIPXZUYXLTdyzGesG49AXd+yhHn
 sK9wszWf25h985bqZowAkr62N6X0a+vg3TEts9bhPQ==
X-Google-Smtp-Source: ABdhPJwPG+aiHo03dZ21mhzkBLXoLA7VzJC1LzvEFtngRhUFhESCwwfIZw3hC5QxlZjwLBYC6Z0Pi+ISzWf4gr8fQZg=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr17512442ote.126.1631674211304; 
 Tue, 14 Sep 2021 19:50:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 14 Sep 2021 19:50:10 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WKQg-fU1jaSOh3RTa5HpSAiTzt2-Sycwt59uv1WemYxg@mail.gmail.com>
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.2.Ib06997ddd73e2ac29e185f039d85cfa8e760d641@changeid>
 <CAE-0n53BXh3_6jEW5oTbPA-V=MSaN=RvqaU8uoY9GNOm-0Pv_g@mail.gmail.com>
 <CAD=FV=WKQg-fU1jaSOh3RTa5HpSAiTzt2-Sycwt59uv1WemYxg@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 14 Sep 2021 19:50:10 -0700
Message-ID: <CAE-0n539tJLLWHdL65ZU_1qOzA-RsEqGqVi-19VLHz_W5dT6VA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: parade-ps8640: Use regmap APIs
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
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

Quoting Doug Anderson (2021-09-14 19:17:03)
> Hi,
>
> On Tue, Sep 14, 2021 at 5:29 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-09-14 16:28:44)
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > index e340af381e05..8d3e7a147170 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -368,6 +396,12 @@ static int ps8640_probe(struct i2c_client *client)
> > >
> > >         ps_bridge->page[PAGE0_DP_CNTL] = client;
> > >
> > > +       ps_bridge->regmap[PAGE0_DP_CNTL] = devm_regmap_init_i2c(client, ps8640_regmap_config);
> > > +       if (IS_ERR(ps_bridge->regmap[PAGE0_DP_CNTL])) {
> > > +               return dev_err_probe(dev, PTR_ERR(ps_bridge->regmap[PAGE0_DP_CNTL]),
> > > +                                    "Error initting page 0 regmap\n");
> >
> > This one also doesn't return -EPROBE_DEFER? The dev_err_probe() should
> > really only be used on "get" style APIs that can defer.
>
> Any reason why you say that dev_err_probe() should only be used on
> "get" style APIs that can defer? Even if an API can't return
> -EPROBE_DEFER, using dev_err_probe() still (IMO) makes the code
> cleaner and should be used for any error cases like this during probe.
> Why?
>
> * It shows the error code in a standard way for you.
> * It returns the error code you passed it so you can make your error
> return "one line" instead of 2.

I'd rather see any sort of error message in getter APIs be pushed into
the callee so that we reduce the text size of the kernel by having one
message instead of hundreds/thousands about "failure to get something".
As far as I can tell this API is designed to skip printing anything when
EPROBE_DEFER is returned, and only print something when it isn't that
particular error code. The other benefit of this API is it sets the
deferred reason in debugfs which is nice to know why some device failed
to probe. Of course now with fw_devlink that almost never triggers so
the feature is becoming useless.

>
> Is there some bad thing about dev_err_probe() that makes it
> problematic to use? If not then the above advantages should be a net
> win, right?
>

I view it as an anti-pattern. We should strive for driver probe to be
fairly simple so that it's basically getting resources and registering
with frameworks. The error messages in probe may help when you're trying
to get the driver to work and the resource APIs don't make any sense but
after that it's basically debug messages hiding as error messages.
They're never supposed to happen in practice, because the code is
tested, right?
