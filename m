Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C38B9A3394
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 06:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D6C10E358;
	Fri, 18 Oct 2024 04:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NlsRIzX8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05310E358
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 04:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729224152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NT+35gy0p2nmlcoAovM9NQ32DMS9fnGkSDHL+7Pc30Y=;
 b=NlsRIzX8HxVOzCVbLvfyt4v22sEpxCVgsig2LRMhyRXCLOmtHQ0SELvVmU9N+8fGMbLPgZ
 TBEvJC2zhEZegyjZE6NVzAH66Kp+9dhSjmKSh1aBAkrxROBxtAo5s6muCK5lI4r9/d5vj8
 C8YvaB0sFuIaWdLWsYukoK+KWPeYQRM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-PYjcMz9IPuevJsAfynyyaw-1; Fri, 18 Oct 2024 00:02:30 -0400
X-MC-Unique: PYjcMz9IPuevJsAfynyyaw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-539e03bfd4aso1440702e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 21:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729224149; x=1729828949;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NT+35gy0p2nmlcoAovM9NQ32DMS9fnGkSDHL+7Pc30Y=;
 b=UFOuASzjGLg6Qnfo+Zx7bFiD5wrYWAmkeA3PbDFaJq3neQpvJOE1/OSPemujf9uSMX
 3IaQ7stHPDNX6NPc83fRHnqYq1f7L5GNlsDV8wnitEdKJVB9Y28zrJQbZEzXvQSahDQo
 WoZbOyWDKVO+KaTQ6E5x49oGCG2Ca3Gi/Pad/FfJI9IZymHsZnyq/uPAURLWljw8uRh6
 XgOAOlwWNYGVNSNJZK3ZYvmHJf21JI6comS58ybnFvkTeN2GYafehkpgg7/Bu2FfcvjO
 NoiyufftXP/mIgnxIlDlXaB/DS1/oWoJqrqk4xP+cBCH47k3MOwK1xplfTlL02UOyoB1
 riKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqBZl15+kGj9LWjWWJI3G/F4YyA8CbXM3ymW9teY/BfTcyTpu5FdpPDTihOHDwjy58Zd3YzqWcRRY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsMpdQzBafKYPSB0tahDst0IDKUdhNze9ivaqB61biIL2Or5Js
 zS4S/1XIp+0C3IFpcLcg1wk4LG4bwV3SfiEkkK6v38/To3in4a+zTB4T25/4X5QRdgjVL6BN3yb
 dBlNrUFWN4qj408jtWccmNd0WloIcuok+VawHIOoQuNvkBrA8Bt4y57NVRB1U1CTn
X-Received: by 2002:a05:6512:690:b0:539:ea12:d629 with SMTP id
 2adb3069b0e04-53a153407b0mr526028e87.8.1729224149015; 
 Thu, 17 Oct 2024 21:02:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcNaqbODBXl2K5aIll/SDHOlqD+BaftR+tTb7U6ZN7JCNU/tl4huHMoe7dgocL6LmpK1ctqw==
X-Received: by 2002:a05:6512:690:b0:539:ea12:d629 with SMTP id
 2adb3069b0e04-53a153407b0mr526011e87.8.1729224148367; 
 Thu, 17 Oct 2024 21:02:28 -0700 (PDT)
Received: from [192.168.1.86] (82-181-87-79.bb.dnainternet.fi. [82.181.87.79])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0afdsm103623e87.133.2024.10.17.21.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Oct 2024 21:02:27 -0700 (PDT)
Message-ID: <6f5a335a-1c1a-424d-94b9-96cad6fa642b@redhat.com>
Date: Fri, 18 Oct 2024 07:02:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/29] mm/migrate: Add migrate_device_prepopulated_range
To: Alistair Popple <apopple@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, christian.koenig@amd.com,
 thomas.hellstrom@linux.intel.com, simona.vetter@ffwll.ch,
 felix.kuehling@amd.com, dakr@kernel.org
