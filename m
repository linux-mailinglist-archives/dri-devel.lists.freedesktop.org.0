Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A39A67E7DE3
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 17:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C966410E0FC;
	Fri, 10 Nov 2023 16:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A7E210E0FC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 16:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699635004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/MqxqWzAGv5fAoXTt67WoZDzwOtx7uJzJ1csLkrDayk=;
 b=DB0KCRViPZQTnyGMHaCF0PawJdHS4qN2G1BIb0qg/In8iaq9JBYZmbRKoRGKFEMOMt+d29
 WJm07I/+POcF18Mn+uoTxPnkjmtkZa+U9MvUHCsnFmtvMNuf5RlelJuCEQ5GxZcI4gHsYG
 JxfQhxi8JpORzsBqKhxYavKYZHNAI98=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-rDxANoQsM2G1cqottfdXuA-1; Fri, 10 Nov 2023 11:50:03 -0500
X-MC-Unique: rDxANoQsM2G1cqottfdXuA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32da7983d20so1485003f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 08:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699635002; x=1700239802;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/MqxqWzAGv5fAoXTt67WoZDzwOtx7uJzJ1csLkrDayk=;
 b=Xb9EwsnMbo+LkZhJgVpPufts+vu6TwQjFI9yapTeBIJzWg+hJSSEw6MH7D5QGlHYCO
 nYJWY6Nc/gNxqaprKIEYzWWwQMEZDsou4BmXnvI3C58JL2OlJ7A/kHhS24859ESHq153
 sXA9SlUxz8MCulz9LR5AH0tzW8h3Z8DizXa74Z37Ecnmtuv1jU42ocUEg/IlCtduISrk
 h5lCWwNt5/92s7blzByVsD7BC7RU44ltswa+UpFkCJx9rNS1vUcKETz7hFcH6QV7tz8E
 6d9bz94o+Wjtw9yP47KyK6cDHSPAdrM7wVzy9Wx2pJdSkf72U0CguqjYmzNJfvtdmX/t
 8Rzg==
X-Gm-Message-State: AOJu0YxPtJtXfT0cP3a8Hp7ej5TSDF3Ld7RifUPOBiVa2w+xdpKIJN2U
 HxRp2ygzKsH2RAvjgv0A1hUvJG2joB/tHdammvw2Lq8MrnZp6aaju8pggn0r3Snic86DOpPOxIs
 12zuWYjIHi6dx4fjKUrZLKndK7xRr
X-Received: by 2002:a5d:6c65:0:b0:331:3d55:ebcb with SMTP id
 r5-20020a5d6c65000000b003313d55ebcbmr2366080wrz.24.1699635001755; 
 Fri, 10 Nov 2023 08:50:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH++7Tz4VWFO0D3PcP4B0LxW7JEEViGQisWX5q3UOeSjzyRnxQ4E20jZar4BcXAFi5u69IOWQ==
X-Received: by 2002:a5d:6c65:0:b0:331:3d55:ebcb with SMTP id
 r5-20020a5d6c65000000b003313d55ebcbmr2366057wrz.24.1699635001427; 
 Fri, 10 Nov 2023 08:50:01 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfe605000000b0032db8f7f378sm2257722wrm.71.2023.11.10.08.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Nov 2023 08:50:01 -0800 (PST)
Message-ID: <49456cc4-5ec6-47bb-bbc6-b6a78b45dd8c@redhat.com>
Date: Fri, 10 Nov 2023 17:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 <f7a64e17-d8b0-a20a-4e27-46f448a10bd4@linux.intel.com>
 <e9da2add-20e0-437a-b325-2d3309f84eaa@amd.com>
 <7b5b3a51-6b70-b5ba-1017-b79f1519ed09@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <7b5b3a51-6b70-b5ba-1017-b79f1519ed09@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 11/10/23 11:52, Thomas Hellström wrote:
