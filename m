Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D11CA6E0D7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 18:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D2510E4A2;
	Mon, 24 Mar 2025 17:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fp8SR1vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4529710E4A2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 17:31:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A16E7455;
 Mon, 24 Mar 2025 18:29:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742837371;
 bh=JndadwcFovCueYuRcQKxgQ2ynyCrGUVZP4AbHS5ILyw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fp8SR1vqnjOUP4eQ8LtxHuCAzVrSeglXOw+rxvyFGhX6CPn1s2Cv81vePY3bAzQFh
 h4slGcQVmE9fxa+k6Mgt+ue0Wk+pJDD6UWxQYeg6IvNYZI/HZht8lhUu7GqI1RdAxd
 ZUpY6P+tqWvMB5CjlS8IKjRFl/DaIY5rGXViv9K0=
Date: Mon, 24 Mar 2025 19:30:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/bridge: ti-sn65dsi86: Check bridge connection
 failure
Message-ID: <20250324173055.GA18359@pendragon.ideasonboard.com>
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com>
 <Z9ne78KhxfKYgnh_@ninjato>
 <20250324164025.GK5113@pendragon.ideasonboard.com>
 <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=Umc0aAvDrQhoZoaaOHjn8B2u0BTtgqeS3oEcH+mtAgwA@mail.gmail.com>
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

On Mon, Mar 24, 2025 at 10:17:05AM -0700, Doug Anderson wrote:
> On Mon, Mar 24, 2025 at 9:40 AM Laurent Pinchart wrote:
> > On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> > > Hi Laurent,
> > >
> > > > > Read out and check the ID registers, so we can bail out if I2C
> > > > > communication does not work or if the device is unknown.
> > > >
> > > > What's the advantage of that, what are you trying to guard against ?
> > >
> > > That a random chip at address 0x2c will be used.
> >
> > Is that really a problem ? That would only occur with a broken DT, is it
> > worth guarding against a development-time issue with a runtime check
> > that will increase boot time for every user ?
> 
> FWIW, this can also happen simply due to broken / damaged hardware. If
> a board gets stressed and causes a pin to become disconnected or if a
> regulator ages and stops providing power then we can also end up in
> this state. Getting a nice obvious error at probe when the device
> isn't responding at all can make problems like this much easier to
> debug.

I'm not fully convinced it's worth it, compared to an error at runtime,
and especially given that there are way more pins than supplies or
SCL/SDA that could suffer from a similar issue. I won't block the patch,
but I think it's overkill.

> It's not uncommon for i2c devices to probe to make sure the
> device is really there at bootup. Checking for the full 8-byte ID is
> probably a bit overkill, but at the same time if we're going to probe
> something the ID is not a terrible thing to probe and reading 8 bytes
> won't really take much longer than reading 1.

-- 
Regards,

Laurent Pinchart
