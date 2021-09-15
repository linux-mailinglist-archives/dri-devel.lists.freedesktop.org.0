Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089940BC93
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 02:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06FD76E85F;
	Wed, 15 Sep 2021 00:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD6F6E85F;
 Wed, 15 Sep 2021 00:25:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221836093"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="221836093"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 17:25:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="609892592"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 17:25:01 -0700
Date: Tue, 14 Sep 2021 17:24:59 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: rename debugfs_gt_pm files
Message-ID: <20210915002459.GD3389343@mdroper-desk1.amr.corp.intel.com>
References: <20210909004941.379035-1-lucas.demarchi@intel.com>
 <20210909004941.379035-3-lucas.demarchi@intel.com>
 <20210910175257.oo3wbqnwx2inbcr3@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210910175257.oo3wbqnwx2inbcr3@ldmartin-desk2>
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

On Fri, Sep 10, 2021 at 10:52:57AM -0700, Lucas De Marchi wrote:
> On Wed, Sep 08, 2021 at 05:49:40PM -0700, Lucas De Marchi wrote:
> > We shouldn't be using debugfs_ namespace for this functionality. Rename
> > debugfs_gt_pm.[ch] to intel_gt_pm_debugfs.[ch] and then make
> > functions, defines and structs follow suit.
> > 
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> > drivers/gpu/drm/i915/Makefile                      |  2 +-
> > drivers/gpu/drm/i915/gt/debugfs_gt_pm.h            | 14 --------------
> > drivers/gpu/drm/i915/gt/intel_gt_debugfs.c         |  4 ++--
> > .../gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c}  |  4 ++--
> > drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h      | 14 ++++++++++++++
> > 5 files changed, 19 insertions(+), 19 deletions(-)
> > delete mode 100644 drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
> > rename drivers/gpu/drm/i915/gt/{debugfs_gt_pm.c => intel_gt_pm_debugfs.c} (99%)
> > create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.h
> > 
> > diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> > index 232c9673a2e5..dd656f2d7721 100644
> > --- a/drivers/gpu/drm/i915/Makefile
> > +++ b/drivers/gpu/drm/i915/Makefile
> > @@ -79,7 +79,6 @@ i915-$(CONFIG_PERF_EVENTS) += i915_pmu.o
> > 
> > # "Graphics Technology" (aka we talk to the gpu)
> > gt-y += \
> > -	gt/debugfs_gt_pm.o \
> > 	gt/gen2_engine_cs.o \
> > 	gt/gen6_engine_cs.o \
> > 	gt/gen6_ppgtt.o \
> > @@ -103,6 +102,7 @@ gt-y += \
> > 	gt/intel_gt_engines_debugfs.o \
> > 	gt/intel_gt_irq.o \
> > 	gt/intel_gt_pm.o \
> > +	gt/intel_gt_pm_debugfs.o \
> > 	gt/intel_gt_pm_irq.o \
> > 	gt/intel_gt_requests.o \
> > 	gt/intel_gtt.o \
> > diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h b/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
> > deleted file mode 100644
> > index 4cf5f5c9da7d..000000000000
> > --- a/drivers/gpu/drm/i915/gt/debugfs_gt_pm.h
> > +++ /dev/null
> > @@ -1,14 +0,0 @@
> > -/* SPDX-License-Identifier: MIT */
> > -/*
> > - * Copyright © 2019 Intel Corporation
> > - */
> > -
> > -#ifndef DEBUGFS_GT_PM_H
> > -#define DEBUGFS_GT_PM_H
> > -
> > -struct intel_gt;
> > -struct dentry;
> > -
> > -void debugfs_gt_pm_register(struct intel_gt *gt, struct dentry *root);
> > -
> > -#endif /* DEBUGFS_GT_PM_H */
> > diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > index e5d173c235a3..4096ee893b69 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
> > @@ -5,10 +5,10 @@
> > 
> > #include <linux/debugfs.h>
> > 
> > -#include "debugfs_gt_pm.h"
> > #include "i915_drv.h"
> > #include "intel_gt_debugfs.h"
> > #include "intel_gt_engines_debugfs.h"
> > +#include "intel_gt_pm_debugfs.h"
> > #include "intel_sseu_debugfs.h"
> > #include "uc/intel_uc_debugfs.h"
> > 
> > @@ -24,7 +24,7 @@ void intel_gt_register_debugfs(struct intel_gt *gt)
> > 		return;
> > 
> > 	intel_gt_engines_register_debugfs(gt, root);
> > -	debugfs_gt_pm_register(gt, root);
> > +	intel_gt_pm_register_debugfs(gt, root);
> 
> This is one case I usually don't know what convention to follow since it
> changes in different places.
> 
> I did it like xxxx_register_debugfs because of calls like
> intel_gt_init_scratch(), xxx_init_hw, etc. However here I see that just
> below we have intel_sseu_debugfs_register(), so maybe I should consider
> debugfs as part of the namespace?

I like *_debugfs_register slightly better than *_register_debugfs
because to me we're not registering debugfs itself, we're performing
debugfs' register operation on some files.  But I don't really have a
strong feeling either way.  Whichever way you decide,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

for the series.


Matt

> 
> Lucas De Marchi

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
