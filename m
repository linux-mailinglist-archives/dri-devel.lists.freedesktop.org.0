Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC1BB721A
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 16:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30BB10E143;
	Fri,  3 Oct 2025 14:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B049510E143
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 14:13:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3350F1655;
 Fri,  3 Oct 2025 07:13:02 -0700 (PDT)
Received: from [10.1.37.18] (e122027.cambridge.arm.com [10.1.37.18])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA3D83F5A1;
 Fri,  3 Oct 2025 07:13:07 -0700 (PDT)
Message-ID: <2404993b-a96c-4a99-bfba-3f9e3031c90b@arm.com>
Date: Fri, 3 Oct 2025 15:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/panthor: rename and document lock_region
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250916210823.4033529-1-olvaffe@gmail.com>
 <20250916210823.4033529-3-olvaffe@gmail.com>
 <c521f2be-85b2-4f4e-9e5c-6105129b3fc6@arm.com>
 <CAPaKu7TT_Uph+ccNQ4q2+y9Pbmm-nLnPOgsLwEuZGnON26EStg@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAPaKu7TT_Uph+ccNQ4q2+y9Pbmm-nLnPOgsLwEuZGnON26EStg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 03/10/2025 01:46, Chia-I Wu wrote:
> On Thu, Oct 2, 2025 at 3:41 AM Steven Price <steven.price@arm.com> wrote:
>>
>> On 16/09/2025 22:08, Chia-I Wu wrote:
>>> Rename lock_region to mmu_hw_cmd_lock.
>>>
>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_mmu.c | 15 ++++++++++++---
>>>  1 file changed, 12 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> index d3af4f79012b4..8600d98842345 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
>>> @@ -545,8 +545,17 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
>>>       return status;
>>>  }
>>>
>>> -static void lock_region(struct panthor_device *ptdev, u32 as_nr,
>>> -                     u64 region_start, u64 size)
>>> +/**
>>> + * mmu_hw_cmd_lock() - Issue a LOCK command
>>> + * @ptdev: Device.
>>> + * @as_nr: AS to issue command to.
>>> + * @region_start: Start of the region.
>>> + * @size: Size of the region.
>>> + *
>>> + * Issue a LOCK command to invalidate MMU caches and block future transactions
>>> + * for a region.
>>
>> The LOCK command doesn't invalidate the caches - that's the UNLOCK
>> command. LOCK just blocks any memory accesses that target the region.
>>
>> [I guess the hardware implementation might flush TLBs to achieve the
>> block, but that's an implementation detail and shouldn't be relied upon].
> Hm, for LOCK, the doc I have says "MMU caches are invalidated." And
> for UNLOCK, there is actually no invalidation when the region is
> LOCK'ed.

Hmm, interesting. You are correct - I knew that it is possible to do an
UNLOCK without a LOCK and in that case it is the UNLOCK which performs
the invalidation. But looking back through the architecture
documentation it does actually state that the LOCK invalidates MMU
caches. So it appears I'm wrong - sorry about that.

>> I'm also not entirely clear what the benefit of this rename is? It's a
>> static function in a xxx_mmu.c file so it's fairly obvious this going to
>> MMU HW related. I also feel "_region" in the name makes it obvious that
>> there is a memory range that is affected by the lock.
> A big part of this file is for in-memory page tables. "mmu_hw_" prefix
> is used by some functions that write the regs. This (and following)
> renames prefix other such functions by "mmu_hw_" for consistency.

Well before this series there are a total of two functions currently
which have the mmu_hw_ prefix:
 * mmu_hw_do_operation_locked
 * mmu_hw_do_operation

Which I think needed something more than "do_operation", possibly
"do_mmu_operation" or "do_mmu_hw_operation" might have been better, but
I don't think there's a great difference. Generally we don't include a
prefix on static functions because they are local to the file.

> Then there are "mmu_hw_cmd_FOO" for each hw cmd FOO. That's why the
> "_region' part gets dropped.

It's interesting that the documentation says:

> LOCK (2)
> 
> Issues a lock region command to the MMU

So while I can't deny that the command is called "LOCK", informally we
do call it "lock region" more commonly because it describes the purpose
better.

Thanks,
Steve

>>
>> Thanks,
>> Steve
>>
>>> + */
>>> +static void mmu_hw_cmd_lock(struct panthor_device *ptdev, u32 as_nr, u64 region_start, u64 size)
>>>  {
>>>       u8 region_width;
>>>       u64 region;
>>> @@ -609,7 +618,7 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>>>        * power it up
>>>        */
>>>
>>> -     lock_region(ptdev, as_nr, iova, size);
>>> +     mmu_hw_cmd_lock(ptdev, as_nr, iova, size);
>>>
>>>       ret = mmu_hw_wait_ready(ptdev, as_nr);
>>>       if (ret)
>>

