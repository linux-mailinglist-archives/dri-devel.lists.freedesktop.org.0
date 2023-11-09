Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A717E7196
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 19:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F35B10E0EC;
	Thu,  9 Nov 2023 18:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E998E10E0EC
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 18:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699554890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXjSy5YA5D8YncNtofbDL87rfXXmUD1aZWvjINGfVIE=;
 b=CxVdb91oYIgILMgcAJbl9OnHC5wdFjxIX9k2mrI0OxQACDUCKACqG6zkxqqLrfNzrpofeb
 gJqyN4qNEigy9NgMwxe49hGM2up2CNZLxyIkRcPkSUuy1UARlTdAwnZ0m40SKrSP6mEi7h
 virglcvJuqzBf5hna2IoNIyEZdbF5Ek=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-HPf4hDZXOmywQI2ymX_law-1; Thu, 09 Nov 2023 13:34:48 -0500
X-MC-Unique: HPf4hDZXOmywQI2ymX_law-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32fd5f7b674so568272f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 10:34:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699554887; x=1700159687;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HXjSy5YA5D8YncNtofbDL87rfXXmUD1aZWvjINGfVIE=;
 b=T4nnWJonmLImvtmtBype2p/Cy4tWi7R5BLVXrTSYO+mamxCBSZb4/e6f6UCYT0Zb/4
 08P8HzCSoWqGs6Ci5FSypbLq8cZwxsN+Wfi+1jQx+k81UEeUiaLkSxHgD3ZXLvzr391V
 nq8RZeJoYNNPVfPhHtBRUeg/c21GIF1eQXaSUfH1HXOHGn1rKGn8A8KiLjMsyqwqAbvT
 6PrWKe8i7+eNiLrVlZgG4c+KVV3xr9JDaLfCAEipJxFYmmy/VgLmikMFmzaJMf7I70s8
 gleGJBng3RGs0mxKpy6fwe/1WoZ8mbZ0f/rM+MPGte+/HQ0+Qkwf3UuctmPJ2vBtfwdG
 TjKQ==
X-Gm-Message-State: AOJu0YyY98K/3lhqvmDtu09XY92eXpfXlzYO1s39OwVhdwZG0QhMGxB8
 zaV4jo1+duz8z9/zCksubQrUH5tCDp7bHqDjQMgk8cBozLgGMTGqV9egx3/AWiacmixvoy1CyPc
 oCPTUsIy7zpq+p0zfXbAZDo7zZ+6z
X-Received: by 2002:a5d:5504:0:b0:32f:b1ea:db78 with SMTP id
 b4-20020a5d5504000000b0032fb1eadb78mr4844253wrv.59.1699554887535; 
 Thu, 09 Nov 2023 10:34:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZe8hfJ4Prnto9BFitiesz+qXT9MkRCFMEQZ5Ti4xGYe7R9GwbGcG2vTv7B7AR26dmUADt2Q==
X-Received: by 2002:a5d:5504:0:b0:32f:b1ea:db78 with SMTP id
 b4-20020a5d5504000000b0032fb1eadb78mr4844226wrv.59.1699554887146; 
 Thu, 09 Nov 2023 10:34:47 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a5d670d000000b0032d8354fb43sm239003wru.76.2023.11.09.10.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 10:34:46 -0800 (PST)
Message-ID: <4532d9d5-4c5a-4639-8136-d3ba9995d7b6@redhat.com>
Date: Thu, 9 Nov 2023 19:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next v8 09/12] drm/gpuvm: reference count
 drm_gpuvm structures
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20231101233113.8059-10-dakr@redhat.com>
 <be93d9ef-3d3e-4262-a280-d2922b983ca1@amd.com> <ZUTyGTxcH7WlHKsv@pollux>
 <a2e13a27-d2e5-4ae3-9c11-c18b425b69cc@amd.com>
 <b533af44-0404-49c9-9879-3414d0964acc@redhat.com>
 <51dea5f3-a18b-4797-b4fa-87da7db4624a@amd.com> <ZUjZFFtLM435tTxJ@pollux>
 <8e87d962-c80c-40d9-94d7-58b6cd9dd794@amd.com> <ZUj0DdYZUgjhcvf5@pollux>
 <6d3c48f6-a92d-49b3-b836-ee1bc95b56bf@amd.com> <ZUkXkJ+zT7OFGosC@pollux>
 <44bc28c7-05f4-4419-5183-453c4951aac0@linux.intel.com>
 <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <6c536c94-7072-403c-9c63-d932252fd66b@amd.com>
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

