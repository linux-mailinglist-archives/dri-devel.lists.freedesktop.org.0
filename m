Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B195073A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 16:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F141110E364;
	Tue, 13 Aug 2024 14:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iEKaISBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B7310E364;
 Tue, 13 Aug 2024 14:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mPUoP3zBnuD+//2jB4+IyrnBJmrAfmAOVrJvxYI+SN0=; b=iEKaISBYjakJKv7tuJYQ50lXUV
 QzReT+g0eVOGyPtTA0aLy4VjRf+qrDpYjgLg5Dt2u+XLll66338+ehxOhkBxDKflJ4dMuelEFJokt
 C2YvfRqutqILuEvv5C8oTwTg57M4rdd27x89ASAt9zenRPw3Td/DU2lRfIBvbS54PXHTGaveGTKSt
 J90KMte2+l2rpCTWqnNNv/21QT6Hw3/5T9IK1qnHVsGtWzleAbPXF1ROwSgliEIsJnZcyeuy0aeZ0
 Es8NcYabKIuzJlE2KsjyBtHMMDc31F9azBrO5KH7I+z8SkYxiYqaAigMiUCcZVsDTzSJuqkC0jw0p
 QdTKD8cg==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sdsEK-00ByDj-5y; Tue, 13 Aug 2024 16:10:32 +0200
Message-ID: <586d1ac2-5563-40a6-9d99-b23d6bec17e9@igalia.com>
Date: Tue, 13 Aug 2024 15:10:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Remove hidden double memset from
 amdgpu_vm_pt_clear()
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20240813140835.82748-1-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240813140835.82748-1-tursulin@igalia.com>
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


On 13/08/2024 15:08, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> When CONFIG_INIT_STACK_ALL_ZERO is set and so -ftrivial-auto-var-init=zero
> compiler option active, compiler fails to notice that later in
> amdgpu_vm_pt_clear() there  is a second memset to clear the same on stack
> struct amdgpu_vm_update_params.
> 
> If we replace this memset with an explicit automatic variable initializer,
> compiler can then see it and avoid clearing this struct twice.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
> This is perhaps a bit questionable, regardless of how annoying it is to
> know there is this double memset.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index e39d6e7643bf..ecdc8fffe941 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -361,7 +361,7 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   {
>   	unsigned int level = adev->vm_manager.root_level;
>   	struct ttm_operation_ctx ctx = { true, false };
> -	struct amdgpu_vm_update_params params;
> +	struct amdgpu_vm_update_params params = { };
>   	struct amdgpu_bo *ancestor = &vmbo->bo;
>   	unsigned int entries;
>   	struct amdgpu_bo *bo = &vmbo->bo;
> @@ -398,7 +398,6 @@ int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (r)
>   		goto exit;
>   
> -	memset(&params, 0, sizeof(params));
>   	params.adev = adev;
>   	params.vm = vm;
>   	params.immediate = immediate;

Or even move all above three into the automatic initializer since all 
are the function input arguments.

Regards,

Tvrtko
