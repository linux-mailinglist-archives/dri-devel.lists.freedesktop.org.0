Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA5FC50377
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 02:37:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0897910E679;
	Wed, 12 Nov 2025 01:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="Tk/Nru/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155116.qiye.163.com (mail-m155116.qiye.163.com
 [101.71.155.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D810E678
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:37:44 +0000 (UTC)
Received: from [172.16.12.149] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2940ec243;
 Wed, 12 Nov 2025 09:37:38 +0800 (GMT+08:00)
Message-ID: <b1a339e7-a011-4b4b-8988-2e3768753c85@rock-chips.com>
Date: Wed, 12 Nov 2025 09:37:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/10] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Chaoyi Chen
 <kernel@airkyi.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
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
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-9-kernel@airkyi.com>
 <DE5YP3AVGOG3.OHP68Z0F6KBU@bootlin.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <DE5YP3AVGOG3.OHP68Z0F6KBU@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9a75b6143303abkunm0bec24bf182fd85
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU5CH1ZLGhlKSRoZTRkdGhlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
 xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=Tk/Nru/ZXVusFVKbKnTzrvZjOWOaCSKNx0UhTU/r6bAGi1AV3GIuBfvKLPYpROhN5dcfQ/LW/LdDtr2b8FluwyDk6CX6J5pHBwa6nVLjtWatW30ti/VVinHazm1zdSRphcteWPPYDyfsscBZj+MB05yUSLqGfbaiGVQtdEbMdRA=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=BPllQae7e6Ghf002hw3ANDVcq7ch0jsTkPsZyexqDhM=;
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

Hello Luca,

