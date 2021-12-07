Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13F46C1C4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 18:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C257272D02;
	Tue,  7 Dec 2021 17:30:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C595A72D02
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 17:30:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A0FEF8129B;
 Tue,  7 Dec 2021 18:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1638898218;
 bh=HIdbLm2oFmEv7eq5TSWpeRm9Wk5/zBKYEkj0yuIPbm8=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=cOnBgn4/nszQz8yuwwIRFf1FM7tyOu0mlRlhi+EywShHP8sBvflt2Ms430SZoXDJH
 VxohMrGUd0a0bbk7QQt2MF81aGPCPKl1Y+Dcc56U2b3hsPtQ0+5FscNufqa8shMQYV
 rQ4Xze3LECk3SYb/Ra1huLQe9lBeH+TMPviUsfz85suZ2o5FwtKUIn8+wiAJOmjuyU
 EdSOzgO7L8FxABFfSb0IWd1DTcOymCrgx54jbbBG5U2DWBRlbuAP8piSWO9GPytR/I
 zvf1nEHVENXQ0DdDyUgo3nHdkEJ6ZBS+4T5l4E18QYY266wm0fMS65qYIGFbWwE1vO
 JK/B2SzoRg3bA==
Message-ID: <21d5610e-5446-cb9d-611b-b3d3a6207e0c@denx.de>
Date: Tue, 7 Dec 2021 18:30:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v5 2/2] drm/bridge: lvds-codec: Add support for pixel data
 sampling edge select
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
To: Sam Ravnborg <sam@ravnborg.org>
References: <20211017001204.299940-1-marex@denx.de>
 <20211017001204.299940-2-marex@denx.de> <YWxUB9y3qFzkfRR0@ravnborg.org>
 <075913ae-e5a0-3a9e-c928-55cae99ab0e5@denx.de>
 <YWxgKWXBpT6PyQO8@ravnborg.org>
 <3105193d-1809-699c-3281-1a3ecd274a03@denx.de>
 <1c2694a8-3764-c99a-0a74-be34b9fa604f@denx.de>
In-Reply-To: <1c2694a8-3764-c99a-0a74-be34b9fa604f@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/24/21 04:02, Marek Vasut wrote:
> On 10/24/21 1:04 AM, Marek Vasut wrote:
>> On 10/17/21 7:40 PM, Sam Ravnborg wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On Sun, Oct 17, 2021 at 07:29:51PM +0200, Marek Vasut wrote:
>>>> On 10/17/21 6:49 PM, Sam Ravnborg wrote:
>>>>
>>>> [...]
>>>>
>>>>>> +    /*
>>>>>> +     * Encoder might sample data on different clock edge than the 
>>>>>> display,
>>>>>> +     * for example OnSemi FIN3385 has a dedicated strapping pin 
>>>>>> to select
>>>>>> +     * the sampling edge.
>>>>>> +     */
>>>>>> +    if (lvds_codec->connector_type == DRM_MODE_CONNECTOR_LVDS &&
>>>>>> +        !of_property_read_u32(dev->of_node, "pclk-sample", &val)) {
>>>>>> +        lvds_codec->timings.input_bus_flags = val ?
>>>>>> +            DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE :
>>>>>> +            DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
>>>>>> +    }
>>>>>> +
>>>>>>        /*
>>>>>>         * The panel_bridge bridge is attached to the panel's of_node,
>>>>>>         * but we need a bridge attached to our of_node for our user
>>>>>>         * to look up.
>>>>>>         */
>>>>>>        lvds_codec->bridge.of_node = dev->of_node;
>>>>>> +    lvds_codec->bridge.timings = &lvds_codec->timings;
>>>>> I do not understand how this will work. The only field that is set 
>>>>> is timings.input_bus_flags
>>>>> but any user will see bridge.timings is set and will think this is all
>>>>> timing info.
>>>>>
>>>>> Maybe I just misses something obvious?
>>>>
>>>> Is there anything else in those timings that should be set ? See
>>>> include/drm/drm_bridge.h around line 640
>>>>
>>>> setup_time_ps/hold_time_ps/dual_link isn't supported by this driver, 
>>>> so it
>>>> is 0 or false anyway, i.e. no change.
>>>
>>> Just me being confused with display_timings. Patch looks good.
>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>>
>>> Ping me in a few days to apply it if there is no more feedback.
>>
>> Ping I guess ... Laurent ?
> 
> Ping one more time ?

Ping yet again ?
