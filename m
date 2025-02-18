Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8508BA394CD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2151F10E630;
	Tue, 18 Feb 2025 08:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="f4mC4+xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC4B10E630
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 08:15:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D61D65C5BA3;
 Tue, 18 Feb 2025 08:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D0C4CEE2;
 Tue, 18 Feb 2025 08:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739866502;
 bh=UFdR7IbguGl7iKpceVwoQo+fFJc+Ocd7Dgzg0nOOeAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f4mC4+xjy8+3Ap3+zmCq4f4juZVPx3MmLXCA2pN+OuMHab5gaVtMq0RgIb/vmcIt4
 5pomyFm6UrsvIjuGwEbtdC0Cnn6HgTkNdbLBGtu/S6H3634IT4Qh8f1TMWeYpsxTMx
 HEiie4JkezV19OJAsaovd47Bq7gU0JDqjGhlceHw=
Date: Tue, 18 Feb 2025 09:14:59 +0100
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
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021826-smile-batting-e52f@gregkh>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
 <2025021437-washout-stonewall-d13e@gregkh>
 <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
 <2025021501-tamer-sank-142a@gregkh>
 <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1jikp8xx01.fsf@starbuckisacylon.baylibre.com>
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

On Mon, Feb 17, 2025 at 07:10:54PM +0100, Jerome Brunet wrote:
> On Sat 15 Feb 2025 at 07:53, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> [...]
> 
> >> 
> >> >
> >> >> +							int id)
> >> >> +{
> >> >> +	struct auxiliary_device *auxdev;
> >> >> +	int ret;
> >> >> +
> >> >> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> >> >> +	if (!auxdev)
> >> >> +		return ERR_PTR(-ENOMEM);
> >> >
> >> > Ick, who cares what the error value really is?  Why not just do NULL or
> >> > a valid pointer?  That makes the caller much simpler to handle, right?
> >> >
> >> 
> >> Sure why not
> 
> I have tried the 'NULL or valid' approach. In the consumers,
> which mostly return an integer from their various init function, I got
> this weird to come up with one from NULL. EINVAL, ENOMEM, etc ... can't
> really pick one.
> 
> It is actually easier to pass something along.

Ok, fair enough, thanks for trying.  But I would have returned just
-ENODEV in all cases, as that's what the end result was :)

thanks,

greg k-h
