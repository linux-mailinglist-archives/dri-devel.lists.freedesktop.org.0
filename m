Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7A1AD8005
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 03:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A0210E2C2;
	Fri, 13 Jun 2025 01:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MRr00Wrm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 462FB10E0EF;
 Fri, 13 Jun 2025 01:11:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 35273629D1;
 Fri, 13 Jun 2025 01:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7234C4CEF2;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749777091;
 bh=MpayDCKyTR3MKb8+B3TDNmywonEooa+Q+4sUF0/pSGw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=MRr00WrmnndL6uqvORqPcT13pNVe3pMpjIIZxPUkZzlu5+cDi+tLWacZ1xYtSLh1h
 1CU0mvKFMkvKeHHUylFE51+2Q51fNkKy5RgN3B3j0uH72KqwVVhX6wb3ChbB87LrFY
 ftEKXNUmkCQVQcEOYupiFJvMKmj+NLJoMKIbTwG2zhnOLMpaQG1LJd5I8vR1wOAPOO
 yn2dS9zMyTsmdpdUZuaWl3loP3j3QvU4fIuS1EQz83kDXqZN/3KuugpDFhLMXUZ8Ae
 8SN4UoogYs78O3DaZRI5dDuaMqAIJR13/fr+0D+X0vN9J5CVVdM5RWy5VUoT5PssZK
 ChY8esV+brrIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 9E58AC61CE8;
 Fri, 13 Jun 2025 01:11:31 +0000 (UTC)
From: Mingcong Bai via B4 Relay <devnull+jeffbai.aosc.io@kernel.org>
Date: Fri, 13 Jun 2025 09:11:30 +0800
Subject: [PATCH v2 2/5] drm/xe/guc: use GUC_SIZE (SZ_4K) for alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250613-upstream-xe-non-4k-v2-v2-2-934f82249f8a@aosc.io>
References: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
In-Reply-To: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
To: Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Francois Dugast <francois.dugast@intel.com>, 
 =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, 
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Zhanjun Dong <zhanjun.dong@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, 
 Alan Previn <alan.previn.teres.alexis@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Kexy Biscuit <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>, 
 Mingcong Bai <jeffbai@aosc.io>, Wenbin Fang <fangwenbin@vip.qq.com>, 
 Haien Liang <27873200@qq.com>, Jianfeng Liu <liujianfeng1994@gmail.com>, 
 Shirong Liu <lsr1024@qq.com>, Haofeng Wu <s2600cw2@126.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749777090; l=13299;
 i=jeffbai@aosc.io; s=20250604; h=from:subject:message-id;
 bh=sRr3dSRId7ulE9WtvTdpX9Xbe8lkMHy7jLflEBNaSgY=;
 b=oee/63Vf95TzWEwaRMKXEYtAcSWFUxVqk/DtYvjp1yo0iDfpBFI2VvNVX5z805WdgnhywFFLc
 toTCpdltZhrD1SJ+XxT5Af2Px2ix3F/dzjkhLlu4RBkn1/27KvWHWaN
X-Developer-Key: i=jeffbai@aosc.io; a=ed25519;
 pk=MJdgklflDF+Xz9x2Lp+ogEnEyk8HRosMGiqLgWbFctY=
X-Endpoint-Received: by B4 Relay for jeffbai@aosc.io/20250604 with auth_id=422
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
aligned to 4KiB boundaries.

Current implementation uses `PAGE_SIZE' as an assumed alignment reference
but 4KiB kernel page sizes is by no means a guarantee. On 16KiB-paged
kernels, this causes driver failures after loading the GuC firmware:

[    7.398317] xe 0000:09:00.0: [drm] Found dg2/g10 (device ID 56a1) display version 13.00 stepping C0
[    7.410429] xe 0000:09:00.0: [drm] Using GuC firmware from i915/dg2_guc_70.bin version 70.36.0
[   10.719989] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status = 0x800001EC, time = 3297ms, freq = 2400MHz (req 2400MHz), done = 0
[   10.732106] xe 0000:09:00.0: [drm] *ERROR* GT0: load failed: status: Reset = 0, BootROM = 0x76, UKernel = 0x01, MIA = 0x00, Auth = 0x02
[   10.744214] xe 0000:09:00.0: [drm] *ERROR* CRITICAL: Xe has declared device 0000:09:00.0 as wedged.
               Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new
[   10.828908] xe 0000:09:00.0: [drm] *ERROR* GT0: GuC mmio request 0x4100: no reply 0x4100

Correct this by defining `GUC_ALIGN' as `SZ_4K' in accordance with the
references above, and revising all instances of `PAGE_SIZE' as
`GUC_ALIGN'. Then, revise `PAGE_ALIGN()' calls as `ALIGN()' with
`GUC_ALIGN' as their second argument (overriding `PAGE_SIZE').

