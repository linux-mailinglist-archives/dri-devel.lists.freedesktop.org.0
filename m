Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1303F917BA2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 11:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4275710E7E1;
	Wed, 26 Jun 2024 09:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="k7LQ+avH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C946B10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 09:02:38 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45Q92NJl080522;
 Wed, 26 Jun 2024 04:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1719392543;
 bh=54wAaIiD4m/ykE4XdWH2yMXSOmQcPrBTGoqUxFBoCqE=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=k7LQ+avHqscHnVOc0VdiAtB7B/JKvP5Qa3kwTIP7QuD2pscjy+QFvtvfkb31fzPdN
 nFCmjNFTAhM1LKXywlGyn8qj3ytYVn0w4y0VUrxGKxHHPCNwPU/h4mhWBTcK96bYI/
 UYPkAnRBhXxeQMVVsa3/7ON6xvoxGjA2PodelLtw=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45Q92NYJ086438
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 26 Jun 2024 04:02:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Jun 2024 04:02:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Jun 2024 04:02:22 -0500
Received: from [172.24.227.31] (uda0496377.dhcp.ti.com [172.24.227.31])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45Q92Gk9119268;
 Wed, 26 Jun 2024 04:02:17 -0500
Message-ID: <fb95b645-acf7-49a1-b938-a749b20003d4@ti.com>
Date: Wed, 26 Jun 2024 14:32:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: display-connector: Fix
 atomic_get_input_bus_fmt hook
To: <neil.armstrong@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>, Linux Kernel List
 <linux-kernel@vger.kernel.org>, Devarsh Thakkar <devarsht@ti.com>, Jayesh
 Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
References: <20240625095049.328461-1-a-bhatia1@ti.com>
 <1de36429-a27a-4244-8e39-4cb0b09b2689@linaro.org>
Content-Language: en-US
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <1de36429-a27a-4244-8e39-4cb0b09b2689@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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