> 
> On 11/10/23 11:42, Christian König wrote:
>> Am 10.11.23 um 10:39 schrieb Thomas Hellström:
>>>
>>> [SNIP]
>>
>>> I was thinking more of the general design of a base-class that needs to be refcounted. Say a driver vm that inherits from gpu-vm, gem_object and yet another base-class that supplies its own refcount. What's the best-practice way to do refcounting? All base-classes supplying a refcount of its own, or the subclass supplying a refcount and the base-classes supply destroy helpers.
>>
>> From my experience the most common design pattern in the Linux kernel is that you either have reference counted objects which contain a private pointer (like struct file, struct inode etc..) or the lifetime is defined by the user of the object instead of reference counting and in this case you can embed it into your own object.
>>
>>>
>>> But to be clear this is nothing I see needing urgent attention.
>>>
>>>>
>>>>>
>>>>>>
>>>>>> Well, I have never seen stuff like that in the kernel. Might be that this works, but I would rather not try if avoidable.
>>>>>>
>>>>>>>
>>>>>>> That would also make it possible for the driver to decide the context for the put() call: If the driver needs to be able to call put() from irq / atomic context but the base-class'es destructor doesn't allow atomic context, the driver can push freeing out to a work item if needed.
>>>>>>>
>>>>>>> Finally, the refcount overflow Christian pointed out. Limiting the number of mapping sounds like a reasonable remedy to me.
>>>>>>
>>>>>> Well that depends, I would rather avoid having a dependency for mappings.
>>>>>>
>>>>>> Taking the CPU VM handling as example as far as I know vm_area_structs doesn't grab a reference to their mm_struct either. Instead they get automatically destroyed when the mm_struct is destroyed.
>>>>>
>>>>> Certainly, that would be possible. However, thinking about it, this might call for
>>>>> huge trouble.
>>>>>
>>>>> First of all, we'd still need to reference count a GPUVM and take a reference for each
>>>>> VM_BO, as we do already. Now instead of simply increasing the reference count for each
>>>>> mapping as well, we'd need a *mandatory* driver callback that is called when the GPUVM
>>>>> reference count drops to zero. Maybe something like vm_destroy().
>>>>>
>>>>> The reason is that GPUVM can't just remove all mappings from the tree nor can it free them
>>>>> by itself, since drivers might use them for tracking their allocated page tables and/or
>>>>> other stuff.
>>>>>
>>>>> Now, let's think about the scope this callback might be called from. When a VM_BO is destroyed
>>>>> the driver might hold a couple of locks (for Xe it would be the VM's shared dma-resv lock and
>>>>> potentially the corresponding object's dma-resv lock if they're not the same already). If
>>>>> destroying this VM_BO leads to the VM being destroyed, the drivers vm_destroy() callback would
>>>>> be called with those locks being held as well.
>>>>>
>>>>> I feel like doing this finally opens the doors of the locking hell entirely. I think we should
>>>>> really avoid that.
>>>
>>> I don't think we need to worry much about this particular locking hell because if we hold
>>
>> I have to agree with Danilo here. Especially you have cases where you usually lock BO->VM (for example eviction) as well as cases where you need to lock VM->BO (command submission).
>>
>> Because of this in amdgpu we used (or abused?) the dma_resv of the root BO as lock for the VM. Since this is a ww_mutex locking it in both VM, BO as well as BO, VM order works.
> 
> Yes, gpuvm is doing the same. (although not necessarily using the page-table root bo, but any bo of the driver's choice). But I read it as Danilo feared the case where the VM destructor was called with a VM resv (or possibly bo resv) held. I meant the driver can easily ensure that's not happening, and in some cases it can't happen.

Right, that's what I meant. However, this also comes down to what Christian means. When the callback
is called with the resv locks held, we'd potentially have this locking inversion between
VM lock -> resv lock and resv lock -> VM lock.

> 
> Thanks,
> 
> Thomas
> 
> 
> 
>>
>> Regards,
>> Christian.
>>
>>> , for example a vm and bo resv when putting the vm_bo, we need to keep additional strong references for the bo / vm pointer we use for unlocking. Hence putting the vm_bo under those locks can never lead to the vm getting destroyed.
>>>
>>> Also, don't we already sort of have a mandatory vm_destroy callback?
>>>
>>> +    if (drm_WARN_ON(gpuvm->drm, !gpuvm->ops->vm_free))
>>> +        return;
>>>
>>>
>>>
>>>>
>>>> That's a really good point, but I fear exactly that's the use case.
>>>>
>>>> I would expect that VM_BO structures are added in the drm_gem_object_funcs.open callback and freed in drm_gem_object_funcs.close.
>>>>
>>>> Since it is perfectly legal for userspace to close a BO while there are still mappings (can trivial be that the app is killed) I would expect that the drm_gem_object_funcs.close handling is something like asking drm_gpuvm destroying the VM_BO and getting the mappings which should be cleared in the page table in return.
>>>>
>>>> In amdgpu we even go a step further and the VM structure keeps track of all the mappings of deleted VM_BOs so that higher level can query those and clear them later on.
>>>>
>>>> Background is that the drm_gem_object_funcs.close can't fail, but it can perfectly be that the app is killed because of an OOM situation and we can't do page tables updates in that moment because of this.
>>>>
>>>>>
>>>>>>
>>>>>> Which makes sense in that case because when the mm_struct is gone the vm_area_struct doesn't make sense any more either.
>>>>>>
>>>>>> What we clearly need is a reference to prevent the VM or at least the shared resv to go away to early.
>>>>>
>>>>> Yeah, that was a good hint and we've covered that.
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>>
>>>>>>> But I think all of this is fixable as follow-ups if needed, unless I'm missing something crucial.
>>>>>
>>>>> Fully agree, I think at this point we should go ahead and land this series.
>>>
>>> +1.
>>>
>>> /Thomas
>>>
>>>
>>>>>
>>>>
>>>> Yeah, agree this is not UAPI so not nailed in stone. Feel free to add my acked-by as well if you want.
>>>>
>>>> Only keep in mind that when you give drivers some functionality in a common component they usually expect to keep that functionality.
>>>>
>>>> For example changing the dma_resv object to make sure that drivers can't cause use after free errors any more was an extremely annoying experience since every user of those interface had to change at once.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>>>>
>>>>>>> Just my 2 cents.
>>>>>>>
>>>>>>> /Thomas
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>
> 

