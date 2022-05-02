Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE35176D6
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 20:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F85210E239;
	Mon,  2 May 2022 18:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D32E10E298;
 Mon,  2 May 2022 18:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651517424; x=1683053424;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jlXjmVwk0nBEDMK5ylpSRYQqanHX14OGzl7Tz0Es8B8=;
 b=h6sFKmKyLg8J09rX+NY2bzI0nOZf5YDWNnZJv2SCXt+fjP4MJ0Fs7vlo
 6MHK+87kYGOP5U5F2ri8NpYiZElQPdV3rmFkhtdcFVNvAbA/3TsEInFmp
 /Egj9FOrYGODpHmQ2rP7Ced7kYpBJt0GCyrqhMQODDjAnt9P++tOaFffv
 USH0PeFY0VBKh6KHCP/goMhicHv4KpK+/QmCoP9dDGpQcma/wOwfmPVQn
 +RzPEIP/NzOC6SgKqW/c7u6nWbEen5hVfwk+6Z3Fyy7Db8VXcCSiSfVW2
 HBnYUZMijfRWkSWpP9BaUpIVtfJTLkl0lsZxgKvLmfi8wqR/dWxsChLF+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="292483676"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="292483676"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:50:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="652946850"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 11:50:23 -0700
Date: Mon, 2 May 2022 11:50:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/i915/pvc: Define MOCS table for PVC
Message-ID: <YnAn7sXti/SIitVo@mdroper-desk1.amr.corp.intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
 <20220502163417.2635462-4-matthew.d.roper@intel.com>
 <YnALz9E2cNkAVnK0@mdroper-desk1.amr.corp.intel.com>
 <20220502183948.2kjtwbqrixjbuc5j@ldmartin-desk2.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502183948.2kjtwbqrixjbuc5j@ldmartin-desk2.jf.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 02, 2022 at 11:39:48AM -0700, Lucas De Marchi wrote:
> On Mon, May 02, 2022 at 09:50:23AM -0700, Matt Roper wrote:
> > On Mon, May 02, 2022 at 09:34:09AM -0700, Matt Roper wrote:
> > > From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > > 
> > > Bspec: 45101, 72161
> > > Signed-off-by: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
> > > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
> > >  drivers/gpu/drm/i915/gt/intel_mocs.c        | 24 ++++++++++++++++++++-
> > >  drivers/gpu/drm/i915/gt/intel_workarounds.c | 13 ++++++++---
> > >  drivers/gpu/drm/i915/i915_drv.h             |  2 ++
> > >  drivers/gpu/drm/i915/i915_pci.c             |  3 ++-
> > >  drivers/gpu/drm/i915/intel_device_info.h    |  1 +
> > >  6 files changed, 39 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > index b06611c1d4ad..7853ea194ea6 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> > > @@ -221,6 +221,7 @@ struct intel_gt {
> > > 
> > >  	struct {
> > >  		u8 uc_index;
> > > +		u8 wb_index; /* Only for platforms listed in Bspec: 72161 */
> > >  	} mocs;
> > > 
> > >  	struct intel_pxp pxp;
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
> > > index c4c37585ae8c..265812589f87 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_mocs.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
> > > @@ -23,6 +23,7 @@ struct drm_i915_mocs_table {
> > >  	unsigned int n_entries;
> > >  	const struct drm_i915_mocs_entry *table;
> > >  	u8 uc_index;
> > > +	u8 wb_index; /* Only for platforms listed in Bspec: 72161 */
> > >  	u8 unused_entries_index;
> > >  };
> > > 
> > > @@ -47,6 +48,7 @@ struct drm_i915_mocs_table {
> > > 
> > >  /* Helper defines */
> > >  #define GEN9_NUM_MOCS_ENTRIES	64  /* 63-64 are reserved, but configured. */
> > > +#define PVC_NUM_MOCS_ENTRIES	3
> > 
> > Should this be 4?  The value here should reflect the number of entries
> > that can defined in hardware rather than the size of the table we're
> > asked to program.  Since there are two registers (each with a high and a
> > low entry), that would imply we should set 4 here to ensure that the
> > fourth entry is initialized according to unused_entries_index rather
> > than left at whatever the hardware defaults might be.
> 
> not sure I understand what you mean here. The n_entries specifies, as
> you said, the number of entries we can have. Bspec 45101 shows entries
> for indexes 0, 1 and 2. As does the pvc_mocs_table below.
> 
> Also, from bspec 44509:
> "For PVC, only 3 MOCS states are supported. The allowed index values are
> in range [0, 2]..."
> 
> So, I don't think we want to program any fourth entry.

We don't have a choice; the fourth entry lives in the same register as
the third entry, so no matter what we're writing _something_ to those
bits.  The question is whether we should write all 0's or whether we
should treat it like other platforms and ensure it's initialized to the
unused entry values.  Entry #4 isn't supposed to be used, but if buggy
userspace tries to use it, we probably still want well-defined behavior,
just like it an invalid entry gets used on any other platform.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
