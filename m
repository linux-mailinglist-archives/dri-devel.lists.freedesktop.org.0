Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A91B322FDF1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606B46E0EB;
	Mon, 27 Jul 2020 23:32:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583D389CAD
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 18:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1595873043; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a8hnFBflIFs2SlnL6a+fKRKHJ7sn0cbnakResXbbUtA=;
 b=leOnkFjIl0aSA5iqFDCdj5b+p3adVmnkZKXJg0N7/xmPXnt3X1S6LDuqIngP9ozNT/YcJF
 P6k20aw9Hi23nRy1MU0vEYqq5ixwb8QF38FlpFaiwOiZyHF0VVzNXwlGknrghO+D8/MUYv
 G2qb4VceNxHI5vyBnhak5mccVGMdk/s=
Date: Mon, 27 Jul 2020 19:59:14 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/6] drm: dsi: Let host and device specify supported bus
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <QA35EQ.0IE6UXSOG224@crapouillou.net>
In-Reply-To: <20200727170245.GF17521@pendragon.ideasonboard.com>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-3-paul@crapouillou.net>
 <20200727170245.GF17521@pendragon.ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Le lun. 27 juil. 2020 =E0 20:02, Laurent Pinchart =

<laurent.pinchart@ideasonboard.com> a =E9crit :
> Hi Paul,
> =

> Thank you for the patch.
> =

> On Mon, Jul 27, 2020 at 06:46:09PM +0200, Paul Cercueil wrote:
>>  The current MIPI DSI framework can very well be used to support =

>> MIPI DBI
>>  panels. In order to add support for the various bus types supported =

>> by
>>  DBI, the DRM panel drivers should specify the bus type they will =

>> use,
>>  and the DSI host drivers should specify the bus types they are
>>  compatible with.
>> =

>>  The DSI host driver can then use the information provided by the =

>> DBI/DSI
>>  device driver, such as the bus type and the number of lanes, to
>>  configure its hardware properly.
>> =

>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   drivers/gpu/drm/drm_mipi_dsi.c |  9 +++++++++
>>   include/drm/drm_mipi_dsi.h     | 12 ++++++++++++
> =

> Use the mipi_dsi_* API for DBI panels will be very confusing to say =

> the
> least. Can we consider a global name refactoring to clarify all this ?

I was thinking that this could be done when the code is cleaned up and =

drivers/gpu/drm/drm_mipi_dbi.c is removed. I'm scared of tree-wide =

patchsets.

-Paul

> =

>>   2 files changed, 21 insertions(+)
>> =

>>  diff --git a/drivers/gpu/drm/drm_mipi_dsi.c =

>> b/drivers/gpu/drm/drm_mipi_dsi.c
>>  index 5dd475e82995..11ef885de765 100644
>>  --- a/drivers/gpu/drm/drm_mipi_dsi.c
>>  +++ b/drivers/gpu/drm/drm_mipi_dsi.c
>>  @@ -281,6 +281,9 @@ int mipi_dsi_host_register(struct mipi_dsi_host =

>> *host)
>>   {
>>   	struct device_node *node;
>> =

>>  +	if (WARN_ON_ONCE(!host->bus_types))
>>  +		host->bus_types =3D MIPI_DEVICE_TYPE_DSI;
>>  +
>>   	for_each_available_child_of_node(host->dev->of_node, node) {
>>   		/* skip nodes without reg property */
>>   		if (!of_find_property(node, "reg", NULL))
>>  @@ -323,6 +326,12 @@ int mipi_dsi_attach(struct mipi_dsi_device =

>> *dsi)
>>   {
>>   	const struct mipi_dsi_host_ops *ops =3D dsi->host->ops;
>> =

>>  +	if (WARN_ON_ONCE(!dsi->bus_type))
>>  +		dsi->bus_type =3D MIPI_DEVICE_TYPE_DSI;
>>  +
>>  +	if (!(dsi->bus_type & dsi->host->bus_types))
>>  +		return -EINVAL;
>>  +
>>   	if (!ops || !ops->attach)
>>   		return -ENOSYS;
>> =

>>  diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
>>  index 360e6377e84b..65d2961fc054 100644
>>  --- a/include/drm/drm_mipi_dsi.h
>>  +++ b/include/drm/drm_mipi_dsi.h
>>  @@ -63,6 +63,14 @@ struct mipi_dsi_packet {
>>   int mipi_dsi_create_packet(struct mipi_dsi_packet *packet,
>>   			   const struct mipi_dsi_msg *msg);
>> =

>>  +/* MIPI bus types */
>>  +#define MIPI_DEVICE_TYPE_DSI		BIT(0)
>>  +#define MIPI_DEVICE_TYPE_DBI_SPI_MODE1	BIT(1)
>>  +#define MIPI_DEVICE_TYPE_DBI_SPI_MODE2	BIT(2)
>>  +#define MIPI_DEVICE_TYPE_DBI_SPI_MODE3	BIT(3)
>>  +#define MIPI_DEVICE_TYPE_DBI_M6800	BIT(4)
>>  +#define MIPI_DEVICE_TYPE_DBI_I8080	BIT(5)
>>  +
>>   /**
>>    * struct mipi_dsi_host_ops - DSI bus operations
>>    * @attach: attach DSI device to DSI host
>>  @@ -94,11 +102,13 @@ struct mipi_dsi_host_ops {
>>    * struct mipi_dsi_host - DSI host device
>>    * @dev: driver model device node for this DSI host
>>    * @ops: DSI host operations
>>  + * @bus_types: Bitmask of supported MIPI bus types
>>    * @list: list management
>>    */
>>   struct mipi_dsi_host {
>>   	struct device *dev;
>>   	const struct mipi_dsi_host_ops *ops;
>>  +	unsigned int bus_types;
>>   	struct list_head list;
>>   };
>> =

>>  @@ -162,6 +172,7 @@ struct mipi_dsi_device_info {
>>    * @host: DSI host for this peripheral
>>    * @dev: driver model device node for this peripheral
>>    * @name: DSI peripheral chip type
>>  + * @bus_type: MIPI bus type (MIPI_DEVICE_TYPE_DSI/...)
>>    * @channel: virtual channel assigned to the peripheral
>>    * @format: pixel format for video mode
>>    * @lanes: number of active data lanes
>>  @@ -178,6 +189,7 @@ struct mipi_dsi_device {
>>   	struct device dev;
>> =

>>   	char name[DSI_DEV_NAME_SIZE];
>>  +	unsigned int bus_type;
>>   	unsigned int channel;
>>   	unsigned int lanes;
>>   	enum mipi_dsi_pixel_format format;
> =

> --
> Regards,
> =

> Laurent Pinchart


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
