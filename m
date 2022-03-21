Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 828FD4E33A6
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 00:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD3C10E49E;
	Mon, 21 Mar 2022 23:04:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DAD10E49E;
 Mon, 21 Mar 2022 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647903894; x=1679439894;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=m8SzTErdYP2nBmq/Gh+5P+6SYLbJImpLQG52rIinCNc=;
 b=YfavRGF/RbbhiOicYSEFHbAAFhIk5s/sFArmTHDdc0iIOC5lQ2XsIxZe
 0NvRQWQ7FkhxLntPUnEONiPZNxvUat8kURsJGTkMMS23f2+Yq4N3nppk8
 x2yf72U+MsGweQElYUJqhoQL8oxcplSTkUJLy25wjiLiQmfoJhCJd1zG9
 mFv5pwzP4veCqN27EG25v5R0XaGFBL7U1xG5DGMe8uGd68nW1VngXBPYG
 NFTNeaabYGZlcy4W70qgSlLEys7KLB+WvhxKFnkY/YlFiPX605FEA4UId
 CsnaRO4rwATUozuqvf7r3KEYgyhUVZ2niXR/roDRknJc5jw6HacCg+doB A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257859704"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="257859704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 16:04:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; d="scan'208";a="692334125"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 16:04:52 -0700
Date: Tue, 22 Mar 2022 04:35:27 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Subject: Re: [PATCH v4 4/8] drm/i915/selftest_migrate: Check CCS meta data
 clear
Message-ID: <20220321230527.GB12356@intel.com>
References: <20220319204229.9846-1-ramalingam.c@intel.com>
 <20220319204229.9846-5-ramalingam.c@intel.com>
 <2ac354b3df30889cc52c10613900467df30f4a47.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2ac354b3df30889cc52c10613900467df30f4a47.camel@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-21 at 16:09:08 +0530, Hellstrom, Thomas wrote:
> On Sun, 2022-03-20 at 02:12 +0530, Ramalingam C wrote:
> > While clearing the Flat-CCS capable lmem object, we need to clear the
> > CCS
> > meta data corresponding to the memory.
> >
> > As part of live_migrate_clear add check for the ccs meta data clear
> > for
> > the Flat-CCS capable lmem object.
> >
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/intel_migrate.c    |  32 +++
> >  drivers/gpu/drm/i915/gt/selftest_migrate.c | 274 ++++++++++++++++++-
> > --
> >  2 files changed, 278 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > index c1db8daf994a..bbfea570c239 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> > @@ -572,6 +572,38 @@ static u32 *_i915_ctrl_surf_copy_blt(u32 *cmd,
> > u64 src_addr, u64 dst_addr,
> >         return cmd;
> >  }
> >
> > +static int emit_copy_ccs(struct i915_request *rq,
> > +                        u32 dst_offset, u8 dst_access,
> > +                        u32 src_offset, u8 src_access, int size)
> > +{
> > +       struct drm_i915_private *i915 = rq->engine->i915;
> > +       int mocs = rq->engine->gt->mocs.uc_index << 1;
> > +       u32 num_ccs_blks, ccs_ring_size;
> > +       u32 *cs;
> > +
> > +       ccs_ring_size = calc_ctrl_surf_instr_size(i915, size);
> > +       WARN_ON(!ccs_ring_size);
> > +
> > +       cs = intel_ring_begin(rq, round_up(ccs_ring_size, 2));
> > +       if (IS_ERR(cs))
> > +               return PTR_ERR(cs);
> > +
> > +       num_ccs_blks = DIV_ROUND_UP(GET_CCS_BYTES(i915, size),
> > +                                   NUM_CCS_BYTES_PER_BLOCK);
> > +
> > +       cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
> > +       cs = _i915_ctrl_surf_copy_blt(cs, src_offset, dst_offset,
> > +                                     src_access, dst_access,
> > +                                     mocs, mocs, num_ccs_blks);
> > +       cs = i915_flush_dw(cs, MI_FLUSH_DW_LLC | MI_FLUSH_DW_CCS);
> > +       if (ccs_ring_size & 1)
> > +               *cs++ = MI_NOOP;
> > +
> > +       intel_ring_advance(rq, cs);
> > +
> > +       return 0;
> > +}
> 
> 
> This would be an unused function if selftests are not configured,
> right?
No Thomas. This is reused between selftest and eviction flow. in next
version i am reusing it for evict_clear too.

