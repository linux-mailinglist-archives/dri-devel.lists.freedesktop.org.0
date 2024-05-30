Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63D8D48D1
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 11:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777A110E370;
	Thu, 30 May 2024 09:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="XGNk4hJY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E893F10E370
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 09:44:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44U9hplk108023;
 Thu, 30 May 2024 04:43:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717062231;
 bh=cVkiqLAx26wTUKDADQCPLftPp08NYweVhmUaWKz3dhg=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=XGNk4hJYYWvoixVg968XV3BYNcrzC1Rp1FBtMC3SKjEkHLykpAOPj8E04/sUg9pRX
 iUqKjPgYaGR9YoxtDBeAI3dV4gPq0cf3QJvPwlag8wmEy/4CXKUJgRpwlzpaAErm/N
 MRVcmvKohTFWM8lD/QsqhJlrk2GeBdEpx41u1ENY=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44U9hpPf108094
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 04:43:51 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 04:43:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 04:43:50 -0500
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44U9hhQV010017;
 Thu, 30 May 2024 04:43:43 -0500
Message-ID: <fa97de63-7657-4810-b5c3-1b9f8512e027@ti.com>
Date: Thu, 30 May 2024 15:13:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/bridge: Introduce early_enable and late disable
To: Maxime Ripard <mripard@kernel.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jyri Sarha <jyri.sarha@iki.fi>, Thomas
 Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, DRI Development List
 <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Thierry
 Reding <treding@nvidia.com>, Kieran Bingham
 <kieran.bingham+renesas@ideasonboard.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Jayesh Choudhary
 <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240511153051.1355825-1-a-bhatia1@ti.com>
 <20240511153051.1355825-7-a-bhatia1@ti.com>
 <20240516-bipedal-keen-taipan-eedbe7@penduick>
 <ba8d0b98-67d2-41e2-b568-a40543a9b0fa@ti.com>
 <20240521-realistic-imposing-lemur-aac3ad@houat>
 <1a6b8a83-b378-4869-b536-0fca76e428bf@ti.com>
 <20240528-encouraging-gray-lionfish-54ca83@houat>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <20240528-encouraging-gray-lionfish-54ca83@houat>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Hi Maxime,

