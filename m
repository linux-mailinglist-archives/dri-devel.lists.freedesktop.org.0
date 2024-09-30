Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DB5989E15
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 11:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1603E10E3D6;
	Mon, 30 Sep 2024 09:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Hp0JZAmD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE5F10E3D6;
 Mon, 30 Sep 2024 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Q5w8gEsZA4ne/753oq1P+zP4DXCpP3lG8+l7lPuoLA=; b=Hp0JZAmDiQIINtbLW6y2yaRMdV
 nNeMYLUmqbZgP+gqE78mw3kfXvnJyYIUaKsmLP7VuozHYbajFHr8v2+cGfJuidqPmEMTWCPY2OjS4
 v/HAQkR1U3FZV0T2ewEZv0BbVyQXfkwKoMAKOP/n/EPRaOhVfgjyaTMGgASHulKyUJpSXRwzg2kgT
 H0O8bMLIwRJ7HRTpQF+KTERBl7dXBybgyxq8bY5OoEwRX+z97m31RLA2oARPDgDjsGpyMqB6LeRXo
 He5TYm/MlAR8aUGhTjnEcvdAmM2C+nUd5F9xofXP3/S5bjEP/KLFtMZsr12jva87faFJZsE4VPWMo
 0ngbPeZA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1svCeA-002mam-Oo; Mon, 30 Sep 2024 11:24:50 +0200
Message-ID: <ef541212-0799-4891-8632-baf86fa88df6@igalia.com>
Date: Mon, 30 Sep 2024 10:24:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dmitry.osipenko@collabora.com
References: <20240927084848.263718-1-pierre-eric.pelloux-prayer@amd.com>
 <20240927084848.263718-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240927084848.263718-7-pierre-eric.pelloux-prayer@amd.com>
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


On 27/09/2024 09:48, Pierre-Eric Pelloux-Prayer wrote:
> If a drm_file name is set append it to the process name.
> 
> This information is useful with the virtio/native-context driver: this
> allows the guest applications identifier to visible in amdgpu's output.
> 
> The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
>     pid:12255	Process:glxgears/test-set-fd-name ----------
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  1 +
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 26 +++++++++++++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +++
>   6 files changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index f9d119448442..ad909173e419 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -299,6 +299,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
>   				     struct amdgpu_vm *avm, u32 pasid);
>   int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   					struct amdgpu_vm *avm,
> +					struct drm_file *filp,
>   					void **process_info,
>   					struct dma_fence **ef);
>   void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 6d5fd371d5ce..172882af6705 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1558,6 +1558,7 @@ int amdgpu_amdkfd_gpuvm_set_vm_pasid(struct amdgpu_device *adev,
>   
>   int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   					   struct amdgpu_vm *avm,
> +					   struct drm_file *filp,
>   					   void **process_info,
>   					   struct dma_fence **ef)
>   {
> @@ -1577,7 +1578,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   	if (ret)
>   		return ret;
>   
> -	amdgpu_vm_set_task_info(avm);
> +	amdgpu_vm_set_task_info(avm, filp);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 891128ecee6d..5d43e24906d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1178,7 +1178,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   	}
>   
>   	/* Use this opportunity to fill in task info for the vm */
> -	amdgpu_vm_set_task_info(vm);
> +	amdgpu_vm_set_task_info(vm, p->filp);
>   
>   	if (adev->debug_vm) {
>   		/* Invalidate all BOs to test for userspace bugs */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index cec0a5cffcc8..f6e2be6d4e9e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2355,25 +2355,40 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>   			amdgpu_vm_get_vm_from_pasid(adev, pasid));
>   }
>   
> -static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
> +static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
>   {
>   	char process_name[TASK_COMM_LEN];
> -	int desc_len;
> +	size_t desc_len;

Nit - would be nicer to avoid the churn from patch to patch by starting 
with the correct type in the previous patch.

>   
>   	get_task_comm(process_name, current->group_leader);
>   	desc_len = strlen(process_name);
>   
> +	mutex_lock(&filp->client_name_lock);
> +	if (filp->client_name)
> +		desc_len += 1 + strlen(filp->client_name);
> +
>   	vm->task_info = kzalloc(
>   		struct_size(vm->task_info, process_desc, desc_len + 1),
>   		GFP_KERNEL);
>   
> -	if (!vm->task_info)
> +	if (!vm->task_info) {
> +		mutex_unlock(&filp->client_name_lock);
>   		return -ENOMEM;
> +	}
>   
>   	/* Set process attributes now. */
>   	vm->task_info->tgid = current->group_leader->pid;
>   	strscpy(vm->task_info->process_desc, process_name, desc_len + 1);
>   
> +	if (filp->client_name) {
> +		size_t p_len = strlen(process_name);

Another nit is that you are taking this strlen twice. Maybe cache it in 
a top level local so it looks cleaner.

But those are just nits to make the series look more polished. 
Fundamentals look fine to me so up to you if you want to respin or not.

Regards,

Tvrtko

> +
> +		vm->task_info->process_desc[p_len] = '/';
> +		strscpy(&vm->task_info->process_desc[p_len + 1],
> +			filp->client_name, (desc_len + 1) - (p_len + 1));
> +	}
> +	mutex_unlock(&filp->client_name_lock);
> +
>   	kref_init(&vm->task_info->refcount);
>   	return 0;
>   }
> @@ -2382,11 +2397,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    * amdgpu_vm_set_task_info - Sets VMs task info.
>    *
>    * @vm: vm for which to set the info
> + * @filp: drm_file instance
>    */
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
>   {
>   	if (!vm->task_info) {
> -		if (amdgpu_vm_create_task_info(vm))
> +		if (amdgpu_vm_create_task_info(vm, filp))
>   			return;
>   	} else if (vm->task_info->pid == current->pid) {
>   		return;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 44da250217be..8df3dece54c2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
>   			    bool write_fault);
>   
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *filp);
>   
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index a902950cc060..e473fe433d3f 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1654,6 +1654,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
>   			       struct file *drm_file)
>   {
>   	struct amdgpu_fpriv *drv_priv;
> +	struct drm_file *filp;
>   	struct amdgpu_vm *avm;
>   	struct kfd_process *p;
>   	struct dma_fence *ef;
> @@ -1673,8 +1674,10 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
>   
>   	p = pdd->process;
>   	dev = pdd->dev;
> +	filp = drm_file->private_data;
>   
>   	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(dev->adev, avm,
> +						     filp,
>   						     &p->kgd_process_info,
>   						     &ef);
>   	if (ret) {
