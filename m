Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C4D25552A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9C16E2C4;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35C96EB3A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 08:15:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 8444D293429
Subject: Re: [PATCH v2 5/5] drm/bridge: ps8640: Rework power state handling
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
 <20200826081526.674866-6-enric.balletbo@collabora.com>
 <20200826184657.GA419312@ravnborg.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <dadf9771-fe6f-0e28-0318-a5985a1b28f9@collabora.com>
Date: Thu, 27 Aug 2020 10:15:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826184657.GA419312@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 laurent.pinchart@ideasonboard.com, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thanks for your comments.

On 26/8/20 20:46, Sam Ravnborg wrote:
> Hi Enric.
> 
> On Wed, Aug 26, 2020 at 10:15:26AM +0200, Enric Balletbo i Serra wrote:
>> The get_edid() callback can be triggered anytime by an ioctl, i.e
>>
>>   drm_mode_getconnector (ioctl)
>>     -> drm_helper_probe_single_connector_modes
>>        -> drm_bridge_connector_get_modes
>>           -> ps8640_bridge_get_edid
>>
>> Actually if the bridge pre_enable() function was not called before
>> get_edid(), the driver will not be able to get the EDID properly and
>> display will not work until a second get_edid() call is issued and if
>> pre_enable() is called before. The side effect of this, for example, is
>> that you see anything when `Frecon` starts, neither the splash screen,
>> until the graphical session manager starts.
>>
>> To fix this we need to make sure that all we need is enabled before
>> reading the EDID. This means the following:
>>
>> 1. If get_edid() is called before having the device powered we need to
>>    power on the device. In such case, the driver will power off again the
>>    device.
>>
>> 2. If get_edid() is called after having the device powered, all should
>>    just work. We added a powered flag in order to avoid recurrent calls
>>    to ps8640_bridge_poweron() and unneeded delays.
>>
>> 3. This seems to be specific for this device, but we need to make sure
>>    the panel is powered on before do a power on cycle on this device.
>>    Otherwise the device fails to retrieve the EDID.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v2:
>> - Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam Ravnborg)
>>
>>  drivers/gpu/drm/bridge/parade-ps8640.c | 64 +++++++++++++++++++++++---
>>  1 file changed, 58 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
>> index 9f7b7a9c53c5..c5d76e209bda 100644
>> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>> @@ -65,6 +65,7 @@ struct ps8640 {
>>  	struct regulator_bulk_data supplies[2];
>>  	struct gpio_desc *gpio_reset;
>>  	struct gpio_desc *gpio_powerdown;
>> +	bool powered;
>>  };
>>  
>>  static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
>> @@ -91,13 +92,15 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>>  	return 0;
>>  }
>>  
>> -static void ps8640_pre_enable(struct drm_bridge *bridge)
>> +static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>>  {
>> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>  	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
>>  	unsigned long timeout;
>>  	int ret, status;
>>  
>> +	if (ps_bridge->powered)
>> +		return;
>> +
>>  	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
>>  				    ps_bridge->supplies);
>>  	if (ret < 0) {
>> @@ -164,6 +167,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>>  		goto err_regulators_disable;
>>  	}
>>  
>> +	ps_bridge->powered = true;
>> +
>>  	return;
>>  
>>  err_regulators_disable:
>> @@ -171,12 +176,12 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>>  			       ps_bridge->supplies);
>>  }
>>  
>> -static void ps8640_post_disable(struct drm_bridge *bridge)
>> +static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>>  {
>> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>  	int ret;
>>  
>> -	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>> +	if (!ps_bridge->powered)
>> +		return;
>>  
>>  	gpiod_set_value(ps_bridge->gpio_reset, 1);
>>  	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
>> @@ -184,6 +189,28 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
>>  				     ps_bridge->supplies);
>>  	if (ret < 0)
>>  		DRM_ERROR("cannot disable regulators %d\n", ret);
>> +
>> +	ps_bridge->powered = false;
>> +}
>> +
>> +static void ps8640_pre_enable(struct drm_bridge *bridge)
>> +{
>> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>> +	int ret;
>> +
>> +	ps8640_bridge_poweron(ps_bridge);
>> +
>> +	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>> +	if (ret < 0)
>> +		ps8640_bridge_poweroff(ps_bridge);
>> +}
> 
> The impleimentation of ps8640_bridge_poweron() versus
> ps8640_bridge_poweroff() is confusing.
> 
> ps8640_bridge_poweron() includes ps8640_bridge_vdo_control(.., ENABLE),
> but ps8640_bridge_poweroff() does not include
> ps8640_bridge_vdo_control(..., DISABLE).
> 
> This is inconsistent and confusing. At least it was for me when
> reviewing. Can this be improved - or maybe just use naming that does not
> indicate they are the reverse of each other?
> 

Right, I think I can implement reverse of each other. So I'll send an updated
series.

Thanks,
 Enric

>> +
>> +static void ps8640_post_disable(struct drm_bridge *bridge)
>> +{
>> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>> +
>> +	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>> +	ps8640_bridge_poweroff(ps_bridge);
>>  }
>>  
>>  static int ps8640_bridge_attach(struct drm_bridge *bridge,
>> @@ -249,9 +276,34 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>>  					   struct drm_connector *connector)
>>  {
>>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>> +	bool poweroff = !ps_bridge->powered;
>> +	struct edid *edid;
>> +
>> +	/*
>> +	 * When we end calling get_edid() triggered by an ioctl, i.e
>> +	 *
>> +	 *   drm_mode_getconnector (ioctl)
>> +	 *     -> drm_helper_probe_single_connector_modes
>> +	 *        -> drm_bridge_connector_get_modes
>> +	 *           -> ps8640_bridge_get_edid
>> +	 *
>> +	 * We need to make sure that what we need is enabled before reading
>> +	 * EDID, for this chip, we need to do a full poweron, otherwise it will
>> +	 * fail.
>> +	 */
>> +	drm_bridge_chain_pre_enable(bridge);
>>  
>> -	return drm_get_edid(connector,
>> +	edid = drm_get_edid(connector,
>>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
>> +
>> +	/*
>> +	 * If we call the get_edid() function without having enabled the chip
>> +	 * before, return the chip to its original power state.
>> +	 */
>> +	if (poweroff)
>> +		drm_bridge_chain_post_disable(bridge);
>> +
>> +	return edid;
>>  }
> 
> The use of drm_bridge_chain_pre_enable() and
> drm_bridge_chain_post_disable() was exactly what I was asking for -
> looks good.
> 
> I have not really considered the idea from Balil that we should provide
> better infrastructure support powering on the bridge chain when reading
> the edid. Maybe an idea for later?
> 
> 	Sam
> 
> 
> 
>>  
>>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>> -- 
>> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
