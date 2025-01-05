Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A023A01C84
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 00:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870D410E548;
	Sun,  5 Jan 2025 23:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VjhLvq11";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E25A10E548
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2025 23:20:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D5B594;
 Mon,  6 Jan 2025 00:19:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736119169;
 bh=WzMajFJpJTIuyi6r17zZM8S5dPL8RCoP8M0/xxnt6CY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjhLvq11bERWq8bbI3J27mvIzgjssGJGj9hp5roHipNG81vyLgBCvKCRIcX6MBUXK
 QDH8beDEH5yFUabL0df3RFnZR7iZRJoeiygGc2wQCMRfXID8Xdu2vbfKJRCVD6+5Rz
 MBOqDeLLP1bvSKvwkdf3CgkVC/hiwvU6X9Gw1Mi4=
Date: Mon, 6 Jan 2025 01:20:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 2/2] drm/i2c: move TDA drivers under drivers/gpu/drm/bridge
Message-ID: <20250105232018.GB21164@pendragon.ideasonboard.com>
References: <20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org>
 <20241215-drm-move-tda998x-v1-2-7817122b1d73@linaro.org>
 <20241215123805.GB25852@pendragon.ideasonboard.com>
 <7wbji44qivubkwrbvrdck7fxsl5oaljugzy4td6xywr2p5ug7p@snrr6en5cuh7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7wbji44qivubkwrbvrdck7fxsl5oaljugzy4td6xywr2p5ug7p@snrr6en5cuh7>
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

(CC'ing Hans Verkuil)

On Mon, Jan 06, 2025 at 12:52:55AM +0200, Dmitry Baryshkov wrote:
> On Sun, Dec 15, 2024 at 02:38:05PM +0200, Laurent Pinchart wrote:
> > Hi Dmitry,
> > 
> > Thank you for the patch.
> > 
> > On Sun, Dec 15, 2024 at 01:09:08PM +0200, Dmitry Baryshkov wrote:
> > > TDA998x is the HDMI bridge driver, incorporating drm_connector and
> > > optional drm_encoder (created via the component bind API by the TICLDC
> > > and HDLCD drivers). Thus it should be residing together with the other
> > > DRM bridge drivers under drivers/gpu/drm/bridge/.
> > > 
> > > TDA9950 is an I2C-CEC translator, being present on-die on the TDA9989
> > > and TDA19989 chips, so it is being instantiated by the TDA998x driver.
> > > Move it together with the TDA998x under bridge drivers subdir.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  MAINTAINERS                                       |  2 +-
> > >  drivers/gpu/drm/arm/Kconfig                       |  1 +
> > >  drivers/gpu/drm/bridge/Kconfig                    |  2 ++
> > >  drivers/gpu/drm/bridge/Makefile                   |  1 +
> > >  drivers/gpu/drm/bridge/tda/Kconfig                | 13 +++++++++++++
> > >  drivers/gpu/drm/bridge/tda/Makefile               |  4 ++++
> > >  drivers/gpu/drm/{i2c => bridge/tda}/tda9950.c     |  0
> > >  drivers/gpu/drm/{i2c => bridge/tda}/tda998x_drv.c |  0
> > 
> > I probably wouldn't have created a tda/ subdirectory in bridge/, but I
> > don't mind much either way.
> 
> A possibly better option is to move tsa9950.c to drivers/media/cec/i2c/
> next to ch7332 CEC driver. WDYT?

I think that's a question for Hans. I don't mind much either way.

> If I don't get any response from Russell within the next few days, I
> think I'll post v2 performing these two moves: tda9950 to
> drivers/media/cec/i2c and tda998x to drivers/gpu/drm/bridge without the
> tda/ subdir.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
