Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A573F84D1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B316E5A1;
	Thu, 26 Aug 2021 09:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A83F6E5A1;
 Thu, 26 Aug 2021 09:51:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10087"; a="217744062"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="217744062"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 02:51:48 -0700
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; d="scan'208";a="465070328"
Received: from lapeders-mobl.ger.corp.intel.com (HELO [10.249.254.132])
 ([10.249.254.132])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2021 02:51:46 -0700
Message-ID: <4d14b5f5f74d279d666077de28f5de7f6d721509.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/i915/debugfs: hook up ttm_resource_manager_debug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 26 Aug 2021 11:51:44 +0200
In-Reply-To: <YSdcAD7Pa+e93xqh@phenom.ffwll.local>
References: <20210818145850.225387-1-matthew.auld@intel.com>
 <20210818145850.225387-2-matthew.auld@intel.com>
 <811cc4bfb6262d9050140ed9a9eac1dd7632d33a.camel@linux.intel.com>
 <YSdcAD7Pa+e93xqh@phenom.ffwll.local>
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

On Thu, 2021-08-26 at 11:16 +0200, Daniel Vetter wrote:
> On Thu, Aug 19, 2021 at 09:32:20AM +0200, Thomas Hellström wrote:
> > On Wed, 2021-08-18 at 15:58 +0100, Matthew Auld wrote:
> > > This should give a more complete view of the various bits of
> > > internal
> > > resource manager state, for device local-memory.
> > > 
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/i915_debugfs.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/i915_debugfs.c
> > > b/drivers/gpu/drm/i915/i915_debugfs.c
> > > index eec0d349ea6a..109e6feed6be 100644
> > > --- a/drivers/gpu/drm/i915/i915_debugfs.c
> > > +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> > > @@ -238,6 +238,7 @@ i915_debugfs_describe_obj(struct seq_file *m,
> > > struct drm_i915_gem_object *obj)
> > >  static int i915_gem_object_info(struct seq_file *m, void *data)
> > >  {
> > >         struct drm_i915_private *i915 = node_to_i915(m->private);
> > > +       struct drm_printer p = drm_seq_file_printer(m);
> > >         struct intel_memory_region *mr;
> > >         enum intel_region_id id;
> > >  
> > > @@ -245,9 +246,14 @@ static int i915_gem_object_info(struct
> > > seq_file
> > > *m, void *data)
> > >                    i915->mm.shrink_count,
> > >                    atomic_read(&i915->mm.free_count),
> > >                    i915->mm.shrink_memory);
> > > -       for_each_memory_region(mr, i915, id)
> > > -               seq_printf(m, "%s: total:%pa, available:%pa
> > > bytes\n",
> > > -                          mr->name, &mr->total, &mr->avail);
> > > +       for_each_memory_region(mr, i915, id) {
> > > +               seq_printf(m, "%s: ", mr->name);
> > > +               if (mr->region_private)
> > > +                       ttm_resource_manager_debug(mr-
> > > > region_private, &p);
> > > +               else
> > > +                       seq_printf(m, "total:%pa, available:%pa
> > > bytes\n",
> > > +                                  &mr->total, &mr->avail);
> > 
> > Hm. Shouldn't we make the above intel_memory_region_debug() or
> > perhaps
> > intel_memory_region_info() to avoid using memory region internals
> > directly here?
> 
> Imo we should just emebed ttm_resource_mager into our own and not try
> to
> abstract this all away that much. At least in upstream there is just
> not
> going to be another memory region implementation, and for backporting
> I'm
> not sure these abstractions really help that much - we're touching
> all the
> same code still in the end.

Hmm, yes. Here I was seeing the separation between the debugfs code and
the intel_memory_region code, rather between the latter and TTM.

The i915 driver is currently much "everything uses everything" which
IMHO is not really good for code understanding and maintainance.

/Thomas

> -Daniel


