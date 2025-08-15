Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB1DB27DBD
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 12:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C7110E90C;
	Fri, 15 Aug 2025 10:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA9F510E90C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Aug 2025 10:02:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48231168F;
 Fri, 15 Aug 2025 03:02:21 -0700 (PDT)
Received: from [10.1.29.14] (e122027.cambridge.arm.com [10.1.29.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70ABA3F738;
 Fri, 15 Aug 2025 03:02:27 -0700 (PDT)
Message-ID: <020f8735-06d0-4df3-b0bb-224692e06527@arm.com>
Date: Fri, 15 Aug 2025 11:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/7] drm/panthor: Make MMU cache maintenance use
 FLUSH_CACHES command
To: Liviu Dudau <liviu.dudau@arm.com>, Daniel Stone <daniel@fooishbar.org>
Cc: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org,
 nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chia-I Wu <olvaffe@gmail.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
 <20250807162633.3666310-7-karunika.choo@arm.com>
 <CAPj87rP9pETnxr_mVJ4OAwj_Vhh2yS75iQ5LDT7ddC5=a-kXkA@mail.gmail.com>
 <aJ5qGWlbxihLTHkB@e110455-lin.cambridge.arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <aJ5qGWlbxihLTHkB@e110455-lin.cambridge.arm.com>
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

On 14/08/2025 23:58, Liviu Dudau wrote:
> On Fri, Aug 08, 2025 at 11:50:27AM +0100, Daniel Stone wrote:
>> Hi Karunika,
>>
>>
>> On Thu, 7 Aug 2025 at 17:27, Karunika Choo <karunika.choo@arm.com> wrote:
>>> @@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
>>>         if (op != AS_COMMAND_UNLOCK)
>>>                 lock_region(ptdev, as_nr, iova, size);
>>>
>>> +       if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
>>> +               return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
>>
>> Given that FLUSH_MEM and FLUSH_PT are the only ops which are ever
>> used, the below becomes dead code. Could you please just inline these,
>> so it's more clear what's actually going on? The (op !=
>> AS_COMMAND_UNLOCK) branch can also become unconditional, perhaps with
>> a WARN_ON() around unknown ops.
> 
> Hmm, the commit message says that FLUSH_MEM and FLUSH_PT are going to be
> deprecated and replaced with FLUSH_CACHES so the first are clearly not the
> only ones ever used (at least not in the future). I'm not sure why you
> think this code is not correct.

The code is "correct" (it does the right thing), but Daniel is also
correct that as things stand the code below that "return" is all dead.
The only code paths call with op either AS_COMMAND_FLUSH_MEM or
AS_COMMAND_FLUSH_PT.

But I think this patch set has been through enough revisions already,
and we've now got the firmware upstream[1]. So rather than do another
wrong, I'm going to merge this to drm-misc-next and I'll post a separate
patch cleaning up the dead code.

Thanks,
Steve

[1]
https://gitlab.com/kernel-firmware/linux-firmware/-/commit/930ef9046e3848df688d98b7d5e68154b031dc66

> Best regards,
> Liviu
> 
>>
>> Cheers,
>> Daniel
> 

