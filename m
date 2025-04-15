Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4CCA89F4F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3BD10E78D;
	Tue, 15 Apr 2025 13:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EZ43ARME";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E164010E78D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:22:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A1DB2A4A179;
 Tue, 15 Apr 2025 13:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF09C4CEDD;
 Tue, 15 Apr 2025 13:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1744723346;
 bh=RRW47R1L7/5mlFWx4w8Iz2jOualfmecSBafClG5oO7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EZ43ARME0oN0cZwYNSw0w8v/oqZQVtsnKvLPa+61dXAl0xfbNV5WsjKmuwtYuqoWa
 l70CaLBbqw3lS1d6ftYnd0AdLEFRyxwRR+DBeVImrTw1HKryvX9nWAHdx2PRVrekSU
 0xPfp3YvGyuZ8Toq9mhyEA90JZvkFS5z9EL1gm1Y=
Date: Tue, 15 Apr 2025 15:22:24 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Danilo Krummrich <dakr@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025041506-unrented-props-6226@gregkh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <2025021938-swan-facedown-e96a@gregkh>
 <1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
 <2025041508-remix-plasma-cd47@gregkh>
 <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
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

On Tue, Apr 15, 2025 at 03:10:38PM +0200, Jerome Brunet wrote:
> On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
> >> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> >> 
> >> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> >> >> Add helper functions to create a device on the auxiliary bus.
> >> >> 
> >> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> >> >> the same code repeated in the different drivers.
> >> >> 
> >> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> >> >> Cc: Arnd Bergmann <arnd@arndb.de>
> >> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> >
> >> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> 
> >> Hey Greg,
> >> 
> >> Do you need me to do something else on this topic ?
> >
> > I don't know what tree it is going through, do you?  If you want me to
> > take in the driver-core tree, just let me know.
> 
> For patch #1, I think driver-core would be appropriate, unless there is
> something more specific for the auxiliary device support ?
> 
> I'll wait for this sink into an rc1, then resubmit the different driver
> changes to the appropriate tree, no rush.

Ok, will take just the first one then, thanks.

greg k-h
