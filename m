Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D94F09E72AE
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D7B10E2FD;
	Fri,  6 Dec 2024 15:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Vk6CZx7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CD510F119
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WzsVK7dbmvnOeiY0TjSDZNlfbvBM7TILoe17uI8cse0=; b=Vk6CZx7H8e0YtcupnXASf5G0mF
 d6GovrxYpasTctNboVLZ86vOgYkuUhOKejQWxyZ1x5UWOugUXUyhUnnDP+AooDTsgRX8Gs1f2hI18
 sv2x700liSjuIDqm+nIA7/ezO8moEueql/AgUeyZYaMSIDnDjSA9BBJF27/LqyVFHYcWuDhkPHpc0
 xawgQoD/uR3wB5wCWB4gwZAME4g6Q2OThRArd4HMYzXNI5iS3Qjvw0lEDLHiSho0cQlkIyy79aGo1
 AELKtCL/VB5eykUdBTrcae1ia8FBIlDu6Bd/ZzitiZ8dQjxWqVfn6C9Fu7cHeF7vba5i6F1Vev3Uv
 rnMMhE8Q==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tJZzg-00HSEK-9x; Fri, 06 Dec 2024 16:11:48 +0100
Message-ID: <e9d0a1cc-d2e6-476e-993d-1ccc68b9d237@igalia.com>
Date: Fri, 6 Dec 2024 12:11:43 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/vc4: Clean-up the BO seqnos
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241206131706.203324-1-mcanal@igalia.com>
 <4df589b6-93be-40eb-a918-ec26f93b923f@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <4df589b6-93be-40eb-a918-ec26f93b923f@amd.com>
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

On 06/12/24 11:17, Christian König wrote:
> Am 06.12.24 um 14:12 schrieb Maíra Canal:
>> This series introduces a series of clean-ups in BO reservations for the
>> VC4 driver. Currently, VC4 uses shared fences to track BO reservations as
>> several other DRM devices. But apart from the DMA reservation objects, 
>> VC4
>> also attaches seqnos to its BOs with the intention to track if the job 
>> that
>> uses such BO has finished.
>>
>> The seqno tracking system was introduced before the DMA reservation 
>> objects
>> and we ended up lefting it in the code after DMA resv was introduced. 
>> This
>> is redundant, as we can perfectly track the end of a job with a fence.
>> Therefore, this series focuses on eliminating the seqnos from the BO.
>>
>> This series introduces a series of clean-ups for BO reservations in 
>> the VC4
>> driver. Currently, VC4 uses shared fences to track BO reservations, 
>> similar
>> to many other DRM devices. However, in addition to DMA reservation 
>> objects,
>> VC4 has been maintaining a separate seqno tracking system for BOs to 
>> track
>> job completion.
>>
>> The seqno tracking system was implemented before DMA reservation objects
>> and was left in the code after DMA reservation's introduction. This
>> approach is now redundant, as job completion can be effectively tracked
>> using fences. Consequently, this series focuses on eliminating seqnos 
>> from
>> the BO implementation.
> 
> Just FYI, you duplicated the text somehow :)

Oops, that's a non-native English-speaker trying to write a v2 of a
paragraph :)

> 
>>
>> Patch Breakdown
>> ===============
>>
>> * Patch #1: Uses the DRM GEM implementation of 
>> `drm_gem_lock_reservations()`
>> and `drm_gem_unlock_reservations()` to replace the open-coded 
>> implementation
>> of this functions by VC4. A straightforward change with no functional
>> changes.
> 
> I actually pushed to remove drm_gem_lock_reservations() in favor of 
> using the drm_exec object.
> 
> It would be nice if you could use that one instead.

Okay, I'll use DRM exec in the next version. I'd appreciate if you could
take a look at the patches that remove the BOs seqnos.

Thanks for comments!

Best Regards,
- Maíra

> 
> Regards,
> Christian.
> 
>>
>> * Patch #2: Implements the VC4 wait BO IOCTL using DMA reservations. The
>> new implementation closely mirrors the V3D approach and removes the 
>> IOCTL's
>> dependency on BO sequence numbers.
>>
>> * Patch #3: The central piece of this patchset. It removes `bo->seqno`,
>> `bo->write_seqno`, and `exec->bin_dep_seqno` from the driver. As the 
>> seqno
>> tracking system is redundant, its deletion is relatively straightforward.
>> The only notable change is `vc4_async_set_fence_cb()`, which now uses
>> `dma_fence_add_callback()` to add the VC4 callback.
>>
>> * Patch #4: Deletes the now-unused function `vc4_queue_seqno_cb()`.
>>
>> Best Regards,
>> - Maíra
>>
>> Maíra Canal (4):
>>    drm/vc4: Use `drm_gem_lock_reservations()` instead of hard-coding
>>    drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
>>    drm/vc4: Remove BOs seqnos
>>    drm/vc4: Remove `vc4_queue_seqno_cb()`
>>
>>   drivers/gpu/drm/vc4/vc4_crtc.c     |  22 ++---
>>   drivers/gpu/drm/vc4/vc4_drv.h      |  26 ++---
>>   drivers/gpu/drm/vc4/vc4_gem.c      | 147 ++++++-----------------------
>>   drivers/gpu/drm/vc4/vc4_validate.c |  11 ---
>>   4 files changed, 48 insertions(+), 158 deletions(-)
>>
> 

