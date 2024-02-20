Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338385BEFF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 15:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469A110E48F;
	Tue, 20 Feb 2024 14:42:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="maRDBZSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C0310E46C;
 Tue, 20 Feb 2024 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708440175; x=1739976175;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kNn7awcjh//PjUungTG8A1H2uT/756QuzdLQvdLsh7g=;
 b=maRDBZSAEvhuZZ0i4HH6FYDTMlYbrMmNaHl4UmuY+cy+YwJggcOjWrwB
 TbG9JTbF8uk3mK2NxR9g+xu+2m1mEfd+dUHJj5VYSWfSJ2bmJ7oWmTrbA
 A7KrsWq9GKDQftKCRqHwykH4IIpvG8lpKCQWeKkJ3Ye8oXupatFtkpPlB
 xZF3XyuQMFFql0X5rYgMM3DUvdt9Pfie9fVE7/hpXKHJsah1QBrUnFz/I
 RZDcMSvxV4GNf04vM+rEGe1GbE4J3aOsR/RPdHirH1j7gOzgAo5uaIxez
 2THG3chb+CQVd684Qzap1pHLv6SZdHFXDUaFTCeOxR23SRbdzp0kTKwmT w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2405533"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2405533"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4841629"
Received: from alichtma-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.34.74])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 06:42:52 -0800
Date: Tue, 20 Feb 2024 15:42:49 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 stable@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <ZdS6aTy88pMIt-z0@ashyti-mobl2.lan>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240220143526.259109-3-andi.shyti@linux.intel.com>
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

Hi,

[...]

> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 3baa2f54a86e..d5a5143971f5 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
>  	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
>  }
>  
> +

sorry, this is a leftover from the cleanup.

Andi

>  static int
>  query_engine_info(struct drm_i915_private *i915,
>  		  struct drm_i915_query_item *query_item)
> -- 
> 2.43.0
