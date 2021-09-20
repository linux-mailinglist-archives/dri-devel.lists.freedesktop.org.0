Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EAF41134D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 13:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551316E4A7;
	Mon, 20 Sep 2021 11:05:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8EE6E491;
 Mon, 20 Sep 2021 11:05:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="245512346"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="245512346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 04:05:09 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="473750351"
Received: from ntaiyeby-mobl1.ger.corp.intel.com (HELO [10.249.254.68])
 ([10.249.254.68])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 04:05:08 -0700
Message-ID: <dad2ffb155fb971d454ebd469f252892357a88ab.camel@linux.intel.com>
Subject: Re: [PATCH v3 3/6] drm/i915 Implement LMEM backup and restore for
 suspend / resume
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Date: Mon, 20 Sep 2021 13:05:06 +0200
In-Reply-To: <01a1827d-ab6f-bd88-7291-dd68676c0eae@intel.com>
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-4-thomas.hellstrom@linux.intel.com>
 <01a1827d-ab6f-bd88-7291-dd68676c0eae@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-09-20 at 11:49 +0100, Matthew Auld wrote:
> On 14/09/2021 20:31, Thomas Hellström wrote:
> > Just evict unpinned objects to system. For pinned LMEM objects,
> > make a backup system object and blit the contents to that.
> > 
> > Backup is performed in three steps,
> > 1: Opportunistically evict evictable objects using the gpu blitter.
> > 2: After gt idle, evict evictable objects using the gpu blitter.
> > This will
> > be modified in an upcoming patch to backup pinned objects that are
> > not used
> > by the blitter itself.
> > 3: Backup remaining pinned objects using memcpy.
> > 
> > Also move uC suspend to after 2) to make sure we have a functional
> > GuC
> > during 2) if using GuC submission.
> > 
> > v2:
> > - Major refactor to make sure gem_exec_suspend@hang-SX subtests
> > work, and
> >    suspend / resume works with a slightly modified GuC submission
> > enabling
> >    patch series.
> > 
> > v3:
> > - Fix a potential use-after-free (Matthew Auld)
> > - Use i915_gem_object_create_shmem() instead of
> >    i915_gem_object_create_region (Matthew Auld)
> > - Minor simplifications (Matthew Auld)
> > - Fix up kerneldoc for i195_ttm_restore_region().
> > - Final lmem_suspend() call moved to i915_gem_backup_suspend from
> >    i915_gem_suspend_late, since the latter gets called at driver
> > unload
> >    and we don't unnecessarily want to run it at that time.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> <snip>
> 
> > +
> > +static int i915_ttm_restore(struct i915_gem_apply_to_region
> > *apply,
> > +                           struct drm_i915_gem_object *obj)
> > +{
> > +       struct i915_gem_ttm_pm_apply *pm_apply =
> > +               container_of(apply, typeof(*pm_apply), base);
> > +       struct drm_i915_gem_object *backup = obj->ttm.backup;
> > +       struct ttm_buffer_object *backup_bo =
> > i915_gem_to_ttm(backup);
> > +       struct ttm_operation_ctx ctx = {};
> > +       int err;
> > +
> > +       if (!backup)
> > +               return 0;
> > +
> > +       if (!pm_apply->allow_gpu && (obj->flags &
> > I915_BO_ALLOC_USER))
> > +               return 0;
> 
> Hmm, do we ever hit this? I would presume anything that userspace 
> directly allocated in lmem can be kicked out with
> ttm_bo_validate(sys) 
> i.e backup == NULL?

At this point, (before patch 6/6) I think we might do. Typical
candidates are dma-buf objects that have become pinned on exporting,
and perhaps framebuffers that are pinned, not sure they are unpinned
before we back them up.

But it might be that we should remove this after patch 6/6 where we
require a special flag for early recovers using memcpy.

/Thomas


> 
> > +
> > +       err = i915_gem_object_lock(backup, apply->ww);
> > +       if (err)
> > +               return err;
> > +
> > +       /* Content may have been swapped. */
> > +       err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm,
> > &ctx);
> > +       if (!err) {
> > +               err = i915_gem_obj_copy_ttm(obj, backup, pm_apply-
> > >allow_gpu,
> > +                                           false);
> > +               GEM_WARN_ON(err);
> > +
> > +               obj->ttm.backup = NULL;
> > +               err = 0;
> > +       }
> > +
> > +       i915_gem_ww_unlock_single(backup);
> > +
> > +       if (!err)
> > +               i915_gem_object_put(backup);
> > +
> > +       return err;
> > +}
> > +


