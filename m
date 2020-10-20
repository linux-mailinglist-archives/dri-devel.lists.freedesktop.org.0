Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0592293F48
	for <lists+dri-devel@lfdr.de>; Tue, 20 Oct 2020 17:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488996ECFB;
	Tue, 20 Oct 2020 15:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F0C6ECFB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Oct 2020 15:08:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 34794200CF;
 Tue, 20 Oct 2020 17:08:47 +0200 (CEST)
Date: Tue, 20 Oct 2020 17:08:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Alex G." <mr.nuke.me@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/bridge: sii902x: Enable I/O and core VCC
 supplies if present
Message-ID: <20201020150845.GA1913775@ravnborg.org>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <20200928173056.1674274-1-mr.nuke.me@gmail.com>
 <d74c7626-8f16-db85-c23f-79bf0cc400d0@gmail.com>
 <20201020071628.GA1737816@ravnborg.org>
 <5c21a4a4-717c-9f8a-9764-6e3fb9554e46@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c21a4a4-717c-9f8a-9764-6e3fb9554e46@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=Q3oUw9V0dMcNOY3BEmcA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex.

On Tue, Oct 20, 2020 at 09:01:27AM -0500, Alex G. wrote:
> 
> 
> On 10/20/20 2:16 AM, Sam Ravnborg wrote:
> > Hi Alex.
> 
> [snip]
> 
> > > 
> > > 
> > > > diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> > > > index 33fd33f953ec..d15e9f2c0d8a 100644
> > > > --- a/drivers/gpu/drm/bridge/sii902x.c
> > > > +++ b/drivers/gpu/drm/bridge/sii902x.c
> > > > @@ -17,6 +17,7 @@
> > > >    #include <linux/i2c.h>
> > > >    #include <linux/module.h>
> > > >    #include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >    #include <linux/clk.h>
> > > >    #include <drm/drm_atomic_helper.h>
> > > > @@ -168,6 +169,8 @@ struct sii902x {
> > > >    	struct drm_connector connector;
> > > >    	struct gpio_desc *reset_gpio;
> > > >    	struct i2c_mux_core *i2cmux;
> > > > +	struct regulator *iovcc;
> > > > +	struct regulator *cvcc12;
> > > >    	/*
> > > >    	 * Mutex protects audio and video functions from interfering
> > > >    	 * each other, by keeping their i2c command sequences atomic.
> > > > @@ -954,13 +957,13 @@ static const struct drm_bridge_timings default_sii902x_timings = {
> > > >    		 | DRM_BUS_FLAG_DE_HIGH,
> > > >    };
> > > > +static int sii902x_init(struct sii902x *sii902x);
> > Please re-arrange the code so this prototype is not needed.
> 
> I'd be happy to re-arrange things. It will make the diff look a lot bigger
> than what it is. Is that okay?

The best way would be to split it in two patches.
One that is pure code movement and one that does the actula changes.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
