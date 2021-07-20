Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016843D0258
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 21:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75CA89C14;
	Tue, 20 Jul 2021 19:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A94989C14
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 19:54:03 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 3c6071eb-e994-11eb-9082-0050568c148b;
 Tue, 20 Jul 2021 19:54:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 43833194B7A;
 Tue, 20 Jul 2021 21:54:17 +0200 (CEST)
Date: Tue, 20 Jul 2021 21:53:59 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 05/10] drm/panel: Create attach and detach callbacks
Message-ID: <YPcp1y+obUwdshCG@ravnborg.org>
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-6-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720134525.563936-6-maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 03:45:20PM +0200, Maxime Ripard wrote:
> In order to make the probe order expectation more consistent between
> bridges, let's create attach and detach hooks for the panels as well to
> match what is there for bridges.

This is a partally revert of:
87154ff86bf6 ("drm: Remove unnecessary drm_panel_attach and drm_panel_detach")

The chanelog should say so - and please try to re-use the documentation
from the revert. We do not want non-documneted operations in
drm_panel_funcs.

	Sam

> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/drm_panel.c | 20 ++++++++++++++++++++
>  include/drm/drm_panel.h     |  6 ++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index f634371c717a..23bca798a2f3 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -223,6 +223,26 @@ int drm_panel_get_modes(struct drm_panel *panel,
>  }
>  EXPORT_SYMBOL(drm_panel_get_modes);
>  
> +int drm_panel_attach(struct drm_panel *panel)
> +{
> +	if (!panel)
> +		return -EINVAL;
> +
> +	if (panel->funcs && panel->funcs->attach)
> +		return panel->funcs->attach(panel);
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +void drm_panel_detach(struct drm_panel *panel)
> +{
> +	if (!panel)
> +		return;
> +
> +	if (panel->funcs && panel->funcs->detach)
> +		panel->funcs->detach(panel);
> +}
> +
>  #ifdef CONFIG_OF
>  /**
>   * of_drm_find_panel - look up a panel using a device tree node
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 4602f833eb51..b9201d520754 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -68,6 +68,9 @@ enum drm_panel_orientation;
>   * does not need to implement the functionality to enable/disable backlight.
>   */
>  struct drm_panel_funcs {
> +	int (*attach)(struct drm_panel *panel);
> +	void (*detach)(struct drm_panel *panel);
> +
>  	/**
>  	 * @prepare:
>  	 *
> @@ -180,6 +183,9 @@ void drm_panel_init(struct drm_panel *panel, struct device *dev,
>  void drm_panel_add(struct drm_panel *panel);
>  void drm_panel_remove(struct drm_panel *panel);
>  
> +int drm_panel_attach(struct drm_panel *panel);
> +void drm_panel_detach(struct drm_panel *panel);
> +
>  int drm_panel_prepare(struct drm_panel *panel);
>  int drm_panel_unprepare(struct drm_panel *panel);
>  
> -- 
> 2.31.1
