Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 313A44C3545
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0841A10EE83;
	Thu, 24 Feb 2022 19:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D6ED10EE83
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:03:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EF68F83902;
 Thu, 24 Feb 2022 20:03:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645729391;
 bh=sQecAQtDfzW2NvIH+FVj7qhNPJWTkQWMX2BFOaOjGhM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=y+NWtl5CITGfHfkY76N3hMSk5zuGhxELfCDbjudRZJumINnL8eE9KDzHD93NhG9p/
 5SMqF6nLbAku93A5ihniobkrE4HWnm978he+tCCBYtqWDudqDb6afv4iXcZ6fySwE+
 cEbVGSLcj9yJFQM8Q8/3MDJxfmbiKD06NdrLifHkPqmNuz+bAQmbHtGACt5WIp9k7Z
 TmhLE1DE1qyQJ16Cbjc3hbQfa4oz8ImhItI78tlgS/H4GD7CyO7dMMbJyGhAyTfKz3
 GvwdtHm6Gb1p8q26ztV28z1DS5xrNnIdycydonfPV4WjQJCD4YPXzixdjeB2p9McZF
 Qhs7RMk2G8YRA==
Message-ID: <48b35d14-4775-dde8-4eab-caa4872b7bae@denx.de>
Date: Thu, 24 Feb 2022 20:03:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 04/11] drm/bridge: tc358767: Implement atomic_check
 callback
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-5-marex@denx.de>
 <e35ea5ca8d0103ffb7eb7d0e92ec7508829a588a.camel@pengutronix.de>
 <d66055cd-6fab-ec32-8315-47dcc9a679b4@denx.de>
 <20220221090111.qk5nweyaeg7ptfuo@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220221090111.qk5nweyaeg7ptfuo@houat>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/21/22 10:01, Maxime Ripard wrote:
> On Sat, Feb 19, 2022 at 03:26:40AM +0100, Marek Vasut wrote:
>> On 2/18/22 18:34, Lucas Stach wrote:
>>
>> Hi
>>
>> [...]
>>
>>>>    drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
>>>>    1 file changed, 26 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>>>> index 522c2c4d8514f..01d11adee6c74 100644
>>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>>> @@ -1289,6 +1289,31 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>>>>    	return true;
>>>>    }
>>>> +static int tc_edp_common_atomic_check(struct drm_bridge *bridge,
>>>
>>> Drop the edp in the name here? Later in the series you call this
>>> function from the DPI code, so this breaks the nice clean naming
>>> separation from patch 1.
>>>
>>>> +				      struct drm_bridge_state *bridge_state,
>>>> +				      struct drm_crtc_state *crtc_state,
>>>> +				      struct drm_connector_state *conn_state,
>>>> +				      const unsigned int max_khz)
>>>> +{
>>>> +	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
>>>> +			     &crtc_state->adjusted_mode);
>>>> +
>>>> +	if (crtc_state->adjusted_mode.clock > max_khz)
>>>> +		crtc_state->adjusted_mode.clock = max_khz;
>>>
>>> I don't think this is correct. The adjusted most is just for minor
>>> adjustments if the bridge can not fully match the mode. If userspace
>>> supplies a invalid high modeclock I think it would be better to fail
>>> the atomic check -> return -EINVAL
>>
>> Maxime was telling me that returning -EINVAL from atomic_check is weird, so
>> maybe we should also wait for his opinion on this part.
> 
> That was in a completely different context?
> 
> Our discussion was about how you would propagate clock constraints
> across a pipeline, and I was telling you that it would be weird to
> return -EINVAL for a mode that was reported on a connector as supported
> (or even preferred).
> 
> My argument was for mode_valid to filter them out.
> 
> If your clock is way above what you can support on your device, then
> returning an error in atomic_check is the right thing to do.

Ah OK
