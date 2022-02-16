Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 756EA4B923A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 21:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1C210E469;
	Wed, 16 Feb 2022 20:24:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2447810E469
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 20:24:46 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D3272837B6;
 Wed, 16 Feb 2022 21:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645043084;
 bh=68921PF21eeHI8HCFtsxA7loYB/5Atb+n2y62HImstY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IinboJrq+Tkh406EDk0Ivg5OuKDNttjadwZ3dN3nYwnXL6xpsoEHnpqN2v6wr3kn1
 8V6Y7PP/2PLcCiSTnaHCU6XX72VvAZZtz0yQK2axfdydEukA0O4TxKoKkYxqnMzhJX
 JpGBGv+iH7iq3/u/OcFillzu2ioxLsuQyqNGniEsPsTl4PpoHLlzI2TlJ2NzSGkjaS
 7glENOavluVM2vbY0QijKSDwYNtG64O3tRzT361OghlQIoUsu7Be/TA6KQNjN7aDCd
 YLnY1Mr1xYzp2MsNRl+YQoLLQ25ExzBQeaeF0iTzVirKcup2EaCV/Ubmb8J+nyhgXo
 LEIABRMDUAq5g==
Message-ID: <2801ac06-7f49-32b2-f662-6a0edda1bc1b@denx.de>
Date: Wed, 16 Feb 2022 21:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 05/14] drm: bridge: icn6211: Retrieve the display mode
 from the state
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220114034838.546267-1-marex@denx.de>
 <20220114034838.546267-5-marex@denx.de>
 <20220203120903.puueinbzetzzbqpm@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220203120903.puueinbzetzzbqpm@houat>
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

On 2/3/22 13:09, Maxime Ripard wrote:
> On Fri, Jan 14, 2022 at 04:48:29AM +0100, Marek Vasut wrote:
>> Retrieve display mode structure from panel or atomic state in
>> bridge_to_mode(). This completes the transition to the atomic
>> API.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Robert Foss <robert.foss@linaro.org>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> To: dri-devel@lists.freedesktop.org
>> ---
>>   drivers/gpu/drm/bridge/chipone-icn6211.c | 26 +++++++++++++++++++++---
>>   1 file changed, 23 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> index 14d28e7356aaa..d6db1e77b5a35 100644
>> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
>> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
>> @@ -146,9 +146,28 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
>>   	return container_of(bridge, struct chipone, bridge);
>>   }
>>   
>> -static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
>> +static const struct drm_display_mode *
>> +bridge_to_mode(struct drm_bridge *bridge, struct drm_atomic_state *state)
>>   {
>> -	return &bridge->encoder->crtc->state->adjusted_mode;
>> +	const struct drm_crtc_state *crtc_state;
>> +	struct drm_connector *connector;
>> +	struct drm_crtc *crtc;
>> +
>> +	/* Try to retrieve panel mode first. */
>> +	connector = drm_atomic_get_new_connector_for_encoder(state,
>> +							     bridge->encoder);
>> +	if (!list_empty(&connector->modes)) {
>> +		return list_first_entry(&connector->modes,
>> +					struct drm_display_mode, head);
>> +	}
> 
> If I understand this right, this will return the first mode on the
> connector, which should be always set. So you always end up returning
> the preferred mode for that panel?
> 
>> +	/*
>> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
>> +	 * from the bridge to the encoder, to the connector and to the CRTC.
>> +	 */
>> +	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>> +	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>> +	return &crtc_state->adjusted_mode;
> 
> And thus entirely disregarding the actual mode that was set by the
> userspace, or ignoring any other mode than the preferred one?

This one is actually no longer needed and can be dropped.
