Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA797C410B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 22:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B6910E17C;
	Tue, 10 Oct 2023 20:22:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6267410E3E7;
 Tue, 10 Oct 2023 20:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696969358; x=1728505358;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7ccquPyXL/FoCF2zzMIo1DhK/ffkDyyCgIckxDTquY8=;
 b=NnLIkCLJ5KucW3fVmNqNrX59SuVDP494gO/GegsxfB0dgpyXaVY6QZgX
 M7UpSYqO/NqFKMBJES7BQqa/WGeYeXeKc3+3lekuSxuxvTBL67TzwucBC
 NmO2g1zvwCBn1vE8xk5X7YJtCyzcaRx19Ro7QtO8T+ZcfdX41v//uw2o+
 1Z6Vv7TGeb0kv8vJTWPMOOiRKJ+qZepeR4/3S3qhcAuUcfipZwVvE+Li2
 fMK5iMfXF/Qrfd0e/M88N+X7wpjENuKWrZBUwq2aPN+uXPFzKYhx4295+
 oAOIUCZZrohukwS70ABcvW7wDz62uCq0hV5H+4sRseRr3r77GiZtTf6cs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470763361"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="470763361"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:22:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="703432415"
X-IronPort-AV: E=Sophos;i="6.03,213,1694761200"; d="scan'208";a="703432415"
Received: from ppalanyk-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.213.148.82])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 13:22:30 -0700
Date: Tue, 10 Oct 2023 22:22:23 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915: More use of GT specific print
 helpers
Message-ID: <ZSWyf3eNGH/4MAuG@ashyti-mobl2.lan>
References: <20231009183802.673882-1-John.C.Harrison@Intel.com>
 <20231009183802.673882-3-John.C.Harrison@Intel.com>
 <ZSRaaVzpL51DA3y+@ashyti-mobl2.lan>
 <1409712e-d495-41df-842b-211fa3f37384@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1409712e-d495-41df-842b-211fa3f37384@intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Mon, Oct 09, 2023 at 12:57:55PM -0700, John Harrison wrote:
> On 10/9/2023 12:54, Andi Shyti wrote:
> > Hi John,
> > 
> > ...
> > 
> > > --- a/drivers/gpu/drm/i915/i915_driver.c
> > > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > > @@ -71,6 +71,7 @@
> > >   #include "gem/i915_gem_pm.h"
> > >   #include "gt/intel_gt.h"
> > >   #include "gt/intel_gt_pm.h"
> > > +#include "gt/intel_gt_print.h"
> > >   #include "gt/intel_rc6.h"
> > >   #include "pxp/intel_pxp.h"
> > > @@ -429,7 +430,7 @@ static int i915_pcode_init(struct drm_i915_private *i915)
> > >   	for_each_gt(gt, i915, id) {
> > >   		ret = intel_pcode_init(gt->uncore);
> > >   		if (ret) {
> > > -			drm_err(&gt->i915->drm, "gt%d: intel_pcode_init failed %d\n", id, ret);
> > > +			gt_err(gt, "intel_pcode_init failed %d\n", ret);
> > using gt_*() print functions in the upper layers looks a bit
> > wrong to me. If we need GT printing, the prints need to be done
> > inside the function called, in this case would be
> > intel_pcode_init().
> It is less wrong that using gt->i915->drm as a parameter and 'gt%d' in the
> format string. That is the whole point of the helper. The code has access to
> a gt object so it should use the gt helper to make use of that object rather
> than unrolling it and diving in to the gt internals.

yes, it's an improvement

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

> As for moving the error message inside the init function itself. That is
> maybe a valid change but that potentially counts as a functional change and
> should be done by someone who actually knows the code. All I'm doing is
> improving the code layering by using the correct helper to hide the internal
> details of an object this layer should not know about.

maybe one day we need to revisit all the gt dependency in the
higher levels and the i915 dependencies in gt.

Thanks,
Andi
