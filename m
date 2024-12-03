Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3D9E1F13
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFCF10EA23;
	Tue,  3 Dec 2024 14:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1OZEWXx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840DA10EA23
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733235974; x=1764771974;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uMWXhqZwProDmwOA4vHMhW1QbQjGRI1y8AQlSmfmBzk=;
 b=f1OZEWXxDYVg7A/GwGJ46W4YKQc/SMZbs53+LqT50tdqCYh8h2AuhyGh
 mwA7hX9RTIbSpUff+xArFQf458ySRg2kHER7V/nmzXClhyIaAIBwACgNT
 koKyxH8ZhlC2O0PR2opTf5dHcw9rS4I01VtZmgHboqc6FixwO/ANg0QI2
 M9ePnI1Yy3nwCfLTR73nGGNcmr8u++JklcWmEvGM3o+FOt7StbbD5p0SM
 rFvifZJnUdjz5tIOAXlgTP4FK5P9GjzdH/b0shWJJtmyP0MtKAbmK1oiV
 vkTBkSF/rVP0/IaKssgHp8hI35t/o4Edym8wGILmWXCuXx4WPHfWPMa7u w==;
X-CSE-ConnectionGUID: 6FW69SrmTiGW/t1a67PHmA==
X-CSE-MsgGUID: JAF4+WcWTP+HqY7ms3c0zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44480678"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="44480678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:26:13 -0800
X-CSE-ConnectionGUID: aDPdg6NdRb+ONzW7kLZxAQ==
X-CSE-MsgGUID: Tuwzy8/pRA2RVBUpHZa5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93328558"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 06:26:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
Date: Tue, 03 Dec 2024 16:25:58 +0200
Message-ID: <87a5dc4zd5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Extend drm_bridge_connector code to read the EDID and use it to update
> connector status if the bridge chain implements HDMI bridge. Performing
> it from the generic location minimizes individual bridge's code and
> enforces standard behaviour from all corresponding drivers.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
>  
> @@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>   * Bridge Connector Functions
>   */
>  
> +static const struct drm_edid *
> +drm_bridge_connector_read_edid(struct drm_connector *connector,
> +			       enum drm_connector_status status)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	const struct drm_edid *drm_edid;
> +	struct drm_bridge *bridge;
> +
> +	bridge = bridge_connector->bridge_edid;
> +	if (!bridge)
> +		return NULL;
> +
> +	if (status != connector_status_connected)
> +		return NULL;
> +
> +	drm_edid = drm_bridge_edid_read(bridge, connector);
> +	if (!drm_edid_valid(drm_edid)) {

What's the case this check is for?

My preference would be that bridge->funcs->edid_read() uses
drm_edid_read*() family of functions that do the checks and return the
EDID.

There are some cases that just allocate a blob and return it. Would be
nice if they could be converted, but in the mean time could use
drm_edid_valid() right there. Additional validity checks are redundant.

BR,
Jani.


> +		drm_edid_free(drm_edid);
> +		return NULL;
> +	}
> +
> +	return drm_edid;
> +}
> +
>  static enum drm_connector_status
>  drm_bridge_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
>  	struct drm_bridge *detect = bridge_connector->bridge_detect;
> +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
>  	enum drm_connector_status status;
>  
>  	if (detect) {
>  		status = detect->funcs->detect(detect);
>  
> +		if (hdmi) {
> +			const struct drm_edid *drm_edid;
> +			int ret;
> +
> +			drm_edid = drm_bridge_connector_read_edid(connector, status);
> +			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> +			if (ret)
> +				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
> +
> +			drm_edid_free(drm_edid);
> +		}
> +
>  		drm_bridge_connector_hpd_notify(connector, status);
>  	} else {
>  		switch (connector->connector_type) {
> @@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
>  static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>  					       struct drm_bridge *bridge)
>  {
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
>  	enum drm_connector_status status;
>  	const struct drm_edid *drm_edid;
> -	int n;
>  
>  	status = drm_bridge_connector_detect(connector, false);
>  	if (status != connector_status_connected)
> -		goto no_edid;
> +		return 0;
>  
> -	drm_edid = drm_bridge_edid_read(bridge, connector);
> -	if (!drm_edid_valid(drm_edid)) {
> +	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
> +	if (!hdmi) {
> +		drm_edid = drm_bridge_connector_read_edid(connector, status);
> +		if (!drm_edid) {
> +			drm_edid_connector_update(connector, NULL);
> +			return 0;
> +		}
> +
> +		drm_edid_connector_update(connector, drm_edid);
>  		drm_edid_free(drm_edid);
> -		goto no_edid;
>  	}
>  
> -	drm_edid_connector_update(connector, drm_edid);
> -	n = drm_edid_connector_add_modes(connector);
> -
> -	drm_edid_free(drm_edid);
> -	return n;
> -
> -no_edid:
> -	drm_edid_connector_update(connector, NULL);
> -	return 0;
> +	return drm_edid_connector_add_modes(connector);
>  }
>  
>  static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
Jani Nikula, Intel
