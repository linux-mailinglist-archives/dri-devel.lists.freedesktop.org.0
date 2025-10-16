Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B71FBE3583
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 14:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC30210E0A3;
	Thu, 16 Oct 2025 12:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HFnv1m3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9890710E0A3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760617471;
 bh=AgQ/Y3xQWasTTQEhCeYbgwvx9L02rnAZy6F05k0/0fo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HFnv1m3FV2/2pPz/A+9EdvSi/EMKPMseMQ/qDmIisonUsXV2bdxpGkVj6l2mB0T+8
 wqdkv9owo+uXZQwr1bkO1yNGiSdlFtc9yTRurgkF+tDWbW9CEEfLYLLzN9GK0RavpS
 YrGQixXhOlAXYZpTluiul7Fd2UeSV34MwCA89Up2eDkqUbhg1WTspKfA4qpDpz6jSd
 24h8GIXpDINd+FvP5QSBkr/fqHVGQt1kX10ao6FDR3P3eZIUXtACxi+kWb95Epoj10
 tAvhQvPLOMGvje12Au7PQ5NRz9PihIfblmHPk+pMig6qgB38PavztMmD+F5COqRA/q
 9RtkqU5Lb/nHA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AD8D317E1271;
 Thu, 16 Oct 2025 14:24:30 +0200 (CEST)
Date: Thu, 16 Oct 2025 14:24:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251016142427.719beab5@fedora>
In-Reply-To: <87813da2-4d97-4412-b1f2-1fde6ef6545b@suse.de>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
 <20251016114016.12bb49cd@fedora>
 <c0f34c27-075a-49b1-be44-5b4d9c152ac7@suse.de>
 <20251016123217.01d32b85@fedora>
 <87813da2-4d97-4412-b1f2-1fde6ef6545b@suse.de>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Thu, 16 Oct 2025 13:42:59 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 16.10.25 um 12:32 schrieb Boris Brezillon:
> > On Thu, 16 Oct 2025 11:58:21 +0200
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  
> >> Hi
> >>
> >> Am 16.10.25 um 11:40 schrieb Boris Brezillon:  
> >>> Hi Thomas,
> >>>
> >>> On Thu, 16 Oct 2025 10:32:46 +0200
> >>> Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>>     
> >>>> Hi,
> >>>>
> >>>> on patches 2 to 4: sync is really begin/end access wrapped into one
> >>>> interface, which I find questionable. I also don't like that these
> >>>> patches add generic infrastructure for a single driver.  
> >>> It's actually two drivers (panfrost and panthor), and the interface is
> >>> here so other drivers relying on drm_gem_shmem don't have to hand-roll
> >>> these things in the future.  
> >> Ok.
> >>
> >> But what about the unrelated drivers? Most GEM SHMEM drivers don't need
> >> this. Looking at patch 4, there's a for loop over the SG table, which
> >> appears to affect all drivers.  
> > It doesn't. First off, this ::sync hook is optional, and if you look at
> > patch 4's commit message, it says:
> >
> > "
> > We provide a drm_gem_shmem_object_sync() for drivers that wants to
> > have this default implementation as their drm_gem_object_funcs::sync,
> > but we don't set drm_gem_shmem_funcs::sync to
> > drm_gem_shmem_object_sync() to avoid changing the behavior of drivers
> > currently relying on the default gem_shmem vtable.
> > "
> >  
> >> You know, there are two types of GEM SHMEM users. The ones like panthor
> >> that build upon it with additional features. And the other type that
> >> only use it as simple buffer storage. The former type what's building
> >> blocks to combine as needed; that latter (actually the majority) wants a
> >> simple solution. And TBH, I've considered spitting GEM SHMEM into two
> >> for this reason.  
> > That's the very reason I don't force
> >
> > 	::sync = drm_gem_shmem_sync
> >
> > but leave it to each driver to decide whether they want it or not.  
> 
> Apologies for misunderstanding. My impression was that the sync helper 
> is now the default. But that brings me to another question: where do you 
> set the gem callback? I applied your series and grepped for it. It's not 
> set in the panthor/panfrost gem funcs nor the default funcs for shmem. I 
> can only find the sync calls in the ioctl code.

Oops. Looks like I forgot to explicitly assign the sync hook
:face_palm:.

> 
> >  
> >>>     
> >>>> My proposal is to make your own dma_buf exporter in panthor and set the
> >>>> begin/end_cpu_access functions as you need. Panthor already contains its
> >>>> own GEM export helper at [1]. If you inline drm_gem_prime_export() [2]
> >>>> you can set the cpu_access callbacks to panthor-specific code. The other
> >>>> dma-buf helpers' symbols should be exported and can be re-used. That is
> >>>> a lot less intrusive and should provide what you need.  
> >>> I can of course do that in panthor, but then I'll have to duplicate
> >>> the same logic in panfrost. Also, the whole point of making it generic
> >>> is so that people don't forget that begin/end_cpu_access() is a thing
> >>> they should consider (like happened to me if you look at v2 of this
> >>> patchset), otherwise importers of their buffers might have unpleasant
> >>> side effects because of missing flush/invalidates. This, IMHO, is a good
> >>> reason to have it as a drm_gem_funcs::sync() callback. That, or we
> >>> decide that the default dma_buf_ops is not a thing, and we force
> >>> developers to think twice when they select the default hooks to pick
> >>> for their dma_buf implementation.  
> >> See my comment above. Panthor and panfrost should treat GEM SHMEM like a
> >> set of building blocks rather and a full solution.  
> > That's exactly what it does. Panfrost/Panthor have their own
> > drm_gem_object_funcs, they just use the default drm_gem_shmem_sync
> > implementation provided by this patch, that's all. And yes,
> > hand-rolling your own drm_prime implem is not only annoying, it's also
> > error prone because some of the gem_shmem helpers [1] might rely on
> > drm_gem_is_prime_exported_dma_buf(), which checks the dma_buf ops
> > against the default drm_prime implementation.  
> 
> I know, but that's a shortcoming of the current implementation. IIRC all 
> driver's prime importers have code like [1] at the top, so we probably 
> should do that in common code.

