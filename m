Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F94BC4D4
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F1310EB20;
	Sat, 19 Feb 2022 02:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF11010EB20
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:26:43 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E49AA83A8E;
 Sat, 19 Feb 2022 03:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645237601;
 bh=+s58WqbJtkKUk+jRmR0+dmvCOCCYRKkNcO3YylEd0fI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ggHMtAWLJXKczsphNLi2QC3kJhgcGEqNn+SSmAs1zGUEtYufeE87HwpidKdbOr/2B
 6DmHOnPS7WXShTp/q7I7atVZB/dXBK98vNlyXsC6D+MUvVszKvQugP0b5B5A5aFpEV
 Xxlks8/Z5oI0oJ5z7K2hyM6mb/Vne3UIT1JfGH9Kvz0FjOt7xX0gXI/Ci+uwTCbHoM
 8pP5k7Z45mpZ844hpZlOrOduDhvL5Urvek4rYcfsQzvX5EMOlA5FoCoNVhcPGsUnog
 FJVoCkroCg4U+NFmSHgnp2jtlG5Ai/gpGqccHn9awWP19eLfqJyn7/mphPoBXUII6q
 7oPmCcghd8xyg==
Message-ID: <d66055cd-6fab-ec32-8315-47dcc9a679b4@denx.de>
Date: Sat, 19 Feb 2022 03:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V2 04/11] drm/bridge: tc358767: Implement atomic_check
 callback
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20220218010054.315026-1-marex@denx.de>
 <20220218010054.315026-5-marex@denx.de>
 <e35ea5ca8d0103ffb7eb7d0e92ec7508829a588a.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e35ea5ca8d0103ffb7eb7d0e92ec7508829a588a.camel@pengutronix.de>
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

On 2/18/22 18:34, Lucas Stach wrote:

Hi

[...]

>>   drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>> index 522c2c4d8514f..01d11adee6c74 100644
>> --- a/drivers/gpu/drm/bridge/tc358767.c
>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>> @@ -1289,6 +1289,31 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
>>   	return true;
>>   }
>>   
>> +static int tc_edp_common_atomic_check(struct drm_bridge *bridge,
> 
> Drop the edp in the name here? Later in the series you call this
> function from the DPI code, so this breaks the nice clean naming
> separation from patch 1.
> 
>> +				      struct drm_bridge_state *bridge_state,
>> +				      struct drm_crtc_state *crtc_state,
>> +				      struct drm_connector_state *conn_state,
>> +				      const unsigned int max_khz)
>> +{
>> +	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
>> +			     &crtc_state->adjusted_mode);
>> +
>> +	if (crtc_state->adjusted_mode.clock > max_khz)
>> +		crtc_state->adjusted_mode.clock = max_khz;
> 
> I don't think this is correct. The adjusted most is just for minor
> adjustments if the bridge can not fully match the mode. If userspace
> supplies a invalid high modeclock I think it would be better to fail
> the atomic check -> return -EINVAL

Maxime was telling me that returning -EINVAL from atomic_check is weird, 
so maybe we should also wait for his opinion on this part.
