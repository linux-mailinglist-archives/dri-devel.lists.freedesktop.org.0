Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AB696B6DB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:36:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7571010E71B;
	Wed,  4 Sep 2024 09:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JBmejodC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F81810E71B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:36:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 13D005C5492;
 Wed,  4 Sep 2024 09:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B08A4C4CEC6;
 Wed,  4 Sep 2024 09:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725442613;
 bh=MBwBMik3WdpeSRwdosVELrhielfxG8FEjRiwld/tWvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JBmejodC5PZ/bZIdUTxfbws8t13TO0dZx2NADVSzFiCdFZFONf/s5E9sIcxpk+JCj
 ATqP3UeW/yxC5clX1Ak7Yaw2th9C9qYdbNGKyDsxM5YEGWfx+CHKOTG10nyO9Z8kj8
 gAVqGaS7J/ed/cn3a4aQdjgY3JhaMrYopF5etv5xjpGUOGtHnV0hhCOF88BwO95epj
 +pv2ovc++y4PXoo4NLK7icGN2N9DDHJP/SUyAnmZR6d6OwnZBZhFaWyrsQKQRMjpzP
 c01rOWAS9ey3OIMv8vl1KhcWAyqBb2jWn7vPC8mvVlGCYQ+fLTEALKKSot5K9t+K2B
 JkDEuYjxYbDSQ==
Date: Wed, 4 Sep 2024 09:36:45 +0000
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
Subject: Re: [PATCH v4 18/18] platform/chrome: cros_ec_typec: Handle lack of
 HPD information
Message-ID: <ZtgqLZXbJbpG65vD@google.com>
References: <20240901040658.157425-1-swboyd@chromium.org>
 <20240901040658.157425-19-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240901040658.157425-19-swboyd@chromium.org>
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

On Sat, Aug 31, 2024 at 09:06:56PM -0700, Stephen Boyd wrote:
> +static void cros_typec_inject_hpd(struct cros_typec_data *typec,
> +				  struct ec_response_usb_pd_mux_info *resp,
> +				  struct cros_typec_port *port)
> +{
[...]
> +	/*
> +	 * Only read the mux GPIO setting if we need to change the active port.
> +	 * Otherwise, an active port is already set and HPD going high or low
> +	 * doesn't change the muxed port until DP mode is exited.
> +	 */
> +	if (!typec->active_dp_port) {

Given that cros_typec_inject_hpd() is called before `typec->active_dp_port`
would be set (from previous patch "platform/chrome: ...  Support DP muxing"),
would it possibly wrongly fall into here at the beginning?  (E.g.:
cros_typec_probe() -> cros_typec_port_update() -> cros_typec_configure_mux()
-> cros_typec_inject_hpd().)

> [...]
> +	/* Inject HPD from the GPIO state if EC firmware is broken. */
> +	if (typec->hpd_asserted)
> +		resp->flags |= USB_PD_MUX_HPD_LVL;

`typec->hpd_asserted` is shared between all typec->ports[...].  Would it be
possible that a HPD is asserted for another port but not current `port`?
E.g.: cros_typec_inject_hpd() for port 2 and cros_typec_dp_bridge_hpd_notify()
gets called due to port 1 at the same time?
