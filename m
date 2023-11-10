Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FAA7E7AFF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 10:40:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B0810E95B;
	Fri, 10 Nov 2023 09:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B3F10E95A;
 Fri, 10 Nov 2023 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699609206; x=1731145206;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KSYtIowPTOFzxauX4JUkX/8mXpoYMUvd3xexE6SC60M=;
 b=jwlccOtGjw/8OwyaoJudAbVQd2qBqqNuFO4k2vFhtdNtxoXqX0SCJkXb
 hlRUXP4Hwt30EUhi1xh5hvBYY/JHGiB5yBOXYJdCmZnbb+lp35aafXip1
 4QsxKMJjvk8U+BZEXfHtu2ZtTGuSIzUW0aoHmR1lru1hGr1kFuPrkJUBX
 2ku2VhI2fSm3WlsL+050sdSLTreYoOFOx2BP+xGZxgGjiDalsmy8cacco
 zC2aZe/cPa5HDOeLbTUDtgIIBt/+XgeuYUe8eUNhi9oLxnjgo94cJvz2r
 h28yEaAnbqnxqYQUXujMwHl707jpWtW7o5NhWcNg+1hIMdBMMSt3NefiG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="421253174"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="421253174"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 01:40:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="740113471"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; d="scan'208";a="740113471"
Received: from amirafax-mobl4.gar.corp.intel.com (HELO [10.249.254.223])
 ([10.249.254.223])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2023 01:40:01 -0800
Message-ID: <f7a64e17-d8b0-a20a-4e27-46f448a10bd4@linux.intel.com>
Date: Fri, 10 Nov 2023 10:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com> <ZUkXkJ+zT7OFGosC@pollux>
 <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
 <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
 <4532d9d5-4c5a-4639-8136-d3ba9995d7b6@redhat.com>
 <1d4ca394-ee0c-4617-adbe-1d47e295c8fb@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <1d4ca394-ee0c-4617-adbe-1d47e295c8fb@amd.com>
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, faith@gfxstrand.net,
 boris.brezillon@collabora.com, donald.robson@imgtec.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/10/23 09:50, Christian König wrote:
> Am 09.11.23 um 19:34 schrieb Danilo Krummrich:
>> On 11/9/23 17:03, Christian König wrote:
>>> Am 09.11.23 um 16:50 schrieb Thomas Hellström:
>>>> [SNIP]
>>>>>>
>>>> Did we get any resolution on this?
>>>>
>>>> FWIW, my take on this is that it would be possible to get GPUVM to 
>>>> work both with and without internal refcounting; If with, the 
>>>> driver needs a vm close to resolve cyclic references, if without 
>>>> that's not necessary. If GPUVM is allowed to refcount in mappings 
>>>> and vm_bos, that comes with a slight performance drop but as Danilo 
>>>> pointed out, the VM lifetime problem iterating over a vm_bo's 
>>>> mapping becomes much easier and the code thus becomes easier to 
>>>> maintain moving forward. That convinced me it's a good thing.
>>>
>>> I strongly believe you guys stumbled over one of the core problems 
>>> with the VM here and I think that reference counting is the right 
>>> answer to solving this.
>>>
>>> The big question is that what is reference counted and in which 
>>> direction does the dependency points, e.g. we have here VM, BO, 
>>> BO_VM and Mapping objects.
>>>
>>> Those patches here suggest a counted Mapping -> VM reference and I'm 
>>> pretty sure that this isn't a good idea. What we should rather 
>>> really have is a BO -> VM or BO_VM ->VM reference. In other words 
>>> that each BO which is part of the VM keeps a reference to the VM.
>>
>> We have both. Please see the subsequent patch introducing VM_BO 
>> structures for that.
>>
>> As I explained, mappings (struct drm_gpuva) keep a pointer to their 
>> VM they're mapped
>> in and besides that it doesn't make sense to free a VM that still 
>> contains mappings,
>> the reference count ensures that. This simply ensures memory safety.
>>
>>>
>>> BTW: At least in amdgpu we can have BOs which (temporary) doesn't 
>>> have any mappings, but are still considered part of the VM.
>>
>> That should be possible.
>>
>>>
>>>>
>>>> Another issue Christian brought up is that something intended to be 
>>>> embeddable (a base class) shouldn't really have its own refcount. I 
>>>> think that's a valid point. If you at some point need to derive 
>>>> from multiple such structs each having its own refcount, things 
>>>> will start to get weird. One way to resolve that would be to have 
>>>> the driver's subclass provide get() and put() ops, and export a 
>>>> destructor for the base-class, rather than to have the base-class 
>>>> provide the refcount and a destructor  ops.
>>
>> GPUVM simply follows the same pattern we have with drm_gem_objects. 
>> And I think it makes
>> sense. Why would we want to embed two struct drm_gpuvm in a single 
>> driver structure?
>
> Because you need one drm_gpuvm structure for each application using 
> the driver? Or am I missing something?
>
> As far as I can see a driver would want to embed that into your fpriv 
> structure which is allocated during drm_driver.open callback.

