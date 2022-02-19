Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D984BC563
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 05:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBB610E19D;
	Sat, 19 Feb 2022 04:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4176810E19D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 04:44:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A38CD83B88;
 Sat, 19 Feb 2022 05:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645245879;
 bh=rCNQW4+05aKY1dJFU6nE1Tipg2KrYl6KQ0e/D6jsiSk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=m2Vg0tlWVLJ9MRHfpTJsIE72bsh8vCHrGgOhQXnUdupuhm5zr6DWRSf50c9VNuyrx
 Fj2hoYS5A8F+ToVRZvZLiTk7kVmD2U0531qKx6m814JnGZEJPFgqnenIBpoSEKGxnx
 G4cppuNWdi5XMaS40OQl2js0jegtf8nN9BEfeCWzOyn7wyt7beZ6OUZziGiQYTSH9r
 pQsVG3bjGOLX5YsJqJDTN6WE4GTW5768f/TMNCpXwlNpZFfF+5q3m7B66F1aDkibJU
 w7rZ03QGb/vwKB5mq4PVMutBI6Jo2sqpfYo2698Z3bfVbpaIjXqCAu8D4wP91/17iC
 g2EQ6OdGgZ7MQ==
Message-ID: <f84dea89-fb4e-9e25-a020-b5e4f3cb82eb@denx.de>
Date: Sat, 19 Feb 2022 05:44:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 11/11] drm/bridge: tc358767: Add DSI-to-DPI mode support
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-12-marex@denx.de>
 <7d92962a433843af249a5adcc145dc4aecc66015.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7d92962a433843af249a5adcc145dc4aecc66015.camel@pengutronix.de>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/18/22 19:38, Lucas Stach wrote:

[...]

>> @@ -502,8 +548,10 @@ static int tc_pxl_pll_en(struct tc_data *tc, u32 refclk, u32 pixelclock)
>>   				/*
>>   				 * refclk * mul / (ext_pre_div * pre_div)
>>   				 * should be in the 150 to 650 MHz range
>> +				 * for (e)DP
>>   				 */
>> -				if ((clk > 650000000) || (clk < 150000000))
>> +				if ((tc->bridge.type != DRM_MODE_CONNECTOR_DPI) &&
>> +				    ((clk > 650000000) || (clk < 150000000)))
>>   					continue;
> 
> Is there any indication what the bounds are for DPI mode? Can we
> replace this with a better check, instead of just disabling it?

Apparently the DPI pixel PLL output is limited to 100 MHz, so yes, this 
can be improved.

[...]

>> +static int tc_dpi_stream_enable(struct tc_data *tc)
>> +{
>> +	int ret;
>> +	u32 value;
>> +
>> +	dev_dbg(tc->dev, "enable video stream\n");
>> +
>> +	/* Setup PLL */
>> +	ret = tc_set_syspllparam(tc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Pixel PLL must always be enabled for DPI mode */
>> +	ret = tc_pxl_pll_en(tc, clk_get_rate(tc->refclk),
>> +			    1000 * tc->mode.clock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
>> +	regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
>> +	regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
>> +	regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
> 
> Hm, those hardcoded always seem kind of fishy, as AFAIK those
> parameters are dependent on land frequency and some other things. But
> I'm also not sure if we have all the information available to
> dynamically calculate them.

We have multiple copies of the same ^ code in other TC358nnn drivers 
too, it seems like some de-duplication could be done too. I have this 
feeling the Toshiba bridges are all glued together from two (or more) 
halves and there is large potential for de-duplication in all those TC 
drivers. But does anyone really have all the chips to test, except for 
Toshiba ?

>> +	regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
>> +	regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
>> +	regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
>> +	regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
>> +
>> +	value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
>> +		LANEENABLE_CLEN;
>> +	regmap_write(tc->regmap, PPI_LANEENABLE, value);
>> +	regmap_write(tc->regmap, DSI_LANEENABLE, value);
>> +
>> +	ret = tc_set_common_video_mode(tc, &tc->mode);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = tc_set_dpi_video_mode(tc, &tc->mode);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Set input interface */
>> +	value = DP0_AUDSRC_NO_INPUT;
>> +	if (tc_test_pattern)
>> +		value |= DP0_VIDSRC_COLOR_BAR;
>> +	else
>> +		value |= DP0_VIDSRC_DSI_RX;
>> +	ret = regmap_write(tc->regmap, SYSCTRL, value);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msleep(100);
> 
> What is that used for? PLL stabilization? Some other purpose?

Yes, except that should've been microseconds ... fixed

[...]

>> +static int tc_mipi_dsi_host_attach(struct tc_data *tc)
>> +{
>> +	struct device *dev = tc->dev;
>> +	struct device_node *host_node;
>> +	struct device_node *endpoint;
>> +	struct mipi_dsi_device *dsi;
>> +	struct mipi_dsi_host *host;
>> +	const struct mipi_dsi_device_info info = {
>> +		.type = "tc358767",
>> +		.channel = 0,
>> +		.node = NULL,
>> +	};
>> +	int ret;
>> +
>> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
>> +	tc->dsi_lanes = of_property_count_u32_elems(endpoint, "data-lanes");
> 
> The data-lanes property isn't documented in the DT binding. Please add.

Fixed in a separate patch.

[...]

>> @@ -1828,15 +2145,23 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>>   		tc->have_irq = true;
>>   	}
>>   
>> -	ret = tc_aux_link_setup(tc);
>> -	if (ret)
>> -		return ret;
>> +	if (tc->bridge.type != DRM_MODE_CONNECTOR_DPI) { /* (e)DP output */
>> +		ret = tc_aux_link_setup(tc);
>> +		if (ret)
>> +			return ret;
>> +	}
>>   
>>   	tc->bridge.of_node = dev->of_node;
>>   	drm_bridge_add(&tc->bridge);
>>   
>>   	i2c_set_clientdata(client, tc);
>>   
>> +	if (tc->bridge.type == DRM_MODE_CONNECTOR_DPI) { /* DPI output */
>> +		ret = tc_mipi_dsi_host_attach(tc);
>> +		if (ret)
>> +			return ret;
>> +	}
> 
> If tc_mipi_dsi_host_attach fails the drm bridge registered a few lines
> above isn't cleaned up properly.

Fixed
