Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A26A3BDCA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 13:08:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD1810E7BB;
	Wed, 19 Feb 2025 12:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U3VwlWPY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C5010E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 12:08:27 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5452ca02bdbso4886787e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 04:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739966905; x=1740571705; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
 b=U3VwlWPYImv+4hYoo1wtUWftvbmblqzbw56FD0oww6sCECcUrAfiyXYtx/Nsz1LwpI
 XOOokfvPozT7uF20SVFkAT19oKwfnP4p6MkhsJizD8+9EVZA7O+v9HTCASwe2rSmJQ+U
 8cQFDeQ+BCKZr0GvVPDkWB4tzi5+spG3nxHDjSjpliKIwQj3WsxdB/aoIRrtAkl9g+A7
 gRxft9irMUH/4kCO842fQYDFqCFBMrYVKJwLx5IgarqhHV8nEQsdUQwgS/8Mw68rrDBf
 ePysOYiCpMm2+BZYrfTPXlNREg+KnIBqKX+DExqWdzlJWd3GganyjCk1F57rQUHb6Jxl
 x4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739966905; x=1740571705;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfNES95aCHrH5DW7HOssGE1cf0vTi0kl2N0MBpHNSOY=;
 b=T8NY9F8OVhDFxL5Nnz3s2uPNLdzo7EcS9w6NEAHYlrQT5PFVCblTTlhPTLoM8Txw8b
 2du/WHWpnPP0uTQ/sA1Et5CtOtUI3B0s12EAOqt7+E86oAU42t6ULSjNEoOdtyXOIV0k
 0Qjm/DUAbi+ELGmP+n7wHqf0eb9o8L7C5C306RmuaSls+Ym3jNL+aKaVb6inX4vzf3SR
 IFgzEusNm6sIU3eGr7JOb3cv/20RsSaQ4uASGik29HziXzbddBIeuVvPwlCCwl4Mtc/F
 0aYuxxFsnDbpvGbcb9Ry2hWWsdX3lQZOwwcFLDL9pZBhRAQUA+tM/17b7HlltUfryNnC
 Zv2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsy8pN9H4B5D+tHt3we8KQxN4oxyyOvqVMS/Uvo7zyZc+7bl8SAGWfPaEg1BFcXyun1Tqgag5BzMk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0xxIv7OFnFKKKfnTOqr6m6cWQLc2POnzNp97W7j8mJmTDB6zL
 cl7c9GqI+dJWE95BNOqF17C4jKBcZuL7ZetaOfOGACBJxXEBlta4gmuIFSxIOiA=
X-Gm-Gg: ASbGncuQRyOfrbfXY384ePoQIAKJZqDATik9mcPDsN/C8PiT+3qQBtolrxRhSjTAF4n
 8SpYu5TuX5cQjrh0/kvdCLWq1e4SUO/PXE7KM8TzO10TUFdiNcUqujBw0BH4qjd0j4WQrtt/5PQ
 CBehEWm2K69DNfLl7iGjp/WQjq8ZyFvff2/6GmQp3xzxHxi19e4Q8Vxnq0P/eM1XWKbw2Qd+Mln
 1aeClS/Dhajzmox/4M8dEMyxGV4YLE+16ticdlftouUfGwWs0ViHoPxJg5XXdgH5372gBgWUic2
 ZNlMwmWEDn0LHLZfS1xM3xV9zY4fYX+xY6zrr4pvIhFNTHJlmx7pOvIK/I1fb8msuVcljyk=
X-Google-Smtp-Source: AGHT+IFMLOpDHMHA4h3/Gxx2zV0fjSL0lgJbRphbGzyITSKOMSUgTcKxT5mQ7K/tT3lwL8tk5JoMMA==
X-Received: by 2002:ac2:4e05:0:b0:545:62c:4b29 with SMTP id
 2adb3069b0e04-5452fe5bedcmr6706804e87.22.1739966905285; 
 Wed, 19 Feb 2025 04:08:25 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461cfdd5a2sm1148260e87.39.2025.02.19.04.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:08:24 -0800 (PST)
Date: Wed, 19 Feb 2025 14:08:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Danilo Krummrich <dakr@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, 
 platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <eskvhtljnrkhm6vmqy52gkweexj3tcethejeywcoib4la72jcl@ojuqcazpvht4>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
 <crtrciitrlqkxh5mxvnbdjy6zoxny5onse7xgbw7biozg6myux@grp3ketgl2uh>
 <2025021922-spongy-swirl-0746@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025021922-spongy-swirl-0746@gregkh>
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

On Wed, Feb 19, 2025 at 11:13:14AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Feb 19, 2025 at 11:06:02AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
> > > Add helper functions to create a device on the auxiliary bus.
> > > 
> > > This is meant for fairly simple usage of the auxiliary bus, to avoid having
> > > the same code repeated in the different drivers.
> > > 
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> > > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > > ---
> > >  drivers/base/auxiliary.c      | 108 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/auxiliary_bus.h |  17 +++++++
> > >  2 files changed, 125 insertions(+)
> > > 
> > > diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> > > index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..a6d46c2759be81a0739f07528d5959c2a76eb8a8 100644
> > > --- a/drivers/base/auxiliary.c
> > > +++ b/drivers/base/auxiliary.c
> > > @@ -385,6 +385,114 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
> > >  }
> > >  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
> > >  
> > > +static void auxiliary_device_release(struct device *dev)
> > > +{
> > > +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> > > +
> > > +	kfree(auxdev);
> > > +}
> > > +
> > > +/**
> > > + * auxiliary_device_create - create a device on the auxiliary bus
> > > + * @dev: parent device
> > > + * @modname: module name used to create the auxiliary driver name.
> > > + * @devname: auxiliary bus device name
> > > + * @platform_data: auxiliary bus device platform data
> > > + * @id: auxiliary bus device id
> > > + *
> > > + * Helper to create an auxiliary bus device.
> > > + * The device created matches driver 'modname.devname' on the auxiliary bus.
> > > + */
> > > +struct auxiliary_device *auxiliary_device_create(struct device *dev,
> > > +						 const char *modname,
> > > +						 const char *devname,
> > > +						 void *platform_data,
> > > +						 int id)
> > > +{
> > > +	struct auxiliary_device *auxdev;
> > > +	int ret;
> > > +
> > > +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> > > +	if (!auxdev)
> > > +		return NULL;
> > > +
> > > +	auxdev->id = id;
> > > +	auxdev->name = devname;
> > > +	auxdev->dev.parent = dev;
> > > +	auxdev->dev.platform_data = platform_data;
> > > +	auxdev->dev.release = auxiliary_device_release;
> > > +	device_set_of_node_from_dev(&auxdev->dev, dev);
> > > +
> > > +	ret = auxiliary_device_init(auxdev);
> > > +	if (ret) {
> > > +		kfree(auxdev);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	ret = __auxiliary_device_add(auxdev, modname);
> > > +	if (ret) {
> > 
> > This loses possible error return values from __auxiliary_device_add().
> 
> Why does that really matter?

At the very least the caller (or caller of a caller) can call
dev_err_probe() or dev_err("%pe"). With the current implementation as
everybody maps NULL to -ENOMEM the error message will be cryptic.

Or just having a cryptic value in the logs.

> > I'd suggest to return ERR_PTR(ret) here and in the
> > auxiliary_device_init() chunks and ERR_PTR(-ENOMEM) in case of kzalloc()
> > failure.
> 
> Will the caller do something different based on the error value here?
> All we care is that this worked or not, the specific error isn't going
> to matter for device creation like this.

The caller might not, the developer might.

-- 
With best wishes
Dmitry
