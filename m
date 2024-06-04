Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B38FBA4A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 19:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B2710E30F;
	Tue,  4 Jun 2024 17:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="wRjgjC95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2C510E2B2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 17:27:05 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5CEFD884B8;
 Tue,  4 Jun 2024 19:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1717522024;
 bh=xBvacjajTYRSgBByqOvWHI/umiM5+eWqHCC8nj12OBQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wRjgjC95X2uikuZHHksymU6CYd/CV9OvjGG6+uEel61WN0nvH8ZCK+jH8EqWUV8yT
 k92dxDjRgv+jkaSznRO/CnrM3OpX8xNPzU9Rpb/WvGwHFwLixq7SaU2uLGZx1oeCer
 C5yS+ZNHXgqtffEaP9woUv1L/9O3zrOsc9PA3tKGNSXxwJuWRO6Z57M4d6b6J7LamO
 51CPjOeighZoHUy1F1/fFZe2amHJ+fLCvi0Gm8nCAu4UjzurkX0tf4a7uWIuLPuPVX
 8HlRBlwYoaY9HMfeQeKOc0UaJRGNCX3tsSfvbI7AwPwQjXu+DZfWk6Uck85z4k+R/E
 ftaxx2EASUKEg==
Message-ID: <cf442ab8-6a8b-419a-abf1-7449f1885c4e@denx.de>
Date: Tue, 4 Jun 2024 18:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: tc358767: Add configurable default
 preemphasis
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com
References: <20240531204339.277848-1-marex@denx.de>
 <20240531204339.277848-2-marex@denx.de> <2272229.iZASKD2KPV@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2272229.iZASKD2KPV@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/4/24 11:49 AM, Alexander Stein wrote:

Hi,

>> @@ -2372,6 +2392,21 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
>>   		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
>>   	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
>>   
>> +	port = of_graph_get_port_by_id(dev->of_node, 2);
>> +	if (!port)
>> +		return 0;
>> +
>> +	of_property_read_u8_array(port, "toshiba,pre-emphasis",
>> +				  tc->pre_emphasis,
>> +				  ARRAY_SIZE(tc->pre_emphasis));
> 
> This doesn't match the bindings. Bindings say it's a property of the
> endpoint, not the port. Additionally it's uint32-array, not uint8-array.

It should be u8. Moved to endpoint parsing in V2, thanks.
