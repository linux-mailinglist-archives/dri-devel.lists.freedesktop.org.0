Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKNoEPntcGk+awAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:17:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5615590A4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 16:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A16A10E22A;
	Wed, 21 Jan 2026 15:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="E63R1qLN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318310E231
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 15:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1769008627;
 bh=nkelfsu4p6R6BuikTIFe7R0FyvAdaB7ifZNw3N0h7CE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E63R1qLNBBA/W+fgU5BaiT+/fXxT3w7nqyfmXpwP9O363yRiLlWXBPg7vU6xnfQ1L
 dGVKLWgGciWkj+6HmM0PKV9Q/neN3JOoptMZwiZDbjZ2kT/TDhpOeVn0E9Rc//h78o
 GJYpLS+2am+1K0HYDKLUJPCNofSieUUn49GCOKy4lXgiPaRlN/C14UgAcskAy1/LQp
 1aIgm0qT6n0VaODFj8p3XezJGojMpN/OtmOAyTcgRtEQ6sLUWe1FYXX2ggMdFSgwKC
 Tb8gvKkbyt1yEeEfuyw557hLoLMFx+gegqHRRZS5u5OPLp5uwpn2BVkzdUn2zXWf6J
 lV+c+f/9hbT4w==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5AB8117E01E7;
 Wed, 21 Jan 2026 16:17:06 +0100 (CET)
Date: Wed, 21 Jan 2026 16:17:03 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Akash Goel <akash.goel@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P
 Oommen <akhilpo@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Osipenko
 <dmitry.osipenko@collabora.com>, Chris Diamand <chris.diamand@arm.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>,
 kernel@collabora.com, nd@arm.com
Subject: Re: [PATCH v1 5/9] drm/panthor: Part ways with drm_gem_shmem_object
Message-ID: <20260121161703.7210b39a@fedora>
In-Reply-To: <3171dfa9-94d4-4024-a1d4-035995d8c79d@arm.com>
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-6-boris.brezillon@collabora.com>
 <f55ecaa7-0695-4cdc-94f4-4769e1b72bb0@arm.com>
 <20260112151714.4461d045@fedora>
 <3171dfa9-94d4-4024-a1d4-035995d8c79d@arm.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akash.goel@arm.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,collabora.com:dkim,arm.com:email]
X-Rspamd-Queue-Id: C5615590A4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 21 Jan 2026 11:11:01 +0000
Akash Goel <akash.goel@arm.com> wrote:

