Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E494B9239
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 21:24:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145C610E1BE;
	Wed, 16 Feb 2022 20:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D37D610E1BE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 20:24:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 84471837B6;
 Wed, 16 Feb 2022 21:24:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645043078;
 bh=6QXmm7I6hngDDotT3m1zswZmU/xV951QG7iMEO7dq/s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OFhkFfraCrM4A7qCQfA3jv8z2Nq0x3fPtzwrxGQ+nn5lwjZKj/nlYmmlP97dOKDLU
 45FOCIlUDsTgvsjTH2yrvbZZEmo5IrqafuClFWQs/EnvYqPw2pQEpkM7sQMO+2eTb4
 tUPHZMkgmNiYqi4Yj9AgacNuu2w2Gc8JSUq0s52ier7rKV+vd9/6nRgmGWRt6HcmTs
 3YjQ44KCu4IPo5KtJqAGusYnBWT6wP70O6G2xGgoMWafDg5G/K62UaAN/eZp4gwhUx
 jFcPZbzK02J5JYxKvOvfl25+8O0BMie/7Fk9fo/cBtqF+yXqJ++U6EZgKT9VEsyO/M
 wZKNGkA8JTLvA==
Message-ID: <583bce99-e8a3-20c1-28fb-bf837a12ca04@denx.de>
Date: Wed, 16 Feb 2022 21:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 07/14] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220114034838.546267-1-marex@denx.de>
 <20220114034838.546267-7-marex@denx.de>
 <20220203121315.zo27qg37n2euy2d4@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220203121315.zo27qg37n2euy2d4@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/3/22 13:13, Maxime Ripard wrote:
> On Fri, Jan 14, 2022 at 04:48:31AM +0100, Marek Vasut wrote:
>> The driver currently hard-codes DSI lane count to two, however the chip
>> is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
>> property and program the result into DSI_CTRL register.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 35 ++++++++++++++++++++----
>>   1 file changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> index 3ad082c1d2bfd..400a566026ab4 100644
>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> @@ -135,10 +135,12 @@ struct chipone {
>>   	struct device *dev;
>>   	struct drm_bridge bridge;
>>   	struct drm_bridge *panel_bridge;
>> +	struct device_node *host_node;
>>   	struct gpio_desc *enable_gpio;
>>   	struct regulator *vdd1;
>>   	struct regulator *vdd2;
>>   	struct regulator *vdd3;
>> +	int dsi_lanes;
>>   };
>>   
>>   static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
>> @@ -235,6 +237,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
>>   	/* dsi specific sequence */
>>   	ICN6211_DSI(icn, SYNC_EVENT_DLY, 0x80);
>>   	ICN6211_DSI(icn, HFP_MIN, hfp & 0xff);
>> +
>> +	/* DSI data lane count */
>> +	ICN6211_DSI(icn, DSI_CTRL,
>> +		    DSI_CTRL_UNKNOWN | DSI_CTRL_DSI_LANES(icn->dsi_lanes - 1));
>> +
>>   	ICN6211_DSI(icn, MIPI_PD_CK_LANE, 0xa0);
>>   	ICN6211_DSI(icn, PLL_CTRL(12), 0xff);
>>   
>> @@ -354,6 +361,8 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>>   static int chipone_parse_dt(struct chipone *icn)
>>   {
>>   	struct device *dev = icn->dev;
>> +	struct drm_bridge *panel_bridge;
>> +	struct device_node *endpoint;
>>   	struct drm_panel *panel;
>>   	int ret;
>>   
>> @@ -390,13 +399,26 @@ static int chipone_parse_dt(struct chipone *icn)
>>   		return PTR_ERR(icn->enable_gpio);
>>   	}
>>   
>> -	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>> -	if (ret)
>> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>> +	icn->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
>> +	icn->host_node = of_graph_get_remote_port_parent(endpoint);
>> +	of_node_put(endpoint);
>> +
>> +	if (icn->dsi_lanes < 0 || icn->dsi_lanes > 4)
>> +		return -EINVAL;
>> +	if (!icn->host_node)
>> +		return -ENODEV;
>> +
>> +	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, &panel_bridge);
>> +	if (ret < 0)
>>   		return ret;
>> +	if (panel) {
>> +		panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>> +		if (IS_ERR(panel_bridge))
>> +			return PTR_ERR(panel_bridge);
>> +	}
>>
>> -	icn->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
>> -	if (IS_ERR(icn->panel_bridge))
>> -		return PTR_ERR(icn->panel_bridge);
>> +	icn->panel_bridge = panel_bridge;
> 
> It looks like you're doing more than what you said in the commit log
> here? There's at least a change on the error condition for
> drm_of_find_panel_or_bridge, some reworking of the drm_panel_bridge_add
> call, plus the data-lanes property parsing you were mentioning.
> 
> All those should be separate patches

Actually, I think I can drop this panel_bridge hunk too, which leaves 
only the lane count in this patch.
