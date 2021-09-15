Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F9A40CEB3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 23:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270EA6EA62;
	Wed, 15 Sep 2021 21:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91F26EA64
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 21:18:38 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id y13so8598218ybi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o3veXBIZnvUKtnHxWTaozM/HSbOfDNjRTmGu3zb3EfU=;
 b=T2gxgE71iotL62qHgp9HhDUB18cqI7roSzz75Zt/y2U4xEJ+gNBwoTRJK6fDzLIAIX
 RMSQFGJ+pxrFbdf9ZY3FitomLZY9LNLGE8yn2O8bcOc0yghhvE2HbrS/zOxY95Gj44+L
 JtvaBq94TiQEVvSbsqv7I3jo4DXW9p2+ZwYUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o3veXBIZnvUKtnHxWTaozM/HSbOfDNjRTmGu3zb3EfU=;
 b=gZz0ToyyMFln25LeyOQROoC92BOqM5Z0kNwtkwnseoGdFdwonSuoWjNbwLAlhOn6YT
 DYO2Qdph1Hk9XxRP/vaIw52B+jTfT5K4W584/YZe3CnSLEoHytY5FcpgpgjPbWh9IVXD
 9YNUM0QQSDdS5GgUhFRiecNscoc3PcUH/a9Ksq3ZaeLb8zAooJ9kvtvLTwigjYrKkr/F
 GXTSAo1J02fRJKH60+y/TdK66oTjkI4pQCfFFI91aQp0cissOQ3BYcPVKwI0zCvt/l2N
 3jXm7hOFj4sJxCrTBFq3OPy/oSWvYszCvvS8AtOtcyg9ILy+zD8cWTfcTDJDgz8iWJ67
 zZqg==
X-Gm-Message-State: AOAM533KgWl6O6P6bIICBtmLuvbeD3LNajOKPAgP1d1DJv1QH/0z5/mX
 xwzp7Vduo7lO38YKF5rbgbC1HVfweUROaA3VliJc5w==
X-Google-Smtp-Source: ABdhPJwafmtANzZaofILn25DpwsrttNeT0o2NtqIHVBfMTOg9T5WN29WNXyWHOoiaGfXzSK3F5p308f7zEAXADaSQCo=
X-Received: by 2002:a25:b94:: with SMTP id 142mr2619354ybl.508.1631740718136; 
 Wed, 15 Sep 2021 14:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
 <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
 <CA+cxXhn-gLt37oyEq3wSh3qf=UkY=H6fY3ahC=gyhKhGwu_dXw@mail.gmail.com>
 <CAOMZO5B_J29npC+yu2freuwNLjKAmwas7gVaB6qRabAmVWy2KQ@mail.gmail.com>
In-Reply-To: <CAOMZO5B_J29npC+yu2freuwNLjKAmwas7gVaB6qRabAmVWy2KQ@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Wed, 15 Sep 2021 14:18:26 -0700
Message-ID: <CA+cxXhnA5LV=E_rcaE=V=GerC=b53tMXHvq-pdtPm8JyEmvxzA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Fabio Estevam <festevam@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
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

Hi Fabio

On Wed, Sep 15, 2021 at 2:00 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Sep 15, 2021 at 5:41 PM Philip Chen <philipchen@chromium.org> wrote:
>
> > As regmap_read() should always read 1 byte at a time, should I just do:
> > regmap_read(map, PAGE0_SWAUX_RDATA, (unsigned int*)(buf + i))
>
> There is also regmap_bulk_read() if you need to read more data.

Thanks for the review.
PAGE0_SWAUX_RDATA is a single-byte FIFO buffer.
So I'll need to read one byte at a time cyclically.
