Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E782A3CA4
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 07:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 723C56E027;
	Tue,  3 Nov 2020 06:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2DA6E027
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 06:11:21 +0000 (UTC)
Received: from localhost (unknown [122.179.37.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 07AFF22277;
 Tue,  3 Nov 2020 06:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604383880;
 bh=23DogF8cxNuHcdZPQ5HVx3IcI+ys/4JhUq4kkNZX/js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mLXMYcoHk5jc5ulnuVbydiNUa9ym5FjoC4EufLQc59nmscXYde/WxczCKMjm14LoE
 U5RkcSAbE1C1Tg/1c3ZogjOS4A5wTgfNkPC8u8i+wey/llOfwZMoZxFNebaX19xFQa
 3bh+2GP3a6HeNvheTdab9Zbg0QqRzM7fgQdso0EM=
Date: Tue, 3 Nov 2020 11:41:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
Message-ID: <20201103061116.GD2621@vkoul-mobl>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201101173741.GA1293305@ravnborg.org>
 <CAD=FV=V3kktCrwvMBeOy1dnQGYuV-ZUGX81+upRZacfzxjceFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=V3kktCrwvMBeOy1dnQGYuV-ZUGX81+upRZacfzxjceFg@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks Doug for adding me

On 02-11-20, 08:37, Doug Anderson wrote:
> > On Thu, Oct 29, 2020 at 06:17:34PM -0700, Stephen Boyd wrote:

> > Any chance we can convince you to prepare this bridge driver for use in
> > a chained bridge setup where the connector is created by the display
> > driver and uses drm_bridge_funcs?
> >
> > First step wuld be to introduce the use of a panel_bridge.
> > Then add get_edid to drm_bridge_funcs and maybe more helpers.
> >
> > Then natural final step would be to move connector creation to the
> > display driver - see how other uses drm_bridge_connector_init() to do so
> > - it is relatively simple.
> >
> > Should be doable - and reach out if you need some help.

Yes it is and doable and you find this at [1], would need a rebase
though.

> At some point I think Vinod tried to prepare a patch for this and I
> tried it, but it didn't just work.  I spent an hour or so poking at it
> and I couldn't quite figure out why and I couldn't find enough other
> examples to compare against to see what was wrong...  That was a few
> months ago, though.  Maybe things are in a better shape now?

It worked fine for me on Rb3 and db410c where we had HDMI connector. I
don't have a panel device to test and Bjorn tried to help out with a bit
of testing. This didn't work on the laptop, that is why I haven't posted
it yet.

This has conversion of msm driver and bridge drivers lt9611, adv7511 and
ti-sn65dsi86.

[1]: https://git.linaro.org/people/vinod.koul/kernel.git/log/?h=wip/msm_bridges_no_conn

Thanks
-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
