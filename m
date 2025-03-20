Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620BDA6A54B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA7E10E5FD;
	Thu, 20 Mar 2025 11:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="jQk/5Wjn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE7210E5F5;
 Thu, 20 Mar 2025 11:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2FEQ1rUHsmuKWgWng2ln48odDFqA+++X06u4gW1llYE=; b=jQk/5Wjn6y7Oqc1m6mwIXddd//
 PJFEGbSRTSfZKiXXCNQurXP8hHevh/Y9MVRBc+xOVgbosWZvPyi7m/f0wmztvmwqdO4OouC0T4vY2
 6HHivsMtT47v7iwvvpXldH3AtAA8uSRtzG0fhd9fzdMw68SipI9Ep5BhjsHJmhc9YSR1CSQJFjHIz
 UQc8rLqElcTu9fCn9biCi/mKVpcjuZwxV80ZM0HH4+JiqTZBuywB9aLnpiOIfnU6raDp5VF51KuM4
 j/GNI3GVip3jKOtHXzbGyDHm8MiEbXoe8wvOecKfjpflVaj29XegZFRt+jiBCjKKMbn/pSCABL9dr
 xL8U4LJw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tvEOy-003i67-WA; Thu, 20 Mar 2025 12:49:33 +0100
Message-ID: <860fb3b6-0f18-49c4-b464-5c8c8995e6bd@igalia.com>
Date: Thu, 20 Mar 2025 11:49:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@kernel.org, dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
 <769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org>
 <48f07793-0fd4-4cdd-8568-3bd2ff63bb6a@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <48f07793-0fd4-4cdd-8568-3bd2ff63bb6a@gmail.com>
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


On 19/03/2025 11:23, Christian König wrote:
>>> + *
>>> + * Return:
>>> + * 0 on success, or an error on failing to expand the array.
>>> + */
>>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
>>> *job,
>>> +					    unsigned int num_deps)
>>> +{
>>> +	struct dma_fence *fence;
>>> +	u32 id = 0;
>>> +	int ret;
>>> +
>>> +	while (num_deps--) {
>>> +		fence = dma_fence_get_stub();
>>> +		ret = xa_alloc(&job->dependencies, &id, fence,
>>> xa_limit_32b,
>>> +			       GFP_KERNEL);
>> So this would fill the xarr with already signaled fences which then
>> later will be replaced with unsignaled fences?
> 
> Yes, exactly that's the idea.
> 
>> Help me out here: would it also work to add NULL instead of that stub-
>> fence?
> 
> Good question, idk. That's an implementation detail of the xarray.
> 
> Tvrtko also correctly pointed out that it is most likely a bad idea to 
> use dma_fence_is_signaled() in the critical code path.
> 
> I will try to dig through the xarray behavior up and update the patch if 
> possible.

I think NULL on its own is not possible, but the two low bits are 
available for pointer tagging, or designating pointers vs integers, 
which looks like it could work. Something like storing 
xa_tag_pointer(NULL, 1) to reserved slots and at lookup time they would 
be detected with "xa_pointer_tag(fence) & 1".

Regards,

Tvrtko