References: <20241016032518.539495-1-matthew.brost@intel.com>
 <20241016032518.539495-3-matthew.brost@intel.com>
 <87o73k8yyq.fsf@nvdebian.thelocal>
 <Zw9FPAzlvGVswwxR@DUT025-TGLU.fm.intel.com>
 <ZxBgqc0sRE2Ur2D4@DUT025-TGLU.fm.intel.com>
 <87h69bo5u2.fsf@nvdebian.thelocal>
 <ZxB6NypgrYN1spYc@DUT025-TGLU.fm.intel.com>
 <874j5bo0yu.fsf@nvdebian.thelocal>
 <ZxCNeUqqd7os5fyn@DUT025-TGLU.fm.intel.com>
 <87zfn3mg69.fsf@nvdebian.thelocal>
 <ZxEwAIc4dW7Sig36@DUT025-TGLU.fm.intel.com>
 <87r08emlb7.fsf@nvdebian.thelocal>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <87r08emlb7.fsf@nvdebian.thelocal>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hi,

On 10/18/24 00:58, Alistair Popple wrote:
> Matthew Brost <matthew.brost@intel.com> writes:
>
>> On Thu, Oct 17, 2024 at 04:49:11PM +1100, Alistair Popple wrote:
>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>
>>>> On Thu, Oct 17, 2024 at 02:21:13PM +1100, Alistair Popple wrote:
>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>
>>>>>> On Thu, Oct 17, 2024 at 12:49:55PM +1100, Alistair Popple wrote:
>>>>>>> Matthew Brost <matthew.brost@intel.com> writes:
>>>>>>>
>>>>>>>> On Wed, Oct 16, 2024 at 04:46:52AM +0000, Matthew Brost wrote:
>>>>>>>>> On Wed, Oct 16, 2024 at 03:04:06PM +1100, Alistair Popple wrote:
>>>>>>> [...]
>>>>>>>
>>>>>>>>>>> +{
>>>>>>>>>>> +	unsigned long i;
>>>>>>>>>>> +
>>>>>>>>>>> +	for (i = 0; i < npages; i++) {
>>>>>>>>>>> +		struct page *page = pfn_to_page(src_pfns[i]);
>>>>>>>>>>> +
>>>>>>>>>>> +		if (!get_page_unless_zero(page)) {
>>>>>>>>>>> +			src_pfns[i] = 0;
>>>>>>>>>>> +			continue;
>>>>>>>>>>> +		}
>>>>>>>>>>> +
>>>>>>>>>>> +		if (!trylock_page(page)) {
>>>>>>>>>>> +			src_pfns[i] = 0;
>>>>>>>>>>> +			put_page(page);
>>>>>>>>>>> +			continue;
>>>>>>>>>>> +		}
>>>>>>>>>>> +
>>>>>>>>>>> +		src_pfns[i] = migrate_pfn(src_pfns[i]) | MIGRATE_PFN_MIGRATE;
>>>>>>>>>> This needs to be converted to use a folio like
>>>>>>>>>> migrate_device_range(). But more importantly this should be split out as
>>>>>>>>>> a function that both migrate_device_range() and this function can call
>>>>>>>>>> given this bit is identical.
>>>>>>>>>>
>>>>>>>>> Missed the folio conversion and agree a helper shared between this
>>>>>>>>> function and migrate_device_range would be a good idea. Let add that.
>>>>>>>>>
>>>>>>>> Alistair,
>>>>>>>>
>>>>>>>> Ok, I think now I want to go slightly different direction here to give
>>>>>>>> GPUSVM a bit more control over several eviction scenarios.
>>>>>>>>
>>>>>>>> What if I exported the helper discussed above, e.g.,
>>>>>>>>
>>>>>>>>  905 unsigned long migrate_device_pfn_lock(unsigned long pfn)
>>>>>>>>  906 {
>>>>>>>>  907         struct folio *folio;
>>>>>>>>  908
>>>>>>>>  909         folio = folio_get_nontail_page(pfn_to_page(pfn));
>>>>>>>>  910         if (!folio)
>>>>>>>>  911                 return 0;
>>>>>>>>  912
>>>>>>>>  913         if (!folio_trylock(folio)) {
>>>>>>>>  914                 folio_put(folio);
>>>>>>>>  915                 return 0;
>>>>>>>>  916         }
>>>>>>>>  917
>>>>>>>>  918         return migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
>>>>>>>>  919 }
>>>>>>>>  920 EXPORT_SYMBOL(migrate_device_pfn_lock);
>>>>>>>>
>>>>>>>> And then also export migrate_device_unmap.
>>>>>>>>
>>>>>>>> The usage here would be let a driver collect the device pages in virtual
>>>>>>>> address range via hmm_range_fault, lock device pages under notifier
>>>>>>>> lock ensuring device pages are valid, drop the notifier lock and call
>>>>>>>> migrate_device_unmap.
>>>>>>> I'm still working through this series but that seems a bit dubious, the
>>>>>>> locking here is pretty subtle and easy to get wrong so seeing some code
>>>>>>> would help me a lot in understanding what you're suggesting.
>>>>>>>
>>>>>> For sure locking in tricky, my mistake on not working through this
>>>>>> before sending out the next rev but it came to mind after sending +
>>>>>> regarding some late feedback from Thomas about using hmm for eviction
>>>>>> [2]. His suggestion of using hmm_range_fault to trigger migration
>>>>>> doesn't work for coherent pages, while something like below does.
>>>>>>
>>>>>> [2] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1125461
>>>>>>
>>>>>> Here is a snippet I have locally which seems to work.
>>>>>>
>>>>>> 2024 retry:
>>>>>> 2025         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>>>>>> 2026         hmm_range.hmm_pfns = src;
>>>>>> 2027
>>>>>> 2028         while (true) {
>>>>>> 2029                 mmap_read_lock(mm);
>>>>>> 2030                 err = hmm_range_fault(&hmm_range);
>>>>>> 2031                 mmap_read_unlock(mm);
>>>>>> 2032                 if (err == -EBUSY) {
>>>>>> 2033                         if (time_after(jiffies, timeout))
>>>>>> 2034                                 break;
>>>>>> 2035
>>>>>> 2036                         hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>>>>>> 2037                         continue;
>>>>>> 2038                 }
>>>>>> 2039                 break;
>>>>>> 2040         }
>>>>>> 2041         if (err)
>>>>>> 2042                 goto err_put;
>>>>>> 2043
>>>>>> 2044         drm_gpusvm_notifier_lock(gpusvm);
>>>>>> 2045         if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>>>>>> 2046                 drm_gpusvm_notifier_unlock(gpusvm);
>>>>>> 2047                 memset(src, 0, sizeof(*src) * npages);
>>>>>> 2048                 goto retry;
>>>>>> 2049         }
>>>>>> 2050         for (i = 0; i < npages; ++i) {
>>>>>> 2051                 struct page *page = hmm_pfn_to_page(src[i]);
>>>>>> 2052
>>>>>> 2053                 if (page && (is_device_private_page(page) ||
>>>>>> 2054                     is_device_coherent_page(page)) && page->zone_device_data)
>>>>>> 2055                         src[i] = src[i] & ~HMM_PFN_FLAGS;
>>>>>> 2056                 else
>>>>>> 2057                         src[i] = 0;
>>>>>> 2058                 if (src[i])
>>>>>> 2059                         src[i] = migrate_device_pfn_lock(src[i]);
>>>>>> 2060         }
>>>>>> 2061         drm_gpusvm_notifier_unlock(gpusvm);
>>>>> Practically for eviction isn't this much the same as calling
>>>>> migrate_vma_setup()? And also for eviction as Sima mentioned you
>>>>> probably shouldn't be looking at mm/vma structs.
>>>>>
>>>> hmm_range_fault is just collecting the pages, internally I suppose it
>>>> does look at a VMA (struct vm_area_struct) but I think the point is
>>>> drivers should not be looking at VMA here.
>>> migrate_vma_setup() is designed to be called by drivers and needs a vma,
>>> so in general I don't see a problem with drivers looking up vma's. The
>>> problem arises specifically for eviction and whether or not that happens
>>> in the driver or hmm_range_fault() is pretty irrelevant IMHO for the
>>> issues there (see below).
>>>
>> Ok, if you think it ok for drivers to lookup the VMA then purposed
>> exporting of migrate_device_pfn_lock & migrate_device_unmap is not
>> needed, rather just the original function exported in the this patch.
>>
>> More below too.
>>
>>>>>> 2063         migrate_device_unmap(src, npages, NULL);
>>>>>> ...
>>>>>> 2101         migrate_device_pages(src, dst, npages);
>>>>>> 2102         migrate_device_finalize(src, dst, npages);
>>>>>>
>>>>>>
>>>>>>>> Sima has strongly suggested avoiding a CPUVMA
>>>>>>>> lookup during eviction cases and this would let me fixup
>>>>>>>> drm_gpusvm_range_evict in [1] to avoid this.
>>>>>>> That sounds reasonable but for context do you have a link to the
>>>>>>> comments/discussion on this? I couldn't readily find it, but I may have
>>>>>>> just missed it.
>>>>>>>
>>>>>> See in [4], search for '2. eviction' comment from sima.
>>>>> Thanks for pointing that out. For reference here's Sima's comment:
>>>>>
>>>>>> 2. eviction
>>>>>>
>>>>>> Requirements much like migrate_to_ram, because otherwise we break the
>>>>>> migration gurantee:
>>>>>>
>>>>>> - Only looking at physical memory datastructures and locks, no looking at
>>>>>>   mm/vma structs or relying on those being locked. We rely entirely on
>>>>>>   reverse maps from try_to_migrate to find all the mappings on both cpu
>>>>>>   and gpu side (cpu only zone device swap or migration pte entries ofc).
>>>>> I also very much agree with this. That's basically why I added
>>>>> migrate_device_range(), so that we can forcibly evict pages when the
>>>>> driver needs them freed (eg. driver unload, low memory, etc.). In
>>>>> general it is impossible to guarantee eviction og all pages using just
>>>>> hmm_range_fault().
>>>>>
>>>> In this code path we don't have device pages available, hence the
>>>> purposed collection via hmm_range_fault.
>>> Why don't you have the pfns requiring eviction available? I need to read
>>> this series in more depth, but generally hmm_range_fault() can't
>>> gurantee you will find every device page.
>>>
>> There are two cases for eviction in my series:
>>
>> 1. TTM decides it needs to move memory. This calls
>> drm_gpusvm_evict_to_ram. In this case the device pfns are available
>> directly from drm_gpusvm_devmem so the migrate_device_* calls be used
>> here albiet with the new function added in this patch as device pfns may
>> be non-contiguous.
> That makes sense and is generally what I think of when I'm thinking of
> eviction. The new function makes sense too - migrate_device_range() was
> primarily introduced to allow a driver to evict all device-private pages
> from a GPU so didn't consider non-contiguous cases, etc.
>
>> 2. An inconsistent state for VA range occurs (mixed system and device pages,
>> partial unmap of a range, etc...). Here we want to evict the range ram
>> to make the state consistent. No device pages are available due to an
>> intentional disconnect between a virtual range and physical
>> drm_gpusvm_devmem, thus the device pages have to be looked up. This the
>> function drm_gpusvm_range_evict. Based on what you tell me, it likely is
>> fine the way originally coded in v2 (vma lookup + migrate_vma_*) vs
>> using hmm_range_fault like I have suggested here.
> Thanks for the explanation. I think vma lookup + migrate_vma_setup() is
> fine for this usage and is exactly what you want - it was designed to
> either select all the system memory pages or device-private pages within
> a VA range and migrate them.
>
> FWIW I have toyed with the idea of a combined
> hmm_range_fault()/migrate_vma_setup() front-end to the rest of the
> migrate_vma_*() process but haven't come up with something nice as
> yet. I don't think mixing the two in an open-coded fashion is a good
> idea though, I'd rather we come up with a new API that addresses the
> short-comings of migrate_vma_setup().

This is what I have been implementing and have a WIP version now, will
cleanup, test and send soon.

It does the migration entry installing while faulting pages, and you
continue migrate with normal migrate_vma_() flow.


>> Note #2 may be removed or unnecessary at some point if we decide to add
>> support for ininconsistent state in GPU SVM and Xe. Keeping it simple for
>> now though. See 'Ranges with mixed system and device pages' in [5].
>>
>> [5] https://patchwork.freedesktop.org/patch/619819/?series=137870&rev=2
>>
>>>>>> [3] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1110726
>>>>>> [4] https://lore.kernel.org/all/BYAPR11MB3159A304925168D8B6B4671292692@BYAPR11MB3159.namprd11.prod.outlook.com/T/#m89cd6a37778ba5271d5381ebeb03e1f963856a78
>>>>>>
>>>>>>>> It would also make the function exported in this patch unnecessary too
>>>>>>>> as non-contiguous pfns can be setup on driver side via
>>>>>>>> migrate_device_pfn_lock and then migrate_device_unmap can be called.
>>>>>>>> This also another eviction usage in GPUSVM, see drm_gpusvm_evict_to_ram
>>>>>>>> in [1].
>>>>>>>>
>>>>>>>> Do you see an issue exporting migrate_device_pfn_lock,
>>>>>>>> migrate_device_unmap?
>>>>>>> If there is a good justification for it I can't see a problem with
>>>>>>> exporting it. That said I don't really understand why you would
>>>>>>> want/need to split those steps up but I'll wait to see the code.
>>>>>>>
>>>>>> It is so the device pages returned from hmm_range_fault, which are only
>>>>>> guaranteed to be valid under the notifier lock + a seqno check, to be
>>>>>> locked and ref taken for migration. migrate_device_unmap() can trigger a
>>>>>> MMU invalidation which takes the notifier lock thus calling the function
>>>>>> which combines migrate_device_pfn_lock + migrate_device_unmap deadlocks.
>>>>>>
>>>>>> I think this flow makes sense and agree in general this likely better
>>>>>> than looking at a CPUVMA.
>>>>> I'm still a bit confused about what is better with this flow if you are
>>>>> still calling hmm_range_fault(). How is it better than just calling
>>>>> migrate_vma_setup()? Obviously it will fault the pages in, but it seems
>>>> The code in rev2 calls migrate_vma_setup but the requires a struct
>>>> vm_area_struct argument whereas hmm_range_fault does not.
>>> I'm not sure that's a good enough justfication because the problem isn't
>>> whether you're looking up vma's in driver code or mm code. The problem
>>> is you are looking up vma's at all and all that goes with that (mainly
>>> taking mmap lock, etc.)
>>>
>>> And for eviction hmm_range_fault() won't even find all the pages because
>>> their virtual address may have changed - consider what happens in cases
>>> of mremap(), fork(), etc. So eviction really needs physical pages
>>> (pfn's), not virtual addresses.
>>>
>> See above, #1 yes we use a physical pages. For #2 it is about making the
>> state consistent within a virtual address range.
> Yep, makes sense now. For migration of physical pages you want
> migrate_device_*, virtual address ranges want migrate_vma_*
>
>  - Alistair
>
>> Matt
>>  
>>>>> we're talking about eviction here so I don't understand why that would
>>>>> be relevant. And hmm_range_fault() still requires the VMA, although I
>>>>> need to look at the patches more closely, probably CPUVMA is a DRM
>>>> 'hmm_range_fault() still requires the VMA' internal yes, but again not
>>>> as argument. This is about avoiding a driver side lookup of the VMA.
>>>>
>>>> CPUVMA == struct vm_area_struct in this email.
>>> Thanks for the clarification.
>>>
>>>  - Alistair
>>>
>>>> Matt
>>>>
>>>>> specific concept?
>>>>>
>>>>> Thanks.
>>>>>
>>>>>  - Alistair
>>>>>
>>>>>> Matt
>>>>>>  
>>>>>>>  - Alistair
>>>>>>>
>>>>>>>> Matt
>>>>>>>>
>>>>>>>> [1] https://patchwork.freedesktop.org/patch/619809/?series=137870&rev=2
>>>>>>>>
>>>>>>>>> Matt
>>>>>>>>>
>>>>>>>>>>> +	}
>>>>>>>>>>> +
>>>>>>>>>>> +	migrate_device_unmap(src_pfns, npages, NULL);
>>>>>>>>>>> +
>>>>>>>>>>> +	return 0;
>>>>>>>>>>> +}
>>>>>>>>>>> +EXPORT_SYMBOL(migrate_device_prepopulated_range);
>>>>>>>>>>> +
>>>>>>>>>>>  /*
>>>>>>>>>>>   * Migrate a device coherent folio back to normal memory. The caller should have
>>>>>>>>>>>   * a reference on folio which will be copied to the new folio if migration is

--Mika


