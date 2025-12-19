Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75698CCF6E4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C680010EF19;
	Fri, 19 Dec 2025 10:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5E91810EF19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:42:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD3E1595
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:42:01 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 7E5A83F5CA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:42:08 -0800 (PST)
Date: Fri, 19 Dec 2025 10:41:13 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Evict groups before VM termination
Message-ID: <aUUryXBrAC1KQYFH@e142607>
References: <20251219093546.1227697-1-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251219093546.1227697-1-ketil.johnsen@arm.com>
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

On Fri, Dec 19, 2025 at 10:35:44AM +0100, Ketil Johnsen wrote:
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
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
> Changes in v2:
> - Removed check for ptdev->scheduler
> - R-b from Boris
> - Link to v1: https://lore.kernel.org/all/20251218162644.828495-1-ketil.johnsen@arm.com/
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c   |  4 ++++
>  drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |  1 +
>  3 files changed, 19 insertions(+)
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
> index f680edcd40aad..a40ac94e5e989 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2930,6 +2930,20 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
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
> +	flush_work(&ptdev->scheduler->tick_work.work);
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
> -- 
> 2.43.0
> 
