Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DACD3A13B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 09:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA4410E397;
	Mon, 19 Jan 2026 08:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C6A5510E39F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:18:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A09BD1517;
 Mon, 19 Jan 2026 00:18:10 -0800 (PST)
Received: from [10.57.14.23] (unknown [10.57.14.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DEF63F632;
 Mon, 19 Jan 2026 00:18:14 -0800 (PST)
Message-ID: <fc3fb243-48fb-4a5a-8802-01a7fe5ef032@arm.com>
Date: Mon, 19 Jan 2026 08:18:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Fix NULL pointer dereference on
 panthor_fw_unplug
To: Andy Yan <andyshrk@163.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Karunika Choo <karunika.choo@arm.com>, dri-devel@lists.freedesktop.org,
 nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, aishwarya.tcv@arm.com
References: <20251215203312.1084182-1-karunika.choo@arm.com>
 <aUFV6chRKx7aoQ5z@e142607>
 <4e8c1dcc.54f2.19bd4f4f1ae.Coremail.andyshrk@163.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <4e8c1dcc.54f2.19bd4f4f1ae.Coremail.andyshrk@163.com>
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

On 19/01/2026 06:33, Andy Yan wrote:
> 
> Hello,
> 
> At 2025-12-16 20:51:53, "Liviu Dudau" <liviu.dudau@arm.com> wrote:
>> On Mon, Dec 15, 2025 at 08:33:12PM +0000, Karunika Choo wrote:
>>> This patch removes the MCU halt and wait for halt procedures during
>>> panthor_fw_unplug() as the MCU can be in a variety of states or the FW
>>> may not even be loaded/initialized at all, the latter of which can lead
>>> to a NULL pointer dereference.
>>>
>>> It should be safe on unplug to just disable the MCU without waiting for
>>> it to halt as it may not be able to.
>>>
>>> Fixes: 514072549865 ("drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs")
>>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Signed-off-by: Karunika Choo <karunika.choo@arm.com>
>>
>> Reviewed-by: Liviu Dudau <liviu@dudau.co.uk>
> 
>   Tested-by: Andy Yan <andyshrk@163.com>
> 
> Hope can be merged in 6.19 release cycle.

Boris has already merged this:

commit 920c6af98e98e6afedf6318a75bac95af8415c6c
Author: Karunika Choo <karunika.choo@arm.com>
Date:   Mon Dec 15 20:33:12 2025 +0000

    drm/panthor: Fix NULL pointer dereference on panthor_fw_unplug

However it's in the drm-misc-next branch which means it won't be pulled
until the merge window. Ideally it would have gone in via
drm-misc-fixes, but given this (AFAIK) only triggers in the combination
of loading the panthor driver *and* not having the correct firmware I
didn't think it was worth worrying about - and so haven't asked the DRM
maintainers to cherry pick it. The fix should get backported into a
6.19.x stable release.

If I've missed something then let me (and the DRM maintainers) know and
the commit can be cherry-picked.

Thanks,
Steve

> 
>>
>> Best regards,
>> Liviu
>>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_fw.c | 4 ----
>>>  1 file changed, 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
>>> index 4beaa589ba66..a64ec8756bed 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
>>> @@ -1261,10 +1261,6 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
>>>  		if (ptdev->fw->irq.irq)
>>>  			panthor_job_irq_suspend(&ptdev->fw->irq);
>>>  
>>> -		panthor_fw_halt_mcu(ptdev);
>>> -		if (!panthor_fw_wait_mcu_halted(ptdev))
>>> -			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
>>> -
>>>  		panthor_fw_stop(ptdev);
>>>  	}
>>>  
>>> -- 
>>> 2.49.0
>>>

