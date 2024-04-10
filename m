Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618089FA37
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 16:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCCA10EBA5;
	Wed, 10 Apr 2024 14:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E7E210EC85
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 14:42:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32377139F;
 Wed, 10 Apr 2024 07:43:28 -0700 (PDT)
Received: from [10.57.74.122] (unknown [10.57.74.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9008A3F766;
 Wed, 10 Apr 2024 07:42:57 -0700 (PDT)
Message-ID: <df97ef4e-94c9-4d09-ba56-a09fa403bcda@arm.com>
Date: Wed, 10 Apr 2024 15:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] drm/panthor: Add the scheduler logical block
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: boris.brezillon@collabora.com, dri-devel@lists.freedesktop.org
References: <3b7fd2f2-679e-440c-81cd-42fc2573b515@moroto.mountain>
 <8d68acac-06d2-4d18-b257-2807209dadc5@arm.com>
 <17153286-76ed-476f-8106-76b9f46614e3@moroto.mountain>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <17153286-76ed-476f-8106-76b9f46614e3@moroto.mountain>
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

On 10/04/2024 15:34, Dan Carpenter wrote:
> On Wed, Apr 10, 2024 at 03:11:52PM +0100, Steven Price wrote:
>> On 08/04/2024 08:35, Dan Carpenter wrote:
>>> Hello Boris Brezillon,
>>>
>>> Commit de8548813824 ("drm/panthor: Add the scheduler logical block")
>>> from Feb 29, 2024 (linux-next), leads to the following Smatch static
>>> checker warning:
>>>
>>> 	drivers/gpu/drm/panthor/panthor_sched.c:1153 csg_slot_sync_state_locked()
>>> 	error: uninitialized symbol 'new_state'.
>>>
>>> drivers/gpu/drm/panthor/panthor_sched.c
>>>     1123 static void
>>>     1124 csg_slot_sync_state_locked(struct panthor_device *ptdev, u32 csg_id)
>>>     1125 {
>>>     1126         struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
>>>     1127         struct panthor_fw_csg_iface *csg_iface;
>>>     1128         struct panthor_group *group;
>>>     1129         enum panthor_group_state new_state, old_state;
>>>     1130 
>>>     1131         lockdep_assert_held(&ptdev->scheduler->lock);
>>>     1132 
>>>     1133         csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
>>>     1134         group = csg_slot->group;
>>>     1135 
>>>     1136         if (!group)
>>>     1137                 return;
>>>     1138 
>>>     1139         old_state = group->state;
>>>     1140         switch (csg_iface->output->ack & CSG_STATE_MASK) {
>>>                                                   ^^^^^^^^^^^^^^
>>> This mask is 0x7.  Should it be 0x3?  That would silence the static
>>> checker warning.
>>
>> The mask is correct - it's effectively a hardware register (well it's
>> read/written by the firmware on the hardware). States 4-7 are officially
>> "reserved" and Should Not Happen™!
>>
>> I guess a "default:" case with a WARN_ON() would be the right solution.
>>
>> Steve
> 
> A WARN_ON() won't silence the warning.  Plus WARN_ON() is not free in
> terms of memory usage.  And they're kind of controversial these days to
> be honest.

Sorry, I didn't mean just a WARN_ON() - there should also be an early
return from the function, ideally with the GPU being reset in the hope
that it starts behaving again.

And you're probably right WARN_ON is a bit too strong, we should
definitely output a warning message though to point out that the
hardware isn't behaving as expected.

> One solution would be to just ignore the static checker warning.  These
> are a one time thing, and if people have questions in the future, they
> can just search lore for this thread.

Well the static checker is not wrong - but the situation where this
could happen is if the hardware (or firmware running on the hardware)
breaks the contract of the specification. I'll put it on my todo list to
take a look at handling this more gracefully, but it's likely to take a
while before it bubbles to the top. But thanks for pointing out the issue.

Steve
