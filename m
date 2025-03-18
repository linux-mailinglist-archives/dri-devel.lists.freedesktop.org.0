Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC41A67267
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 12:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D52B10E465;
	Tue, 18 Mar 2025 11:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47B2110E465
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 11:17:46 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.198])
 by gateway (Coremail) with SMTP id _____8CxieBZVtlnfpCbAA--.22365S3;
 Tue, 18 Mar 2025 19:17:45 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
 by front1 (Coremail) with SMTP id qMiowMCxasRFVtlnRadRAA--.20746S3;
 Tue, 18 Mar 2025 19:17:44 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH 2/2] drm/amd/display: Protect dml2_validate() from its callers
Date: Tue, 18 Mar 2025 19:17:17 +0800
Message-ID: <20250318111717.2161235-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250318111717.2161235-1-chenhuacai@loongson.cn>
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxasRFVtlnRadRAA--.20746S3
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxtr4rGr1rAF4DtrWrKryrZrc_yoWxKF1rpr
 y7Jr4UC3ykXF17trnxJ3WUJF4rGws2vF48trZ3Jw1ag3WUJr1DJryUJrW7tr4UXF98AF13
 t3WUtw4UtFyDK3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
 JVW8JwCFI7km07C267AKxVWUtVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
 vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
 x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
 xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E
 14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8a9aPUUUUU==
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

Similar to dml2_create()/dml2_copy()/dml2_create_copy(), dml2_validate()
should also be protected from its callers because "All the DC_FP_START/END
should be used before call anything from DML2".

So protect dml2_validate() with DC_FP_START() and DC_FP_END(), otherwise
it causes such errors:

 do_fpu invoked from kernel context![#1]:
 CPU: 10 UID: 0 PID: 331 Comm: kworker/10:1H Not tainted 6.14.0-rc6+ #4
 Workqueue: events_highpri dm_irq_work_func [amdgpu]
 pc ffff800003191eb0 ra ffff800003191e60 tp 9000000107a94000 sp 9000000107a975b0
 a0 9000000140ce4910 a1 0000000000000000 a2 9000000140ce49b0 a3 9000000140ce49a8
 a4 9000000140ce49a8 a5 0000000100000000 a6 0000000000000001 a7 9000000107a97660
 t0 ffff800003790000 t1 9000000140ce5000 t2 0000000000000001 t3 0000000000000000
 t4 0000000000000004 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
 t8 0000000100000000 u0 ffff8000031a3b9c s9 9000000130bc0000 s0 9000000132400000
 s1 9000000140ec0000 s2 9000000132400000 s3 9000000140ce0000 s4 90000000057f8b88
 s5 9000000140ec0000 s6 9000000140ce4910 s7 0000000000000001 s8 9000000130d45010
 ra: ffff800003191e60 dml21_map_dc_state_into_dml_display_cfg+0x40/0x1140 [amdgpu]
   ERA: ffff800003191eb0 dml21_map_dc_state_into_dml_display_cfg+0x90/0x1140 [amdgpu]
  CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
  PRMD: 00000004 (PPLV0 +PIE -PWE)
  EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
  ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
 ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
  PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
 Process kworker/10:1H (pid: 331, threadinfo=000000007bf9ddb0, task=00000000cc4ab9f3)
 Stack : 0000000100000000 0000043800000780 0000000100000001 0000000100000001
         0000000000000000 0000078000000000 0000000000000438 0000078000000000
         0000000000000438 0000078000000000 0000000000000438 0000000100000000
         0000000100000000 0000000100000000 0000000100000000 0000000100000000
         0000000000000001 9000000140ec0000 9000000132400000 9000000132400000
         ffff800003408000 ffff800003408000 9000000132400000 9000000140ce0000
         9000000140ce0000 ffff800003193850 0000000000000001 9000000140ec0000
         9000000132400000 9000000140ec0860 9000000140ec0738 0000000000000001
         90000001405e8000 9000000130bc0000 9000000140ec02a8 ffff8000031b5db8
         0000000000000000 0000043800000780 0000000000000003 ffff8000031b79cc
         ...
 Call Trace:
 [<ffff800003191eb0>] dml21_map_dc_state_into_dml_display_cfg+0x90/0x1140 [amdgpu]
 [<ffff80000319384c>] dml21_validate+0xcc/0x520 [amdgpu]
 [<ffff8000031b8948>] dc_validate_global_state+0x2e8/0x460 [amdgpu]
 [<ffff800002e94034>] create_validate_stream_for_sink+0x3d4/0x420 [amdgpu]
 [<ffff800002e940e4>] amdgpu_dm_connector_mode_valid+0x64/0x240 [amdgpu]
 [<900000000441d6b8>] drm_connector_mode_valid+0x38/0x80
 [<900000000441d824>] __drm_helper_update_and_validate+0x124/0x3e0
 [<900000000441ddc0>] drm_helper_probe_single_connector_modes+0x2e0/0x620
 [<90000000044050dc>] drm_client_modeset_probe+0x23c/0x1780
 [<9000000004420384>] __drm_fb_helper_initial_config_and_unlock+0x44/0x5a0
 [<9000000004403acc>] drm_client_dev_hotplug+0xcc/0x140
 [<ffff800002e9ab50>] handle_hpd_irq_helper+0x1b0/0x1e0 [amdgpu]
 [<90000000038f5da0>] process_one_work+0x160/0x300
 [<90000000038f6718>] worker_thread+0x318/0x440
 [<9000000003901b8c>] kthread+0x12c/0x220
 [<90000000038b1484>] ret_from_kernel_thread+0x8/0xa4

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 .../gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c   | 5 ++++-
 .../gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c   | 2 ++
 .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c | 2 ++
 .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c | 5 ++++-
 4 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
index 664302876019..63ef8629d7ed 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
@@ -1811,10 +1811,13 @@ bool dcn32_validate_bandwidth(struct dc *dc,
 {
 	bool out = false;
 
-	if (dc->debug.using_dml2)
+	if (dc->debug.using_dml2) {
+		DC_FP_START();
 		out = dml2_validate(dc, context,
 				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
 				fast_validate);
+		DC_FP_END();
+	}
 	else
 		out = dml1_validate(dc, context, fast_validate);
 	return out;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
index 8ee3d99ea2aa..0495c8dbcf1e 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
@@ -1738,9 +1738,11 @@ static bool dcn35_validate_bandwidth(struct dc *dc,
 {
 	bool out = false;
 
+	DC_FP_START();
 	out = dml2_validate(dc, context,
 			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
 			fast_validate);
+	DC_FP_END();
 
 	if (fast_validate)
 		return out;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
index 14f7c3acdc96..aea5acf22b26 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
@@ -1718,9 +1718,11 @@ static bool dcn351_validate_bandwidth(struct dc *dc,
 {
 	bool out = false;
 
+	DC_FP_START();
 	out = dml2_validate(dc, context,
 			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
 			fast_validate);
+	DC_FP_END();
 
 	if (fast_validate)
 		return out;
diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
index c1ebc6b1c937..a1815fa59b02 100644
--- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
@@ -1650,10 +1650,13 @@ bool dcn401_validate_bandwidth(struct dc *dc,
 		bool fast_validate)
 {
 	bool out = false;
-	if (dc->debug.using_dml2)
+	if (dc->debug.using_dml2) {
+		DC_FP_START();
 		out = dml2_validate(dc, context,
 				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
 				fast_validate);
+		DC_FP_END();
+	}
 	return out;
 }
 
-- 
2.47.1

