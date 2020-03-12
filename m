Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 236001836C8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 18:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDBD89935;
	Thu, 12 Mar 2020 17:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CF3906EB0F;
 Thu, 12 Mar 2020 17:02:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EBA730E;
 Thu, 12 Mar 2020 10:02:21 -0700 (PDT)
Received: from [10.57.15.252] (unknown [10.57.15.252])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A670B3F6CF;
 Thu, 12 Mar 2020 10:02:19 -0700 (PDT)
Subject: Re: [PATCH] mm/hmm: Simplify hmm_vma_walk_pud slightly
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <5bd778fa-51e5-3e0c-d9bb-b38539b03c8d@arm.com>
 <20200312102813.56699-1-steven.price@arm.com>
 <20200312142749.GM31668@ziepe.ca>
 <58e296a6-d32b-bb37-28ce-ade0f784454d@arm.com>
 <20200312151113.GO31668@ziepe.ca>
 <689d3c56-3d19-4655-21f5-f9aeab3089df@arm.com>
 <20200312163734.GR31668@ziepe.ca>
From: Steven Price <steven.price@arm.com>
Message-ID: <bf9b38ae-edd5-115f-e1ca-d769872f994a@arm.com>
Date: Thu, 12 Mar 2020 17:02:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312163734.GR31668@ziepe.ca>
Content-Language: en-GB
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/03/2020 16:37, Jason Gunthorpe wrote:
> On Thu, Mar 12, 2020 at 04:16:33PM +0000, Steven Price wrote:
>>> Actually, while you are looking at this, do you think we should be
>>> adding at least READ_ONCE in the pagewalk.c walk_* functions? The
>>> multiple references of pmd, pud, etc without locking seems sketchy to
>>> me.
>>
>> I agree it seems worrying. I'm not entirely sure whether the holding of
>> mmap_sem is sufficient,
> 
> I looked at this question, and at least for PMD, mmap_sem is not
> sufficient. I didn't easilly figure it out for the other ones
> 
> I'm guessing if PMD is not safe then none of them are.
> 
>> this isn't something that I changed so I've just
>> been hoping that it's sufficient since it seems to have been working
>> (whether that's by chance because the compiler didn't generate multiple
>> reads I've no idea). For walking the kernel's page tables the lack of
>> READ_ONCE is also not great, but at least for PTDUMP we don't care too much
>> about accuracy and it should be crash proof because there's no RCU grace
>> period. And again the code I was replacing didn't have any special
>> protection.
>>
>> I can't see any harm in updating the code to include READ_ONCE and I'm happy
>> to review a patch.
> 
> The reason I ask is because hmm's walkers often have this pattern
> where they get the pointer and then de-ref it (again) then
> immediately have to recheck the 'again' conditions of the walker
> itself because the re-read may have given a different value.
> 
> Having the walker deref the pointer and pass the value it into the ops
> for use rather than repeatedly de-refing an unlocked value seems like
> a much safer design to me.

Yeah that sounds like a good idea.

> If this also implicitly relies on a RCU grace period then it is also
> missing RCU locking...

True - I'm not 100% sure in what situations a page table entry can be 
freed. Anshuman has added locking to deal with memory hotplug[1]. I 
believe this is sufficient.

[1] bf2b59f60ee1 ("arm64/mm: Hold memory hotplug lock while walking for 
kernel page table dump")

> I also didn't quite understand why walk_pte_range() skipped locking
> the pte in the no_vma case - I don't get why vma would be related to
> locking here.

The no_vma case is for walking the kernel's page tables and they may 
have entries that are not backed by struct page, so there isn't 
(reliably) a PTE lock to take.

> I also saw that hmm open coded the pte walk, presumably for
> performance, so I was thinking of adding some kind of pte_range()
> callback to avoid the expensive indirect function call per pte, but
> hmm also can't have the pmd locked...

Yeah the callback per PTE is a bit heavy because of the indirect 
function call. I'm not sure how to optimise it beyond open coding at the 
PMD level. One option would be to provide helper functions to make it a 
bit more generic.

Do you have an idea of what pte_range() would look like?

Steve
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
