Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E344D6942
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 21:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B3410E0D3;
	Fri, 11 Mar 2022 19:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BA910E0D3;
 Fri, 11 Mar 2022 19:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647028797; x=1678564797;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cmL0IXAiid100nFm5k85vgMa2w10gMENkGZBcAgsTL8=;
 b=PCBaNxOsby2zkW9xWDpUX0rnmkoYpUPYwhw/iz28ntlLi8+mSNn8q9Kj
 wpdq9nb1MZd8ooHnHVxH1vl2z2NzULgp392s3llSMZWKKb1Vpzfygl2xe
 6CX7hfTBi+m/fi/tEtIO+FpyUrta0VSh7vT1nOS8UH52gzWjC7nACoIta
 uoB9DpQ3NSJ+z9osRp8bwE45MVyoAsctu2VhyvbPJ6hHNB8KO44acUzzj
 gGlzKHgZcKCzbDAg9zu3VcOkZ2R1GhkJDWb1HAZ/AxfoOO6o+U7p53rEg
 1ycD/PxGHOy2L5gqS2EdJl8nhUvHzMvq0+0pIrBLG2W6wf0NkAlf+d0F3 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="235596703"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="235596703"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 11:59:56 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="496866381"
Received: from rbgreen-mobl3.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.239.245])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 11:59:56 -0800
Date: Fri, 11 Mar 2022 11:59:56 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/xehp: Update topology dumps for
 Xe_HP
Message-ID: <20220311195956.yphhgogafoetln6k@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220311061543.153611-1-matthew.d.roper@intel.com>
 <20220311061543.153611-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220311061543.153611-2-matthew.d.roper@intel.com>
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

On Thu, Mar 10, 2022 at 10:15:43PM -0800, Matt Roper wrote:
>When running on Xe_HP or beyond, let's use an updated format for
>describing topology in our error state dumps and debugfs to give a
>more accurate view of the hardware:
>
> - Just report DSS directly without the legacy "slice0" output that's no
>   longer meaningful.
> - Indicate whether each DSS is accessible for geometry and/or compute.
> - Rename "rcs_topology" to "sseu_topology" since the information
>   reported is common to both RCS and CCS engines now.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_sseu.c         | 48 +++++++++++++++++---
> drivers/gpu/drm/i915/gt/intel_sseu.h         |  3 +-
> drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c |  8 ++--
> drivers/gpu/drm/i915/i915_gpu_error.c        |  2 +-
> 4 files changed, 48 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
>index 614915ffbd37..4d28458ab768 100644
>--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
>+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
>@@ -10,6 +10,8 @@
> #include "intel_gt_regs.h"
> #include "intel_sseu.h"
>
>+#include "linux/string_helpers.h"
>+
> void intel_sseu_set_info(struct sseu_dev_info *sseu, u8 max_slices,
> 			 u8 max_subslices, u8 max_eus_per_subslice)
> {
>@@ -54,6 +56,11 @@ u32 intel_sseu_get_subslices(const struct sseu_dev_info *sseu, u8 slice)
> 	return _intel_sseu_get_subslices(sseu, sseu->subslice_mask, slice);

this func with a single underscore is the one inconsistent with the rest of the file.
Just rename it while touching this part of the code?

> }
>
>+u32 intel_sseu_get_geometry_subslices(const struct sseu_dev_info *sseu)

since it's only local to this compilation unit, make it static and
remove the intel_ prefix?

>+{
>+	return _intel_sseu_get_subslices(sseu, sseu->geometry_subslice_mask, 0);
>+}
>+
> u32 intel_sseu_get_compute_subslices(const struct sseu_dev_info *sseu)
> {
> 	return _intel_sseu_get_subslices(sseu, sseu->compute_subslice_mask, 0);
>@@ -720,16 +727,11 @@ void intel_sseu_dump(const struct sseu_dev_info *sseu, struct drm_printer *p)
> 		   str_yes_no(sseu->has_eu_pg));
> }
>
>-void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
>-			       struct drm_printer *p)
>+static void intel_sseu_print_legacy_topology(const struct sseu_dev_info *sseu,

removing the intel_ prefix would make it consistent with the rest of the file too

>+					     struct drm_printer *p)
> {
> 	int s, ss;
>
>-	if (sseu->max_slices == 0) {
>-		drm_printf(p, "Unavailable\n");
>-		return;
>-	}
>-
> 	for (s = 0; s < sseu->max_slices; s++) {
> 		drm_printf(p, "slice%d: %u subslice(s) (0x%08x):\n",
> 			   s, intel_sseu_subslices_per_slice(sseu, s),
>@@ -744,6 +746,38 @@ void intel_sseu_print_topology(const struct sseu_dev_info *sseu,
> 	}
> }
>
>+static void intel_sseu_print_xehp_topology(const struct sseu_dev_info *sseu,
>+					   struct drm_printer *p)

ditto

>+{
>+	u32 g_dss_mask = intel_sseu_get_geometry_subslices(sseu);
>+	u32 c_dss_mask = intel_sseu_get_compute_subslices(sseu);
>+	int dss;
>+
>+	for (dss = 0; dss < sseu->max_subslices; dss++) {
>+		u16 enabled_eus = sseu_get_eus(sseu, 0, dss);
>+
>+		drm_printf(p, "DSS%02d: G:%3s C:%3s, %2u EUs (0x%04hx)\n", dss,
>+			   str_yes_no(g_dss_mask & BIT(dss)),
>+			   str_yes_no(c_dss_mask & BIT(dss)),
>+			   hweight16(enabled_eus), enabled_eus);
>+	}
>+}
>+
>+
>+void intel_sseu_print_topology(struct drm_i915_private *i915,
>+			       const struct sseu_dev_info *sseu,
>+			       struct drm_printer *p)
>+{
>+	if (sseu->max_slices == 0) {
>+		drm_printf(p, "Unavailable\n");
>+		return;

either make this an early return, or remove the return

other than coding style nits metioned above,


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
