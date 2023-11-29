Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD527FCBB4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 01:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4610E5B6;
	Wed, 29 Nov 2023 00:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A7010E5B6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 00:45:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 129639DE;
 Wed, 29 Nov 2023 01:44:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1701218692;
 bh=2y60YAspNngQr9limyvvFJDhV1gCujRhvUB966/aP6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lLUMX2B57M5ALhlucthuN/l0qSBu3N4oeiWf3DfsrN9++cQn1SCGSo5LuNMStobc2
 WqO3Ki52t9MUj8u9/xK5oLB2B2URIEvuzYYNd/gWIzbzZS8gzyZ7sNpVfStTBXSrKY
 IYCnhxwuDKXTBrhD8GYvtG/vsS23Js1L5L9Xygt8=
Date: Wed, 29 Nov 2023 02:45:33 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] drm/bridge: ti-sn65dsi86: Some updates
Message-ID: <20231129004533.GD8171@pendragon.ideasonboard.com>
References: <20231123175425.496956-1-u.kleine-koenig@pengutronix.de>
 <b1fde098-edde-4c44-b73f-a429f5d62f8a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1fde098-edde-4c44-b73f-a429f5d62f8a@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Fri, Nov 24, 2023 at 09:56:55AM +0100, Neil Armstrong wrote:
> On 23/11/2023 18:54, Uwe Kleine-König wrote:
> > Hello,
> > 
> > this is a series I created while starring at the ti-sn65dsi86 driver in
> > the context of my pwm-lifetime series.
> > 
> > The first patch should be fine. The last one has a few rough edges, but
> > maybe you like the direction this is going to? The 2nd patch probably
> > only makes sense if you also take the third.
> > 
> > Best regards
> > Uwe
> > 
> > Uwe Kleine-König (3):
> >    drm/bridge: ti-sn65dsi86: Simplify using pm_runtime_resume_and_get()
> >    drm/bridge: ti-sn65dsi86: Change parameters of
> >      ti_sn65dsi86_{read,write}_u16
> >    drm/bridge: ti-sn65dsi86: Loosen coupling of PWM to ti-sn65dsi86 core
> > 
> >   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 146 +++++++++++++++-----------
> >   1 file changed, 83 insertions(+), 63 deletions(-)
> > 
> > base-commit: 4e87148f80d198ba5febcbcc969c6b9471099a09
> 
> It looks fine to me, even without the goal to move the driver to drivers/pwm
> I think it's same to move the pwm ddata out of the main pdata ans associate
> it to the pwm aux device lifetime.
> 
> I don't anything wrong, and so far it's of for me, let's see if there's comments
> for other people before applying!

I like 1/3 very much, but as mentioned in a reply to 3/3, I'm not
convinced by that one at all. Not only does it make the driver more
complex for, I believe, very little gain (if any), usage of
devm_kzalloc() in ti_sn_pwm_probe() is most likely wrong. Lifetime of
driver-specific structures need to be handled through reference
counting.

-- 
Regards,

Laurent Pinchart
