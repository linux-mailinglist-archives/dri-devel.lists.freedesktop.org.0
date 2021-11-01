Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC3A4423CD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 00:11:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA5B6EB38;
	Mon,  1 Nov 2021 23:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524D46EB38;
 Mon,  1 Nov 2021 23:11:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="317341759"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="317341759"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:11:07 -0700
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="500253556"
Received: from ebijkerk-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 16:11:04 -0700
Date: Tue, 2 Nov 2021 00:11:01 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 05/10] drm/i915: Prepare for multiple gts
Message-ID: <YYB0BdEcDqt2IUXi@intel.intel>
References: <20211029032817.3747750-1-matthew.d.roper@intel.com>
 <20211029032817.3747750-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029032817.3747750-6-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt and Tvrtko,

[...]

>  static int
>  intel_gt_tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)

we don't actually need 'id', it's gt->info.id. It's introduced in
patch 3 with the value '0' but it's not needed.

>  {
> +	struct drm_i915_private *i915 = gt->i915;
> +	struct intel_uncore *uncore;
> +	struct intel_uncore_mmio_debug *mmio_debug;
>  	int ret;
>  
> -	intel_uncore_init_early(gt->uncore, gt);
> +	if (id) {

if (gt->info.id) ?

Andi

> +		uncore = kzalloc(sizeof(*uncore), GFP_KERNEL);
> +		if (!uncore)
> +			return -ENOMEM;
> +
> +		mmio_debug = kzalloc(sizeof(*mmio_debug), GFP_KERNEL);
> +		if (!mmio_debug) {
> +			kfree(uncore);
> +			return -ENOMEM;
> +		}
> +
> +		__intel_gt_init_early(gt, uncore, i915);
> +	} else {
> +		uncore = &i915->uncore;
> +		mmio_debug = &i915->mmio_debug;
> +	}
> +
> +	intel_uncore_init_early(uncore, gt);
>  
>  	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
