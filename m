Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0615A45288
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 03:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D010E832;
	Wed, 26 Feb 2025 02:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SfqmulAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A5110E832;
 Wed, 26 Feb 2025 02:00:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 99CFA61210;
 Wed, 26 Feb 2025 02:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EEA7C4CEEA;
 Wed, 26 Feb 2025 02:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740535220;
 bh=ZS2/+X3toFBTMcdf0GUkBwhWVhPd4cDBYr8VzWhR/Z8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=SfqmulArWIZFSQPq5hyK/J6aPpgOyBW6OKyKKGjE9cS1hmezmoXcjSqTSo9409BmJ
 sGmtPhH/3AtPZ5yov9ZAArsodOFMtVOa3CP/KDFtQwLlGWJ8YmNaD7gtuKXfhWanPz
 wTUZjVXHLiwtqEZjMMn7WRtdVO91+/0jd9cs9CQ5AqH/Obg8ReA+iydVsIgybjMv7g
 waDCBtSfoXaATS1zusYkwZHfV5xQAFF6j/0qn86jCKYf2NXLH4CRvnwJM1cKohb35E
 aBzWEVsHK2LATD3rMlqyGVAvnBzyf1np29jfqCvlV0beQQr0x2kWji8EALe59j5wpi
 tj1Te8UT2gmyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 57FF1C021BE;
 Wed, 26 Feb 2025 02:00:20 +0000 (UTC)
From: Mingcong Bai via B4 Relay <devnull+jeffbai.aosc.io@kernel.org>
Date: Wed, 26 Feb 2025 10:00:19 +0800
Subject: [PATCH 2/5] drm/xe/guc: use SZ_4K for alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-xe-non-4k-fix-v1-2-80f23b5ee40e@aosc.io>
References: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
In-Reply-To: <20250226-xe-non-4k-fix-v1-0-80f23b5ee40e@aosc.io>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Kexy Biscuit <kexybiscuit@aosc.io>, 
 Shang Yatsen <429839446@qq.com>, Mingcong Bai <jeffbai@aosc.io>, 
 stable@vger.kernel.org, Haien Liang <27873200@qq.com>, 
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740535218; l=12230;
 i=jeffbai@aosc.io; s=20250225; h=from:subject:message-id;
 bh=lneHxelOHWqYBjtJuQ8Ou6fhurK/OyPgThwj2u/6xNY=;
 b=q4Q2pXNZVFdlPWar3YH52ZkxKNEW5jmrDhujKkYAnqCAJloST41na5oQknxAsklS0gLVFKc0x
 DMhS1FhtLvwC9CcGopfzmIZb9FigjzdCA/3gmson5Lrn1v7OajlPrbK
X-Developer-Key: i=jeffbai@aosc.io; a=ed25519;
 pk=PShXLX1m130BHsde1t/EjBugyyOjSVdzV0dYuYejXYU=
X-Endpoint-Received: by B4 Relay for jeffbai@aosc.io/20250225 with auth_id=349
X-Original-From: Mingcong Bai <jeffbai@aosc.io>
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
Reply-To: jeffbai@aosc.io
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mingcong Bai <jeffbai@aosc.io>

Per the "Firmware" chapter in "drm/xe Intel GFX Driver", as well as
"Volume 8: Command Stream Programming" in "Intel® Arc™ A-Series Graphics
and Intel Data Center GPU Flex Series Open-Source Programmer's Reference
Manual For the discrete GPUs code named "Alchemist" and "Arctic Sound-M""
and "Intel® Iris® Xe MAX Graphics Open Source Programmer's Reference
Manual For the 2020 Discrete GPU formerly named "DG1"":

  "The RINGBUF register sets (defined in Memory Interface Registers) are
  used to specify the ring buffer memory areas. The ring buffer must start
  on a 4KB boundary and be allocated in linear memory. The length of any
  one ring buffer is limited to 2MB."

The Graphics micro (μ) Controller (GuC) really expects command buffers
aligned to 4K boundaries.

