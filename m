Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477CBD1197
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 03:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACE110E2EB;
	Mon, 13 Oct 2025 01:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="EjyvMPU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 302 seconds by postgrey-1.36 at gabe;
 Mon, 13 Oct 2025 01:31:18 UTC
Received: from mail-m2454.xmail.ntesmail.com (mail-m2454.xmail.ntesmail.com
 [45.195.24.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33BD10E1D6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 01:31:18 +0000 (UTC)
Received: from [127.0.0.1] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 25a3ed459;
 Mon, 13 Oct 2025 09:26:12 +0800 (GMT+08:00)
Message-ID: <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
Date: Mon, 13 Oct 2025 09:26:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-7-kernel@airkyi.com>
 <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a99db2cd45d03abkunmd42693ddf9445f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGk5OSFYaSBpPTk4ZHU9LGRlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
 9VSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=EjyvMPU4l/juR5E7grt0CDa5nAksLXwJ5VSyMK4ffKvPTbojA4mjkwPvG9E+LubLTvHczH6SqzFYhEB9ekfkeIedmR4w5LZG5VwNHPHKQ5/NM7D6BnAM/RoIfnxSquUFCRfpnaYi3kjHcivb3UnSRd+GM0AzJFrS5OviHmcdjQI=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=fuqk83w9a4EPvpdBlyDSD5SKGCTTCoHWM86zwqZCw0g=;
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

On 10/12/2025 2:52 AM, Dmitry Baryshkov wrote:

> On Sat, Oct 11, 2025 at 11:32:31AM +0800, Chaoyi Chen wrote:
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
>> In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
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
>> Changes in v5:
>> - By parsing the HPD bridge chain, set the connector's of_node to the
>> of_node corresponding to the USB-C connector.
>> - Return EDID cache when other port is already enabled.
>>
>>   drivers/gpu/drm/rockchip/Kconfig       |   2 +
>>   drivers/gpu/drm/rockchip/cdn-dp-core.c | 355 +++++++++++++++++++++----
>>   drivers/gpu/drm/rockchip/cdn-dp-core.h |  24 +-
>>   3 files changed, 324 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index faf50d872be3..7472ec923cfd 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -55,6 +55,8 @@ config ROCKCHIP_CDN_DP
>>   	select DRM_DISPLAY_HELPER
>>   	select DRM_BRIDGE_CONNECTOR
>>   	select DRM_DISPLAY_DP_HELPER
>> +	select DRM_AUX_BRIDGE
>> +	select DRM_AUX_HPD_BRIDGE
> You are not using them in this driver, so this is not correct. Please
> declare Kconfig dependencies for the drivers that actually call the API,
> otherwise the LKP or somebody else can get compile errors because this
> driver wasn't selected.

Thanks for the clarification. Will fix in v6.


>
>>   	help
>>   	  This selects support for Rockchip SoC specific extensions
>>   	  for the cdn DP driver. If you want to enable Dp on
> [...]
>
>> +
>> +	/*
>> +	 *
>> +	 * &dp_out {
>> +	 *	dp_controller_output0: endpoint@0 {
>> +	 * 		remote-endpoint = <&dp_phy0_in>
>> +	 * 	};
>> +	 *
>> +	 * 	dp_controller_output1: endpoint@1 {
>> +	 * 		remote-endpoint = <&dp_phy1_in>
>> +	 * 	};
>> +	 * };
>> +	 *
>> +	 * &tcphy0_dp {
>> +	 * 	port {
>> +	 * 		tcphy0_typec_dp: endpoint@0 {
>> +	 * 			reg = <0>;
>> +	 * 			remote-endpoint = <&usbc0_dp>;
>> +	 * 		};
>> +	 *
>> +	 * 		dp_phy0_in: endpoint@1 {
>> +	 * 			reg = <1>;
>> +	 * 			remote-endpoint = <&dp_controller_output0>;
>> +	 * 		};
>> +	 * 	};
>> +	 * };
>> +	 *
>> +	 * &tcphy1_dp {
>> +	 * 	...
>> +	 * };
>> +	 *
>> +	 */
>> +
>> +	/* One endpoint may correspond to one HPD bridge. */
>> +	for_each_of_graph_port_endpoint(port, dp_ep) {
>> +		struct device_node *phy_bridge_node __free(device_node) =
>> +			of_graph_get_remote_port_parent(dp_ep);
>> +
>> +		bridge = of_drm_find_bridge(phy_bridge_node);
>> +		if (!bridge) {
>> +			ret = -EPROBE_DEFER;
>> +			goto out;
>> +		}
>> +
>> +		dp->hpd_bridge_valid = true;
>> +		dp->hpd_bridge_list[count].bridge = bridge;
>> +		dp->hpd_bridge_list[count].parent = dp;
>> +		dp->hpd_bridge_list[count].id = count;
> This looks misnamed. They are not necessarily HPD bridges. There can be
> a random chain between your controller and the actual output / connector
> /etc.

Yes, and more precisely, this should be `pervious_bridge_list` . Will fix in v6.



>
>> +		count++;
>> +	}
>> +
>> +out:
>> +	dp->bridge_count = count ? count : 1;
>> +	return ret;
>> +}
>> +
>> +static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct cdn_dp_device *dp = dev_get_drvdata(dev);
>> +	struct drm_bridge *bridge, *hpd_bridge;
>> +	struct drm_encoder *encoder;
>> +	struct cdn_dp_port *port;
>> +	struct drm_device *drm_dev = data;
>> +	struct cdn_dp_bridge *bridge_list;
> Why is it bridge_list?

Maybe it's still a naming issue. There may be multiple struct cdn_dp_bridge that will eventually be added to a list. It might be better to rename it to `dp_bridge`



>
>> +	int ret, i;
>> +
>> +	ret = cdn_dp_parse_dt(dp);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = cdn_dp_parse_hpd_bridge_dt(dp);
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
>> +		bridge_list = devm_drm_bridge_alloc(dev, struct cdn_dp_bridge, bridge,
>> +						    &cdn_dp_bridge_funcs);
>> +		if (IS_ERR(bridge_list))
>> +			return PTR_ERR(bridge_list);
>> +		bridge_list->id = i;
>> +		bridge_list->parent = dp;
>> +		if (!dp->hpd_bridge_valid)
>> +			bridge_list->connected = true;
>> +		dp->bridge_list[i] = bridge_list;
>> +	}
>> +

-- 
Best,
Chaoyi

