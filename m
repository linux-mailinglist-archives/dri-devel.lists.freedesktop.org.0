Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC9CCD079
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 18:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659D410E11D;
	Thu, 18 Dec 2025 17:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HUMdFU1A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B3510E11D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 17:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766080429;
 bh=JoHs6jwaZuFi+Aly77pjvr8pEkS7cjWmwfJ4hIN9FNA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HUMdFU1AixAAO9e0o3gMEsnDJFJmdPE1W1ywopyHYDk7CZytnZyt/E1BdWpXY69Mf
 lIRm+8rrD+06h3egqaLjfiJll08b3V/EWnY1kjsYBgACt6Oc+qkBNjXuKoQSWmOA5G
 oGEDZXhB1GnUy1Xj0FJPcDVlceSnKYPQb8UpsmZRMyWOY2AsRDux6a1o/XlX0dnajJ
 WJE0rWq3qBZeOAChAVixmtCpVGW8PE5hVC4Xpl3oMrfLCvLKxMmX8trIWgvOf4ESjk
 h6UJzxilNLI+MYTorE7Pbgm810Ru3fK8/xVlbuTLhjVsf4ns2cn7InbRm4nUHqfuoQ
 072DhimeE7e2w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F3D217E0D64;
 Thu, 18 Dec 2025 18:53:48 +0100 (CET)
Date: Thu, 18 Dec 2025 18:53:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Grant Likely
 <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Evict groups before VM termination
Message-ID: <20251218185343.6fcd9923@fedora>
In-Reply-To: <20251218162644.828495-1-ketil.johnsen@arm.com>
References: <20251218162644.828495-1-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Thu, 18 Dec 2025 17:26:42 +0100
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

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

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

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

nit: you can drop the curly braces on single line conditionals. No
need to send a v2, I can fix this up when applying.

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

