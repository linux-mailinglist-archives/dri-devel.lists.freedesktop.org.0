Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860DE456331
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 20:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C6D6EAC8;
	Thu, 18 Nov 2021 19:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6C66EAC8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 19:08:54 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id x9so7605502ilu.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WyfaLYwNLsMa80kZpW75sztUwF1erOJGMf+B6Q/Q61s=;
 b=Fp3J6lqXwcgJiCVPHZiZQNkNguy1rnEWS3eP1A5aeDOWlPuWVlN5TwgPYn5MAjOMGd
 WmrbwUWSsl5eVerFprAJdvUSwrLXSwZyhspqzN4O8aJu6dsIWggrEH39+X0k0Fy3dR5O
 Egq4kU43zg3qpmhNLX87cnaAXgUYMgpOtluYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WyfaLYwNLsMa80kZpW75sztUwF1erOJGMf+B6Q/Q61s=;
 b=phrBIqFSI2tSwTFGugnn66VI2UV63pBWg7k/gCHUlzjEjjDeiYbr9gN7b8ySR7U4h7
 kqj/M0oiRSWZVFvD6RI3a4jV4o9JNkqbtpdJ74m3XjbNHldiWBP8lSPIm6EGtfirbZ3y
 DBL7aUzdB3T+hD+Mu/q/y1RB0rihpCIlnIVl2ITb+IwEZjUlogIvZzIx00z2+IWWkfWl
 IsfsBzHw7axL+JkiS9vZr7aRTfkGTG4tolX+OSqYBqJi1fOU+9XcH5+o6uiUv/H4Cb8j
 sRDHdqvg+FvFeSLhS6QW0ye9a8HQD1DaHNeb5w7CP9bICmNo0rncjz4AZvFSBCcInDL6
 SFyg==
X-Gm-Message-State: AOAM530v4Tj9LuZvZc41TLXTNk7PyHiCGayGLiBG5cTJxYpbi5twuNwZ
 F6H8CWQhdeOk1X3mCof+pqYchpn5cQYEU3wLAI6lGO6QBdJrzA==
X-Google-Smtp-Source: ABdhPJwXKOCETZCZElLQLrOX3B4B3PRF1rceUhBEF0V3VY2S+YUkPaoBQBElDUj2NSNs5aAKiI87p1opkqA/jqv8dyk=
X-Received: by 2002:a05:6e02:1445:: with SMTP id
 p5mr903918ilo.105.1637262533551; 
 Thu, 18 Nov 2021 11:08:53 -0800 (PST)
MIME-Version: 1.0
References: <20211112112433.942075-1-hsinyi@chromium.org>
 <20211118165203.GA1721588@roeck-us.net>
In-Reply-To: <20211118165203.GA1721588@roeck-us.net>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 19 Nov 2021 03:08:27 +0800
Message-ID: <CAJMQK-iZ5dc0ghYZ_0F3N2QQ3cfsvOdUMg6q0WsaDTMUQvXtdg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Fix edid_read break case in
 sp_tx_edid_read()
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, dri-devel@lists.freedesktop.org,
 Pi-Hsun Shih <pihsun@chromium.org>, Tzung-Bi Shih <tzungbi@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 19, 2021 at 12:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Fri, Nov 12, 2021 at 07:24:33PM +0800, Hsin-Yi Wang wrote:
> > edid_read() was assumed to return 0 on success. After
> > 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()"),
> > the function can return >= 0 for successful case. Fix the g_edid_break
> > condition in sp_tx_edid_read().
> >
> > Fixes: 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from sp_tx_rst_aux()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 1a871f6b6822ee..392203b576042b 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -826,7 +826,7 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
> >                               g_edid_break = edid_read(ctx, offset,
> >                                                        pblock_buf);
> >
> > -                             if (g_edid_break)
> > +                             if (g_edid_break < 0)
> >                                       break;
>
> g_edid_break is declared u8 and thus never < 0. The break; statement
> doesn't indicate an error but that a break was encountered, and the
> value of g_edid_break == 1 is used elsewhere in the function to indicate
> that condition.  It also doesn't break out of the outer loop, but only
> out of the switch statement.
>
> With this patch in place, g_edid_break will have a more or less random
> value after an error, and the behavior of this function will be undefined.
>

Before 7f16d0f3b8e2("drm/bridge: anx7625: Propagate errors from
sp_tx_rst_aux()"), edid_read() only returns 0 (i2c read bytes > 0) or
-EIO, so g_edid_break also couldn't be 1. After checking the code
more, I guess what it wants to do is:

- For the 1st and 2nd block (case 0 and 1) in sp_tx_edid_read(), copy
the buffer on success.
- For other blocks (case 2 and 3), process the buffer when the last
g_edid_break updated in previous blocks is not 1. These blocks
probably don't need to be updated if previous blocks have failed. The
whole edid will be checked if valid.

I will update the patch.

> Guenter
