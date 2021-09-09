Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3F4405EBE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 23:27:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB666E932;
	Thu,  9 Sep 2021 21:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129626E932
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 21:27:27 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r26so4462546oij.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Sep 2021 14:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Oh0PrsGCeSfOgOX5+3rr99J+ELkTBImIMOvzGUX/BXQ=;
 b=jZntIy9m9vUA0OyRmYw3aYdCO31jMyIjnlPtYAMuACobukHKL5T8CCZDK0IijqATca
 qeyfK2RTUA+Uif5Hv2ehDYpvpi6L4z9C7KsQGd+IZjyfHM+xRdZIOPlLCxBdufoR+Kfp
 NJZ2tukQmX5NBpxsgVhbh5ixup5Y+MjZHc3gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Oh0PrsGCeSfOgOX5+3rr99J+ELkTBImIMOvzGUX/BXQ=;
 b=Ssak58qyYIngxYpcEavSFyZcL86ErVWB54hQPCWaExkZ0wf/szJB4DD+djSR9dNmqV
 HCxJ422jT7Vlo3HqLG4JvO9IaEx2v1P3EPkXvWnUAQ4wY1PwpUMce1ea91pz06fZY8sB
 4d762NiksU6wgXHC5rWXP3KKAqHX/na1QKd17UR3srM/30kIR/C7IQdYzE/O7cKtEq3q
 MVkc8JQiUl6Sk3BybLtKvzdNhraS6gt4SU0LF5fw2K2Lq6mUuvfeNj7AGXyPGTf6OMh7
 f80XpVcOWpiYIwVhwNe2SD0ffMgw315VlydOh1isA+zPlzBesLP6MgaOLx9Lqg1bY/n3
 3ypA==
X-Gm-Message-State: AOAM533ebytCN8v50M4djeAvkY0PQmRALq7o2/UCmnUQuXQO0UR+WWiS
 dyNaT0YgTLwnoJJklTc3P62GKVkqW7/yi4bb8Ks4MA==
X-Google-Smtp-Source: ABdhPJx9WwQShlI9W7TevmsFcHWi0PaDY64KM9xWOqqmnXD6wOlguN6oJuT3F7znRXfBhzDTAY4IJOUXpSgetybD3ok=
X-Received: by 2002:a54:4419:: with SMTP id k25mr1673988oiw.32.1631222846293; 
 Thu, 09 Sep 2021 14:27:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 9 Sep 2021 17:27:25 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Uzy5vagh2G4pbqpSgVVjaGoswiH=udBH5RVZ96cNu=eQ@mail.gmail.com>
References: <20210908111500.1.I9f6dac462da830fa0a8ccccbe977ca918bf14e4a@changeid>
 <CAE-0n52ia_Em6GYU-ketmzi4OQxcdux3uLjMGhzVTUJbC0Yz-Q@mail.gmail.com>
 <CA+cxXh=FJtvAzb0UeMXYs3PKxcdoR7hG23BJQ5Xtj_ywjLUQ_w@mail.gmail.com>
 <CAE-0n51GPe4aWqmbm4htArS716dKhYPPV2KbKtk-d6MsUe8UpA@mail.gmail.com>
 <CAD=FV=Uzy5vagh2G4pbqpSgVVjaGoswiH=udBH5RVZ96cNu=eQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 9 Sep 2021 17:27:25 -0400
Message-ID: <CAE-0n51i32v-GM2H81mT=aKCo0cp5zD8tFu4AHwzs6Zb9kHRqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: Doug Anderson <dianders@chromium.org>
Cc: Philip Chen <philipchen@chromium.org>, LKML <linux-kernel@vger.kernel.org>,
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

Quoting Doug Anderson (2021-09-09 14:14:29)
> On Thu, Sep 9, 2021 at 12:09 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> >
> > Oh does this have register pages? regmap has support for pages where you
> > write some indirection register and then access the same i2c address for
> > the next page. This looks different though and has a different i2c
> > address for each page?
>
> I haven't looked in tons of detail, but I think the right solution
> here is a separate regmap config per page.

Yes. And then a different .max_register value for each config struct. A
different .name might be useful to indicate which page it is too.
