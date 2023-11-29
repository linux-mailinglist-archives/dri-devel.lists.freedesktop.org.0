Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2521E7FCB9F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080B910E5B8;
	Wed, 29 Nov 2023 00:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BD110E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:42:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E64679DE;
 Wed, 29 Nov 2023 01:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701218526;
 bh=1AeuWZfKhW6gk8Vdtn2NiJT+JeXZTUbzqLObDqVgY1Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+o1a33q/KAKF1OEoqxI7Ml4L1V6LCwpE4Jw4MrN9q/us+RA8PY3ilHnfGb2zmGYh
 V4kx6jvFGrrlSkuqAIg5+nPOYiMb9pOUKLmfNdYP9N+vnRunTwdXpTAX37X5ZZ5QLQ
 IONWXmxrjpt4jb++X0jLJwITEipsSRD7KVB04l4Y=
Date: Wed, 29 Nov 2023 02:42:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Change parameters of
 ti_sn65dsi86_{read,write}_u16
Message-ID: <20231129004247.GC8171@pendragon.ideasonboard.com>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <20231123175425.496956-3-u.kleine-koenig@pengutronix.de>
 <CAD=FV=Ug+th=1T2aZAhMW7TQJ=pq8uU+pWSQd5k+usZ0864P_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Ug+th=1T2aZAhMW7TQJ=pq8uU+pWSQd5k+usZ0864P_w@mail.gmail.com>
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

On Tue, Nov 28, 2023 at 04:34:30PM -0800, Doug Anderson wrote:
> On Thu, Nov 23, 2023 at 9:54 AM Uwe Kleine-König wrote:
> >
> > This aligns the function's parameters to regmap_{read,write} and
> > simplifies the next change that takes pwm driver data out of struct
> > ti_sn65dsi86.
> >
> > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++----------
> >  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> I'm on the fence for this one. It almost feels like if this takes a
> "regmap" as the first field then it should be part of the regmap API.
> Adding a concept like this to the regmap API might be interesting if
> there were more than one user, but that's a pretty big yak to shave.

See include/media/v4l2-cci.h and drivers/media/v4l2-core/v4l2-cci.c. We
could discuss moving it to regmap.

> I'd tend to agree with your statement in the cover letter that this
> patch really makes more sense if we were to take patch #3, and (as per
> my response there) I'm not convinced.

Likewise :-) 1/3 is good, but without 3/3, I'm not conviced by 2/3.

> That being said, similar to patch #3 if everything else thinks this is
> great then I won't stand in the way.

-- 
Regards,

Laurent Pinchart