Cc: stable@vger.kernel.org
Fixes: 84d15f426110 ("drm/xe/guc: Add capture size check in GuC log buffer")
Fixes: 9c8c7a7e6f1f ("drm/xe/guc: Prepare GuC register list and update ADS size for error capture")
Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
Tested-by: Mingcong Bai <jeffbai@aosc.io>
Tested-by: Wenbin Fang <fangwenbin@vip.qq.com>
Tested-by: Haien Liang <27873200@qq.com>
Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com>
Tested-by: Shirong Liu <lsr1024@qq.com>
Tested-by: Haofeng Wu <s2600cw2@126.com>
Link: https://github.com/FanFansfan/loongson-linux/commit/22c55ab3931c32410a077b3ddb6dca3f28223360
Link: https://t.me/c/1109254909/768552
Co-developed-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Shang Yatsen <429839446@qq.com>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
---
 drivers/gpu/drm/xe/xe_guc.c         |  4 ++--
 drivers/gpu/drm/xe/xe_guc.h         |  3 +++
 drivers/gpu/drm/xe/xe_guc_ads.c     | 32 ++++++++++++++++----------------
 drivers/gpu/drm/xe/xe_guc_capture.c |  8 ++++----
 drivers/gpu/drm/xe/xe_guc_ct.c      |  2 +-
 drivers/gpu/drm/xe/xe_guc_log.c     |  5 +++--
 drivers/gpu/drm/xe/xe_guc_pc.c      |  4 ++--
 7 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index bac5471a1a7806ed7e41a241145666834a5e0eb8..95aedf9449c8c36435f963206dbdf3c86a839338 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -90,7 +90,7 @@ static u32 guc_ctl_feature_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 {
-	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> PAGE_SHIFT;
+	u32 offset = guc_bo_ggtt_addr(guc, guc->log.bo) >> XE_PTE_SHIFT;
 	u32 flags;
 
 	#if (((CRASH_BUFFER_SIZE) % SZ_1M) == 0)
@@ -143,7 +143,7 @@ static u32 guc_ctl_log_params_flags(struct xe_guc *guc)
 
 static u32 guc_ctl_ads_flags(struct xe_guc *guc)
 {
-	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> PAGE_SHIFT;
+	u32 ads = guc_bo_ggtt_addr(guc, guc->ads.bo) >> XE_PTE_SHIFT;
 	u32 flags = ads << GUC_ADS_ADDR_SHIFT;
 
 	return flags;
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 58338be4455856994df1d7e026b3f0fa7cc03fe9..5b30215ac5616728351d77dd028ed9f3b495cfd8 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -23,6 +23,9 @@
 #define GUC_FIRMWARE_VER(guc) \
 	MAKE_GUC_VER_STRUCT((guc)->fw.versions.found[XE_UC_FW_VER_RELEASE])
 
+/* GuC really expects command buffers aligned to 4K boundaries. */
+#define GUC_ALIGN SZ_4K
+
 struct drm_printer;
 
 void xe_guc_comm_init_early(struct xe_guc *guc);
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 44c1fa2fe7c857556708290a25ea1bdfcf674449..4f47809aa794843128221c5d2653b6f61dab202b 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -143,17 +143,17 @@ static size_t guc_ads_regset_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_golden_lrc_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads->golden_lrc_size);
+	return ALIGN(ads->golden_lrc_size, GUC_ALIGN);
 }
 
 static u32 guc_ads_waklv_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads->ads_waklv_size);
