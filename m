Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFAB0A3BB43
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 11:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18BAD10E7AE;
	Wed, 19 Feb 2025 10:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LHj7SUL6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB9510E7B0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 10:13:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9B9E25C4D90;
 Wed, 19 Feb 2025 10:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40B3C4CED1;
 Wed, 19 Feb 2025 10:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739959997;
 bh=fMTgCZ4pkvP3/QIoF7iwpCmqEdcG6A1koNbMDvsj2dk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LHj7SUL6hr9dnxeuMouAoZl+TqgPJkJnt6OxeGZBVnwjG1an8QfGZTZhAz67SUNMi
 V5LaRH/n8f0+cZvr3kZbgPWLsV3MQceZE5n+wYuzRWmC4ZHELcec25299VKUrxRVkD
 lwg+grq7xKKnKHBmMBQEKZrZR5rJUGwcEwJFWwx8=
Date: Wed, 19 Feb 2025 11:13:14 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
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
Message-ID: <2025021922-spongy-swirl-0746@gregkh>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
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

On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > Add helper functions to create a device on the auxiliary bus.
> > 
> > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > the same code repeated in the different drivers.
> > 
> > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/auxiliary_bus.h |  17 +++++++
> >  2 files changed, 125 insertions(+)
> > 
> > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > --- a/drivers/base/auxiliary.c
> > +++ b/drivers/base/auxiliary.c
> > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> >  }
> >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> >  
> > +static void auxiliary_device_release(struct device *dev)
> > +{
> > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > +
> > +	kfree(auxdev);
> > +}
> > +
> > +/**
> > + * auxiliary_device_create - create a device on the auxiliary bus
> > + * @dev: parent device
> > + * @modname: module name used to create the auxiliary driver name.
> > + * @devname: auxiliary bus device name
> > + * @platform_data: auxiliary bus device platform data
> > + * @id: auxiliary bus device id
> > + *
> > + * Helper to create an auxiliary bus device.
> > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > + */
> > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > +						 const char *modname,
> > +						 const char *devname,
> > +						 void *platform_data,
> > +						 int id)
> > +{
> > +	struct auxiliary_device *auxdev;
> > +	int ret;
> > +
> > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > +	if (!auxdev)
> > +		return NULL;
> > +
> > +	auxdev->id = id;
> > +	auxdev->name = devname;
> > +	auxdev->dev.parent = dev;
> > +	auxdev->dev.platform_data = platform_data;
> > +	auxdev->dev.release = auxiliary_device_release;
> > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > +
> > +	ret = auxiliary_device_init(auxdev);
> > +	if (ret) {
> > +		kfree(auxdev);
> > +		return NULL;
> > +	}
> > +
> > +	ret = __auxiliary_device_add(auxdev, modname);
> > +	if (ret) {
> 
> This loses possible error return values from __auxiliary_device_add().

Why does that really matter?

> I'd suggest to return ERR_PTR(ret) here and in the
> auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
> failure.

Will the caller do something different based on the error value here?
All we care is that this worked or not, the specific error isn't going
to matter for device creation like this.

thanks,

greg k-h
