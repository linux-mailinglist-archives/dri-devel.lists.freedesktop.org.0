Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC20405D2C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 21:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E836E8FD;
	Thu,  9 Sep 2021 19:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10EC6E8FD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 19:09:44 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso3859342ots.5
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pvy4pk+Makm+imdMTPDcWHT36nMt4nUygtDlWWiL5TM=;
 b=n4j082PHVTj+K/+ygkI6rVHT7RpqQFV1L9IypKw1Hgkg0j5V8rSY4jQWAikMF82GnS
 WydFpGdgsY4DLH3X1RXJRbtQO8cpXY6NxYnnahKZzaUDbN2GiLW5HzBYwliZvDcOaKKq
 d0F612ZIUshZz+oCOedD9GoRBbFW2i70vLNVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pvy4pk+Makm+imdMTPDcWHT36nMt4nUygtDlWWiL5TM=;
 b=2EmpHMHIW+1WUVOkusrQ5lQDJfcFOVjvSZ9UYl6HxXcb0mk+OeDKQSMwv9nXMTTJqa
 MLAKRsonV8hcofZEM7OemNUYXsTk8PrNkZj7FdKh02puPShR4EltMrZZqvYk+lsjKwmU
 +IlRHiJhr6P1of8G5m1pHE4sopFB3TZYMW9/EMEnPcAcwRwJnXSPYPzA42lsMAXWYvCL
 mhtvEflEQA9L7/OXVwxpHrXoJZGt6sHSnyt/Tzxu+7QwKQ7p9Brldkt4eUBs+Mrvp0aT
 PLR6I0VIKCxgkF9cVKaaZq+lM9r5SJzrX+WXKGDGwpq5KoSZhLX6IbOkwFDixLRDOepL
 3H+A==
X-Gm-Message-State: AOAM531NccvzgRvuNa3xyQsXXzsc9aAEfjf/A58OPSSpRmPNcATSIfPO
 BVX7lTxwr5iAjl6/9SzV1rMygtStY7T+BCfrPphZKg==
X-Google-Smtp-Source: ABdhPJyl3IUp4NWBySce7bi/NFBXSpzWulZc5Yj07ND7nxfwn7lLUhEZWiuY322F68qG8mZvw+YoLnz30cuoE2+z9h8=
X-Received: by 2002:a05:6830:719:: with SMTP id
 y25mr1204445ots.77.1631214583935; 
 Thu, 09 Sep 2021 12:09:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Sep 2021 12:09:43 -0700
MIME-Version: 1.0
In-Reply-To: <CA+cxXh=FJtvAzb0UeMXYs3PKxcdoR7hG23BJQ5Xtj_ywjLUQ_w@mail.gmail.com>
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <CAE-0n52ia_Em6GYU-ketmzi4OQxcdux3uLjMGhzVTUJbC0Yz-Q@mail.gmail.com>
 <CA+cxXh=FJtvAzb0UeMXYs3PKxcdoR7hG23BJQ5Xtj_ywjLUQ_w@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 9 Sep 2021 12:09:43 -0700
Message-ID: <CAE-0n51GPe4aWqmbm4htArS716dKhYPPV2KbKtk-d6MsUe8UpA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>, 
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

Quoting Philip Chen (2021-09-09 11:29:19)
> Hi,
>
> On Wed, Sep 8, 2021 at 2:54 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-09-08 11:18:05)
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > index 685e9c38b2db..a16725dbf912 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -64,12 +65,29 @@ struct ps8640 {
> > >         struct drm_bridge *panel_bridge;
> > >         struct mipi_dsi_device *dsi;
> > >         struct i2c_client *page[MAX_DEVS];
> > > +       struct regmap   *regmap[MAX_DEVS];
> > >         struct regulator_bulk_data supplies[2];
> > >         struct gpio_desc *gpio_reset;
> > >         struct gpio_desc *gpio_powerdown;
> > >         bool powered;
> > >  };
> > >
> > > +static const struct regmap_range ps8640_volatile_ranges[] = {
> > > +       { .range_min = 0, .range_max = 0xff },
> >
> > Is the plan to fill this out later or is 0xff the max register? If it's
> > the latter then I think adding the max register to regmap_config is
> > simpler.
> It's the former.
> The real accessible register range is different per page, E.g.:
> - For page0, the register range is 0x00 - 0xbf.
> - For page1, the register range is 0x00 - 0xff.
> - For page2, the register range is 0x80 - 0xff.

Oh does this have register pages? regmap has support for pages where you
write some indirection register and then access the same i2c address for
the next page. This looks different though and has a different i2c
address for each page?

> Even if we don't specify the accurate per-page register range later,
> the default register range here (0x00 - 0xff) can cover the available
> registers in each page.

That could be done with max address in the config though, right?
volatile ranges is to indicate which registers are volatile and can't be
cached. I sort of doubt the entire rage is volatile.
