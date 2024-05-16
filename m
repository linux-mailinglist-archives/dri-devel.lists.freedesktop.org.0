Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7328C74B5
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDB410EC4B;
	Thu, 16 May 2024 10:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jrlp5AB4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
 [95.215.58.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C653810EC4B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:40:54 +0000 (UTC)
X-Envelope-To: mripard@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715856052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rNeJ2ZdpLPa8Jx4oYrQIUXFJQZti3fsu6ianHYlk4uM=;
 b=jrlp5AB46TnutoFegGgEWhaZUDIOwL5m6VvgVbPFGM8/CZgEbT/wfliSMBypIWUrswPDMV
 1Ha4bKruEl2QcA1LPH5FQMvQSfNUaeO5hhzoXYnZmMfEExGOyZ0aFrFLQFyE+0/p6cMUTo
 l1SHmiIXilN3PZ1lP8MRee1YcBKdPog=
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: dmitry.baryshkov@linaro.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <e955b706-04dd-479f-8327-32771d94f70f@linux.dev>
Date: Thu, 16 May 2024 18:40:45 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
 <c44480ab-8d6b-4334-8eba-83db9b30ff1a@linux.dev>
 <20240515-fair-satisfied-myna-480dea@penduick>
 <d394ee32-4fa4-41a8-a5ca-c1c7f77f44d2@linux.dev>
 <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
 <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
 <20240516-intrepid-uptight-tench-0df95e@penduick>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240516-intrepid-uptight-tench-0df95e@penduick>
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

On 5/16/24 16:25, Maxime Ripard wrote:
> On Wed, May 15, 2024 at 11:19:58PM +0800, Sui Jingfeng wrote:
>> Hi,
>>
>>
>> On 5/15/24 22:58, Maxime Ripard wrote:
>>> On Wed, May 15, 2024 at 10:53:00PM +0800, Sui Jingfeng wrote:
>>>> On 5/15/24 22:30, Maxime Ripard wrote:
>>>>> On Wed, May 15, 2024 at 12:53:33AM +0800, Sui Jingfeng wrote:
>>>>>> On 2024/5/15 00:22, Maxime Ripard wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
>>>>>>>> Because a lot of implementations has already added it into their drived
>>>>>>>> class, promote it into drm_bridge core may benifits a lot. drm bridge is
>>>>>>>> a driver, it should know the underlying hardware entity.
>>>>>>> Is there some actual benefits, or is it theoretical at this point?
>>>>>>
>>>>>>
>>>>>> I think, DRM bridge drivers could remove the 'struct device *dev'
>>>>>> member from their derived structure. Rely on the drm bridge core
>>>>>> when they need the 'struct device *' pointer.
>>>>>
>>>>> Sure, but why do we need to do so?
>>>>>
>>>>> The other thread you had with Jani points out that it turns out that
>>>>> things are more complicated than "every bridge driver has a struct
>>>>> device anyway", it creates inconsistency in the API (bridges would have
>>>>> a struct device, but not other entities), and it looks like there's no
>>>>> use for it anyway.
>>>>>
>>>>> None of these things are deal-breaker by themselves, but if there's only
>>>>> downsides and no upside, it's not clear to me why we should do it at all.
>>>>
>>>> It can reduce boilerplate.
>>>
>>> You're still using a conditional here.
>>
>> It's for safety reason, prevent NULL pointer dereference.
>> drm bridge can be seen as either a software entity or a device driver.
>>
>> It's fine to pass NULL if specific KMS drivers intend to see
>> drm bridge as a pure software entity, and for internal use only.
>> Both use cases are valid.
> 
> Sorry, I don't follow you. We can't NULL dereference a pointer that
> doesn't exist.
> 
> Please state why we should merge this series: what does it fix or
> improve, aside from the potential gain of making bridges declare one
> less pointer in their private structure.

We could reduce more.

Bridge driver instances also don't have to embed 'struct i2c_client *'. 
We could use 'to_i2c_client(bridge->dev)' to retrieve the pointer,
where needed.

> Maxime

-- 
Best regards
Sui
