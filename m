Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9311484582B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 13:53:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7790710ED6A;
	Thu,  1 Feb 2024 12:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiFamANL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08EDA10ED67;
 Thu,  1 Feb 2024 12:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706791981; x=1738327981;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=kM2CzdPqPhJGT/27u+FEUgiyr+hJJwWsrgc1Wu+Yw4c=;
 b=MiFamANLT+ibF0Zk8jON8Lf+z2TDnXLVshf9mkP0R9IbamktMokwrbIy
 fYFNqny4CV/b2BDqnCDfnHy1xh/CbS4o4uiHbuCVvLZT9PgvmF2+a+C8C
 SGmqsUp81G3sHe3odyy/fBZcREuaA6h6ZYS4BQifsXaqhl+RipPjuRYIN
 w/hB39Hd4qLIhnbxZ+kAa3H4++iAHAWKCJDeK6VMJg5jET13BJBP/E9IN
 OnqzJHcUSFpAQclboseXwu9gXnbad6mxoZmnZ1X/qZh0jbVh7pg5HlyTy
 weGpCB3HAh/fjEeuIYW4j0qmkRLVtxpumToDQLOhNPy+PoXA1695Wmxwg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="402730844"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="402730844"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="908242204"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="908242204"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 04:52:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 09/10] drm/xe: switch from drm_debug_printer() to device
 specific drm_dbg_printer()
In-Reply-To: <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1705410327.git.jani.nikula@intel.com>
 <35929b030f7ba67cd32808d42e916aa9cfb5709d.1705410327.git.jani.nikula@intel.com>
Date: Thu, 01 Feb 2024 14:52:55 +0200
Message-ID: <87y1c4fis8.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 16 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Prefer the device specific debug printer.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Xe maintainers, ack for merging this via drm-misc along with the rest of
the series?

BR,
Jani.

> ---
>  drivers/gpu/drm/xe/xe_gt.c          | 2 +-
>  drivers/gpu/drm/xe/xe_gt_topology.c | 4 +++-
>  drivers/gpu/drm/xe/xe_reg_sr.c      | 2 +-
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0f2258dc4a00..16481f9b3125 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -327,7 +327,7 @@ static void dump_pat_on_error(struct xe_gt *gt)
>  	char prefix[32];
>  
>  	snprintf(prefix, sizeof(prefix), "[GT%u Error]", gt->info.id);
> -	p = drm_debug_printer(prefix);
> +	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, prefix);
>  
>  	xe_pat_dump(gt, &p);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a8d7f272c30a..5dc62fe1be49 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -84,7 +84,7 @@ void
>  xe_gt_topology_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	struct drm_printer p = drm_debug_printer("GT topology");
> +	struct drm_printer p;
>  	int num_geometry_regs, num_compute_regs;
>  
>  	get_num_dss_regs(xe, &num_geometry_regs, &num_compute_regs);
> @@ -107,6 +107,8 @@ xe_gt_topology_init(struct xe_gt *gt)
>  		      XE2_GT_COMPUTE_DSS_2);
>  	load_eu_mask(gt, gt->fuse_topo.eu_mask_per_dss);
>  
> +	p = drm_dbg_printer(&gt_to_xe(gt)->drm, DRM_UT_DRIVER, "GT topology");
> +
>  	xe_gt_topology_dump(gt, &p);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 87adefb56024..440ac572f6e5 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -231,7 +231,7 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  	if (err)
>  		goto err_force_wake;
>  
> -	p = drm_debug_printer(KBUILD_MODNAME);
> +	p = drm_dbg_printer(&xe->drm, DRM_UT_DRIVER, NULL);
>  	xa_for_each(&sr->xa, reg, entry) {
>  		if (slot == RING_MAX_NONPRIV_SLOTS) {
>  			xe_gt_err(gt,

-- 
Jani Nikula, Intel
