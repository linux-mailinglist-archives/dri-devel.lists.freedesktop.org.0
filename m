Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58062C7381E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 11:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6405D10E742;
	Thu, 20 Nov 2025 10:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XhY/1+/7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D4A10E73B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 10:43:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7D8543A81;
 Thu, 20 Nov 2025 10:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC57C4CEF1;
 Thu, 20 Nov 2025 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763635414;
 bh=9f/U412E7kdzklQJjAr7BwVvqYGEsPTODqZz6a3+sCc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XhY/1+/7NMweMVA4ro3CHHHMBZW3+zgGPrU9U6q/UXgeNgQ1lb+HFlvax8lV4u5gN
 bZKq3oMIVzfvefQrS7UDhxdgV3tNcahf8dVB5chaBxy+JVFulhZJfbV61r7y6DVZcV
 GHxxHeo2XmOVLRBV9pYqlwrVU4M1x7SeJhaTKE5SSSmKsAyp2JFN0zJLGctnqO1Pqb
 /FNYGbxoqeZTJUR7BcfDHNQhL09orBJHg/eln6I5jzoFDhFL//iOOjEal/8tk+jd2z
 b1ihrOs6DhNr9SEBm5QFnPiBamlJeII9RsXepsgi7pW7AGN0rulIbmYwiyEjvphNP/
 L3q1Lg5kG+Xzg==
Message-ID: <8fb76ed2-92e1-4e33-94ba-c1e4a21ec316@kernel.org>
Date: Thu, 20 Nov 2025 11:43:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/huge_memory.c: introduce folio_split_unmapped
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251120030709.2933665-1-balbirs@nvidia.com>
 <4b87bd52-5582-4599-8a97-38843e27d0a7@kernel.org>
 <875a9449-fcdd-4aef-9d77-1703dd02edf0@nvidia.com>
 <3c332dea-ea60-4939-9843-ac7d3068c7c8@kernel.org>
 <a81d10bb-cf63-4095-b8ef-1631f8ef5712@nvidia.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <a81d10bb-cf63-4095-b8ef-1631f8ef5712@nvidia.com>
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

On 11/20/25 11:35, Balbir Singh wrote:
> On 11/20/25 20:32, David Hildenbrand (Red Hat) wrote:
>> On 11/20/25 10:25, Balbir Singh wrote:
>>> On 11/20/25 20:09, David Hildenbrand (Red Hat) wrote:
>>>> On 11/20/25 04:07, Balbir Singh wrote:
>>>>> Code refactoring of __folio_split() via helper
>>>>> __folio_freeze_and_split_unmapped() caused a regression with clang-20
>>>>> with CONFIG_SHMEM=n, the compiler was not able to optimize away the
>>>>> call to shmem_uncharge() due to changes in nr_shmem_dropped.
>>>>> Fix this by checking for shmem_mapping() prior to calling
>>>>> shmem_uncharge(), shmem_mapping() returns false when CONFIG_SHMEM=n.
>>>>>
>>>>> smatch also complained about parameter end being used without
>>>>> initialization, which is a false positive, but keep the tool happy
>>>>> by sending in initialized parameters. end is initialized to 0.
>>>>>
>>>>> Add detailed documentation comments for folio_split_unmapped()
>>>>>
>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>> Cc: David Hildenbrand <david@redhat.com>
>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>>> Cc: Gregory Price <gourry@gourry.net>
>>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>>> Cc: Nico Pache <npache@redhat.com>
>>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>>> Cc: Barry Song <baohua@kernel.org>
>>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>>> Cc: David Airlie <airlied@gmail.com>
>>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>>
>>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>>> ---
>>>>>     mm/huge_memory.c | 32 ++++++++++++++++++++++----------
>>>>>     1 file changed, 22 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>>> index 78a31a476ad3..c4267a0f74df 100644
>>>>> --- a/mm/huge_memory.c
>>>>> +++ b/mm/huge_memory.c
>>>>> @@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>>>>>         int ret = 0;
>>>>>         struct deferred_split *ds_queue;
>>>>>     +    VM_WARN_ON_ONCE(!mapping && end != 0);
>>>>
>>>> You could drop the "!= 0"
>>>
>>> Ack
>>>
>>> VM_WARN_ONE(!mapping && end);
>>>
>>>>
>>>>>         /* Prevent deferred_split_scan() touching ->_refcount */
>>>>>         ds_queue = folio_split_queue_lock(folio);
>>>>>         if (folio_ref_freeze(folio, 1 + extra_pins)) {
>>>>> @@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>         int nr_shmem_dropped = 0;
>>>>>         int remap_flags = 0;
>>>>>         int extra_pins, ret;
>>>>> -    pgoff_t end;
>>>>> +    pgoff_t end = 0;
>>>>>         bool is_hzp;
>>>>>           VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>>>>> @@ -4049,7 +4050,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>           local_irq_enable();
>>>>>     -    if (nr_shmem_dropped)
>>>>> +    if (mapping && shmem_mapping(mapping) && nr_shmem_dropped)
>>>>>             shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>>
>>>> That looks questionable. We shouldn't add runtime check to handle buildtime things.
>>>>
>>>> Likely what you want is instead
>>>>
>>>> if (IS_ENABLED(CONFIG_SHMEM) && nr_shmem_dropped)
>>>>       shmem_uncharge()
>>>>
>>>
>>> shmem_mapping() returns false for CONFIG_SHMEM=n and shmem_mapping() checks that the mapping
>>> is indeed for shmem ops before uncharging. Happy to change it if you like,
>>> your version is more readable
>> Good point, but the questionable thing is that it looks like nr_shmem_dropped
>> could be set for non-shmem mappings, when it's really just a compiler thing.
>>
>> What about handling it through a proper stub so we can keep this calling code simple?
>>
>> diff --git a/include/linux/shmem_fs.h b/include/linux/shmem_fs.h
>> index 5b368f9549d67..e38cb01031200 100644
>> --- a/include/linux/shmem_fs.h
>> +++ b/include/linux/shmem_fs.h
>> @@ -136,11 +136,15 @@ static inline bool shmem_hpage_pmd_enabled(void)
>>   
>>   #ifdef CONFIG_SHMEM
>>   extern unsigned long shmem_swap_usage(struct vm_area_struct *vma);
>> +extern void shmem_uncharge(struct inode *inode, long pages);
>>   #else
>>   static inline unsigned long shmem_swap_usage(struct vm_area_struct *vma)
>>   {
>>          return 0;
>>   }
>> +static inline void shmem_uncharge(struct inode *inode, long pages)
>> +{
>> +}
>>   #endif
>>   extern unsigned long shmem_partial_swap_usage(struct address_space *mapping,
>>                                                  pgoff_t start, pgoff_t end);
>> @@ -194,7 +198,6 @@ static inline pgoff_t shmem_fallocend(struct inode *inode, pgoff_t eof)
>>   }
>>   
>>   extern bool shmem_charge(struct inode *inode, long pages);
>> -extern void shmem_uncharge(struct inode *inode, long pages);
>>   
>>   #ifdef CONFIG_USERFAULTFD
>>   #ifdef CONFIG_SHMEM
>>
>>
> 
> Agreed, I would like to let this patch proceed and then immediately follow up patch
> along the lines of CONFIG_SHMEM as separate independent patch (independent of this
> series). What do you think?

Let's do it properly right away, no need to hurry that much.

-- 
Cheers

David
