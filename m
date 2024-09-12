Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EB976464
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 10:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAAA10E8DB;
	Thu, 12 Sep 2024 08:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dTQaUltQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C379D10E8DB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 08:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=smn6EbNtZIXcJVpd7FXC/Iia65TIT1bx5W1DPQ5lPks=; b=dTQaUltQV5oOt8WC2mEa7gyikB
 oCBxB2P5+i6Meeb40Xt58VEXV1uO6z+5nyE7GiElIFtMDPyiZRbMFiiQwgcLbYe5IGiH+HbdipXXU
 Ok9rNhNdReydODioD1GWswpl4KfY2E83HyZRgEJb6kmjkcCfew++w084pZ3YjrB8FEt3Bj3NgqNMa
 a3gs+7yD6vyvLLXx7JGOmCcnFb797QkHJQxjJKjiinF21WrbQesJn/sYpJiy4e3QoYmiPXkwjyriW
 lTeGS7FckE/hjuwu4KunTQ7kgOfi+zwZHs60rpkC5IO+8p6BgdfOpQSFINIX+s5aLRfdEUjEAwt/E
 aI9GH69A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sof8J-00Cmmu-7X; Thu, 12 Sep 2024 10:24:55 +0200
Message-ID: <8b6c8d4d-4e27-49ff-a954-e93235b06a28@igalia.com>
Date: Thu, 12 Sep 2024 09:24:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amdgpu: use drm_file name
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240911145836.734080-1-pierre-eric.pelloux-prayer@amd.com>
 <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240911145836.734080-3-pierre-eric.pelloux-prayer@amd.com>
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


On 11/09/2024 15:58, Pierre-Eric Pelloux-Prayer wrote:
> In debugfs gem_info/vm_info files, timeout handler and page fault reports.
> 
> This information is useful with the virtio/native-context driver: this
> allows the guest applications identifier to visible in amdgpu's output.
> 
> The output in amdgpu_vm_info/amdgpu_gem_info looks like this:
>     pid:12255	Process:glxgears/test-set-fd-name ----------
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 11 ++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 20 +++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 ++--
>   5 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 6d5fd371d5ce..1712feb2c238 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -1577,7 +1577,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
>   	if (ret)
>   		return ret;
>   
> -	amdgpu_vm_set_task_info(avm);
> +	amdgpu_vm_set_task_info(avm, NULL);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 1e475eb01417..d32dc547cc80 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -310,7 +310,7 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
>   	kvfree(chunk_array);
>   
>   	/* Use this opportunity to fill in task info for the vm */
> -	amdgpu_vm_set_task_info(vm);
> +	amdgpu_vm_set_task_info(vm, p->filp);
>   
>   	return 0;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 0e617dff8765..0e0d49060ca8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -1012,8 +1012,15 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		rcu_read_lock();
>   		pid = rcu_dereference(file->pid);
>   		task = pid_task(pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
> -			   task ? task->comm : "<unknown>");
> +		seq_printf(m, "pid %8d command %s", pid_nr(pid),
> +				   task ? task->comm : "<unknown>");
> +		if (file->name) {
> +			mutex_lock(&file->name_lock);

As mentioned taking a mutex under rcu_read_lock is not allowed. It will 
need to either be re-arranged or, also as mentioned, alternatively 
aligned to use the same RCU access rules.

> +			seq_putc(m, '/');
> +			seq_puts(m, file->name);
> +			mutex_unlock(&file->name_lock);
> +		}
> +		seq_puts(m, ":\n");
>   		rcu_read_unlock();
>   
>   		spin_lock(&file->table_lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e20d19ae01b2..385211846ae3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2370,7 +2370,7 @@ static int amdgpu_vm_create_task_info(struct amdgpu_vm *vm)
>    *
>    * @vm: vm for which to set the info
>    */
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file)
>   {
>   	if (!vm->task_info)
>   		return;
> @@ -2385,7 +2385,23 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   		return;
>   
>   	vm->task_info->tgid = current->group_leader->pid;
> -	get_task_comm(vm->task_info->process_name, current->group_leader);
> +	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
> +			current->group_leader);
> +	/* Append drm_client_name if set. */
> +	if (file && file->name) {
> +		int n;
> +
> +		mutex_lock(&file->name_lock);
> +		n = strlen(vm->task_info->process_name);
> +		if (n < NAME_MAX) {

NAME_MAX because sizeof(vm->task_info->process_name) is NAME_MAX? (hint)

> +			if (file->name) {

FWIW could check before strlen.

> +				vm->task_info->process_name[n] = '/';

Can this replace the null terminator at process_name[NAME_MAX - 1] with 
a '/'?

> +				strscpy_pad(&vm->task_info->process_name[n + 1],
> +					    file->name, NAME_MAX - (n + 1));
> +			}
> +		}
> +		mutex_unlock(&file->name_lock);
> +	}
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index d12d66dca8e9..cabec384b4d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -232,7 +232,7 @@ struct amdgpu_vm_pte_funcs {
>   };
>   
>   struct amdgpu_task_info {
> -	char		process_name[TASK_COMM_LEN];
> +	char		process_name[NAME_MAX];

Would not fit the longest process name plus the longest drm_file name by 
definition so I suggest size it as TASK_COMM_LEN + 1 + NAME_MAX or so.

Regards,

Tvrtko

>   	char		task_name[TASK_COMM_LEN];
>   	pid_t		pid;
>   	pid_t		tgid;
> @@ -561,7 +561,7 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *adev, u32 pasid,
>   			    u32 vmid, u32 node_id, uint64_t addr, uint64_t ts,
>   			    bool write_fault);
>   
> -void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
> +void amdgpu_vm_set_task_info(struct amdgpu_vm *vm, struct drm_file *file);
>   
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm);
