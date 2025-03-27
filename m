Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F29A72CD6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 10:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0202A10E2DD;
	Thu, 27 Mar 2025 09:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55DD110E2DD;
 Thu, 27 Mar 2025 09:54:26 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.198])
 by gateway (Coremail) with SMTP id _____8DxjXJQIOVnixGoAA--.19361S3;
 Thu, 27 Mar 2025 17:54:24 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
 by front1 (Coremail) with SMTP id qMiowMAxSsQpIOVned1iAA--.26323S4;
 Thu, 27 Mar 2025 17:54:23 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH V2 3/3] drm/amd/display: Protect FPU in
 dml2_validate()/dml21_validate()
Date: Thu, 27 Mar 2025 17:53:34 +0800
Message-ID: <20250327095334.3327111-3-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250327095334.3327111-1-chenhuacai@loongson.cn>
References: <20250327095334.3327111-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMAxSsQpIOVned1iAA--.26323S4
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3AFy5tw4fJw45urWrZr4fZwc_yoW7Zw18pr
 yUJr1rCrW8JF1Utw1UA3WUXF15GwnxZF18JryDJw13Ww1UXw1DJryDJrW7GrW5JF45JF13
 ta1UJw4Utr18C3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6rxl6s0DM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
 kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
 8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
 6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
 AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
 0xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
 v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
 xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU00eHDUUUUU==
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

However, dml2_validate()/dml21_validate() are not protected from their
callers, causing such errors:

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

Unfortunately, protecting dml2_validate()/dml21_validate() out of DML2
causes "sleeping function called from invalid context", so protect them
with DC_FP_START() and DC_FP_END() inside.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 .../gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c    | 9 +++++++--
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c       | 5 +++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index bbc798e039f5..d124c38fbfd3 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -273,11 +273,16 @@ bool dml21_validate(const struct dc *in_dc, struct dc_state *context, struct dml
 {
 	bool out = false;
 
+	DC_FP_START();
+
 	/* Use dml_validate_only for fast_validate path */
-	if (fast_validate) {
+	if (fast_validate)
 		out = dml21_check_mode_support(in_dc, context, dml_ctx);
-	} else
+	else
 		out = dml21_mode_check_and_programming(in_dc, context, dml_ctx);
+
+	DC_FP_END();
+
 	return out;
 }
 
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index fc551c63c9e8..9cd140df132a 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -732,11 +732,16 @@ bool dml2_validate(const struct dc *in_dc, struct dc_state *context, struct dml2
 		return out;
 	}
 
+	DC_FP_START();
+
 	/* Use dml_validate_only for fast_validate path */
 	if (fast_validate)
 		out = dml2_validate_only(context);
 	else
 		out = dml2_validate_and_build_resource(in_dc, context);
+
+	DC_FP_END();
+
 	return out;
 }
 
-- 
2.47.1

