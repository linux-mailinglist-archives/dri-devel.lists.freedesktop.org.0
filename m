Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6AE787B1D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 00:01:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F9C110E5C4;
	Thu, 24 Aug 2023 22:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893EE10E5C4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 22:01:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B9A28808;
 Fri, 25 Aug 2023 00:00:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692914409;
 bh=njXF1BFmgLojXBHTViNb5H2eBLkMkjfk5gY9ejdbIlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XX/uNdv6Se3VusoYvnlCar4o08oE16kpa1Pg+zDvhOR8UL4GSvhftY0I1eGv1CS/7
 xaG39YYXfPZPdp8E20ySeN25T00hQxXcDWVlLXubyO5iLCKXju/QjXdcOOXlyBAAG5
 Wz3gYth6nIN3PThtvoIlYTzl4NfL5//cuB63Nuho=
Date: Fri, 25 Aug 2023 01:01:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] drm/bridge/analogix/anx78xx: Drop ID table
Message-ID: <20230824220133.GB6477@pendragon.ideasonboard.com>
References: <20230824181546.391796-1-biju.das.jz@bp.renesas.com>
 <20230824182609.GA6477@pendragon.ideasonboard.com>
 <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Wg1LY3601vN1qhKOEuZ9hVf-+hX8ajC6DKsC-5TNpy7g@mail.gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Zhu Wang <wangzhu9@huawei.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 24, 2023 at 01:51:59PM -0700, Doug Anderson wrote:
> On Thu, Aug 24, 2023 at 11:26 AM Laurent Pinchart wrote:
> > On Thu, Aug 24, 2023 at 07:15:46PM +0100, Biju Das wrote:
> > > The driver has an ID table, but it uses the wrong API for retrieving match
> > > data and that will lead to a crash, if it is instantiated by user space or
> > > using ID. From this, there is no user for the ID table and let's drop it
> > > from the driver as it saves some memory.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > I wonder, as the device can only be instantiated from OF, should we add
> >
> >         depends on OF
> >
> > to Kconfig, and drop the
> >
> > #if IS_ENABLED(CONFIG_OF)
> >
> > from the driver ?
> 
> In my opinion we shouldn't add the "depends on OF" since that will
> decrease the amount of compile testing. It's somewhat the opposite of
> adding "if COMPILE_TEST" to your driver. ;-)

We could add a || COMPILE_TEST :-)

> I think we could get rid of one of the "#if" statements in the driver
> anyway as of commit c9e358dfc4a8 ("driver-core: remove conditionals
> around devicetree pointers") from ~12 years ago. If we did something
> similar in "struct drm_bridge" we could drop both #ifs.

I'd be fine with that too.

-- 
Regards,

Laurent Pinchart
