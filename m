Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9F81AEB3D
	for <lists+dri-devel@lfdr.de>; Sat, 18 Apr 2020 11:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6E06EC69;
	Sat, 18 Apr 2020 09:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4769E6E839
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 14:51:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 047E72A22E0
Subject: Re: [PATCH v2 1/7] drm/bridge: ps8640: Get the EDID from eDP control
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
 <20200416155720.2360443-2-enric.balletbo@collabora.com>
 <20200416172215.GK4796@pendragon.ideasonboard.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <95bf8d3b-3daf-c505-eeb0-e5ef167085ac@collabora.com>
Date: Fri, 17 Apr 2020 16:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200416172215.GK4796@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 18 Apr 2020 09:26:15 +0000
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
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 16/4/20 19:22, Laurent Pinchart wrote:
> Hi Enric,
> 
> Thank you for the patch.
> 
> On Thu, Apr 16, 2020 at 05:57:13PM +0200, Enric Balletbo i Serra wrote:
>> The PS8640 DSI-to-eDP bridge can retrieve the EDID, so implement the
>> .get_edid callback and set the flag to indicate the core to use it.
>>
>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
>>
>> Changes in v2: None
>>
>>  drivers/gpu/drm/bridge/parade-ps8640.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
>> index d3a53442d449..956b76e0a44d 100644
>> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>> @@ -242,8 +242,18 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>>  	return ret;
>>  }
>>  
>> +static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
>> +					   struct drm_connector *connector)
>> +{
>> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
>> +
>> +	return drm_get_edid(connector,
>> +			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
> 
> This will only work if the DDC signals are connected to the PS8640
> (quite obviously). Is that guaranteed, or could some systems connect
> them directory to an SoC I2C controller ?

It is possible but IMHO opinion this is hardware tricky, I mean, ps8640 outputs
eDP interface and the panel is an eDP interface, so I'd expect hardware
engineers do a pin to pin design, not routing the DDC signals to the SoC
directly ignoring the eDP interface.

> In the latter case we would
> have to report this in the DT bindings of the PS8640. That's not
> blocking for this patch, I am just wondering, as I would have expected
> the driver to already expose EDID one way or another if this was
> available and used.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>> +}
>> +
>>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>>  	.attach = ps8640_bridge_attach,
>> +	.get_edid = ps8640_bridge_get_edid,
>>  	.post_disable = ps8640_post_disable,
>>  	.pre_enable = ps8640_pre_enable,
>>  };
>> @@ -296,6 +306,8 @@ static int ps8640_probe(struct i2c_client *client)
>>  
>>  	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
>>  	ps_bridge->bridge.of_node = dev->of_node;
>> +	ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
>> +	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
>>  
>>  	ps_bridge->page[PAGE0_DP_CNTL] = client;
>>  
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
