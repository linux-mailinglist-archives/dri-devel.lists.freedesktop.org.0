Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE61224E683
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0199F6E423;
	Sat, 22 Aug 2020 09:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA15E6EABA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Aug 2020 11:14:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id CF7E329B008
Subject: Re: [PATCH 3/3] drm/bridge: ps8640: Rework power state handling
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200615205320.790334-1-enric.balletbo@collabora.com>
 <20200615205320.790334-4-enric.balletbo@collabora.com>
 <20200620214225.GD74146@ravnborg.org>
 <0220cfe5-2ac9-2d8b-529d-bb1a61478395@collabora.com>
 <20200624070738.GA1807736@ravnborg.org>
 <20b2f097-d789-3f5a-cd7e-3701669f43cb@collabora.com>
Message-ID: <5af757da-87ec-c0d1-374d-0a69401e09a3@collabora.com>
Date: Fri, 21 Aug 2020 13:14:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20b2f097-d789-3f5a-cd7e-3701669f43cb@collabora.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 22 Aug 2020 09:02:00 +0000
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear drm_bridge maintainers,

It's been a while since I send these patches, and I'd like to find a proper
solution.

On 25/6/20 11:21, Enric Balletbo i Serra wrote:
> Hi Sam,
> 
> On 24/6/20 9:07, Sam Ravnborg wrote:
>> Hi Enric.
>>
>> On Tue, Jun 23, 2020 at 05:16:43PM +0200, Enric Balletbo i Serra wrote:
>>> Hi Sam,
>>>
>>> Many thanks for your feedback. See my answers below.
>>>
>>> On 20/6/20 23:42, Sam Ravnborg wrote:
>>>> Hi Enric.
>>>>
>>>> On Mon, Jun 15, 2020 at 10:53:20PM +0200, Enric Balletbo i Serra wrote:
>>>>> The get_edid() callback can be triggered anytime by an ioctl, i.e
>>>>>
>>>>>   drm_mode_getconnector (ioctl)
>>>>>     -> drm_helper_probe_single_connector_modes
>>>>>        -> drm_bridge_connector_get_modes
>>>>>           -> ps8640_bridge_get_edid
>>>>>
>>>>> Actually if the bridge pre_enable() function was not called before
>>>>> get_edid(), the driver will not be able to get the EDID properly and
>>>>> display will not work until a second get_edid() call is issued and if
>>>>> pre_enable() is called before.
>>>> Is it correct to fix this in the driver?
>>>> Why not just fail and tell user-sapce to try again later?
>>>> (Dunno what error-code to use - there must be one).
>>>>
>>>
>>> My undestanding, I might be wrong, is that userspace should don't know which
>>> bits, regulators, etc, are needed to get the EDID with an ioctl. Is the kernel
>>> that should make sure that all is set properly (the required regulators, etc)
>>> when userspace wants to read the EDID.
>>
>> The idea I suggest is that the kernel side should just error
>> out and let user-space retry later.
> 
> I see, I got it.
> 
>> So we avoid all the extra logic in the kernel because userspace wants
>> info before the HW is ready.
>> And userspace shall anyway deal with the ioctl that fails.
>>
> 
> My doubt here is, at which point the kernel driver should leave the hardware in
> a state that getting the EDID should work? After the bridge pre_enable() or
> enable() calls? After has been proved? AFAIK the bridge pre_enable() and
> enable() calls are only about enable the stream out and in most cases you can
> get the EDID without having to call pre_enable() and enable() before.
> 

Let me reformulate the question for if it was not clear.

What I did is be able to read the EDID every time userspace asks for it (so
kernel enables all the required) and Sam is proposing to just fail if all is not
setup. I can obviously do this but my question is, at which point I should leave
all the logic enabled to be able to read the EDID (after probe?, after
pre_enable, after enable?) It is not clear for me from the API.

Thanks,
 Enric


