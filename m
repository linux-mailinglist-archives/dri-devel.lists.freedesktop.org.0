Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E5EBE2CFF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 12:32:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0191310E062;
	Thu, 16 Oct 2025 10:32:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="H07jUYcP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5010E062
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760610742;
 bh=ThoOmPmJt3kvsdgsT7swtThKNLLHcY9fHiNpMcFYnkk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=H07jUYcPTtYXxp9RLvkkzOs7GtyRuEbUNvs3pvyCfCjT0FqxGo/f7j11+/ZqmZ85X
 ZCO6WFgGgnfDa2vdtYvjIwUacfzSeQMn2MQqAUmz2TkkluBNVXqjv//GzTzffMeRC+
 Rvba2rEOBlnaa3vn4s5DMjW2Cd7H+jFP2cHZ8zYcK/u9xnTg+IdCowQim2e/gLJ3Qc
 0pxXgCe1VFMt3GP5+8BUlCycT5Agfd673O8AyofIHsnrgQWmkLmXFKotPiV16rAyNb
 2yshyXHqpP9oIDCCABO5Zxnh4dv+OGXq3wca9GHPyEze1t+YmvADYLWfcoROXtoNZ+
 dnNHZNWLkqDaQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F15C17E05FE;
 Thu, 16 Oct 2025 12:32:22 +0200 (CEST)
Date: Thu, 16 Oct 2025 12:32:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 kernel@collabora.com
Subject: Re: [PATCH v4 02/14] drm/gem: Add a drm_gem_object_funcs::sync()
 and a drm_gem_sync() helper
Message-ID: <20251016123217.01d32b85@fedora>
In-Reply-To: <c0f34c27-075a-49b1-be44-5b4d9c152ac7@suse.de>
References: <20251015160326.3657287-1-boris.brezillon@collabora.com>
 <20251015160326.3657287-3-boris.brezillon@collabora.com>
 <f89987b9-2df8-45ab-8b53-6a210a30ce50@suse.de>
 <20251016114016.12bb49cd@fedora>
 <c0f34c27-075a-49b1-be44-5b4d9c152ac7@suse.de>
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

On Thu, 16 Oct 2025 11:58:21 +0200
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
> 
> Am 16.10.25 um 11:40 schrieb Boris Brezillon:
> > Hi Thomas,
> >
> > On Thu, 16 Oct 2025 10:32:46 +0200
> > Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >  
> >> Hi,
> >>
> >> on patches 2 to 4: sync is really begin/end access wrapped into one
> >> interface, which I find questionable. I also don't like that these
> >> patches add generic infrastructure for a single driver.  
> > It's actually two drivers (panfrost and panthor), and the interface is
> > here so other drivers relying on drm_gem_shmem don't have to hand-roll
> > these things in the future.  
> 
> Ok.
> 
> But what about the unrelated drivers? Most GEM SHMEM drivers don't need 
> this. Looking at patch 4, there's a for loop over the SG table, which 
> appears to affect all drivers.

It doesn't. First off, this ::sync hook is optional, and if you look at
patch 4's commit message, it says:

"
We provide a drm_gem_shmem_object_sync() for drivers that wants to
have this default implementation as their drm_gem_object_funcs::sync,
but we don't set drm_gem_shmem_funcs::sync to
drm_gem_shmem_object_sync() to avoid changing the behavior of drivers
currently relying on the default gem_shmem vtable.
"

> 
> You know, there are two types of GEM SHMEM users. The ones like panthor 
> that build upon it with additional features. And the other type that 
> only use it as simple buffer storage. The former type what's building 
> blocks to combine as needed; that latter (actually the majority) wants a 
> simple solution. And TBH, I've considered spitting GEM SHMEM into two 
> for this reason.

That's the very reason I don't force

	::sync = drm_gem_shmem_sync

but leave it to each driver to decide whether they want it or not.

> 
> >  
> >> My proposal is to make your own dma_buf exporter in panthor and set the
> >> begin/end_cpu_access functions as you need. Panthor already contains its
> >> own GEM export helper at [1]. If you inline drm_gem_prime_export() [2]
> >> you can set the cpu_access callbacks to panthor-specific code. The other
> >> dma-buf helpers' symbols should be exported and can be re-used. That is
> >> a lot less intrusive and should provide what you need.  
> > I can of course do that in panthor, but then I'll have to duplicate
> > the same logic in panfrost. Also, the whole point of making it generic
> > is so that people don't forget that begin/end_cpu_access() is a thing
> > they should consider (like happened to me if you look at v2 of this
> > patchset), otherwise importers of their buffers might have unpleasant
> > side effects because of missing flush/invalidates. This, IMHO, is a good
> > reason to have it as a drm_gem_funcs::sync() callback. That, or we
> > decide that the default dma_buf_ops is not a thing, and we force
> > developers to think twice when they select the default hooks to pick
> > for their dma_buf implementation.  
> 
> See my comment above. Panthor and panfrost should treat GEM SHMEM like a 
> set of building blocks rather and a full solution.

That's exactly what it does. Panfrost/Panthor have their own
drm_gem_object_funcs, they just use the default drm_gem_shmem_sync
implementation provided by this patch, that's all. And yes,
hand-rolling your own drm_prime implem is not only annoying, it's also
error prone because some of the gem_shmem helpers [1] might rely on
drm_gem_is_prime_exported_dma_buf(), which checks the dma_buf ops
against the default drm_prime implementation.

> 
> >  
> >> I found that a hand full of other DRM drivers implement dma-buf's
> >> begin/end access callbacks. If you want a generic begin/end interface
> >> for GEM, you certainly want to get them on board. If there's something
> >> common to share, this should be done in a separate series.  
> > Fair enough. I'll try to convert freedreno and imagination to this new
> > interface, and gather some feedback.  
> 
> I did 'git grep \.begin_cpu_access' in the drm directory. This returned, 
> amdgpu, i915, tegra, omap, and xe. These where the ones I had in mind.

Hm, so tegra/omap should be relatively easy, but I'm reluctant to touch
the big drivers here (amdgpu, i915 and xe). Because it's an opt-in, and
because these drivers already have hand-rolled these dma_buf_ops, I'd
rather let their owners deal with the transition if they want to. IOW,
if you ask me to find new users, I'd like to focus on relatively small
drivers, and primarily those relying on drm_gem_shmem already. Note
that there might be drivers lacking a {begin,end}_cpu_access()
implementation, but don't know it, because there's very few use cases
where GPU is the exporter and the importer is not the same GPU device.
The other reason would be that most drivers relying on gem_shmem set
::map_wc=true unconditionally (CPU mappings are not cached, and thus
don't require synchronization), or just that those devices are IO
coherent.

Honestly, I'm not too sure why this is a problem if this hook is
optional. If it turns out to be too simple for more complex use cases
others have, it can still be extended when those drivers transition to
this ::sync() approach, as no in-kernel API is immutable. And in the
meantime, we have a solution for two drivers that doesn't imply
duplicating a bunch of drm_prime boiler-plate that's otherwise rather
generic.

[1]https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_gem_shmem_helper.c#L825
