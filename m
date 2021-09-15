Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7AD40C841
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 17:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356516E95F;
	Wed, 15 Sep 2021 15:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DF36E95F;
 Wed, 15 Sep 2021 15:25:13 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="219167259"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219167259"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 08:25:03 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="651239402"
Received: from nvora-mobl.amr.corp.intel.com (HELO intel.com) ([10.255.36.151])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 08:25:01 -0700
Date: Wed, 15 Sep 2021 11:24:59 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 03/17] drm/i915/pxp: define PXP device flag and kconfig
Message-ID: <YUIQS/sWdOVxTnJl@intel.com>
References: <20210910153627.1060858-1-daniele.ceraolospurio@intel.com>
 <20210910153627.1060858-4-daniele.ceraolospurio@intel.com>
 <877dfix8z5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dfix8z5.fsf@intel.com>
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

On Wed, Sep 15, 2021 at 04:29:50PM +0300, Jani Nikula wrote:
> On Fri, 10 Sep 2021, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
> > Ahead of the PXP implementation, define the relevant define flag and
> > kconfig option.
> >
> > v2: flip kconfig default to N. Some machines have IFWIs that do not
> > support PXP, so we need it to be an opt-in until we add support to query
> > the caps from the mei device.
> >
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/i915/Kconfig             | 11 +++++++++++
> >  drivers/gpu/drm/i915/i915_drv.h          |  3 +++
> >  drivers/gpu/drm/i915/intel_device_info.h |  1 +
> >  3 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
> > index f960f5d7664e..5987c3d5d9fb 100644
> > --- a/drivers/gpu/drm/i915/Kconfig
> > +++ b/drivers/gpu/drm/i915/Kconfig
> > @@ -131,6 +131,17 @@ config DRM_I915_GVT_KVMGT
> >  	  Choose this option if you want to enable KVMGT support for
> >  	  Intel GVT-g.
> >  
> > +config DRM_I915_PXP
> > +	bool "Enable Intel PXP support for Intel Gen12+ platform"
> > +	depends on DRM_I915
> > +	depends on INTEL_MEI && INTEL_MEI_PXP
> > +	default n
> > +	help
> > +	  PXP (Protected Xe Path) is an i915 component, available on GEN12+
> 
> Is GEN12+ something we still want to use in help texts?

Good catch. The + might create some confusion.
We need to change this to something like gen12 and newer,
or something like that...

> 
> BR,
> Jani.
> 
> > +	  GPUs, that helps to establish the hardware protected session and
> > +	  manage the status of the alive software session, as well as its life
> > +	  cycle.
> > +
> >  menu "drm/i915 Debugging"
> >  depends on DRM_I915
> >  depends on EXPERT
> > diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> > index 37c1ca266bcd..447a248f14aa 100644
> > --- a/drivers/gpu/drm/i915/i915_drv.h
> > +++ b/drivers/gpu/drm/i915/i915_drv.h
> > @@ -1678,6 +1678,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
> >  
> >  #define HAS_GLOBAL_MOCS_REGISTERS(dev_priv)	(INTEL_INFO(dev_priv)->has_global_mocs)
> >  
> > +#define HAS_PXP(dev_priv) (IS_ENABLED(CONFIG_DRM_I915_PXP) && \
> > +			   INTEL_INFO(dev_priv)->has_pxp) && \
> > +			   VDBOX_MASK(&dev_priv->gt)
> >  
> >  #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
> >  
> > diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> > index d328bb95c49b..8e6f48d1eb7b 100644
> > --- a/drivers/gpu/drm/i915/intel_device_info.h
> > +++ b/drivers/gpu/drm/i915/intel_device_info.h
> > @@ -133,6 +133,7 @@ enum intel_ppgtt_type {
> >  	func(has_logical_ring_elsq); \
> >  	func(has_mslices); \
> >  	func(has_pooled_eu); \
> > +	func(has_pxp); \
> >  	func(has_rc6); \
> >  	func(has_rc6p); \
> >  	func(has_rps); \
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