+	return ALIGN(ads->ads_waklv_size, GUC_ALIGN);
 }
 
 static size_t guc_ads_capture_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads->capture_size);
+	return ALIGN(ads->capture_size, GUC_ALIGN);
 }
 
 static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
@@ -168,7 +168,7 @@ static size_t guc_ads_um_queues_size(struct xe_guc_ads *ads)
 
 static size_t guc_ads_private_data_size(struct xe_guc_ads *ads)
 {
-	return PAGE_ALIGN(ads_to_guc(ads)->fw.private_data_size);
+	return ALIGN(ads_to_guc(ads)->fw.private_data_size, GUC_ALIGN);
 }
 
 static size_t guc_ads_regset_offset(struct xe_guc_ads *ads)
@@ -183,7 +183,7 @@ static size_t guc_ads_golden_lrc_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_regset_offset(ads) +
 		guc_ads_regset_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, GUC_ALIGN);
 }
 
 static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
@@ -193,7 +193,7 @@ static size_t guc_ads_waklv_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_golden_lrc_offset(ads) +
 		 guc_ads_golden_lrc_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, GUC_ALIGN);
 }
 
 static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
@@ -203,7 +203,7 @@ static size_t guc_ads_capture_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_waklv_offset(ads) +
 		 guc_ads_waklv_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, GUC_ALIGN);
 }
 
 static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
@@ -213,7 +213,7 @@ static size_t guc_ads_um_queues_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_capture_offset(ads) +
 		 guc_ads_capture_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, GUC_ALIGN);
 }
 
 static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
@@ -223,7 +223,7 @@ static size_t guc_ads_private_data_offset(struct xe_guc_ads *ads)
 	offset = guc_ads_um_queues_offset(ads) +
 		guc_ads_um_queues_size(ads);
 
-	return PAGE_ALIGN(offset);
+	return ALIGN(offset, GUC_ALIGN);
 }
 
 static size_t guc_ads_size(struct xe_guc_ads *ads)
@@ -276,7 +276,7 @@ static size_t calculate_golden_lrc_size(struct xe_guc_ads *ads)
 			continue;
 
 		real_size = xe_gt_lrc_size(gt, class);
-		alloc_size = PAGE_ALIGN(real_size);
+		alloc_size = ALIGN(real_size, GUC_ALIGN);
 		total_size += alloc_size;
 	}
 
@@ -646,12 +646,12 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 					 offsetof(struct __guc_ads_blob, system_info));
 
 	/* first, set aside the first page for a capture_list with zero descriptors */
-	total_size = PAGE_SIZE;
+	total_size = GUC_ALIGN;
 	if (!xe_guc_capture_getnullheader(guc, &ptr, &size))
 		xe_map_memcpy_to(ads_to_xe(ads), ads_to_map(ads), capture_offset, ptr, size);
 
 	null_ggtt = ads_ggtt + capture_offset;
-	capture_offset += PAGE_SIZE;
+	capture_offset += GUC_ALIGN;
 
 	/*
 	 * Populate capture list : at this point adps is already allocated and
@@ -715,10 +715,10 @@ static int guc_capture_prep_lists(struct xe_guc_ads *ads)
 		}
 	}
 
-	if (ads->capture_size != PAGE_ALIGN(total_size))
+	if (ads->capture_size != ALIGN(total_size, GUC_ALIGN))
 		xe_gt_dbg(gt, "Updated ADS capture size %d (was %d)\n",
-			  PAGE_ALIGN(total_size), ads->capture_size);
-	return PAGE_ALIGN(total_size);
+			  ALIGN(total_size, GUC_ALIGN), ads->capture_size);
+	return ALIGN(total_size, GUC_ALIGN);
 }
 
 static void guc_mmio_regset_write_one(struct xe_guc_ads *ads,
@@ -966,7 +966,7 @@ static void guc_golden_lrc_populate(struct xe_guc_ads *ads)
 		xe_gt_assert(gt, gt->default_lrc[class]);
 
 		real_size = xe_gt_lrc_size(gt, class);
-		alloc_size = PAGE_ALIGN(real_size);
+		alloc_size = ALIGN(real_size, GUC_ALIGN);
 		total_size += alloc_size;
 
 		xe_map_memcpy_to(xe, ads_to_map(ads), offset,
diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
index 859a3ba91be54f562ea835e949f1d141ed89d486..34e9ea9b2935136fa46fbb6aac7944eb844b7fae 100644
--- a/drivers/gpu/drm/xe/xe_guc_capture.c
+++ b/drivers/gpu/drm/xe/xe_guc_capture.c
@@ -591,8 +591,8 @@ guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
 		return -ENODATA;
 
 	if (size)
-		*size = PAGE_ALIGN((sizeof(struct guc_debug_capture_list)) +
-				   (num_regs * sizeof(struct guc_mmio_reg)));
+		*size = ALIGN((sizeof(struct guc_debug_capture_list)) +
+			      (num_regs * sizeof(struct guc_mmio_reg)), GUC_ALIGN);
 
 	return 0;
 }
@@ -739,7 +739,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 	 * sequence, that is, during the pre-hwconfig phase before we have
 	 * the exact engine fusing info.
 	 */
