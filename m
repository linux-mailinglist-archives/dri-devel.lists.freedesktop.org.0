Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F17FCB81
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FD310E579;
	Wed, 29 Nov 2023 00:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FE610E579
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:37:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0DC229DE;
 Wed, 29 Nov 2023 01:36:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701218218;
 bh=8a0hHeMgAOKinuwtgPtwy7UD8gH3FPsE5XeqIhqsg7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EvpbwoxE+8pLw0ZjjULqV2kvuowcj6PTpPKVSzEffvIc5WnYcI634Mb3cjQlsNP3Q
 4SvPlHM95q9jX68W/0Y+eCKeXXRc4uOwipksqTaooZqnqfB3Wj6/Bev5avAys4uGU/
 14F69xjfZYEKXA9ANLfb5trQnjcR0z4cAdsNDvsM=
Date: Wed, 29 Nov 2023 02:37:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to
 ti-sn65dsi86 core
Message-ID: <20231129003739.GA8171@pendragon.ideasonboard.com>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-4-u.kleine-koenig@pengutronix.de>
 <CAD=FV=U0qxT94HuTiZKO1WrnVNbcW30vMQP8NSo5gz+ijBv1sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U0qxT94HuTiZKO1WrnVNbcW30vMQP8NSo5gz+ijBv1sw@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Bjorn Andersson <andersson@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 04:32:10PM -0800, Doug Anderson wrote:
> On Thu, Nov 23, 2023 at 9:54 AM Uwe Kleine-König wrote:
> >
> > Introduce a dedicated private data structure for the pwm aux driver
> > provided by the sn65dsi86 driver. This way data needed for PWM operation
> > is (to a certain degree) nicely separated and doesn't occupy memory in
> > the ti_sn65dsi86 core's private data if the PWM isn't used.
> 
> I suspect we still end up at a loss memory-wise. All of the extra code
> + the overhead of another kmalloc seems like it would take up more
> space than the tiny bit of data in the structure.
> 
> 
> > The eventual goal is to decouple the PWM driver completely from the
> > ti-sn65dsi86 core and maybe even move it to a dedicated driver below
> > drivers/pwm. There are a few obstacles to that quest though:
> >
> >  - The busy pin check (implemented in ti_sn_pwm_pin_request() and
> >    ti_sn_pwm_pin_release()) would need to be available unconditionally.
> >
> >  - The refclk should probably abstracted by a struct clk such that the
> >    pwm_refclk_freq member that currently still lives in ti-sn65dsi86
> >    core driver data can be dropped.
> 
> Right that the above could be done with more abstraction layers. I
> guess the question I have is: how much do we gain with that?
> 
> Personally I'm not really sold on the idea. If others think this is a
> great change then I won't stand in the way, but IMO without a
> compelling reason this is just extra abstraction / complexity without
> any gain...

I'm not convinced either, especially on moving to a separate driver, but
even when it comes to dynamically allocating a new structure. Splitting
the PWM fields to a new ti_sn65dsi86_pwm would be fine (and I think
would increase readibility), but we can then simply embed it in
ti_sn65dsi86.

> > +/*
> > + * struct ti_sn65dsi86_pwm_ddata - Platform data for ti-sn65dsi86 pwm driver.
> 
> Why "ddata" exactly? It seems like this is just the pwm "data" ?
> 
> 
> > + * @chip:         pwm_chip if the PWM is exposed.
> > + * @pwm_enabled:  Used to track if the PWM signal is currently enabled.
> > + * @regmap:       Regmap for accessing i2c.
> > + * @pdata:       platform data of the parent device
> 
> "pdata" isn't a member of the struct, but "pwm_refclk_freq" is.

-- 
Regards,

Laurent Pinchart
