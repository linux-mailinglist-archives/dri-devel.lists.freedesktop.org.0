Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46BB83CF34
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 23:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBE210E450;
	Thu, 25 Jan 2024 22:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E7810E450
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 22:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706220810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYbnoHm9z5ahYhMwtOMYJv6pQXSE5p6lsvqwXW6wtI0=;
 b=CQzZolh3p9WmJ23rwSkJeX14+1K51sgRISmLefNGgJ5QUXyAsjlfjVIutNyN5vxcRTG7nx
 TbYiDRtCj0i233yZqImtsEjAoHv4vxMZIbUJ9qHWlX0rq8FSC8S7FucvYua9dNJeL11Yxd
 G5Uk2uKUl/4KXhNQxDEsREedD94/yyk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-cVKSKpGpPW-S7KuxAp9Ysg-1; Thu, 25 Jan 2024 17:13:27 -0500
X-MC-Unique: cVKSKpGpPW-S7KuxAp9Ysg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-337d05db5bbso4109935f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 14:13:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706220806; x=1706825606;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dYbnoHm9z5ahYhMwtOMYJv6pQXSE5p6lsvqwXW6wtI0=;
 b=N49d6bwyFqyLWbCJlpdyKt54X72v/98BqNqAssCJEEhejK+s0+t6pUy9qprz04JMGI
 MS+Gvaf3qsC2u6PYkweR1U9CaM5Da/X+vXA1xfq/8/aq86bgu1zHv04pITSu7bDkjorr
 gvwh+LDbtgxyYXNgmyEi6aKQKIlxBGm8ZvrMiAuP0a+XXxHnSxGlT/frF0wZhc9Z2ptd
 ZMxx/9MppA55Rxxt72z6yrKLZfgrakhguBFhAgaUJbDg/TKDME568Q7hUR9XiK7ahYLV
 sPlIC0AxrvqDOKab7VkGRIj2CBxLbCJwsLtA+2DodBm8Y1gUxhWjYgWUWZn8nC9cl+39
 /IWw==
X-Gm-Message-State: AOJu0YyeLMHJSPImKbTZbKn+kpC80z7Lc/GdyHq1uqadvrxgov+sXL3o
 caK8EdETuBukeGjHvw4K74YIPBd/NsOaohKbinwFnXpBd2wiHkGoUp/G0kZ8jIjC0rjKKNQai3S
 JVoJC39LAvCZiHgfkAmHIhI3KsigXzQC1bmqPdcggoHyonL6jDHIgP170KMNMBBpceA==
X-Received: by 2002:a5d:4849:0:b0:337:c2fa:c718 with SMTP id
 n9-20020a5d4849000000b00337c2fac718mr136851wrs.92.1706220806257; 
 Thu, 25 Jan 2024 14:13:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn5zA8Mw3F1U+Cv+MGhgL+e8i83chTlQWXBIfRH4fDObDovLNXbBN8yqRSiW/JvnxPGdy1kQ==
X-Received: by 2002:a5d:4849:0:b0:337:c2fa:c718 with SMTP id
 n9-20020a5d4849000000b00337c2fac718mr136838wrs.92.1706220805815; 
 Thu, 25 Jan 2024 14:13:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a1709064acc00b00a2d7f63dd71sm1464075ejt.29.2024.01.25.14.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 14:13:25 -0800 (PST)
Message-ID: <aee2a103-2bf7-42e3-b07c-e8d956d174ca@redhat.com>
Date: Thu, 25 Jan 2024 23:13:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty, Brian"
 <brian.welty@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <4c622af4-af92-4e95-957f-a8867925c236@redhat.com>
 <SA1PR11MB69915590D8D282DA41B8783E927B2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <SA1PR11MB69915590D8D282DA41B8783E927B2@SA1PR11MB6991.namprd11.prod.outlook.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/24/24 04:57, Zeng, Oak wrote:
> Thanks a lot Danilo.
> 
> Maybe I wasn't clear enough. In the solution I proposed, each device still have separate vm/page tables. Each device still need to manage the mapping, page table flags etc. It is just in svm use case, all devices share one drm_gpuvm instance. As I understand it, drm_gpuvm's main function is the va range split and merging. I don't see why it doesn't work across gpu devices.

I'm pretty sure it does work. You can indeed use GPUVM for tracking mappings using
the split and merge feature only, ignoring all other features it provides. However,
I don't think it's a good idea to have a single GPUVM instance to track the memory
mappings of different devices with different page tables, different object life times,
etc.

