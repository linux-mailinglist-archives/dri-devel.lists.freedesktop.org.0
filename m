Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2564A08E85
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AD610F069;
	Fri, 10 Jan 2025 10:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DtXQpXDX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5600B10F068
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygJ4kWI2J3xVm5E9SmhcvFsPvSkTHg9NsrAlQ/ElFB4=; b=DtXQpXDXZ1RzejnRy95pyl/wuy
 LzwDgjXvgawYqbJ9tjfiuElJNRZBXWxrQsdBS8XvkpwAqhU8e01WFOZKBkzxWPnNJOQoUkl/rAnt1
 xSxNRF1gAK30oTGelwHU3a8DI8SZh9uRtXzjiYuOBJUXCEHjmIy5LejnI6XInlJiUbQSBeFg5leTt
 MRo0Aum8dyA7N+DMcRhNcFE3ttd7cAZyUIHvW8QswHjk3FuIOpmzfhBlZ7HT8nPZoz9fTkOUDSSRs
 TSQuj0aRuKz8J9VxPjGxMpMSPNe2PADNZeN5AYBaMplWdRCQrfHXbfbkrcopT7TiqHtadNxBgJ4ia
 W3NeI8aA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tWCcJ-00DvBl-BT; Fri, 10 Jan 2025 11:51:51 +0100
Message-ID: <6affb6c3-0335-46cf-9276-92222afac907@igalia.com>
Date: Fri, 10 Jan 2025 10:51:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/18] drm/amdgpu: Use DRM scheduler API in
 amdgpu_xcp_release_sched
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-2-tvrtko.ursulin@igalia.com>
 <48e3b200-39e5-4e54-ba05-de72c627d876@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <48e3b200-39e5-4e54-ba05-de72c627d876@amd.com>
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


On 09/01/2025 12:30, Christian König wrote:
> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>> Lets use the existing helper instead of peeking into the structure
>> directly.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
> 
> Grr, I can't count of how many of those I already fixed :(
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks!

+ Alex

I forgot to cc amd-gfx for this one. Can you take it from here or I can 
send it standalone?

Regards,

Tvrtko

> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
>> index e209b5e101df..23b6f7a4aa4a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
>> @@ -427,7 +427,7 @@ void amdgpu_xcp_release_sched(struct amdgpu_device 
>> *adev,
>>           return;
>>       sched = entity->entity.rq->sched;
>> -    if (sched->ready) {
>> +    if (drm_sched_wqueue_ready(sched)) {
>>           ring = to_amdgpu_ring(entity->entity.rq->sched);
>>           atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
>>       }
> 
