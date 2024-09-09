Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A726971342
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 11:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42C10E355;
	Mon,  9 Sep 2024 09:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RphJp/I7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994DA10E351;
 Mon,  9 Sep 2024 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/1h8BWkktXtDv4aCLL9t99+OTSOBbd0Kpw9GYJSdS/w=; b=RphJp/I70BS1S8olzWXAhmb7gU
 tQ8dUxctlF8w6UmWZaNUn3io6AbTbN6hACa7ib0MTgNs5O4HOTQccIiQQNQHhENhfH7oPpHiWIILO
 qC5Yj+zSt83+9QOMz73LRmSDOLHVIgEZlh1hFAJzW51GyjyN1F6kHJnjv4knmbCDIffLl4ZYAe8bv
 YNrX7wlCJXmCuj4zRvi4+aGKKrjlb8VRMJJqjXp++8Rh1QZPmCaO1Uyh5jS22gclUH+VKuGChCx7K
 CAAD99pB+rUbKrmuW21/36yQwwPz4Jx3qMvVFi6Z0SsEc2TUa6M1iEOKzWvHURurJ17hde/Mr2lnZ
 4ttmWuhg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1snaZg-00BQyk-Aj; Mon, 09 Sep 2024 11:20:44 +0200
Message-ID: <80d8a180-75f8-4244-b25a-97ee38bf49d6@igalia.com>
Date: Mon, 9 Sep 2024 10:20:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] DRM scheduler fixes, or not, or incorrect kind
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Luben Tuikov
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240906180618.12180-1-tursulin@igalia.com>
 <3d9450d3a7334da47b0d3dd7b902be7dd9051a2d.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3d9450d3a7334da47b0d3dd7b902be7dd9051a2d.camel@redhat.com>
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


On 09/09/2024 09:47, Philipp Stanner wrote:
> Hi,
> 
> On Fri, 2024-09-06 at 19:06 +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> In a recent conversation with Christian there was a thought that
>> drm_sched_entity_modify_sched() should start using the entity-
>>> rq_lock to be
>> safe against job submission and simultaneous priority changes.
> 
> There are also FIXMEs in gpu_scheduler.h that might be related.

Yes there appears to be a good number of dodgy/unclear areas there.

>> The kerneldoc accompanying that function however is a bit unclear to
>> me. For
>> instance is amdgpu simply doing it wrongly by not serializing the two
>> in the
>> driver? Or is the comment referring to some other race condition than
>> which is
>> of concern in this series?
>>
>> To cut the long story short, first three patches try to fix this race
>> in three
>> places I *think* can manifest in different ways.
>>
>> Last patch is a trivial optimisation I spotted can be easily done.
> 
> I took a look and at least to me it doesn't appear to be that trivial,
> mostly because it takes two locks.

The code does take two locks, but the patch itself does not change any 
of that. It just splits the locked helper out so re-locking is avoided.

> Would you mind branching that out as a separate patch so that the
> series would 100% address bugs?

I wanted to start the series with fixes so backporting will work. If I 
put the optimisation first then fixes will not trivially apply to older 
kernels. Assuming they are correct of course.

Regards,

Tvrtko

> 
> P.	
> 
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>>
>> Tvrtko Ursulin (4):
>>    drm/sched: Add locking to drm_sched_entity_modify_sched
>>    drm/sched: Always wake up correct scheduler in
>>      drm_sched_entity_push_job
>>    drm/sched: Always increment correct scheduler score
>>    drm/sched: Optimise drm_sched_entity_push_job
>>
>>   drivers/gpu/drm/scheduler/sched_entity.c | 17 ++++++++++++-----
>>   drivers/gpu/drm/scheduler/sched_main.c   | 21 ++++++++++++++-------
>>   include/drm/gpu_scheduler.h              |  1 +
>>   3 files changed, 27 insertions(+), 12 deletions(-)
>>
> 
