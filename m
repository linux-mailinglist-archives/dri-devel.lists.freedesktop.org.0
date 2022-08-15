Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00435935E7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 20:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457FD2190;
	Mon, 15 Aug 2022 18:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEB0D2023
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:52:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D64BA4A8;
 Mon, 15 Aug 2022 20:52:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660589570;
 bh=+NuBkTND3XJbe0x6qRQNdw6++aFzQI/aMn3RnRA3zuE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gxMsg4+lyXFAsJ1KdT0hv1rtWamZv86bDDoAocHocIP068XeNYqDfhnhTZWb/jCJq
 /GqhI/f+i8J4E/VuECQ2mxJPVlkMLJnUwis4hFyasXRjpdu9E0tQyvtIMuBbVtbyQm
 6dqLB3c4hn+OofwgiIyK1grU1/FJaTXy7oV2RphU=
Date: Mon, 15 Aug 2022 21:52:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
Message-ID: <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Johan Hovold <johan+linaro@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark,

On Mon, Aug 15, 2022 at 05:33:06PM +0100, Mark Brown wrote:
> On Mon, Aug 15, 2022 at 06:54:45PM +0300, Laurent Pinchart wrote:
> 
> > - With devres, you don't have full control over the order in which
> >   resources will be released, which means that you can't control the
> >   power off sequence, in particular if it needs to be sequenced with
> >   GPIOs and clocks. That's not a concern for all drivers, but this API
> >   will creep in in places where it shouldn't be used, driver authours
> >   should really pay attention to power management and not live with the
> >   false impression that everything will be handled automatically for
> >   them. In the worst cases, an incorrect power off sequence could lead
> >   to hardware damage.
> 
> I basically agree with these concerns which is why I was only happy with
> this API when Matti suggested doing it in a way that meant that the
> callers are unable to access the regulator at runtime, this means that
> if anyone wants to do any kind of management of the power state outside
> of probe and remove they are forced to convert to the full fat APIs.
> The general ordering concern with devm is that the free happens too late
> but for the most part this isn't such a concern with regulators, they
> might have delayed power off anyway due to sharing - it's no worse than
> memory allocation AFAICT.  Given all the other APIs using devm it's
> probably going to end up fixing some bugs.
> 
> For sequencing I'm not convinced it's much worse than the bulk API is
> anyway, and practically speaking I expect most devices that have
> problems here will also need more control over power anyway - it's
> certainly the common case that hardware has pretty basic requirements
> and is fairly tolerant.

I'm not extremely concerned here at the moment, as power should be the
last thing to be turned off, after clocks and reset signals. As clocks
and GPIOs will still be controlled manually in the driver .remove()
function, it means that power will go last, which should be fine.
However, should a devm_clk_get_enable() or similar function be
implemented, we'll run into trouble. Supplying active high input signals
to a device that is not powered can lead to latch-up, which tends to
only manifest after a statistically significant number of occurrences of
the condition, and can slowly damage the hardware over time. This is a
real concern as it will typically not be caught during early
development. I think we would still be better off with requiring drivers
to manually handle powering off the device until we provide a mechanism
that can do so safely in an automated way.

> > - Powering regulators on at probe time and leaving them on is a very bad
> >   practice from a power management point of view, and should really be
> >   discouraged. Adding convenience helpers to make this easy is the wrong
> >   message, we should instead push driver authors to implement proper
> >   runtime PM.
> 
> The stick simply isn't working here as far as I can see.

Do you think there's no way we can get it to work, instead of giving up
and adding an API that goes in the wrong direction ? :-( I'll give a
talk about the dangers of devm_* at the kernel summit, this is something
I can mention to raise awareness of the issue among maintainers,
hopefully leading to improvements through better reviews.

-- 
Regards,

Laurent Pinchart
