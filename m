Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB8A19638
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 17:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B510E213;
	Wed, 22 Jan 2025 16:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="p7C251Sf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CE4010E213
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 16:12:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B3261C000F;
 Wed, 22 Jan 2025 16:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737562355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUhoqRqNTi+JvpW8VrhCgfqzUUgEFjEK0Fi5GnnU8aA=;
 b=p7C251SfaqCthIu1s+0NxFFMsaC8tuHLjxiN4XAXymcLB0kq+zWpgSG/vBalxh8Qfp3IDj
 RRQGmgOBzoCq2CygM0rSYnLlJBV/Y1Mv2o8/YY++cFK3Q4frqiFL7P9MoRgRMXvqKw9QXU
 561sReYr+vuqli0Z1oJRv+3B/UkXvHBX0GDXhBD86U5zOCH8evhUpGfrBn13+IrUsBUZ9g
 zr731BMgz8DylX74uXzMNJP4ypCrGL6Ianof2iK1Srq9gDTa0VrCvSOUh/tcnSSVV7JO96
 B9Q8Aj/IdsYGAr8E6i8hFE35PlPdHSmoH26ucRK1vD1pHRwR1HFWvvQfeGgmgg==
Date: Wed, 22 Jan 2025 17:12:30 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Simona Vetter
 <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, Paul
 Kocialkowski <contact@paulk.fr>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Message-ID: <20250122171230.30cf9b97@booty>
In-Reply-To: <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
 <20250106-vigorous-talented-viper-fa49d9@houat>
 <CAA8EJprhe4+9HwjW-=4K_LUD5pw51ij_dk0SZABbKH+ExnjdzQ@mail.gmail.com>
 <20250108162429.53316041@booty>
 <20250108-astonishing-oarfish-of-energy-c0abbe@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Wed, 8 Jan 2025 17:02:04 +0100
Maxime Ripard <mripard@kernel.org> wrote:

[...]

> > > > And we'll also need some flag in drm_bridge to indicate that the device
> > > > is gone, similar to what drm_dev_enter()/drm_dev_exit() provides,
> > > > because now your bridge driver sticks around for much longer than your
> > > > device so the expectation that your device managed resources (clocks,
> > > > registers, etc.) are always going to be around.    
> > 
> > Yes, makes sense too. That should be a drm_bridge_enter/exit(), and
> > drm_bridge.c will need to be sprinkled with them I guess.  
> 
> The users would be the drivers, most likely. There's not much we can do
> at the framework level, unfortunately.

Back to the idea of a "gone" flag, or perhaps an "unplugged" flag to
be consistent with the struct drm_device naming, and
drm_bridge_enter()/drm_bridge_exit(), I did a few experiments and have
a question.

In case:

  a) there is a notification callback to inform about bridges
     being removed, and
  b) all entities owning a struct drm_bridge pointer stop using
     that pointer when notified


With the above, there should be no need for
drm_bridge_enter()/drm_bridge_exit(). Nobody will be using a pointer to
a bridge that is being removed.

Now, about a), patch 1 in this series implements such a mechanism to
inform all bridges when a bridge is being removed. Note that the
"unplugged" flag would be set immediately after the notifier callback
is currently called: "unplugged == true" will never happen before the
callback, and after the callback there will be no pointer at all.

Patch 1 however is only notifying bridges, so other entities (e.g.
encoders) cannot be notified with this implementation. However a
different notification mechanism can be implemented. E.g. until v3 this
series was using a generic struct notifier_block for this goal [0], so
any part of the kernel can be notified.

About b), the notification appears simpler to implement in the various
drivers as it needs to be added in one place per driver. Also adding
drm_bridge_enter()/exit() can be trickier to get right for non-trivial
functions.

Do you see any drawback in using a notification mechanism instead of
drm_bridge_enter()/exit() + unplugged flag?

[0] https://lore.kernel.org/all/20240510-hotplug-drm-bridge-v2-2-ec32f2c66d56@bootlin.com/

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