> Thanks,
>  Enric
> 
> 
>> 	Sam
>>
>>>
>>>> Then we avoid complicating drivers fro somethign we really should
>>>> fix in user-space.
>>>>
>>>>> The side effect of this, for example, is
>>>>> that you see anything when `Frecon` starts, neither the splash screen,
>>>> that you do not see ...
>>>>
>>>> (Otherwise I do not parse the above).
>>>>
>>>>> until the graphical session manager starts.
>>>>>
>>>>> To fix this we need to make sure that all we need is enabled before
>>>>> reading the EDID. This means the following:
>>>>>
>>>>> 1. If get_edid() is called before having the device powered we need to
>>>>>    power on the device. In such case, the driver will power off again the
>>>>>    device.
>>>>>
>>>>> 2. If get_edid() is called after having the device powered, all should
>>>>>    just work. We added a powered flag in order to avoid recurrent calls
>>>>>    to ps8640_bridge_poweron() and unneeded delays.
>>>>>
>>>>> 3. This seems to be specific for this device, but we need to make sure
>>>>>    the panel is powered on before do a power on cycle on this device.
>>>>>    Otherwise the device fails to retrieve the EDID.
>>>> Step 3. looks like an ugly hack too....
>>>>
>>>
>>> It is, but I don't have enough hardware details to be able to answer why we need
>>> to do this. What is well tested is that, if I don't power the panel before
>>> powering on the bridge, it doesn't get a proper EDID. Seems that when the bridge
>>> goes up, the firmware tries to read the EDID and caches somehow. Well not sure.
>>>
>>>>>
>>>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>>> ---
>>>>>
>>>>>  drivers/gpu/drm/bridge/parade-ps8640.c | 79 ++++++++++++++++++++++++--
>>>>>  1 file changed, 73 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
>>>>> index 9f7b7a9c53c52..ca651480891df 100644
>>>>> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
>>>>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>>>>> @@ -65,6 +65,7 @@ struct ps8640 {
>>>>>  	struct regulator_bulk_data supplies[2];
>>>>>  	struct gpio_desc *gpio_reset;
>>>>>  	struct gpio_desc *gpio_powerdown;
>>>>> +	bool powered;
>>>>>  };
>>>>>  
>>>>>  static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
>>>>> @@ -91,13 +92,25 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>>>>>  	return 0;
>>>>>  }
>>>>>  
>>>>> -static void ps8640_pre_enable(struct drm_bridge *bridge)
>>>>> +static void ps8640_bridge_poweron(struct ps8640 *ps_bridge)
>>>>>  {
>>>>> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>>>>  	struct i2c_client *client = ps_bridge->page[PAGE2_TOP_CNTL];
>>>>> +	struct drm_bridge *panel;
>>>>>  	unsigned long timeout;
>>>>>  	int ret, status;
>>>>>  
>>>>> +	if (ps_bridge->powered)
>>>>> +		return;
>>>>> +
>>>>> +	/*
>>>>> +	 * That seems to be specific to this chip, and a weird behaviour, but
>>>>> +	 * we need to call drm_panel_prepare before issuing a poweron cycle. If
>>>>> +	 * we don't do this, the chip is not able to read properly the EDID.
>>>>> +	 */
>>>>> +	panel = ps_bridge->panel_bridge;
>>>>> +	if (panel->funcs && panel->funcs->pre_enable)
>>>>> +		panel->funcs->pre_enable(panel);
>>>>> +
>>>>>  	ret = regulator_bulk_enable(ARRAY_SIZE(ps_bridge->supplies),
>>>>>  				    ps_bridge->supplies);
>>>>>  	if (ret < 0) {
>>>>> @@ -164,6 +177,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>>>>>  		goto err_regulators_disable;
>>>>>  	}
>>>>>  
>>>>> +	ps_bridge->powered = true;
>>>>> +
>>>>>  	return;
>>>>>  
>>>>>  err_regulators_disable:
>>>>> @@ -171,12 +186,13 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
>>>>>  			       ps_bridge->supplies);
>>>>>  }
>>>>>  
>>>>> -static void ps8640_post_disable(struct drm_bridge *bridge)
>>>>> +static void ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>>>>>  {
>>>>> -	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>>>> +	struct drm_bridge *panel;
>>>>>  	int ret;
>>>>>  
>>>>> -	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>>>>> +	if (!ps_bridge->powered)
>>>>> +		return;
>>>>>  
>>>>>  	gpiod_set_value(ps_bridge->gpio_reset, 1);
>>>>>  	gpiod_set_value(ps_bridge->gpio_powerdown, 1);
>>>>> @@ -184,6 +200,32 @@ static void ps8640_post_disable(struct drm_bridge *bridge)
>>>>>  				     ps_bridge->supplies);
>>>>>  	if (ret < 0)
>>>>>  		DRM_ERROR("cannot disable regulators %d\n", ret);
>>>>> +
>>>>> +	panel = ps_bridge->panel_bridge;
>>>>> +	if (panel->funcs && panel->funcs->post_disable)
>>>>> +		panel->funcs->post_disable(panel);
>>>>> +
>>>>> +	ps_bridge->powered = false;
>>>>> +}
>>>>> +
>>>>> +static void ps8640_pre_enable(struct drm_bridge *bridge)
>>>>> +{
>>>>> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>>>> +	int ret;
>>>>> +
>>>>> +	ps8640_bridge_poweron(ps_bridge);
>>>>> +
>>>>> +	ret = ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>>>>> +	if (ret < 0)
>>>>> +		ps8640_bridge_poweroff(ps_bridge);
>>>>> +}
>>>>> +
>>>>> +static void ps8640_post_disable(struct drm_bridge *bridge)
>>>>> +{
>>>>> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>>>> +
>>>>> +	ps8640_bridge_vdo_control(ps_bridge, DISABLE);
>>>>> +	ps8640_bridge_poweroff(ps_bridge);
>>>>>  }
>>>>>  
>>>>>  static int ps8640_bridge_attach(struct drm_bridge *bridge,
>>>>> @@ -249,9 +291,34 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>>>>>  					   struct drm_connector *connector)
>>>>>  {
>>>>>  	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>>>>> +	bool poweroff = !ps_bridge->powered;
>>>>> +	struct edid *edid;
>>>>> +
>>>>> +	/*
>>>>> +	 * When we end calling get_edid() triggered by an ioctl, i.e
>>>>> +	 *
>>>>> +	 *   drm_mode_getconnector (ioctl)
>>>>> +	 *     -> drm_helper_probe_single_connector_modes
>>>>> +	 *        -> drm_bridge_connector_get_modes
>>>>> +	 *           -> ps8640_bridge_get_edid
>>>>> +	 *
>>>>> +	 * We need to make sure that what we need is enabled before reading
>>>>> +	 * EDID, for this chip, we need to do a full poweron, otherwise it will
>>>>> +	 * fail.
>>>>> +	 */
>>>>> +	ps8640_bridge_poweron(ps_bridge);
>>>>>  
>>>>> -	return drm_get_edid(connector,
>>>>> +	edid = drm_get_edid(connector,
>>>>>  			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
>>>>> +
>>>>> +	/*
>>>>> +	 * If we call the get_edid() function without having enabled the chip
>>>>> +	 * before, return the chip to its original power state.
>>>>> +	 */
>>>>> +	if (poweroff)
>>>>> +		ps8640_bridge_poweroff(ps_bridge);
>>>>> +
>>>>> +	return edid;
>>>>>  }
>>>>>  
>>>>>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>>>>> -- 
>>>>> 2.27.0
>>>>>
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel@lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
