Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9B838E5F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 13:19:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC67310E799;
	Tue, 23 Jan 2024 12:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com
 [95.215.58.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96EE10E799
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 12:19:00 +0000 (UTC)
Message-ID: <7f5e1c37-a637-494a-ab52-cad83095f2a6@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706012307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+RO8ZCOEQWp5sHoJ0tZq1/hmNsM9aQ9KeKI5CJdul+0=;
 b=rz/KJf5qy/FCuopbgX4LHM1yr0wPGONIwaJw7xK+IKkJGAV9FHVKllK9KNUByeZWgbtyQC
 lYJNRcMSU8J2p2+21yWKKPA5Bxmqet8DA60QdXighTJJdBCoPsBzYxcMl3P65Srgizuqsx
 37d5DYun7fCiISbaJ8CsuAvJO0tzeHA=
Date: Tue, 23 Jan 2024 20:18:22 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] drm/bridge: simple-bridge: Allow acquiring the next
 bridge with fwnode API
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-4-sui.jingfeng@linux.dev>
 <20240123011859.GB22880@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240123011859.GB22880@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2024/1/23 09:18, Laurent Pinchart wrote:
> On Tue, Jan 23, 2024 at 12:32:18AM +0800, Sui Jingfeng wrote:
>> Which make it possible to use this driver on non-DT based systems,
>> meanwhile, made no functional changes for DT based systems.
>>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
>>   drivers/gpu/drm/bridge/simple-bridge.c | 51 ++++++++++++++++++++++----
>>   1 file changed, 44 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
>> index 595f672745b9..cfea5a67cc5b 100644
>> --- a/drivers/gpu/drm/bridge/simple-bridge.c
>> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
>> @@ -184,6 +184,39 @@ static const void *simple_bridge_get_match_data(const struct device *dev)
>>   	return NULL;
>>   }
>>   
>> +static int simple_bridge_get_next_bridge_by_fwnode(struct device *dev,
>> +						   struct drm_bridge **next_bridge)
>> +{
>> +	struct drm_bridge *bridge;
>> +	struct fwnode_handle *ep;
>> +	struct fwnode_handle *remote;
>> +
>> +	ep = fwnode_graph_get_endpoint_by_id(dev->fwnode, 1, 0, 0);
>> +	if (!ep) {
>> +		dev_err(dev, "The endpoint is unconnected\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	remote = fwnode_graph_get_remote_port_parent(ep);
>> +	fwnode_handle_put(ep);
>> +	if (!remote) {
>> +		dev_err(dev, "No valid remote node\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	bridge = drm_bridge_find_by_fwnode(remote);
>> +	fwnode_handle_put(remote);
>> +
>> +	if (!bridge) {
>> +		dev_warn(dev, "Next bridge not found, deferring probe\n");
>> +		return -EPROBE_DEFER;
>> +	}
>> +
>> +	*next_bridge = bridge;
>> +
>> +	return 0;
>> +}
>> +
> Hmmmm yes, this convinces me further that we should switch to fwnode,
> not implement fwnode and OF side-by-side.
>

OK, I'm agree with you.


But this means that I have to make the drm_bridge_find_by_fwnode() function works
on both DT systems and non-DT systems. This is also means that we will no longer
need to call of_drm_find_bridge() function anymore. This will eventually lead to
completely remove of_drm_find_bridge()?


As far as I can see, if I follow you suggestion, drm/bridge subsystem will
encountering a *big* refactor. My 'side-by-side' approach allows co-exist.
It is not really meant to purge OF. I feel it is a little bit of aggressive.

hello Maxime, are you watching this? what do you think?


>>   static int simple_bridge_probe(struct platform_device *pdev)
>>   {
>>   	struct simple_bridge *sbridge;
>> @@ -199,14 +232,17 @@ static int simple_bridge_probe(struct platform_device *pdev)
>>   	else
>>   		sbridge->info = simple_bridge_get_match_data(&pdev->dev);
>>   
>> -	/* Get the next bridge in the pipeline. */
>> -	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
>> -	if (!remote)
>> -		return -EINVAL;
>> -
>> -	sbridge->next_bridge = of_drm_find_bridge(remote);
>> -	of_node_put(remote);
>> +	if (pdev->dev.of_node) {
>> +		/* Get the next bridge in the pipeline. */
>> +		remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
>> +		if (!remote)
>> +			return -EINVAL;
>>   
>> +		sbridge->next_bridge = of_drm_find_bridge(remote);
>> +		of_node_put(remote);
>> +	} else {
>> +		simple_bridge_get_next_bridge_by_fwnode(&pdev->dev, &sbridge->next_bridge);
>> +	}
>>   	if (!sbridge->next_bridge) {
>>   		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
>>   		return -EPROBE_DEFER;
>> @@ -231,6 +267,7 @@ static int simple_bridge_probe(struct platform_device *pdev)
>>   	/* Register the bridge. */
>>   	sbridge->bridge.funcs = &simple_bridge_bridge_funcs;
>>   	sbridge->bridge.of_node = pdev->dev.of_node;
>> +	sbridge->bridge.fwnode = pdev->dev.fwnode;
>>   	sbridge->bridge.timings = sbridge->info->timings;
>>   
>>   	drm_bridge_add(&sbridge->bridge);
>> -- 
>> 2.25.1
>>
