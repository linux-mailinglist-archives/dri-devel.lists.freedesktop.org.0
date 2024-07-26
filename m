Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3393D009
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 11:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6EC10E36C;
	Fri, 26 Jul 2024 09:02:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PZcxIis2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B1210E36C;
 Fri, 26 Jul 2024 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b4wl9SBhUlZbjx5376T8HpczeCt/6BQTHpTpTKIFQfU=; b=PZcxIis2QJVcEzhP6QQu7jZrA+
 tUO0ffpImHKsXywu3IvYbdbbU4ANrYgvvHNQOjiPILS37EILle3WyWiXcazvsCmVqLBw51TRRwXTh
 mrtCxSSok5HsvjworRpTCr+yZjPyE4m+4bMGEwcIJKpevJCcnXWXdcfDXmCPqsf5dwAc7WgS57kn7
 wC/iKeG6t5FKNt1CFJ1j4yy8V9CMncuDzoAeLVI6KD1/XHlCU+J4UM3H6uYrqIOeYymgTX7qCjNBQ
 VWUzCtYoShMfax7/Env7E0NgJvVPXOeW3IhLcJ8ktC6xYj6Ov2njqYpPyGvd8JCXAtlP9ZdggfxF8
 PcWToH9g==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sXGpv-002FsT-31; Fri, 26 Jul 2024 11:02:03 +0200
Message-ID: <d4eb469f-7fdb-4906-aec8-0e36529b10b0@igalia.com>
Date: Fri, 26 Jul 2024 10:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: Fix drm_sched_entity_set_priority()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20240719094730.55301-1-tursulin@igalia.com>
 <61bd1b84-a7f3-46fd-8511-27e306806c8d@gmail.com>
 <bd1f203f-d8c4-4c93-8074-79c3df4fe159@gmail.com>
 <8f977694-eb15-4b64-97f7-f2b8921de5cf@igalia.com>
 <eb8a2ce7-223f-4518-8d72-fac875a51f98@amd.com>
 <9867a2b2-6729-424f-abc9-e1d1b81bab41@igalia.com>
 <6b254b3d-a6d9-4b12-9a5e-dacb32d41ee9@amd.com>
 <ecc032cd-d595-4f4d-a96a-bee51f290547@igalia.com>
 <fb7b7ce4-294e-463b-93b7-565099e1c2d8@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <fb7b7ce4-294e-463b-93b7-565099e1c2d8@gmail.com>
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



On 24/07/2024 12:16, Christian König wrote:
> Am 24.07.24 um 10:16 schrieb Tvrtko Ursulin:
>> [SNIP]
>>> Absolutely.
>>
>> Absolutely good and absolutely me, or absolutely you? :)
> 
> You, I don't even have time to finish all the stuff I already started :/

Okay, I think I can squeeze it in.

>> These are the TODO points and their opens:
>>
>> - Adjust amdgpu_ctx_set_entity_priority() to call 
>> drm_sched_entity_modify_sched() regardless of the hw_type - to fix 
>> priority changes on a single sched other than gfx or compute.
> 
> Either that or to stop using the scheduler priority to implement 
> userspace priorities and always use different HW queues for that.
> 
>>
>> - Document sched_list array lifetime must align with the entity and 
>> adjust the callers.
>>
>> Open:
>>
>> Do you still oppose keeping sched_list for num_scheds == 1?
> 
> Not if you can fix up all callers.
> 
>> If so do you propose drm_sched_entity_modify_sched() keeps disagreeing 
>> with drm_sched_entity_init() on this detail? And keep the "one shot 
>> single sched_list" quirk in? Why is that nicer than simply keeping the 
>> list and remove that quirk? Once lifetime rules are clear it IMO is 
>> okay to always keep the list.
> 
> Yeah if every caller of drm_sched_entity_init() can be fixed I'm fine 
> with that as well.

Okay so I will tackle the above few first.

>>
>> - Remove drm_sched_entity_set_priority().
>>
>> Open:
>>
>> Should we at this point also modify amdgpu_device_init_schedulers() to 
>> stop initialising schedulers with DRM_SCHED_PRIORITY_COUNT run queues?
> 
> One step at a time.

And leave this for later.

Regards,

Tvrtko
