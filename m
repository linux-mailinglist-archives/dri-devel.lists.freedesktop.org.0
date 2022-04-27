Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F085114BE
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 12:14:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF8B10EB29;
	Wed, 27 Apr 2022 10:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF3A10EB25;
 Wed, 27 Apr 2022 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651054448; x=1682590448;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4o0UHgvGu8OD3M/sb8BWbyJCu2+OXfzKJRyCZAr6T9Q=;
 b=blpeQIrjnQV9LdJdy2hLiNjQHVL1LApl5RYh0wEOWNlUk2JewS79Fnpx
 ZF6f7AYZDzBfcLNe9cim+SUZ5+QCuNgl8AqIzI6hb29DQBdb9CCHCc4Uz
 Bp63HbOLKxidKgrOSwbs2WlPsC5INNDuCwUrkAGkhDhWeH5zp4Tph2CLa
 NVhJs0/G6OWfOLiZ3GyTmRzyWj6LvJr2h87Q7WCe9M2QREaFuGg7oswcV
 82dbmw5hrY7vcoAdwYQVWlRU5yFZECTs0eJ+QpCJC6cwPMMGcxTZsb7oh
 53T5Ltpbc/GHQNhgzjueOa6g80+Y4pel/gY9unt+nO8Ww1K2CrE4wYbht g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="266044010"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="266044010"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 03:14:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="596214496"
