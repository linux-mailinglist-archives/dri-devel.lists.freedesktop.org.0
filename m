Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80A9A72CD5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 10:54:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F8810E8A8;
	Thu, 27 Mar 2025 09:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B1E410E89F;
 Thu, 27 Mar 2025 09:54:08 +0000 (UTC)
Received: from loongson.cn (unknown [223.64.68.198])
 by gateway (Coremail) with SMTP id _____8CxvOI_IOVnbRGoAA--.20965S3;
 Thu, 27 Mar 2025 17:54:07 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
 by front1 (Coremail) with SMTP id qMiowMAxSsQpIOVned1iAA--.26323S3;
 Thu, 27 Mar 2025 17:54:05 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org
Subject: [PATCH V2 2/3] drm/amd/display: Protect FPU in
 dml2_init()/dml21_init()
Date: Thu, 27 Mar 2025 17:53:33 +0800
Message-ID: <20250327095334.3327111-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250327095334.3327111-1-chenhuacai@loongson.cn>
References: <20250327095334.3327111-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMAxSsQpIOVned1iAA--.26323S3
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3AFy5Kr1rCFWDJr4rGr4rWFX_yoW7Kry3pr
 W5Xr4rGrWrZF12yw1DZF4UXrWYq3Z3CFy8C348Jw1a9w1UWr1DJFyktrW7KrW5JF45AFy2
 q3ZrX3yUtry0k3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
 x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
 McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
 1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
 JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
 CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
 I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
 8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
 UjIFyTuYvjxU4AhLUUUUU
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

However, dml2_init()/dml21_init() are not protected from their callers,
causing such errors:

 do_fpu invoked from kernel context![#1]:
 CPU: 0 UID: 0 PID: 239 Comm: kworker/0:5 Not tainted 6.14.0-rc6+ #2
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

Unfortunately, protecting dml2_init()/dml21_init() out of DML2 causes
"sleeping function called from invalid context", so protect them with
DC_FP_START() and DC_FP_END() inside.

Cc: stable@vger.kernel.org
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c | 4 ++++
 drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c        | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
index a6b8df1d96e8..bbc798e039f5 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/dml21_wrapper.c
@@ -86,6 +86,8 @@ static void dml21_init(const struct dc *in_dc, struct dml2_context **dml_ctx, co
 	/* Store configuration options */
 	(*dml_ctx)->config = *config;
 
+	DC_FP_START();
+
 	/*Initialize SOCBB and DCNIP params */
 	dml21_initialize_soc_bb_params(&(*dml_ctx)->v21.dml_init, config, in_dc);
 	dml21_initialize_ip_params(&(*dml_ctx)->v21.dml_init, config, in_dc);
@@ -96,6 +98,8 @@ static void dml21_init(const struct dc *in_dc, struct dml2_context **dml_ctx, co
 
 	/*Initialize DML21 instance */
 	dml2_initialize_instance(&(*dml_ctx)->v21.dml_init);
+
+	DC_FP_END();
 }
 
 bool dml21_create(const struct dc *in_dc, struct dml2_context **dml_ctx, const struct dml2_configuration_options *config)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
index 68b882d28195..fc551c63c9e8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c
@@ -776,11 +776,15 @@ static void dml2_init(const struct dc *in_dc, const struct dml2_configuration_op
 		break;
 	}
 
+	DC_FP_START();
+
 	initialize_dml2_ip_params(*dml2, in_dc, &(*dml2)->v20.dml_core_ctx.ip);
 
 	initialize_dml2_soc_bbox(*dml2, in_dc, &(*dml2)->v20.dml_core_ctx.soc);
 
 	initialize_dml2_soc_states(*dml2, in_dc, &(*dml2)->v20.dml_core_ctx.soc, &(*dml2)->v20.dml_core_ctx.states);
+
+	DC_FP_END();
 }
 
 bool dml2_create(const struct dc *in_dc, const struct dml2_configuration_options *config, struct dml2_context **dml2)
-- 
2.47.1

