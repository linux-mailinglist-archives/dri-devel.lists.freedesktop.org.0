Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9366A3B9889
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 00:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153906EC6C;
	Thu,  1 Jul 2021 22:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263B66EC6A;
 Thu,  1 Jul 2021 22:19:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208585793"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208585793"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:19:17 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="420593294"
Received: from aebanas-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.38.1])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 15:19:16 -0700
Date: Thu, 1 Jul 2021 15:19:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 05/53] drm/i915/gen12: Use fuse info to
 enable SFC
Message-ID: <20210701221910.szs35oqn4mxdhocf@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-6-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210701202427.1547543-6-matthew.d.roper@intel.com>
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

On Thu, Jul 01, 2021 at 01:23:39PM -0700, Matt Roper wrote:
>From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
>
>In Gen12 there are various fuse combinations and in each configuration
>vdbox engine may be connected to SFC depending on which engines are
>available, so we need to set the SFC capability based on fuse value from
>the hardware. Even numbered phyical instance always have SFC, odd
>numbered physical instances have SFC only if previous even instance is
>fused off.
>
>Bspec: 48028

considering that in TGL we have physical instances 0 and 2 (both even),
we can use this logic, so it's correct correct for GRAPHICS_VER(i915) == 12.
Although I wonder ifwe should be using MEDIA_VER(i915) here.


>Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Signed-off-by: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/i915/gt/intel_engine_cs.c | 30 ++++++++++++++++++-----
> 1 file changed, 24 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>index 151870d8fdd3..4ab2c9abb943 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>@@ -442,6 +442,28 @@ void intel_engines_free(struct intel_gt *gt)
> 	}
> }
>
>+static inline
>+bool vdbox_has_sfc(struct drm_i915_private *i915, unsigned int physical_vdbox,
>+		   unsigned int logical_vdbox, u16 vdbox_mask)
>+{
>+	/*
>+	 * In Gen11, only even numbered logical VDBOXes are hooked
>+	 * up to an SFC (Scaler & Format Converter) unit.
>+	 * In Gen12, Even numbered phyical instance always are connected
>+	 * to an SFC. Odd numbered physical instances have SFC only if
>+	 * previous even instance is fused off.
>+	 */
>+	if (GRAPHICS_VER(i915) == 12) {
>+		return (physical_vdbox % 2 == 0) ||
>+			!(BIT(physical_vdbox - 1) & vdbox_mask);
>+	} else if (GRAPHICS_VER(i915) == 11) {
>+		return logical_vdbox % 2 == 0;
>+	}
>+
>+	MISSING_CASE(GRAPHICS_VER(i915));
>+	return false;
>+}
>+
> /*
>  * Determine which engines are fused off in our particular hardware.
>  * Note that we have a catch-22 situation where we need to be able to access
>@@ -493,13 +515,9 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
> 			continue;
> 		}
>
>-		/*
>-		 * In Gen11, only even numbered logical VDBOXes are
>-		 * hooked up to an SFC (Scaler & Format Converter) unit.
>-		 * In TGL each VDBOX has access to an SFC.
>-		 */
>-		if (GRAPHICS_VER(i915) >= 12 || logical_vdbox++ % 2 == 0)
>+		if (vdbox_has_sfc(i915, i, logical_vdbox, vdbox_mask))
> 			gt->info.vdbox_sfc_access |= BIT(i);
>+		logical_vdbox++;
> 	}
> 	drm_dbg(&i915->drm, "vdbox enable: %04x, instances: %04lx\n",
> 		vdbox_mask, VDBOX_MASK(gt));
>-- 
>2.25.4
>
>_______________________________________________
>Intel-gfx mailing list
>Intel-gfx@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/intel-gfx