Received: from apiotrox-mobl.ger.corp.intel.com (HELO [10.249.254.91])
 ([10.249.254.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 03:14:02 -0700
Message-ID: <8c4494b2b4c0d1017219d1d75f98fcbba4c6f72d.camel@linux.intel.com>
Subject: Re: [PATCH v2 4/5] drm/i915: ttm backend dont provide mmap_offset
 for kernel buffers
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Robert Beckett <bob.beckett@collabora.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Jani
 Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 27 Apr 2022 12:14:00 +0200
In-Reply-To: <cc56e644-f20f-27ae-7a21-e40c173dfe1e@collabora.com>
References: <20220412151838.1298956-1-bob.beckett@collabora.com>
 <20220412151838.1298956-5-bob.beckett@collabora.com>
 <07e5b1dc442e0b318ee0314f90a433216ed38dcb.camel@linux.intel.com>
 <cc56e644-f20f-27ae-7a21-e40c173dfe1e@collabora.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-3.fc34) 
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
Cc: Matthew Auld <matthew.auld@intel.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry for late reply,

On Thu, 2022-04-14 at 17:13 +0100, Robert Beckett wrote:
> 
> 
> On 14/04/2022 15:05, Thomas Hellström wrote:
> > On Tue, 2022-04-12 at 15:18 +0000, Robert Beckett wrote:
> > > stolen/kernel buffers should not be mmapable by userland.
> > > do not provide callbacks to facilitate this for these buffers.
> > > 
> > > Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> > > ---
> > >   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 32
> > > +++++++++++++++++++++--
> > > --
> > >   1 file changed, 27 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > index a878910a563c..b20f81836c54 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> > > @@ -1092,8 +1092,8 @@ static void i915_ttm_unmap_virtual(struct
> > > drm_i915_gem_object *obj)
> > >          ttm_bo_unmap_virtual(i915_gem_to_ttm(obj));
> > >   }
> > >   
> > > -static const struct drm_i915_gem_object_ops i915_gem_ttm_obj_ops
> > > = {
> > > -       .name = "i915_gem_object_ttm",
> > > +static const struct drm_i915_gem_object_ops
> > > i915_gem_ttm_user_obj_ops = {
> > > +       .name = "i915_gem_object_ttm_user",
> > >          .flags = I915_GEM_OBJECT_IS_SHRINKABLE |
> > >                   I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
> > >   
> > > @@ -1111,6 +1111,21 @@ static const struct
> > > drm_i915_gem_object_ops
> > > i915_gem_ttm_obj_ops = {
> > >          .mmap_ops = &vm_ops_ttm,
> > >   };
> > >   
> > > +static const struct drm_i915_gem_object_ops
> > > i915_gem_ttm_kern_obj_ops = {
> > > +       .name = "i915_gem_object_ttm_kern",
> > > +       .flags = I915_GEM_OBJECT_IS_SHRINKABLE |
> > > +                I915_GEM_OBJECT_SELF_MANAGED_SHRINK_LIST,
> > > +
> > > +       .get_pages = i915_ttm_get_pages,
> > > +       .put_pages = i915_ttm_put_pages,
> > > +       .truncate = i915_ttm_truncate,
> > > +       .shrink = i915_ttm_shrink,
> > > +
> > > +       .adjust_lru = i915_ttm_adjust_lru,
> > > +       .delayed_free = i915_ttm_delayed_free,
> > > +       .migrate = i915_ttm_migrate,
> > > +};
> > 
> > Do we really need two different ops here?
> > 
> > Since if we don't have mmap ops, basically that tells GEM it should
> > do
> > the mmapping rather than TTM.
> > 
> > That might of course come in handy for the shmem backend, but I
> > don't
> > fully follow why we need this for stolen.
> 
> the main rationale for doing this was to avoid 
> drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c:can_mmap()
> presuming 
> that is can use I915_MMAP_TYPE_FIXED
> 
> As the original backend also did not have mmap_offset handlers for 
> stolen, this seemed like a reasonable design.
> 
> If desired, we could add a special case for the testing logic, but
> those 
> special cases have tendency to multiply.
> 
> > 
> > Also for the framebuffer handed over from BIOS to fbdev, Does that
> > need
> > mmapping and if so, how do we handle that?
> > 
> 
> I'm not sure of the usecase there. Do you know of any igt test that 
> tests this? I can investigate further if you do not.

It would be if we the fbdev driver at startup inherits some image that
bios has preloaded into stolen, and then a client tries to write into
it. Not sure that this is a real use case though, or whether, in that
case, that takes a separate path for user-space mappings.

/Thomas



> 
> > 
> > /Thomas
> > 
> > 
> > 
> > 
> > > +
> > >   void i915_ttm_bo_destroy(struct ttm_buffer_object *bo)
> > >   {
> > >          struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
> > > @@ -1165,10 +1180,19 @@ int __i915_gem_ttm_object_init(struct
> > > intel_memory_region *mem,
> > >                  .no_wait_gpu = false,
> > >          };
> > >          enum ttm_bo_type bo_type;
> > > +       const struct drm_i915_gem_object_ops *ops;
> > >          int ret;
> > >   
> > >          drm_gem_private_object_init(&i915->drm, &obj->base,
> > > size);
> > > -       i915_gem_object_init(obj, &i915_gem_ttm_obj_ops,
> > > &lock_class,
> > > flags);
> > > +
> > > +       if (flags & I915_BO_ALLOC_USER &&
> > > intel_region_to_ttm_type(mem) != I915_PL_STOLEN) {
> > > +               bo_type = ttm_bo_type_device;
> > > +               ops = &i915_gem_ttm_user_obj_ops;
> > > +       } else {
> > > +               bo_type = ttm_bo_type_kernel;
> > > +               ops = &i915_gem_ttm_kern_obj_ops;
> > > +       }
> > > +       i915_gem_object_init(obj, ops, &lock_class, flags);
> > >   
> > >          obj->bo_offset = offset;
> > >   
> > > @@ -1178,8 +1202,6 @@ int __i915_gem_ttm_object_init(struct
> > > intel_memory_region *mem,
> > >   
> > >          INIT_RADIX_TREE(&obj->ttm.get_io_page.radix, GFP_KERNEL
> > > |
> > > __GFP_NOWARN);
> > >          mutex_init(&obj->ttm.get_io_page.lock);
> > > -       bo_type = (obj->flags & I915_BO_ALLOC_USER) ?
> > > ttm_bo_type_device :
> > > -               ttm_bo_type_kernel;
> > >   
> > >          obj->base.vma_node.driver_private =
> > > i915_gem_to_ttm(obj);
> > >   
> > 
> > 


