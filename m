Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169878D706F
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2024 16:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B5710E0A2;
	Sat,  1 Jun 2024 14:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="sXNBlm5r";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="FPI6mhQl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80A310E071
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oPiP+6Xv1rauIECXZ7PSRSg8wkxsNMowRof7mkzrmGE=;
 b=sXNBlm5ryO6M0p5a7pA1/4QYhsHRvE38MIidYWZOfWQeTs0FdE6QWI0LGwbLCW2xdPAfIJL3CBvxV
 q8Iu5tbSlIJj/59QIbQbHHK7pvWFSX3sqT55cIfuEuPHYEac11ZiBgNeQl8Pef+MhCLuf60bDS4KL4
 Q8P/mGQ9UGP57YyhZI4HrLID4vbYsxwcTFSvQbRKXSPnGIqeczO2itnIGmlq6Rd7xV2FQiFW0Mvbs7
 xZDoqDciCtpBvVILXpDig22SZm5LXC7BhJiDvLdbVONuvytkC/gVFAB9EEnT7jUjwUOEwq++qosN7G
 AaY0R8NIb4Ng+Mmf0Mr7o9SOJCycUbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=oPiP+6Xv1rauIECXZ7PSRSg8wkxsNMowRof7mkzrmGE=;
 b=FPI6mhQlC0kwcyQqIsi1QkIyx9Vj8DYZFZ2KTdLErhSprnjhhecaQvLK0h1HXbFwDA8NchK91faYb
 utsak4IBQ==
X-HalOne-ID: c44c843a-2023-11ef-b19f-79f4c2873f57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id c44c843a-2023-11ef-b19f-79f4c2873f57;
 Sat, 01 Jun 2024 14:32:28 +0000 (UTC)
Date: Sat, 1 Jun 2024 16:32:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>,
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
Message-ID: <20240601143226.GA2003970@ravnborg.org>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
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

Hi Cristian,

a few drive-by comments below.

	Sam


> +
> +static const struct drm_connector_funcs dw_hdmi_qp_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.detect = dw_hdmi_connector_detect,
> +	.destroy = drm_connector_cleanup,
> +	.force = dw_hdmi_qp_connector_force,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static int dw_hdmi_qp_bridge_attach(struct drm_bridge *bridge,
> +				    enum drm_bridge_attach_flags flags)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)
> +		return drm_bridge_attach(bridge->encoder, hdmi->next_bridge,
> +					 bridge, flags);
> +
> +	return dw_hdmi_connector_create(hdmi, &dw_hdmi_qp_connector_funcs);
> +}

Are there any users left that requires the display driver to create the
connector?
In other words - could this driver fail if DRM_BRIDGE_ATTACH_NO_CONNECTOR
is not passed and drop dw_hdmi_connector_create()?

I did not try to verify this - just a naive question.

> +
> +static enum drm_mode_status
> +dw_hdmi_qp_bridge_mode_valid(struct drm_bridge *bridge,
> +			     const struct drm_display_info *info,
> +			     const struct drm_display_mode *mode)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +	const struct dw_hdmi_plat_data *pdata = hdmi->plat_data;
> +	enum drm_mode_status mode_status = MODE_OK;
> +
> +	if (pdata->mode_valid)
> +		mode_status = pdata->mode_valid(hdmi, pdata->priv_data, info,
> +						mode);
> +
> +	return mode_status;
> +}
> +
> +static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
> +					     struct drm_bridge_state *old_state)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +	mutex_lock(&hdmi->mutex);
> +	hdmi->disabled = true;
> +	hdmi->curr_conn = NULL;
> +	dw_hdmi_qp_update_power(hdmi);
> +	dw_handle_plugged_change(hdmi, false);
> +	mutex_unlock(&hdmi->mutex);
> +}
> +
> +static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *old_state)
> +{
> +	struct dw_hdmi *hdmi = bridge->driver_private;
> +	struct drm_atomic_state *state = old_state->base.state;
> +	struct drm_connector *connector;
> +
> +	connector = drm_atomic_get_new_connector_for_encoder(state,
> +							     bridge->encoder);
> +
> +	mutex_lock(&hdmi->mutex);
> +	hdmi->disabled = false;
> +	hdmi->curr_conn = connector;
> +	dw_hdmi_qp_update_power(hdmi);
> +	dw_handle_plugged_change(hdmi, true);
> +	mutex_unlock(&hdmi->mutex);
> +}
> +
> +static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
> +	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset = drm_atomic_helper_bridge_reset,
> +	.attach = dw_hdmi_qp_bridge_attach,
> +	.detach = dw_hdmi_bridge_detach,
> +	.atomic_check = dw_hdmi_bridge_atomic_check,
> +	.atomic_enable = dw_hdmi_qp_bridge_atomic_enable,
> +	.atomic_disable = dw_hdmi_qp_bridge_atomic_disable,
> +	.mode_set = dw_hdmi_bridge_mode_set,

The use of mode_set is deprecated - see drm_bridge.h

