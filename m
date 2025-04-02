Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 823D8A78CAD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 12:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825A10E727;
	Wed,  2 Apr 2025 10:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IPQwQIOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0F610E727
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743591180;
 bh=A92dI39hNYioyoZ7xdk9maVj2S+9Jc8vBkDE56cKaxM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IPQwQIOcRW+r64dw1BCPGfV5y4ZpjVr9frMUZDC9gE4A54lkh2q7O/oKy6QEYp5Or
 hRjdjtOVAfwsneBzcTvGVOKOn86r2IzcAaOtD2RpIzIEH+sQ7EJy0F1mSBkVpCKMLm
 B5ON8JjcAb9qyJmAHi2/ho8np2nxIqJMGNA1UA/b/mzjRya8P4OgxIX40zuD2SIiqN
 yRrIKBwO8H9KcVBdGK6E4e5WEG/n/kvHCUyf/xii/WfSz8WsYeEovCHVKX/67DGymR
 QYTea/nCiS0v/G7bl1PZF/FETUeyHdRPnBwlzDc3g2fqomEcWmj1QfTOtjyXD6rzQE
 fKoF5fd91jyZw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 91C1F17E0385;
 Wed,  2 Apr 2025 12:53:00 +0200 (CEST)
Date: Wed, 2 Apr 2025 12:52:55 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH v2 4/5] drm/panthor: Let IRQ handlers clear the
 interrupts themselves
Message-ID: <20250402125255.663fd13b@collabora.com>
In-Reply-To: <2e565589-4845-4007-80be-adb6b370e911@arm.com>
References: <20250401182348.252422-1-boris.brezillon@collabora.com>
 <20250401182348.252422-5-boris.brezillon@collabora.com>
 <2e565589-4845-4007-80be-adb6b370e911@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Wed, 2 Apr 2025 11:20:17 +0100
Steven Price <steven.price@arm.com> wrote:

> On 01/04/2025 19:23, Boris Brezillon wrote:
> > MMU handler needs to be in control of the job interrupt clears because
> > clearing the interrupt also unblocks the writer/reader that triggered
> > the fault, and we don't want it to be unblocked until we've had a chance
> > to process the IRQ.
> > 
> > Since clearing the clearing is just one line, let's make it explicit
> > instead of doing it in the generic code path.
> > 
> > Changes in v2:
> > - Move the MMU_INT_CLEAR around
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Look at this made me look at panthor_mmu_irq_handler() and I can't
> understand this bit of code:
> 
> > static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> > {
> > 	bool has_unhandled_faults = false;
> > 
> > 	status = panthor_mmu_fault_mask(ptdev, status);
> > 	while (status) {
> > 		u32 as = ffs(status | (status >> 16)) - 1;  
> 
> panthor_mmu_fault_mask() masks status with GENMASK(15, 0), so AFAICT
> (status >> 16) is always 0.
> 
> Which isn't a big issue, other than you are now only clearing IRQs which
> are recognised by the loop.
> 
> So this changes the behaviour to not clear interrupt bits 16-31 (the
> COMMAND_COMPLETED bits). I believe we don't actually care about them and
> AFAICT we always mask those interrupt bits in the IRQ mask - so it
> should be safe...
> 
> TLDR; I think this change is fine, but I'm not sure if it's what you
> intended and it would be good to include something in the commit message
> about the functional change.

Didn't realize it was changing the behavior, but I was aware we were
only unmasking fault interrupts, and I left COMPLETED ones uncleared on
purpose. I'll add a comment about that in the commit message.

> 
> Thanks,
> Steve
> 
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.h | 2 --
> >  drivers/gpu/drm/panthor/panthor_fw.c     | 2 ++
> >  drivers/gpu/drm/panthor/panthor_gpu.c    | 2 ++
> >  drivers/gpu/drm/panthor/panthor_mmu.c    | 5 +++++
> >  4 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> > index da6574021664..4c27b6d85f46 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -383,8 +383,6 @@ static irqreturn_t panthor_ ## __name ## _irq_threaded_handler(int irq, void *da
> >  		if (!status)									\
> >  			break;									\
> >  												\
> > -		gpu_write(ptdev, __reg_prefix ## _INT_CLEAR, status);				\
> > -												\
> >  		__handler(ptdev, status);							\
> >  		ret = IRQ_HANDLED;								\
> >  	}											\
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 0f52766a3120..446bb377b953 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -1008,6 +1008,8 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
> >  
> >  static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
> >  {
> > +	gpu_write(ptdev, JOB_INT_CLEAR, status);
> > +
> >  	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
> >  		ptdev->fw->booted = true;
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> > index 671049020afa..32d678a0114e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> > @@ -150,6 +150,8 @@ static void panthor_gpu_init_info(struct panthor_device *ptdev)
> >  
> >  static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
> >  {
> > +	gpu_write(ptdev, GPU_INT_CLEAR, status);
> > +
> >  	if (status & GPU_IRQ_FAULT) {
> >  		u32 fault_status = gpu_read(ptdev, GPU_FAULT_STATUS);
> >  		u64 address = ((u64)gpu_read(ptdev, GPU_FAULT_ADDR_HI) << 32) |
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index 7cca97d298ea..4ac95a31907d 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -1710,6 +1710,11 @@ static void panthor_mmu_irq_handler(struct panthor_device *ptdev, u32 status)
> >  			access_type, access_type_name(ptdev, fault_status),
> >  			source_id);
> >  
> > +		/* We don't handle VM faults at the moment, so let's just clear the
> > +		 * interrupt and let the writer/reader crash.
> > +		 */
> > +		gpu_write(ptdev, MMU_INT_CLEAR, mask);
> > +
> >  		/* Ignore MMU interrupts on this AS until it's been
> >  		 * re-enabled.
> >  		 */  
> 

