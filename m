Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD324039B7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 14:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B6C89E57;
	Wed,  8 Sep 2021 12:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFDA89A98;
 Wed,  8 Sep 2021 12:26:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="281484239"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="281484239"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 05:26:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="547775620"
Received: from scelesti-mobl.amr.corp.intel.com (HELO [10.249.254.176])
 ([10.249.254.176])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 05:26:30 -0700
Message-ID: <da61dd83293eb1650ca3da8a650db74a856142ad.camel@linux.intel.com>
Subject: Re: [PATCH v2 5/6] drm/i915: Don't back up pinned LMEM context
 images and rings during suspend
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
Date: Wed, 08 Sep 2021 14:26:27 +0200
In-Reply-To: <160c96ac-3cf2-5542-9ad0-bbc0b5ebec55@intel.com>
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
 <20210906165515.450541-6-thomas.hellstrom@linux.intel.com>
 <160c96ac-3cf2-5542-9ad0-bbc0b5ebec55@intel.com>
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

On Wed, 2021-09-08 at 12:07 +0100, Matthew Auld wrote:
> On 06/09/2021 17:55, Thomas Hellström wrote:
> > Pinned context images are now reset during resume. Don't back them
> > up,
> > and assuming that rings can be assumed empty at suspend, don't back
> > them
> > up either.
> > 
> > Introduce a new object flag, I915_BO_ALLOC_PM_VOLATILE meaning that
> > an
> > object is allowed to lose its content on suspend.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   .../gpu/drm/i915/gem/i915_gem_object_types.h    | 17 ++++++++++--
> > -----
> >   drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c      |  3 +++
> >   drivers/gpu/drm/i915/gt/intel_lrc.c             |  3 ++-
> >   drivers/gpu/drm/i915/gt/intel_ring.c            |  3 ++-
> >   4 files changed, 17 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > index 734cc8e16481..66123ba46247 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
> > @@ -288,16 +288,19 @@ struct drm_i915_gem_object {
> >         I915_SELFTEST_DECLARE(struct list_head st_link);
> >   
> >         unsigned long flags;
> > -#define I915_BO_ALLOC_CONTIGUOUS BIT(0)
> > -#define I915_BO_ALLOC_VOLATILE   BIT(1)
> > -#define I915_BO_ALLOC_CPU_CLEAR  BIT(2)
> > -#define I915_BO_ALLOC_USER       BIT(3)
> > +#define I915_BO_ALLOC_CONTIGUOUS  BIT(0)
> > +#define I915_BO_ALLOC_VOLATILE    BIT(1)
> > +#define I915_BO_ALLOC_CPU_CLEAR   BIT(2)
> > +#define I915_BO_ALLOC_USER        BIT(3)
> > +/* Object may lose its contents on suspend / resume */
> > +#define I915_BO_ALLOC_PM_VOLATILE BIT(4)

> 
> PM_SKIP_PINNED? Not sure if that is better.

I think we could update the comment to say "object is allowed to
lose..", I think we could keep PM_VOLATILE to keep it consistent with
the ALLOC_VOLATILE flag?

/Thomas


