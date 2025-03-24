Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7325AA6E000
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 17:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408B10E49F;
	Mon, 24 Mar 2025 16:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D9C5BF6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DD310E49D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 16:40:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA20763F;
 Mon, 24 Mar 2025 17:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742834341;
 bh=C4qCR5IiDNqllMSB5IXrinpWcZEJSikRxGwqsymPnqE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D9C5BF6x32gIC0BH3a7FyjNcvNNWaxWaHdq9h6zM/K2pDHxTSBQlPYJZ+2uCV6LyZ
 iXiSRyd7/4n17shRFmevu6xQErMWCZJVYJE0q3JlVMdf0VTt8UlnjUZNY+ycJrcW8e
 Dd3MDKPVPoHCiBWrH2lV6Su8f1Uop5WY3u0ArfxE=
Date: Mon, 24 Mar 2025 18:40:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
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
Message-ID: <20250324164025.GK5113@pendragon.ideasonboard.com>
References: <20250318155549.19625-2-wsa+renesas@sang-engineering.com>
 <20250318204133.GC22890@pendragon.ideasonboard.com>
 <Z9ne78KhxfKYgnh_@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z9ne78KhxfKYgnh_@ninjato>
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

On Tue, Mar 18, 2025 at 10:00:31PM +0100, Wolfram Sang wrote:
> Hi Laurent,
> 
> > > Read out and check the ID registers, so we can bail out if I2C
> > > communication does not work or if the device is unknown.
> > 
> > What's the advantage of that, what are you trying to guard against ?
> 
> That a random chip at address 0x2c will be used.

Is that really a problem ? That would only occur with a broken DT, is it
worth guarding against a development-time issue with a runtime check
that will increase boot time for every user ?

> > > Tested on a
> > > Renesas GrayHawk board (R-Car V4M) by using a wrong I2C address and by
> > > not enabling RuntimePM for the device.
> > 
> > What do you mean by not enabling runtime PM for the device ?
> 
> I left out pm_runtime_get() before regmap_read_bulk().

-- 
Regards,

Laurent Pinchart