Right (I mention it later in this reply), but that's assuming the rest
of the helpers are truly designed to be generic, and that would require
going through all of these to be sure.

> 
> But that's not the point here.

It kinda is though. Initially you said it's 10 lines of code only doing
struct init or whatnot, but it's actually more than that in practice.
And this glue is just the sort of annoying code base that you'd rather
have centralized so you don't have to fix an entire stack of drivers
when you fix something in the default helper.

> I really do think that drivers either use 
> a simple turn-key solution OR hand-pick the building blocks for the 
> complex scenarios. There's no middle ground IMHO. IIRC the original TTM 
> was supposed to provide a full solution for the complex scenarios and 
> failed at that.

But is it really a complex scenario I'm trying to support here? I'm
basically translating the dma_buf semantics into some standard DRM
hook. In a sense, that's what all drivers implementing their own
::begin/end_cpu_access() do already...

> 
> 
> >  
> >>>     
> >>>> I found that a hand full of other DRM drivers implement dma-buf's
> >>>> begin/end access callbacks. If you want a generic begin/end interface
> >>>> for GEM, you certainly want to get them on board. If there's something
> >>>> common to share, this should be done in a separate series.  
> >>> Fair enough. I'll try to convert freedreno and imagination to this new
> >>> interface, and gather some feedback.  
> >> I did 'git grep \.begin_cpu_access' in the drm directory. This returned,
> >> amdgpu, i915, tegra, omap, and xe. These where the ones I had in mind.  
> > Hm, so tegra/omap should be relatively easy, but I'm reluctant to touch
> > the big drivers here (amdgpu, i915 and xe). Because it's an opt-in, and
> > because these drivers already have hand-rolled these dma_buf_ops, I'd
> > rather let their owners deal with the transition if they want to. IOW,
> > if you ask me to find new users, I'd like to focus on relatively small
> > drivers, and primarily those relying on drm_gem_shmem already. Note
> > that there might be drivers lacking a {begin,end}_cpu_access()
> > implementation, but don't know it, because there's very few use cases
> > where GPU is the exporter and the importer is not the same GPU device.
> > The other reason would be that most drivers relying on gem_shmem set
> > ::map_wc=true unconditionally (CPU mappings are not cached, and thus
> > don't require synchronization), or just that those devices are IO
> > coherent.  
> 
> I'm not asking you to rewrite all these drivers, but to take them into 
> consideration.

I did. I looked at Tegra, Xe and MSM for instance, and given the sync()
hook semantics are very close to the begin/end_cpu_access() ones
(except things are combined in one hook instead of two), I thought it
could achieve the same thing custom begin/end_cpu_access() implems do.


> Feedback from their devs would be valuable. Semantics of 
> similar operations in dma-buf and GEM sometimes differ in subtle ways. 
> Things like pinning, locking and eviction might be of importance to make 
> sync work for all drivers.
> 
> >
> > Honestly, I'm not too sure why this is a problem if this hook is
> > optional. If it turns out to be too simple for more complex use cases
> > others have, it can still be extended when those drivers transition to
> > this ::sync() approach, as no in-kernel API is immutable. And in the
> > meantime, we have a solution for two drivers that doesn't imply
> > duplicating a bunch of drm_prime boiler-plate that's otherwise rather
> > generic.  
> 
> The prime code you'd have to duplicate is just 10 lines, plus some small 
> per-driver code. Most of that being data-structure inits.

But it's more than just the struct init you have to duplicate. Look at
drm_gem_prime_import_dev() function for instance. It has
drm_gem_is_prime_exported_dma_buf() in it, so all of a sudden, you pull
a custom implem of drm_gem_prime_import() too, and I suspect that's not
the only thing that needs to be duplicated. Yes there are ways
around it, like having the dma_buf_ops stored at the drm_device
level, so drm_gem_is_prime_exported_dma_buf() can test against
dev->dma_buf_ops instead of &drm_gem_prime_dmabuf_ops, but my point
stands, it's usually more complicate than 10 lines of simple struct
inits as you seem to imply.

FWIW, I originally considered hand-rolling the drm_prime code for
panthor, and realized I'd have to do the same for panfrost, because
despite the mix-and-match approach that originally drove this
code-sharing mantra, there's just a lot helpers that are still designed
to be used only with the default implementation. Given the notion of
synchronization is common to all HW (I mean, dma_buf abstracts that
sync-around-cpu-access concept, so why can't DRM do the same?), I
figured it'd be way simpler, and more useful to others to have this
centralized at the GEM level.

> 
> I want to point out that I'm not opposing the general idea of GEM sync, 
> but I think it should get more feedback from others. It's supposed to be 
> a generic interface after all. Hence I was asking to put all this into a 
> separate series.

Ack. I'll post a new version with a few more drivers converted to it,
and try to Cc the intel/nouveau/amd people so I can get their feedback
too.
