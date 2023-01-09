Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1683B66246D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4579310E3E7;
	Mon,  9 Jan 2023 11:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B7E10E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 11:42:04 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D04006602D66;
 Mon,  9 Jan 2023 11:42:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1673264523;
 bh=NbTiE9y32f/cs2nHXOmy1PoOgdwoRflnOn15GZ4u/iw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Z0X0qcckEa6SfOYaI3kGzfc3IcKXqxNE5NMoYT135HVUsXZUbg7CzPlnMcAWCz2pP
 jZSPsmdYn/fEWg5jL4hxLLtZ7FwljfLNPK936Og/rMJurniFrUwoEP/w2i3nznEmXg
 BpfI6CPwILoq7iT6nSu4NuZq1XScbtmAfAuSIYe9MCgbVJKp4CvCuniBRYVGhADOtd
 GUmbh6hI8AiCyQ35YX6mOgHi5Kn5Fe0gzJjowdclrGKpbtlRUTozvabnqVTIJ/NcYi
 NpUN9RhS47uNNrpF7aD+y6UoQCcY+DQVXhgZwRD8C6tjv2B1QytBDdw+8RC3Tu2ZBh
 1dGp4yMyORxUQ==
Message-ID: <023519eb-0adb-3b08-71b9-afb92a6cceaf@collabora.com>
Date: Mon, 9 Jan 2023 12:41:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v9 3/9] drm/display: Add Type-C switch helpers
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Prashant Malani <pmalani@chromium.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20230109084101.265664-1-treapking@chromium.org>
 <20230109084101.265664-4-treapking@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230109084101.265664-4-treapking@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 chrome-platform@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-acpi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/01/23 09:40, Pin-yen Lin ha scritto:
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
> 
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "data-lanes" properties are available in Device Tree.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> ---
> 
> (no changes since v8)
> 
> Changes in v8:
> - Fixed the build issue when CONFIG_TYPEC=m
> - Fixed some style issues
> 
> Changes in v7:
> - Extracted the common codes to a helper function
> - New in v7
> 
>   drivers/gpu/drm/display/drm_dp_helper.c | 132 ++++++++++++++++++++++++
>   include/drm/display/drm_dp_helper.h     |  16 +++
>   2 files changed, 148 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 16565a0a5da6..fb9e23744c08 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -30,11 +30,13 @@
>   #include <linux/sched.h>
>   #include <linux/seq_file.h>
>   #include <linux/string_helpers.h>
> +#include <linux/usb/typec_mux.h>
>   #include <linux/dynamic_debug.h>
>   
>   #include <drm/display/drm_dp_helper.h>
>   #include <drm/display/drm_dp_mst_helper.h>
>   #include <drm/drm_edid.h>
> +#include <drm/drm_of.h>
>   #include <drm/drm_print.h>
>   #include <drm/drm_vblank.h>
>   #include <drm/drm_panel.h>
> @@ -3891,3 +3893,133 @@ int drm_panel_dp_aux_backlight(struct drm_panel *panel, struct drm_dp_aux *aux)
>   EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
>   
>   #endif
> +
> +#if IS_REACHABLE(CONFIG_TYPEC)
> +static int drm_dp_register_mode_switch(struct device *dev, struct device_node *node,
> +				       struct drm_dp_typec_switch_desc *switch_desc,
> +				       void *data, void *mux_set)
> +{
> +	struct drm_dp_typec_port_data *port_data;
> +	struct typec_mux_desc mux_desc = {};
> +	char name[32];
> +	u32 dp_lanes[2];
> +	int ret, num_lanes, port_num = -1;
> +
> +	num_lanes = drm_of_get_data_lanes_count(node, 0, 2);
> +	if (num_lanes <= 0) {
> +		dev_err(dev, "Error on getting data lanes count: %d\n",
> +			num_lanes);
> +		return num_lanes;
> +	}
> +
> +	ret = of_property_read_u32_array(node, "data-lanes", dp_lanes, num_lanes);
> +	if (ret) {
> +		dev_err(dev, "Failed to read the data-lanes variable: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	port_num = dp_lanes[0] / 2;
> +
> +	port_data = &switch_desc->typec_ports[port_num];
> +	port_data->data = data;
> +	mux_desc.fwnode = &node->fwnode;
> +	mux_desc.drvdata = port_data;
> +	snprintf(name, sizeof(name), "%s-%u", node->name, port_num);
> +	mux_desc.name = name;
> +	mux_desc.set = mux_set;
> +
> +	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(port_data->typec_mux)) {

I would propose, instead...

> +		ret = PTR_ERR(port_data->typec_mux);
> +		dev_err(dev, "Mode switch register for port %d failed: %d\n",
> +			port_num, ret);

		return ret;

> +	}
> +
> +	return ret;

	return 0;

> +}
> +

...but I don't have strong opinions, so regardless of that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


