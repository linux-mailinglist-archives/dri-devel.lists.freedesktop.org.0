Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F08356ABEBF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:52:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3520B10E2DC;
	Mon,  6 Mar 2023 11:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B654710E26B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 11:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678103520; x=1709639520;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+vJI7YuA2cKvI0b1Mt8oP5n5z7Z9J/WAV96Z+3jwwp0=;
 b=h6VLMXUkcb7ZyF1qUImBXYd+gNsxHDNf6QXc1plhRvw7wIwjy5UDHB6C
 dL8iNi0Zv16Fb7DV5ci+LfxR9PcZfq852YT+OKBSev0dbuIY642U8YPEh
 DMmzSnougUEqxDWLjonITO0N+8+yzH4Ol/pvlLy09q//UNN+8fTUaTqU8
 35g5W+e1/ShgHJJxW0QQYya4eVDXnGpEeBsloyLMbb6GH55b82B9GBi7+
 c7KP8K2H26Gmm4aj2YE8GgLQeDOA3Kt1t4C63S8gX5uYv2VopI7MixWXo
 /nvHaazWPQXigcBQwp2nbZIy9GL2x8Q1S1bJeFmAx7h9c0JRtQ0yYmKZ6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="421805992"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="421805992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="678444901"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="678444901"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga007.fm.intel.com with ESMTP; 06 Mar 2023 03:51:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pZ9NY-00GKgD-22; Mon, 06 Mar 2023 13:51:44 +0200
Date: Mon, 6 Mar 2023 13:51:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v13 05/10] drm/bridge: anx7625: Check for Type-C during
 panel registration
Message-ID: <ZAXT0JFjERb8Q36f@smile.fi.intel.com>
References: <20230303143350.815623-1-treapking@chromium.org>
 <20230303143350.815623-6-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230303143350.815623-6-treapking@chromium.org>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, Marek Vasut <marex@denx.de>,
 chrome-platform@lists.linux.dev, Robert Foss <rfoss@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-acpi@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 10:33:45PM +0800, Pin-yen Lin wrote:
> The output port endpoints can be connected to USB-C connectors.
> Running drm_of_find_panel_or_bridge() with such endpoints leads to
> a continuous return value of -EPROBE_DEFER, even though there is
> no panel present.
> 
> To avoid this, check for the existence of a "mode-switch" property in
> the port endpoint, and skip panel registration completely if so.

...

> +	port_node = of_graph_get_port_by_id(np, 1);
> +	count = typec_mode_switch_node_count(&port_node->fwnode);

Do you need to drop reference count here?
(I don't know myself, so, please check this)

If no, patch LGTM.

> +	if (count)
> +		return 0;

-- 
With Best Regards,
Andy Shevchenko


