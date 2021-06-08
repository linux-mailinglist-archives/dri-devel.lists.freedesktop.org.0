Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398A39F329
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 12:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A092D6E056;
	Tue,  8 Jun 2021 10:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3F6E056;
 Tue,  8 Jun 2021 10:06:25 +0000 (UTC)
IronPort-SDR: eNJVQ8LEr65BNkHWe+nbA4DO/JVsD5TnPRrr+WXN/di8nO9ASUO0HkOpiM2hLCs/7puXYjO8ME
 S87VRuaEcXmQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="204780515"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="204780515"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 03:06:24 -0700
IronPort-SDR: 7Zwm7XbS0ZQ0e+Sb6HaPhfePXTkd39+Cw9VXSri9KiB5B7XxxLV767xCGmFrUDs7PWJql6X7qn
 atkgTyhlykHg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="447842655"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.115])
 ([10.249.254.115])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 03:06:23 -0700
Message-ID: <af3f336696d4c07cf4c3761f4ac9d5c2702354fb.camel@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem/mman: only allow WC for lmem
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 08 Jun 2021 12:06:20 +0200
In-Reply-To: <f009f03e-ec03-e180-ac25-fff2e0ceb856@intel.com>
References: <20210602093636.167070-1-matthew.auld@intel.com>
 <3af30ebb-a46b-2b21-57b0-988b2400ac08@linux.intel.com>
 <f009f03e-ec03-e180-ac25-fff2e0ceb856@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-06-08 at 10:57 +0100, Matthew Auld wrote:
> On 02/06/2021 13:00, Thomas Hellström wrote:
> > Hi,
> > 
> > On 6/2/21 11:36 AM, Matthew Auld wrote:
> > > For dgfx where we now have lmem and ttm, we can only support
> > > single mmap
> > > mode for the lifetime of the object, and for lmem objects this
> > > should be
> > > WC, so reject all other mapping modes for mmap_offset, including
> > > if the
> > > object can be placed in both smem and lmem.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_mman.c   |  4 ++++
> > >   drivers/gpu/drm/i915/gem/i915_gem_object.c | 22
> > > ++++++++++++++++++++++
> > >   drivers/gpu/drm/i915/gem/i915_gem_object.h |  4 ++++
> > >   3 files changed, 30 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c 
> > > b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > index fd1c9714f8d8..32f88f236771 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -689,6 +689,10 @@ __assign_mmap_offset(struct drm_file *file,
> > >           goto out;
> > >       }
> > > +    if (mmap_type != I915_MMAP_TYPE_WC &&
> > > +        i915_gem_object_placements_contain_type(obj, 
> > > INTEL_MEMORY_LOCAL))
> > > +        return -ENODEV;
> > > +
> > 
> > I think we will also have the restriction that any other objects on
> > DGFX 
> > can only be mapped cached? At least that's what the TTM code is 
> > implementing currently.
> 
> Yeah, with this patch the caching mode should now at least be
> consistent 
> for lmem objects, for smem we still need more patches.
> 
> > 
> > 
> > >       mmo = mmap_offset_attach(obj, mmap_type, file);
> > >       if (IS_ERR(mmo)) {
> > >           err = PTR_ERR(mmo);
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
> > > b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > index 2be6109d0093..d4b0da8ed969 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
> > > @@ -403,6 +403,28 @@ int i915_gem_object_read_from_page(struct 
> > > drm_i915_gem_object *obj, u64 offset,
> > >       return 0;
> > >   }
> > > +/**
> > > + * i915_gem_object_placements_contain_type - Check whether the
> > > object 
> > > can be
> > > + * placed at certain memory type
> > > + * @obj: Pointer to the object
> > > + * @type: The memory type to check
> > > + *
> > > + * Return: True if the object can be placed in @type. False
> > > otherwise.
> > > + */
> > > +bool i915_gem_object_placements_contain_type(struct 
> > > drm_i915_gem_object *obj,
> > > +                         enum intel_memory_type type)
> > > +{
> > > +    unsigned int i;
> > > +
> > > +    /* TODO: consider maybe storing as a mask when doing 
> > > gem_create_ext */
> > > +    for (i = 0; i < obj->mm.n_placements; i++) {
> > > +        if (obj->mm.placements[i]->type == type)
> > > +            return true;
> > > +    }
> > > +
> > > +    return false;
> > > +}
> > > +
> > 
> > Do we need something for the in-kernel mappings as well? Or just
> > return 
> > a mapping with the only allowed caching mode?
> 
> For lmem everything should already be WC for in-kernel mappings. For 
> everything else which uses pin_map() we will need to default to
> cached. 
> I guess just add a different helper for this? We should probably also
> adjust the obj->cache_level for dg1.

Note that objects that have LMEM in the allowed placement list, but are
migrated to SMEM for some reason (we haven't really decided the policy
for this yet, but perhaps for dma-buf export reasons or just being
evicted with smem as an allowable placement) will still be WC-only,
which was Daniel's recommendation to begin with, (but we can flip
caching mode on eviction / migration if we'd want to).

Currently we don't flip GEM region when evicting even if SMEM is an
allowed placement, because the object may then end up stuck in SMEM.
Not sure if we want to expose a user-space madvise-type hint for this? 

/Thomas

> 
> > 
> > /Thomas
> > 
> > 