I was thinking more of the general design of a base-class that needs to 
be refcounted. Say a driver vm that inherits from gpu-vm, gem_object and 
yet another base-class that supplies its own refcount. What's the 
best-practice way to do refcounting? All base-classes supplying a 
refcount of its own, or the subclass supplying a refcount and the 
base-classes supply destroy helpers.

But to be clear this is nothing I see needing urgent attention.

>
>>
>>>
>>> Well, I have never seen stuff like that in the kernel. Might be that 
>>> this works, but I would rather not try if avoidable.
>>>
>>>>
>>>> That would also make it possible for the driver to decide the 
>>>> context for the put() call: If the driver needs to be able to call 
>>>> put() from irq / atomic context but the base-class'es destructor 
>>>> doesn't allow atomic context, the driver can push freeing out to a 
>>>> work item if needed.
>>>>
>>>> Finally, the refcount overflow Christian pointed out. Limiting the 
>>>> number of mapping sounds like a reasonable remedy to me.
>>>
>>> Well that depends, I would rather avoid having a dependency for 
>>> mappings.
>>>
>>> Taking the CPU VM handling as example as far as I know 
>>> vm_area_structs doesn't grab a reference to their mm_struct either. 
>>> Instead they get automatically destroyed when the mm_struct is 
>>> destroyed.
>>
>> Certainly, that would be possible. However, thinking about it, this 
>> might call for
>> huge trouble.
>>
>> First of all, we'd still need to reference count a GPUVM and take a 
>> reference for each
>> VM_BO, as we do already. Now instead of simply increasing the 
>> reference count for each
>> mapping as well, we'd need a *mandatory* driver callback that is 
>> called when the GPUVM
>> reference count drops to zero. Maybe something like vm_destroy().
>>
>> The reason is that GPUVM can't just remove all mappings from the tree 
>> nor can it free them
>> by itself, since drivers might use them for tracking their allocated 
>> page tables and/or
>> other stuff.
>>
>> Now, let's think about the scope this callback might be called from. 
>> When a VM_BO is destroyed
>> the driver might hold a couple of locks (for Xe it would be the VM's 
>> shared dma-resv lock and
>> potentially the corresponding object's dma-resv lock if they're not 
>> the same already). If
>> destroying this VM_BO leads to the VM being destroyed, the drivers 
>> vm_destroy() callback would
>> be called with those locks being held as well.
>>
>> I feel like doing this finally opens the doors of the locking hell 
>> entirely. I think we should
>> really avoid that.

I don't think we need to worry much about this particular locking hell 
because if we hold, for example a vm and bo resv when putting the vm_bo, 
we need to keep additional strong references for the bo / vm pointer we 
use for unlocking. Hence putting the vm_bo under those locks can never 
lead to the vm getting destroyed.

Also, don't we already sort of have a mandatory vm_destroy callback?

+	if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
+		return;



>
> That's a really good point, but I fear exactly that's the use case.
>
> I would expect that VM_BO structures are added in the 
> drm_gem_object_funcs.open callback and freed in 
> drm_gem_object_funcs.close.
>
> Since it is perfectly legal for userspace to close a BO while there 
> are still mappings (can trivial be that the app is killed) I would 
> expect that the drm_gem_object_funcs.close handling is something like 
> asking drm_gpuvm destroying the VM_BO and getting the mappings which 
> should be cleared in the page table in return.
>
> In amdgpu we even go a step further and the VM structure keeps track 
> of all the mappings of deleted VM_BOs so that higher level can query 
> those and clear them later on.
>
> Background is that the drm_gem_object_funcs.close can't fail, but it 
> can perfectly be that the app is killed because of an OOM situation 
> and we can't do page tables updates in that moment because of this.
>
>>
>>>
>>> Which makes sense in that case because when the mm_struct is gone 
>>> the vm_area_struct doesn't make sense any more either.
>>>
>>> What we clearly need is a reference to prevent the VM or at least 
>>> the shared resv to go away to early.
>>
>> Yeah, that was a good hint and we've covered that.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> But I think all of this is fixable as follow-ups if needed, unless 
>>>> I'm missing something crucial.
>>
>> Fully agree, I think at this point we should go ahead and land this 
>> series.

+1.

/Thomas


>>
>
> Yeah, agree this is not UAPI so not nailed in stone. Feel free to add 
> my acked-by as well if you want.
>
> Only keep in mind that when you give drivers some functionality in a 
> common component they usually expect to keep that functionality.
>
> For example changing the dma_resv object to make sure that drivers 
> can't cause use after free errors any more was an extremely annoying 
> experience since every user of those interface had to change at once.
>
> Regards,
> Christian.
>
>>
>>>>
>>>> Just my 2 cents.
>>>>
>>>> /Thomas
>>>>
>>>>
>>>
>>
>