On 25/06/24 19:46, Neil Armstrong wrote:
> On 25/06/2024 11:50, Aradhya Bhatia wrote:
>> The display-connector acts as a pass-through bridge. To truly reflect
>> that, this bridge should accept the same input format, as it expects to
>> output. That in turn should be the same as what the preceding bridge has
>> to output.
>>
>> While the get_output_fmt hook does exactly that by calling the same hook
>> of the previous bridge, the get_input_fmt hook should simply propagate
>> the expected output format as its required input format.
>>
>> Let's say bridge(n) converts YUV bus format to RGB before transmitting
>> the video signals. B is supposed to be RGB and A is YUV. The
>> get_input_fmt hook of bridge(n) should receive RGB as its expected
>> output format for it to select YUV as its required input format.
>>
>> Moreover, since the display-connector is a pass-through bridge, X and Y
>> should both be RGB as well.
>>
>>      +-------------+            +-------------+
>> A   |             |   B    X   |             |   Y
>> --->|  Bridge(n)  +--->    --->| Display     +--->
>>      |             |            | Connector   |
>>      |             |            |             |
>>      +-------------+            +-------------+
>>
>> But that's not what's happening at the moment.
>>
>> The core will call get_output_fmt hook of display-connector, which will
>> call the same hook of bridge(n). Y will get set to RGB because B is RGB.
>>
>> Now the core will call get_input_fmt hook of display-connector with Y =
>> RGB as its expected output format. This hook will in turn call the
>> get_input_fmt hook of bridge(n), with expected output as RGB. This hook
>> will then return YUV as its required input format, which will set X =
>> YUV.
>>
>> This is where things get off the track. The core will then call
>> bridge(n)'s get_input_fmt hook but this time the expected output will
>> have changed to X = YUV, instead of what ideally should have been X =
>> RGB. We don't know how bridge(n)'s input format requirement will change
>> now that its expected output format isn't RGB but YUV.
>>
>> Ideally, formats Y, X, B need to be the same and the get_input_fmt hook
>> for bridge(n) should be called with these as its expected output format.
>> Calling that hook twice can potentially change the expected output
>> format - which can then change the required input format again, or it
>> might just throw an -ENOTSUPP error.
>>
>> While many bridges don't utilize these APIs, or in a lot of cases A and
>> B are same anyway, it is not the biggest problem, but one that should be
>> fixed anyway.
>>
>> Fix this.
>>
>> Fixes: 7cd70656d128 ("drm/bridge: display-connector: implement bus
>> fmts callbacks")
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   drivers/gpu/drm/bridge/display-connector.c | 40 +---------------------
>>   1 file changed, 1 insertion(+), 39 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/display-connector.c
>> b/drivers/gpu/drm/bridge/display-connector.c
>> index ab8e00baf3f1..eebf1fbcdd23 100644
>> --- a/drivers/gpu/drm/bridge/display-connector.c
>> +++ b/drivers/gpu/drm/bridge/display-connector.c
>> @@ -131,50 +131,12 @@ static u32
>> *display_connector_get_output_bus_fmts(struct drm_bridge *bridge,
>>                                     num_output_fmts);
>>   }
>>   -/*
>> - * Since this bridge is tied to the connector, it acts like a
>> passthrough,
>> - * so concerning the input bus formats, either pass the bus formats
>> from the
>> - * previous bridge or MEDIA_BUS_FMT_FIXED (like
>> select_bus_fmt_recursive())
>> - * when atomic_get_input_bus_fmts is not supported.
>> - * This supports negotiation if the bridge chain has all bits in place.
>> - */
>> -static u32 *display_connector_get_input_bus_fmts(struct drm_bridge
>> *bridge,
>> -                    struct drm_bridge_state *bridge_state,
>> -                    struct drm_crtc_state *crtc_state,
>> -                    struct drm_connector_state *conn_state,
>> -                    u32 output_fmt,
>> -                    unsigned int *num_input_fmts)
>> -{
>> -    struct drm_bridge *prev_bridge = drm_bridge_get_prev_bridge(bridge);
>> -    struct drm_bridge_state *prev_bridge_state;
>> -
>> -    if (!prev_bridge ||
>> !prev_bridge->funcs->atomic_get_input_bus_fmts) {
>> -        u32 *in_bus_fmts;
>> -
>> -        *num_input_fmts = 1;
>> -        in_bus_fmts = kmalloc(sizeof(*in_bus_fmts), GFP_KERNEL);
>> -        if (!in_bus_fmts)
>> -            return NULL;
>> -
>> -        in_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
>> -
>> -        return in_bus_fmts;
>> -    }
>> -
>> -    prev_bridge_state =
>> drm_atomic_get_new_bridge_state(crtc_state->state,
>> -                                prev_bridge);
>> -
>> -    return prev_bridge->funcs->atomic_get_input_bus_fmts(prev_bridge,
>> prev_bridge_state,
>> -                                 crtc_state, conn_state, output_fmt,
>> -                                 num_input_fmts);
>> -}
>> -
>>   static const struct drm_bridge_funcs display_connector_bridge_funcs = {
>>       .attach = display_connector_attach,
>>       .detect = display_connector_detect,
>>       .edid_read = display_connector_edid_read,
>>       .atomic_get_output_bus_fmts =
>> display_connector_get_output_bus_fmts,
>> -    .atomic_get_input_bus_fmts = display_connector_get_input_bus_fmts,
>> +    .atomic_get_input_bus_fmts =
>> drm_atomic_helper_bridge_propagate_bus_fmt,
>>       .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>       .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>       .atomic_reset = drm_atomic_helper_bridge_reset,
>>
>> base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
> 
> This will break dw-hdmi YUV output negociation because returning
> output_format
> it won't even try to select something else than the connector output_fmt.
> 
> This is limitation of the bus_fmt negociation, it negociates in
> backwards, but
> if the last one uses bridge_propagate_bus_fmt, and a bridge before
> depends on the
> display support, it will be constrained by the first output_fmt.
> 

Thanks Neil!

I haven't been able to completely understand your concern above, but
here is what I was able to catch. Let me know if I missed something.

Are you concerned that since dw-hdmi (drm/bridge/synopsis/dw-hdmi.c) has
10+ output formats to offer, all of them won't be negotiated against the
dw-hdmi's get_input_fmt(), but just the first output_fmt?
Because the propagate_bus_fmt() API can only pass one format at a time?


> a bridge before depends on the display support,

Also, could you help me with what you mean here by 'display support'?


Regards
Aradhya
