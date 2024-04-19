Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158668AB6A9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 23:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A5E10E1D9;
	Fri, 19 Apr 2024 21:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rZU+LPPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41BD10E1D9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 21:54:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 036F4CE1AE1;
 Fri, 19 Apr 2024 21:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00652C072AA;
 Fri, 19 Apr 2024 21:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713563639;
 bh=ttIcqkCyWmr6vD223UIwRsrnIQtQJoEowgOLU2LYMls=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZU+LPPWM9ZCrDVCAwqY7YmAVImGP5UqMSMIQaOrKYpNq1SYUuaM6j81qLUzl1PjK
 h5IVNIH716t6lkEZ9Fok5lsCKpbkvO7mAF37Gr7wK/MBUwbjgApUxOIkKppNxirlrE
 oa79O9czkhrdPgLqlEpdfywiHoJIrPbv6ASkCubRp+9kTfbt1yRs+QzsXEQSzSxRjH
 zxjd7yzJ/OrOa7ZIYquXcjFRYdTXNRDHo0Aq9QRh37lb4/BDfByJTUVIaTuxmcr5s7
 BNFo4J6gF8rXhlvtxbAIdDhjmlY2q2g214piQgc5ys9VB9E25vzzmlOlnT/nR/bz3A
 ZbcJkjdG7lZvA==
Date: Fri, 19 Apr 2024 16:53:57 -0500
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Vadim Pasternak <vadimp@nvidia.com>, Michael Shych <michaelsh@nvidia.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Saravana Kannan <saravanak@google.com>,
 "open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 linux-media@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] i2c: mux: Remove class argument from i2c_mux_add_adapter()
Message-ID: <20240419215357.GA4041284-robh@kernel.org>
References: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17145dc5-e68e-4566-bedf-251bebe36ebb@gmail.com>
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

On Thu, Apr 18, 2024 at 10:55:39PM +0200, Heiner Kallweit wrote:
> 99a741aa7a2d ("i2c: mux: gpio: remove support for class-based device
> instantiation") removed the last call to i2c_mux_add_adapter() with a
> non-null class argument. Therefore the class argument can be removed.
> 
> Note: Class-based device instantiation is a legacy mechanism which
> shouldn't be used in new code, so we can rule out that this argument
> may be needed again in the future.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/gpu/drm/bridge/sii902x.c           |  2 +-
>  drivers/i2c/i2c-mux.c                      | 24 +---------------------
>  drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  2 +-
>  drivers/i2c/muxes/i2c-mux-gpio.c           |  2 +-
>  drivers/i2c/muxes/i2c-mux-gpmux.c          |  2 +-
>  drivers/i2c/muxes/i2c-mux-ltc4306.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-mlxcpld.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-pca9541.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-pca954x.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-pinctrl.c        |  2 +-
>  drivers/i2c/muxes/i2c-mux-reg.c            |  2 +-
>  drivers/iio/gyro/mpu3050-i2c.c             |  2 +-
>  drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c  |  2 +-
>  drivers/media/dvb-frontends/af9013.c       |  2 +-
>  drivers/media/dvb-frontends/lgdt3306a.c    |  2 +-
>  drivers/media/dvb-frontends/m88ds3103.c    |  2 +-
>  drivers/media/dvb-frontends/rtl2830.c      |  2 +-
>  drivers/media/dvb-frontends/rtl2832.c      |  2 +-
>  drivers/media/dvb-frontends/si2168.c       |  2 +-
>  drivers/media/i2c/max9286.c                |  2 +-
>  drivers/media/usb/cx231xx/cx231xx-i2c.c    |  5 +----
>  drivers/of/unittest.c                      |  2 +-

Acked-by: Rob Herring (Arm) <robh@kernel.org>

>  include/linux/i2c-mux.h                    |  3 +--
>  23 files changed, 23 insertions(+), 49 deletions(-)
