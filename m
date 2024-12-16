Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC549F3E66
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 00:43:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC58B10E138;
	Mon, 16 Dec 2024 23:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UXD0DU9m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29D310E3A5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 23:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DrjoXku75VICDK14pvfN/FzFZTBKcQqHfmWiglk8yZQ=; b=UXD0DU9mTFE6D0TY3mrFpHEjk3
 1vLSYvNtZGA7grgSA/Zbv6hJBNXSVXmZEj9f0hjXKqBvjP3CwhNF+F0lhAnicq2MgossoWk4Ax7p3
 1JHKLuXYVfYu67qXgrP7vQIT6igLFzLI8egeq8q289ppv8UdToNE3n+g+ZkvpfW92ydVHQVP0xrkx
 YB5p2OHUFLoSFNk1rJ+Wzthmj83N6QdT9pZjSYTT1BAa8twua9Lfht3r8ch4ogKLKa7JI+w/L8WNw
 b7CwpyakHACRaHRAE7shphYn1SbDqv5upa5sXJ90QtMGVM1CfxoQ025JhUU9biw18xoknIRInUcl8
 BHORknaA==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNKjj-0047cF-IA; Tue, 17 Dec 2024 00:42:51 +0100
Message-ID: <69dac62f-cc28-4d47-80a7-fe79f92de191@igalia.com>
Date: Mon, 16 Dec 2024 20:42:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/vc4: Remove BOs seqnos
To: Melissa Wen <mwen@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-4-mcanal@igalia.com>
 <gmtygjcms4gh4r3zbjlq3lmzzwfpmra45gxbcn4f45h65u2qat@yk6ylcftz4ci>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <gmtygjcms4gh4r3zbjlq3lmzzwfpmra45gxbcn4f45h65u2qat@yk6ylcftz4ci>
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

Hi Melissa,

Thanks for your review!

On 16/12/24 17:25, Melissa Wen wrote:
> On 12/12, Maíra Canal wrote:
>> `bo->seqno`, `bo->write_seqno`, and `exec->bin_dep_seqno` are leftovers
>> from a time when VC4 didn't support DMA Reservation Objects. When they
>> were introduced, it made sense to think about tracking the correspondence
>> between the BOs and the jobs through the job's seqno.
>>
>> This is no longer needed, as VC4 already has support for DMA Reservation
>> Objects and attaches the "job done" fence to the BOs.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/vc4/vc4_crtc.c     | 22 +++++++++++-----------
>>   drivers/gpu/drm/vc4/vc4_drv.h      | 13 -------------
>>   drivers/gpu/drm/vc4/vc4_gem.c      | 18 ++----------------
>>   drivers/gpu/drm/vc4/vc4_validate.c | 11 -----------
>>   4 files changed, 13 insertions(+), 51 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
>> index cf40a53ad42e..3a5b5743cb2f 100644
>> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
>> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
>> @@ -919,10 +919,11 @@ vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
>>   	kfree(flip_state);
>>   }
>>   
>> -static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
>> +static void vc4_async_page_flip_seqno_complete(struct dma_fence *fence,
>> +					       struct dma_fence_cb *cb)
>>   {
>>   	struct vc4_async_flip_state *flip_state =
>> -		container_of(cb, struct vc4_async_flip_state, cb.seqno);
>> +		container_of(cb, struct vc4_async_flip_state, cb.fence);
> 
> hmm... I didn't get why you still call this function
> vc4_async_page_flip_seqno_complete if you are not using seqno anymore.

I'll rename it. Thanks!

> 
> On top of that, can we just use vc4_async_page_flip_fence_complete
> instead? I mean, looks like we don't need two different async page flip
> paths according to the hardware anymore.

`vc4_async_page_flip_seqno_complete()` updates the BO usecnt, which is
needed for VC4 (GEN == 4). Maxime, Dave, could you confirm that this
usecnt logic is still needed?

> 
>>   	struct vc4_bo *bo = NULL;
>>   
>>   	if (flip_state->old_fb) {
>> @@ -961,16 +962,15 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
>>   {
>>   	struct drm_framebuffer *fb = flip_state->fb;
>>   	struct drm_gem_dma_object *dma_bo = drm_fb_dma_get_gem_obj(fb, 0);
>> +	dma_fence_func_t async_page_flip_complete_function;
>>   	struct vc4_dev *vc4 = to_vc4_dev(dev);
>>   	struct dma_fence *fence;
>>   	int ret;
>>   
>> -	if (vc4->gen == VC4_GEN_4) {
>> -		struct vc4_bo *bo = to_vc4_bo(&dma_bo->base);
>> -
>> -		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
>> -					  vc4_async_page_flip_seqno_complete);
>> -	}
>> +	if (vc4->gen == VC4_GEN_4)
>> +		async_page_flip_complete_function = vc4_async_page_flip_seqno_complete;
>> +	else
>> +		async_page_flip_complete_function = vc4_async_page_flip_fence_complete;
>>   
>>   	ret = dma_resv_get_singleton(dma_bo->base.resv, DMA_RESV_USAGE_READ, &fence);
>>   	if (ret)
>> @@ -978,14 +978,14 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
>>   
>>   	/* If there's no fence, complete the page flip immediately */
>>   	if (!fence) {
>> -		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
>> +		async_page_flip_complete_function(fence, &flip_state->cb.fence);
>>   		return 0;
>>   	}
>>   
>>   	/* If the fence has already been completed, complete the page flip */
>>   	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
>> -				   vc4_async_page_flip_fence_complete))
>> -		vc4_async_page_flip_fence_complete(fence, &flip_state->cb.fence);
>> +				   async_page_flip_complete_function))
>> +		async_page_flip_complete_function(fence, &flip_state->cb.fence);
>>   
>>   	return 0;
>>   }

[...]

>> diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
>> index 4037c65eb269..1cbd95c4f9ef 100644
>> --- a/drivers/gpu/drm/vc4/vc4_gem.c
>> +++ b/drivers/gpu/drm/vc4/vc4_gem.c

[...]

>> @@ -845,12 +837,6 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
>>   			goto fail;
>>   	}
>>   
>> -	/* Block waiting on any previous rendering into the CS's VBO,
>> -	 * IB, or textures, so that pixels are actually written by the
>> -	 * time we try to read them.
>> -	 */
>> -	ret = vc4_wait_for_seqno(dev, exec->bin_dep_seqno, ~0ull, true);
> 
> Don't we still need waiting for fences here?
> 

As we indicate the implicit DMA reservation usage through the `enum
dma_resv_usage` flag, I believe we can be safe to assume that the BOs
won't be read before we finish writing.

Best Regards,
- Maíra

>> -- 
>> 2.47.1
>>

