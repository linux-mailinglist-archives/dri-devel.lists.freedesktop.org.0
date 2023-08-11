Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD2677956B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03ADF10E6C2;
	Fri, 11 Aug 2023 16:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D4010E6C2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:58:23 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CE77DFB;
 Fri, 11 Aug 2023 18:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691773032;
 bh=bShxo1jKF9pYDYG+jLk6w+AipRBx9OfbfoiVO7qx9I4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QJAihD4bh5YnH3QPWKANpmfLLvt5m2cf/M/QW8B0KSrQlYS/zIWfDZFjZ7q6HJu2r
 +Z7pFGa4PaoP4zB4OA4vlu3ds+m9lSEE604WTUBn6urYkRL18ll6V1EZKuZ0jfBIGs
 5XRyEKKj6WBxpZrZSX3zni8btn6CY3kglZ4J5eqY=
Message-ID: <095208cc-7966-db1d-4259-567eba9eafec@ideasonboard.com>
Date: Fri, 11 Aug 2023 19:58:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 11/11] drm/bridge: tc358768: Add
 DRM_BRIDGE_ATTACH_NO_CONNECTOR support
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-11-1afd44b7826b@ideasonboard.com>
 <bce1096a-ffd5-4fd7-a279-7b5235b81b3f@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <bce1096a-ffd5-4fd7-a279-7b5235b81b3f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2023 19:44, Péter Ujfalusi wrote:
> 
> 
> On 04/08/2023 13:44, Tomi Valkeinen wrote:
> 
> I would rather have a commit message than a blank one.

Oops...

>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/tc358768.c | 64 +++++++++++++++++++++++++++------------
>>   1 file changed, 45 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
>> index ea19de5509ed..a567f136ddc7 100644
>> --- a/drivers/gpu/drm/bridge/tc358768.c
>> +++ b/drivers/gpu/drm/bridge/tc358768.c
>> @@ -131,8 +131,17 @@ static const char * const tc358768_supplies[] = {
>>   
>>   struct tc358768_dsi_output {
>>   	struct mipi_dsi_device *dev;
>> +
>> +	/* Legacy field if DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used */
>>   	struct drm_panel *panel;
>> -	struct drm_bridge *bridge;
>> +
>> +	/*
>> +	 * If DRM_BRIDGE_ATTACH_NO_CONNECTOR is not used and a panel is attached
>> +	 * to tc358768, 'next_bridge' contains the bridge the driver created
>> +	 * with drm_panel_bridge_add_typed(). Otherwise 'next_bridge' contains
>> +	 * the next bridge the driver found.
>> +	 */
>> +	struct drm_bridge *next_bridge;
> 
> why it is better to call it next_bridge than just bridge? Is there a
> prev_bridge also?

There is, prev bridge would be the bridge behind tc358768 in the chain. 
Bridge is tc358768. Next bridge is the following one.

Here, it's in the tc358768_dsi_output struct, so bridge is perhaps ok. I 
just wanted to be extra clear here, as I think it's often called 
next_bridge in other drivers.

  Tomi

