Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D4069DF48
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 12:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC2610E3A3;
	Tue, 21 Feb 2023 11:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0377710E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676980265; x=1708516265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dA0UV9DVYzws8NY0piO2Q7OcBlhHBKKb6Y0abZOE/X0=;
 b=dEy9Cg8p1UAZJgIcv4X7J2Czpv3kJMUe9M0XL66zfRsWD4OQ6+MUHUz9
 8TzJqkBwc0U1m4d6/1orcx6TgQeR/SLzJVv981iTdqpr0e+tAhLFh8Ymw
 oHa0mjdKATGwfMJiwsGOQMN8YQI+2jKn1TkKoZLP9O9ICGtDiUahD9FUN
 2FRG1virPz6fLwiCUeWds345GtnQnzJAmp68LNAXJOLRoJl9EK/StMc5L
 SbSjaLtOgXO8gwpCIRJHraa6EU1bFr37KMzAm4gGGXFeP3hrGM2UubHl4
 pOcyRDQMs9yUo93Wet0nxDu6CuoioKzDBEOsx0HwTRcTHJZUcUOJK69ly g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="395092760"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="395092760"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2023 03:51:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="740377282"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; d="scan'208";a="740377282"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2023 03:50:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pURAb-009wL4-2S; Tue, 21 Feb 2023 13:50:53 +0200
Date: Tue, 21 Feb 2023 13:50:53 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v12 05/10] drm/bridge: anx7625: Check for Type-C during
 panel registration
Message-ID: <Y/SwHSmvvGekA1Ac@smile.fi.intel.com>
References: <20230221095054.1868277-1-treapking@chromium.org>
 <20230221095054.1868277-6-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221095054.1868277-6-treapking@chromium.org>
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
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Allen Chen <allen.chen@ite.com.tw>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Benson Leung <bleung@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, Prashant Malani <pmalani@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 21, 2023 at 05:50:49PM +0800, Pin-yen Lin wrote:
> The output port endpoints can be connected to USB-C connectors.
> Running drm_of_find_panel_or_bridge() with such endpoints leads to
> a continuous return value of -EPROBE_DEFER, even though there is
> no panel present.
> 
> To avoid this, check for the existence of a "mode-switch" property in
> the port endpoint, and skip panel registration completely if so.

...

> +	port_node = of_graph_get_port_by_id(np, 1);
> +	fwnode_for_each_typec_mode_switch(&port_node->fwnode, fwnode) {
> +		fwnode_handle_put(fwnode);
> +		return 0;
> +	}

With the proposed count API:

	unsigned int count;
	...
	port_node = ...
	count = typec_mode_switch_node_count(&port_node->fwnode);
	if (count == 0)
		return 0;

-- 
With Best Regards,
Andy Shevchenko


