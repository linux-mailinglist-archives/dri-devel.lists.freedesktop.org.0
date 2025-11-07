Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD116C3F130
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 10:05:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8F110E1C3;
	Fri,  7 Nov 2025 09:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="vtQDhEWO";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="7R90nlcQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B89B10E1C3;
 Fri,  7 Nov 2025 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762506344;
 bh=tTI34LZ3z6i+FtVXKAd28Fi
 8WidGpxoyI6ggyYiU8IU=; b=vtQDhEWObGUg+2qDCPwifV8Rwpaki930n6br/SKWIumecBjOXr
 /wB+2hEM2fphA44YyBUg87PVn/F5L6aOUk3SJjJuee3BkLIlfS4l2QOrJ/QetIquIC/wOe30RIK
 VYnxvVIyVQQS5CUejbmPLJIUrCB/rYJ9GWSj3B/9w+C4RIlrSizrChhXccXI1RAlLU8Qnt1v0Mt
 MEt865qw/K6GyBlTLFWxQgCezqzS4wDyD4CR3Vki62Y1QWSMhM93HtbrvcUIdwBPqcGM7hL1kUG
 3C4GgjP7Buokug3QdsoTVzPBK2M4Lg7C04YWVKsRFVc4lusSC9Gw4KW2q3hFew77lDw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762506344; bh=tTI34LZ3z6i+FtVXKAd28Fi
 8WidGpxoyI6ggyYiU8IU=; b=7R90nlcQiNFoRgx9aXkOWMa0mCH7i9wTC0VSXvwYR//CFfdguc
 cFKTD4vrOZ8TQXnVZ+3QONOvJJPdIO1a7pCA==;
Message-ID: <4d93fd3b-84dd-45fb-b5e4-a8d8ab38112d@damsy.net>
Date: Fri, 7 Nov 2025 10:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] drm/amdgpu: jump to the correct label on failure
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
 <20251106093933.18859-2-pierre-eric.pelloux-prayer@amd.com>
 <63ce6781-439d-4425-a3e9-f1d233a5abea@ursulin.net>
 <a3830a0e-5491-4bb7-8685-3427f4874d95@amd.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <a3830a0e-5491-4bb7-8685-3427f4874d95@amd.com>
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



Le 06/11/2025 à 11:21, Christian König a écrit :
> On 11/6/25 10:56, Tvrtko Ursulin wrote:
>>
>> On 06/11/2025 09:39, Pierre-Eric Pelloux-Prayer wrote:
>>> drm_sched_entity_init wasn't called yet, so the only thing to
>>> do is to release allocated memory.
>>> This doesn't fix any bug since entity is zero allocated and
>>> drm_sched_entity_fini does nothing in this case.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> index f5d5c45ddc0d..afedea02188d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> @@ -236,7 +236,7 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>>>            r = amdgpu_xcp_select_scheds(adev, hw_ip, hw_prio, fpriv,
>>>                            &num_scheds, &scheds);
>>>            if (r)
>>> -            goto cleanup_entity;
>>> +            goto error_free_entity;
>>>        }
>>>          /* disable load balance if the hw engine retains context among dependent jobs */
>>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>
> 
> Since this is still a fix please push it to amd-staging-drm-next independent of the remaining patch set.

Ok, I removed this patch from v4 and will push it to amd-staging-drm-next.

Pierre-Eric
