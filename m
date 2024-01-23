Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7C4839D6F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 00:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECD910F18A;
	Tue, 23 Jan 2024 23:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1124010F18A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706054223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkAFghKlL/ClXus3OKhgyjs1xcIPZKJiBh55t/MhwH4=;
 b=crc2jy7U+hciZYh2mmaq4C0Sqgt6TuTvlf76mra75oQ+vv1KrkGZ1HNLLDCiwih+PCcJ4T
 NDNG9A9d/EdvEhXzTmwKC5aM0ITjGTfIXWnWYXiQFa+G2cNO3Pf/5+P6xszJmDRpPz/IEo
 kQWyemd+55qXDkL0VaHZB7pFG+45pp4=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510--JRSxejKN_CQ52Bj4p1IyA-1; Tue, 23 Jan 2024 18:57:02 -0500
X-MC-Unique: -JRSxejKN_CQ52Bj4p1IyA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-50e81d186e2so5625069e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 15:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706054220; x=1706659020;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BkAFghKlL/ClXus3OKhgyjs1xcIPZKJiBh55t/MhwH4=;
 b=pbJs+bQZeo17s1n+tclGMYJA6AhbLTtMCXwnZLTqz+VPTTIdW2w7QWtmNBlzWWD/w9
 0k3kOqsUctv9psbr6c2DbXC6JpWRk1VJfWPiyJN9zjP9ZhS4KHhgp3CLYVxZ/n/QhO2m
 /kwwXaCRiAuDd0i4IdbJb8iqMCLdQWRlHGUXD/sCK8rQrkmZ99CY5j6MzXoNh/c2gMCy
 WLyDLXy+aOAhC+/jJnDcW71TiHNppCpQERWx8IXno0ZqtOlWb9k+BU7g5GiGkq0VCJCE
 zvijZRcLJyW2oqAAzuHIEUM4Mz5eKRridvA4CzrEnybwx8FYnji8TWm8qM2MBzYlIry2
 nYNw==
X-Gm-Message-State: AOJu0Yxtaw2D7GiH8ZJ4QHau7DpQkhCfxYn5BHXRLdkXmOjEsQBgqjwE
 ly0UU7w1j6R0kowapUHO31ZAwTyyKNBHGJgfGtkc0kqci9MGUn4fSjRAlPSyA+uJn43GsesatBB
 CNQMSSaysRtOdKe1JF3b0P8ohPvaNWD7nkEguKk5TXE2B62KjhjL6CCoK7OIMVnS3HA==
X-Received: by 2002:a05:6512:108e:b0:50e:69f0:3cda with SMTP id
 j14-20020a056512108e00b0050e69f03cdamr3943549lfg.20.1706054220519; 
 Tue, 23 Jan 2024 15:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOS+MTjVw2oI/k4iqQvVXM5MLqN0mbRm2wOi/Ns3HFrIlhHu9JNwzw3zKMrYR4oUVVIWe9Jw==
X-Received: by 2002:a05:6512:108e:b0:50e:69f0:3cda with SMTP id
 j14-20020a056512108e00b0050e69f03cdamr3943544lfg.20.1706054220131; 
 Tue, 23 Jan 2024 15:57:00 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a17090699c700b00a30e1f233b4sm46267ejn.128.2024.01.23.15.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 15:56:59 -0800 (PST)
Message-ID: <4c622af4-af92-4e95-957f-a8867925c236@redhat.com>
Date: Wed, 24 Jan 2024 00:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
To: "Zeng, Oak" <oak.zeng@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
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
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>, "Welty,
 Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Oak,

On 1/23/24 20:37, Zeng, Oak wrote:
> Thanks Christian. I have some comment inline below.
> 
> Danilo, can you also take a look and give your feedback? Thanks.

I agree with everything Christian already wrote. Except for the KFD parts, which
I'm simply not familiar with, I had exactly the same thoughts after reading your
initial mail.

Please find some more comments below.

