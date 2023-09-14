Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBFD7A0B53
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 19:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920E110E14F;
	Thu, 14 Sep 2023 17:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886D110E14F;
 Thu, 14 Sep 2023 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694711596; x=1726247596;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=hXDLnajAC9C8Lt2Tm2ZtraXXd2NPCGNy9854iqGHBv8=;
 b=iai4Q8HWZYJGMnbeBqqULE0cX0BVyMaMpxlc5Li8H6aeJ1e9UbpqHkV7
 pOYsK7wFSKR9j752u4lEJbzQKm67CVVLWUtYB/yiUXNG3iBdzHDVKmhKI
 ClJXhGlyHqFQeClcHfroEAadCO3UmnsFnkUfjS5NmtajW8aa5VQ/cEKL8
 XEbZGJ9uFIlKztYYEtsS14+mpa1cdl5vJm6FEQUbqD9HacNsPmjOxPm9L
 yTBo2UmiRAVmJmiSzzpwRpksktgKDdjF51oGoUrxTWMPj4KHtF8UKt7if
 I/+X4JKaE16vQ02MiCTI8trTIMRPcaqchfOX0SlUSKr0GiqBA9s1k62Dn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="377929248"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="377929248"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 10:13:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859786905"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="859786905"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.49])
 ([10.249.254.49])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 10:13:04 -0700
Message-ID: <7c8c606dbf515bfe9aa3dc3ed6c23ae00d84ef9d.camel@linux.intel.com>
Subject: Re: [Nouveau] [PATCH drm-misc-next v3 6/7] drm/gpuvm: generalize
 dma_resv/extobj handling and GEM validation
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Date: Thu, 14 Sep 2023 19:13:02 +0200
In-Reply-To: <bdca7ebe-bc65-1db1-a247-490286a31307@redhat.com>
References: <20230909153125.30032-1-dakr@redhat.com>
 <20230909153125.30032-7-dakr@redhat.com>
 <a9ef04d2-2525-65c0-2eda-45ca9a95a3a0@linux.intel.com>
 <ZQCW6wzHYVdxl/IV@pollux>
 <701dfead-e240-b3fb-422c-d49fc7e04595@linux.intel.com>
 <ZQD2FFLP28bFgHXT@pollux>
 <cbff08ca845655dee44fbf498cdb37a3d5251bf3.camel@linux.intel.com>
 <ZQGoNovGz/4Y3xvf@pollux> <ef29b21d-157c-ead7-4b09-edf763d1f8b0@redhat.com>
 <e8b9a298-d4ea-9ee7-69fe-eb8ea1f9dc3d@linux.intel.com>
 <bdca7ebe-bc65-1db1-a247-490286a31307@redhat.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: matthew.brost@intel.com, sarah.walker@imgtec.com,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2023-09-14 at 17:27 +0200, Danilo Krummrich wrote:
