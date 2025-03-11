Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE72A5D949
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B140910E101;
	Wed, 12 Mar 2025 09:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 88BE810E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 11:14:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F7C7152B;
 Tue, 11 Mar 2025 04:14:42 -0700 (PDT)
Received: from [10.1.30.125] (XHFQ2J9959.cambridge.arm.com [10.1.30.125])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9523F673;
 Tue, 11 Mar 2025 04:14:29 -0700 (PDT)
Message-ID: <32814695-359e-4c4b-90a4-c7c34421a1d5@arm.com>
Date: Tue, 11 Mar 2025 11:14:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: udmabuf vmap failed (Revert "udmabuf: fix vmap_udmabuf error page
 set" can help)
Content-Language: en-GB
To: Huan Yang <link@vivo.com>, Bingbu Cao <bingbu.cao@linux.intel.com>,
 vivek.kasireddy@intel.com, hch@lst.de
Cc: linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
References: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
 <d7a54599-350e-4e58-81b6-119ffa2ab03e@vivo.com>
 <ab468ce7-c8ac-48eb-a6c0-386ea7aa9a0c@linux.intel.com>
 <78cd737d-5e85-4d3c-8bb5-0b925d81719b@vivo.com>
 <29445257-b8df-72bd-0650-44c8deb1506c@linux.intel.com>
 <5da7bd8a-c6db-4995-b947-444e2c78aa7c@vivo.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <5da7bd8a-c6db-4995-b947-444e2c78aa7c@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Mar 2025 09:22:45 +0000
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

On 11/03/2025 09:34, Huan Yang wrote:
> Hi Christoph and Ryan,
> 
> Can you help us check vmap_pfn's pfn check is right? Did here mischecked pfn_valid?

I'm no expert on this piece of code, but I believe pfn_valid() is checking to
see if a pfn is valid *memory*. i.e. does it have a corresponding struct page?

I'm guessing that vmap_pfn() is only intended to be used for non-memory pfns,
e.g. mmio regions. You probably want either vmap() or vm_map_ram()?

Thanks,
Ryan

> 
> Thank you.
> 
> 在 2025/3/11 17:02, Bingbu Cao 写道:
>> Christoph and Ryan,
>>
>> Could you help check this? Thanks.
>>
>> On 3/11/25 4:54 PM, Huan Yang wrote:
>>> 在 2025/3/11 16:42, Bingbu Cao 写道:
>>>> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this
>>>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> Huan,
>>>>
>>>> Thanks for your response.
>>>>
>>>> On 3/11/25 3:12 PM, Huan Yang wrote:
>>>>> 在 2025/3/11 14:40, Bingbu Cao 写道:
>>>>>> [You don't often get email from bingbu.cao@linux.intel.com. Learn why this
>>>>>> is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>>
>>>>>> Huan Yang and Vivek,
>>>>>>
>>>>>> I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
>>>>>> buffers now. vmap_pfn_apply() will report a warning to complain that
>>>>>> the pfns are invalid.
>>>>>> I dump the pfn numbers as below:
>>>>>> [ 3365.399641] pg[0] pfn 1148695
>>>>>> [ 3365.399642] pg[1] pfn 1145057
>>>>>> [ 3365.399642] pg[2] pfn 1134070
>>>>>> [ 3365.399643] pg[3] pfn 1148700
>>>>>> [ 3365.399643] pg[4] pfn 1144871
>>>>>> [ 3365.399643] pg[5] pfn 1408686
>>>>>> [ 3365.399643] pg[6] pfn 1408683
>>>>>> ...
>>>>>> [ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489
>>>>>> vmap_pfn_apply+0xb7/0xd0
>>>>>> [ 3365.399667] Modules linked in:...
>>>>>> [ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-
>>>>>> rc2-rvp #845
>>>>>> [ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS
>>>>>> xxxFWI1.R00.3221.D83.2408120121 08/12/2024
>>>>>> [ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
>>>>>> [ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21
>>>>>> c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a
>>>>>> <0f> 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
>>>>>> [ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
>>>>>> [ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX:
>>>>>> 0000000000000000
>>>>>> [ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI:
>>>>>> 00000000ffffffff
>>>>>> [ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09:
>>>>>> 0000000000000001
>>>>>> [ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12:
>>>>>> ffffb9b50c32fbd0
>>>>>> [ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15:
>>>>>> ffff941618665ac8
>>>>>> [ 3365.399760] FS:  00007ff9e9ddd740(0000) GS:ffff94196f780000(0000)
>>>>>> knlGS:0000000000000000
>>>>>> [ 3365.399760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>>>> [ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4:
>>>>>> 0000000000f72ef0
>>>>>> [ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
>>>>>> 0000000000000000
>>>>>> [ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
>>>>>> 0000000000000400
>>>>>> [ 3365.399763] PKRU: 55555554
>>>>>> [ 3365.399763] Call Trace:
>>>>>> [ 3365.399765]  <TASK>
>>>>>> [ 3365.399769]  ? show_regs+0x6d/0x80
>>>>>> [ 3365.399773]  ? __warn+0x97/0x160
>>>>>> [ 3365.399777]  ? vmap_pfn_apply+0xb7/0xd0
>>>>>> [ 3365.399777]  ? report_bug+0x1ec/0x240
>>>>>> [ 3365.399782]  ? handle_bug+0x63/0xa0
>>>>>> [ 3365.399784]  ? exc_invalid_op+0x1d/0x80
>>>>>> [ 3365.399785]  ? asm_exc_invalid_op+0x1f/0x30
>>>>>> [ 3365.399790]  ? vmap_pfn_apply+0xb7/0xd0
>>>>>> [ 3365.399791]  __apply_to_page_range+0x522/0x8a0
>>>>>> [ 3365.399794]  ? __pfx_vmap_pfn_apply+0x10/0x10
>>>>>> [ 3365.399795]  apply_to_page_range+0x18/0x20
>>>>>> [ 3365.399796]  vmap_pfn+0x77/0xd0
>>>>>> [ 3365.399797]  vmap_udmabuf+0xc5/0x110
>>>>>> [ 3365.399802]  dma_buf_vmap+0x96/0x130
>>>>>>
>>>>>> I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
>>>>>> then I can vmap the pages. Could you help what's wrong with that?
>>>>> Sorry for that, as I reviewed pfn_valid, that's someting wired:
>>>>>
>>>>> /**
>>>>>    * pfn_valid - check if there is a valid memory map entry for a PFN
>>>>>    * @pfn: the page frame number to check
>>>>>    *
>>>>>    * Check if there is a valid memory map entry aka struct page for the @pfn.
>>>>>    * Note, that availability of the memory map entry does not imply that
>>>>>    * there is actual usable memory at that @pfn. The struct page may
>>>>>    * represent a hole or an unusable page frame.
>>>>>    *
>>>>>    * Return: 1 for PFNs that have memory map entries and 0 otherwise
>>>>>    */
>>>>>
>>>>> So, if pfn valid, it's return 1, else 0. So mean, only 1 is a valid pfn.
>>>>> But vmap_pfn_apply in there:
>>>>>
>>>>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>>>>> {
>>>>>       struct vmap_pfn_data *data = private;
>>>>>       unsigned long pfn = data->pfns[data->idx];
>>>>>       pte_t ptent;
>>>>>
>>>>>       if (WARN_ON_ONCE(pfn_valid(pfn)))
>>>>>           return -EINVAL;
>>>>>
>>>>>       ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>>>>       set_pte_at(&init_mm, addr, pte, ptent);
>>>>>
>>>>>       data->idx++;
>>>>>       return 0;
>>>>> }
>>>>>
>>>>> Do it give a wrong check? maybe should fix by:
>>>> I guess not, it looks more like warning when you trying to vmap a
>>>> pfn which already took a valid entry in pte.
>>> No, I think here check need pfn is valid, then can set it. If a pfn is
>>> invalid, why we set it in PTE?
>>>
>>> Also, I can't make sure.
>>>
>>> BTW, can you fix it then retest?
>>>
>>> Thank you.
>>>
>>>> However, the MM code is so complex for me, just my guess. :)
>>>>
>>>>> static int vmap_pfn_apply(pte_t *pte, unsigned long addr, void *private)
>>>>> {
>>>>>       struct vmap_pfn_data *data = private;
>>>>>       unsigned long pfn = data->pfns[data->idx];
>>>>>       pte_t ptent;
>>>>>
>>>>> -    if (WARN_ON_ONCE(pfn_valid(pfn)))
>>>>> +    if (WARN_ON_ONCE(!pfn_valid(pfn)))
>>>>>           return -EINVAL;
>>>>>
>>>>>       ptent = pte_mkspecial(pfn_pte(pfn, data->prot));
>>>>>       set_pte_at(&init_mm, addr, pte, ptent);
>>>>>
>>>>>       data->idx++;
>>>>>       return 0;
>>>>> }
>>>>>
>>>>> Please help me check it, also, you can apply this and then check it.:)
>>>>>
>>>>>> -- 
>>>>>> Best regards,
>>>>>> Bingbu Cao
>>>> -- 
>>>> Best regards,
>>>> Bingbu Cao

