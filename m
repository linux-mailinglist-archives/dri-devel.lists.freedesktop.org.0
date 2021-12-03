Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF16467A1B
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727E26E21A;
	Fri,  3 Dec 2021 15:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A3936E21A;
 Fri,  3 Dec 2021 15:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8C3273F4B4;
 Fri,  3 Dec 2021 16:13:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.189
X-Spam-Level: 
X-Spam-Status: No, score=-3.189 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.09,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FqDGDIDgag9V; Fri,  3 Dec 2021 16:13:11 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 729203F449;
 Fri,  3 Dec 2021 16:13:10 +0100 (CET)
Received: from [192.168.0.209] (unknown [192.55.54.50])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A57E3362AD7;
 Fri,  3 Dec 2021 16:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1638544390; bh=R6orVX9tGpTYIIPRlGHucB/HyXpm9/hllXlfKl4zCY0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AhnOFHr8dzshTkySo43N2LqpVEKiaeOyzvZzIN++fCgmHOjYHvVHoM4KTLUyW2071
 b3oOb9ogXF8J2FPtCH/PNx/gca7YoR8goF9LiTz4xtTLVlT8imjSsX0f7HAyYdNmQg
 qyNvN8JWYpz5xAtjOHNJ++i1tASVOBtkAPs5OZGg=
Message-ID: <962a5319-62b5-00f5-a987-80d8abd75ece@shipmail.org>
Date: Fri, 3 Dec 2021 16:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid establishing a
 locking order between fence classes
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20211130121936.586031-1-thomas.hellstrom@linux.intel.com>
 <29d096c91d720fbe5d410124580a02b663155b56.camel@linux.intel.com>
 <250a8e47-2093-1a98-3859-0204ec4e60e6@amd.com>
 <712b54fa1c09ae5cc1d75739ad8a7286f1dae8db.camel@linux.intel.com>
 <49cf2d43-9a8a-7738-0889-7e16b0256249@linux.intel.com>
 <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
 <f8f1500c-170d-ccf9-ac2d-1484bbdc587e@amd.com>
 <96eca78d-2b92-cce0-0aee-2d5f72c26bdf@linux.intel.com>
 <4d3c9eb5-f093-84c9-47da-ee27630ee646@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <4d3c9eb5-f093-84c9-47da-ee27630ee646@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/3/21 16:00, Christian König wrote:
> Am 03.12.21 um 15:50 schrieb Thomas Hellström:
>>
>> On 12/3/21 15:26, Christian König wrote:
>>> [Adding Daniel here as well]
>>>
>>> Am 03.12.21 um 15:18 schrieb Thomas Hellström:
>>>> [SNIP]
>>>>> Well that's ok as well. My question is why does this single dma_fence
>>>>> then shows up in the dma_fence_chain representing the whole
>>>>> migration?
>>>> What we'd like to happen during eviction is that we
>>>>
>>>> 1) await any exclusive- or moving fences, then schedule the migration
>>>> blit. The blit manages its own GPU ptes. Results in a single fence.
>>>> 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
>>>> fences.
>>>> 3) Most but not all of the remaining resv shared fences will have been
>>>> finished in 2) We can't easily tell which so we have a couple of 
>>>> shared
>>>> fences left.
>>>
>>> Stop, wait a second here. We are going a bit in circles.
>>>
>>> Before you migrate a buffer, you *MUST* wait for all shared fences 
>>> to complete. This is documented mandatory DMA-buf behavior.
>>>
>>> Daniel and I have discussed that quite extensively in the last few 
>>> month.
>>>
>>> So how does it come that you do the blit before all shared fences 
>>> are completed?
>>
>> Well we don't currently but wanted to... (I haven't consulted Daniel 
>> in the matter, tbh).
>>
>> I was under the impression that all writes would add an exclusive 
>> fence to the dma_resv.
>
> Yes that's correct. I'm working on to have more than one write fence, 
> but that is currently under review.
>
>> If that's not the case or this is otherwise against the mandatory 
>> DMA-buf bevhavior, we can certainly keep that part as is and that 
>> would eliminate 3).
>
> Ah, now that somewhat starts to make sense.
>
> So your blit only waits for the writes to finish before starting the 
> blit. Yes that's legal as long as you don't change the original 
> content with the blit.
>
> But don't you then need to wait for both reads and writes before you 
> unmap the VMAs?

Yes, but that's planned to be done all async, and those unbind jobs are 
scheduled simultaneosly with the blit, and the blit itself manages its 
own page-table-entries, so no need to unbind any blit vmas.

>
> Anyway the good news is your problem totally goes away with the 
> DMA-resv rework I've already send out. Basically it is now possible to 
> have more than one fence in the DMA-resv object for migrations and all 
> existing fences are kept around until they are finished.

Sounds good.

Thanks,

Thomas

