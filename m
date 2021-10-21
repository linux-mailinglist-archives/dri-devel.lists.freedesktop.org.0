Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE27436C6C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 23:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296B6E4B3;
	Thu, 21 Oct 2021 21:07:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE776E4B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 21:07:09 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id g6so2317768ybb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 14:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3yYwJb9ifQ9bmoE69QsAf8gqXf8CKWrMVHpOE+bbaoY=;
 b=hF6934KLm3FVSB1ofYwcdSTKcvZU3Z7gKkb+XbGqWMW34B48+xHPUmf9KYJtSBUNp3
 tyT14Egp0c3eT5G2DandkyurtPePopEutOv3Nvkx7l0RRmj0qJrh3gqrDIR8F+ca5ehJ
 8otBqYbXOIr+t6yaCAxdvp5QvvMruLCeVNq/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3yYwJb9ifQ9bmoE69QsAf8gqXf8CKWrMVHpOE+bbaoY=;
 b=K5DP1HAxjXRzSa41643PRUY9JgX43IoMvQyeCgFBxoGOS7oz+Gu9qYsof8917v38Kt
 WmOf/XpEMMbnlOV2CgmllkQrvJn0MZzSm62abY0CcZ3b/P+Gv5QLBPINuBp3UhTllzku
 p52kC+aW50oe1UekNE5byB7BnES2I1dhRLZmmzxFRWwObziF0DbKgA7TVESPVIoI8drP
 bxRsb+Yc/1EQoa9DDLzwVfFuqPWtzRM/zRXRoy+1nz5W8sUPYcolHZ2OqycsgFJIDfFM
 9HMadIcJ3NYgrPjke4/t27+St38kEGtOCCDITmiBYnXT9vj+j5vlXBKhYkc9WLsWIXoT
 wugQ==
X-Gm-Message-State: AOAM530ysth6JzNtf2gdi4vVIBiLNtbWXX3vE3XwgDs1NsuCaynr3B6j
 +FfElCDJbWgRjFyvT/T1X1hRSHrH8cdSwQk8i054tA==
X-Google-Smtp-Source: ABdhPJxC1SA3pDCdYRqLN2A2ZixcYc5cdrrDDFqm8aVnl+KEFD3kuZJ1czAXMskWv6WpHsQ7T6cZKb5q3RwyhVIx47I=
X-Received: by 2002:a25:c046:: with SMTP id c67mr758091ybf.388.1634850428382; 
 Thu, 21 Oct 2021 14:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211016095644.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <CAD=FV=V7+MzyjsLKE87c=8bkFiRbQkGoM4Jfm8jcsJBG0aYAWw@mail.gmail.com>
In-Reply-To: <CAD=FV=V7+MzyjsLKE87c=8bkFiRbQkGoM4Jfm8jcsJBG0aYAWw@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Thu, 21 Oct 2021 14:06:57 -0700
Message-ID: <CA+cxXh=jeT-t4o48Uv0xojsEP2erL6Aqw2XfYpnUa-SWdcVnfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
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

Hi Doug,

On Mon, Oct 18, 2021 at 1:43 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sat, Oct 16, 2021 at 9:57 AM Philip Chen <philipchen@chromium.org> wrote:
> >
> > @@ -319,81 +345,70 @@ static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
> >          */
> >         msleep(200);
> >
> > -       ret = regmap_read_poll_timeout(map, PAGE2_GPIO_H, status,
> > -                                      status & PS_GPIO9, 20 * 1000, 200 * 1000);
> > -
> > -       if (ret < 0) {
> > -               DRM_ERROR("failed read PAGE2_GPIO_H: %d\n", ret);
> > -               goto err_regulators_disable;
> > -       }
>
> Above the "msleep(200)" I see a comment that says "and then check the
> MCU ready flag every 20ms". That probably refers to the code that
> you're moving here. Maybe change the comment above the "msleep(200);"
> to something like this if you like it:
>
> /*
>  * Mystery 200 ms delay for the "MCU to be ready". It's unclear if
>  * this is truly necessary since the MCU will already signal that
>  * things are "good to go" by signaling HPD on "gpio 9". See
>  * ps8640_ensure_hpd(). For now we'll keep this mystery delay just in
>  * case.
>  */
>
Thanks for the review.
Added the comment in v2.
PTAL.

> Other than that this looks good to me, which isn't really a surprise
> since I was involved in helping with / reviewing early versions of
> this change. In any case, I'm happy with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
