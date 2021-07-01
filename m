Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E9F3B987B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 00:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C106EC69;
	Thu,  1 Jul 2021 22:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7766EC55;
 Thu,  1 Jul 2021 22:06:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="195920705"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="195920705"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:06:41 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="626532115"
Received: from aebanas-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.38.1])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:06:41 -0700
Date: Thu, 1 Jul 2021 15:06:35 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 04/53] drm/i915/xehp: VDBOX/VEBOX fusing registers are
 enable-based
Message-ID: <20210701220635.e3ukhvoqsenroxpy@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-5-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210701202427.1547543-5-matthew.d.roper@intel.com>
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 01, 2021 at 01:23:38PM -0700, Matt Roper wrote:
>From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
>On Xe_HP the fusing register is renamed and changed to have the "enable"
>semantics, but otherwise remains compatible (mmio address, bitmask
>ranges) with older platforms.
>
>To simplify things we do not add a new register definition but just stop
>inverting the fusing masks before processing them.
>
>Bspec: 33288

This is now:

Bspec: 52615

>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


this change above,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/intel_engine_cs.c | 9 ++++++++-
> 1 file changed, 8 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>index 88694822716a..151870d8fdd3 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>@@ -468,7 +468,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
> 	if (GRAPHICS_VER(i915) < 11)
> 		return info->engine_mask;
>
>-	media_fuse = ~intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
>+	/*
>+	 * On newer platforms the fusing register is called 'enable' and has
>+	 * enable semantics, while on older platforms it is called 'disable'
>+	 * and bits have disable semantices.
>+	 */
>+	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
>+	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
>+		media_fuse = ~media_fuse;
>
> 	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
> 	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
>-- 
>2.25.4
>
