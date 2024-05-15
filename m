Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5478C698C
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 17:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0405410E5B5;
	Wed, 15 May 2024 15:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="XFxgfMP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com
 [95.215.58.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4F610E4C2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 15:20:03 +0000 (UTC)
Message-ID: <2c15c859-6b2b-4979-8317-698bf6cc430c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715786402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmD4Qw+Oobw3jODJD0oLXnLEGlKRGxu/voHJf2ZarqM=;
 b=XFxgfMP3HPxLUow/pJcgRdJr6LVhiCG33NNCO9WQPk36A8Xk1FCTVDOgqDzgP73sAq7Rk4
 IWgSOsYKCKHgsAJlBedjYqWBPhMdG2LvTfrpV7ilPe5Ka7/0t4xvR9XL/UOM3+xFbMTcgv
 8RNIRLe1w9ETbdzwSueiZzzVYiP+/7E=
Date: Wed, 15 May 2024 23:19:58 +0800
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
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240515-copper-chimpanzee-of-fortitude-ff3dab@penduick>
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


On 5/15/24 22:58, Maxime Ripard wrote:
> On Wed, May 15, 2024 at 10:53:00PM +0800, Sui Jingfeng wrote:
>> On 5/15/24 22:30, Maxime Ripard wrote:
>>> On Wed, May 15, 2024 at 12:53:33AM +0800, Sui Jingfeng wrote:
>>>> On 2024/5/15 00:22, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
>>>>>> Because a lot of implementations has already added it into their drived
>>>>>> class, promote it into drm_bridge core may benifits a lot. drm bridge is
>>>>>> a driver, it should know the underlying hardware entity.
>>>>> Is there some actual benefits, or is it theoretical at this point?
>>>>
>>>>
>>>> I think, DRM bridge drivers could remove the 'struct device *dev'
>>>> member from their derived structure. Rely on the drm bridge core
>>>> when they need the 'struct device *' pointer.
>>>
>>> Sure, but why do we need to do so?
>>>
>>> The other thread you had with Jani points out that it turns out that
>>> things are more complicated than "every bridge driver has a struct
>>> device anyway", it creates inconsistency in the API (bridges would have
>>> a struct device, but not other entities), and it looks like there's no
>>> use for it anyway.
>>>
>>> None of these things are deal-breaker by themselves, but if there's only
>>> downsides and no upside, it's not clear to me why we should do it at all.
>>
>> It can reduce boilerplate.
> 
> You're still using a conditional here.


It's for safety reason, prevent NULL pointer dereference.
drm bridge can be seen as either a software entity or a device driver.

It's fine to pass NULL if specific KMS drivers intend to see
drm bridge as a pure software entity, and for internal use only.
Both use cases are valid.

> 
> Maxime

-- 
Best regards
Sui