> 
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Tuesday, January 23, 2024 6:13 AM
>> To: Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich <dakr@redhat.com>;
>> Dave Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>
>> Cc: Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: Making drm_gpuvm work across gpu devices
>>
>> Hi Oak,
>>
>> Am 23.01.24 um 04:21 schrieb Zeng, Oak:
>>> Hi Danilo and all,
>>>
>>> During the work of Intel's SVM code, we came up the idea of making
>> drm_gpuvm to work across multiple gpu devices. See some discussion here:
>> https://lore.kernel.org/dri-
>> devel/PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd
>> 11.prod.outlook.com/
>>>
>>> The reason we try to do this is, for a SVM (shared virtual memory across cpu
>> program and all gpu program on all gpu devices) process, the address space has
>> to be across all gpu devices. So if we make drm_gpuvm to work across devices,
>> then our SVM code can leverage drm_gpuvm as well.
>>>
>>> At a first look, it seems feasible because drm_gpuvm doesn't really use the
>> drm_device *drm pointer a lot. This param is used only for printing/warning. So I
>> think maybe we can delete this drm field from drm_gpuvm.
>>>
>>> This way, on a multiple gpu device system, for one process, we can have only
>> one drm_gpuvm instance, instead of multiple drm_gpuvm instances (one for
>> each gpu device).
>>>
>>> What do you think?
>>
>> Well from the GPUVM side I don't think it would make much difference if
>> we have the drm device or not.
>>
>> But the experience we had with the KFD I think I should mention that we
>> should absolutely *not* deal with multiple devices at the same time in
>> the UAPI or VM objects inside the driver.
>>
>> The background is that all the APIs inside the Linux kernel are build
>> around the idea that they work with only one device at a time. This
>> accounts for both low level APIs like the DMA API as well as pretty high
>> level things like for example file system address space etc...
> 
> Yes most API are per device based.
> 
> One exception I know is actually the kfd SVM API. If you look at the svm_ioctl function, it is per-process based. Each kfd_process represent a process across N gpu devices. Cc Felix.
> 
> Need to say, kfd SVM represent a shared virtual address space across CPU and all GPU devices on the system. This is by the definition of SVM (shared virtual memory). This is very different from our legacy gpu *device* driver which works for only one device (i.e., if you want one device to access another device's memory, you will have to use dma-buf export/import etc).
> 
> We have the same design requirement of SVM. For anyone who want to implement the SVM concept, this is a hard requirement. Since now drm has the drm_gpuvm concept which strictly speaking is designed for one device, I want to see whether we can extend drm_gpuvm to make it work for both single device (as used in xe) and multipe devices (will be used in the SVM code). That is why I brought up this topic.
> 
>>
>> So when you have multiple GPUs you either have an inseparable cluster of
>> them which case you would also only have one drm_device. Or you have
>> separated drm_device which also results in separate drm render nodes and
>> separate virtual address spaces and also eventually separate IOMMU
>> domains which gives you separate dma_addresses for the same page and so
>> separate GPUVM page tables....
> 
> I am thinking we can still make each device has its separate drm_device/render node/iommu domains/gpu page table. Just as what we have today. I am not plan to change this picture.
> 
> But the virtual address space will support two modes of operation:
> 1. one drm_gpuvm per device. This is when svm is not in the picture
> 2. all devices in the process share one single drm_gpuvm, when svm is in the picture. In xe driver design, we have to support a mixture use of legacy mode (such as gem_create and vm_bind) and svm (such as malloc'ed memory for gpu submission). So whenever SVM is in the picture, we want one single process address space across all devices. Drm_gpuvm doesn't need to be aware of those two operation modes. It is driver's responsibility to use different mode.
> 
> For example, in mode #1, a driver's vm structure (such as xe_vm) can inherit from drm_gpuvm. In mode #2, a driver's svm structure (xe_svm in this series: https://lore.kernel.org/dri-devel/20240117221223.18540-1-oak.zeng@intel.com/) can inherit from drm_gpuvm while each xe_vm (still a per-device based struct) will just have a pointer to the drm_gpuvm structure. This way when svm is in play, we build a 1 process:1 mm_struct:1 xe_svm:N xe_vm correlations which means shared address space across gpu devices.

With a shared GPUVM structure, how do you track actual per device resources such as
page tables? You also need to consider that the page table layout, memory mapping
flags may vary from device to device due to different GPU chipsets or revisions.

Also, if you replace the shared GPUVM structure with a pointer to a shared one,
you may run into all kinds of difficulties due to increasing complexity in terms
of locking, synchronization, lifetime and potential unwind operations in error paths.
I haven't thought it through yet, but I wouldn't be surprised entirely if there are
cases where you simply run into circular dependencies.

Also, looking at the conversation in the linked patch series:

<snip>

>> For example as hmm_range_fault brings a range from host into GPU address
>> space,  what if it was already allocated and in use by VM_BIND for
>> a GEM_CREATE allocated buffer?    That is of course application error,
>> but KMD needs to detect it, and provide one single managed address
>> space across all allocations from the application....

> This is very good question. Yes agree we should check this application error. Fortunately this is doable. All vm_bind virtual address range are tracked in xe_vm/drm_gpuvm struct. In this case, we should iterate the drm_gpuvm's rb tree of *all* gpu devices (as xe_vm is for one device only) to see whether there is a conflict. Will make the change soon.

<snip>

How do you do that if xe_vm->gpuvm is just a pointer to the GPUVM structure within xe_svm?

> 
> This requires some changes of drm_gpuvm design:
> 1. The drm_device *drm pointer, in mode #2 operation, this can be NULL, means this drm_gpuvm is not for specific gpu device
> 2. The common dma_resv object: drm_gem_object *r_obj. *Does one dma_resv object allocated/initialized for one device work for all devices*? From first look, dma_resv is just some CPU structure maintaining dma-fences. So I guess it should work for all devices? I definitely need you to comment.

The general rule is that drivers can share the common dma_resv across GEM objects that
are only mapped within the VM owning the dma_resv, but never within another VM.

Now, your question is whether multiple VMs can share the same common dma_resv. I think
that calls for trouble, since it would create dependencies that simply aren't needed
and might even introduce locking issues.

However, that's optional, you can simply decide to not make use of the common dma_resv
and all the optimizations based on it.

> 
> 
>>
>> It's up to you how to implement it, but I think it's pretty clear that
>> you need separate drm_gpuvm objects to manage those.
> 
> As explained above, I am thinking of one drm_gpuvm object across all devices when SVM is in the picture...
> 
>>
>> That you map the same thing in all those virtual address spaces at the
>> same address is a completely different optimization problem I think.
> 
> Not sure I follow here... the requirement from SVM is, one virtual address points to same physical backing store. For example, whenever CPU or any GPU device access this virtual address, it refers to the same physical content. Of course the physical backing store can be migrated b/t host memory and any of the GPU's device memory, but the content should be consistent.

Technically, multiple different GPUs will have separate virtual address spaces, it's
just that you create mappings within all of them such that the same virtual address
resolves to the same physical content on all of them.

So, having a single GPUVM instance representing all of them might give the illusion of
a single unified address space, but you still need to maintain each device's address
space backing resources, such as page tables, separately.

- Danilo

> 
> So we are mapping same physical content to the same virtual address in either cpu page table or any gpu device's page table...
> 
>> What we could certainly do is to optimize hmm_range_fault by making
>> hmm_range a reference counted object and using it for multiple devices
>> at the same time if those devices request the same range of an mm_struct.
>>
> 
> Not very follow. If you are trying to resolve a multiple devices concurrent access problem, I think we should serialize concurrent device fault to one address range. The reason is, during device fault handling, we might migrate the backing store so hmm_range->hmm_pfns[] might have changed after one device access it.
> 
>> I think if you start using the same drm_gpuvm for multiple devices you
>> will sooner or later start to run into the same mess we have seen with
>> KFD, where we moved more and more functionality from the KFD to the DRM
>> render node because we found that a lot of the stuff simply doesn't work
>> correctly with a single object to maintain the state.
> 
> As I understand it, KFD is designed to work across devices. A single pseudo /dev/kfd device represent all hardware gpu devices. That is why during kfd open, many pdd (process device data) is created, each for one hardware device for this process. Yes the codes are a little complicated.
> 
> Kfd manages the shared virtual address space in the kfd driver codes, like the split, merging etc. Here I am looking whether we can leverage the drm_gpuvm code for those functions.
> 
> As of the shared virtual address space across gpu devices, it is a hard requirement for svm/system allocator (aka malloc for gpu program). We need to make it work either at driver level or drm_gpuvm level. Drm_gpuvm is better because the work can be shared b/t drivers.
> 
> Thanks a lot,
> Oak
> 
>>
>> Just one more point to your original discussion on the xe list: I think
>> it's perfectly valid for an application to map something at the same
>> address you already have something else.
>>
>> Cheers,
>> Christian.
>>
>>>
>>> Thanks,
>>> Oak
> 

