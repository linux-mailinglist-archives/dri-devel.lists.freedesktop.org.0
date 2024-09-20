Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D48C97D539
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 14:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFEBD10E82D;
	Fri, 20 Sep 2024 12:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hwzovlsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC00910E82C;
 Fri, 20 Sep 2024 12:08:43 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-37a413085cbso610641f8f.1; 
 Fri, 20 Sep 2024 05:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726834122; x=1727438922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3Wt7KgVCQJmeR5T16ebNe2Gy/w1YxdyE1j+GK819n04=;
 b=Hwzovlsus6d+jpldmUbuzCmI1T/4alJP3+eKq7A+QeRsZsxhYh368mYigOFxpyRP2N
 mKSJuHEgcAVYU9ou1p68CtKISLxk4sQwrIzuTibupS7jN3trHNMdpENm5AUW941xAUKd
 Kdkh89dWXC2SLlGwrZyeEzz+UZLzXPXJDh1YiHvj+N4+GZJJZpafu/12jqKuQVT5DeiH
 p7SQZv/tx9Nn+T8l/nCxZuvRLjqZGlcVkmu6sQNqFPaq5Y8jjnA4KOhFjHRevzkWcPDz
 04mhLd3cVl4wa7P7Sh8TSIw7K92viz8F4JbUCez7/r/2glHMbgEW5mFFp5J7EOxl1oPT
 uqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726834122; x=1727438922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Wt7KgVCQJmeR5T16ebNe2Gy/w1YxdyE1j+GK819n04=;
 b=UcZ6/PpmrGYoGbn7H7fhw5clXTAcBLq+0ae699pOjGhKiPE66PseZz2lTLvFIDQWMS
 2KDFBnqiKPgJUGEAQBfC9VttyNsP5ni3Bpq4PQAYhVI7bXLjNZ+22etaAjHjXPQx8vjq
 E4qw4p+SRWX++wQRfLUyrykHma9l5pVFqSN6BlKYHK/j0BJZO+Op8ZcnH8EdR6R+8QT4
 Z2fum5SYteb2chfd+2WupJeyTgoYRf3eRVoQd914ieef6oj2bTN9yFDQjt63kmvIZPgZ
 9ld4KYBiSYMArkVJl5CnVKNjXFwYfH8mou40PxYKrYJsGZYIwsfFPinNhBKf5WhA9xRB
 y47g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEZLEpxtTzvwXftgeC30EkUUUUkLEV8AcRsIVQqY5AEF7XEnV7dqRUN9yCM9kDj1TEYE5/DRiDNyTz@lists.freedesktop.org,
 AJvYcCX9bjqc4l0a+lpXqddFo46/Qm+hXIcKEuIQ6S4kdb/wVJRwCofTJC64BRQSlzaI8RpW4il85pph@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwWpg5sij/wMg9Nzr9Hnd5LgqNBEp7NHNWR7C5VG4u42Xk4qm/
 rV1anL37DCFDubG7E02KQiD+kS7OUeOZ9HswirVBz8b7CQo5wfHB
X-Google-Smtp-Source: AGHT+IE8tIivZSgPHcCkwCDudj37fP9WMbvaJbQ4VKhBL7a7M8hVUuKp6xAt0OYhYlddwKL4d/gkDQ==
X-Received: by 2002:a5d:5f87:0:b0:374:c1ea:2d40 with SMTP id
 ffacd0b85a97d-3799a1c5440mr4744495f8f.1.1726834121963; 
 Fri, 20 Sep 2024 05:08:41 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e6bc42fb8sm73185135e9.0.2024.09.20.05.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Sep 2024 05:08:41 -0700 (PDT)
Message-ID: <ad16c28e-fd4e-4bd6-9e4d-da6c52f486cb@gmail.com>
Date: Fri, 20 Sep 2024 14:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/amdgpu: use drm_file::name in
 task_info::process_desc
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-7-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240920090920.1342694-7-pierre-eric.pelloux-prayer@amd.com>
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

Am 20.09.24 um 11:06 schrieb Pierre-Eric Pelloux-Prayer:
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
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 26 ++++++++++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  3 +++
>   6 files changed, 30 insertions(+), 7 deletions(-)
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
> index 7f852029d6e1..a2b12f0c3253 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2355,14 +2355,20 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>   			amdgpu_vm_get_vm_from_pasid(adev, pasid));
>   }
>   
> -static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
> +static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm, struct drm_file *filp)
>   {
>   	char process_name[TASK_COMM_LEN];
> -	int desc_len;
> +	size_t desc_len;
>   
>   	get_task_comm(process_name, current->group_leader);
>   	desc_len = strlen(process_name);
>   
> +	if (filp) {
> +		mutex_lock(&filp->name_lock);
> +		if (filp->name)
> +			desc_len += 1 + strlen(filp->name);
> +	}
> +
>   	vm->task_info = kzalloc(
>   		struct_size(vm->task_info, process_desc, desc_len + 1),
>   		GFP_KERNEL);
> @@ -2371,6 +2377,17 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>   		return -ENOMEM;
>   
>   	strscpy(vm->task_info->process_desc, process_name, desc_len + 1);
> +	if (filp) {

I think we can drop those checks now, filp is now a mandatory argument.

Apart from that the series looks good to me.

Regards,
Christian.

> +		if (filp->name) {
> +			size_t p_len = strlen(process_name);
> +
> +			vm->task_info->process_desc[p_len] = '/';
> +			strscpy(&vm->task_info->process_desc[p_len + 1],
> +				filp->name, (desc_len + 1) - (p_len + 1));
> +		}
> +		mutex_unlock(&filp->name_lock);
> +	}
> +
>   
>   	kref_init(&vm->task_info->refcount);
>   	return 0;
> @@ -2380,11 +2397,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
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
>   	}
>   
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

