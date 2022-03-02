Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74134CA8E7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 16:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355C710EB18;
	Wed,  2 Mar 2022 15:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9964C10EB18
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 15:17:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 75B2883B6E;
 Wed,  2 Mar 2022 16:17:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646234225;
 bh=0jfRPyMO1bAieYOhjnj7KXvZ7CSVLoOyYmSDjqrrtdo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Newm+4cNLI3xdcBJ0ONf3UJKlaqugOLeFiXgoJU1yedmSqfC1nQWfxr3RI9dOqw7Y
 ow8I9typAPO2jpCjy5WP1EFEbCsLnCdM1tbcC0OoCBAo3q56APQ0/I+7MPy5UgvpzB
 j2+HRs+y7ISAO9CrnNjyiOSc7yJPuB9UT8skp//vGjy0rZKEvbmaPSimMydvcfXUYI
 hxg2FxFKVTeoIibFWmXC5FPU+kzgWhHHN1MwJgWzYqTFvcQqCevTv061YXlGBEs0UI
 jdPbDbsmFtkn44rThBN1vDtyO0ukcp+dJEZ0hbNIi8errfyHTfSrD1y/pKPXKpcQtx
 8OTyZhZJecrwQ==
Message-ID: <3d5f1c7d-3ee7-027b-47e8-6b5923657358@denx.de>
Date: Wed, 2 Mar 2022 16:17:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V2 04/12] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-5-marex@denx.de>
 <20220302100143.pvy77sw2sgd57tql@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220302100143.pvy77sw2sgd57tql@houat>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/2/22 11:01, Maxime Ripard wrote:
> On Thu, Feb 17, 2022 at 01:25:22AM +0100, Marek Vasut wrote:
>> The driver currently hard-codes DSI lane count to two, however the chip
>> is capable of operating in 1..4 DSI lanes mode. Parse 'data-lanes' DT
>> property and program the result into DSI_CTRL register.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Maxime Ripard <maxime@cerno.tech>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
>> ---
>> V2: Rebase on next-20220214
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 21 ++++++++++++++++++++-
>>   1 file changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> index 2ac8eb7e25f52..7c013a08c7b00 100644
>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> @@ -136,10 +136,12 @@ struct chipone {
>>   	struct drm_bridge bridge;
>>   	struct drm_display_mode mode;
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
>> @@ -212,6 +214,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
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
>> @@ -314,6 +321,7 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
>>   static int chipone_parse_dt(struct chipone *icn)
>>   {
>>   	struct device *dev = icn->dev;
>> +	struct device_node *endpoint;
>>   	struct drm_panel *panel;
>>   	int ret;
>>   
>> @@ -350,6 +358,16 @@ static int chipone_parse_dt(struct chipone *icn)
>>   		return PTR_ERR(icn->enable_gpio);
>>   	}
>>   
>> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>> +	icn->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> 
> The binding must be amended to allow for the usage of data-lanes, and
> you need to keep the previous value as default for older device trees

Regarding the default value -- there are no in-tree users of this driver 
yet (per git grep in current linux-next), do we really care about 
backward compatibility in this case?