> On 9/14/23 13:32, Thomas Hellstr=C3=B6m wrote:
> >=20
> > On 9/14/23 12:57, Danilo Krummrich wrote:
> > > On 9/13/23 14:16, Danilo Krummrich wrote:
> > >=20
> > > <snip>
> > >=20
> > > > > > And validate() can remove it while still holding all dma-
> > > > > > resv locks,
> > > > > > neat!
> > > > > > However, what if two tasks are trying to lock the VA space
> > > > > > concurrently? What
> > > > > > do we do when the drm_gpuvm_bo's refcount drops to zero in
> > > > > > drm_gpuva_unlink()?
> > > > > > Are we guaranteed that at this point of time the
> > > > > > drm_gpuvm_bo is not
> > > > > > on the
> > > > > > evicted list? Because otherwise we would call
> > > > > > drm_gpuvm_bo_destroy()
> > > > > > with the
> > > > > > dma-resv lock held, which wouldn't be allowed, since
> > > > > > drm_gpuvm_bo_destroy()
> > > > > > might drop the last reference to the drm_gem_object and
> > > > > > hence we'd
> > > > > > potentially
> > > > > > free the dma-resv lock while holding it, at least if it's
> > > > > > an external
> > > > > > object.
> > > > >=20
> > > > > Easiest way in this scheme is to think of the lists as being
> > > > > protected
> > > > > by the vm's resv lock. That means anybody calling unlink()
> > > > > must also
> > > > > hold the vm's resv lock. (Which is OK from an UAF point of
> > > > > view, but
> > > > > perhaps not from a locking inversion POW from an async list
> > > > > update).
> > > >=20
> > > > This would mean that on unlink() we'd need to hold the VM's
> > > > resv lock and the
> > > > corresponding GEM's resv lock (in case they're not the same
> > > > anyways) because the
> > > > VM's resv lock would protect the external / evicted object
> > > > lists and the GEM
> > > > objects resv lock protects the GEM's list of drm_gpuvm_bos and
> > > > the
> > > > drm_gpuvm_bo's list of drm_gpuvas.
> > >=20
> > > As mentioned below the same applies for drm_gpuvm_bo_put() since
> > > it might
> > > destroy the vm_bo, which includes removing the vm_bo from
> > > external / evicted
> > > object lists and the GEMs list of vm_bos.
> > >=20
> > > As mentioned, if the GEM's dma-resv is different from the VM's
> > > dma-resv we need
> > > to take both locks. Ultimately, this would mean we need a
> > > drm_exec loop, because
> > > we can't know the order in which to take these locks. Doing a
> > > full drm_exec loop
> > > just to put() a vm_bo doesn't sound reasonable to me.
> > >=20
> > > Can we instead just have an internal mutex for locking the lists
> > > such that we
> > > avoid taking and dropping the spinlocks, which we use currently,
> > > in a loop?
> >=20
> > You'd have the same locking inversion problem with a mutex, right?
> > Since in the eviction path you have resv->mutex, from exec you have
> > resv->mutex->resv because validate would attempt to grab resv.
>=20
> Both lists, evict and extobj, would need to have a separate mutex,
> not a common one.
> We'd also need a dedicated GEM gpuva lock. Then the only rule would
> be that you can't
> hold the dma-resv lock when calling put(). Which I admit is not that
> nice.
>=20
> With the current spinlock solution drivers wouldn't need to worry
> about anything locking
> related though. So maybe I come back to your proposal of having a
> switch for external
> locking with dma-resv locks entirely. Such that with external dma-
> resv locking I skip
> all the spinlocks and add lockdep checks instead.
>=20
> I think that makes the most sense in terms of taking advantage of
> external dma-resv locking
> where possible and on the other hand having a self-contained solution
> if not. This should
> get all concerns out of the way, yours, Christian's and Boris'.

If we need additional locks yes, I'd prefer the opt-in/opt-out spinlock
solution, and check back after a while to see if we can remove either
option once most pitfalls are hit.

Thanks,
/Thomas


