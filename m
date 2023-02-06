Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C455768BC6B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:08:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5810E3A3;
	Mon,  6 Feb 2023 12:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A5110E3A4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675685329; x=1707221329;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PHhUr6bTIj4SVIqBJK6w9MlO+XgeoEnM4g1JfRq405s=;
 b=l6+SmpkyKqt0jIykqyTT5AR/l/nw7ZpYQP48g/WDaZnHyziJUVI2LNEb
 8jJbOUM2clDUGQXVptxZX/xrPOS2KS083EEv5ok82xY9DFslCDrOq8AzH
 +zPDJpghZJe4G42u4zm00oP/04W/jZBFLEVsa4FPkST4rWCdqNwYwVRiU
 Ccw4rYr5OEB3JklpsJU5tUufnevQJ4v//CEh6xCgZh9eWbJZ0ydiMGKNV
 oUbrS3mCoGSK/7WqwfscUKeNUJpAACEg79agWtk8OsFEg74TXQbPiVBkW
 aKB0dHrVbT74L+80mRoQDSQQPYj7AMa2fKakSDLfxhj2cKUPcfdgYHj8f Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="393788147"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="393788147"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 04:08:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="911902275"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="911902275"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga006.fm.intel.com with ESMTP; 06 Feb 2023 04:08:38 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pP0IV-003AAC-00; Mon, 06 Feb 2023 14:08:35 +0200
Date: Mon, 6 Feb 2023 14:08:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v11 3/9] drm/display: Add Type-C switch helpers
Message-ID: <Y+Dtwm39cGQO58xa@smile.fi.intel.com>
References: <20230204133040.1236799-1-treapking@chromium.org>
 <20230204133040.1236799-4-treapking@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204133040.1236799-4-treapking@chromium.org>
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 =?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jani Nikula <jani.nikula@intel.com>,
 Allen Chen <allen.chen@ite.com.tw>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Xin Ji <xji@analogixsemi.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Daniel Scally <djrscally@gmail.com>,
 Prashant Malani <pmalani@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 04, 2023 at 09:30:34PM +0800, Pin-yen Lin wrote:
> Add helpers to register and unregister Type-C "switches" for bridges
> capable of switching their output between two downstream devices.
> 
> The helper registers USB Type-C mode switches when the "mode-switch"
> and the "reg" properties are available in Device Tree.

...

> +	fwnode_for_each_child_node(port, sw) {
> +		if (fwnode_property_present(sw, "mode-switch"))

This idiom is being used at least twice (in this code, haven't checked the rest
of the patches, though), perhaps

#define fwnode_for_each_typec_mode_switch(port, sw)			\
	fwnode_for_each_child_node(port, sw)				\
		if (!fwnode_property_present(sw, "mode-switch")) {} else

?

-- 
With Best Regards,
Andy Shevchenko