Current code uses `PAGE_SIZE' as an assumed alignment reference but 4K
kernel page sizes is by no means a guarantee. On 16K-paged kernels, this
causes driver failures after loading the GuC firmware:

[    7.398317] xe 0000:09:00.0: [drm] Found dg2/g10 (device ID 56a1) display version 13.00 stepping C0
[    7.410429] xe 0000:09:00.0: [drm] Using GuC firmware from i915/dg2_guc_70.bin version 70.36.0
[   10.719989] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status = 0x800001EC, time = 3297ms, freq = 2400MHz (req 2400MHz), done = 0
[   10.732106] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x76, UKernel = 0x01, MIA = 0x00, Auth = 0x02
[   10.744214] xe 0000:09:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:09:00.0 as wedged.
               Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
[   10.828908] xe 0000:09:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100

Correct this by revising all instances of `PAGE_SIZE' to `SZ_4K' and
revise `PAGE_ALIGN()' calls to `ALIGN()' with `SZ_4K' as the second
argument (overriding `PAGE_SIZE').

Cc: stable@vger.kernel.org
Fixes: 84d15f426110 ("drm/xe/guc: Add capture size check in GuC log buffer")
Fixes: 9c8c7a7e6f1f ("drm/xe/guc: Prepare GuC register list and update ADS size for error capture")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Tested-by: Mingcong Bai <jeffbai@aosc.io>
Tested-by: Haien Liang <27873200@qq.com>
Tested-by: Shirong Liu <lsr1024@qq.com>
Tested-by: Haofeng Wu <s2600cw2@126.com>
Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
Co-developed-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Shang Yatsen <429839446@qq.com>
Co-developed-by: Kexy Biscuit <kexybiscuit@aosc.io>
Signed-off-by: Kexy Biscuit <kexybiscuit@aosc.io>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
 drivers/gpu/drm/xe/xe_guc.c         |  4 ++--
 drivers/gpu/drm/xe/xe_guc_ads.c     | 32 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_capture.c |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_ct.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c     |  4 ++--
 drivers/gpu/drm/xe/xe_guc_pc.c      |  4 ++--
 6 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 408365dfe4eed02336bbd208b60491aea27a8a6e..595873780a5774501f04b2f01ebdf8a45c7ac931 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -88,7 +88,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 {
-	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
+	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> XE_PTE_SHIFT;
 	u32 flags;
 
 	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
@@ -141,7 +141,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 {
-	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
+	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> XE_PTE_SHIFT;
 	u32 flags = ads << GUC_ADS_ADDR_SHIFT;
 
 	return flags;
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index fab259adc380be28c79fae5946e123427359ec60..65e88ad43e8adef752889300abd0197a0ac4a1a3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -143,17 +143,17 @@ static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads->golden_lrc_size);
+	return ALIGN(ads->golden_lrc_size, SZ_4K);
 }
 
 static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads->ads_waklv_size);
+	return ALIGN(ads->ads_waklv_size, SZ_4K);
 }
 
 static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads->capture_size);
+	return ALIGN(ads->capture_size, SZ_4K);
 }
 
 static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
@@ -168,7 +168,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
+	return ALIGN(ads_to_guc(ads)->fw.private_data_size, SZ_4K);
 }
 
 static size_t guc_ads_regset_offset(struct xe_guc_ads *ads)
@@ -183,7 +183,7 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_regset_offset(ads) +
 		guc_ads_regset_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, SZ_4K);
 }
 
 static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
@@ -193,7 +193,7 @@ static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_golden_lrc_offset(ads) +
 		 guc_ads_golden_lrc_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, SZ_4K);
 }
 
 static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
@@ -203,7 +203,7 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_waklv_offset(ads) +
 		 guc_ads_waklv_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, SZ_4K);
 }
 
 static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
@@ -213,7 +213,7 @@ static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_capture_offset(ads) +
 		 guc_ads_capture_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, SZ_4K);
 }
 
 static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
@@ -223,7 +223,7 @@ static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_um_queues_offset(ads) +
 		guc_ads_um_queues_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, SZ_4K);
 }
 
 static size_t guc_ads_size(struct xe_guc_ads *ads)
@@ -276,7 +276,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 			continue;
 
 		real_size = xe_gt_lrc_size(gt, class);
-		alloc_size = PAGE_ALIGN(real_size);
+		alloc_size = ALIGN(real_size, SZ_4K);
 		total_size += alloc_size;
 	}
 
@@ -612,12 +612,12 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 					 offsetof(struct __guc_ads_blob, system_info));
 
 	/* first, set aside the first page for a capture_list with zero descriptors */
-	total_size = PAGE_SIZE;
+	total_size = SZ_4K;
 	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
 		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
 
 	null_ggtt = ads_ggtt + capture_offset;
-	capture_offset += PAGE_SIZE;
+	capture_offset += SZ_4K;
 
 	/*
 	 * Populate capture list : at this point adps is already allocated and
@@ -681,10 +681,10 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 		}
 	}
 
-	if (ads->capture_size != PAGE_ALIGN(total_size))
+	if (ads->capture_size != ALIGN(total_size, SZ_4K))
 		xe_gt_dbg(gt, "ADS capture alloc size changed from %d to %d\n",
-			  ads->capture_size, PAGE_ALIGN(total_size));
-	return PAGE_ALIGN(total_size);
+			  ads->capture_size, ALIGN(total_size, SZ_4K));
+	return ALIGN(total_size, SZ_4K);
 }
 
 static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
@@ -928,7 +928,7 @@ static void guc_populate_golden_lrc(struct xe_guc_ads *ads)
 		xe_gt_assert(gt, gt->default_lrc[class]);
 
 		real_size = xe_gt_lrc_size(gt, class);
-		alloc_size = PAGE_ALIGN(real_size);
+		alloc_size = ALIGN(real_size, SZ_4K);
 		total_size += alloc_size;
 
 		/*
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index f6d523e4c5feb7f07d695af90f4c44c7a9072c2d..dac51f8720fc6c7d27baa31a1b5c567f560e8c1f 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -590,8 +590,8 @@ guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
 		return -ENODATA;
 
 	if (size)
-		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
-				   (num_regs * sizeof(struct guc_mmio_reg)));
+		*size = ALIGN((sizeof(struct guc_debug_capture_list)) +
+			      (num_regs * sizeof(struct guc_mmio_reg)), SZ_4K);
 
 	return 0;
 }
@@ -738,7 +738,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 	 * sequence, that is, during the pre-hwconfig phase before we have
 	 * the exact engine fusing info.
 	 */
-	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
+	total_size = SZ_4K;	/* Pad a page in front for empty lists */
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
 		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
 			if (xe_guc_capture_getlistsize(guc, i,
@@ -758,7 +758,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 		total_size += global_size;
 	}
 
-	return PAGE_ALIGN(total_size);
+	return ALIGN(total_size, SZ_4K);
 }
 
 static int guc_capture_output_size_est(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 72ad576fc18eb583110b44b118abeba4c6be936a..a58c58e599122f3e9ebd1e8374c17c3b4663a5ed 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -212,7 +212,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_bo *bo;
 	int err;
 
-	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
+	xe_gt_assert(gt, !(guc_ct_size() % SZ_4K));
 
 	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
 	if (!ct->g2h_wq)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 0ca3056d8bd3fa37bdb79a7a71ef671270771657..9975005732f645b4735f95fbae8ebe431e793ebe 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -58,7 +58,7 @@ static size_t guc_log_size(void)
 	 *  |         Capture logs          |
 	 *  +===============================+ + CAPTURE_SIZE
 	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
+	return SZ_4K + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
 		CAPTURE_BUFFER_SIZE;
 }
 
@@ -331,7 +331,7 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
 u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
 {
 	enum guc_log_buffer_type i;
-	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
+	u32 offset = SZ_4K;	/* for the log_buffer_states */
 
 	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
 		if (i == type)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index df7f130fb663fc2fd170a94cc1b835b4b4cca167..0f97c6310a3a5696490aaa4827eb3aa0d45ea6d6 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1000,7 +1000,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
-	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
 	unsigned int fw_ref;
 	int ret;
 
@@ -1110,7 +1110,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
-	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	u32 size = ALIGN(sizeof(struct slpc_shared_data), SZ_4K);
 	int err;
 
 	if (xe->info.skip_guc_pc)

-- 
2.48.1


