Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AA838E91
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 13:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B9810E7A9;
	Tue, 23 Jan 2024 12:31:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00EDF10E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 12:31:56 +0000 (UTC)
Message-ID: <23d0f0c0-d171-4b40-8135-da672714591c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1706013084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuSyEILrrJ4bPevKaikzWZq3Ix33Pu26FtdW4gUZRTI=;
 b=C8Khf+z7/6p4HSuqGvmLnnPR2qTEKsXEabm9YfZRH/sfc0qioP4UWX4gSxawC4bq24vnAz
 nW91ZXDed9kKTGiaiBwCk7c75ATzQzejQm8e7JqzRrIF+fVXqojNmCw/w0wAjUVCLjrHg/
 F9N10L9Df7ed+BTruESuan175jbWwzk=
Date: Tue, 23 Jan 2024 20:31:19 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] drm/bridge: simple-bridge: Extend match support for
 non-DT based systems
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240122163220.110788-1-sui.jingfeng@linux.dev>
 <20240122163220.110788-3-sui.jingfeng@linux.dev>
 <20240123012139.GD22880@pendragon.ideasonboard.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240123012139.GD22880@pendragon.ideasonboard.com>
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


On 2024/1/23 09:21, Laurent Pinchart wrote:
>>   static int simple_bridge_probe(struct platform_device *pdev)
>>   {
>>   	struct simple_bridge *sbridge;
>> @@ -176,7 +194,10 @@ static int simple_bridge_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>   	platform_set_drvdata(pdev, sbridge);
>>   
>> -	sbridge->info = of_device_get_match_data(&pdev->dev);
>> +	if (pdev->dev.of_node)
>> +		sbridge->info = of_device_get_match_data(&pdev->dev);
>> +	else
>> +		sbridge->info = simple_bridge_get_match_data(&pdev->dev);
>>   
>>   	/* Get the next bridge in the pipeline. */
>>   	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
>> @@ -309,3 +330,4 @@ module_platform_driver(simple_bridge_driver);
>>   MODULE_AUTHOR("Maxime Ripard<maxime.ripard@free-electrons.com>");
>>   MODULE_DESCRIPTION("Simple DRM bridge driver");
>>   MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:simple-bridge");
> This is an unrelated change.


Otherwise, this driver will not be probed when compiled as module on non-DT environment.

