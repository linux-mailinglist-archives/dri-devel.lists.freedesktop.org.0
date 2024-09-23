Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209797E9E5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAD410E3D1;
	Mon, 23 Sep 2024 10:25:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="e2MWsnIg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BFE10E3D1;
 Mon, 23 Sep 2024 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ok86yRUgX5dTOfcHWAUmOJuUoiuMJWuhhaSOp4BDJQQ=; b=e2MWsnIgKmUvNvmJOlluAlfKWb
 d5FVKhQ/VYW1rIANBtB3myU7mwfnKr8A0SPzxcPHtYU498uVN/8isWcC5D3QSpGAhfa4mJBWVoi/2
 AQAJA+u/xP9AAVriflnMYaqO+HK3E1AUc0Z016p90kOByXYXGz431Uq5ooPXMl3UrrqlrAxZm6FrV
 2nFMOFpQju4Bs1HvgoYV/Ptmc4o4S2bu68dkYIW9fKRSSv2thJdU2rgvb5UzWYZuRBvHAdU1I71fL
 jmKNCk5/5/z0s+XPGKYeDcqqa7OwfNTeeV/tRbdJskGT7UzX5ya5DHSeU1ktTWFL9RUUo2LaPvr2b
 Yzv37yWA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ssgGJ-00HTqV-Um; Mon, 23 Sep 2024 12:25:47 +0200
Message-ID: <121a41fe-6637-41ca-a21e-7bd01dc0f0bf@igalia.com>
Date: Mon, 23 Sep 2024 11:25:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/amdgpu: delay the use of
 amdgpu_vm_set_task_info
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-4-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240920090920.1342694-4-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 20/09/2024 10:06, Pierre-Eric Pelloux-Prayer wrote:
> At this point the vm is locked so we safely modify it without risk of
> concurrent access.

To which particular lock this is referring to and does this imply 
previous placement was unsafe?

Regards,

Tvrtko

> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1e475eb01417..891128ecee6d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -309,9 +309,6 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   		p->gang_leader->uf_addr = uf_offset;
>   	kvfree(chunk_array);
>   
> -	/* Use this opportunity to fill in task info for the vm */
> -	amdgpu_vm_set_task_info(vm);
> -
>   	return 0;
>   
>   free_all_kdata:
> @@ -1180,6 +1177,9 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
>   	}
>   
> +	/* Use this opportunity to fill in task info for the vm */
> +	amdgpu_vm_set_task_info(vm);
> +
>   	if (adev->debug_vm) {
>   		/* Invalidate all BOs to test for userspace bugs */
>   		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
