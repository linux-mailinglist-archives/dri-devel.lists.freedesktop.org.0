Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1578CBDD92
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 13:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9269510E489;
	Mon, 15 Dec 2025 12:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="LM4R97ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4689310E489
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765802489;
 bh=UMUICXtPgJNhy5a30WCsUZ/6G5/5w2kb5v1I6alRfe0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LM4R97qlYi3Qodz1AJT22McW/QdYVlh5w534GHGBXs8CWcmPd1CkDMBSfxjnTHsqY
 8mhsJzcdqalr94vJuJxOvdFCcq3Qiei0D0Rw/37wTXvctnsg2KEiVNFNmvCZFy4FHu
 3pck3UwEh/DNI0MNcYONXHMFTYjCiUXbzkk6V1T6GOkQLBtXcHLuFL6jpQvaxQbyHM
 SiH+kz5EdZNqeYKYSi7FkooEbDPYh3Suh1LegBLwrHrH44y7BsZeqPoqnc3Oayikr/
 fGWfheBfKQNku6EKoXONES/6f3gUCc4QdlKyJCTDcI3Clp2BPFAChPVz6vRVPDQ0Dh
 SPaYwTCBcSXSA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3813317E0463;
 Mon, 15 Dec 2025 13:41:29 +0100 (CET)
Date: Mon, 15 Dec 2025 13:41:24 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] drm/panthor: Propagate VM-level faults to groups
Message-ID: <20251215134124.6ddca7f0@fedora>
In-Reply-To: <20251215115457.2137485-5-lukas.zapolskas@arm.com>
References: <20251215115457.2137485-1-lukas.zapolskas@arm.com>
 <20251215115457.2137485-5-lukas.zapolskas@arm.com>
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

On Mon, 15 Dec 2025 11:54:56 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> Receiving an MMU fault currently disables the AS, so each of the groups
> is marked with the appropriate faults. Since no further submissions
> can occur on a fatal fault for that group, the fault information
> does not have to be cleared until the group is terminated.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c   |  8 ++++++++
>  drivers/gpu/drm/panthor/panthor_mmu.h   |  2 ++
>  drivers/gpu/drm/panthor/panthor_sched.c | 13 +++++++++++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 10a7418eecda..9e78b0509f1a 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -2895,3 +2895,11 @@ void panthor_mmu_pt_cache_fini(void)
>  {
>  	kmem_cache_destroy(pt_cache);
>  }
> +
> +struct panthor_vm_fault *panthor_vm_get_fault(struct panthor_vm *vm)

const struct panthor_vm_fault *
panthor_vm_get_fault(struct panthor_vm *vm)

or

struct panthor_vm_fault
panthor_vm_get_fault(struct panthor_vm *vm)

or

void
panthor_vm_get_fault(struct panthor_vm *vm,
		     struct panthor_vm_fault *fault)

but you shouldn't let the caller with a writable pointer to vm->fault.

> +{
> +	if (!vm)
> +		return NULL;

I don't see a valid case where panthor_vm_get_fault() would be called
with a NULL pointer.

> +
> +	return &vm->fault;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.h b/drivers/gpu/drm/panthor/panthor_mmu.h
> index 023fdc79c231..d69b4000a39e 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.h
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.h
> @@ -123,4 +123,6 @@ void panthor_mmu_pt_cache_fini(void);
>  void panthor_mmu_debugfs_init(struct drm_minor *minor);
>  #endif
>  
> +struct panthor_vm_fault *panthor_vm_get_fault(struct panthor_vm *vm);
> +
>  #endif
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index a77399e95620..9ea0d2b27114 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -722,6 +722,11 @@ struct panthor_group {
>  	 * panthor_group::groups::waiting list.
>  	 */
>  	struct list_head wait_node;
> +
> +	/**
> +	 * @fatal: VM-level fault that caused a fatal error on the group.
> +	 */
> +	struct panthor_vm_fault fatal;
>  };
>  
>  struct panthor_job_profiling_data {
> @@ -1575,6 +1580,14 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
>  			 group->task_info.pid, group->task_info.comm);
>  
>  		group->fatal_queues |= BIT(cs_id);
> +
> +		if (panthor_vm_has_unhandled_faults(group->vm)) {
> +			struct panthor_vm_fault *fault;
> +
> +			fault = panthor_vm_get_fault(group->vm);
> +			if (fault)
> +				group->fatal = *fault;
> +		}
>  	}
>  
>  	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {

