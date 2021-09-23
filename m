Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B49B415AF0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 11:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9932B6E10F;
	Thu, 23 Sep 2021 09:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A2C6E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 09:27:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A050E45E;
 Thu, 23 Sep 2021 11:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1632389267;
 bh=/QcPrPdb+9mOrS50q5XHhHdCQQeR/FnPHGocwLYF+HA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=diE3vzWicfqs3JDxJiVNMg/vFlQzdEV6hphiYqnbs0IIUt+Lnx3V+/LrhscnTfMP0
 M5WFD8NCQYgtu0CessFs2PQfzg1JiAuxB6akOtPgh8EXhTS6Yv8G1huNj6PIvJeuMF
 EPvmS/bguBjF93SwhS0Y9oRQMoUSDqT9PlAKM/GQ=
Date: Thu, 23 Sep 2021 12:27:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-mips <linux-mips@vger.kernel.org>, list@opendingux.net,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] drm/ingenic: Attach bridge chain to encoders
Message-ID: <YUxIkdGcGnBhcT0y@pendragon.ideasonboard.com>
References: <20210922205555.496871-1-paul@crapouillou.net>
 <20210922205555.496871-7-paul@crapouillou.net>
 <32234186-1802-4FDF-801A-B14E48FB86D8@goldelico.com>
 <RTPVZQ.WN90B9MHPMZ13@crapouillou.net>
 <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <896D04E4-4058-474B-8BD2-7F21B1C754E4@goldelico.com>
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

Hi Nikolaus,

On Thu, Sep 23, 2021 at 11:19:23AM +0200, H. Nikolaus Schaller wrote:
> > Am 23.09.2021 um 10:49 schrieb Paul Cercueil:
> > Le jeu., sept. 23 2021 at 07:52:08 +0200, H. Nikolaus Schaller a écrit :
> >> Hi Paul,
> >> thanks for another update.
> >> We have been delayed to rework the CI20 HDMI code on top of your series
> >> but it basically works in some situations. There is for example a problem
> >> if the EDID reports DRM_COLOR_FORMAT_YCRCB422 but it appears to be outside
> >> of your series.
> > 
> > I think the SoC can output YCbCr as well, but I never tried to use it.
> 
> Maybe there is code missing or something else. We have not yet deeply researched.
> Except that when ignoring DRM_COLOR_FORMAT_YCRCB422 capability it uses RGB
> and works.
> 
> >>> +		ret = drm_bridge_attach(encoder, &ib->bridge, NULL,
> >>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> >>
> >> DRM_BRIDGE_ATTACH_NO_CONNECTOR makes it fundamentally incompatible
> >> with synopsys/dw_hdmi.c
> >> That driver checks for DRM_BRIDGE_ATTACH_NO_CONNECTOR being NOT present,
> >> since it wants to register its own connector through dw_hdmi_connector_create().
> >> It does it for a reason: the dw-hdmi is a multi-function driver which does
> >> HDMI and DDC/EDID stuff in a single driver (because I/O registers and power
> >> management seem to be shared).
> > 
> > The IT66121 driver does all of that too, and does not need
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR. The drm_bridge_funcs struct has
> > callbacks to handle cable detection and DDC stuff.
> > 
> >> Since I do not see who could split this into a separate bridge and a connector driver
> >> and test it on multiple SoC platforms (there are at least 3 or 4), I think modifying
> >> the fundamentals of the dw-hdmi architecture just to get CI20 HDMI working is not
> >> our turf.
> > 
> > You could have a field in the dw-hdmi pdata structure, that would
> > instruct the driver whether or not it should use the new API. Ugly,
> > I know, and would probably duplicate a lot of code, but that would
> > allow other drivers to be updated at a later date.
> 
> Yes, would be very ugly.
> 
> But generally who has the knowledge (and time) to do this work?
> And has a working platform to test (jz4780 isn't a good development environment)?
> 
> The driver seems to have a turbulent history starting 2013 in staging/imx and
> apparently it was generalized since then... Is Laurent currently dw-hdmi maintainer?

"Maintainer" would be an overstatement. I've worked on that driver in
the past, and I still use it, but don't have time to really maintain it.
I've also been told that Synopsys required all patches for that driver
developed using documentation under NDA to be submitted internally to
them first before being published, so I decided to stop contributing
instead of agreeing with this insane process. There's public
documentation about the IP in some NXP reference manuals though, so it
should be possible to still move forward without abiding by this rule.

> >> Therefore the code here should be able to detect if drm_bridge_attach() already
> >> creates and attaches a connector and then skip the code below.
> > 
> > Not that easy, unfortunately. On one side we have dw-hdmi which
> > checks that DRM_BRIDGE_ATTACH_NO_CONNECTOR is not set, and on the
> > other side we have other drivers like the IT66121 which will fail if
> > this flag is not set.
> 
> Ok, I see. You have to handle contradicting cases here.
> 
> Would it be possible to run it with DRM_BRIDGE_ATTACH_NO_CONNECTOR first
> and retry if it fails without?
> 
> But IMHO the return value (in error case) is not well defined. So there
> must be a test if a connector has been created (I do not know how this
> would work).
> 
> Another suggestion: can you check if there is a downstream connector defined in
> device tree (dw-hdmi does not need such a definition)?
> If not we call it with 0 and if there is one we call it with
> DRM_BRIDGE_ATTACH_NO_CONNECTOR and create one?

I haven't followed the ful conversation, what the reason why
DRM_BRIDGE_ATTACH_NO_CONNECTOR can't always be use here ? We're moving
towards requiring DRM_BRIDGE_ATTACH_NO_CONNECTOR for all new code, so it
will have to be done eventually.

> Just some ideas how to solve without touching hdmi drivers.
> 
> BR and thanks,
> Nikolaus

-- 
Regards,

Laurent Pinchart
