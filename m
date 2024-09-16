Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D797A49A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 16:57:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04E810E3AA;
	Mon, 16 Sep 2024 14:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="A7elHUuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D96B10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f76TsQoMHfyUucYAtySGcAUTYRyMLyIgaiiZyxLzQ1o=; b=A7elHUucXXunhx61p0b5IM8Hjk
 RfbEud51fI7pyMnuv3JAglWmRTkon29sfOc60MAufM1fWvbdtDjK2uRfQFnF6lzXKIRinix1NJjV9
 4Qpuolr1q/veIGa6vgtuWMOAS2ShXWEbnrp/nRy5iCr8wVfqVVsIgvkUAJeO8wY/dLMu+UsUbjFUM
 AuMEdvSXDJTkNfXNf/BU57g0I9tY627QgbOkTojzoznD52P6PNuh/B3jT6L0JBbBy+2pwjgxTzPpa
 Uj21ga9rj9Q3fjs97+jakqMNB8/BVIYQRF5st1RTJT2Tm5wq0SIHxc5TUP6L/lpaKNvxT/7qx+xAq
 lGGla2+A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sqDAA-00EUJ4-Oa; Mon, 16 Sep 2024 16:57:14 +0200
Message-ID: <67d008d7-0830-467d-bfb0-071d63d7283e@igalia.com>
Date: Mon, 16 Sep 2024 15:57:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/amdgpu: use drm_file name
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 tursulin@igalia.com, simona.vetter@ffwll.ch, robdclark@gmail.com
References: <20240916133223.1023773-1-pierre-eric.pelloux-prayer@amd.com>
 <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20240916133223.1023773-3-pierre-eric.pelloux-prayer@amd.com>
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


On 16/09/2024 14:32, Pierre-Eric Pelloux-Prayer wrote:
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
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 16 +++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 25 +++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  4 +--
>   5 files changed, 40 insertions(+), 9 deletions(-)
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
> index 0e617dff8765..0c52168edbaf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -997,6 +997,10 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   	if (r)
>   		return r;
>   
> +	r = mutex_lock_interruptible(&file->name_lock);
> +	if (r)
> +		goto out;

Shouldn't this be in the below loop?

> +
>   	list_for_each_entry(file, &dev->filelist, lhead) {
>   		struct task_struct *task;
>   		struct drm_gem_object *gobj;
> @@ -1012,8 +1016,13 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		rcu_read_lock();
>   		pid = rcu_dereference(file->pid);
>   		task = pid_task(pid, PIDTYPE_TGID);
> -		seq_printf(m, "pid %8d command %s:\n", pid_nr(pid),
> -			   task ? task->comm : "<unknown>");
> +		seq_printf(m, "pid %8d command %s", pid_nr(pid),
> +				   task ? task->comm : "<unknown>");
> +		if (file->name) {
> +			seq_putc(m, '/');
> +			seq_puts(m, file->name);
> +		}
> +		seq_puts(m, ":\n");
>   		rcu_read_unlock();
>   
>   		spin_lock(&file->table_lock);
> @@ -1024,7 +1033,8 @@ static int amdgpu_debugfs_gem_info_show(struct seq_file *m, void *unused)
>   		}
>   		spin_unlock(&file->table_lock);
>   	}
> -
> +	mutex_unlock(&file->name_lock);
> +out:
>   	mutex_unlock(&dev->filelist_mutex);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index e20d19ae01b2..5701d74159d4 100644
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
> @@ -2385,7 +2385,28 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm)
>   		return;
>   
>   	vm->task_info->tgid = current->group_leader->pid;
> -	get_task_comm(vm->task_info->process_name, current->group_leader);
> +	__get_task_comm(vm->task_info->process_name, TASK_COMM_LEN,
> +			current->group_leader);
> +	/* Append drm_client_name if set. */
> +	if (file && file->name) {
> +		mutex_lock(&file->name_lock);
> +
> +		/* Assert that process_name is big enough to store process_name,
> +		 * so: (TASK_COMM_LEN - 1) + '/' + '\0'.
> +		 * This way we can concat file->name without worrying about space.
> +		 */
> +		static_assert(sizeof(vm->task_info->process_name) >= TASK_COMM_LEN + 1);
> +		if (file->name) {
> +			int n;
> +
> +			n = strlen(vm->task_info->process_name);
> +			vm->task_info->process_name[n] = '/';

I think runtime asserts are unavoidable here. To make sure no OOB write 
if someone gets creative and decreases the storage for 
task_info->process_name.

> +			strscpy_pad(&vm->task_info->process_name[n + 1],
> +				    file->name,
> +				    sizeof(vm->task_info->process_name) - (n + 1));
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

Like this we already know the whole string will not fit if both sides 
use their max allowed size. So why not size this pessimistically to 
include both components, slash and null termination?

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
