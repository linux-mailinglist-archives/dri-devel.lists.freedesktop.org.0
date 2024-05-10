Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005098C1F55
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0549A10E36B;
	Fri, 10 May 2024 07:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Xo1NTgKJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D5210E36B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 07:55:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9736C61E32;
 Fri, 10 May 2024 07:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EE9C113CC;
 Fri, 10 May 2024 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1715327732;
 bh=NfCq0znA9xiQQKOgqCjjhCeBv5JL4GapTvi5dTTgNg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xo1NTgKJVcIRWizY4Moj56cCaQqKaTr4IAt9qxFmN4ftE2ovyUckVKIsaj6OQWTdN
 p86jCzWoCSRCCiTfMnXkXGX3NXMw08h66lE5PowpDhAXWq2u3Y+Z7pr5/8a4Fpw19p
 ndykkCosAuEu5zcVjtsTvIIljbS1e25t5ZhP5xMI=
Date: Fri, 10 May 2024 08:55:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Saravana Kannan <saravanak@google.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 =?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v2 5/5] misc: add ge-addon-connector driver
Message-ID: <2024051039-decree-shrimp-45c6@gregkh>
References: <20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com>
 <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510-hotplug-drm-bridge-v2-5-ec32f2c66d56@bootlin.com>
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

On Fri, May 10, 2024 at 09:10:41AM +0200, Luca Ceresoli wrote:
> Add a driver to support the runtime hot-pluggable add-on connector on the
> GE SUNH device. This connector allows connecting and disconnecting an
> add-on to/from the main device to augment its features. Connection and
> disconnection can happen at runtime at any moment without notice.
> 
> Different add-on models can be connected, and each has an EEPROM with a
> model identifier at a fixed address.
> 
> The add-on hardware is added and removed using device tree overlay loading
> and unloading.
> 
> Co-developed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This commit is new in v2.
> ---
>  MAINTAINERS                      |   1 +
>  drivers/misc/Kconfig             |  15 ++
>  drivers/misc/Makefile            |   1 +
>  drivers/misc/ge-sunh-connector.c | 464 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 481 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 672c26372c92..0bdb4fc496b8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9905,6 +9905,7 @@ F:	drivers/iio/pressure/mprls0025pa*
>  HOTPLUG CONNECTOR FOR GE SUNH ADDONS
>  M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
>  S:	Maintained
> +F:	drivers/misc/ge-sunh-connector.c
>  F:	Documentation/devicetree/bindings/connector/ge,sunh-addon-connector.yaml
>  
>  HP BIOSCFG DRIVER
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index 4fb291f0bf7c..99ef2eccbbaa 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -574,6 +574,21 @@ config NSM
>  	  To compile this driver as a module, choose M here.
>  	  The module will be called nsm.
>  
> +config GE_SUNH_CONNECTOR
> +	tristate "GE SUNH hotplug add-on connector"
> +	depends on OF
> +	select OF_OVERLAY
> +	select FW_LOADER
> +	select NVMEM
> +	select DRM_HOTPLUG_BRIDGE

Can these be depends instead of select?  'select' causes dependencies
that are hard, if not almost impossible, to detect at times why
something is being enabled.

> +	help
> +	  Driver for the runtime hot-pluggable add-on connector on the GE SUNH
> +	  device. This connector allows connecting and disconnecting an add-on
> +	  to/from the main device to augment its features. Connection and
> +	  disconnection can be done at runtime at any moment without
> +	  notice. Different add-on models can be connected, and each has an EEPROM
> +	  with a model identifier at a fixed address.

Module name?


> +static void sunh_conn_reset(struct sunh_conn *conn, bool keep_reset)
> +{
> +	dev_dbg(conn->dev, "reset\n");

ftrace is your friend.

> +static int sunh_conn_handle_event(struct sunh_conn *conn, bool plugged)
> +{
> +	int err;
> +
> +	if (plugged == conn->plugged)
> +		return 0;
> +
> +	dev_info(conn->dev, "%s\n", plugged ? "connected" : "disconnected");

Please remove debugging code from stuff you want to see merged.

Same for all dev_info() calls here, when drivers work properly, they are
quiet.

thanks,

greg k-h
