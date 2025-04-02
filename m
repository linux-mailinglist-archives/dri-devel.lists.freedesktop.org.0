Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B96FA78CD5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 13:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7498A10E0F5;
	Wed,  2 Apr 2025 11:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81C3810E0F5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 11:04:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3719C106F;
 Wed,  2 Apr 2025 04:04:03 -0700 (PDT)
Received: from [10.57.15.238] (unknown [10.57.15.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E5923F694;
 Wed,  2 Apr 2025 04:03:58 -0700 (PDT)
Message-ID: <a465d240-c84b-4d97-9d5c-0c5c6e477dbd@arm.com>
Date: Wed, 2 Apr 2025 12:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/panthor: Let IRQ handlers clear the interrupts
 themselves
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
 <20250401182348.252422-5-boris.brezillon@collabora.com>
 <2e565589-4845-4007-80be-adb6b370e911@arm.com>
 <20250402125820.49c5a450@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250402125820.49c5a450@collabora.com>
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

On 02/04/2025 11:58, Boris Brezillon wrote:
> On Wed, 2 Apr 2025 11:20:17 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>>> static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
>>> {
>>> 	bool has_unhandled_faults = false;
>>>
>>> 	status = panthor_mmu_fault_mask(ptdev, status);
>>> 	while (status) {
>>> 		u32 as = ffs(status | (status >> 16)) - 1;  
>>
>> panthor_mmu_fault_mask() masks status with GENMASK(15, 0), so AFAICT
>> (status >> 16) is always 0.
>>
>> Which isn't a big issue, other than you are now only clearing IRQs which
>> are recognised by the loop.
> 
> Quick note on that: I think it's been written when I was trying to add
> support for CSF in panfrost, and panthor_mmu_fault_mask() (at the time
> it was panfrost_mmu_fault_mask()) was a way to have a different
> fault_mask for JM and CSF. Now that JM support in panthor is being
> considered [1], I'd prefer to keep this logic, even if it seems silly
> right now.
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/merge_requests/16

Yeah no problem - it was mostly that when I looked at the code it
appears to be expecting 'status' to have bits set in the top half, but
we then only clear the bits in the lower half. It took a bit of digging
to satisfy myself that the IRQ mask always masks out the top bits.

With an updated commit message I think this is fine.

JM support in panthor is a whole other discussion ;)

Thanks,
Steve