On 28/05/24 17:13, Maxime Ripard wrote:
> On Fri, May 24, 2024 at 04:38:13PM GMT, Aradhya Bhatia wrote:
>> Hi Maxime,
>>
>> On 21/05/24 18:45, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Thu, May 16, 2024 at 03:10:15PM GMT, Aradhya Bhatia wrote:
>>>>>>  	/**
>>>>>>  	 * @pre_enable:
>>>>>>  	 *
>>>>>> @@ -285,6 +319,26 @@ struct drm_bridge_funcs {
>>>>>>  	 */
>>>>>>  	void (*enable)(struct drm_bridge *bridge);
>>>>>>  
>>>>>> +	/**
>>>>>> +	 * @atomic_early_enable:
>>>>>> +	 *
>>>>>> +	 * This callback should enable the bridge. It is called right before
>>>>>> +	 * the preceding element in the display pipe is enabled. If the
>>>>>> +	 * preceding element is a bridge this means it's called before that
>>>>>> +	 * bridge's @atomic_early_enable. If the preceding element is a
>>>>>> +	 * &drm_crtc it's called right before the crtc's
>>>>>> +	 * &drm_crtc_helper_funcs.atomic_enable hook.
>>>>>> +	 *
>>>>>> +	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
>>>>>> +	 * will not yet be running when this callback is called. The bridge can
>>>>>> +	 * enable the display link feeding the next bridge in the chain (if
>>>>>> +	 * there is one) when this callback is called.
>>>>>> +	 *
>>>>>> +	 * The @early_enable callback is optional.
>>>>>> +	 */
>>>>>> +	void (*atomic_early_enable)(struct drm_bridge *bridge,
>>>>>> +				    struct drm_bridge_state *old_bridge_state);
>>>>>> +
>>>>>>  	/**
>>>>>>  	 * @atomic_pre_enable:
>>>>>>  	 *
>>>>>> @@ -361,6 +415,21 @@ struct drm_bridge_funcs {
>>>>>>  	void (*atomic_post_disable)(struct drm_bridge *bridge,
>>>>>>  				    struct drm_bridge_state *old_bridge_state);
>>>>>>  
>>>>>> +	/**
>>>>>> +	 * @atomic_late_disable:
>>>>>> +	 *
>>>>>> +	 * This callback should disable the bridge. It is called right after the
>>>>>> +	 * preceding element in the display pipe is disabled. If the preceding
>>>>>> +	 * element is a bridge this means it's called after that bridge's
>>>>>> +	 * @atomic_late_disable. If the preceding element is a &drm_crtc it's
>>>>>> +	 * called right after the crtc's &drm_crtc_helper_funcs.atomic_disable
>>>>>> +	 * hook.
>>>>>> +	 *
>>>>>> +	 * The @atomic_late_disable callback is optional.
>>>>>> +	 */
>>>>>> +	void (*atomic_late_disable)(struct drm_bridge *bridge,
>>>>>> +				    struct drm_bridge_state *old_bridge_state);
>>>>>> +
>>>>>
>>>>> But more importantly, I don't quite get the use case you're trying to
>>>>> solve here.
>>>>>
>>>>> If I got the rest of your series, the Cadence DSI bridge needs to be
>>>>> powered up before its source is started. You can't use atomic_enable or
>>>>> atomic_pre_enable because it would start the source before the DSI
>>>>> bridge. Is that correct?
>>>>>
>>>>
>>>> That's right. I cannot use bridge_atomic_pre_enable /
>>>> bridge_atomic_enable here. But that's because my source is CRTC, which
>>>> gets enabled via crtc_atomic_enable.
>>>>
>>>>
>>>>> If it is, then how is it different from what
>>>>> drm_atomic_bridge_chain_pre_enable is doing? The assumption there is
>>>>> that it starts enabling bridges last to first, to it should be enabled
>>>>> before anything starts.
>>>>>
>>>>> The whole bridge enabling order code starts to be a bit of a mess, so it
>>>>> would be great if you could list all the order variations we have
>>>>> currently, and why none work for cdns-dsi.
>>>>>
>>>>
>>>> Of course! I can elaborate on the order.
>>>>
>>>> Without my patches (and given there isn't any bridge setting the
>>>> "pre_enable_prev_first" flag) the order of enable for any single display
>>>> chain, looks like this -
>>>>
>>>> 	crtc_enable
>>>> 	
>>>> 	bridge[n]_pre_enable
>>>> 	---
>>>> 	bridge[1]_pre_enable
>>>>
>>>> 	encoder_enable
>>>>
>>>> 	bridge[1]_enable
>>>> 	---
>>>> 	bridge[n]_enable
>>>>
>>>> The tidss enables at the crtc_enable level, and hence is the first
>>>> entity with stream on. cdns-dsi doesn't stand a chance with
>>>> bridge_atmoic_pre_enable / bridge_atmoic_enable hooks. And there is no
>>>> bridge call happening before crtc currently.
>>>
>>> Thanks for filling the blanks :)
>>>
>>> I assume that since cdns-dsi is a bridge, and it only has a simple
>>> encoder implementation, for it to receive some video signal we need to
>>> enable the CRTC before the bridge.
>>>
>>> If so, I think that's the original intent between the bridge pre_enable.
>>> The original documentation had:
>>>
>>>   pre_enable: this contains things needed to be done for the bridge
>>>   before this contains things needed to be done for the bridge before
>>>   this contains things needed to be done for the bridge before.
>>>
>>> and the current one has:
>>>
>>>   The display pipe (i.e. clocks and timing signals) feeding this bridge
>>>   will not yet be running when this callback is called. The bridge must
>>>   not enable the display link feeding the next bridge in the chain (if
>>>   there is one) when this callback is called.
>>>
>>> I would say the CRTC is such a source, even more so now that the encoder
>>> is usually transparent, so I think we should instead move the crtc
>>> enable call after the bridge pre_enable.
>>
>> Hmm, if I understand you right, the newer sequence of calls will look
>> like this,
>>
>> 	bridge[n]_pre_enable
>> 	---
>> 	bridge[1]_pre_enable
>>
>> 	crtc_enable
>> 	encoder_enable
>>
>> 	bridge[1]_enable
>> 	---
>> 	bridge[n]_enable
> 
> Yes :)
> 
>> I do agree with this. This makes sense. CRTC is indeed such a source,
>> and should ideally be enabled after the bridges are pre_enabled.
>>
>>>
>>> Would that work?
>>>
>>
>> So, this could potentially work, yes. The cdns-dsi would get pre_enabled
>> after all bridges after cdns-dsi are pre_enabled. But over a quick test
>> with BBAI64 + RPi Panel, I don't see any issue.
>>
>> However, the one concern that I have right now, is about breaking any
>> existing (albeit faulty) implementation which relies on CRTC being
>> enabled before the bridges are pre_enabled. =)
> 
> I don't think it'll be a big deal. If there was a proper encoder driver,
> it was probably gating the signal until it's enabled. If there isn't,
> then yeah it might disrupt things, but it mostly means that the driver
> wasn't properly split between pre_enable and enable.
> 
> So I think it's worth trying, and we'll see the outcome.
> 

Alright! =)

Have made the changes as per your suggestions in v2. Thanks!

Regards
Aradhya
