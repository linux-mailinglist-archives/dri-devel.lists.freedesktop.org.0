Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A099583D9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 12:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD70510E691;
	Tue, 20 Aug 2024 10:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F7jftXz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7B810E6A0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 10:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724148889; x=1755684889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1E1wWLNgbFlbQn0FQcNz4VO9i1PXCs1SyYJirR9y25U=;
 b=F7jftXz6SSwZktN+LpAbOJonU1GaFttAeK2pZBG555eue2auQw9sIFoN
 vfbMD2lZ1a6QpRYUBYnGN12w2yviLTyJiBPocF7gx6xlxtsBnUVLu/6lk
 yjJxIkMtmBZWsC2H1S9EWs4ilQjpKG0GM/jG5thtMaAwUOUu/QbhCtfJY
 U8aokB+d+RNoLPhqILN817xE48uU0B3E/rhx25sVLAQV8XQVDBenDcfnS
 O0Hpd845+8C2r0JmgHLWlqABVrMa6TG8k7f3PWU/JjF5+DJBETkVTniNm
 Wwaj0iVWTLmTzLUvIPr6IM2cxDJ7bQEygEWFJdonw470kFb7mWJYYcqXB w==;
X-CSE-ConnectionGUID: ZwlnfvksQFmVEy6MTjGyow==
X-CSE-MsgGUID: s8xgyfTSRDGnDQusLWCmEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22574594"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22574594"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:14:48 -0700
X-CSE-ConnectionGUID: WVSUDWhsQh27s29v8SXEbQ==
X-CSE-MsgGUID: yY7H00bUQRa7ybSXTdMr2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60661938"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:14:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgLsq-0000000HG9s-2zFi; Tue, 20 Aug 2024 13:14:36 +0300
Date: Tue, 20 Aug 2024 13:14:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 04/17] usb: typec: Add device managed
 typec_mux_register()
Message-ID: <ZsRsjPwNQYWWGIXg@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-5-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819223834.2049862-5-swboyd@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 19, 2024 at 03:38:18PM -0700, Stephen Boyd wrote:
> Simplify driver error paths by adding devm_typec_mux_register() which
> will unregister the typec mux when the parent device is unbound.

> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: <linux-usb@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>

As per previous comment, move these after --- line
(hint: You may have it in your Git commit with --- line,
 it will be removed on the receiver side by `git am`)

...

> +/** devm_typec_mux_register - resource managed typec_mux_register()

Wrong comment style.

> + * @parent: Parent device
> + * @desc: Multiplexer description
> + *
> + * Register a typec mux and automatically unregister the typec mux
> + * when @parent is unbound from its driver.
> + *
> + * The arguments to this function are identical to typec_mux_register().
> + *
> + * Return: the typec_mux_dev structure on success, else an error pointer.
> + */
> +struct typec_mux_dev *
> +devm_typec_mux_register(struct device *parent, const struct typec_mux_desc *desc)
> +{
> +	struct typec_mux_dev **ptr, *mux_dev;
> +
> +	ptr = devres_alloc(devm_typec_mux_unregister, sizeof(*ptr), GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mux_dev = typec_mux_register(parent ,desc);
> +	if (!IS_ERR(mux_dev)) {
> +		*ptr = mux_dev;
> +		devres_add(parent, ptr);
> +	} else {
> +		devres_free(ptr);
> +	}

What does prevent you from using devm_add_action_or_reset()?

> +	return mux_dev;
> +}

-- 
With Best Regards,
Andy Shevchenko