On 11/11/2025 11:14 PM, Luca Ceresoli wrote:
> Hello Chaoyi,
>
> On Tue Nov 11, 2025 at 11:50 AM CET, Chaoyi Chen wrote:
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
> [...]
>
>> @@ -966,28 +1084,16 @@ static int cdn_dp_pd_event(struct notifier_block *nb,
>>   	return NOTIFY_DONE;
>>   }
>>
>> -static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>> +static int cdn_bridge_add(struct device *dev,
>> +			  struct drm_bridge *bridge,
>> +			  struct drm_bridge *next_bridge,
>> +			  struct drm_encoder *encoder)
>>   {
>>   	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>> -	struct drm_encoder *encoder;
>> +	struct drm_device *drm_dev = dp->drm_dev;
>> +	struct drm_bridge *last_bridge = NULL;
>>   	struct drm_connector *connector;
>> -	struct cdn_dp_port *port;
>> -	struct drm_device *drm_dev = data;
>> -	int ret, i;
> [...]
>
>> +	if (next_bridge) {
>> +		ret = drm_bridge_attach(encoder, next_bridge, bridge,
>> +					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>> +		if (ret)
>> +			return ret;
>> +
>> +		last_bridge = next_bridge;
>> +		while (drm_bridge_get_next_bridge(last_bridge))
>> +			last_bridge = drm_bridge_get_next_bridge(last_bridge);
> DRM bridges are now refcounted, and you are not calling drm_bridge_get()
> and drm_bridge_put() here. But here you can use
> drm_bridge_chain_get_last_bridge() which will simplify your job.
>
> Don't forget to call drm_bridge_put() on the returned bridge when the
> bridge is not referenced anymore. This should be as easy as adding a
> cleanup action on the variable declaration above:
>
> -	struct drm_bridge *last_bridge = NULL;
> +	struct drm_bridge *last_bridge __free(drm_bridge_put) = NULL;

Ah, I have seen your patch about this. Thank you for the reminder, I will fix this in v10.

>
>> @@ -1029,8 +1147,102 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>>   		return ret;
>>   	}
>>
>> +	if (last_bridge)
>> +		connector->fwnode = fwnode_handle_get(of_fwnode_handle(last_bridge->of_node));
>> +
>>   	drm_connector_attach_encoder(connector, encoder);
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
>> +		dp->next_bridge_valid = true;
>> +		dp->next_bridge_list[count].bridge = bridge;
> You are storing a reference to a drm_bridge, so have to increment the
> refcount:
>
> 		dp->next_bridge_list[count].bridge = drm_bridge_get(bridge);
> 		                                     ^^^^^^^^^^^^^^
>
> FYI there is a plan to replace of_drm_find_bridge() with a function that
> increases the bridge refcount before returning the bridge, but it's not
> there yet. When that will happen, the explicit drm_bridge_get() won't be
> needed anymore and this code can be updated accordingly.
>
> Also you have to call drm_bridge_put() to release that reference when the
> pointer goes away. I guess that should happen in cdn_dp_unbind().

You're right, this is indeed a pitfall. I will fix it in v10.

>
>> +static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>> +{
> In this function you do:
> ...(see below)...
>
>> +	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>> +	struct drm_bridge *bridge, *next_bridge;
>> +	struct drm_encoder *encoder;
>> +	struct cdn_dp_port *port;
>> +	struct drm_device *drm_dev = data;
>> +	struct cdn_dp_bridge *dp_bridge;
>> +	int ret, i;
>> +
>> +	ret = cdn_dp_parse_dt(dp);
>> +	if (ret < 0)
> .> +		return ret;
>> +
>> +	ret = cdn_dp_parse_next_bridge_dt(dp);
> 1. compute the next bridges and store them in dp->next_bridge_list[]
> ...
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	dp->drm_dev = drm_dev;
>> +	dp->connected = false;
>> +	dp->active = false;
>> +	dp->active_port = -1;
>> +	dp->fw_loaded = false;
>> +
>> +	for (i = 0; i < dp->bridge_count; i++) {
>> +		dp_bridge = devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
>> +						    &cdn_dp_bridge_funcs);
>> +		if (IS_ERR(dp_bridge))
>> +			return PTR_ERR(dp_bridge);
>> +		dp_bridge->id = i;
>> +		dp_bridge->parent = dp;
>> +		if (!dp->next_bridge_valid)
>> +			dp_bridge->connected = true;
>> +		dp->bridge_list[i] = dp_bridge;
>> +	}
>> +
>> +	for (i = 0; i < dp->bridge_count; i++) {
>> +		encoder = &dp->bridge_list[i]->encoder.encoder;
>> +		bridge = &dp->bridge_list[i]->bridge;
>> +		next_bridge = dp->next_bridge_list[i].bridge;
>> +		ret = cdn_bridge_add(dev, bridge, next_bridge, encoder);
> ...
> 2. pass the dp->next_bridge_list[i].bridge to cdn_bridge_add
> 3. not use  dp->next_bridge_list[i] elsewhere
>
> So you may want to change this function to parse into a local array, with
> function scope. If you do this, the drm_bridge_get/put() I mentioned above
> should still exist, but would be localized to this function, thus even
> easier to handle.
>
> Even better, you can parse the DT one bridge at a time inside the for loop,
> so you don't need to store any next_bridge pointer array. This will need a
> bit of rework of cdn_dp_parse_next_bridge_dt() though, and I haven't
> checked in detail so it might be not worth.

The next_bridge is obtained through of_drm_find_bridge(). According to your description just now, drm_bridge_put() needs to be called in cdn_dp_unbind(). So if I understand correctly, we do need to store this pointer.


>
> [...]
>
>> +struct cdn_dp_bridge {
>> +	struct cdn_dp_device *parent;
>> +	struct drm_bridge bridge;
>> +	struct rockchip_encoder encoder;
>> +	bool connected;
>> +	bool enabled;
>> +	int id;
>> +};
>> +
>> +struct cdn_dp_next_bridge {
>> +	struct cdn_dp_device *parent;
>> +	struct drm_bridge *bridge;
>> +	int id;
> The @parent and @id fields are unused if I'm not mistaken.
>
> If it is the case then you can... (see below)
>
>>   struct cdn_dp_device {
>>   	struct device *dev;
>>   	struct drm_device *drm_dev;
>> -	struct drm_bridge bridge;
>> -	struct rockchip_encoder encoder;
>> +	int bridge_count;
>> +	struct cdn_dp_bridge *bridge_list[MAX_PHY];
>> +	struct cdn_dp_next_bridge next_bridge_list[MAX_PHY];
> ...replace this line with:
> 	struct drm_bridge *next_bridge[MAX_PHY];
>
> Unless of course you just don't store the next_bridge at all, as I
> suggested above, and which looks way easier and more efficient.

Yes, the structure cdn_dp_next_bridge is only reserved for future expansion. I will replace it with a simpler struct drm_bridge in v10.

-- 
Best,
Chaoyi