-	total_size = PAGE_SIZE;	/* Pad a page in front for empty lists */
+	total_size = GUC_ALIGN;	/* Pad a page in front for empty lists */
 	for (i = 0; i < GUC_CAPTURE_LIST_INDEX_MAX; i++) {
 		for (j = 0; j < GUC_CAPTURE_LIST_CLASS_MAX; j++) {
 			if (xe_guc_capture_getlistsize(guc, i,
@@ -759,7 +759,7 @@ size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc)
 		total_size += global_size;
 	}
 
-	return PAGE_ALIGN(total_size);
+	return ALIGN(total_size, GUC_ALIGN);
 }
 
 static int guc_capture_output_size_est(struct xe_guc *guc)
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index 2447de0ebedf45759351fd6ce03a363a9459fe1a..6bd624d071e721638aa29b57dc30733089ce7a9a 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -212,7 +212,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
 	struct xe_bo *bo;
 	int err;
 
-	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
+	xe_gt_assert(gt, !(guc_ct_size() % GUC_ALIGN));
 
 	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", WQ_MEM_RECLAIM);
 	if (!ct->g2h_wq)
diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
index 38039c4113878007a4278d9581155158f20812ae..cd01d1033e8eefab3f49c179d1865c23771cdec1 100644
--- a/drivers/gpu/drm/xe/xe_guc_log.c
+++ b/drivers/gpu/drm/xe/xe_guc_log.c
@@ -15,6 +15,7 @@
 #include "xe_force_wake.h"
 #include "xe_gt.h"
 #include "xe_gt_printk.h"
+#include "xe_guc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
 #include "xe_module.h"
@@ -58,7 +59,7 @@ static size_t guc_log_size(void)
 	 *  |         Capture logs          |
 	 *  +===============================+ + CAPTURE_SIZE
 	 */
-	return PAGE_SIZE + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
+	return GUC_ALIGN + CRASH_BUFFER_SIZE + DEBUG_BUFFER_SIZE +
 		CAPTURE_BUFFER_SIZE;
 }
 
@@ -328,7 +329,7 @@ u32 xe_guc_get_log_buffer_size(struct xe_guc_log *log, enum guc_log_buffer_type
 u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_type type)
 {
 	enum guc_log_buffer_type i;
-	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
+	u32 offset = GUC_ALIGN;	/* for the log_buffer_states */
 
 	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
 		if (i == type)
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 18c623992035520ec78646240512220abee07935..eae0fccf2a76a19e03b596ea6f82aa415b07df43 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -1044,7 +1044,7 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 {
 	struct xe_device *xe = pc_to_xe(pc);
 	struct xe_gt *gt = pc_to_gt(pc);
-	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	u32 size = ALIGN(sizeof(struct slpc_shared_data), GUC_ALIGN);
 	unsigned int fw_ref;
 	ktime_t earlier;
 	int ret;
@@ -1172,7 +1172,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_device *xe = gt_to_xe(gt);
 	struct xe_bo *bo;
-	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
+	u32 size = ALIGN(sizeof(struct slpc_shared_data), GUC_ALIGN);
 	int err;
 
 	if (xe->info.skip_guc_pc)

-- 
2.49.0