> 
> 
> > +
> >  static int emit_copy(struct i915_request *rq,
> >                      u32 dst_offset, u32 src_offset, int size)
> >  {
> > diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > index b5da8b8cd039..e32cc994f4a2 100644
> > --- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > +++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
> > @@ -132,6 +132,126 @@ static int copy(struct intel_migrate *migrate,
> >         return err;
> >  }
> >
> > +static int intel_context_copy_ccs(struct intel_context *ce,
> > +                                 const struct i915_deps *deps,
> > +                                 struct scatterlist *sg,
> > +                                 enum i915_cache_level cache_level,
> > +                                 bool write_to_ccs,
> > +                                 struct i915_request **out)
> > +{
> > +       u8 src_access = write_to_ccs ? DIRECT_ACCESS :
> > INDIRECT_ACCESS;
> > +       u8 dst_access = write_to_ccs ? INDIRECT_ACCESS :
> > DIRECT_ACCESS;
> > +       struct sgt_dma it = sg_sgt(sg);
> > +       struct i915_request *rq;
> > +       u32 offset;
> > +       int err;
> > +
> > +       GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
> > +       *out = NULL;
> > +
> > +       GEM_BUG_ON(ce->ring->size < SZ_64K);
> > +
> > +       offset = 0;
> > +       if (HAS_64K_PAGES(ce->engine->i915))
> > +               offset = CHUNK_SZ;
> > +       offset += (u64)rq->engine->instance << 32;
> > +
> > +       do {
> > +               int len;
> > +
> > +               rq = i915_request_create(ce);
> > +               if (IS_ERR(rq)) {
> > +                       err = PTR_ERR(rq);
> > +                       goto out_ce;
> > +               }
> > +
> > +               if (deps) {
> > +                       err = i915_request_await_deps(rq, deps);
> > +                       if (err)
> > +                               goto out_rq;
> > +
> > +                       if (rq->engine->emit_init_breadcrumb) {
> > +                               err = rq->engine-
> > >emit_init_breadcrumb(rq);
> > +                               if (err)
> > +                                       goto out_rq;
> > +                       }
> > +
> > +                       deps = NULL;
> > +               }
> > +
> > +               /* The PTE updates + clear must not be interrupted.
> > */
> > +               err = emit_no_arbitration(rq);
> > +               if (err)
> > +                       goto out_rq;
> > +
> > +               len = emit_pte(rq, &it, cache_level, true, offset,
> > CHUNK_SZ);
> > +               if (len <= 0) {
> > +                       err = len;
> > +                       goto out_rq;
> > +               }
> > +
> > +               err = rq->engine->emit_flush(rq, EMIT_INVALIDATE);
> > +               if (err)
> > +                       goto out_rq;
> > +
> > +               err = emit_copy_ccs(rq, offset, dst_access,
> > +                                   offset, src_access, len);
> > +               if (err)
> > +                       goto out_rq;
> > +
> > +               err = rq->engine->emit_flush(rq, EMIT_INVALIDATE |
> > +                                            MI_FLUSH_DW_CCS);
> > +
> > +               /* Arbitration is re-enabled between requests. */
> > +out_rq:
> > +               if (*out)
> > +                       i915_request_put(*out);
> > +               *out = i915_request_get(rq);
> > +               i915_request_add(rq);
> > +               if (err || !it.sg || !sg_dma_len(it.sg))
> > +                       break;
> > +
> > +               cond_resched();
> > +       } while (1);
> > +
> > +out_ce:
> > +       return err;
> > +}
> > +
> > +static int
> > +intel_migrate_ccs_copy(struct intel_migrate *m,
> > +                      struct i915_gem_ww_ctx *ww,
> > +                      const struct i915_deps *deps,
> > +                      struct scatterlist *sg,
> > +                      enum i915_cache_level cache_level,
> > +                      bool write_to_ccs,
> > +                      struct i915_request **out)
> > +{
> > +       struct intel_context *ce;
> > +       int err;
> > +
> > +       *out = NULL;
> > +       if (!m->context)
> > +               return -ENODEV;
> > +
> > +       ce = intel_migrate_create_context(m);
> > +       if (IS_ERR(ce))
> > +               ce = intel_context_get(m->context);
> > +       GEM_BUG_ON(IS_ERR(ce));
> > +
> > +       err = intel_context_pin_ww(ce, ww);
> > +       if (err)
> > +               goto out;
> > +
> > +       err = intel_context_copy_ccs(ce, deps, sg, cache_level,
> > +                                    write_to_ccs, out);
> > +
> > +       intel_context_unpin(ce);
> > +out:
> > +       intel_context_put(ce);
> > +       return err;
> > +}
> > +
> >  static int clear(struct intel_migrate *migrate,
> >                  int (*fn)(struct intel_migrate *migrate,
> >                            struct i915_gem_ww_ctx *ww,
> > @@ -144,7 +264,8 @@ static int clear(struct intel_migrate *migrate,
> >         struct drm_i915_gem_object *obj;
> >         struct i915_request *rq;
> >         struct i915_gem_ww_ctx ww;
> > -       u32 *vaddr;
> > +       u32 *vaddr, val = 0;
> > +       bool ccs_cap = false;
> >         int err = 0;
> >         int i;
> >
> > @@ -155,7 +276,12 @@ static int clear(struct intel_migrate *migrate,
> >         /* Consider the rounded up memory too */
> >         sz = obj->base.size;
> >
> > +       if (HAS_FLAT_CCS(i915) && i915_gem_object_is_lmem(obj))
> > +               ccs_cap = true;
> > +
> >         for_i915_gem_ww(&ww, err, true) {
> > +               int ccs_bytes;
> > +
> >                 err = i915_gem_object_lock(obj, &ww);
> >                 if (err)
> >                         continue;
> > @@ -170,44 +296,136 @@ static int clear(struct intel_migrate
> > *migrate,
> >                         vaddr[i] = ~i;
> >                 i915_gem_object_flush_map(obj);
> >
> > -               err = fn(migrate, &ww, obj, sz, &rq);
> > -               if (!err)
> > -                       continue;
> > +               if (ccs_cap && !val) {
> > +                       /* Write the obj data into ccs surface */
> > +                       err = intel_migrate_ccs_copy(migrate, &ww,
> > NULL,
> > +                                                    obj->mm.pages-
> > >sgl,
> > +                                                    obj-
> > >cache_level,
> > +                                                    true, &rq);
> > +                       if (rq && !err) {
> > +                               if (i915_request_wait(rq, 0, HZ) < 0)
> > {
> > +                                       pr_err("%ps timed out, size:
> > %u\n",
> > +                                              fn, sz);
> > +                                       err = -ETIME;
> > +                               }
> > +                               i915_request_put(rq);
> > +                               rq = NULL;
> > +                       }
> > +                       if (err)
> > +                               continue;
> > +
> > +                       for (i = 0; i < sz / sizeof(u32); i++)
> > +                               vaddr[i] = 0x5a5a5a5a;
> > +                       i915_gem_object_flush_map(obj);
> > +
> > +                       err = intel_migrate_ccs_copy(migrate, &ww,
> > NULL, obj->mm.pages->sgl,
> > +                                                    obj-
> > >cache_level, false, &rq);
> 
> Why do we read back CCS content here?
Was rechecking the ccs copy. but this is not needed for real intention.
Removing in next version.
> 
> > +                       if (rq && !err) {
> > +                               if (i915_request_wait(rq, 0, HZ) < 0)
> > {
> > +                                       pr_err("%ps timed out, size:
> > %u\n",
> > +                                              fn, sz);
> > +                                       err = -ETIME;
> > +                               }
> > +                               i915_request_put(rq);
> > +                               rq = NULL;
> > +                       }
> > +                       if (err)
> > +                               continue;
> > +
> > +                       i915_gem_object_flush_map(obj);
> > +                       for (i = 0; !err && i < ccs_bytes; i += 4) {
> > +                               if (vaddr[i] != ~i) {
> > +                                       pr_err("%ps ccs write and
> > read failed, offset: %d\n",
> > +                                              fn, i);
> > +                                       err = -EINVAL;
> > +                               }
> > +                       }
> > +                       if (err)
> > +                               continue;
> > +
> > +                       i915_gem_object_flush_map(obj);
> > +               }
> >
> > -               if (err != -EDEADLK && err != -EINTR && err != -
> > ERESTARTSYS)
> > -                       pr_err("%ps failed, size: %u\n", fn, sz);
> > -               if (rq) {
> > -                       i915_request_wait(rq, 0, HZ);
> > +               err = fn(migrate, &ww, obj, val, &rq);
> > +               if (rq && !err) {
> > +                       if (i915_request_wait(rq, 0, HZ) < 0) {
> > +                               pr_err("%ps timed out, size: %u\n",
> > fn, sz);
> > +                               err = -ETIME;
> > +                       }
> >                         i915_request_put(rq);
> > +                       rq = NULL;
> >                 }
> > -               i915_gem_object_unpin_map(obj);
> > -       }
> > -       if (err)
> > -               goto err_out;
> > +               if (err)
> > +                       continue;
> >
> > -       if (rq) {
> > -               if (i915_request_wait(rq, 0, HZ) < 0) {
> > -                       pr_err("%ps timed out, size: %u\n", fn, sz);
> > -                       err = -ETIME;
> > +               i915_gem_object_flush_map(obj);
> > +
> > +               /* Verify the set/clear of the obj mem */
> > +               for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
> > +                       int x = i * 1024 +
> > +                               i915_prandom_u32_max_state(1024,
> > prng);
> > +
> > +                       if (vaddr[x] != val) {
> > +                               pr_err("%ps failed, (%u != %u),
> > offset: %zu\n",
> > +                                      fn, vaddr[x], val,  x *
> > sizeof(u32));
> > +                               igt_hexdump(vaddr + i * 1024, 4096);
> > +                               err = -EINVAL;
> > +                       }
> >                 }
> > -               i915_request_put(rq);
> > -       }
> > +               if (err)
> > +                       continue;
> >
> > -       for (i = 0; !err && i < sz / PAGE_SIZE; i++) {
> > -               int x = i * 1024 + i915_prandom_u32_max_state(1024,
> > prng);
> > +               if (ccs_cap && !val) {
> > +                       for (i = 0; i < sz / sizeof(u32); i++)
> > +                               vaddr[i] = ~i;
> > +                       i915_gem_object_flush_map(obj);
> > +
> > +                       err = intel_migrate_ccs_copy(migrate, &ww,
> > NULL,
> > +                                                    obj->mm.pages-
> > >sgl,
> > +                                                    obj-
> > >cache_level,
> > +                                                    false, &rq);
> > +                       if (rq && !err) {
> > +                               if (i915_request_wait(rq, 0, HZ) < 0)
> > {
> > +                                       pr_err("%ps timed out, size:
> > %u\n",
> > +                                              fn, sz);
> > +                                       err = -ETIME;
> > +                               }
> > +                               i915_request_put(rq);
> > +                               rq = NULL;
> > +                       }
> > +                       if (err)
> > +                               continue;
> > +
> > +                       ccs_bytes = GET_CCS_BYTES(i915, sz);
> > +                       i915_gem_object_flush_map(obj);
> > +                       for (i = 0; !err && i < ccs_bytes /
> > sizeof(u32); i++) {
> > +                               if (vaddr[i]) {
> 
> I think this is incorrect. This assumes that CCS data is read back
> contiguous for the whole buffer, but instead CCS data is read back
> per 8MiB chunk and placed at the beginning of each chunk?

Yes. This is the source for the problem I was discussing with you. Fixed
it in the next version. Please share your feedback. could have used a
dedicated obj for ccs, but just calculated the offset of the ccs bytes.

Ram
> 
> /Thomas
> 
> 
> 
> > +                                       pr_err("%ps ccs clearing
> > failed, offset: %d/%lu\n",
> > +                                              fn, i, (ccs_bytes /
> > sizeof(u32)) -  1);
> > +                                       igt_hexdump(vaddr + i,
> > ccs_bytes - i * sizeof(u32));
> > +                                       err = -EINVAL;
> > +                               }
> > +                       }
> > +                       if (err)
> > +                               continue;
> > +               }
> > +               i915_gem_object_unpin_map(obj);
> > +       }
> >
> > -               if (vaddr[x] != sz) {
> > -                       pr_err("%ps failed, size: %u, offset: %zu\n",
> > -                              fn, sz, x * sizeof(u32));
> > -                       igt_hexdump(vaddr + i * 1024, 4096);
> > -                       err = -EINVAL;
> > +       if (err) {
> > +               if (err != -EDEADLK && err != -EINTR && err != -
> > ERESTARTSYS)
> > +                       pr_err("%ps failed, size: %u\n", fn, sz);
> > +               if (rq && err != -EINVAL) {
> > +                       i915_request_wait(rq, 0, HZ);
> > +                       i915_request_put(rq);
> >                 }
> > +
> > +               i915_gem_object_unpin_map(obj);
> > +       } else {
> > +               pr_debug("%ps Passed. size: %u\n", fn, sz);
> >         }
> >
> > -       i915_gem_object_unpin_map(obj);
> > -err_out:
> >         i915_gem_object_put(obj);
> > -
> >         return err;
> >  }
> >
> 
