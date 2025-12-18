Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A432BCCCE47
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B65610EA87;
	Thu, 18 Dec 2025 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05BD810EA87
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 16:57:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56335FEC;
 Thu, 18 Dec 2025 08:57:25 -0800 (PST)
Received: from [10.1.29.42] (e122027.cambridge.arm.com [10.1.29.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CB143F73F;
 Thu, 18 Dec 2025 08:57:30 -0800 (PST)
Message-ID: <0939a54e-dc35-434b-9dbc-06837f04e62f@arm.com>
Date: Thu, 18 Dec 2025 16:57:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: Evict groups before VM termination
To: Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251218162644.828495-1-ketil.johnsen@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20251218162644.828495-1-ketil.johnsen@arm.com>
Content-Type: text/plain; charset=UTF-8
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

On 18/12/2025 16:26, Ketil Johnsen wrote:
> Ensure all related groups are evicted and suspended before VM
> destruction takes place.
> 
> This fixes an issue where panthor_vm_destroy() destroys and unmaps the
> heap context while there are still on slot groups using this.
> The FW will do a write out to the heap context when a CSG (group) is
> suspended, so a premature unmap of the heap context will cause a
> GPU page fault.
> This page fault is quite harmless, and do not affect the continued
> operation of the GPU.
> 
> Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c   |  4 ++++
>  drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |  1 +
>  3 files changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 74230f7199121..0e4b301a9c70e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1537,6 +1537,10 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
>  
>  	vm->destroyed = true;
>  
> +	/* Tell scheduler to stop all GPU work related to this VM */
> +	if (refcount_read(&vm->as.active_cnt) > 0)
> +		panthor_sched_prepare_for_vm_destruction(vm->ptdev);
> +
>  	mutex_lock(&vm->heaps.lock);
>  	panthor_heap_pool_destroy(vm->heaps.pool);
>  	vm->heaps.pool = NULL;
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index f680edcd40aad..fbbaab9b25efb 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2930,6 +2930,22 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
>  		sched_queue_delayed_work(ptdev->scheduler, tick, 0);
>  }
>  
> +void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev)
> +{
> +	/* FW can write out internal state, like the heap context, during CSG
> +	 * suspend. It is therefore important that the scheduler has fully
> +	 * evicted any pending and related groups before VM destruction can
> +	 * safely continue. Failure to do so can lead to GPU page faults.
> +	 * A controlled termination of a Panthor instance involves destroying
> +	 * the group(s) before the VM. This means any relevant group eviction
> +	 * has already been initiated by this point, and we just need to
> +	 * ensure that any pending tick_work() has been completed.
> +	 */
> +	if (ptdev->scheduler) {
> +		flush_work(&ptdev->scheduler->tick_work.work);
> +	}

NIT: braces not needed.

But I'm also struggling to understand in what situation ptdev->scheduler
would be NULL?

Thanks,
Steve

> +}
> +
>  void panthor_sched_resume(struct panthor_device *ptdev)
>  {
>  	/* Force a tick to re-evaluate after a resume. */
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index f4a475aa34c0a..9a8692de8aded 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -50,6 +50,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev);
>  void panthor_sched_resume(struct panthor_device *ptdev);
>  
>  void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
> +void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev);
>  void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
>  
>  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);

