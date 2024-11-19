Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C65D9D24F8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 12:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DA910E621;
	Tue, 19 Nov 2024 11:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN0fIo/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BC010E621;
 Tue, 19 Nov 2024 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732016196; x=1763552196;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+NJSxT0tixUqPrWLNLpT3A61lKTI2KK8UuprTiGMVhk=;
 b=YN0fIo/FiK2hkk2nASHn6WISH4+A6N72ERC41IheUjVY+iI7M/mw72BT
 CekwQM4dakBLnK6ynNIGOLFuI5TctUGipN4DcZZKCwQnDuqOuMbjErq+s
 0rFDDEbKUOFyR1y4L8uJJy74/6etmPiuesRZ660/YVd20Cry+AnsOpGRs
 cYRyBg7pKTeJwrSvVX4mDo272Zs+pLnTMHR06TcKgl8Vvc9pKi1UsT/Gf
 vN28U3oI0KiESABbJOvfos1jtwGudVH5X/YDIl5ogcRGmh2gGVWnPlbhC
 9mBLEbLtcqm6CFTxWNAn71SdKi17bjQqNKvLF1u/SOVW8CJng37F0TfWq Q==;
X-CSE-ConnectionGUID: p32WSVAQR+iMCVjqqLR5WA==
X-CSE-MsgGUID: 6UfM2ZvsSPGSLBx+aPDt0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32253573"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32253573"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:36:36 -0800
X-CSE-ConnectionGUID: f/QQYSUsQmWc1YS7qHbVig==
X-CSE-MsgGUID: loGhZ/rYRUOC8GZ6my5sRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89919569"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 03:36:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCHv4 4/8] drm/i915/histogram: histogram interrupt handling
In-Reply-To: <20241119104521.575377-5-arun.r.murthy@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <20241119104521.575377-5-arun.r.murthy@intel.com>
Date: Tue, 19 Nov 2024 13:36:30 +0200
Message-ID: <87o72b316p.fsf@intel.com>
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

