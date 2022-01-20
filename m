Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F381B495462
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 19:47:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C34210E882;
	Thu, 20 Jan 2022 18:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFFA10E873;
 Thu, 20 Jan 2022 18:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642704455; x=1674240455;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ByOpiGnkUJbVx/iQnpt8bQxfrYBl/g8S2Z/OsFWkXY0=;
 b=SaD3I/PgIE5k3u+AZtVlOWjQB9roJW9CAubk/qQnHeHYd4JkY9LOrko/
 XdjHD8/3xjf3s8iURSqnvcgcT2jTc28CI7nUjPEJd2FEnkQtVP81UBhtI
 6nF0Xr9AVCT2Mb5r1goXeMgAEsZqkogipEsonzbhOML094i8ulmL6fB4U
 DSGhSn1qreNtbMZROgSp1xNZY6u+2orVUe2y7wUSWPkpOIXIkV5zjOLLg
 m2oqAX9+SmCqiWkXxsl7MSLXKN2UxKIPLhTr2I5XJS4HiFQNjBfczIt0X
 ZVZphqOlambQ7D9+Xj3tC7HQK0HNLiocaht4aEpr2sPTd+0m4r48rdAm8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="245222136"
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="245222136"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 10:47:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,303,1635231600"; d="scan'208";a="477907636"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 10:47:33 -0800
Date: Fri, 21 Jan 2022 00:17:30 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH] drm/i915: Add needs_compact_pt flag
Message-ID: <20220120184730.GA9272@intel.com>
References: <20220120162102.10652-1-ramalingam.c@intel.com>
 <f54309e3-3b82-5a64-0e5a-46981c4b63aa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f54309e3-3b82-5a64-0e5a-46981c4b63aa@collabora.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-01-20 at 16:42:52 +0000, Robert Beckett wrote:
> 
> 
> On 20/01/2022 16:21, Ramalingam C wrote:
> > Add a new platform flag, needs_compact_pt, to mark the requirement of
> > compact pt layout support for the ppGTT when using 64K GTT pages.
> > 
> > With this flag has_64k_pages will only indicate requirement of 64K
> > GTT page sizes or larger for device local memory access.
> > 
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > cc: Robert Beckett <bob.beckett@collabora.com>
> > ---
> >   drivers/gpu/drm/i915/i915_drv.h          | 10 +++++++---
> >   drivers/gpu/drm/i915/i915_pci.c          |  2 ++
> >   drivers/gpu/drm/i915/intel_device_info.h |  1 +
> >   3 files changed, 10 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 890f1f6fbc49..23f4713005bb 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1512,12 +1512,16 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> >   /*
> >    * Set this flag, when platform requires 64K GTT page sizes or larger for
> > - * device local memory access. Also this flag implies that we require or
> > - * at least support the compact PT layout for the ppGTT when using the 64K
> > - * GTT pages.
> > + * device local memory access.
> >    */
> >   #define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
> > +/* Set this flag when platform doesn't allow both 64k pages and 4k pages in
> > + * the same PT. this flag means we need to support compact PT layout for the
> > + * ppGTT when using the 64K GTT pages.
> > + */
> > +#define NEEDS_COMPACT_PT(dev_priv) (INTEL_INFO(dev_priv)->needs_compact_pt)
> > +
> >   #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
> >   #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> > index 8261b6455747..3e7555ce6894 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -1028,6 +1028,7 @@ static const struct intel_device_info xehpsdv_info = {
> >   	PLATFORM(INTEL_XEHPSDV),
> >   	.display = { },
> >   	.has_64k_pages = 1,
> > +	.needs_compact_pt = 1,
> >   	.platform_engine_mask =
> >   		BIT(RCS0) | BIT(BCS0) |
> >   		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
> > @@ -1046,6 +1047,7 @@ static const struct intel_device_info dg2_info = {
> >   	.media.rel = 55,
> >   	PLATFORM(INTEL_DG2),
> >   	.has_64k_pages = 1,
> > +	.needs_compact_pt = 1,
> >   	.platform_engine_mask =
> >   		BIT(RCS0) | BIT(BCS0) |
> >   		BIT(VECS0) | BIT(VECS1) |
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> > index 3699b1c539ea..8ff676f49471 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -130,6 +130,7 @@ enum intel_ppgtt_type {
> >   	/* Keep has_* in alphabetical order */ \
> >   	func(has_64bit_reloc); \
> >   	func(has_64k_pages); \
> > +	func(needs_compact_pt; \
> 
> missing `)`
> instead of chucking untested patches on ml, I'll add a fixed version to the
> in review series and include it in v3 after testing
Thanks

Ram
> 
> >   	func(gpu_reset_clobbers_display); \
> >   	func(has_reset_engine); \
> >   	func(has_global_mocs); \
> > 
