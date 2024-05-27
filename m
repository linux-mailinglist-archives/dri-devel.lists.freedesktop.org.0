Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08588CF761
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 04:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A6B10F79B;
	Mon, 27 May 2024 02:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="aI1YAsuy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com
 [95.215.58.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E3B10F79B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:01:47 +0000 (UTC)
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716775304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C4KbC23pVUx2ZjByBYlN7VlAIPsbM3xhWrQdhcgUorw=;
 b=aI1YAsuyn35SzhLYiWlpO+d5nNexjamENbPmTyQSbuBnXV4YNy/F9IQ3Sh1BPtVMC5VAtv
 dhCQQx1ME086s38TXjxcZDILTzAdK8+2w25Bss+qnOaR1m3Po54Et78J9AI1DWM09UQ9Z1
 DQhvk+bhFzFdb+ySSykqQKW0B9+bOzo=
X-Envelope-To: rfoss@kernel.org
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <03701609-86b7-47a3-85af-db47035695fb@linux.dev>
Date: Mon, 27 May 2024 10:01:35 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge
 instances automatically
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240526202115.129049-1-sui.jingfeng@linux.dev>
 <20240526202115.129049-3-sui.jingfeng@linux.dev>
 <lfgb24qv22sohgizlmt7kq3ymnshjeawlkwwcndivbeiloip55@x3qnu4ss3x4y>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <lfgb24qv22sohgizlmt7kq3ymnshjeawlkwwcndivbeiloip55@x3qnu4ss3x4y>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 5/27/24 05:19, Dmitry Baryshkov wrote:
> On Mon, May 27, 2024 at 04:21:07AM +0800, Sui Jingfeng wrote:
>> Normally, the drm_bridge::of_node won't be used by bridge driver instances
>> themselves. Rather, it is mainly used by other modules to find associated
>> drm bridge drvier. Therefore, adding a drm bridge to the global bridge list
>> and setting 'of_node' field of a drm bridge share the same goal. Both are
>> for finding purpose, therefore better to group them to one function.
>>
>> Update the drm_bridge_add() interface and implementation to achieve such
>> goal atomically, new implementation will fetch the device node from the
>> backing device of the drm bridge driver automatically. For the majority
>> cases, which is one device backing one drm bridge driver, this model works
>> well. Drivers still can set it manually by passing NULL if this model
>> doesn't fit.
>>
>> While at it, Add a 'struct device *' pointer to the drm_bridge structure.
>> As it already being passed in by both of drm_bridge_add() and
>> devm_drm_bridge_add(). A lot of driver instances has already added it into
>> their derived structure, promote it into drm_bridge core helps to reduce
>> a batch of boilerplates.
>>
>> Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
>> ---
> 
> [trimmed]
> 
>> @@ -231,7 +243,7 @@ static void drm_bridge_remove_void(void *bridge)
>>    */
>>   int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
>>   {
>> -	drm_bridge_add(bridge);
>> +	drm_bridge_add(bridge, dev);
>>   	return devm_add_action_or_reset(dev, drm_bridge_remove_void, bridge);
> 
> This breaks aux-hpd-bridge, which gets of_node as an external pointer
> rather than dev->of_node.
> 

Yes, you are right. I forget to modify that driver.
My bad, will be fixed at the next version.

-- 
Best regards
Sui
