Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A357FD3A3
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 11:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E37610E422;
	Wed, 29 Nov 2023 10:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2C10E422
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 10:11:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F74F842;
 Wed, 29 Nov 2023 11:11:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701252667;
 bh=UAq64tnhRNBUFgU8ndx/VvDw0WukacATk8WX1eZzGxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OxBixTmi8exSwhKhpYHM7/AlkxwV4siRkelIHmr/3qFQ3s5oJy2QN3qkmKwh9C0IU
 gqvbMjbj8KEAUxN3CfmaF6Nn/+CPiN/omI4t2iEYtfetfAHc72Rhqk/4ai5QDeQt5Z
 wfaoL7mZTJtFg5n09El1nf8lXgfoiRTML9h+7Qdw=
Date: Wed, 29 Nov 2023 12:11:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] drm/bridge: ti-sn65dsi86: Simplify using
 pm_runtime_resume_and_get()
Message-ID: <20231129101150.GC18109@pendragon.ideasonboard.com>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-2-u.kleine-koenig@pengutronix.de>
 <20231129003955.GB8171@pendragon.ideasonboard.com>
 <20231129095137.of52hb7bc3ht3t6j@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231129095137.of52hb7bc3ht3t6j@pengutronix.de>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Wed, Nov 29, 2023 at 10:51:37AM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 29, 2023 at 02:39:55AM +0200, Laurent Pinchart wrote:
> > On Thu, Nov 23, 2023 at 06:54:27PM +0100, Uwe Kleine-König wrote:
> > > pm_runtime_resume_and_get() already drops the runtime PM usage counter
> > > in the error case. So a call to pm_runtime_put_sync() can be dropped.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > I wonder if checkpatch should warn about usage of pm_runtime_get_sync().
> 
> It should not warn in general. There are cases where
> pm_runtime_get_sync() is the right function to use. See for example

Sure, the function most likely has some valid use cases (otherwise it
should just be removed), but I think those are are a minority. I was
just thinking out loud anyway.

> commit aec488051633 ("crypto: stm32 - Properly handle pm_runtime_get
> failing").

I don't know much about that device, but wouldn't the best option be to
avoid resuming the device at remove time ? In any case, that's getting
out of topic for the sn65dsi86 :-)

-- 
Regards,

Laurent Pinchart
