Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E5E4C846D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 07:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DEA10E2A4;
	Tue,  1 Mar 2022 06:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527FE10E2A4;
 Tue,  1 Mar 2022 06:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646117877; x=1677653877;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3TZ92EOXkmCvhDyFD50FVUzfM/qz/Vun0m9Htc59YTU=;
 b=lUC/DMlXHsCEyKWLD09/Bz8QIR59fEk4gzlmO5bhjRJNNhmEjVKxRCXI
 EH5SZI8NEYheDNSSkoONjsloX4Jqjgko9sXCEDh6ZNOcNLl3TCED2Nwft
 UESqDbHo8CyIH9u/GF3EbEUvwjxltGd8DkUlPZ9g5Fu9N2CETS7Q20xlQ
 91DgJk9W1s6bRu5Ci7yh+csdWGY2hIoE36cvOcF3PDGK+ZTxRbyX20bwR
 AvC3XJ4MmLHo2QjGm6z01/jrnvjtL0UIdkwY+l+krNYnPAz2SFTuEOVcz
 2pUzVvbU/OHxWDDMGUIU0NlcNupHAt1MglzkMNnTTILq585olRKw2MwdB g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240484791"
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="240484791"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 22:57:55 -0800
X-IronPort-AV: E=Sophos;i="5.90,145,1643702400"; d="scan'208";a="510403897"
Received: from ramyaman-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.150.64])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 22:57:54 -0800
Date: Mon, 28 Feb 2022 22:57:54 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 06/13] drm/i915: Move context descriptor
 fields to intel_lrc.h
Message-ID: <20220301065754.jftzwchd4bh3g5ve@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
 <20220228174245.1569581-7-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220228174245.1569581-7-matthew.d.roper@intel.com>
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

On Mon, Feb 28, 2022 at 09:42:38AM -0800, Matt Roper wrote:
>This is a more appropriate header for these definitions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_engine_cs.c |  1 +
> drivers/gpu/drm/i915/gt/intel_gt_regs.h   | 34 -----------------------
> drivers/gpu/drm/i915/gt/intel_lrc.h       | 34 +++++++++++++++++++++++
> 3 files changed, 35 insertions(+), 34 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>index edba18c942cf..b0982a9e4476 100644
>--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>@@ -21,6 +21,7 @@
> #include "intel_gt.h"
> #include "intel_gt_requests.h"
> #include "intel_gt_pm.h"
>+#include "intel_lrc.h"
> #include "intel_lrc_reg.h"
> #include "intel_reset.h"
> #include "intel_ring.h"
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>index 69b826a3c381..84f189738a68 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>@@ -1499,38 +1499,4 @@
>
> #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
>
>-enum {
>-	INTEL_ADVANCED_CONTEXT = 0,
>-	INTEL_LEGACY_32B_CONTEXT,
>-	INTEL_ADVANCED_AD_CONTEXT,
>-	INTEL_LEGACY_64B_CONTEXT
>-};
>-
>-enum {
>-	FAULT_AND_HANG = 0,
>-	FAULT_AND_HALT, /* Debug only */
>-	FAULT_AND_STREAM,
>-	FAULT_AND_CONTINUE /* Unsupported */
>-};
>-
>-#define   CTX_GTT_ADDRESS_MASK			GENMASK(31, 12)
>-#define   GEN8_CTX_VALID			(1 << 0)
>-#define   GEN8_CTX_FORCE_PD_RESTORE		(1 << 1)
>-#define   GEN8_CTX_FORCE_RESTORE		(1 << 2)
>-#define   GEN8_CTX_L3LLC_COHERENT		(1 << 5)
>-#define   GEN8_CTX_PRIVILEGE			(1 << 8)
>-#define   GEN8_CTX_ADDRESSING_MODE_SHIFT	3
>-#define   GEN8_CTX_ID_SHIFT			32
>-#define   GEN8_CTX_ID_WIDTH			21
>-#define   GEN11_SW_CTX_ID_SHIFT			37
>-#define   GEN11_SW_CTX_ID_WIDTH			11
>-#define   GEN11_ENGINE_CLASS_SHIFT		61
>-#define   GEN11_ENGINE_CLASS_WIDTH		3
>-#define   GEN11_ENGINE_INSTANCE_SHIFT		48
>-#define   GEN11_ENGINE_INSTANCE_WIDTH		6
>-#define   XEHP_SW_CTX_ID_SHIFT			39
>-#define   XEHP_SW_CTX_ID_WIDTH			16
>-#define   XEHP_SW_COUNTER_SHIFT			58
>-#define   XEHP_SW_COUNTER_WIDTH			6
>-
> #endif /* __INTEL_GT_REGS__ */
>diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
>index 0b76f096b559..820f8f41fc1f 100644
>--- a/drivers/gpu/drm/i915/gt/intel_lrc.h
>+++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
>@@ -69,4 +69,38 @@ void lrc_check_regs(const struct intel_context *ce,
>
> void lrc_update_runtime(struct intel_context *ce);
>
>+enum {
>+	INTEL_ADVANCED_CONTEXT = 0,
>+	INTEL_LEGACY_32B_CONTEXT,
>+	INTEL_ADVANCED_AD_CONTEXT,
>+	INTEL_LEGACY_64B_CONTEXT
>+};
>+
>+enum {
>+	FAULT_AND_HANG = 0,
>+	FAULT_AND_HALT, /* Debug only */
>+	FAULT_AND_STREAM,
>+	FAULT_AND_CONTINUE /* Unsupported */
>+};
>+
>+#define   CTX_GTT_ADDRESS_MASK			GENMASK(31, 12)

I don't like changing code while moving, but I'd open an exception here
just to fix these 2 spaces in this block. Anyway, up to you:


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>+#define   GEN8_CTX_VALID			(1 << 0)
>+#define   GEN8_CTX_FORCE_PD_RESTORE		(1 << 1)
>+#define   GEN8_CTX_FORCE_RESTORE		(1 << 2)
>+#define   GEN8_CTX_L3LLC_COHERENT		(1 << 5)
>+#define   GEN8_CTX_PRIVILEGE			(1 << 8)
>+#define   GEN8_CTX_ADDRESSING_MODE_SHIFT	3
>+#define   GEN8_CTX_ID_SHIFT			32
>+#define   GEN8_CTX_ID_WIDTH			21
>+#define   GEN11_SW_CTX_ID_SHIFT			37
>+#define   GEN11_SW_CTX_ID_WIDTH			11
>+#define   GEN11_ENGINE_CLASS_SHIFT		61
>+#define   GEN11_ENGINE_CLASS_WIDTH		3
>+#define   GEN11_ENGINE_INSTANCE_SHIFT		48
>+#define   GEN11_ENGINE_INSTANCE_WIDTH		6
>+#define   XEHP_SW_CTX_ID_SHIFT			39
>+#define   XEHP_SW_CTX_ID_WIDTH			16
>+#define   XEHP_SW_COUNTER_SHIFT			58
>+#define   XEHP_SW_COUNTER_WIDTH			6
>+
> #endif /* __INTEL_LRC_H__ */
>-- 
>2.34.1
>
