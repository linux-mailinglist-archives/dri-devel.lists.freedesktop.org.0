Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F50465F046
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:41:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2162710E094;
	Thu,  5 Jan 2023 15:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DC4A10E043
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672933294; x=1704469294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d4iSIbg1kqd9LpwkZrol2ctpuIJk0HeuCSrnRj6kN8U=;
 b=FaI/3LA9+se3TeYm81F2SyeTIU5qqWzfO6s6v7rkvCMqYgxhBUIMXLba
 9LlU+GlvaP5GYkRi+nOc3gzmxGVNUasnhyy7nkWB4BKW4pQwFyJdJacSR
 1PNuHIxg0ak/74InwfPxlXkkLzw70F37wMPNhw5DK3WfNCh1iIeK4aNRW
 p5iYg33IiMgapR+ZxrPIW0mGXVJnfM36jc9jYUp4yw11QSQUqhHT43GXb
 nS3DMUKDQGzWy12vLFHhgQdTpxcYpjwK9FAFgn15lR8Xkszcy020Z9530
 kosg+C3dxi5b0mCFQdDmsn1f8DIlv8+cYSniDHPynAI126nxfXIxnXe9C g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="319941839"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="319941839"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2023 07:41:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10580"; a="744308148"
X-IronPort-AV: E=Sophos;i="5.96,303,1665471600"; d="scan'208";a="744308148"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 05 Jan 2023 07:41:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pDSMm-004p6S-1s; Thu, 05 Jan 2023 17:41:16 +0200
Date: Thu, 5 Jan 2023 17:41:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v7 3/9] drm/display: Add Type-C switch helpers
Message-ID: <Y7bvnOLcuJvvp/v1@smile.fi.intel.com>
References: <20230105132457.4125372-1-treapking@chromium.org>
 <20230105132457.4125372-4-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105132457.4125372-4-treapking@chromium.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Kees Cook <keescook@chromium.org>,
 Marek Vasut <marex@denx.de>, chrome-platform@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 shaomin Deng <dengshaomin@cdjrlc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Khaled Almahallawy <khaled.almahallawy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 09:24:51PM +0800, Pin-yen Lin wrote:
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
> 
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "data-lanes" properties are available in Device Tree.

...

> +	port_data->typec_mux = typec_mux_register(dev, &mux_desc);
> +	if (IS_ERR(port_data->typec_mux)) {
> +		ret = PTR_ERR(port_data->typec_mux);
> +		dev_err(dev, "Mode switch register for port %d failed: %d\n",
> +			port_num, ret);
> +	}
> +
> +	return ret;

...

> +	struct device_node *sw;

> +	int ret = 0;

It's easy to break things if you squeeze more code in the future in this
function, so I recommend to split assignment to be closer to its first user
(see below).

> +	for_each_child_of_node(port, sw) {
> +		if (of_property_read_bool(sw, "mode-switch"))
> +			switch_desc->num_typec_switches++;
> +	}
> +
> +	if (!switch_desc->num_typec_switches) {
> +		dev_warn(dev, "No Type-C switches node found\n");

> +		return ret;

return 0;

> +	}
> +
> +	switch_desc->typec_ports = devm_kcalloc(
> +		dev, switch_desc->num_typec_switches,
> +		sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);
> +
> +	if (!switch_desc->typec_ports)
> +		return -ENOMEM;

> +	/* Register switches for each connector. */
> +	for_each_child_of_node(port, sw) {
> +		if (!of_property_read_bool(sw, "mode-switch"))
> +			continue;
> +		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
> +		if (ret) {
> +			dev_err(dev, "Failed to register mode switch: %d\n", ret);
> +			of_node_put(sw);
> +			break;
> +		}
> +	}

> +	if (ret)
> +		drm_dp_unregister_typec_switches(switch_desc);
> +
> +	return ret;

Why not adding a goto label?

		ret = drm_dp_register_mode_switch(dev, sw, switch_desc, data, mux_set);
		if (ret)
			goto err_unregister_typec_switches;

	return 0;

err_unregister_typec_switches:
	of_node_put(sw);
	drm_dp_unregister_typec_switches(switch_desc);
	dev_err(dev, "Failed to register mode switch: %d\n", ret);
	return ret;

-- 
With Best Regards,
Andy Shevchenko


