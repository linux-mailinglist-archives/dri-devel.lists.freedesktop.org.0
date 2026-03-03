Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CUOMvMupmkrLwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 01:44:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1486D1E753A
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 01:44:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D22A10E61A;
	Tue,  3 Mar 2026 00:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="BErukP3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15566.qiye.163.com (mail-m15566.qiye.163.com
 [101.71.155.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BB010E609
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 00:44:30 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 358184f95;
 Tue, 3 Mar 2026 08:44:25 +0800 (GMT+08:00)
Message-ID: <601a8b51-7411-429d-91a1-0633cabce9ee@rock-chips.com>
Date: Tue, 3 Mar 2026 08:44:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 7/9] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20260119073100.143-1-kernel@airkyi.com>
 <20260119073100.143-8-kernel@airkyi.com>
 <DGSHIQOB2YTB.1559SD1YLGT7P@bootlin.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <DGSHIQOB2YTB.1559SD1YLGT7P@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9cb1273e3503abkunmaa7511f4175e64f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08ZQlYeTxhOTk1MHRlMQ0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=BErukP3PZLfd7iPLOHE1OrYRIoZtk8n+dgovKUYRJpsxSUOlDRe6bpmSXvw3Li5WLEIsAPXsUrBFxngxxrcMYnwCuN6xofRjSW3hTjSL8pbrVT0NyYVwQb7xw+eo4KDlSt+W57bbknfkB/lpXUMBMA4S0EkMQZVd/YI/KC7H1gk=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=9uY6r/CRTgiHhL2OQrx3GLqhCDAw3RLkVhh2o2P83uE=;
 h=date:mime-version:subject:message-id:from;
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
X-Rspamd-Queue-Id: 1486D1E753A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rock-chips.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[rock-chips.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[chaoyi.chen@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORGED_RECIPIENTS(0.00)[m:luca.ceresoli@bootlin.com,m:heikki.krogerus@linux.intel.com,m:gregkh@linuxfoundation.org,m:dmitry.baryshkov@oss.qualcomm.com,m:hzpeterchen@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:kishon@kernel.org,m:heiko@sntech.de,m:hjc@rock-chips.com,m:andy.yan@rock-chips.com,m:yubing.zhang@rock-chips.com,m:frank.wang@rock-chips.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:amitsd@google.com,m:chaoyi.chen@rock-chips.com,m:dsimic@manjaro.org,m:jbx6244@gmail.com,m:didi.debian@cknow.org,m:pbrobinson@gmail.com,m:linux-usb@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead
 .org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,kernel.org,sntech.de,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[rock-chips.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[chaoyi.chen@rock-chips.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Luca,

On 3/3/2026 1:49 AM, Luca Ceresoli wrote:
> On Mon Jan 19, 2026 at 8:30 AM CET, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>> the CDN-DP can be switched to output to one of the PHYs. If both ports
>> are plugged into DP, DP will select the first port for output.
>>
>> This patch adds support for multiple bridges, enabling users to flexibly
>> select the output port. For each PHY port, a separate encoder and bridge
>> are registered.
>>
>> The change is based on the DRM AUX HPD bridge, rather than the
>> extcon approach. This requires the DT to correctly describe the
>> connections between the first bridge in bridge chain and DP
>> controller. For example, the bridge chain may be like this:
>>
>> PHY aux birdge -> fsa4480 analog audio switch bridge ->
>> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>>
>> In this case, the connection relationships among the PHY aux bridge
>> and the DP contorller need to be described in DT.
>>
>> In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
>> determines whether to register one or two bridges.
>>
>> Since there is only one DP controller, only one of the PHY ports can
>> output at a time. The key is how to switch between different PHYs,
>> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>>
>> There are two cases:
>>
>> 1. Neither bridge is enabled. In this case, both bridges can
>> independently read the EDID, and the PHY port may switch before
>> reading the EDID.
>>
>> 2. One bridge is already enabled. In this case, other bridges are not
>> allowed to read the EDID. So we will try to return the cached EDID.
>>
>> Since the scenario of two ports plug in at the same time is rare,
>> I don't have a board which support two TypeC connector to test this.
>> Therefore, I tested forced switching on a single PHY port, as well as
>> output using a fake PHY port alongside a real PHY port.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> (no changes since v11)
>>
>> Changes in v10:
>> - Fix refcount usage of drm_bridge.
>> - Remove unused cdn_dp_next_bridge type.
>>
>> Changes in v9:
>> - Select DRM_AUX_HPD_BRIDGE when using DP driver.
>>
>> (no changes since v7)
>>
>> Changes in v6:
>> - Rename some variable names.
>> - Attach the DP bridge to the next bridge.
>>
>> Changes in v5:
>> - By parsing the HPD bridge chain, set the connector's of_node to the
>> of_node corresponding to the USB-C connector.
>> - Return EDID cache when other port is already enabled.
>> ---
>>
>>  drivers/gpu/drm/rockchip/Kconfig       |   1 +
>>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 325 ++++++++++++++++++++-----
>>  drivers/gpu/drm/rockchip/cdn-dp-core.h |  18 +-
>>  3 files changed, 287 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index b7b025814e72..10d9f29a3d44 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -56,6 +56,7 @@ config ROCKCHIP_CDN_DP
>>  	select DRM_DISPLAY_HELPER
>>  	select DRM_BRIDGE_CONNECTOR
>>  	select DRM_DISPLAY_DP_HELPER
>> +	select DRM_AUX_HPD_BRIDGE
>>  	help
>>  	  This selects support for Rockchip SoC specific extensions
>>  	  for the cdn DP driver. If you want to enable Dp on
>> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> index 1e27301584a4..0bc3d248c266 100644
>> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>> @@ -27,16 +27,17 @@
>>  #include "cdn-dp-core.h"
>>  #include "cdn-dp-reg.h"
>>
>> -static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
>> +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
>> +			      struct cdn_dp_port *port);
>> +
>> +static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
>>  {
>> -	return container_of(bridge, struct cdn_dp_device, bridge);
>> +	return container_of(bridge, struct cdn_dp_bridge, bridge);
>>  }
>>
>> -static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
>> +static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
>>  {
>> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>> -
>> -	return container_of(rkencoder, struct cdn_dp_device, encoder);
>> +	return bridge_to_dp_bridge(bridge)->parent;
>>  }
>>
>>  #define GRF_SOC_CON9		0x6224
>> @@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
>>  static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
>>  {
>>  	struct cdn_dp_port *port;
>> -	int i, lanes;
>> +	int i, lanes[MAX_PHY];
>>
>>  	for (i = 0; i < dp->ports; i++) {
>>  		port = dp->port[i];
>> -		lanes = cdn_dp_get_port_lanes(port);
>> -		if (lanes)
>> +		lanes[i] = cdn_dp_get_port_lanes(port);
>> +		if (!dp->next_bridge_valid)
>>  			return port;
>>  	}
>> +
>> +	if (dp->next_bridge_valid) {
>> +		/* If more than one port is available, pick the last active port */
>> +		if (dp->active_port > 0 && lanes[dp->active_port])
>> +			return dp->port[dp->active_port];
>> +
>> +		/* If the last active port is not available, pick an available port in order */
>> +		for (i = 0; i < dp->bridge_count; i++) {
>> +			if (lanes[i])
>> +				return dp->port[i];
>> +		}
>> +	}
>> +
>>  	return NULL;
>>  }
>>
>> @@ -253,12 +267,45 @@ static const struct drm_edid *
>>  cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
>>  {
>>  	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> -	const struct drm_edid *drm_edid;
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>> +	struct cdn_dp_port *port = dp->port[dp_bridge->id];
>> +	struct cdn_dp_port *prev_port;
>> +	const struct drm_edid *drm_edid = NULL;
>> +	int i, ret;
>>
>>  	mutex_lock(&dp->lock);
>> +
>> +	/* More than one port is available */
>> +	if (dp->bridge_count > 1 && !port->phy_enabled) {
>> +		for (i = 0; i < dp->bridge_count; i++) {
>> +			/* Another port already enable */
>> +			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
>> +				goto get_cache;
>> +			/* Find already enabled port */
>> +			if (dp->port[i]->phy_enabled)
>> +				prev_port = dp->port[i];
>> +		}
>> +
>> +		/* Switch to current port */
>> +		if (prev_port) {
>> +			ret = cdn_dp_switch_port(dp, prev_port, port);
>> +			if (ret)
>> +				goto get_cache;
>> +		}
>> +	}
>> +
>>  	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
>> +	/* replace edid cache */
>> +	if (dp->edid_cache[dp_bridge->id])
>> +		drm_edid_free(dp->edid_cache[dp_bridge->id]);
>> +	dp->edid_cache[dp_bridge->id] = drm_edid_dup(drm_edid);
>> +
>>  	mutex_unlock(&dp->lock);
>> +	return drm_edid;
>>
>> +get_cache:
>> +	drm_edid = drm_edid_dup(dp->edid_cache[dp_bridge->id]);
>> +	mutex_unlock(&dp->lock);
>>  	return drm_edid;
>>  }
>>
>> @@ -267,12 +314,13 @@ cdn_dp_bridge_mode_valid(struct drm_bridge *bridge,
>>  			 const struct drm_display_info *display_info,
>>  			 const struct drm_display_mode *mode)
>>  {
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>>  	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>>  	u32 requested, actual, rate, sink_max, source_max = 0;
>>  	u8 lanes, bpc;
>>
>>  	/* If DP is disconnected, every mode is invalid */
>> -	if (!dp->connected)
>> +	if (!dp_bridge->connected || !dp->connected)
>>  		return MODE_BAD;
>>
>>  	switch (display_info->bpc) {
>> @@ -550,6 +598,54 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
>>  	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
>>  }
>>
>> +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
>> +			      struct cdn_dp_port *port)
>> +{
>> +	int ret;
>> +
>> +	if (dp->active)
>> +		return 0;
>> +
>> +	ret = cdn_dp_disable_phy(dp, prev_port);
>> +	if (ret)
>> +		goto out;
>> +	ret = cdn_dp_enable_phy(dp, port);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = cdn_dp_get_sink_capability(dp);
>> +	if (ret) {
>> +		cdn_dp_disable_phy(dp, port);
>> +		goto out;
>> +	}
>> +
>> +	dp->active = true;
>> +	dp->lanes = port->lanes;
>> +
>> +	if (!cdn_dp_check_link_status(dp)) {
>> +		dev_info(dp->dev, "Connected with sink; re-train link\n");
>> +
>> +		ret = cdn_dp_train_link(dp);
>> +		if (ret) {
>> +			dev_err(dp->dev, "Training link failed: %d\n", ret);
>> +			goto out;
>> +		}
>> +
>> +		ret = cdn_dp_set_video_status(dp, CONTROL_VIDEO_IDLE);
>> +		if (ret) {
>> +			dev_err(dp->dev, "Failed to idle video %d\n", ret);
>> +			goto out;
>> +		}
>> +
>> +		ret = cdn_dp_config_video(dp);
>> +		if (ret)
>> +			dev_err(dp->dev, "Failed to configure video: %d\n", ret);
>> +	}
>> +
>> +out:
>> +	return ret;
>> +}
>> +
>>  static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
>>  				       struct drm_display_info *display_info)
>>  {
>> @@ -571,6 +667,7 @@ static void cdn_dp_display_info_update(struct cdn_dp_device *dp,
>>  static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_atomic_state *state)
>>  {
>>  	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>>  	struct drm_connector *connector;
>>  	int ret, val;
>>
>> @@ -580,7 +677,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
>>
>>  	cdn_dp_display_info_update(dp, &connector->display_info);
>>
>> -	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp->encoder.encoder);
>> +	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, &dp_bridge->encoder.encoder);
>>  	if (ret < 0) {
>>  		DRM_DEV_ERROR(dp->dev, "Could not get vop id, %d", ret);
>>  		return;
>> @@ -599,6 +696,9 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
>>
>>  	mutex_lock(&dp->lock);
>>
>> +	if (dp->next_bridge_valid)
>> +		dp->active_port = dp_bridge->id;
>> +
>>  	ret = cdn_dp_enable(dp);
>>  	if (ret) {
>>  		DRM_DEV_ERROR(dp->dev, "Failed to enable bridge %d\n",
>> @@ -631,6 +731,7 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
>>  		goto out;
>>  	}
>>
>> +	dp_bridge->enabled = true;
>>  out:
>>  	mutex_unlock(&dp->lock);
>>  }
>> @@ -638,9 +739,11 @@ static void cdn_dp_bridge_atomic_enable(struct drm_bridge *bridge, struct drm_at
>>  static void cdn_dp_bridge_atomic_disable(struct drm_bridge *bridge, struct drm_atomic_state *state)
>>  {
>>  	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>>  	int ret;
>>
>>  	mutex_lock(&dp->lock);
>> +	dp_bridge->enabled = false;
>>
>>  	if (dp->active) {
>>  		ret = cdn_dp_disable(dp);
>> @@ -827,6 +930,16 @@ static int cdn_dp_audio_mute_stream(struct drm_bridge *bridge,
>>  	return ret;
>>  }
>>
>> +static void cdn_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>> +			   enum drm_connector_status status)
>> +{
>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>> +	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>> +
>> +	dp->bridge_list[dp_bridge->id]->connected = status == connector_status_connected;
>> +	schedule_work(&dp->event_work);
>> +}
>> +
>>  static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>> @@ -837,6 +950,7 @@ static const struct drm_bridge_funcs cdn_dp_bridge_funcs = {
>>  	.atomic_disable = cdn_dp_bridge_atomic_disable,
>>  	.mode_valid = cdn_dp_bridge_mode_valid,
>>  	.mode_set = cdn_dp_bridge_mode_set,
>> +	.hpd_notify = cdn_dp_bridge_hpd_notify,
>>
>>  	.dp_audio_prepare = cdn_dp_audio_prepare,
>>  	.dp_audio_mute_stream = cdn_dp_audio_mute_stream,
>> @@ -885,7 +999,8 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
>>  {
>>  	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
>>  						event_work);
>> -	int ret;
>> +	bool connected;
>> +	int i, ret;
>>
>>  	mutex_lock(&dp->lock);
>>
>> @@ -944,9 +1059,12 @@ static void cdn_dp_pd_event_work(struct work_struct *work)
>>
>>  out:
>>  	mutex_unlock(&dp->lock);
>> -	drm_bridge_hpd_notify(&dp->bridge,
>> -			      dp->connected ? connector_status_connected
>> -					    : connector_status_disconnected);
>> +	for (i = 0; i < dp->bridge_count; i++) {
>> +		connected = dp->connected && dp->bridge_list[i]->connected;
>> +		drm_bridge_hpd_notify(&dp->bridge_list[i]->bridge,
>> +				      connected ? connector_status_connected
>> +						: connector_status_disconnected);
>> +	}
>>  }
>>
>>  static int cdn_dp_pd_event(struct notifier_block *nb,
>> @@ -966,28 +1084,16 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
>>  	return NOTIFY_DONE;
>>  }
>>
>> -static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>> +static int cdn_bridge_add(struct device *dev,
>> +			  struct drm_bridge *bridge,
>> +			  struct drm_bridge *next_bridge,
>> +			  struct drm_encoder *encoder)
>>  {
>>  	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>> -	struct drm_encoder *encoder;
>> +	struct drm_device *drm_dev = dp->drm_dev;
>> +	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;
>>  	struct drm_connector *connector;
>> -	struct cdn_dp_port *port;
>> -	struct drm_device *drm_dev = data;
>> -	int ret, i;
>> -
>> -	ret = cdn_dp_parse_dt(dp);
>> -	if (ret < 0)
>> -		return ret;
>> -
>> -	dp->drm_dev = drm_dev;
>> -	dp->connected = false;
>> -	dp->active = false;
>> -	dp->active_port = -1;
>> -	dp->fw_loaded = false;
>> -
>> -	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
>> -
>> -	encoder = &dp->encoder.encoder;
>> +	int ret;
>>
>>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
>>  							     dev->of_node);
>> @@ -1002,26 +1108,35 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>
>>  	drm_encoder_helper_add(encoder, &cdn_dp_encoder_helper_funcs);
>>
>> -	dp->bridge.ops =
>> -			DRM_BRIDGE_OP_DETECT |
>> -			DRM_BRIDGE_OP_EDID |
>> -			DRM_BRIDGE_OP_HPD |
>> -			DRM_BRIDGE_OP_DP_AUDIO;
>> -	dp->bridge.of_node = dp->dev->of_node;
>> -	dp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
>> -	dp->bridge.hdmi_audio_dev = dp->dev;
>> -	dp->bridge.hdmi_audio_max_i2s_playback_channels = 8;
>> -	dp->bridge.hdmi_audio_spdif_playback = 1;
>> -	dp->bridge.hdmi_audio_dai_port = -1;
>> -
>> -	ret = devm_drm_bridge_add(dev, &dp->bridge);
>> +	bridge->ops =
>> +		DRM_BRIDGE_OP_DETECT |
>> +		DRM_BRIDGE_OP_EDID |
>> +		DRM_BRIDGE_OP_HPD |
>> +		DRM_BRIDGE_OP_DP_AUDIO;
>> +	bridge->of_node = dp->dev->of_node;
>> +	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
>> +	bridge->hdmi_audio_dev = dp->dev;
>> +	bridge->hdmi_audio_max_i2s_playback_channels = 8;
>> +	bridge->hdmi_audio_spdif_playback = 1;
>> +	bridge->hdmi_audio_dai_port = -1;
>> +
>> +	ret = devm_drm_bridge_add(dev, bridge);
>>  	if (ret)
>>  		return ret;
>>
>> -	ret = drm_bridge_attach(encoder, &dp->bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  	if (ret)
>>  		return ret;
>>
>> +	if (next_bridge) {
>> +		ret = drm_bridge_attach(encoder, next_bridge, bridge,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +		if (ret)
>> +			return ret;
>> +
>> +		last_bridge = drm_bridge_chain_get_last_bridge(bridge->encoder);
>> +	}
>> +
>>  	connector = drm_bridge_connector_init(drm_dev, encoder);
>>  	if (IS_ERR(connector)) {
>>  		ret = PTR_ERR(connector);
>> @@ -1029,8 +1144,100 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>  		return ret;
>>  	}
>>
>> +	if (last_bridge)
>> +		connector->fwnode = fwnode_handle_get(of_fwnode_handle(last_bridge->of_node));
>> +
>>  	drm_connector_attach_encoder(connector, encoder);
>>
>> +	return 0;
>> +}
>> +
>> +static int cdn_dp_parse_next_bridge_dt(struct cdn_dp_device *dp)
>> +{
>> +	struct device_node *np = dp->dev->of_node;
>> +	struct device_node *port __free(device_node) = of_graph_get_port_by_id(np, 1);
>> +	struct drm_bridge *bridge;
>> +	int count = 0;
>> +	int ret = 0;
>> +	int i;
>> +
>> +	/* If device use extcon, do not use hpd bridge */
>> +	for (i = 0; i < dp->ports; i++) {
>> +		if (dp->port[i]->extcon) {
>> +			dp->bridge_count = 1;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	/* One endpoint may correspond to one next bridge. */
>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>> +		struct device_node *next_bridge_node __free(device_node) =
>> +			of_graph_get_remote_port_parent(dp_ep);
>> +
>> +		bridge = of_drm_find_bridge(next_bridge_node);
>> +		if (!bridge) {
>> +			ret = -EPROBE_DEFER;
>> +			goto out;
>> +		}
>> +
>> +		drm_bridge_get(bridge);
>> +		dp->next_bridge_valid = true;
>> +		dp->next_bridge_list[count] = bridge;
> 
> Correct, but the drm_bridge_get() slightly far away from the assignement is
> a bit misleading. I hadn't seen it initially so I suspected a missing get.
> 
> I suggest to do it in a single statement, for clarity:
> 
> 		dp->next_bridge_list[count] = bridgedrm_bridge_get(bridge);
>

I think the bridgedrm_bridge_get here seems to be a typo?

Anyway, thank you very much for your efforts on the bridge lifetime.
I will fix this in the next version :)

> With that changed, at least for the bridge lifetime aspects, you can add to
> the next version my:
> 
>  Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
Best, 
Chaoyi