> 
> But I read more about drm_gpuvm. Its split merge function takes a drm_gem_object parameter, see drm_gpuvm_sm_map_ops_create and drm_gpuvm_sm_map. Actually the whole drm_gpuvm is designed for BO-centric driver, for example, it has a drm_gpuvm_bo concept to keep track of the 1BO:Ngpuva mapping. The whole purpose of leveraging drm_gpuvm is to re-use the va split/merge functions for SVM. But in our SVM implementation, there is no buffer object at all. So I don't think our SVM codes can leverage drm_gpuvm.

That's all optional features. As mentioned above, you can use GPUVM for tracking mappings
using the split and merge feature only. The drm_gem_object parameter in
drm_gpuvm_sm_map_ops_create() can simply be NULL. Afaik, Xe already does that for userptr
stuff already. But again, I don't think it's a good idea to track memory mappings of
multiple independent physical devices and driver instances in a single different place
whether you use GPUVM or a custom implementation.

- Danilo

> 
> I will give up this approach, unless Matt or Brian can see a way.
> 
> A few replies inline.... @Welty, Brian I had more thoughts inline to one of your original question....
> 
>> -----Original Message-----
>> From: Danilo Krummrich <dakr@redhat.com>
>> Sent: Tuesday, January 23, 2024 6:57 PM
>> To: Zeng, Oak <oak.zeng@intel.com>; Christian König
>> <christian.koenig@amd.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter
>> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>
>> Cc: Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>> Hi Oak,
>>
>> On 1/23/24 20:37, Zeng, Oak wrote:
>>> Thanks Christian. I have some comment inline below.
>>>
>>> Danilo, can you also take a look and give your feedback? Thanks.
>>
>> I agree with everything Christian already wrote. Except for the KFD parts, which
>> I'm simply not familiar with, I had exactly the same thoughts after reading your
>> initial mail.
>>
>> Please find some more comments below.
>>
>>>
>>>> -----Original Message-----
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: Tuesday, January 23, 2024 6:13 AM
>>>> To: Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich <dakr@redhat.com>;
>>>> Dave Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>
>>>> Cc: Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org;
>> intel-
>>>> xe@lists.freedesktop.org; Bommu, Krishnaiah
>> <krishnaiah.bommu@intel.com>;
>>>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>>>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>>>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>>>> <matthew.brost@intel.com>
>>>> Subject: Re: Making drm_gpuvm work across gpu devices
>>>>
>>>> Hi Oak,
>>>>
>>>> Am 23.01.24 um 04:21 schrieb Zeng, Oak:
>>>>> Hi Danilo and all,
>>>>>
>>>>> During the work of Intel's SVM code, we came up the idea of making
>>>> drm_gpuvm to work across multiple gpu devices. See some discussion here:
>>>> https://lore.kernel.org/dri-
>>>>
>> devel/PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd
>>>> 11.prod.outlook.com/
>>>>>
>>>>> The reason we try to do this is, for a SVM (shared virtual memory across cpu
>>>> program and all gpu program on all gpu devices) process, the address space
>> has
>>>> to be across all gpu devices. So if we make drm_gpuvm to work across devices,
>>>> then our SVM code can leverage drm_gpuvm as well.
>>>>>
>>>>> At a first look, it seems feasible because drm_gpuvm doesn't really use the
>>>> drm_device *drm pointer a lot. This param is used only for printing/warning.
>> So I
>>>> think maybe we can delete this drm field from drm_gpuvm.
>>>>>
>>>>> This way, on a multiple gpu device system, for one process, we can have only
>>>> one drm_gpuvm instance, instead of multiple drm_gpuvm instances (one for
>>>> each gpu device).
>>>>>
>>>>> What do you think?
>>>>
>>>> Well from the GPUVM side I don't think it would make much difference if
>>>> we have the drm device or not.
>>>>
>>>> But the experience we had with the KFD I think I should mention that we
>>>> should absolutely *not* deal with multiple devices at the same time in
>>>> the UAPI or VM objects inside the driver.
>>>>
>>>> The background is that all the APIs inside the Linux kernel are build
>>>> around the idea that they work with only one device at a time. This
>>>> accounts for both low level APIs like the DMA API as well as pretty high
>>>> level things like for example file system address space etc...
>>>
>>> Yes most API are per device based.
>>>
>>> One exception I know is actually the kfd SVM API. If you look at the svm_ioctl
>> function, it is per-process based. Each kfd_process represent a process across N
>> gpu devices. Cc Felix.
>>>
>>> Need to say, kfd SVM represent a shared virtual address space across CPU and
>> all GPU devices on the system. This is by the definition of SVM (shared virtual
>> memory). This is very different from our legacy gpu *device* driver which works
>> for only one device (i.e., if you want one device to access another device's
>> memory, you will have to use dma-buf export/import etc).
>>>
>>> We have the same design requirement of SVM. For anyone who want to
>> implement the SVM concept, this is a hard requirement. Since now drm has the
>> drm_gpuvm concept which strictly speaking is designed for one device, I want to
>> see whether we can extend drm_gpuvm to make it work for both single device
>> (as used in xe) and multipe devices (will be used in the SVM code). That is why I
>> brought up this topic.
>>>
>>>>
>>>> So when you have multiple GPUs you either have an inseparable cluster of
>>>> them which case you would also only have one drm_device. Or you have
>>>> separated drm_device which also results in separate drm render nodes and
>>>> separate virtual address spaces and also eventually separate IOMMU
>>>> domains which gives you separate dma_addresses for the same page and so
>>>> separate GPUVM page tables....
>>>
>>> I am thinking we can still make each device has its separate drm_device/render
>> node/iommu domains/gpu page table. Just as what we have today. I am not plan
>> to change this picture.
>>>
>>> But the virtual address space will support two modes of operation:
>>> 1. one drm_gpuvm per device. This is when svm is not in the picture
>>> 2. all devices in the process share one single drm_gpuvm, when svm is in the
>> picture. In xe driver design, we have to support a mixture use of legacy mode
>> (such as gem_create and vm_bind) and svm (such as malloc'ed memory for gpu
>> submission). So whenever SVM is in the picture, we want one single process
>> address space across all devices. Drm_gpuvm doesn't need to be aware of those
>> two operation modes. It is driver's responsibility to use different mode.
>>>
>>> For example, in mode #1, a driver's vm structure (such as xe_vm) can inherit
>> from drm_gpuvm. In mode #2, a driver's svm structure (xe_svm in this series:
>> https://lore.kernel.org/dri-devel/20240117221223.18540-1-oak.zeng@intel.com/)
>> can inherit from drm_gpuvm while each xe_vm (still a per-device based struct)
>> will just have a pointer to the drm_gpuvm structure. This way when svm is in play,
>> we build a 1 process:1 mm_struct:1 xe_svm:N xe_vm correlations which means
>> shared address space across gpu devices.
>>
>> With a shared GPUVM structure, how do you track actual per device resources
>> such as
>> page tables? You also need to consider that the page table layout, memory
>> mapping
>> flags may vary from device to device due to different GPU chipsets or revisions.
> 
> The per device page table, flags etc are still managed per-device based, which is the xe_vm in the xekmd driver.
> 
>>
>> Also, if you replace the shared GPUVM structure with a pointer to a shared one,
>> you may run into all kinds of difficulties due to increasing complexity in terms
>> of locking, synchronization, lifetime and potential unwind operations in error
>> paths.
>> I haven't thought it through yet, but I wouldn't be surprised entirely if there are
>> cases where you simply run into circular dependencies.
> 
> Make sense, I can't see through this without a prove of concept code either.
> 
>>
>> Also, looking at the conversation in the linked patch series:
>>
>> <snip>
>>
>>>> For example as hmm_range_fault brings a range from host into GPU address
>>>> space,  what if it was already allocated and in use by VM_BIND for
>>>> a GEM_CREATE allocated buffer?    That is of course application error,
>>>> but KMD needs to detect it, and provide one single managed address
>>>> space across all allocations from the application....
>>
>>> This is very good question. Yes agree we should check this application error.
>> Fortunately this is doable. All vm_bind virtual address range are tracked in
>> xe_vm/drm_gpuvm struct. In this case, we should iterate the drm_gpuvm's rb
>> tree of *all* gpu devices (as xe_vm is for one device only) to see whether there
>> is a conflict. Will make the change soon.
>>
>> <snip>
>>
>> How do you do that if xe_vm->gpuvm is just a pointer to the GPUVM structure
>> within xe_svm?
> 
> In the proposed approach, we have a single drm_gpuvm instance for one process. All device's xe_vm pointing to this drm_gpuvm instance. This drm_gpuvm's rb tree maintains all the va range we have in this process. We can just walk this rb tree to see if there is a conflict.
> 
> But I didn't answer Brian's question completely... In a mixed use of vm_bind and malloc/mmap, the virtual address used by vm_bind should first be reserved in user space using mmap. So all valid virtual address should be tracked by linux kernel vma_struct.
> 
> Both vm_bind and malloc'ed virtual address can cause a gpu page fault. Our fault handler should first see whether this is a vm_bind va and service the fault accordingly; if not, then serve the fault in the SVM path; if SVM path also failed, it is an invalid address. So from user perspective, user can use:
> Ptr = mmap()
> Vm_bind(ptr, bo)
> Submit gpu kernel using ptr
> Or:
> Ptr = mmap()
> Submit gpu kernel using ptr
> Whether vm_bind is called or not decides the gpu fault handler code path. Hopefully this answers @Welty, Brian's original question
> 
> 
>>
>>>
>>> This requires some changes of drm_gpuvm design:
>>> 1. The drm_device *drm pointer, in mode #2 operation, this can be NULL,
>> means this drm_gpuvm is not for specific gpu device
>>> 2. The common dma_resv object: drm_gem_object *r_obj. *Does one
>> dma_resv object allocated/initialized for one device work for all devices*? From
>> first look, dma_resv is just some CPU structure maintaining dma-fences. So I
>> guess it should work for all devices? I definitely need you to comment.
>>
>> The general rule is that drivers can share the common dma_resv across GEM
>> objects that
>> are only mapped within the VM owning the dma_resv, but never within another
>> VM.
>>
>> Now, your question is whether multiple VMs can share the same common
>> dma_resv. I think
>> that calls for trouble, since it would create dependencies that simply aren't
>> needed
>> and might even introduce locking issues.
>>
>> However, that's optional, you can simply decide to not make use of the common
>> dma_resv
>> and all the optimizations based on it.
> 
> Ok, got it.
>>
>>>
>>>
>>>>
>>>> It's up to you how to implement it, but I think it's pretty clear that
>>>> you need separate drm_gpuvm objects to manage those.
>>>
>>> As explained above, I am thinking of one drm_gpuvm object across all devices
>> when SVM is in the picture...
>>>
>>>>
>>>> That you map the same thing in all those virtual address spaces at the
>>>> same address is a completely different optimization problem I think.
>>>
>>> Not sure I follow here... the requirement from SVM is, one virtual address
>> points to same physical backing store. For example, whenever CPU or any GPU
>> device access this virtual address, it refers to the same physical content. Of
>> course the physical backing store can be migrated b/t host memory and any of
>> the GPU's device memory, but the content should be consistent.
>>
>> Technically, multiple different GPUs will have separate virtual address spaces, it's
>> just that you create mappings within all of them such that the same virtual
>> address
>> resolves to the same physical content on all of them.
>>
>> So, having a single GPUVM instance representing all of them might give the
>> illusion of
>> a single unified address space, but you still need to maintain each device's
>> address
>> space backing resources, such as page tables, separately.
> 
> Yes agreed.
> 
> Regards,
> Oak
>>
>> - Danilo
>>
>>>
>>> So we are mapping same physical content to the same virtual address in either
>> cpu page table or any gpu device's page table...
>>>
>>>> What we could certainly do is to optimize hmm_range_fault by making
>>>> hmm_range a reference counted object and using it for multiple devices
>>>> at the same time if those devices request the same range of an mm_struct.
>>>>
>>>
>>> Not very follow. If you are trying to resolve a multiple devices concurrent access
>> problem, I think we should serialize concurrent device fault to one address range.
>> The reason is, during device fault handling, we might migrate the backing store so
>> hmm_range->hmm_pfns[] might have changed after one device access it.
>>>
>>>> I think if you start using the same drm_gpuvm for multiple devices you
>>>> will sooner or later start to run into the same mess we have seen with
>>>> KFD, where we moved more and more functionality from the KFD to the DRM
>>>> render node because we found that a lot of the stuff simply doesn't work
>>>> correctly with a single object to maintain the state.
>>>
>>> As I understand it, KFD is designed to work across devices. A single pseudo
>> /dev/kfd device represent all hardware gpu devices. That is why during kfd open,
>> many pdd (process device data) is created, each for one hardware device for this
>> process. Yes the codes are a little complicated.
>>>
>>> Kfd manages the shared virtual address space in the kfd driver codes, like the
>> split, merging etc. Here I am looking whether we can leverage the drm_gpuvm
>> code for those functions.
>>>
>>> As of the shared virtual address space across gpu devices, it is a hard
>> requirement for svm/system allocator (aka malloc for gpu program). We need to
>> make it work either at driver level or drm_gpuvm level. Drm_gpuvm is better
>> because the work can be shared b/t drivers.
>>>
>>> Thanks a lot,
>>> Oak
>>>
>>>>
>>>> Just one more point to your original discussion on the xe list: I think
>>>> it's perfectly valid for an application to map something at the same
>>>> address you already have something else.
>>>>
>>>> Cheers,
>>>> Christian.
>>>>
>>>>>
>>>>> Thanks,
>>>>> Oak
>>>
> 

