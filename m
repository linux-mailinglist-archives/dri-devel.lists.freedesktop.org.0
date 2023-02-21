Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E6E69DF3F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 12:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2398C10E31D;
	Tue, 21 Feb 2023 11:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E35310E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676980117; x=1708516117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CUAx3128p+wcaUqqwGRKUOEkNdn9/lm8qFQQoeWtsK8=;
 b=N9KVEOCAO0YpGXjkkz74c3iTGHJDIaqkTmQhu1RkpR3vrRSnrovCA2Es
 7G/PRy06pokMBsKu9LBdHAc47VLAMwW3xXwzdfCSAh0sRSdrqtbDJN42W
 8E1p4yFdUwfiIC51TDrvpOQmqamWtWTgHSRuGZM6j9reELfOEMQtJa5dJ
 RSi+xobmsV48qj0RDZcigJOFp17fx2Vv9woU+RxJTLHVfaXot7eWhxvjJ
 P0X9mxn6PMLOSDsIiBeNmWwUmWw+Yh6bpRTXbpYDFTQRM7/2XOFqSrUWY
 QoHL8ev+EhKy2idB5kmvSYunqks9MV3UN03v4/T3ZDipGT+lSCFw6tMyx g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="332616855"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="332616855"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 03:48:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="795498978"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="795498978"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga004.jf.intel.com with ESMTP; 21 Feb 2023 03:48:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pUR8B-009wIJ-2y; Tue, 21 Feb 2023 13:48:23 +0200
Date: Tue, 21 Feb 2023 13:48:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v12 03/10] drm/display: Add Type-C switch helpers
Message-ID: <Y/SvhxgjTM2cYZa+@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-4-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221095054.1868277-4-treapking@chromium.org>
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
 Robert Foss <rfoss@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, devicetree@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Benson Leung <bleung@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 05:50:47PM +0800, Pin-yen Lin wrote:
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
> 
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "reg" properties are available in Device Tree.
> 
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

...

> +	fwnode_for_each_typec_mode_switch(port, sw)
> +		switch_desc->num_typec_switches++;
> +
> +	if (!switch_desc->num_typec_switches) {
> +		dev_dbg(dev, "No Type-C switches node found\n");
> +		return 0;
> +	}

What about

static inline unsigned int typec_mode_switch_node_count(... *port)
{
	... *sw;
	unsigned int count = 0;

	for_each_typec_mode_switch_node(port, sw)
		count++;

	return count;
}


And then it seems something like

	unsigned int count;

	count = typec_mode_switch_node_count(port);
	if (!count) {
		...
	}

	_switches = count;

...

> +	switch_desc->typec_ports = devm_kcalloc(
> +		dev, switch_desc->num_typec_switches,

Strange indentation.

> +		sizeof(struct drm_dp_typec_port_data), GFP_KERNEL);

> +

Redundant blank line.

> +	if (!switch_desc->typec_ports)
> +		return -ENOMEM;

...

> +void drm_dp_unregister_typec_switches(struct drm_dp_typec_switch_desc *switch_desc)
> +{
> +	int i;

unsigned?

> +	for (i = 0; i < switch_desc->num_typec_switches; i++)
> +		typec_mux_unregister(switch_desc->typec_ports[i].typec_mux);
> +}

...

>  #include <linux/delay.h>
>  #include <linux/i2c.h>
> +#include <linux/usb/typec_mux.h>

I don't see users of this.
But a few forward declarations are missing.

>  #include <drm/display/drm_dp.h>
>  #include <drm/drm_connector.h>

...

> +#define fwnode_for_each_typec_mode_switch(port, sw)	\
> +	fwnode_for_each_child_node((port), (sw))	\
> +		for_each_if(fwnode_property_present((sw), "mode-switch"))

Please don't use fwnode namespace (see above), something like

#define for_each_typec_mode_switch_node(port, sw)	\
	...

-- 
With Best Regards,
Andy Shevchenko