On 11/9/23 17:03, Christian König wrote:
> Am 09.11.23 um 16:50 schrieb Thomas Hellström:
>> [SNIP]
>>>>
>> Did we get any resolution on this?
>>
>> FWIW, my take on this is that it would be possible to get GPUVM to work both with and without internal refcounting; If with, the driver needs a vm close to resolve cyclic references, if without that's not necessary. If GPUVM is allowed to refcount in mappings and vm_bos, that comes with a slight performance drop but as Danilo pointed out, the VM lifetime problem iterating over a vm_bo's mapping becomes much easier and the code thus becomes easier to maintain moving forward. That convinced me it's a good thing.
> 
> I strongly believe you guys stumbled over one of the core problems with the VM here and I think that reference counting is the right answer to solving this.
> 
> The big question is that what is reference counted and in which direction does the dependency points, e.g. we have here VM, BO, BO_VM and Mapping objects.
> 
> Those patches here suggest a counted Mapping -> VM reference and I'm pretty sure that this isn't a good idea. What we should rather really have is a BO -> VM or BO_VM ->VM reference. In other words that each BO which is part of the VM keeps a reference to the VM.

We have both. Please see the subsequent patch introducing VM_BO structures for that.

As I explained, mappings (struct drm_gpuva) keep a pointer to their VM they're mapped
in and besides that it doesn't make sense to free a VM that still contains mappings,
the reference count ensures that. This simply ensures memory safety.

> 
> BTW: At least in amdgpu we can have BOs which (temporary) doesn't have any mappings, but are still considered part of the VM.

That should be possible.

> 
>>
>> Another issue Christian brought up is that something intended to be embeddable (a base class) shouldn't really have its own refcount. I think that's a valid point. If you at some point need to derive from multiple such structs each having its own refcount, things will start to get weird. One way to resolve that would be to have the driver's subclass provide get() and put() ops, and export a destructor for the base-class, rather than to have the base-class provide the refcount and a destructor  ops.

GPUVM simply follows the same pattern we have with drm_gem_objects. And I think it makes
sense. Why would we want to embed two struct drm_gpuvm in a single driver structure?

> 
> Well, I have never seen stuff like that in the kernel. Might be that this works, but I would rather not try if avoidable.
> 
>>
>> That would also make it possible for the driver to decide the context for the put() call: If the driver needs to be able to call put() from irq / atomic context but the base-class'es destructor doesn't allow atomic context, the driver can push freeing out to a work item if needed.
>>
>> Finally, the refcount overflow Christian pointed out. Limiting the number of mapping sounds like a reasonable remedy to me.
> 
> Well that depends, I would rather avoid having a dependency for mappings.
> 
> Taking the CPU VM handling as example as far as I know vm_area_structs doesn't grab a reference to their mm_struct either. Instead they get automatically destroyed when the mm_struct is destroyed.

Certainly, that would be possible. However, thinking about it, this might call for
huge trouble.

First of all, we'd still need to reference count a GPUVM and take a reference for each
VM_BO, as we do already. Now instead of simply increasing the reference count for each
mapping as well, we'd need a *mandatory* driver callback that is called when the GPUVM
reference count drops to zero. Maybe something like vm_destroy().

The reason is that GPUVM can't just remove all mappings from the tree nor can it free them
by itself, since drivers might use them for tracking their allocated page tables and/or
other stuff.

Now, let's think about the scope this callback might be called from. When a VM_BO is destroyed
the driver might hold a couple of locks (for Xe it would be the VM's shared dma-resv lock and
potentially the corresponding object's dma-resv lock if they're not the same already). If
destroying this VM_BO leads to the VM being destroyed, the drivers vm_destroy() callback would
be called with those locks being held as well.

I feel like doing this finally opens the doors of the locking hell entirely. I think we should
really avoid that.

> 
> Which makes sense in that case because when the mm_struct is gone the vm_area_struct doesn't make sense any more either.
> 
> What we clearly need is a reference to prevent the VM or at least the shared resv to go away to early.

Yeah, that was a good hint and we've covered that.

> 
> Regards,
> Christian.
> 
>>
>> But I think all of this is fixable as follow-ups if needed, unless I'm missing something crucial.

Fully agree, I think at this point we should go ahead and land this series.

>>
>> Just my 2 cents.
>>
>> /Thomas
>>
>>
> 