> Hi Boris, Steve
> 
> 
> On 1/12/26 14:17, Boris Brezillon wrote:
> > On Mon, 12 Jan 2026 12:06:17 +0000
> > Steven Price <steven.price@arm.com> wrote:
> >   
> >> On 09/01/2026 13:07, Boris Brezillon wrote:  
> >>> While drm_gem_shmem_object does most of the job we need it to do, the
> >>> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
> >>> gets in the way of BO reclaim. There has been attempts to address
> >>> that [1], but in the meantime, new gem_shmem users were introduced
> >>> (accel drivers), and some of them manually free some of these resources.
> >>> This makes things harder to control/sanitize/validate.
> >>>
> >>> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resources
> >>> and forcing gem_shmem users to go through new gem_shmem helpers when they
> >>> need manual control of some sort, and I believe this is a dead end if
> >>> we don't force users to follow some stricter rules through carefully
> >>> designed helpers, because there will always be one user doing crazy things
> >>> with gem_shmem_object internals, which ends up tripping out the common
> >>> helpers when they are called.
> >>>
> >>> The consensus we reached was that we would be better off forking
> >>> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
> >>> current transition tries to minimize the changes, but there are still
> >>> some aspects that are different, the main one being that we no longer
> >>> have a pages_use_count, and pages stays around until the GEM object is
> >>> destroyed (or when evicted once we've added a shrinker). The sgt also
> >>> no longer retains pages. This is losely based on how msm does things by
> >>> the way.  
> >>
> >>  From a reviewing perspective it's a little tricky trying to match up the
> >> implementation to shmem because of these changes. I don't know how
> >> difficult it would be to split the changes to a patch which literally
> >> copies (with renames) from shmem, followed by simplifying out the parts
> >> we don't want.  
> > 
> > It's a bit annoying as the new implementation is not based on shmem at
> > all, but if you think it helps the review, I can try what you're
> > suggesting. I mean, I'm not convinced it will be significantly easier
> > to review with this extra step, since the new logic is different enough
> > (especially when it comes to resource refcounting) that it needs a
> > careful review anyway (which you started doing here).
> >   
> >>
> >> Of course the main issue is going to be getting some proper testing of
> >> this (especially with the shrinker added).  
> > 
> > For the shrinker, the best I can propose for now is extending the
> > IGT tests I've added. For close-to-real-usecases testing of the shmem ->
> > custom transition (this commit), making sure the g610 jobs we have in
> > mesa CI still passes is a start. If you have other ideas, I'd be happy
> > to give them a try.
> >   
> >>  
> >>>
> >>> If there's any interest in sharing code (probably with msm, since the
> >>> panthor shrinker is going to be losely based on the msm implementation),
> >>> we can always change gears and do that once we have everything
> >>> working/merged.
> >>>
> >>> [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.508603-1-dmitry.osipenko@collabora.com/
> >>>
> >>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> >>> ---
> >>>   drivers/gpu/drm/panthor/Kconfig         |   1 -
> >>>   drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
> >>>   drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
> >>>   drivers/gpu/drm/panthor/panthor_gem.c   | 696 ++++++++++++++++++++----
> >>>   drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
> >>>   drivers/gpu/drm/panthor/panthor_mmu.c   |  49 +-
> >>>   drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
> >>>   7 files changed, 666 insertions(+), 174 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> >>> index 55b40ad07f3b..911e7f4810c3 100644
> >>> --- a/drivers/gpu/drm/panthor/Kconfig
> >>> +++ b/drivers/gpu/drm/panthor/Kconfig
> >>> @@ -8,7 +8,6 @@ config DRM_PANTHOR
> >>>   	depends on MMU
> >>>   	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> >>>   	select DRM_EXEC
> >>> -	select DRM_GEM_SHMEM_HELPER
> >>>   	select DRM_GPUVM
> >>>   	select DRM_SCHED
> >>>   	select IOMMU_IO_PGTABLE_LPAE
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> >>> index 52c27a60c84a..90e9abc22d9e 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> >>> @@ -19,6 +19,7 @@
> >>>   #include <drm/drm_debugfs.h>
> >>>   #include <drm/drm_drv.h>
> >>>   #include <drm/drm_exec.h>
> >>> +#include <drm/drm_file.h>
> >>>   #include <drm/drm_ioctl.h>
> >>>   #include <drm/drm_print.h>
> >>>   #include <drm/drm_syncobj.h>
> >>> @@ -1457,7 +1458,7 @@ static int panthor_ioctl_bo_query_info(struct drm_device *ddev, void *data,
> >>>   	args->create_flags = bo->flags;
> >>>   
> >>>   	args->extra_flags = 0;
> >>> -	if (drm_gem_is_imported(&bo->base.base))
> >>> +	if (drm_gem_is_imported(&bo->base))
> >>>   		args->extra_flags |= DRM_PANTHOR_BO_IS_IMPORTED;
> >>>   
> >>>   	drm_gem_object_put(obj);
> >>> @@ -1671,8 +1672,7 @@ static const struct drm_driver panthor_drm_driver = {
> >>>   	.major = 1,
> >>>   	.minor = 7,
> >>>   
> >>> -	.gem_create_object = panthor_gem_create_object,
> >>> -	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
> >>> +	.gem_prime_import_sg_table = panthor_gem_prime_import_sg_table,
> >>>   	.gem_prime_import = panthor_gem_prime_import,
> >>>   #ifdef CONFIG_DEBUG_FS
> >>>   	.debugfs_init = panthor_debugfs_init,
> >>> @@ -1822,3 +1822,4 @@ module_exit(panthor_exit);
> >>>   MODULE_AUTHOR("Panthor Project Developers");
> >>>   MODULE_DESCRIPTION("Panthor DRM Driver");
> >>>   MODULE_LICENSE("Dual MIT/GPL");
> >>> +MODULE_IMPORT_NS("DMA_BUF");
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> >>> index a64ec8756bed..f135cf2130b8 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> >>> @@ -627,7 +627,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >>>   		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
> >>>   		struct panthor_gem_object *bo;
> >>>   		u32 vm_map_flags = 0;
> >>> -		struct sg_table *sgt;
> >>>   		u64 va = hdr.va.start;
> >>>   
> >>>   		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
> >>> @@ -665,11 +664,12 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> >>>   		panthor_fw_init_section_mem(ptdev, section);
> >>>   
> >>>   		bo = to_panthor_bo(section->mem->obj);
> >>> -		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> >>> -		if (IS_ERR(sgt))
> >>> -			return PTR_ERR(sgt);
> >>>   
> >>> -		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> >>> +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> >>> +		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
> >>> +			return -EINVAL;
> >>> +
> >>> +		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
> >>>   	}
> >>>   
> >>>   	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
> >>> @@ -729,8 +729,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
> >>>   			continue;
> >>>   
> >>>   		panthor_fw_init_section_mem(ptdev, section);
> >>> -		sgt = drm_gem_shmem_get_pages_sgt(&to_panthor_bo(section->mem->obj)->base);
> >>> -		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
> >>> +
> >>> +		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> >>> +		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
> >>> +		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
> >>>   			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> >>>   	}
> >>>   }
> >>> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> >>> index 4b3d82f001d8..0e52c7a07c87 100644
> >>> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> >>> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> >>> @@ -8,9 +8,11 @@
> >>>   #include <linux/dma-mapping.h>
> >>>   #include <linux/err.h>
> >>>   #include <linux/slab.h>
> >>> +#include <linux/vmalloc.h>
> >>>   
> >>>   #include <drm/drm_debugfs.h>
> >>>   #include <drm/drm_file.h>
> >>> +#include <drm/drm_prime.h>
> >>>   #include <drm/drm_print.h>
> >>>   #include <drm/panthor_drm.h>
> >>>   
> >>> @@ -44,7 +46,7 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo)
> >>>   
> >>>   static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> >>>   {
> >>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> >>> +	struct panthor_device *ptdev = container_of(bo->base.dev,
> >>>   						    struct panthor_device, base);
> >>>   
> >>>   	bo->debugfs.creator.tgid = current->group_leader->pid;
> >>> @@ -57,7 +59,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
> >>>   
> >>>   static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
> >>>   {
> >>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev,
> >>> +	struct panthor_device *ptdev = container_of(bo->base.dev,
> >>>   						    struct panthor_device, base);
> >>>   
> >>>   	if (list_empty(&bo->debugfs.node))
> >>> @@ -80,9 +82,9 @@ static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
> >>>   #endif
> >>>   
> >>>   static bool
> >>> -should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
> >>> +should_map_wc(struct panthor_gem_object *bo)
> >>>   {
> >>> -	struct panthor_device *ptdev = container_of(bo->base.base.dev, struct panthor_device, base);
> >>> +	struct panthor_device *ptdev = container_of(bo->base.dev, struct panthor_device, base);
> >>>   
> >>>   	/* We can't do uncached mappings if the device is coherent,
> >>>   	 * because the zeroing done by the shmem layer at page allocation
> >>> @@ -112,6 +114,208 @@ should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusive_vm)
> >>>   	return true;
> >>>   }
> >>>   
> >>> +static void
> >>> +panthor_gem_backing_cleanup(struct panthor_gem_object *bo)
> >>> +{
> >>> +	if (!bo->backing.pages)
> >>> +		return;
> >>> +
> >>> +	drm_gem_put_pages(&bo->base, bo->backing.pages, true, false);
> >>> +	bo->backing.pages = NULL;
> >>> +}
> >>> +
> >>> +static int
> >>> +panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
> >>> +{
> >>> +	dma_resv_assert_held(bo->base.resv);
> >>> +
> >>> +	if (bo->backing.pages)
> >>> +		return 0;
> >>> +
> >>> +	bo->backing.pages = drm_gem_get_pages(&bo->base);
> >>> +	if (IS_ERR(bo->backing.pages)) {
> >>> +		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
> >>> +			    bo->backing.pages);
> >>> +		return PTR_ERR(bo->backing.pages);  
> >>
> >> This leaves bo->backing.pages set to the error value, which means a
> >> future call to panthor_gem_backing_get_pages_locked() for the same
> >> object will return success. Unless there's some 'poisoning' that I
> >> haven't spotted this looks like a bug.  
> > 
> > That's a bug, I'll fix it.
> >   
> 
> I ran into this bug, during the stress testing, which resulted in a crash.
> 
> 
> Unable to handle kernel paging request at virtual address fffffffffffffff4
> KASAN: maybe wild-memory-access in range 
> [0x0003ffffffffffa0-0x0003ffffffffffa7]
> Mem abort info:
>    ESR = 0x0000000096000006
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>    FSC = 0x06: level 2 translation fault
> Data abort info:
>    ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
>    CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000084026000
> [fffffffffffffff4] pgd=0000000000000000, p4d=0000000088a6d403, 
> pud=0000000088a6e403, pmd=0000000000000000
> pc : nonblocking_page_setup+0x90/0x108 [panthor]
> lr : nonblocking_page_setup+0x8c/0x108 [panthor]
> sp : ffff80008bdd7a80
> Call trace:
>   nonblocking_page_setup+0x90/0x108 [panthor] (P)
>   panthor_gem_fault+0x84/0x218 [panthor]
>   __do_fault+0x78/0x3d0
>   __handle_mm_fault+0xe20/0x23a0
>   handle_mm_fault+0x10c/0x438
>   do_page_fault+0x234/0x958
>   do_translation_fault+0xa0/0xd8
>   do_mem_abort+0x68/0x100
>   el0_da+0x54/0x1d8
>   el0t_64_sync_handler+0xd0/0xe8
>   el0t_64_sync+0x198/0x1a0
> 
> 
> First the call to panthor_gem_backing_get_pages_locked(), from 
> blocking_page_setup(), failed due to low memory.
> 
> panthor_gem_fault() returned VM_FAULT_RETRY as mmap_lock_held was 0.
> 
> Then the crash happened inside nonblocking_page_setup() when
> panthor_gem_fault() was called for the 2nd time.
> 
> 
> Made the following change locally to avoid the issue.
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c 
> b/drivers/gpu/drm/panthor/panthor_gem.c
> index 6e91c5022d0d..b31a4606a8c6 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -234,7 +234,7 @@ panthor_gem_backing_get_pages_locked(struct 
> panthor_gem_object *bo)
>          if (IS_ERR(bo->backing.pages)) {
>                  drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
>                              bo->backing.pages);
> -               return PTR_ERR(bo->backing.pages);
> +               return PTR_ERR(xchg(&bo->backing.pages, NULL));

That's clever, but after searching for such patterns in the linux code
base, I couldn't find a match (xchg only seems to be used for atomic
updates), so I'd be tempted to stick to the usual

		ret = PTR_ERR(bo->backing.pages);
		bo->backing.pages = NULL;
		return ret;

or

	pages = xxx()
	if (IS_ERR(pages)) {
		drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
			    bo->backing.pages);
		return PTR_ERR(pages);
	}

	bo->backing.pages = pages;

Anyway, I'm adding this to my fixup stack.

Thanks,

Boris
