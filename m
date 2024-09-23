Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B231E97EA47
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2BD10E19A;
	Mon, 23 Sep 2024 10:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XigLid0y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56ACB10E19A;
 Mon, 23 Sep 2024 10:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LMNeHLJ+Rks5s9FN2C0xJWvcpgF5ao1dduFanqczOzE=; b=XigLid0ye/qZfFwiabIdfysUIX
 WervZloEdB/yKDIjmYSSrrlj0uSaq+aKgmpYynQTD+Wj7wl4lq+zn+hCcblcSUGkcShcycxEDxLT7
 GASsKfxsZFG9WK2UQpK+03folvnldV2L7nStbUb0FlUhCkePfELYeEuNEq4eGCcXlzeJiR/nu5QhU
 3vSUM2EU8gsbCz1BOv+RLxmA/vDnKMMZf4Te6ddZPV/kxx3lRZgVhSBtaOp2nLKwJendIQQme2+of
 qIn4RFFpxAvGAN5hp+Uj0FRy+b3V6UstARpKrS/Oi9lhA1u9Um87TrBERYgtEEtZMWvB6UYJtWqag
 0BjScEPw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ssglk-00HUMW-PR; Mon, 23 Sep 2024 12:58:16 +0200
Message-ID: <fd9ed75f-a235-4675-8635-19c6ae92f619@igalia.com>
Date: Mon, 23 Sep 2024 11:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/amdgpu: alloc and init vm::task_info from
 first submit
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-5-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240920090920.1342694-5-pierre-eric.pelloux-prayer@amd.com>
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
> This will allow to use flexible array to store the process name and
> other information.
> 
> This also means that process name will be determined once and for all,
> instead of at each submit.

But the pid and others can still change? By design?

> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e20d19ae01b2..690676cab022 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2331,7 +2331,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
>   {
>   	struct amdgpu_task_info *ti = NULL;
>   
> -	if (vm) {
> +	if (vm && vm->task_info) {
>   		ti = vm->task_info;
>   		kref_get(&vm->task_info->refcount);
>   	}
> @@ -2372,8 +2372,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    */
>   void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   {
> -	if (!vm->task_info)
> -		return;
> +	if (!vm->task_info) {
> +		if (amdgpu_vm_create_task_info(vm))
> +			return;
> +
> +		get_task_comm(vm->task_info->process_name, current->group_leader);
> +	}
>   
>   	if (vm->task_info->pid == current->pid)

This ends up relying on vm->task_info->pid being zero due kzalloc right?

>   		return;
> @@ -2385,7 +2389,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   		return;
>   
>   	vm->task_info->tgid = current->group_leader->pid;
> -	get_task_comm(vm->task_info->process_name, current->group_leader);
>   }

I wonder how many of the task_info fields you want to set once instead 
of per submission. Like a fully one shot like the below be what you want?

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c 
b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index a060c28f0877..da492223a8b5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2349,16 +2349,6 @@ amdgpu_vm_get_task_info_pasid(struct 
amdgpu_device *adev, u32 pasid)
  			amdgpu_vm_get_vm_from_pasid(adev, pasid));
  }

-static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
-{
-	vm->task_info = kzalloc(sizeof(struct amdgpu_task_info), GFP_KERNEL);
-	if (!vm->task_info)
-		return -ENOMEM;
-
-	kref_init(&vm->task_info->refcount);
-	return 0;
-}
-
  /**
   * amdgpu_vm_set_task_info - Sets VMs task info.
   *
@@ -2366,20 +2356,28 @@ static int amdgpu_vm_create_task_info(struct 
amdgpu_vm *vm)
   */
  void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
  {
-	if (!vm->task_info)
-		return;
+	struct amdgpu_task_info *task_info = vm->task_info;
+
+	if (!task_info) {
+		task_info = kzalloc(sizeof(struct amdgpu_task_info),
+				    GFP_KERNEL);
+		if (!task_info)
+			return;

-	if (vm->task_info->pid == current->pid)
+		kref_init(&task_info->refcount);
+	} else {
  		return;
+	}

-	vm->task_info->pid = current->pid;
-	get_task_comm(vm->task_info->task_name, current);
+	task_info->pid = current->pid;
+	get_task_comm(task_info->task_name, current);

-	if (current->group_leader->mm != current->mm)
-		return;
+	if (current->group_leader->mm == current->mm) {
+		task_info->tgid = current->group_leader->pid;
+		get_task_comm(task_info->process_name, current->group_leader);
+	}

-	vm->task_info->tgid = current->group_leader->pid;
-	get_task_comm(vm->task_info->process_name, current->group_leader);
+	vm->task_info = task_info;
  }

  /**

End result is code like this:

void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
{
	struct amdgpu_task_info *task_info = vm->task_info;

	if (!task_info) {
		task_info = kzalloc(sizeof(struct amdgpu_task_info),
				    GFP_KERNEL);
		if (!task_info)
			return;

		kref_init(&task_info->refcount);
	} else {
		return;
	}

	task_info->pid = current->pid;
	get_task_comm(task_info->task_name, current);

	if (current->group_leader->mm == current->mm) {
		task_info->tgid = current->group_leader->pid;
		get_task_comm(task_info->process_name, current->group_leader);
	}

	vm->task_info = task_info;
}

?

>   
>   /**
> @@ -2482,7 +2485,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (r)
>   		goto error_free_root;
>   
> -	r = amdgpu_vm_create_task_info(vm);
>   	if (r)
>   		DRM_DEBUG("Failed to create task info for VM\n");

Two more lines to delete here.

Regards,

Tvrtko

>   
> @@ -2608,7 +2610,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   
>   	root = amdgpu_bo_ref(vm->root.bo);
>   	amdgpu_bo_reserve(root, true);
> -	amdgpu_vm_put_task_info(vm->task_info);
> +	if (vm->task_info)
> +		amdgpu_vm_put_task_info(vm->task_info);
>   	amdgpu_vm_set_pasid(adev, vm, 0);
>   	dma_fence_wait(vm->last_unlocked, false);
>   	dma_fence_put(vm->last_unlocked);
