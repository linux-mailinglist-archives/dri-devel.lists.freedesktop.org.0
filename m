Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BD19146B0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE39810E3DB;
	Mon, 24 Jun 2024 09:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="vqdJAv0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 641 seconds by postgrey-1.36 at gabe;
 Mon, 24 Jun 2024 09:52:29 UTC
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA2310E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1719222746;
 bh=BdV2tuC48NG4yYKfC4Tz5zl1VXkraBQh0nyshKoiFUA=;
 b=vqdJAv0IL8k1gLPRmHGXyIcNaHI/1F/9YM8qaFcDV6ex/ffZw7Jnfsf6i/MAw4SE59VAR9zdO
 ZaT58XjyUdStEeMkTs9Wp/wGIDEX7gN9iIENXAhYPdWdd35MDzNmNAydsaKvAjRfQdFt56uRJGo
 41ouN4l3QrMIkS9FAUXLtnQar55A3DqFLRFaAjv5CB6l5JMP8LFPlWkRGfM3TRwmGcyXxcF4Dx/
 Ez0tfrML+y0jCrgeUzp4Uo63fLIpVFbW+udY/qhZ3fo1thFQrTr7KxPz1kwMKH2Vzm2YXrMm/o6
 Q0UssVWiGtxF4df3/lm1zP4jrHUs4zDjaKrAjnrYFyfA==
Message-ID: <af41d129-53ce-4875-bee2-c331aa47c248@kwiboo.se>
Date: Mon, 24 Jun 2024 11:41:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm: bridge: dw_hdmi: Call poweron/poweroff from
 atomic enable/disable
To: neil.armstrong@linaro.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240611155108.1436502-1-jonas@kwiboo.se>
 <20240611155108.1436502-2-jonas@kwiboo.se>
 <dd6f7a67-e338-4c08-8520-8e85a953834b@linaro.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <dd6f7a67-e338-4c08-8520-8e85a953834b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66793f55e55100373d412cfb
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

Hi Neil,

On 2024-06-24 11:23, Neil Armstrong wrote:
> On 11/06/2024 17:50, Jonas Karlman wrote:
>> Change to only call poweron/poweroff from atomic_enable/atomic_disable
>> ops instead of trying to keep a bridge_is_on state and poweron/off in
>> the hotplug irq handler.
>>
>> A benefit of this is that drm mode_config mutex is always held at
>> poweron/off, something that may reduce the need for our own mutex.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 33 ++---------------------
>>   1 file changed, 2 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index 9f2bc932c371..34bc6f4754b8 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -172,7 +172,6 @@ struct dw_hdmi {
>>   	enum drm_connector_force force;	/* mutex-protected force state */
>>   	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
>>   	bool disabled;			/* DRM has disabled our bridge */
>> -	bool bridge_is_on;		/* indicates the bridge is on */
>>   	bool rxsense;			/* rxsense state */
>>   	u8 phy_mask;			/* desired phy int mask settings */
>>   	u8 mc_clkdis;			/* clock disable register */
>> @@ -2383,8 +2382,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
>>   
>>   static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
>>   {
>> -	hdmi->bridge_is_on = true;
>> -
>>   	/*
>>   	 * The curr_conn field is guaranteed to be valid here, as this function
>>   	 * is only be called when !hdmi->disabled.
>> @@ -2398,30 +2395,6 @@ static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
>>   		hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
>>   		hdmi->phy.enabled = false;
>>   	}
>> -
>> -	hdmi->bridge_is_on = false;
>> -}
>> -
>> -static void dw_hdmi_update_power(struct dw_hdmi *hdmi)
>> -{
>> -	int force = hdmi->force;
>> -
>> -	if (hdmi->disabled) {
>> -		force = DRM_FORCE_OFF;
>> -	} else if (force == DRM_FORCE_UNSPECIFIED) {
>> -		if (hdmi->rxsense)
>> -			force = DRM_FORCE_ON;
>> -		else
>> -			force = DRM_FORCE_OFF;
>> -	}
> 
> This means we always poweron the bridge even if rxsense is false ?

If I follow the logic there should not be any difference, beside that
power on now only happen in atomic_enable instead of sometime in irq
handler.

hdmi->rxsense is set to true based on hpd in dw_hdmi_setup_rx_sense().
For both meson and dw-hdmi this means HPD=1 and not rxsense=1.

drm core will call the force/detect ops and enable/disable based on
forced/HPD state, so I am not expecting any difference in how this
currently works.

This change to only poweron/setup in atomic_enable should also fix
issues/situations where dw-hdmi was poweron too early during bootup in
irq handler, before the drm driver was fully probed.

Regards,
Jonas

> 
> Neil
> 
>> -
>> -	if (force == DRM_FORCE_OFF) {
>> -		if (hdmi->bridge_is_on)
>> -			dw_hdmi_poweroff(hdmi);
>> -	} else {
>> -		if (!hdmi->bridge_is_on)
>> -			dw_hdmi_poweron(hdmi);
>> -	}
>>   }
>>   
>>   /*
>> @@ -2546,7 +2519,6 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
>>   
>>   	mutex_lock(&hdmi->mutex);
>>   	hdmi->force = connector->force;
>> -	dw_hdmi_update_power(hdmi);
>>   	dw_hdmi_update_phy_mask(hdmi);
>>   	mutex_unlock(&hdmi->mutex);
>>   }
>> @@ -2955,7 +2927,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>>   	mutex_lock(&hdmi->mutex);
>>   	hdmi->disabled = true;
>>   	hdmi->curr_conn = NULL;
>> -	dw_hdmi_update_power(hdmi);
>> +	dw_hdmi_poweroff(hdmi);
>>   	dw_hdmi_update_phy_mask(hdmi);
>>   	handle_plugged_change(hdmi, false);
>>   	mutex_unlock(&hdmi->mutex);
>> @@ -2974,7 +2946,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
>>   	mutex_lock(&hdmi->mutex);
>>   	hdmi->disabled = false;
>>   	hdmi->curr_conn = connector;
>> -	dw_hdmi_update_power(hdmi);
>> +	dw_hdmi_poweron(hdmi);
>>   	dw_hdmi_update_phy_mask(hdmi);
>>   	handle_plugged_change(hdmi, true);
>>   	mutex_unlock(&hdmi->mutex);
>> @@ -3073,7 +3045,6 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
>>   		if (hpd)
>>   			hdmi->rxsense = true;
>>   
>> -		dw_hdmi_update_power(hdmi);
>>   		dw_hdmi_update_phy_mask(hdmi);
>>   	}
>>   	mutex_unlock(&hdmi->mutex);
> 