On Tue, 19 Nov 2024, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> Upon enabling histogram an interrupt is trigerred after the generation
> of the statistics. This patch registers the histogram interrupt and
> handles the interrupt.
>
> v2: Added intel_crtc backpointer to intel_histogram struct (Jani)
>     Removed histogram_wq and instead use dev_priv->unodered_eq (Jani)
> v3: Replaced drm_i915_private with intel_display (Suraj)
>     Refactored the histogram read code (Jani)
> v4: Rebased after addressing comments on patch 1
>
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_display_irq.c  |  6 +-
>  .../gpu/drm/i915/display/intel_histogram.c    | 93 +++++++++++++++++++
>  .../gpu/drm/i915/display/intel_histogram.h    |  3 +
>  drivers/gpu/drm/i915/i915_reg.h               |  5 +-
>  4 files changed, 104 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
> index f0d3bdb5fc60..cb60c9db4418 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_irq.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
> @@ -20,6 +20,7 @@
>  #include "intel_fdi_regs.h"
>  #include "intel_fifo_underrun.h"
>  #include "intel_gmbus.h"
> +#include "intel_histogram.h"
>  #include "intel_hotplug_irq.h"
>  #include "intel_pipe_crc_regs.h"
>  #include "intel_pmdemand.h"
> @@ -1179,6 +1180,9 @@ void gen8_de_irq_handler(struct drm_i915_private *dev_priv, u32 master_ctl)
>  		if (iir & GEN8_PIPE_FIFO_UNDERRUN)
>  			intel_cpu_fifo_underrun_irq_handler(dev_priv, pipe);
>  
> +		if (iir & GEN9_PIPE_HISTOGRAM_EVENT)
> +			intel_histogram_irq_handler(display, pipe);
> +
>  		fault_errors = iir & gen8_de_pipe_fault_mask(dev_priv);
>  		if (fault_errors)
>  			drm_err_ratelimited(&dev_priv->drm,
> @@ -1764,7 +1768,7 @@ void gen8_de_irq_postinstall(struct drm_i915_private *dev_priv)
>  	struct intel_uncore *uncore = &dev_priv->uncore;
>  
>  	u32 de_pipe_masked = gen8_de_pipe_fault_mask(dev_priv) |
> -		GEN8_PIPE_CDCLK_CRC_DONE;
> +		GEN8_PIPE_CDCLK_CRC_DONE | GEN9_PIPE_HISTOGRAM_EVENT;
>  	u32 de_pipe_enables;
>  	u32 de_port_masked = gen8_de_port_aux_mask(dev_priv);
>  	u32 de_port_enables;
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
> index e751977fc6f7..16f29923ef10 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -18,6 +18,8 @@
>  #define HISTOGRAM_GUARDBAND_THRESHOLD_DEFAULT 300    // 3.0% of the pipe's current pixel count.
>  #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000   // Precision factor for threshold guardband.
>  #define HISTOGRAM_DEFAULT_GUARDBAND_DELAY 0x04
> +#define HISTOGRAM_BIN_READ_RETRY_COUNT 5
> +#define HISTOGRAM_BIN_READ_DELAY 2

The above are only used once each. Please just put the values
inline. Here, you don't even know what "2" means without looking up the
code.

>  
>  struct intel_histogram {
>  	struct intel_crtc *crtc;
> @@ -27,6 +29,92 @@ struct intel_histogram {
>  	u32 bin_data[HISTOGRAM_BIN_COUNT];
>  };
>  
> +static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
> +{
> +	struct intel_display *display = to_intel_display(intel_crtc);
> +	struct intel_histogram *histogram = intel_crtc->histogram;
> +	u8 index, retry_count;

These should be ints.

> +	u32 dpstbin;
> +
> +	index = 0;
> +	retry_count = 0;
> +
> +	while (index < HISTOGRAM_BIN_COUNT) {

This should be a for loop

	for (index = 0; index < ARRAY_SIZE(histogram->bin_data); i++)

Any retries should be handled in a separate loop instead of abusing the
top level loop for two things.

Based on how this is now, looks like the retry loop should be outside of
this function altogether? I.e. a single busy response leads to retry
from start?

> +		dpstbin = intel_de_read(display, DPST_BIN(intel_crtc->pipe));
> +		if (!(dpstbin & DPST_BIN_BUSY)) {
> +			histogram->bin_data[index] = dpstbin & DPST_BIN_DATA_MASK;
> +			index++;
> +		} else {
> +			/*
> +			 * If DPST_BIN busy bit is set, then set the
> +			 * DPST_CTL bin reg index to 0 and proceed
> +			 * from beginning.
> +			 */

That's just saying the same thing as the code in English. What's the
point?

> +			retry_count++;
> +			if (retry_count > HISTOGRAM_BIN_READ_RETRY_COUNT) {
> +				drm_err(display->drm, "Histogram bin read failed with max retry\n");
> +				return false;
> +			}
> +			/* Add a delay before retrying */

The comment says the same thing as the code.

> +			fsleep(HISTOGRAM_BIN_READ_DELAY);
> +			index = 0;
> +			intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +				     DPST_CTL_BIN_REG_FUNC_SEL |
> +				     DPST_CTL_BIN_REG_MASK, 0);

This is duplicated; see the retry loop placement.

> +		}
> +	}
> +	return true;
> +}
> +
> +static void intel_histogram_handle_int_work(struct work_struct *work)
> +{
> +	struct intel_histogram *histogram = container_of(work,
> +		struct intel_histogram, work.work);
> +	struct intel_crtc *intel_crtc = histogram->crtc;
> +	struct intel_display *display = to_intel_display(intel_crtc);
> +	char *histogram_event[] = {"HISTOGRAM=1", NULL};

Not sure it's great that this is a global uevent instead of having more
detailed information. Maybe it should have the CRTC details?

> +
> +	/*
> +	 * TODO: PSR to be exited while reading the Histogram data
> +	 * Set DPST_CTL Bin Reg function select to TC
> +	 * Set DPST_CTL Bin Register Index to 0
> +	 */
> +	intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +		     DPST_CTL_BIN_REG_FUNC_SEL | DPST_CTL_BIN_REG_MASK, 0);
> +	if (intel_histogram_get_data(intel_crtc)) {
> +		/* Notify user for Histogram rediness */
> +		if (kobject_uevent_env(&display->drm->primary->kdev->kobj,
> +				       KOBJ_CHANGE, histogram_event))
> +			drm_err(display->drm,
> +				"sending HISTOGRAM event failed\n");
> +	}

So you probably want to add the retry loop here. This avoids duplicating
the DPST_CTL rmw.

> +
> +	/* Enable histogram interrupt */
> +	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe), DPST_GUARD_HIST_INT_EN,
> +		     DPST_GUARD_HIST_INT_EN);
> +
> +	/* Clear histogram interrupt by setting histogram interrupt status bit*/
> +	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> +		     DPST_GUARD_HIST_EVENT_STATUS, 1);
> +}
> +
> +void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe)
> +{
> +	struct intel_crtc *intel_crtc =
> +		to_intel_crtc(drm_crtc_from_index(display->drm, pipe));
> +	struct intel_histogram *histogram = intel_crtc->histogram;
> +	struct drm_i915_private *i915 = to_i915(intel_crtc->base.dev);
> +
> +	if (!histogram->enable) {
> +		drm_err(display->drm,
> +			"spurious interrupt, histogram not enabled\n");
> +		return;
> +	}
> +
> +	queue_delayed_work(i915->unordered_wq,
> +			   &histogram->work, 0);
> +}
> +
>  int intel_histogram_atomic_check(struct intel_crtc *intel_crtc)
>  {
>  	struct intel_histogram *histogram = intel_crtc->histogram;
> @@ -113,6 +201,7 @@ static void intel_histogram_disable(struct intel_crtc *intel_crtc)
>  	intel_de_rmw(display, DPST_CTL(pipe),
>  		     DPST_CTL_IE_HIST_EN, 0);
>  
> +	cancel_delayed_work(&histogram->work);
>  	histogram->enable = false;
>  }
>  
> @@ -174,6 +263,7 @@ void intel_histogram_finish(struct intel_crtc *intel_crtc)
>  {
>  	struct intel_histogram *histogram = intel_crtc->histogram;
>  
> +	cancel_delayed_work_sync(&histogram->work);
>  	kfree(histogram);
>  }
>  
> @@ -191,5 +281,8 @@ int intel_histogram_init(struct intel_crtc *intel_crtc)
>  	histogram->crtc = intel_crtc;
>  	histogram->can_enable = false;
>  
> +	INIT_DEFERRABLE_WORK(&histogram->work,
> +			     intel_histogram_handle_int_work);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
> index 9d66724f9c53..14f2425e3038 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.h
> @@ -9,6 +9,8 @@
>  #include <linux/types.h>
>  
>  struct intel_crtc;
> +struct intel_display;
> +enum pipe;
>  
>  #define HISTOGRAM_BIN_COUNT                    32
>  #define HISTOGRAM_IET_LENGTH                   33
> @@ -27,6 +29,7 @@ enum intel_global_hist_lut {
>  };
>  
>  int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
> +void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe);
>  int intel_histogram_update(struct intel_crtc *intel_crtc, bool enable);
>  int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc, u32 *data);
>  int intel_histogram_init(struct intel_crtc *intel_crtc);
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 7a35be56b7ef..40a7c6a77bcc 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -1605,7 +1605,7 @@
>  #define   PIPE_HOTPLUG_INTERRUPT_ENABLE		(1UL << 26)
>  #define   PIPE_VSYNC_INTERRUPT_ENABLE		(1UL << 25)
>  #define   PIPE_DISPLAY_LINE_COMPARE_ENABLE	(1UL << 24)
> -#define   PIPE_DPST_EVENT_ENABLE		(1UL << 23)
> +#define   PIPE_HISTOGRAM_EVENT_ENABLE		(1UL << 23)
>  #define   SPRITE0_FLIP_DONE_INT_EN_VLV		(1UL << 22)
>  #define   PIPE_LEGACY_BLC_EVENT_ENABLE		(1UL << 22)
>  #define   PIPE_ODD_FIELD_INTERRUPT_ENABLE	(1UL << 21)
> @@ -1628,7 +1628,7 @@
>  #define   PIPE_HOTPLUG_INTERRUPT_STATUS		(1UL << 10)
>  #define   PIPE_VSYNC_INTERRUPT_STATUS		(1UL << 9)
>  #define   PIPE_DISPLAY_LINE_COMPARE_STATUS	(1UL << 8)
> -#define   PIPE_DPST_EVENT_STATUS		(1UL << 7)
> +#define   PIPE_HISTOGRAM_EVENT_STATUS		(1UL << 7)
>  #define   PIPE_A_PSR_STATUS_VLV			(1UL << 6)
>  #define   PIPE_LEGACY_BLC_EVENT_STATUS		(1UL << 6)
>  #define   PIPE_ODD_FIELD_INTERRUPT_STATUS	(1UL << 5)
> @@ -2470,6 +2470,7 @@
>  #define  GEN12_DSB_1_INT		REG_BIT(14) /* tgl+ */
>  #define  GEN12_DSB_0_INT		REG_BIT(13) /* tgl+ */
>  #define  GEN12_DSB_INT(dsb_id)		REG_BIT(13 + (dsb_id))
> +#define  GEN9_PIPE_HISTOGRAM_EVENT	REG_BIT(12) /* skl+ */
>  #define  GEN9_PIPE_CURSOR_FAULT		REG_BIT(11) /* skl+ */
>  #define  GEN9_PIPE_PLANE4_FAULT		REG_BIT(10) /* skl+ */
>  #define  GEN8_PIPE_CURSOR_FAULT		REG_BIT(10) /* bdw */

-- 
Jani Nikula, Intel
