Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 688D1983F00
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 09:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4F110E512;
	Tue, 24 Sep 2024 07:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="wju51L12";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="KNm2fH+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F90310E512;
 Tue, 24 Sep 2024 07:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1727162516;
 bh=vzIaG3hTqalerPz4ZwHieTQ
 CNNZ6cWVtsw49zXQb3ps=; b=wju51L12TgxnDQCF3MqeuW0XzaiuTO4LTFvAeYKe44QgUoCeUt
 OGzD5Ch6MELgybjQIWoBNzeUjkXy/GvbXzQucATBLt0dAHCCTuCQFMVh1ouZlePYIYNVAMRgWJP
 szVRqz6SwlXxL+iPce8CPP9xBHH1rmWEkg9TMdB4vikurgseMtHLoTMOVpo59L/RuRYusxCjVc2
 kuwplmFzOg3rP6hqmzFHfMpmDSe0a9Oxq0ctwMSKh+BP1Af3cEG9Ww8wty7gUQt1M8XX6XafZ/z
 XctNbF23I0ovXXIWAK3bbyyCceGs0x1wFsBmaq6RV6qJH2QyVO3Ai8vMFIGOUkgFl2g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1727162516; bh=vzIaG3hTqalerPz4ZwHieTQ
 CNNZ6cWVtsw49zXQb3ps=; b=KNm2fH+OuM146QaTv9QT6kkWRIixSqTqmQ/EXzHCkQqa2IshNK
 cb1S6n8nRFJe0QPFn3fn1qgZtUYe22XNjuCg==;
Message-ID: <bbb89613-a895-4c69-a1a6-dd27a5d5e4d0@damsy.net>
Date: Tue, 24 Sep 2024 09:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/amdgpu: alloc and init vm::task_info from
 first submit
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
 <20240920090920.1342694-5-pierre-eric.pelloux-prayer@amd.com>
 <fd9ed75f-a235-4675-8635-19c6ae92f619@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <fd9ed75f-a235-4675-8635-19c6ae92f619@igalia.com>
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



Le 23/09/2024 à 12:58, Tvrtko Ursulin a écrit :
> 
> On 20/09/2024 10:06, Pierre-Eric Pelloux-Prayer wrote:
>> This will allow to use flexible array to store the process name and
>> other information.
>>
>> This also means that process name will be determined once and for all,
>> instead of at each submit.
> 
> But the pid and others can still change? By design?

pid and task_name can change, yes.
tgid could be set once and for all I think.

> 
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 15 +++++++++------
>>   1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index e20d19ae01b2..690676cab022 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2331,7 +2331,7 @@ amdgpu_vm_get_task_info_vm(struct amdgpu_vm *vm)
>>   {
>>       struct amdgpu_task_info *ti = NULL;
>> -    if (vm) {
>> +    if (vm && vm->task_info) {
>>           ti = vm->task_info;
>>           kref_get(&vm->task_info->refcount);
>>       }
>> @@ -2372,8 +2372,12 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>>    */
>>   void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>   {
>> -    if (!vm->task_info)
>> -        return;
>> +    if (!vm->task_info) {
>> +        if (amdgpu_vm_create_task_info(vm))
>> +            return;
>> +
>> +        get_task_comm(vm->task_info->process_name, current->group_leader);
>> +    }
>>       if (vm->task_info->pid == current->pid)
> 
> This ends up relying on vm->task_info->pid being zero due kzalloc right?

Yes.

> 
>>           return;
>> @@ -2385,7 +2389,6 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>           return;
>>       vm->task_info->tgid = current->group_leader->pid;
>> -    get_task_comm(vm->task_info->process_name, current->group_leader);
>>   }
> 
> I wonder how many of the task_info fields you want to set once instead of per submission. Like a 
> fully one shot like the below be what you want?

As written above, process name, drm client name and pid (tgid) can be set once.
Task name + tid are updated on submit.
I've updated slightly this part, so v4 should hopefully be clearer.

> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index a060c28f0877..da492223a8b5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2349,16 +2349,6 @@ amdgpu_vm_get_task_info_pasid(struct amdgpu_device *adev, u32 pasid)
>               amdgpu_vm_get_vm_from_pasid(adev, pasid));
>   }
> 
> -static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
> -{
> -    vm->task_info = kzalloc(sizeof(struct amdgpu_task_info), GFP_KERNEL);
> -    if (!vm->task_info)
> -        return -ENOMEM;
> -
> -    kref_init(&vm->task_info->refcount);
> -    return 0;
> -}
> -
>   /**
>    * amdgpu_vm_set_task_info - Sets VMs task info.
>    *
> @@ -2366,20 +2356,28 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    */
>   void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   {
> -    if (!vm->task_info)
> -        return;
> +    struct amdgpu_task_info *task_info = vm->task_info;
> +
> +    if (!task_info) {
> +        task_info = kzalloc(sizeof(struct amdgpu_task_info),
> +                    GFP_KERNEL);
> +        if (!task_info)
> +            return;
> 
> -    if (vm->task_info->pid == current->pid)
> +        kref_init(&task_info->refcount);
> +    } else {
>           return;
> +    }
> 
> -    vm->task_info->pid = current->pid;
> -    get_task_comm(vm->task_info->task_name, current);
> +    task_info->pid = current->pid;
> +    get_task_comm(task_info->task_name, current);
> 
> -    if (current->group_leader->mm != current->mm)
> -        return;
> +    if (current->group_leader->mm == current->mm) {
> +        task_info->tgid = current->group_leader->pid;
> +        get_task_comm(task_info->process_name, current->group_leader);
> +    }
> 
> -    vm->task_info->tgid = current->group_leader->pid;
> -    get_task_comm(vm->task_info->process_name, current->group_leader);
> +    vm->task_info = task_info;
>   }
> 
>   /**
> 
> End result is code like this:
> 
> void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
> {
>      struct amdgpu_task_info *task_info = vm->task_info;
> 
>      if (!task_info) {
>          task_info = kzalloc(sizeof(struct amdgpu_task_info),
>                      GFP_KERNEL);
>          if (!task_info)
>              return;
> 
>          kref_init(&task_info->refcount);
>      } else {
>          return;
>      }
> 
>      task_info->pid = current->pid;
>      get_task_comm(task_info->task_name, current);
> 
>      if (current->group_leader->mm == current->mm) {
>          task_info->tgid = current->group_leader->pid;
>          get_task_comm(task_info->process_name, current->group_leader);
>      }
> 
>      vm->task_info = task_info;
> }
> 
> ?
> 
>>   /**
>> @@ -2482,7 +2485,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>>       if (r)
>>           goto error_free_root;
>> -    r = amdgpu_vm_create_task_info(vm);
>>       if (r)
>>           DRM_DEBUG("Failed to create task info for VM\n");
> 
> Two more lines to delete here.

Done, thanks.

Pierre-Eric

> 
> Regards,
> 
> Tvrtko
> 
>> @@ -2608,7 +2610,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>>       root = amdgpu_bo_ref(vm->root.bo);
>>       amdgpu_bo_reserve(root, true);
>> -    amdgpu_vm_put_task_info(vm->task_info);
>> +    if (vm->task_info)
>> +        amdgpu_vm_put_task_info(vm->task_info);
>>       amdgpu_vm_set_pasid(adev, vm, 0);
>>       dma_fence_wait(vm->last_unlocked, false);
>>       dma_fence_put(vm->last_unlocked);
