Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49BDA98112
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886D710E420;
	Wed, 23 Apr 2025 07:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LVC/6MEC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D3010E64B;
 Wed, 23 Apr 2025 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a0MdbxJn9tcqHZJ9SvBEI+x5AV7StRpHo6WCC1hnej4=; b=LVC/6MECYUZAD0g+buo9JPR1mV
 5+UCSylrVwr5+60klkD4vmG8oWIgA5iD5Q1r+uHXXcr+C/BG2LHbliLSiRM3meLLTIiNfFCZh1cQF
 VutiadzsMLn0lLOM8Vw/V1o+Ic3T/7myjvK1W7I21WSCAN0LLgRoEnoXZFsY2QQKgV0cTwrBGUo8t
 yStoq4kCxKLqLyHIPYH4sQ38hPBEjQPwjNEFs60mgP6rsAqLuHAKG4L6WOSrYcvIR93KLbWS4zOcB
 6U3brEQv5z9+tSfJw/XjlsJuDVgC5vgeEQgpwJhK8fHy16qALvSB0r7CeJNrpWkoiRJdKSGV/LLwX
 iDD54beA==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u7UcT-006nyr-Nq; Wed, 23 Apr 2025 09:34:09 +0200
Message-ID: <88f892f9-e99a-4813-830f-b3d30496ba3c@igalia.com>
Date: Wed, 23 Apr 2025 08:34:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/sched: Warn if pending list is not empty
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <aAEUwjzZ9w9xlKRY@cassiopeiae>
 <0e8313dc-b1bb-4ce7-b5b7-b8b3e027adb7@igalia.com>
 <0bfa746ca37de1813db22e518ffb259648d29e02.camel@mailbox.org>
 <5a5d4a33-2f7b-46e4-8707-7445ac3de376@igalia.com>
 <aAd54jUwBwgc-_g2@cassiopeiae>
 <d3c0f721-2d19-4a1c-a086-33e8d6bd7be6@igalia.com>
 <aAeMVtdkrAoMrmVk@cassiopeiae>
 <52574769-2120-41a1-b5dc-50a42da5dca6@igalia.com>
 <aAeiwZ2j2PhEwhVh@cassiopeiae>
 <f0ae2d411c21e799491244fe49880a4acca32918.camel@mailbox.org>
 <aAetRm3Sbp9vzamg@cassiopeiae>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <aAetRm3Sbp9vzamg@cassiopeiae>
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


On 22/04/2025 15:52, Danilo Krummrich wrote:
> On Tue, Apr 22, 2025 at 04:16:48PM +0200, Philipp Stanner wrote:
>> On Tue, 2025-04-22 at 16:08 +0200, Danilo Krummrich wrote:
>>> On Tue, Apr 22, 2025 at 02:39:21PM +0100, Tvrtko Ursulin wrote:
>>
>>>> Sorry I don't see the argument for the claim it is relying on the
>>>> internals
>>>> with the re-positioned drm_sched_fini call. In that case it is
>>>> fully
>>>> compliant with:
>>>>
>>>> /**
>>>>   * drm_sched_fini - Destroy a gpu scheduler
>>>>   *
>>>>   * @sched: scheduler instance
>>>>   *
>>>>   * Tears down and cleans up the scheduler.
>>>>   *
>>>>   * This stops submission of new jobs to the hardware through
>>>>   * drm_sched_backend_ops.run_job(). Consequently,
>>>> drm_sched_backend_ops.free_job()
>>>>   * will not be called for all jobs still in
>>>> drm_gpu_scheduler.pending_list.
>>>>   * There is no solution for this currently. Thus, it is up to the
>>>> driver to
>>>> make
>>>>   * sure that:
>>>>   *
>>>>   *  a) drm_sched_fini() is only called after for all submitted jobs
>>>>   *     drm_sched_backend_ops.free_job() has been called or that
>>>>   *  b) the jobs for which drm_sched_backend_ops.free_job() has not
>>>> been
>>>> called
>>>>   *
>>>>   * FIXME: Take care of the above problem and prevent this function
>>>> from
>>>> leaking
>>>>   * the jobs in drm_gpu_scheduler.pending_list under any
>>>> circumstances.
>>>>
>>>> ^^^ recommended solution b).
>>>
>>> This has been introduced recently with commit baf4afc58314
>>> ("drm/sched: Improve
>>> teardown documentation") and I do not agree with this. The scheduler
>>> should
>>> *not* make any promises about implementation details to enable
>>> drivers to abuse
>>> their knowledge about component internals.
>>>
>>> This makes the problem *worse* as it encourages drivers to rely on
>>> implementation details, making maintainability of the scheduler even
>>> worse.
>>>
>>> For instance, what if I change the scheduler implementation, such
>>> that for every
>>> entry in the pending_list the scheduler allocates another internal
>>> object for
>>> ${something}? Then drivers would already fall apart leaking those
>>> internal
>>> objects.
>>>
>>> Now, obviously that's pretty unlikely, but I assume you get the idea.
>>>
>>> The b) paragraph in drm_sched_fini() should be removed for the given
>>> reasons.
>>>
>>> AFAICS, since the introduction of this commit, driver implementations
>>> haven't
>>> changed in this regard, hence we should be good.
>>>
>>> So, for me this doesn't change the fact that every driver
>>> implementation that
>>> just stops the scheduler at an arbitrary point of time and tries to
>>> clean things
>>> up manually relying on knowledge about component internals is broken.
>>
>> To elaborate on that, this documentation has been written so that we at
>> least have *some* documentation about the problem, instead of just
>> letting new drivers run into the knife.
>>
>> The commit explicitly introduced the FIXME, marking those two hacky
>> workarounds as undesirable.
>>
>> But back then we couldn't fix the problem quickly, so it was either
>> document the issue at least a bit, or leave it completely undocumented.
> 
> Agreed, but b) really sounds like an invitation (or even justification) for
> doing the wrong thing, let's removed it.

IMO it is better to leave it. Regardless of whether it was added because 
some driver is actually operating like that, it does describe a 
_currently_ workable option to avoid memory leaks. Once a better method 
is there, ie. FIXME is addressed, then it can be removed or replaced.

Regards,

Tvrtko

