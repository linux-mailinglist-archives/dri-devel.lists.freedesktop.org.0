Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1F1C05F8F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 13:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726C10E11D;
	Fri, 24 Oct 2025 11:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ho0I65ut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D830E10E11D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QqHW3yMFcjwfPzpNx2BqQpjJugfHcrhEo5Fz0PdAwsI=; b=Ho0I65utGc9K2PJiNt05C+7tGf
 wSCAdNtVi99CWy6jXqM51hgkaWfdDq3JBO/D4S3n+b1i4HshGxyWE6e6JrkFU5kUkFxTh3SdnmURK
 r5a8DrCAXENYN7CJ412a+eES1hxhYtalqPxiaK5ks8uTUWKw8iXOxGVCXl8Kx5QPE5sxg8fcVMOw4
 Vkwu+zrS9bso5UfdX+4JNiSlXbelwcjKrnV0hGYjmZt8AJ/MLKXPu8bSbAphA4lbdovsEJCRxfeb9
 5DNI0VxqvDCXSOUSCmUoDSrRFK1S/3uqxn19Fbiwdhv/3D1K0t1a3mbidodh2LmVd2mc8ACuQrO4f
 yovBjw4g==;
Received: from [90.242.12.242] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vCG1C-00Ejiy-3A; Fri, 24 Oct 2025 13:31:38 +0200
Message-ID: <1d0bbdcf-f4d6-49c0-bbdf-364c2af80868@igalia.com>
Date: Fri, 24 Oct 2025 12:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-fence: Correct return of dma_fence_driver_name()
To: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
References: <20251024075019.162351-2-phasta@kernel.org>
 <11b7a8a5-170f-4815-a8ac-5dba2d8e67a1@igalia.com>
 <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <5de88e79575e06c053f2d61f7bb58bf9cf5b556e.camel@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 24/10/2025 11:59, Philipp Stanner wrote:
> On Fri, 2025-10-24 at 09:31 +0100, Tvrtko Ursulin wrote:
>>
>> On 24/10/2025 08:50, Philipp Stanner wrote:
>>> To decouple the dma_fence_ops lifetime from dma_fences lifetime RCU
>>> support was added to said function, coupled with using the signaled bit
>>> to detect whether the fence_ops might be gone already.
>>>
>>> When implementing that a wrong string was set as a default return
>>> parameter, indicating that every driver whose fence is already signalled
>>> must be detached, which is frankly wrong.
>>
>> Depends on how you look at it. After being signaled fence has to be
>> detached from the driver. Ie. nothing belonging to this driver must be
>> accessed via the fence.
> 
> Is that even documented btw? Many of the mysterious "dma fence rules"
> are often only obtainable by asking Christian & Co

I tried to document it in the very patch which added it. Both in the 
commit message and in the large sticky-outy comments added to these helpers:

"""
  * dma_fence_driver_name - Access the driver name
  * @fence: the fence to query
  *
  * Returns a driver name backing the dma-fence implementation.
  *
  * IMPORTANT CONSIDERATION:
  * Dma-fence contract stipulates that access to driver provided data 
(data not
  * directly embedded into the object itself), such as the 
&dma_fence.lock and
  * memory potentially accessed by the &dma_fence.ops functions, is 
forbidden
  * after the fence has been signalled. Drivers are allowed to free that 
data,
  * and some do.
  *
  * To allow safe access drivers are mandated to guarantee a RCU grace 
period
  * between signalling the fence and freeing said data.
  *
  * As such access to the driver name is only valid inside a RCU locked 
section.
  * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block 
guarded
  * by the &rcu_read_lock and &rcu_read_unlock pair.
"""

> 
>>
>> I started with names and Christian has recently continued with ops.
>>
>>> Reported-by: Danilo Krummrich <dakr@kernel.org>
>>> Fixes: 506aa8b02a8d ("dma-fence: Add safe access helpers and document the rules")
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> When this was merged, it sadly slipped by me. I think this entire RCU
>>> mechanism was / is an overengineered idea.
>>>
>>> If we look at who actually uses dma_fence_driver_name() and
>>> dma_fence_timeline_name() – functions from which the largest share of
>>> the fence_ops vs. fence lifetime issue stems from – we discover that
>>> there is a single user:
>>>
>>> i915.
>>
> 
> […]
> 
>>
>>
>> That would be nice, I also do not see much value in exporting names to
>> userspace. But first more conversation around breaking the sync file ABI
>> needs to happen. I think we had a little bit of it when changing the
>> names of signalled fences and thinking was existing tools which look at
>> the names will mostly survive it. Not sure if they would if unsignalled
>> names would change.
> 
> I mean, what you and Christian are addressing in recent weeks are real
> problems, and I was / am about to write similar solutions for our Rust
> dma_fence.
> 
> In the case of those names, however, I'll likely just not support that
> in Rust, saving me from adding those RCU guards and delivering output
> of questionable use to users.
> (could ofc be added later by someone who really needs it…)

Sounds like a good plan to start without the problematic parts whenever 
possible. More than that I cannot comment since I have no idea how rust 
stuff will work and interact with the existing uapi entry points such as 
the sync file.

>>> P.
>>> ---
>>>    drivers/dma-buf/dma-fence.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>> index 3f78c56b58dc..1875a0abebd3 100644
>>> --- a/drivers/dma-buf/dma-fence.c
>>> +++ b/drivers/dma-buf/dma-fence.c
>>> @@ -1111,7 +1111,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>>>    	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>    		return fence->ops->get_driver_name(fence);
>>>    	else
>>> -		return "detached-driver";
>>> +		return "driver-whose-fence-is-already-signalled";
>>
>> IMHO unnecessarily verbose and whether or not changing it to anything
>> different warrants a Fixes: tag is debatable.
> 
> IMO the output is just wrong and confusing. It's easy to imagine that
> some user starts wondering and searching why his driver has been
> unloaded, opening support tickets and so on.
> 
> Could be less verbose, though. Dunno. I let the maintainer decide.

Driver and timeline usually come together so the signalled info is 
already there ie. "detached-driver signaled-timeline". For example in 
debugfs via dma_fence_describe().

So changing that to "driver-whose-fence-is-already-signalled 
signaled-timeline" still looks too much.

Also, the short name can be reduced from a verbose starting point 
similar to yours:

  "unknown-driver-is-detached-from-the-signaled-fence"
  "driver-detached-from-the-fence"
  "driver-detached"

Or keep "detached-driver" as good enough. Mea culpa for typing it up 
transposed. :)

Regards,

Tvrtko

> 
> P.
> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>    }
>>>    EXPORT_SYMBOL(dma_fence_driver_name);
>>>    
>>
> 

