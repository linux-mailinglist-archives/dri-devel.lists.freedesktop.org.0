Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A233877B2
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 13:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 981C56EB31;
	Tue, 18 May 2021 11:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4666EB31
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 11:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id D2FB93F423;
 Tue, 18 May 2021 13:30:33 +0200 (CEST)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="rRIc/GcQ";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TygfrFIVegzg; Tue, 18 May 2021 13:30:31 +0200 (CEST)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 1074C3F2B8;
 Tue, 18 May 2021 13:30:30 +0200 (CEST)
Received: from [192.168.0.209] (fmdmzpr03-ext.fm.intel.com [192.55.54.38])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4A969360341;
 Tue, 18 May 2021 13:30:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1621337430; bh=cz7MWKthI7I41IYNzBwOnVqqO9vZ8leLCjUiewi3y/M=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=rRIc/GcQk71QGx/e2PvJ3m2tcKmg8SYC/3t73ngrYao3P4e/srz95uFbDmGYVAKGn
 +zNpo0orZy/2L3Yh9l/vPjHId10hO2cOJ6WfJN/vCAldK+Pw7t1Hte9a083wCTvH1P
 JGwNyGVX+hXA2BuRryZe7OGwmq6rtctyBryD1Sog=
Subject: Re: [Intel-gfx] [PATCH v2 02/15] drm/i915: Don't free shared locks
 while shared
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
 <20210518082701.997251-3-thomas.hellstrom@linux.intel.com>
 <2f219b65-a27a-2939-6f3e-974ca2694bf1@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <0c1cc6c4-fa1f-a334-5e27-cfc182f69447@shipmail.org>
Date: Tue, 18 May 2021 13:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2f219b65-a27a-2939-6f3e-974ca2694bf1@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 5/18/21 1:18 PM, Maarten Lankhorst wrote:
> Op 18-05-2021 om 10:26 schreef Thomas Hellström:
>> We are currently sharing the VM reservation locks across a number of
>> gem objects with page-table memory. Since TTM will individiualize the
>> reservation locks when freeing objects, including accessing the shared
>> locks, make sure that the shared locks are not freed until that is done.
>> For PPGTT we add an additional refcount, for GGTT we take additional
>> measures to make sure objects sharing the GGTT reservation lock are
>> freed at GGTT takedown
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>> v2: Try harder to make sure objects sharing the GGTT reservation lock are
>> freed at GGTT takedown.
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_object.c    |  3 ++
>>   .../gpu/drm/i915/gem/i915_gem_object_types.h  |  1 +
>>   drivers/gpu/drm/i915/gt/intel_ggtt.c          | 19 ++++++--
>>   drivers/gpu/drm/i915/gt/intel_gtt.c           | 45 +++++++++++++++----
>>   drivers/gpu/drm/i915/gt/intel_gtt.h           | 30 ++++++++++++-
>>   drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
>>   drivers/gpu/drm/i915/i915_drv.c               |  5 +++
>>   7 files changed, 92 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> index 28144410df86..abadf0994ad0 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>> @@ -252,6 +252,9 @@ static void __i915_gem_free_objects(struct drm_i915_private *i915,
>>   		if (obj->mm.n_placements > 1)
>>   			kfree(obj->mm.placements);
>>   
>> +		if (obj->resv_shared_from)
>> +			i915_vm_resv_put(obj->resv_shared_from);
>> +
>>   		/* But keep the pointer alive for RCU-protected lookups */
>>   		call_rcu(&obj->rcu, __i915_gem_free_object_rcu);
>>   		cond_resched();
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> index 0727d0c76aa0..450340a73186 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>> @@ -149,6 +149,7 @@ struct drm_i915_gem_object {
>>   	 * when i915_gem_ww_ctx_backoff() or i915_gem_ww_ctx_fini() are called.
>>   	 */
>>   	struct list_head obj_link;
>> +	struct dma_resv *resv_shared_from;
> Since this can only be a vm object, would it make sense to make this a pointer to the vm address space, so we can call vm_resv_put on it directly?
>
> The current pointer type and name makes it look generic, but if you try to use it with anything but an address space, it will blow up.
>
> Otherwise looks good. I guess we cannot force all bo's to be deleted before the vm is freed. :-)
>
> So with that fixed
>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Thanks, I'll take a look at that.

Thomas


