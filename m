Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DA736975A
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 18:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503506EC06;
	Fri, 23 Apr 2021 16:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19696EC06
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 16:47:11 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id x11so50159830qkp.11
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DND1iGGPjngmHTVlV+c4Q20wbAG71cect3ZWcNu/fqM=;
 b=HEvzLaXsM1O3YDF7kXj6cV9W3z/mj/YaZRnHFlBZ2rpsku/yo45gm9QY1TDQ+b0Q2Q
 4QmACTulVrObY8AyQsXioItz4TGmlCVL/xhIo2hpFyVGQOkbET4Dy+zwn72r3lYZUfpH
 +pv1WLGIP5dCOKj6dRBy4N34rssSE/rrgyn1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DND1iGGPjngmHTVlV+c4Q20wbAG71cect3ZWcNu/fqM=;
 b=rVOWv3q2llkZfuKdBMziKY3clwLuO7J+6VUhV/Qx/Un6Ci/ZqZM7nyPCoDm5fg68Cb
 ysXGey2KSSSRj8M5q/bdLSClVprKcHaBTXIdEek3Oc5CL5oPIXN14MBkgNOefW27Fapd
 jFYwhZlCJUDfwneq6PgqtdsD4Sus/aOvYIfX+4Bpm9v8tY6NUo4P2Q6rjbWY6nNSjXB+
 UPnxSVng4eLbBIXRqFElloVp1PM4ojVL9I574bbqIn1g7N22Pnya77vQkUwKLEShKpJt
 VEhaUMUDzUnIFwCBztExOTmAh89241RGxe7nD3jtziH4dRWULuOkEXbR1EJ2IjqHaCI2
 7kUw==
X-Gm-Message-State: AOAM532IYSbXDd82qOOvDnBUnbcXJCQuZQ56zg7+ZG7LvHFggEX8qWGT
 4gLCpsMBOYNAxDHZwR3Lhbxel1MHo4hdow==
X-Google-Smtp-Source: ABdhPJw71DlWhcPVVs8K4+4Td0/+C90pPgEqv5eQNwLCW9nz0yltgtoPCQ8i9Or5NLh1ygFA050ZKA==
X-Received: by 2002:a37:906:: with SMTP id 6mr4961565qkj.234.1619196430302;
 Fri, 23 Apr 2021 09:47:10 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id g185sm4733821qkf.62.2021.04.23.09.47.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 09:47:09 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id g38so56321464ybi.12
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 09:47:09 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr7214627ybb.257.1619196429157; 
 Fri, 23 Apr 2021 09:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
In-Reply-To: <20210416153909.v4.27.I502f2a92ddd36c3d28d014dd75e170c2d405a0a5@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 23 Apr 2021 09:46:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdAA4+U5=oW++6j84+=L88ViuKRpGkmgUShDYj0=SaoQ@mail.gmail.com>
Message-ID: <CAD=FV=XdAA4+U5=oW++6j84+=L88ViuKRpGkmgUShDYj0=SaoQ@mail.gmail.com>
Subject: Re: [PATCH v4 27/27] drm/panel: panel-simple: Prepare/unprepare are
 refcounted, not forced
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@siol.net>, Sam Ravnborg <sam@ravnborg.org>, 
 Wolfram Sang <wsa@kernel.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 16, 2021 at 3:41 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Historically simple-panel had code to make sure that if prepare() was
> called on an already-prepared panel that it was a no-op. Similarly if
> unprepare() was called on an already-unprepared panel it was also a
> no-op. Essentially it means that these functions always "forced" the
> value to be whatever the caller wanted it to be. You can see that the
> forcing behavior dates back at least as far as 2014 by looking at
> commit 613a633e7a56 ("drm/panel: simple: Add proper definition for
> prepare and unprepare").
>
> Apparently the code supporting the historical behavior may not be
> needed [1] and prepare() / unprepare() are supposed to be
> balanced. Let's try removing it and see if anyone breaks! If they do
> then we can have a debate about whether we should change that code or
> revert this patch. :-) If nobody breaks then we've nicely saved a few
> lines of code and some complexity.
>
> [1] https://lore.kernel.org/r/YHePsQgqOau1V5lD@pendragon.ideasonboard.com
>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 14 --------------
>  1 file changed, 14 deletions(-)

So it turns out that when looking at panel_simple_remove() I already
found a case that's not necessarily refcounting. There I see
drm_panel_unprepare() just simply hardcoded, but (as I understand it)
there's no reason to believe that the panel has been prepared at
remove() time. Yes, I could fix panel_simple_remove() but instead, for
now, I think I'm going to drop this patch from the series. If someone
wants to pick it up then I certainly won't object, but for now keeping
the way things are seems the best way to keep from getting shouted at.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
