Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FC66EDF13
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 11:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A07010E6E1;
	Tue, 25 Apr 2023 09:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 447 seconds by postgrey-1.36 at gabe;
 Mon, 24 Apr 2023 09:57:19 UTC
Received: from mail02.habana.ai (habanamailrelay.habana.ai [213.57.90.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4461E10E446;
 Mon, 24 Apr 2023 09:57:18 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1682329743; bh=4P2YEGHVYLx0WgaiiE3VVLMyKF6Z1ltaVsFnpniBoyQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eLpRJIo/8NE1ifeoxATGaB7aMc9WCL2x3GANRhFUwqmm/BIkXsWbkM1mifXztlo9f
 vsioRRFAEyUBgwNH4FjM3b+NZq8oEBAMm1keasNTxDAFK2klR1w30Syw80RWfahBBH
 cnuj57YAGXx5SK/vbeRkaAjNucEdWNJWIaF4XtV6mADx/uunWdffO9bGgfGCHub3LJ
 bbCyf4pnnuRhpg2cPSZBQBG7QEXh7ZFYh71t/Tu9BoH00gYfIr697clQ2yVXOArsu6
 6IVHefa8AL/Xdmu0haOGNXd6BUWZC0YR/Wx5r86KqDCA8YnWWRw84uw5lzDh/LEXvn
 WDoLGrLtb4ryQ==
Received: from dhirschfeld-vm-u20.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u20.habana-labs.com (8.15.2/8.15.2/Debian-18) with ESMTPS id
 33O9nafv861320
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 12:49:37 +0300
Date: Mon, 24 Apr 2023 12:49:36 +0300
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/4] drm/xe/ras: Log the GT hw errors.
Message-ID: <20230424094936.pc7qki5n6qq2aadm@dhirschfeld-vm-u20.habana-labs.com>
References: <20230406092223.2819951-1-himal.prasad.ghimiray@intel.com>
 <20230406092223.2819951-3-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20230406092223.2819951-3-himal.prasad.ghimiray@intel.com>
X-Mailman-Approved-At: Tue, 25 Apr 2023 09:21:07 +0000
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06.04.2023 14:52, Himal Prasad Ghimiray wrote:
>From: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>
>Count the CORRECTABLE and FATAL GT hardware errors as
>signaled by relevant interrupt and respective registers.
>
>For non relevant interrupts count them as driver interrupt error.
>
>For platform supporting error vector registers count and report
>the respective vector errors.
>
>Co-authored-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_regs.h    |  77 ++++++-
> drivers/gpu/drm/xe/xe_device_types.h |   2 +
> drivers/gpu/drm/xe/xe_gt.c           |  29 +++
> drivers/gpu/drm/xe/xe_gt_types.h     |  43 ++++
> drivers/gpu/drm/xe/xe_irq.c          | 332 ++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_pci.c          |   3 +
> 6 files changed, 453 insertions(+), 33 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>index dff74b093d4e..b3d35d0c5a77 100644
>--- a/drivers/gpu/drm/xe/regs/xe_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>@@ -122,14 +122,50 @@ enum hardware_error {
> 	HARDWARE_ERROR_MAX,
> };
>
>+#define DEV_PCIEERR_STATUS              _MMIO(0x100180)
>+#define DEV_PCIEERR_IS_FATAL(x)         (REG_BIT(2) << (x * 4))
> #define _DEV_ERR_STAT_FATAL             0x100174
> #define _DEV_ERR_STAT_NONFATAL          0x100178
> #define _DEV_ERR_STAT_CORRECTABLE       0x10017c
> #define DEV_ERR_STAT_REG(x)             _MMIO(_PICK_EVEN((x), \
> 						_DEV_ERR_STAT_CORRECTABLE, \
> 						_DEV_ERR_STAT_NONFATAL))
>+
> #define  DEV_ERR_STAT_GT_ERROR          REG_BIT(0)
>
>+enum gt_vctr_registers {
>+	ERR_STAT_GT_VCTR0 = 0,
>+	ERR_STAT_GT_VCTR1,
>+	ERR_STAT_GT_VCTR2,
>+	ERR_STAT_GT_VCTR3,
>+	ERR_STAT_GT_VCTR4,
>+	ERR_STAT_GT_VCTR5,
>+	ERR_STAT_GT_VCTR6,
>+	ERR_STAT_GT_VCTR7,
>+};
>+
>+#define ERR_STAT_GT_COR_VCTR_LEN        (4)
>+#define _ERR_STAT_GT_COR_VCTR_0         0x1002a0
>+#define _ERR_STAT_GT_COR_VCTR_1         0x1002a4
>+#define _ERR_STAT_GT_COR_VCTR_2         0x1002a8
>+#define _ERR_STAT_GT_COR_VCTR_3         0x1002ac
>+#define ERR_STAT_GT_COR_VCTR_REG(x)     _MMIO(_PICK_EVEN((x), \
>+						_ERR_STAT_GT_COR_VCTR_0, \
>+						_ERR_STAT_GT_COR_VCTR_1))
>+
>+#define ERR_STAT_GT_FATAL_VCTR_LEN      (8)
>+#define _ERR_STAT_GT_FATAL_VCTR_0       0x100260
>+#define _ERR_STAT_GT_FATAL_VCTR_1       0x100264
>+#define _ERR_STAT_GT_FATAL_VCTR_2       0x100268
>+#define _ERR_STAT_GT_FATAL_VCTR_3       0x10026c
>+#define _ERR_STAT_GT_FATAL_VCTR_4       0x100270
>+#define _ERR_STAT_GT_FATAL_VCTR_5       0x100274
>+#define _ERR_STAT_GT_FATAL_VCTR_6       0x100278
>+#define _ERR_STAT_GT_FATAL_VCTR_7       0x10027c
>+#define ERR_STAT_GT_FATAL_VCTR_REG(x)   _MMIO(_PICK_EVEN((x), \
>+					_ERR_STAT_GT_FATAL_VCTR_0, \
>+					_ERR_STAT_GT_FATAL_VCTR_1))
>+
> #define _ERR_STAT_GT_COR                0x100160
> #define _ERR_STAT_GT_NONFATAL           0x100164
> #define _ERR_STAT_GT_FATAL              0x100168
>@@ -137,7 +173,42 @@ enum hardware_error {
> 						_ERR_STAT_GT_COR, \
> 						_ERR_STAT_GT_NONFATAL))
>
>-#define  EU_GRF_ERROR                   REG_BIT(15)
>-#define  EU_IC_ERROR                    REG_BIT(14)
>-
>+#define  EU_GRF_COR_ERR                 (15)
>+#define  EU_IC_COR_ERR                  (14)
>+#define  SLM_COR_ERR                    (13)
>+#define  SAMPLER_COR_ERR                (12)
>+#define  GUC_COR_ERR                    (1)
>+#define  L3_SNG_COR_ERR                 (0)
>+
>+#define PVC_COR_ERR_MASK \
>+		(REG_BIT(GUC_COR_ERR) | \
>+		 REG_BIT(SLM_COR_ERR) | \
>+		 REG_BIT(EU_IC_COR_ERR) | \
>+		 REG_BIT(EU_GRF_COR_ERR))
>+
>+#define EU_GRF_FAT_ERR                  (15)
>+#define EU_IC_FAT_ERR                   (14)
>+#define SLM_FAT_ERR                     (13)
>+#define SAMPLER_FAT_ERR                 (12)
>+#define SQIDI_FAT_ERR                   (9)
>+#define IDI_PAR_FAT_ERR                 (8)
>+#define GUC_FAT_ERR                     (6)
>+#define L3_ECC_CHK_FAT_ERR              (5)
>+#define L3_DOUBLE_FAT_ERR               (4)
>+#define FPU_UNCORR_FAT_ERR              (3)
>+#define ARRAY_BIST_FAT_ERR              (1)
>+
>+#define PVC_FAT_ERR_MASK \
>+		(REG_BIT(FPU_UNCORR_FAT_ERR) | \
>+		 REG_BIT(GUC_FAT_ERR)  | \
>+		 REG_BIT(SLM_FAT_ERR)  | \
>+		 REG_BIT(EU_GRF_FAT_ERR))
>+
>+#define GT_HW_ERROR_MAX_ERR_BITS        16
>+
>+#define _SLM_ECC_ERROR_CNT              0xe7f4
>+#define _SLM_UNCORR_ECC_ERROR_CNT       0xe7c0
>+#define SLM_ECC_ERROR_CNTR(x)           _MMIO((x) == HARDWARE_ERROR_CORRECTABLE ? \
>+						_SLM_ECC_ERROR_CNT : \
>+						_SLM_UNCORR_ECC_ERROR_CNT)
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 88f863edc41c..ecabf4d6690d 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -99,6 +99,8 @@ struct xe_device {
> 		bool has_link_copy_engine;
> 		/** @enable_display: display enabled */
> 		bool enable_display;
>+		/** @has_gt_error_vectors: whether platform supports ERROR VECTORS */
>+		bool has_gt_error_vectors;
>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> 		struct xe_device_display_info {
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index bc821f431c45..ce9ce2748394 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -44,6 +44,35 @@
> #include "xe_wa.h"
> #include "xe_wopcm.h"
>
>+static const char * const xe_gt_driver_errors_to_str[] = {
>+	[INTEL_GT_DRIVER_ERROR_INTERRUPT] = "INTERRUPT",
>+};
>+
>+void xe_gt_log_driver_error(struct xe_gt *gt,
>+			    const enum xe_gt_driver_errors error,
>+			    const char *fmt, ...)
>+{
>+	struct va_format vaf;
>+	va_list args;
>+
>+	va_start(args, fmt);
>+	vaf.fmt = fmt;
>+	vaf.va = &args;
>+
>+	BUILD_BUG_ON(ARRAY_SIZE(xe_gt_driver_errors_to_str) !=
>+		     INTEL_GT_DRIVER_ERROR_COUNT);
>+
>+	WARN_ON_ONCE(error >= INTEL_GT_DRIVER_ERROR_COUNT);
>+
>+	gt->errors.driver[error]++;
>+
>+	drm_err_ratelimited(&gt_to_xe(gt)->drm, "GT%u [%s] %pV",
>+			    gt->info.id,
>+			    xe_gt_driver_errors_to_str[error],
>+			    &vaf);
>+	va_end(args);
>+}
>+
> struct xe_gt *xe_find_full_gt(struct xe_gt *gt)
> {
> 	struct xe_gt *search;
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 8f29aba455e0..9580a40c0142 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -33,6 +33,43 @@ enum xe_gt_type {
> typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
> typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>
>+/* Count of GT Correctable and FATAL HW ERRORS */
>+enum intel_gt_hw_errors {
>+	INTEL_GT_HW_ERROR_COR_SUBSLICE = 0,
>+	INTEL_GT_HW_ERROR_COR_L3BANK,
>+	INTEL_GT_HW_ERROR_COR_L3_SNG,
>+	INTEL_GT_HW_ERROR_COR_GUC,
>+	INTEL_GT_HW_ERROR_COR_SAMPLER,
>+	INTEL_GT_HW_ERROR_COR_SLM,
>+	INTEL_GT_HW_ERROR_COR_EU_IC,
>+	INTEL_GT_HW_ERROR_COR_EU_GRF,
>+	INTEL_GT_HW_ERROR_FAT_SUBSLICE,
>+	INTEL_GT_HW_ERROR_FAT_L3BANK,
>+	INTEL_GT_HW_ERROR_FAT_ARR_BIST,
>+	INTEL_GT_HW_ERROR_FAT_FPU,
>+	INTEL_GT_HW_ERROR_FAT_L3_DOUB,
>+	INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK,
>+	INTEL_GT_HW_ERROR_FAT_GUC,
>+	INTEL_GT_HW_ERROR_FAT_IDI_PAR,
>+	INTEL_GT_HW_ERROR_FAT_SQIDI,
>+	INTEL_GT_HW_ERROR_FAT_SAMPLER,
>+	INTEL_GT_HW_ERROR_FAT_SLM,
>+	INTEL_GT_HW_ERROR_FAT_EU_IC,
>+	INTEL_GT_HW_ERROR_FAT_EU_GRF,
>+	INTEL_GT_HW_ERROR_FAT_TLB,
>+	INTEL_GT_HW_ERROR_FAT_L3_FABRIC,
>+	INTEL_GT_HW_ERROR_COUNT
>+};
>+
>+enum xe_gt_driver_errors {
>+	INTEL_GT_DRIVER_ERROR_INTERRUPT = 0,
>+	INTEL_GT_DRIVER_ERROR_COUNT
>+};
>+
>+void xe_gt_log_driver_error(struct xe_gt *gt,
>+			    const enum xe_gt_driver_errors error,
>+			    const char *fmt, ...);
>+
> struct xe_mmio_range {
> 	u32 start;
> 	u32 end;
>@@ -357,6 +394,12 @@ struct xe_gt {
> 	 *    of a steered operation
> 	 */
> 	spinlock_t mcr_lock;
>+
>+	struct intel_hw_errors {
>+		unsigned long hw[INTEL_GT_HW_ERROR_COUNT];
>+		unsigned long driver[INTEL_GT_DRIVER_ERROR_COUNT];
>+	} errors;
>+
> };
>
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index 6b922332bff1..4626f7280aaf 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -19,6 +19,7 @@
> #include "xe_hw_engine.h"
> #include "xe_mmio.h"
>
>+#define HAS_GT_ERROR_VECTORS(xe) ((xe)->info.has_gt_error_vectors)
> static void gen3_assert_iir_is_zero(struct xe_gt *gt, i915_reg_t reg)
> {
> 	u32 val = xe_mmio_read32(gt, reg.reg);
>@@ -359,44 +360,281 @@ hardware_error_type_to_str(const enum hardware_error hw_err)
> 	}
> }
>
>+#define xe_gt_hw_err(gt, fmt, ...) \
>+	drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "GT%d detected " fmt, \
>+			(gt)->info.id, ##__VA_ARGS__)
>+
> static void
>-xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>+xe_gt_correctable_hw_error_stats_update(struct xe_gt  *gt, unsigned long errstat)
> {
>-	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>-	u32 other_errors = ~(EU_GRF_ERROR | EU_IC_ERROR);
>-	u32 errstat;
>+	u32 errbit, cnt;
>
>-	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>+	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
>+		return;
>
>-	errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
>+	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
>+		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_COR_ERR_MASK)) {
>+			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
>+					       "UNKNOWN CORRECTABLE error\n");
>+			continue;
>+		}
>
>-	if (unlikely(!errstat)) {
>-		DRM_ERROR("ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
>-		return;
>+	switch (errbit) {

missing tab here?

>+	case L3_SNG_COR_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_COR_L3_SNG]++;
>+		xe_gt_hw_err(gt, "L3 SINGLE CORRECTABLE error\n");
>+		break;
>+	case GUC_COR_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_COR_GUC]++;
>+		xe_gt_hw_err(gt, "SINGLE BIT GUC SRAM CORRECTABLE error\n");
>+		break;
>+	case SAMPLER_COR_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SAMPLER]++;
>+		xe_gt_hw_err(gt, "SINGLE BIT SAMPLER CORRECTABLE error\n");
>+		break;
>+	case SLM_COR_ERR:
>+		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_CORRECTABLE).reg);
>+		gt->errors.hw[INTEL_GT_HW_ERROR_COR_SLM] = cnt;
>+		xe_gt_hw_err(gt, "%u SINGLE BIT SLM CORRECTABLE error\n", cnt);
>+		break;
>+	case EU_IC_COR_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_IC]++;
>+		xe_gt_hw_err(gt, "SINGLE BIT EU IC CORRECTABLE error\n");
>+		break;
>+	case EU_GRF_COR_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_COR_EU_GRF]++;
>+		xe_gt_hw_err(gt, "SINGLE BIT EU GRF CORRECTABLE error\n");
>+		break;
>+	default:
>+		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT, "UNKNOWN CORRECTABLE error\n");
>+		break;
>+	}
> 	}
>+}
>
>-	/*
>-	 * TODO: The GT Non Fatal Error Status Register
>-	 * only has reserved bitfields defined.
>-	 * Remove once there is something to service.
>-	 */
>-	if (hw_err == HARDWARE_ERROR_NONFATAL) {
>-		DRM_ERROR("detected Non-Fatal error\n");
>-		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
>+static void xe_gt_fatal_hw_error_stats_update(struct xe_gt *gt, unsigned long errstat)
>+{
>+	u32 errbit, cnt;
>+
>+	if (!errstat && HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
> 		return;
>+
>+	for_each_set_bit(errbit, &errstat, GT_HW_ERROR_MAX_ERR_BITS) {
>+		if (gt->xe->info.platform == XE_PVC && !(REG_BIT(errbit) & PVC_FAT_ERR_MASK)) {
>+			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
>+					       "UNKNOWN FATAL error\n");
>+			continue;
>+		}
>+
>+	switch (errbit) {

ditto,

Thanks,
Dafna

>+	case ARRAY_BIST_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_ARR_BIST]++;
>+		xe_gt_hw_err(gt, "Array BIST FATAL error\n");
>+		break;
>+	case FPU_UNCORR_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_FPU]++;
>+		xe_gt_hw_err(gt, "FPU FATAL error\n");
>+		break;
>+	case L3_DOUBLE_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_DOUB]++;
>+		xe_gt_hw_err(gt, "L3 Double FATAL error\n");
>+		break;
>+	case L3_ECC_CHK_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_ECC_CHK]++;
>+		xe_gt_hw_err(gt, "L3 ECC Checker FATAL error\n");
>+		break;
>+	case GUC_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_GUC]++;
>+		xe_gt_hw_err(gt, "GUC SRAM FATAL error\n");
>+		break;
>+	case IDI_PAR_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_IDI_PAR]++;
>+		xe_gt_hw_err(gt, "IDI PARITY FATAL error\n");
>+		break;
>+	case SQIDI_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SQIDI]++;
>+		xe_gt_hw_err(gt, "SQIDI FATAL error\n");
>+		break;
>+	case SAMPLER_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SAMPLER]++;
>+		xe_gt_hw_err(gt, "SAMPLER FATAL error\n");
>+		break;
>+	case SLM_FAT_ERR:
>+		cnt = xe_mmio_read32(gt, SLM_ECC_ERROR_CNTR(HARDWARE_ERROR_FATAL).reg);
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_SLM] = cnt;
>+		xe_gt_hw_err(gt, "%u SLM FATAL error\n", cnt);
>+		break;
>+	case EU_IC_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_IC]++;
>+		xe_gt_hw_err(gt, "EU IC FATAL error\n");
>+		break;
>+	case EU_GRF_FAT_ERR:
>+		gt->errors.hw[INTEL_GT_HW_ERROR_FAT_EU_GRF]++;
>+		xe_gt_hw_err(gt, "EU GRF FATAL error\n");
>+		break;
>+	default:
>+		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
>+				       "UNKNOWN FATAL error\n");
>+		break;
>+	}
> 	}
>+}
>
>-	/*
>-	 * TODO: The remaining GT errors don't have a
>-	 * need for targeted logging at the moment. We
>-	 * still want to log detection of these errors, but
>-	 * let's aggregate them until someone has a need for them.
>-	 */
>-	if (errstat & other_errors)
>-		DRM_ERROR("detected hardware error(s) in ERR_STAT_GT_REG_%s: 0x%08x\n",
>-			  hw_err_str, errstat & other_errors);
>+static void
>+xe_gt_hw_error_handler(struct xe_gt *gt, const enum hardware_error hw_err)
>+{
>+	const char *hw_err_str = hardware_error_type_to_str(hw_err);
>+	unsigned long errstat;
>+
>+	lockdep_assert_held(&gt_to_xe(gt)->irq.lock);
>
>-	xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
>+	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
>+		errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
>+		if (unlikely(!errstat)) {
>+			xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
>+					       "ERR_STAT_GT_REG_%s blank!\n", hw_err_str);
>+			return;
>+		}
>+	}
>+
>+	switch (hw_err) {
>+	case HARDWARE_ERROR_CORRECTABLE:
>+		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
>+			bool error = false;
>+			int i;
>+
>+			errstat = 0;
>+			for (i = 0; i < ERR_STAT_GT_COR_VCTR_LEN; i++) {
>+				u32 err_type = ERR_STAT_GT_COR_VCTR_LEN;
>+				unsigned long vctr;
>+				const char *name;
>+
>+				vctr = xe_mmio_read32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg);
>+				if (!vctr)
>+					continue;
>+
>+				switch (i) {
>+				case ERR_STAT_GT_VCTR0:
>+				case ERR_STAT_GT_VCTR1:
>+					err_type = INTEL_GT_HW_ERROR_COR_SUBSLICE;
>+					gt->errors.hw[err_type] += hweight32(vctr);
>+					name = "SUBSLICE";
>+
>+					/* Avoid second read/write to error status register*/
>+					if (errstat)
>+						break;
>+
>+					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
>+					xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n",
>+						     errstat);
>+					xe_gt_correctable_hw_error_stats_update(gt, errstat);
>+					if (errstat)
>+						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
>+								errstat);
>+					break;
>+
>+				case ERR_STAT_GT_VCTR2:
>+				case ERR_STAT_GT_VCTR3:
>+					err_type = INTEL_GT_HW_ERROR_COR_L3BANK;
>+					gt->errors.hw[err_type] += hweight32(vctr);
>+					name = "L3 BANK";
>+					break;
>+				default:
>+					name = "UNKNOWN";
>+					break;
>+				}
>+				xe_mmio_write32(gt, ERR_STAT_GT_COR_VCTR_REG(i).reg, vctr);
>+				xe_gt_hw_err(gt, "%s CORRECTABLE error, ERR_VECT_GT_CORRECTABLE_%d:0x%08lx\n",
>+					     name, i, vctr);
>+				error = true;
>+			}
>+
>+			if (!error)
>+				xe_gt_hw_err(gt, "UNKNOWN CORRECTABLE error\n");
>+		} else {
>+			xe_gt_correctable_hw_error_stats_update(gt, errstat);
>+			xe_gt_hw_err(gt, "ERR_STAT_GT_CORRECTABLE:0x%08lx\n", errstat);
>+		}
>+		break;
>+	case HARDWARE_ERROR_NONFATAL:
>+	      /*
>+	       * TODO: The GT Non Fatal Error Status Register
>+	       * only has reserved bitfields defined.
>+	       * Remove once there is something to service.
>+	       */
>+		drm_err_ratelimited(&gt_to_xe(gt)->drm, HW_ERR "detected Non-Fatal error\n");
>+		break;
>+	case HARDWARE_ERROR_FATAL:
>+		if (HAS_GT_ERROR_VECTORS(gt_to_xe(gt))) {
>+			bool error = false;
>+			int i;
>+
>+			errstat = 0;
>+			for (i = 0; i < ERR_STAT_GT_FATAL_VCTR_LEN; i++) {
>+				u32 err_type = ERR_STAT_GT_FATAL_VCTR_LEN;
>+				unsigned long vctr;
>+				const char *name;
>+
>+				vctr = xe_mmio_read32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg);
>+				if (!vctr)
>+					continue;
>+
>+				/* i represents the vector register index */
>+				switch (i) {
>+				case ERR_STAT_GT_VCTR0:
>+				case ERR_STAT_GT_VCTR1:
>+					err_type = INTEL_GT_HW_ERROR_FAT_SUBSLICE;
>+					gt->errors.hw[err_type] += hweight32(vctr);
>+					name = "SUBSLICE";
>+
>+					/*Avoid second read/write to error status register.*/
>+					if (errstat)
>+						break;
>+
>+					errstat = xe_mmio_read32(gt, ERR_STAT_GT_REG(hw_err).reg);
>+					xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
>+					xe_gt_fatal_hw_error_stats_update(gt, errstat);
>+					if (errstat)
>+						xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg,
>+								errstat);
>+					break;
>+
>+				case ERR_STAT_GT_VCTR2:
>+				case ERR_STAT_GT_VCTR3:
>+					err_type = INTEL_GT_HW_ERROR_FAT_L3BANK;
>+					gt->errors.hw[err_type] += hweight32(vctr);
>+					name = "L3 BANK";
>+					break;
>+				case ERR_STAT_GT_VCTR6:
>+					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_TLB] += hweight16(vctr);
>+					name = "TLB";
>+					break;
>+				case ERR_STAT_GT_VCTR7:
>+					gt->errors.hw[INTEL_GT_HW_ERROR_FAT_L3_FABRIC] += hweight8(vctr);
>+					name = "L3 FABRIC";
>+					break;
>+				default:
>+					name = "UNKNOWN";
>+					break;
>+				}
>+				xe_mmio_write32(gt, ERR_STAT_GT_FATAL_VCTR_REG(i).reg, vctr);
>+				xe_gt_hw_err(gt, "%s FATAL error, ERR_VECT_GT_FATAL_%d:0x%08lx\n",
>+					     name, i, vctr);
>+				error = true;
>+			}
>+			if (!error)
>+				xe_gt_hw_err(gt, "UNKNOWN FATAL error\n");
>+		} else {
>+			xe_gt_fatal_hw_error_stats_update(gt, errstat);
>+			xe_gt_hw_err(gt, "ERR_STAT_GT_FATAL:0x%08lx\n", errstat);
>+		}
>+		break;
>+	default:
>+		break;
>+	}
>+
>+	if (!HAS_GT_ERROR_VECTORS(gt_to_xe(gt)))
>+		xe_mmio_write32(gt, ERR_STAT_GT_REG(hw_err).reg, errstat);
> }
>
> static void
>@@ -409,7 +647,8 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> 	spin_lock_irqsave(&gt_to_xe(gt)->irq.lock, flags);
> 	errsrc = xe_mmio_read32(gt, DEV_ERR_STAT_REG(hw_err).reg);
> 	if (unlikely(!errsrc)) {
>-		DRM_ERROR("DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
>+		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
>+				       "DEV_ERR_STAT_REG_%s blank!\n", hw_err_str);
> 		goto out_unlock;
> 	}
>
>@@ -417,8 +656,9 @@ xe_hw_error_source_handler(struct xe_gt *gt, const enum hardware_error hw_err)
> 		xe_gt_hw_error_handler(gt, hw_err);
>
> 	if (errsrc & ~DEV_ERR_STAT_GT_ERROR)
>-		DRM_ERROR("non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
>-			  hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
>+		xe_gt_log_driver_error(gt, INTEL_GT_DRIVER_ERROR_INTERRUPT,
>+				       "non-GT hardware error(s) in DEV_ERR_STAT_REG_%s: 0x%08x\n",
>+				       hw_err_str, errsrc & ~DEV_ERR_STAT_GT_ERROR);
>
> 	xe_mmio_write32(gt, DEV_ERR_STAT_REG(hw_err).reg, errsrc);
>
>@@ -634,12 +874,44 @@ static void irq_uninstall(struct drm_device *drm, void *arg)
> 		pci_disable_msi(pdev);
> }
>
>+/**
>+ * process_hw_errors - checks for the occurrence of HW errors
>+ *
>+ * This checks for the HW Errors including FATAL error that might
>+ * have occurred in the previous boot of the driver which will
>+ * initiate PCIe FLR reset of the device and cause the
>+ * driver to reload.
>+ */
>+static void process_hw_errors(struct xe_device *xe)
>+{
>+	struct xe_gt *gt0 = xe_device_get_gt(xe, 0);
>+	u32 dev_pcieerr_status, master_ctl;
>+	struct xe_gt *gt;
>+	int i;
>+
>+	dev_pcieerr_status = xe_mmio_read32(gt0, DEV_PCIEERR_STATUS.reg);
>+
>+	for_each_gt(gt, xe, i) {
>+		if (dev_pcieerr_status & DEV_PCIEERR_IS_FATAL(i))
>+			xe_hw_error_source_handler(gt, HARDWARE_ERROR_FATAL);
>+
>+		master_ctl = xe_mmio_read32(gt, GEN11_GFX_MSTR_IRQ.reg);
>+		xe_mmio_write32(gt, GEN11_GFX_MSTR_IRQ.reg, master_ctl);
>+		xe_hw_error_irq_handler(gt, master_ctl);
>+	}
>+	if (dev_pcieerr_status)
>+		xe_mmio_write32(gt, DEV_PCIEERR_STATUS.reg, dev_pcieerr_status);
>+}
>+
> int xe_irq_install(struct xe_device *xe)
> {
> 	int irq = to_pci_dev(xe->drm.dev)->irq;
> 	irq_handler_t irq_handler;
> 	int err;
>
>+	if (IS_DGFX(xe))
>+		process_hw_errors(xe);
>+
> 	irq_handler = xe_irq_handler(xe);
> 	if (!irq_handler) {
> 		drm_err(&xe->drm, "No supported interrupt handler");
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 1844cff8fba8..69098194cef8 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -73,6 +73,7 @@ struct xe_device_desc {
> 	bool has_range_tlb_invalidation;
> 	bool has_asid;
> 	bool has_link_copy_engine;
>+	bool has_gt_error_vectors;
> };
>
> __diag_push();
>@@ -232,6 +233,7 @@ static const struct xe_device_desc pvc_desc = {
> 	.supports_usm = true,
> 	.has_asid = true,
> 	.has_link_copy_engine = true,
>+	.has_gt_error_vectors = true,
> };
>
> #define MTL_MEDIA_ENGINES \
>@@ -418,6 +420,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> 	xe->info.vm_max_level = desc->vm_max_level;
> 	xe->info.supports_usm = desc->supports_usm;
> 	xe->info.has_asid = desc->has_asid;
>+	xe->info.has_gt_error_vectors = desc->has_gt_error_vectors;
> 	xe->info.has_flat_ccs = desc->has_flat_ccs;
> 	xe->info.has_4tile = desc->has_4tile;
> 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
>-- 
>2.25.1
>