>=20
> >=20
> > That said, xe currently indeed does the vm+bo exec dance on vma
> > put.
> >=20
> > One reason why that seemingly horrible construct is good, is that
> > when evicting an extobj and you need to access individual vmas to
> > Zap page table entries or TLB flush, those VMAs are not allowed to
> > go away (we're not refcounting them). Holding the bo resv on gpuva
> > put prevents that from happening. Possibly one could use another
> > mutex to protect the gem->vm_bo list to achieve the same, but we'd
> > need to hold it on gpuva put.
> >=20
> > /Thomas
> >=20
> >=20
> > >=20
> > > - Danilo
> > >=20
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > > >=20
> > > > > > > > For extobjs an outer lock would be enough in case of
> > > > > > > > Xe, but I
> > > > > > > > really would not
> > > > > > > > like to add even more complexity just to get the
> > > > > > > > spinlock out of
> > > > > > > > the way in case
> > > > > > > > the driver already has an outer lock protecting this
> > > > > > > > path.
> > > > > > >=20
> > > > > > > I must disagree here. These spinlocks and atomic
> > > > > > > operations are
> > > > > > > pretty
> > > > > > > costly and as discussed earlier this type of locking was
> > > > > > > the reason
> > > > > > > (at
> > > > > > > least according to the commit message) that made
> > > > > > > Christian drop the
> > > > > > > XArray
> > > > > > > use in drm_exec for the same set of objects: "The locking
> > > > > > > overhead
> > > > > > > is
> > > > > > > unecessary and measurable". IMHO the spinlock is the
> > > > > > > added
> > > > > > > complexity and a
> > > > > > > single wide lock following the drm locking guidelines set
> > > > > > > out by
> > > > > > > Daniel and
> > > > > > > David should really be the default choice with an opt-in
> > > > > > > for a
> > > > > > > spinlock if
> > > > > > > needed for async and pushing out to a wq is not an
> > > > > > > option.
> > > > > >=20
> > > > > > For the external object list an outer lock would work as
> > > > > > long as it's
> > > > > > not the
> > > > > > dma-resv lock of the corresponding GEM object, since here
> > > > > > we actually
> > > > > > need to
> > > > > > remove the list entry from the external object list on
> > > > > > drm_gpuvm_bo_destroy().
> > > > > > It's just a bit weird design wise that drivers would need
> > > > > > to take
> > > > > > this outer
> > > > > > lock on:
> > > > > >=20
> > > > > > - drm_gpuvm_bo_extobj_add()
> > > > > > - drm_gpuvm_bo_destroy()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0(and hence also
> > > > > > drm_gpuvm_bo_put())
> > > > > > - drm_gpuva_unlink()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(because it needs to call
> > > > > > drm_gpuvm_bo_put())
> > > > > > - drm_gpuvm_exec_lock()
> > > > > > - drm_gpuvm_exec_lock_array()
> > > > > > - drm_gpuvm_prepare_range()
> > > > > >=20
> > > > > > Given that it seems reasonable to do all the required
> > > > > > locking
> > > > > > internally.
> > > > >=20
> > > > > =C2=A0From a design POW, there has been a clear direction in XE t=
o
> > > > > make
> > > > > things similar to mmap() / munmap(), so this outer lock,
> > > > > which in Xe is
> > > > > an rwsem, is used in a similar way as the mmap_lock. It's
> > > > > protecting
> > > > > the page-table structures and vma rb tree, the userptr
> > > > > structures and
> > > > > the extobj list. Basically it's taken early in the exec
> > > > > IOCTL, the
> > > > > VM_BIND ioctl, the compute rebind worker and the pagefault
> > > > > handler, so
> > > > > all of the above are just asserting that it is taken in the
> > > > > correct
> > > > > mode.
> > > > >=20
> > > > > But strictly with this scheme one could also use the vm's
> > > > > dma_resv for
> > > > > the extobj list since with drm_exec, it's locked before
> > > > > traversing the
> > > > > list.
> > > > >=20
> > > > > The whole point of this scheme is to rely on locks that you
> > > > > already are
> > > > > supposed to be holding for various reasons and is simple to
> > > > > comprehend.
> > > >=20
> > > > I don't agree that we're supposed to hold the VM's resv lock
> > > > anyways for
> > > > functions like drm_gpuvm_bo_put() or drm_gpuva_unlink(), but
> > > > I'm fine using it
> > > > for that purpose nevertheless.
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > In order to at least place lockdep checks, the driver would
> > > > > > need to
> > > > > > supply the
> > > > > > corresponding lock's lockdep_map, because the GPUVM
> > > > > > otherwise doesn't
> > > > > > know about
> > > > > > the lock.
> > > > >=20
> > > > > Yes, that sounds reasonable. One lockdep map per list.
> > > >=20
> > > > I'd really like to avoid that, especially now that everything
> > > > got simpler. We
> > > > should define the actual locks to take instead.
> > > >=20
> > > > >=20
> > > > > >=20
> > > > > > Out of curiosity, what is the overhead of a spin_lock()
> > > > > > that doesn't
> > > > > > need to
> > > > > > spin?
> > > > >=20
> > > > > I guess it's hard to tell exactly, but it is much lower on
> > > > > modern x86
> > > > > than what it used to be. Not sure about ARM, which is the
> > > > > other
> > > > > architecture important to us. I figure if there is little
> > > > > cache-line
> > > > > bouncing the main overhead comes from the implied barriers.
> > > > >=20
> > > > > >=20
> > > > > > >=20
> > > > > > > A pretty simple way that would not add much code would be
> > > > > > >=20
> > > > > > > static void gpuvm_cond_spin_lock(const struct drm_gpuvm
> > > > > > > *gpuvm,
> > > > > > > spinlock_t
> > > > > > > *lock)
> > > > > > >=20
> > > > > > > {
> > > > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 if (!gpuvm->resv_protected_lists)
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 spin_lock(lock);
> > > > > > >=20
> > > > > > > }
> > > > > > >=20
> > > > > > > > > For such drivers, that would require anybody calling
> > > > > > > > > unlink to
> > > > > > > > > hold the vm's
> > > > > > > > > resv, though.
> > > > > > > > In V4 I want to go back to having a dedicated lock for
> > > > > > > > the GEMs
> > > > > > > > gpuva list (or
> > > > > > > > VM_BO list to be more precise). We can't just use the
> > > > > > > > dma-resv
> > > > > > > > lock for that
> > > > > > > > with VM_BO abstractions, because on destruction of a
> > > > > > > > VM_BO we
> > > > > > > > otherwise wouldn't
> > > > > > > > be allowed to already hold the dma-resv lock. That's
> > > > > > > > the fix I
> > > > > > > > was referring to
> > > > > > > > earlier.
> > > > > > >=20
> > > > > > > Yeah, I can see the need for a dedicated lock for the
> > > > > > > GEM's gpuva
> > > > > > > list, but
> > > > > > > holding the vm's dma-resv lock across the unlink
> > > > > > > shouldn't be a
> > > > > > > problem. We
> > > > > > > may free the object and a pointer to the vm's resv during
> > > > > > > unlink
> > > > > > > but we
> > > > > > > don't free the vm's resv.=C2=A0 It'd be a matter of ensuring
> > > > > > > that any
> > > > > > > calls to
> > > > > > > unlink from *within* drm_gpuvm allows it to be held.
> > > > > >=20
> > > > > > Drivers calling unlink() from the fence signaling path
> > > > > > can't use the
> > > > > > VM's
> > > > > > dma-resv lock.
> > > > >=20
> > > > > Yes, that made me a bit curious because in the current
> > > > > version the code
> > > > > required the object's dma_resv for unlink() which can't be
> > > > > grabbed
> > > > > either from the fence signaling path. So are there any
> > > > > drivers actually
> > > > > wanting to do that? If so, they will either need to resort to
> > > > > the
> > > > > current spinlock solution or they will need to call unlink
> > > > > from a
> > > > > workqueue item.
> > > >=20
> > > > As Boris already mentioned we have the dma-resv lock by default
> > > > or a driver
> > > > specific GEM gpuva lock as opt-in. Now, we can get rid of the
> > > > latter.
> > > >=20
> > > > > >=20
> > > > > > Also, what if the object is an external object? We can't
> > > > > > use the VM's
> > > > > > dma-resv
> > > > > > lock here.
> > > > >=20
> > > > > Why? Typically (sync) unlink is only ever called from an
> > > > > unbind-like
> > > > > operation where it should be trivial to grab the vm's resv.
> > > > > Or, for
> > > > > that matter any outer lock protecting the extobj list. Rule
> > > > > would be
> > > > > the drm_gpuvm_bo::entry::extobj=C2=A0 and
> > > > > drm_gpuvm_bo::entry::evict would
> > > > > be protected by either the vm's dma_resv (or possibly an
> > > > > outer lock in
> > > > > the case of the extobj list).
> > > >=20
> > > > Outer lock wouldn't have been working for updates in the async
> > > > path, but
> > > > shouldn't be relevant anymore. We could use the VM's resv for
> > > > that.
> > > >=20
> > > > >=20
> > > > > > =C2=A0 And we can't have the GEM objs dma-resv lock held when
> > > > > > calling
> > > > > > unlink(), since unlink() calls drm_gpuvm_bo_put(), which if
> > > > > > the
> > > > > > refcount drops
> > > > > > to zero calls drm_gpuvm_bo_destroy() and
> > > > > > drm_gpuvm_bo_destroy() might
> > > > > > drop the
> > > > > > last reference of the GEM object.
> > > > >=20
> > > > > Yes, but this is a different problem as to what exactly
> > > > > protects
> > > > > drm_gpuvm_bo::entry::gem. Either as you suggest an internal
> > > > > per bo list
> > > > > lock, or if we want to keep the bo's dma_resv we need to
> > > > > ensure that
> > > > > the caller of dma_resv_unlock(obj->resv) actually refcounts
> > > > > its obj
> > > > > pointer, and doesn't implicitly rely on the gpuvm_bo's
> > > > > refcount (I know
> > > > > Boris didn't like that, but requiring an explicit refcount
> > > > > for a
> > > > > pointer you dereference unless you're under a lock that
> > > > > ensures keeping
> > > > > the object alive is pretty much required?) But anyway for the
> > > > > drm_gpuvm_bo::entry::gem list protection (bo resv or internal
> > > > > spinlock)
> > > > > I don't have a strong preference.
> > > >=20
> > > > We can keep the GEM objects dma-resv lock, however as mentioned
> > > > above
> > > > drm_gpuva_unlink() and drm_gpuvm_bo_put() then requires both
> > > > the VM's resv lock
> > > > and the GEM's resv lock in case they differ.
> > > >=20
> > >=20
> > > > > > >=20
> > >=20
> >=20
>=20

