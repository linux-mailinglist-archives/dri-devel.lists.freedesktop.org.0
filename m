Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02559C0925
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 15:44:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C62C10E866;
	Thu,  7 Nov 2024 14:44:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="l0kaYs1F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A2B10E866;
 Thu,  7 Nov 2024 14:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DSpTr+ubU1TgbK4HzHxTU6tZTxwj8vle3vfFmeg7iNk=; b=l0kaYs1FTos7nOI+KR1BYwTc7e
 lMlTdokarIUQ5WS1vTfOLLtHcxDOty40stAZanFCaNQuL4AzvboLi4Bv05nkw4wJFrSNsDMO7FFNe
 guD4wUhnPM1Oo2cRMrG0kJkwdR7ohOO9ynMw9BPs7EwP2LnQL+zHyQg6xT+gHE6JURcIcXYZapjbe
 0DbG0bD+WuDBZjERRS/J4VQmLDI5SZ+ATwl+j0iz+RS+N88uhdFqUSgL6/xV3SQu6y3UZsX6DxsQe
 bb/6csc6pUOd9dxlIuMGyG20yOgUyGQikuJf/AoGLsmP4aUwg2HWm6vR3rr9tbCRxd/B9qop4wXIU
 m20iEPSw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t93jo-003beD-2C; Thu, 07 Nov 2024 15:43:56 +0100
Message-ID: <bac29354-640f-4f39-b694-b611407c35ae@igalia.com>
Date: Thu, 7 Nov 2024 14:43:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] drm: add drm_memory_stats_is_zero
To: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20241025174113.554-1-Yunxiang.Li@amd.com>
 <20241025174113.554-5-Yunxiang.Li@amd.com>
 <b31fd5b2-094a-4d3a-bab9-83102726eefa@igalia.com>
 <SA1PR12MB8599D376A7EBAB3F46302297ED5C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <SA1PR12MB8599D376A7EBAB3F46302297ED5C2@SA1PR12MB8599.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 07/11/2024 14:17, Li, Yunxiang (Teddy) wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Sent: Thursday, November 7, 2024 5:41
>> On 25/10/2024 18:41, Yunxiang Li wrote:
>>> Add a helper to check if the memory stats is zero, this will be used
>>> to check for memory accounting errors.
>>>
>>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>>> ---
>>>    drivers/gpu/drm/drm_file.c | 9 +++++++++
>>>    include/drm/drm_file.h     | 1 +
>>>    2 files changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 714e42b051080..75ed701d80f74 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -859,6 +859,15 @@ static void print_size(struct drm_printer *p, const char
>> *stat,
>>>      drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
>>>    }
>>>
>>> +int drm_memory_stats_is_zero(const struct drm_memory_stats *stats) {
>>> +   return (stats->shared == 0 &&
>>> +           stats->private == 0 &&
>>> +           stats->resident == 0 &&
>>> +           stats->purgeable == 0 &&
>>> +           stats->active == 0);
>>> +}
>>
>> Could use mem_is_zero() for some value of source/binary compactness.
> 
> Yeah, the patch set started out with that when it's just a function in amdgpu, but Christ didn't like it.

Okay, I don't feel so strongly about the implementation details.

>>> +EXPORT_SYMBOL(drm_memory_stats_is_zero);
>>> +
>>
>> I am not a huge fan of adding this as an interface as the only caller appears to be a
>> sanity check in amdgpu_vm_fini():
>>
>>        if (!amdgpu_vm_stats_is_zero(vm))
>>                dev_err(adev->dev, "VM memory stats is non-zero when fini\n");
>>
>> But I guess there is some value in sanity checking since amdgpu does not have a
>> notion of debug only code (compiled at production and exercised via a test suite).
>>
>> I do suggest to demote the dev_err to notice log level would suffice and be more
>> accurate.
> 
> I think it's very important to have a check like this when we have a known invariant, especially in this case where there's stat tracking code spread out everywhere and we have very little chance of catching a bug right when it happened. And since whenever this check fails we know for sure there is a bug, I don't see the harm of keeping it as an error.
It would indeed be a programming error if it can happen, but from the 
point of view of a driver and system log I think a warning is actually 
right.

Regards,

Tvrtko

> 
> Now that I think about it, I probably want to have the process & task name in here to aid in reproduction.
> 
> Teddy
