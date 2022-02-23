Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8834C0B62
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 06:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E89210E951;
	Wed, 23 Feb 2022 05:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504E710E951
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 05:07:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 328CCDD;
 Wed, 23 Feb 2022 06:07:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645592877;
 bh=kN0ZyoiXMV6L86XxzCtG8GG9/tq0A0jYC35yUuHrYpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bD7ZBhUzEVTFSC9UurN3tBFuK/V2CrlB81b9dlbdrRkJa8+jXNsELI/EYUjbws6Ca
 beS3SQQIBx4nLEeXw8MP2ya6FLBFpyD7fvvOY6sNSdiL8nYSmRoFrgJn0BF7sSrRbr
 7zgeVkjgaG/01MZkw5VH4Z57Et1ihson0wpgRBw0=
Date: Wed, 23 Feb 2022 07:07:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Properly undo autosuspend
Message-ID: <YhXBIxbx63IXBU7L@pendragon.ideasonboard.com>
References: <20220222141838.1.If784ba19e875e8ded4ec4931601ce6d255845245@changeid>
 <CACRpkdbQ9U22afR74YiZs95qCm7dnLb2k4_nT3Le__hJPpDGUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACRpkdbQ9U22afR74YiZs95qCm7dnLb2k4_nT3Le__hJPpDGUw@mail.gmail.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 11:44:54PM +0100, Linus Walleij wrote:
> On Tue, Feb 22, 2022 at 11:19 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > The PM Runtime docs say:
> >   Drivers in ->remove() callback should undo the runtime PM changes done
> >   in ->probe(). Usually this means calling pm_runtime_disable(),
> >   pm_runtime_dont_use_autosuspend() etc.
> >
> > We weren't doing that for autosuspend. Let's do it.
> >
> > Fixes: 9bede63127c6 ("drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> 
> Hm. I know a few places in drivers where I don't do this :/

It seems to be a very common problem indeed, I haven't seen any driver
yet that uses pm_runtime_dont_use_autosuspend(). We could play a game of
whack-a-mole, but we'll never win. Could this be solved in the runtime
PM framework instead ? pm_runtime_disable() could disable auto-suspend.
If there are legitimate use cases for disabling runtime PM temporarily
without disabling auto-suspend, then a new function designed
specifically for remove() that would take care of cleaning everything up
could be another option.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

-- 
Regards,

Laurent Pinchart
