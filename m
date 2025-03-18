Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E0A67264
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 12:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2E410E463;
	Tue, 18 Mar 2025 11:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83F3D10E463
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 11:17:33 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.198])
 by gateway (Coremail) with SMTP id _____8AxTWtLVtlna5CbAA--.681S3;
 Tue, 18 Mar 2025 19:17:31 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
 by front1 (Coremail) with SMTP id qMiowMCxasRFVtlnRadRAA--.20746S2;
 Tue, 18 Mar 2025 19:17:29 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/amd/display: Protect
 dml2_create()/dml2_copy()/dml2_create_copy()
Date: Tue, 18 Mar 2025 19:17:16 +0800
Message-ID: <20250318111717.2161235-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxasRFVtlnRadRAA--.20746S2
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3AFy5Kr1rCFWDJr4rGr4rWFX_yoWxJFyfpr
 98XrWrGw48Ar1xJr13AF1UKr9Yq3ZxAFy8Jry7JF1a9F15Wrn8JFykJFW8trWUtFW5JF17
 X3srAr98tay8KwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUk529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1ln4kS14v26r1q6r43M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
 McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
 8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
 wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUxOzsDUUUU
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

Commit 7da55c27e76749b9 ("drm/amd/display: Remove incorrect FP context
start") removes the FP context protection of dml2_create(), and it said
"All the DC_FP_START/END should be used before call anything from DML2".

However, dml2_create()/dml2_copy()/dml2_create_copy() are not protected
from their callers, causing such errors:

 do_fpu invoked from kernel context![#1]:
 CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #1
 Workqueue: events work_for_cpu_fn
 pc ffff80000319de80 ra ffff80000319de5c tp 900000010575c000 sp 900000010575f840
 a0 0000000000000000 a1 900000012f210130 a2 900000012f000000 a3 ffff80000357e268
 a4 ffff80000357e260 a5 900000012ea52cf0 a6 0000000400000004 a7 0000012c00001388
 t0 00001900000015e0 t1 ffff80000379d000 t2 0000000010624dd3 t3 0000006400000014
 t4 00000000000003e8 t5 0000005000000018 t6 0000000000000020 t7 0000000f00000064
 t8 000000000000002f u0 5f5e9200f8901912 s9 900000012d380010 s0 900000012ea51fd8
 s1 900000012f000000 s2 9000000109296000 s3 0000000000000001 s4 0000000000001fd8
 s5 0000000000000001 s6 ffff800003415000 s7 900000012d390000 s8 ffff800003211f80
    ra: ffff80000319de5c dml21_apply_soc_bb_overrides+0x3c/0x960 [amdgpu]
   ERA: ffff80000319de80 dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  PRMD: 00000004 (PPLV0 +PIE -PWE)
  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
 ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
  PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
 Process kworker/0:5 (pid: 239, threadinfo=00000000927eadc6, task=000000008fd31682)
 Stack : 00040dc000003164 0000000000000001 900000012f210130 900000012eabeeb8
         900000012f000000 ffff80000319fe48 900000012f210000 900000012f210130
         900000012f000000 900000012eabeeb8 0000000000000001 ffff8000031a0064
         900000010575f9f0 900000012f210130 900000012eac0000 900000012ea80000
         900000012f000000 ffff8000031cefc4 900000010575f9f0 ffff8000035859c0
         ffff800003414000 900000010575fa78 900000012f000000 ffff8000031b4c50
         0000000000000000 9000000101c9d700 9000000109c40000 5f5e9200f8901912
         900000012d3c4bd0 900000012d3c5000 ffff8000034aed18 900000012d380010
         900000012d3c4bd0 ffff800003414000 900000012d380000 ffff800002ea49dc
         0000000000000001 900000012d3c6000 00000000ffffe423 0000000000010000
         ...
 Call Trace:
 [<ffff80000319de80>] dml21_apply_soc_bb_overrides+0x60/0x960 [amdgpu]
 [<ffff80000319fe44>] dml21_init+0xa4/0x280 [amdgpu]
 [<ffff8000031a0060>] dml21_create+0x40/0x80 [amdgpu]
 [<ffff8000031cefc0>] dc_state_create+0x100/0x160 [amdgpu]
 [<ffff8000031b4c4c>] dc_create+0x44c/0x640 [amdgpu]
 [<ffff800002ea49d8>] amdgpu_dm_init+0x3f8/0x2060 [amdgpu]
 [<ffff800002ea6658>] dm_hw_init+0x18/0x60 [amdgpu]
 [<ffff800002b16738>] amdgpu_device_init+0x1938/0x27e0 [amdgpu]
 [<ffff800002b18e80>] amdgpu_driver_load_kms+0x20/0xa0 [amdgpu]
 [<ffff800002b0c8f0>] amdgpu_pci_probe+0x1b0/0x580 [amdgpu]
 [<900000000448eae4>] local_pci_probe+0x44/0xc0
 [<9000000003b02b18>] work_for_cpu_fn+0x18/0x40
 [<9000000003b05da0>] process_one_work+0x160/0x300
 [<9000000003b06718>] worker_thread+0x318/0x440
 [<9000000003b11b8c>] kthread+0x12c/0x220
 [<9000000003ac1484>] ret_from_kernel_thread+0x8/0xa4

So protect dml2_create()/dml2_copy()/dml2_create_copy() with DC_FP_START
and DC_FP_END.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/core/dc_state.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_state.c b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
index 1b2cce127981..6e2cac08002d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_state.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_state.c
@@ -210,17 +210,23 @@ struct dc_state *dc_state_create(struct dc *dc, struct dc_state_create_params *p
 
 #ifdef CONFIG_DRM_AMD_DC_FP
 	if (dc->debug.using_dml2) {
+		DC_FP_START();
+
 		dml2_opt->use_clock_dc_limits = false;
 		if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2)) {
+			DC_FP_END();
 			dc_state_release(state);
 			return NULL;
 		}
 
 		dml2_opt->use_clock_dc_limits = true;
 		if (!dml2_create(dc, dml2_opt, &state->bw_ctx.dml2_dc_power_source)) {
+			DC_FP_END();
 			dc_state_release(state);
 			return NULL;
 		}
+
+		DC_FP_END();
 	}
 #endif
 
@@ -240,6 +246,8 @@ void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
 	dc_state_copy_internal(dst_state, src_state);
 
 #ifdef CONFIG_DRM_AMD_DC_FP
+	DC_FP_START();
+
 	dst_state->bw_ctx.dml2 = dst_dml2;
 	if (src_state->bw_ctx.dml2)
 		dml2_copy(dst_state->bw_ctx.dml2, src_state->bw_ctx.dml2);
@@ -247,6 +255,8 @@ void dc_state_copy(struct dc_state *dst_state, struct dc_state *src_state)
 	dst_state->bw_ctx.dml2_dc_power_source = dst_dml2_dc_power_source;
 	if (src_state->bw_ctx.dml2_dc_power_source)
 		dml2_copy(dst_state->bw_ctx.dml2_dc_power_source, src_state->bw_ctx.dml2_dc_power_source);
+
+	DC_FP_END();
 #endif
 
 	/* context refcount should not be overridden */
@@ -268,17 +278,23 @@ struct dc_state *dc_state_create_copy(struct dc_state *src_state)
 	new_state->bw_ctx.dml2 = NULL;
 	new_state->bw_ctx.dml2_dc_power_source = NULL;
 
+	DC_FP_START();
+
 	if (src_state->bw_ctx.dml2 &&
 			!dml2_create_copy(&new_state->bw_ctx.dml2, src_state->bw_ctx.dml2)) {
+		DC_FP_END();
 		dc_state_release(new_state);
 		return NULL;
 	}
 
 	if (src_state->bw_ctx.dml2_dc_power_source &&
 			!dml2_create_copy(&new_state->bw_ctx.dml2_dc_power_source, src_state->bw_ctx.dml2_dc_power_source)) {
+		DC_FP_END();
 		dc_state_release(new_state);
 		return NULL;
 	}
+
+	DC_FP_END();
 #endif
 
 	kref_init(&new_state->refcount);
-- 
2.47.1

