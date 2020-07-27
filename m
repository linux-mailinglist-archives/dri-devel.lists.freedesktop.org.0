Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F3122F5F0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 19:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1404389D60;
	Mon, 27 Jul 2020 17:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A2589D60
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 17:03:01 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C731556;
 Mon, 27 Jul 2020 19:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595869372;
 bh=BmUuid7qCzoWbedOU9sLebblb85wP/lsToqZ1PEAt7g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NK7YhBPigSjuPp+8tFWoURgc5JobClMElhBjG4x8/0HB1ty/e2Xrao9L3SD+DC6sv
 m8+PkL77ie+LOjD+mEWtHHyPmrAwZniDzQlw0vPssSlSdwCgdIv3vxmAEhGzJOj/0b
 sauWg5WMzGjPy7pRV1Xrucl5Y6ybdjam0Z2sNvuY=
Date: Mon, 27 Jul 2020 20:02:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/6] drm: dsi: Let host and device specify supported bus
Message-ID: <20200727170245.GF17521@pendragon.ideasonboard.com>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727164613.19744-3-paul@crapouillou.net>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 od@zcrc.me, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

Thank you for the patch.

On Mon, Jul 27, 2020 at 06:46:09PM +0200, Paul Cercueil wrote:
> The current MIPI DSI framework can very well be used to support MIPI DBI
> panels. In order to add support for the various bus types supported by
> DBI, the DRM panel drivers should specify the bus type they will use,
> and the DSI host drivers should specify the bus types they are
> compatible with.
> 
> The DSI host driver can then use the information provided by the DBI/DSI
> device driver, such as the bus type and the number of lanes, to
> configure its hardware properly.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/drm_mipi_dsi.c |  9 +++++++++
>  include/drm/drm_mipi_dsi.h     | 12 ++++++++++++

Use the mipi_dsi_* API for DBI panels will be very confusing to say the
least. Can we consider a global name refactoring to clarify all this ?

>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index 5dd475e82995..11ef885de765 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -281,6 +281,9 @@ int mipi_dsi_host_register(struct mipi_dsi_host *host)
>  {
>  	struct device_node *node;
>  
> +	if (WARN_ON_ONCE(!host->bus_types))
> +		host->bus_types = MIPI_DEVICE_TYPE_DSI;
> +
>  	for_each_available_child_of_node(host->dev->of_node, node) {
>  		/* skip nodes without reg property */
>  		if (!of_find_property(node, "reg", NULL))
> @@ -323,6 +326,12 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
>  {
>  	const struct mipi_dsi_host_ops *ops = dsi->host->ops;
>  
> +	if (WARN_ON_ONCE(!dsi->bus_type))
> +		dsi->bus_type = MIPI_DEVICE_TYPE_DSI;
> +
> +	if (!(dsi->bus_type & dsi->host->bus_types))
> +		return -EINVAL;
> +
>  	if (!ops || !ops->attach)
>  		return -ENOSYS;
>  
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 360e6377e84b..65d2961fc054 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -63,6 +63,14 @@ struct mipi_dsi_packet {
>  int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
>  			   const struct mipi_dsi_msg *msg);
>  
> +/* MIPI bus types */
> +#define MIPI_DEVICE_TYPE_DSI		BIT(0)
> +#define MIPI_DEVICE_TYPE_DBI_SPI_MODE1	BIT(1)
> +#define MIPI_DEVICE_TYPE_DBI_SPI_MODE2	BIT(2)
> +#define MIPI_DEVICE_TYPE_DBI_SPI_MODE3	BIT(3)
> +#define MIPI_DEVICE_TYPE_DBI_M6800	BIT(4)
> +#define MIPI_DEVICE_TYPE_DBI_I8080	BIT(5)
> +
>  /**
>   * struct mipi_dsi_host_ops - DSI bus operations
>   * @attach: attach DSI device to DSI host
> @@ -94,11 +102,13 @@ struct mipi_dsi_host_ops {
>   * struct mipi_dsi_host - DSI host device
>   * @dev: driver model device node for this DSI host
>   * @ops: DSI host operations
> + * @bus_types: Bitmask of supported MIPI bus types
>   * @list: list management
>   */
>  struct mipi_dsi_host {
>  	struct device *dev;
>  	const struct mipi_dsi_host_ops *ops;
> +	unsigned int bus_types;
>  	struct list_head list;
>  };
>  
> @@ -162,6 +172,7 @@ struct mipi_dsi_device_info {
>   * @host: DSI host for this peripheral
>   * @dev: driver model device node for this peripheral
>   * @name: DSI peripheral chip type
> + * @bus_type: MIPI bus type (MIPI_DEVICE_TYPE_DSI/...)
>   * @channel: virtual channel assigned to the peripheral
>   * @format: pixel format for video mode
>   * @lanes: number of active data lanes
> @@ -178,6 +189,7 @@ struct mipi_dsi_device {
>  	struct device dev;
>  
>  	char name[DSI_DEV_NAME_SIZE];
> +	unsigned int bus_type;
>  	unsigned int channel;
>  	unsigned int lanes;
>  	enum mipi_dsi_pixel_format format;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
