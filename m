Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD594C0D92
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 08:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92AE510EF22;
	Wed, 23 Feb 2022 07:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB68910EF22;
 Wed, 23 Feb 2022 07:47:50 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aee1b.dynamic.kabel-deutschland.de
 [95.90.238.27])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7009361EA1928;
 Wed, 23 Feb 2022 08:47:48 +0100 (CET)
Message-ID: <2998de6b-bff2-4ef5-135a-1269f948c486@molgen.mpg.de>
Date: Wed, 23 Feb 2022 08:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] drm/amdgpu: check vm ready by amdgpu_vm->evicting flag
Content-Language: en-US
To: Qiang Yu <qiang.yu@amd.com>
References: <20220222024651.36675-1-qiang.yu@amd.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220222024651.36675-1-qiang.yu@amd.com>
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
Cc: David Airlie <airlied@linux.ie>, Xinhui Pan <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Qiang,


Am 22.02.22 um 03:46 schrieb Qiang Yu:
> Workstation application ANSA/META v21.1.4 get this error dmesg when
> running CI test suite provided by ANSA/META:
> [drm:amdgpu_gem_va_ioctl [amdgpu]] *ERROR* Couldn't update BO_VA (-16)
> 
> This is caused by:
> 1. create a 256MB buffer in invisible VRAM
> 2. CPU map the buffer and access it causes vm_fault and try to move
>     it to visible VRAM
> 3. force visible VRAM space and traverse all VRAM bos to check if
>     evicting this bo is valuable
> 4. when checking a VM bo (in invisible VRAM), amdgpu_vm_evictable()
>     will set amdgpu_vm->evicting, but latter due to not in visible
>     VRAM, won't really evict it so not add it to amdgpu_vm->evicted
> 5. before next CS to clear the amdgpu_vm->evicting, user VM ops
>     ioctl will pass amdgpu_vm_ready() (check amdgpu_vm->evicted)
>     but fail in amdgpu_vm_bo_update_mapping() (check
>     amdgpu_vm->evicting) and get this error log
> 
> This error won't affect functionality as next CS will finish the
> waiting VM ops. But we'd better clear the error log by checking
> the amdgpu_vm->evicting flag in amdgpu_vm_ready() to stop calling
> amdgpu_vm_bo_update_mapping() latter.

later
> Another reason is amdgpu_vm->evicted list holds all BOs (both
> user buffer and page table), but only page table BOs' eviction
> prevent VM ops. amdgpu_vm->evicting flag is set only for page
> table BOs, so we should use evicting flag instead of evicted list
> in amdgpu_vm_ready().
> 
> The side effect of This change is: previously blocked VM op (user

this

> buffer in "evicted" list but no page table in it) gets done
> immediately.
> 
> v2: update commit comments.
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Qiang Yu <qiang.yu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 37acd8911168..2cd9f1a2e5fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -770,11 +770,16 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>    * Check if all VM PDs/PTs are ready for updates
>    *
>    * Returns:
> - * True if eviction list is empty.
> + * True if VM is not evicting.
>    */
>   bool amdgpu_vm_ready(struct amdgpu_vm *vm)
>   {
> -	return list_empty(&vm->evicted);
> +	bool ret;
> +
> +	amdgpu_vm_eviction_lock(vm);
> +	ret = !vm->evicting;
> +	amdgpu_vm_eviction_unlock(vm);
> +	return ret;
>   }
>   
>   /**

Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
