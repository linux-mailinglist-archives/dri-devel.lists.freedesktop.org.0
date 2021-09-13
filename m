Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D4409F42
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 23:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF476E25B;
	Mon, 13 Sep 2021 21:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B94F6E25B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 21:36:53 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id y16so23475910ybm.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 14:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LFUspCFtV5DoOy2PmnKy+pTvRZ6jWPWQRYWdYuJIS7Q=;
 b=Cf6c4g5FVXo1iZP44CAwyVhWJwkqzK0uB6iKuy6uK2l1hbO3JzUsfRcvHLNTgzlVBB
 AG0HpLB6v0takN6e0dSpWLGzRTBZqEYmPW4xV4cC8TBzoTvkFy3Fqcov1k8Pe9MOOO/b
 o5OhtU2Za5uLyAwFg80ghBxSd14kwc6Q5nc80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LFUspCFtV5DoOy2PmnKy+pTvRZ6jWPWQRYWdYuJIS7Q=;
 b=Rs5KrFfJBJxjxMrP0eXK8tFzi5HzxSpQIk9QJtkT038z0b8iEnICEHUTaV8gXY9TXU
 FFeILPZobWbQWiT8ITSxkK/8TjgFUT8pQPx7trUXVIfRM5Eb1RnGVfzwCno4SKJjHutC
 EiRNVy780xBP0hNjTa3fk7N08LvkW24qYffZvXxQH1b0g7pK098yWa05RccDH8jvkkDh
 iRN50YA3nG3vQV9//Ww/PC+Yp4IkB5S5XXDAcTc3z9PDZ9lGjjqxuDLo+MbakzMgREr+
 QYSqccLIGd6AuR6p5Cv5GO537OfcyxgZKuEAaA+ERiDn7DefF+zBNXSamZvoNgR0iqO/
 laOA==
X-Gm-Message-State: AOAM531JJFNA/pOGOPL2zjzEjdw967FFxMQhRW9WbpXhdqNIPLGSNyZe
 PnAGYVa+jqn7mooWpf8c1nnni6B/LMeHqKmMHPxTaQ==
X-Google-Smtp-Source: ABdhPJzgvBImaSsmEWPjo6a41me/gWhYqfofAzZ+KFs9IC0CbzQFIWJfavjAxKM5qjfC2HrC9M7+9BTB6d/lDEyABOo=
X-Received: by 2002:a25:5982:: with SMTP id n124mr17377159ybb.57.1631569012770; 
 Mon, 13 Sep 2021 14:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <CAE-0n52ia_Em6GYU-ketmzi4OQxcdux3uLjMGhzVTUJbC0Yz-Q@mail.gmail.com>
 <CA+cxXh=FJtvAzb0UeMXYs3PKxcdoR7hG23BJQ5Xtj_ywjLUQ_w@mail.gmail.com>
 <CAE-0n51GPe4aWqmbm4htArS716dKhYPPV2KbKtk-d6MsUe8UpA@mail.gmail.com>
 <CAD=FV=Uzy5vagh2G4pbqpSgVVjaGoswiH=udBH5RVZ96cNu=eQ@mail.gmail.com>
 <CAE-0n51i32v-GM2H81mT=aKCo0cp5zD8tFu4AHwzs6Zb9kHRqw@mail.gmail.com>
In-Reply-To: <CAE-0n51i32v-GM2H81mT=aKCo0cp5zD8tFu4AHwzs6Zb9kHRqw@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Mon, 13 Sep 2021 14:36:42 -0700
Message-ID: <CA+cxXh=8d=58nJUPstWvO5oEK1fw45s+d5UmKHyAErcSTB2o3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: Stephen Boyd <swboyd@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
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

On Thu, Sep 9, 2021 at 2:27 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2021-09-09 14:14:29)
> > On Thu, Sep 9, 2021 at 12:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > >
> > > Oh does this have register pages? regmap has support for pages where you
> > > write some indirection register and then access the same i2c address for
> > > the next page. This looks different though and has a different i2c
> > > address for each page?
> >
> > I haven't looked in tons of detail, but I think the right solution
> > here is a separate regmap config per page.
>
> Yes. And then a different .max_register value for each config struct. A
> different .name might be useful to indicate which page it is too.

I see.
I posted v2 with the fix for this.
PTAL.
