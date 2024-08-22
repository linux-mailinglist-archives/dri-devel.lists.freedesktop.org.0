Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B395B8A0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5343310EAF5;
	Thu, 22 Aug 2024 14:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ctOmC7Y9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC7710EAF5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:37:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E4E74A40493;
 Thu, 22 Aug 2024 14:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AA8C32782;
 Thu, 22 Aug 2024 14:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724337434;
 bh=ZkpJaD0BSKB4PQoNUPxvvmFUzWqr/hvDqpY1MhGCy+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ctOmC7Y9I5pctjwa+bfvcuJQnPKxeiOldkSiZey7L8AQjTgSHSocZlA+zCq72uwB3
 LWVTnaND1yi3ccNgiiz9wrc3Cals3TBSy4p7BVwYX94vzhmWuOJzOP3jmenujcCNcS
 bW5GDiO9y7HxNnxU5wTD9Dn/akgxr6wDJaGfWz0YZ3L12Hl+VyO7DwR2FVy+V8+pLs
 9P4wbYXFM3++q8YqIGml3T1hkx8NQfayBQw3YkMI4GniXfzrHxowf/b6Lci3uYP1Mh
 dw+8t2cS+cRA4FyWfmgXtOO3RiS5Gfx7MvRajOXarKVShQF4RViDrSa5HuO1tMNfId
 i19liD/cvcqFg==
Date: Thu, 22 Aug 2024 22:37:05 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 16/17] platform/chrome: cros_ec_typec: Support DP muxing
Message-ID: <ZsdNEWX-eeLiokZl@tzungbi-laptop>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-17-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819223834.2049862-17-swboyd@chromium.org>
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

On Mon, Aug 19, 2024 at 03:38:30PM -0700, Stephen Boyd wrote:
> @@ -671,6 +674,20 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
>  	if (port->mux_flags == resp.flags && port->role == pd_ctrl->role)
>  		return 0;
>  
> +	dp_enabled = resp.flags & USB_PD_MUX_DP_ENABLED;
> +	hpd_asserted = resp.flags & USB_PD_MUX_HPD_LVL;
> +	/*
> +	 * Assume the first port to have HPD asserted is the one muxed to DP
> +	 * (i.e. active_port). When there's only one port this delays setting
> +	 * the active_port until HPD is asserted, but before that the
> +	 * drm_connector looks disconnected so active_port doesn't need to be
> +	 * set.
> +	 */
> +	if (dp_bridge && hpd_asserted && !dp_bridge->active_port)
> +		dp_bridge->active_port = port;
> +
> +	is_active_port = !dp_bridge || dp_bridge->active_port == port;

Why `!dp_bridge`?  When will `dp_bridge` be NULL?
