Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D5941670A
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 23:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C6916E10A;
	Thu, 23 Sep 2021 21:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7426C6E10A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 21:02:36 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id i13so8089865ilm.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bkU/dtmrPkLlNRfdPptlfZzv/FhZk/4ZvW2hk6zURpI=;
 b=n4ZVMkZSH0hixxB2pfEOXMKJlfyYXsX+oDaRcNKXuC9SXVD3Ug6P0u9jmcow7/hNgF
 preIQcQFKUe0KIv9iCdJ5N08JEbJr6f8uG4lEcN7iLSwixMV2/ZuzMX8ln0JdUapl+Pg
 DCoAHAPIlDIn3e9UIRo9gfsjcltUG6NUBvhdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bkU/dtmrPkLlNRfdPptlfZzv/FhZk/4ZvW2hk6zURpI=;
 b=QBDqmD5aeUnp6negOtq+BAeqoIEWjHWpkvhcEeZDxSaC9lO2MaJiL4rfIBxWxtsZgX
 uiRmGxLccEXG1cbAOiEEfwffRAoj4AgjGzZaXjunsg1S6jMOWIZCGVjkwuLbW2igR7oj
 LELTWS1j8uplF83bwWWQaTiwXFxw+56jTcgWx/3sRhZtWl4+j9i4m+gqrSBKTvz37AvA
 uZ2okg/cJTsjgf03F2zAfssjMuYkFDM0ubO0xbiu0F/IVCduup4O+MBsbJ4QGLY3CwUA
 qVdSe7kQ58U2E09q8H31RnSvLbT5kuCOFLdFG7GrqLHfjWhSXhlxeS02mrFZ49x3IfJ4
 /n2w==
X-Gm-Message-State: AOAM530e0MB8ctjw+C6CHhTpAzkFDDRnmQpZC2yyyYOmB+0VTrFV4zjH
 LOhVfUR0yiIwujE0JfhLnIWGsIABiRsVMA==
X-Google-Smtp-Source: ABdhPJyj1a6EdjpOZe0xvVU3psA/Jz9W6xCaJwZDAz0vsaeU9F6pfd4ZgHlBvUYo9ZOVqGxx99RcpQ==
X-Received: by 2002:a05:6e02:d8c:: with SMTP id
 i12mr5067127ilj.190.1632430955532; 
 Thu, 23 Sep 2021 14:02:35 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com.
 [209.85.166.178])
 by smtp.gmail.com with ESMTPSA id d14sm3074986iod.18.2021.09.23.14.02.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 14:02:34 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id h9so8087573ile.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 14:02:34 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr5199978ilm.120.1632430953826; 
 Thu, 23 Sep 2021 14:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
In-Reply-To: <20210921110556.v6.1.I2351df94f18d5d8debc22d4d100f36fac560409a@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Sep 2021 14:02:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XNSb-ZNoHzjUQJ2JntF3D4nAoKQ_OLo_7jLomnvdFJ6Q@mail.gmail.com>
Message-ID: <CAD=FV=XNSb-ZNoHzjUQJ2JntF3D4nAoKQ_OLo_7jLomnvdFJ6Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] drm/bridge: parade-ps8640: Use regmap APIs
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>,
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

Hi,

On Tue, Sep 21, 2021 at 11:06 AM Philip Chen <philipchen@chromium.org> wrote:
>
> Replace the direct i2c access (i2c_smbus_* functions) with regmap APIs,
> which will simplify the future update on ps8640 driver.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> ---
>
> (no changes since v4)
>
> Changes in v4:
> - Remove excessive error logging from the probe function
>
> Changes in v3:
> - Fix the nits from v2 review
>
> Changes in v2:
> - Add separate reg map config per page
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 94 ++++++++++++++++++--------
>  1 file changed, 64 insertions(+), 30 deletions(-)

Pushed both patches to drm-misc-next:

13afcdd7277e drm/bridge: parade-ps8640: Add support for AUX channel
692d8db0a5ca drm/bridge: parade-ps8640: Use regmap APIs

I made a few whitespace fixes reported by `dim apply-branch` (DRM
committer tool) and also re-arranged your Signed-off-by to be above
the Reviews/Acks.

-Doug
