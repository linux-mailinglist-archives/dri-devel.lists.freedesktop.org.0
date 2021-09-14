Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E04740B36E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 17:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FF66E50D;
	Tue, 14 Sep 2021 15:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6386E50D;
 Tue, 14 Sep 2021 15:47:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="220164755"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="220164755"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 08:41:55 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="528942075"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 08:41:55 -0700
Date: Tue, 14 Sep 2021 08:36:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dave Airlie <airlied@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, john.c.harrison@intel.com
Subject: Re: [PATCH 1/5] drm/i915: Do not define vma on stack
Message-ID: <20210914153656.GA23874@jons-linux-dev-box>
References: <20210914044933.22932-1-matthew.brost@intel.com>
 <20210914044933.22932-2-matthew.brost@intel.com>
 <CAPM=9tzHmYkf_y2W_1TO2MPeohFQ9MzkTD1s0gmpNgLcWbX1NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9tzHmYkf_y2W_1TO2MPeohFQ9MzkTD1s0gmpNgLcWbX1NA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Sep 14, 2021 at 03:04:59PM +1000, Dave Airlie wrote:
> On Tue, 14 Sept 2021 at 14:55, Matthew Brost <matthew.brost@intel.com> wrote:
> >
> > From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> >
> > Defining vma on stack can cause stack overflow, if
> > vma gets populated with new fields.
> 
> Is there some higher level locking stopping that from getting trashed?
> or a guarantee that uc_fw_bind_ggtt is only entered by one thread at a
> time?
> 

I believe this function is only called during driver load (inherently
one thread) or during a GT reset (protected by reset mutex) so at most 1
thread can be executing this code at once, thus it is safe to use a
global dummy vma in this function.

Matt

> Dave.
> 
> >
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 +++++++++---------
> >  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h |  2 ++
> >  2 files changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > index 3a16d08608a5..f632dbd32b42 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > @@ -413,20 +413,20 @@ static void uc_fw_bind_ggtt(struct intel_uc_fw *uc_fw)
> >  {
> >         struct drm_i915_gem_object *obj = uc_fw->obj;
> >         struct i915_ggtt *ggtt = __uc_fw_to_gt(uc_fw)->ggtt;
> > -       struct i915_vma dummy = {
> > -               .node.start = uc_fw_ggtt_offset(uc_fw),
> > -               .node.size = obj->base.size,
> > -               .pages = obj->mm.pages,
> > -               .vm = &ggtt->vm,
> > -       };
> > +       struct i915_vma *dummy = &uc_fw->dummy;
> > +
> > +       dummy->node.start = uc_fw_ggtt_offset(uc_fw);
> > +       dummy->node.size = obj->base.size;
> > +       dummy->pages = obj->mm.pages;
> > +       dummy->vm = &ggtt->vm;
> >
> >         GEM_BUG_ON(!i915_gem_object_has_pinned_pages(obj));
> > -       GEM_BUG_ON(dummy.node.size > ggtt->uc_fw.size);
> > +       GEM_BUG_ON(dummy->node.size > ggtt->uc_fw.size);
> >
> >         /* uc_fw->obj cache domains were not controlled across suspend */
> > -       drm_clflush_sg(dummy.pages);
> > +       drm_clflush_sg(dummy->pages);
> >
> > -       ggtt->vm.insert_entries(&ggtt->vm, &dummy, I915_CACHE_NONE, 0);
> > +       ggtt->vm.insert_entries(&ggtt->vm, dummy, I915_CACHE_NONE, 0);
> >  }
> >
> >  static void uc_fw_unbind_ggtt(struct intel_uc_fw *uc_fw)
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > index 99bb1fe1af66..693cc0ebcd63 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > @@ -10,6 +10,7 @@
> >  #include "intel_uc_fw_abi.h"
> >  #include "intel_device_info.h"
> >  #include "i915_gem.h"
> > +#include "i915_vma.h"
> >
> >  struct drm_printer;
> >  struct drm_i915_private;
> > @@ -75,6 +76,7 @@ struct intel_uc_fw {
> >         bool user_overridden;
> >         size_t size;
> >         struct drm_i915_gem_object *obj;
> > +       struct i915_vma dummy;
> >
> >         /*
> >          * The firmware build process will generate a version header file with major and
> > --
> > 2.32.0
> >
