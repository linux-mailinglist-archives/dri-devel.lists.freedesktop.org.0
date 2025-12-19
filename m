Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C2CCF805
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:00:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC3710EEE2;
	Fri, 19 Dec 2025 11:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lfvFcMhK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A95210E064
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766142001;
 bh=VjIxrQi+mk8mttz09PhTFYXsaPfpi2KuaBc8eh+Ci6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lfvFcMhKRh17L+Fn/ZuFAMY5pV4w1lcwd67SRnPf8odtLZbnOvEOpnMJh8JRtOYEU
 htfxUwCxD2PbNi0sDZoWPo72GGk8O9csZ61zYFVq/bL1Vq1CTCyt3/UvLATsVexAgi
 tpHSGVtxQQe+2LY7WAhL2juqmsgsDjgDGQ4pLCoAtMG6dFVslw3UMsIXjHtvbu3fD1
 OuYFaug1ATfi5cR4tCNMFJmKNN7tKMXEdbPSqjUuWEfdDMbLaaS6chzVLA5OpG6TlZ
 kmNoQXWvUmPsowGDX8XsaeQf7ygzP/9NM7x/YNFhoipFXA27CoJ6gaeqhM8xoYThIu
 RH+uh8tvARerQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6716717E0184;
 Fri, 19 Dec 2025 12:00:01 +0100 (CET)
Date: Fri, 19 Dec 2025 11:59:57 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panthor: Evict groups before VM termination
Message-ID: <20251219115957.5ae3cc86@fedora>
In-Reply-To: <e72e1056-1807-47aa-9c1a-5c41f589144f@arm.com>
References: <20251219093546.1227697-1-ketil.johnsen@arm.com>
 <e72e1056-1807-47aa-9c1a-5c41f589144f@arm.com>
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

On Fri, 19 Dec 2025 10:45:48 +0000
Steven Price <steven.price@arm.com> wrote:

> On 19/12/2025 09:35, Ketil Johnsen wrote:
> > Ensure all related groups are evicted and suspended before VM
> > destruction takes place.
> > 
> > This fixes an issue where panthor_vm_destroy() destroys and unmaps the
> > heap context while there are still on slot groups using this.
> > The FW will do a write out to the heap context when a CSG (group) is
> > suspended, so a premature unmap of the heap context will cause a
> > GPU page fault.
> > This page fault is quite harmless, and do not affect the continued
> > operation of the GPU.
> > 
> > Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>  
> 
> We're technically missing Boris's SoB here (Co-deleveloped-by requires a
> SoB). Boris do you want to merge this (adding your SoB)?

Done and queued to drm-misc-next, since I don't think the fix is super
urgent, and I'd rather avoid conflicts between misc-next and
misc-fixes when I can avoid them.

> 
> Thanks,
> Steve
> 
> > ---
> > Changes in v2:
> > - Removed check for ptdev->scheduler
> > - R-b from Boris
> > - Link to v1: https://lore.kernel.org/all/20251218162644.828495-1-ketil.johnsen@arm.com/
> > ---
> >  drivers/gpu/drm/panthor/panthor_mmu.c   |  4 ++++
> >  drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_sched.h |  1 +
> >  3 files changed, 19 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 74230f7199121..0e4b301a9c70e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1537,6 +1537,10 @@ static void panthor_vm_destroy(struct panthor_vm *vm)
> >  
> >  	vm->destroyed = true;
> >  
> > +	/* Tell scheduler to stop all GPU work related to this VM */
> > +	if (refcount_read(&vm->as.active_cnt) > 0)
> > +		panthor_sched_prepare_for_vm_destruction(vm->ptdev);
> > +
> >  	mutex_lock(&vm->heaps.lock);
> >  	panthor_heap_pool_destroy(vm->heaps.pool);
> >  	vm->heaps.pool = NULL;
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> > index f680edcd40aad..a40ac94e5e989 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -2930,6 +2930,20 @@ void panthor_sched_report_mmu_fault(struct panthor_device *ptdev)
> >  		sched_queue_delayed_work(ptdev->scheduler, tick, 0);
> >  }
> >  
> > +void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev)
> > +{
> > +	/* FW can write out internal state, like the heap context, during CSG
> > +	 * suspend. It is therefore important that the scheduler has fully
> > +	 * evicted any pending and related groups before VM destruction can
> > +	 * safely continue. Failure to do so can lead to GPU page faults.
> > +	 * A controlled termination of a Panthor instance involves destroying
> > +	 * the group(s) before the VM. This means any relevant group eviction
> > +	 * has already been initiated by this point, and we just need to
> > +	 * ensure that any pending tick_work() has been completed.
> > +	 */
> > +	flush_work(&ptdev->scheduler->tick_work.work);
> > +}
> > +
> >  void panthor_sched_resume(struct panthor_device *ptdev)
> >  {
> >  	/* Force a tick to re-evaluate after a resume. */
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> > index f4a475aa34c0a..9a8692de8aded 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.h
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> > @@ -50,6 +50,7 @@ void panthor_sched_suspend(struct panthor_device *ptdev);
> >  void panthor_sched_resume(struct panthor_device *ptdev);
> >  
> >  void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
> > +void panthor_sched_prepare_for_vm_destruction(struct panthor_device *ptdev);
> >  void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
> >  
> >  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);  
> 

