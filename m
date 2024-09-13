Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A45E977FCB
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A7910E17D;
	Fri, 13 Sep 2024 12:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="y1DUn8rl";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="7jY6F3xi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Fri, 13 Sep 2024 12:26:02 UTC
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC4910E17D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1726230270;
 bh=hWjNbOybeMONHoTMTPbskdP
 ZuGKD4zLb3cMHBkzPmK0=; b=y1DUn8rlNQRSoQ++4hduii1txB+YlIzYytYFTgoG3FmPWwo3n4
 qSmKYxksHjw2TYmp5NeNQ6Ph0U1kNNCkJZYaWXxMaO1OQV3WSzq4/FyjmFQDRJigP61OaFcC22T
 Dz4e/cLitJf+CA5xpEh/IBJlMHN7M4pS/xi3r7QWjEt37c7/5X6Bf7biL1lZ4D/by7y89XWPyEJ
 GRc+f0LScYDi6glnOfdiDPShGaFCNnbWYRImdCDTq+274r6xcWHpCaiO2OXXxO+OdRbN6prPD7Y
 nRdMDs5h2C5LaLcMuQncn1Cb9RgxMLz5kfgCFNafkMsboOjJKl3vhjW3tHSdrb8j05A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1726230270; bh=hWjNbOybeMONHoTMTPbskdP
 ZuGKD4zLb3cMHBkzPmK0=; b=7jY6F3xiW12sUJsi4om953b76E+fNJhARwWC/lQIcgkjh/N3x/
 6nLX8Xk4HIwF/br6amruBSx4YDdyvvcR+yDA==;
Message-ID: <c521846e-9d9c-4460-9b62-06cfab1fdab4@damsy.net>
Date: Fri, 13 Sep 2024 14:24:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: use drm_file name
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
 <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
 <8b6c8d4d-4e27-49ff-a954-e93235b06a28@igalia.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <8b6c8d4d-4e27-49ff-a954-e93235b06a28@igalia.com>
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

Hi,

Le 12/09/2024 à 10:24, Tvrtko Ursulin a écrit :
> 
> On 11/09/2024 15:58, Pierre-Eric Pelloux-Prayer wrote:
>> In debugfs gem_info/vm_info files, timeout handler and page fault reports.
>>
>> This information is useful with the virtio/native-context driver: this
>> allows the guest applications identifier to visible in amdgpu's output.
>>
>> The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
>>     pid:12255    Process:glxgears/test-set-fd-name ----------
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 11 ++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 20 +++++++++++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 ++--
>>   5 files changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> index 6d5fd371d5ce..1712feb2c238 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>> @@ -1577,7 +1577,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>>       if (ret)
>>           return ret;
>> -    amdgpu_vm_set_task_info(avm);
>> +    amdgpu_vm_set_task_info(avm, NULL);
>>       return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 1e475eb01417..d32dc547cc80 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -310,7 +310,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>>       kvfree(chunk_array);
>>       /* Use this opportunity to fill in task info for the vm */
>> -    amdgpu_vm_set_task_info(vm);
>> +    amdgpu_vm_set_task_info(vm, p->filp);
>>       return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index 0e617dff8765..0e0d49060ca8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -1012,8 +1012,15 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>>           rcu_read_lock();
>>           pid = rcu_dereference(file->pid);
>>           task = pid_task(pid, PIDTYPE_TGID);
>> -        seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
>> -               task ? task->comm : "<unknown>");
>> +        seq_printf(m, "pid %8d command %s", pid_nr(pid),
>> +                   task ? task->comm : "<unknown>");
>> +        if (file->name) {
>> +            mutex_lock(&file->name_lock);
> 
> As mentioned taking a mutex under rcu_read_lock is not allowed. It will need to either be 
> re-arranged or, also as mentioned, alternatively aligned to use the same RCU access rules.

I intended to fix this before sending the patch. It's now fixed locally (lock taken once, outside of 
the loop, like is done for dev->filelist_mutex).

> 
>> +            seq_putc(m, '/');
>> +            seq_puts(m, file->name);
>> +            mutex_unlock(&file->name_lock);
>> +        }
>> +        seq_puts(m, ":\n");
>>           rcu_read_unlock();
>>           spin_lock(&file->table_lock);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> index e20d19ae01b2..385211846ae3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
>> @@ -2370,7 +2370,7 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>>    *
>>    * @vm: vm for which to set the info
>>    */
>> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file)
>>   {
>>       if (!vm->task_info)
>>           return;
>> @@ -2385,7 +2385,23 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>>           return;
>>       vm->task_info->tgid = current->group_leader->pid;
>> -    get_task_comm(vm->task_info->process_name, current->group_leader);
>> +    __get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
>> +            current->group_leader);
>> +    /* Append drm_client_name if set. */
>> +    if (file && file->name) {
>> +        int n;
>> +
>> +        mutex_lock(&file->name_lock);
>> +        n = strlen(vm->task_info->process_name);
>> +        if (n < NAME_MAX) {
> 
> NAME_MAX because sizeof(vm->task_info->process_name) is NAME_MAX? (hint)

I've reworked this patch to make it clear the string formatting is correct.
Before sending it again for review, I'll wait for Christian/Alex's feedback.


> 
>> +            if (file->name) {
> 
> FWIW could check before strlen.
> 
>> +                vm->task_info->process_name[n] = '/';
> 
> Can this replace the null terminator at process_name[NAME_MAX - 1] with a '/'?
> 
>> +                strscpy_pad(&vm->task_info->process_name[n + 1],
>> +                        file->name, NAME_MAX - (n + 1));
>> +            }
>> +        }
>> +        mutex_unlock(&file->name_lock);
>> +    }
>>   }
>>   /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> index d12d66dca8e9..cabec384b4d4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>> @@ -232,7 +232,7 @@ struct amdgpu_vm_pte_funcs {
>>   };
>>   struct amdgpu_task_info {
>> -    char        process_name[TASK_COMM_LEN];
>> +    char        process_name[NAME_MAX];
> 
> Would not fit the longest process name plus the longest drm_file name by definition so I suggest 
> size it as TASK_COMM_LEN + 1 + NAME_MAX or so.

IMO the current version is ok as it only truncates userspace strings longer than 239 chars.


Thanks,
Pierre-Eric

> 
> Regards,
> 
> Tvrtko
> 
>>       char        task_name[TASK_COMM_LEN];
>>       pid_t        pid;
>>       pid_t        tgid;
>> @@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>>                   u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
>>                   bool write_fault);
>> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
>> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file);
>>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>>                   struct amdgpu_vm *vm);
