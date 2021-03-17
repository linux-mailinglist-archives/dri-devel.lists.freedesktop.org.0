Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95E33E59B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 02:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E916889A67;
	Wed, 17 Mar 2021 01:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD2989A67
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 01:06:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46A0964EFC;
 Wed, 17 Mar 2021 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615943202;
 bh=etM6EonOQ37rooBRvfkW08PwTfwbsMEucMYsLYsb6ro=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RC+JJ7wV3hCa2TZIbGKAwIGF5N2+2ir1/MgU6Hw9GVXkvF0fZEB+mvgpMULsGPOg1
 a81so27BuA2Y4cuqwQ/wm2pjbNHp7Hmuxoxdks/IKoG+rU9MxOBEK8yO97GBuvKKBO
 47pT0sknrQUs6FCiQLuI58ylgkJUXhiieYLqZsv+zaavuyngMu/L10uCSdyQvnTpbP
 R505CpJKh1DEiplMQX9xIPaePR0y1m0JyndnxfUI9Hu9HRrgt/hlNEW1OfaXmKGpTR
 m1G6BPLz6jlWsUkNS6GrSUgmvwIQ0gMpB9TxC7+2oZdg1DPfvYTHotqUoZ8rgKKVJL
 K7xANRuJpFCZg==
MIME-Version: 1.0
In-Reply-To: <20210303084527.rziaoiqsr7r4bhcv@gilmour>
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-2-maxime@cerno.tech>
 <161472713858.1478170.9594904338107431350@swboyd.mtv.corp.google.com>
 <20210303084527.rziaoiqsr7r4bhcv@gilmour>
Subject: Re: [PATCH 1/8] clk: Add range accessors
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 16 Mar 2021 18:06:40 -0700
Message-ID: <161594320095.1478170.16988206902476583714@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2021-03-03 00:45:27)
> Hi Stephen,
> 
> On Tue, Mar 02, 2021 at 03:18:58PM -0800, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2021-02-25 07:59:02)
> > > Some devices might need to access the current available range of a clock
> > > to discover their capabilities. Let's add those accessors.
> > 
> > This needs more than two sentences to describe what's required.
> > 
> > > 
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
> > >  include/linux/clk.h | 16 ++++++++++++++++
> > >  2 files changed, 46 insertions(+)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 8c1d04db990d..b7307d4f090d 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2407,6 +2407,36 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
> > >  }
> > >  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> > >  
> > > +long clk_get_min_rate(struct clk *clk)
> > 
> > I need to read the rest of the patches but I don't see the justification
> > for this sort of API vs. having the consumer constrain the clk frequency
> > that it wants. Is the code that's setting the min/max constraints not
> > the same as the code that's calling this API? Would an OPP table better
> > serve this so the device knows what frequencies are valid?s Please
> > provide the use case/justification in the commit text.
> 
> The patch that uses it is the patch 4
> 
> The issue I'm trying to solve is that all the RaspberryPi have a
> configuration file for the firmware, and the firmware is in charge of
> the clocks communicating through a mailbox interface.
> 
> By default, one of the main clocks in the system can only reach 500MHz,
> and that's the range reported by the firmware when queried. However, in
> order to support display modes with a fairly high bandwidth such as 4k
> at 60Hz, that clock needs to be raised to at least 550MHz, and the
> firmware configuration has a special parameter for that one. Setting
> that parameter will increase the range of the clock to have proper
> boundaries for that display mode.
> 
> If a user doesn't enable it and tries to use those display modes, the
> display will be completely blank.
> 
> There's no way to query the firmware configuration directly, so we can
> instead query the range of the clock and see if the firmware enables us
> to use those modes, warn the user and ignore the modes that wouldn't
> work. That's what those accessors are here for

How does the clk driver query the firmware but it can't be done
directly by the drm driver? 

> 
> > Why two functions instead of one function to get both min and max?
> 
> Since we have clk_set_min_rate and clk_set_max_rate, it made sense to me
> to mirror that, but I'd be happy to change if you think otherwise
> 

Does using clk_round_rate() work just as well?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
