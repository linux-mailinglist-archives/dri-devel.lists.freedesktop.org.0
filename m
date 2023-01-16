Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0475566D0DC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20C810E4D9;
	Mon, 16 Jan 2023 21:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94F6010E0BD;
 Mon, 16 Jan 2023 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SY9zS77lryP3RsagyEd1lOfTyp2vwhw6nZIjVLjLWFs=; b=H/v/YJF5WTboNnBGm55PIEdSqQ
 C95Tzdud4Zjg6Lzdpvr3vSsgKTGLnYxWY0/M6oHiXRmSeOLuEQxIRzDfBqNU4+imM0jeJ6dhTCv5e
 3ynGS+U7vrV0gvxAeqLOMDrbkavdOQLeAg9RPI391TG27tpj/cJcWrsoZnzn+Se5b9uEPJupOtRdu
 Q71gSl/tm46x67D8SzMnSg6lcFSHQ5BmN83UFhFX0WmXoOV1HOCKHyg9r+I7c73PFh8s/3Je37CkV
 CsMWnOLqz/pfPbo3zD7TFWUKm908UFiGH/Pl9eiv3sN67DVP5DjpMYQnkScC77Jo1vaxZPnkALyG+
 rB6WE7Rg==;
Received: from [187.56.70.205] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pHWuS-00A8mw-LD; Mon, 16 Jan 2023 22:20:53 +0100
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu/vcn: Add parameter to force (en/dis)abling
 indirect SRAM mode
Date: Mon, 16 Jan 2023 18:20:04 -0300
Message-Id: <20230116212004.860968-3-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116212004.860968-1-gpiccoli@igalia.com>
References: <20230116212004.860968-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sonny Jiang <sonny.jiang@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Lazar Lijo <Lijo.Lazar@amd.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the FW loading path perform some checks based on IP model
and in case it is advertised as supported, the VCN indirect SRAM
mode is used.

Happens that in case there's any issue on FW and this mode ends-up
not being properly supported, the driver probe fails [0]. Debugging
this requires driver rebuilding, so to allow fast debug and experiments,
add a parameter to force setting indirect SRAM mode to true/false from
the kernel command-line; parameter default is -1, which doesn't change
the current driver's behavior.

[0] Example of this issue, observed on Steam Deck:

[drm] kiq ring mec 2 pipe 1 q 0
[drm] failed to load ucode VCN0_RAM(0x3A)
[drm] psp gfx command LOAD_IP_FW(0x6) failed and response status is (0xFFFF0000)
amdgpu 0000:04:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] *ERROR* ring vcn_dec_0 test failed (-110)
[drm:amdgpu_device_init.cold [amdgpu]] *ERROR* hw_init of IP block <vcn_v3_0> failed -110
amdgpu 0000:04:00.0: amdgpu: amdgpu_device_ip_init failed
amdgpu 0000:04:00.0: amdgpu: Fatal error during GPU init

Cc: James Zhu <James.Zhu@amd.com>
Cc: Lazar Lijo <Lijo.Lazar@amd.com>
Cc: Leo Liu <leo.liu@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Sonny Jiang <sonny.jiang@amd.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


This work is based on agd5f/amd-staging-drm-next branch.
Thanks in advance for reviews/comments!
Cheers,

Guilherme


 drivers/gpu/drm/amd/amdgpu/amdgpu.h     | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 872450a3a164..5d3c92c94f18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -215,6 +215,7 @@ extern int amdgpu_noretry;
 extern int amdgpu_force_asic_type;
 extern int amdgpu_smartshift_bias;
 extern int amdgpu_use_xgmi_p2p;
+extern int amdgpu_indirect_sram;
 #ifdef CONFIG_HSA_AMD
 extern int sched_policy;
 extern bool debug_evictions;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 06aba201d4db..c7182c0bc841 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -187,6 +187,7 @@ int amdgpu_num_kcq = -1;
 int amdgpu_smartshift_bias;
 int amdgpu_use_xgmi_p2p = 1;
 int amdgpu_vcnfw_log;
+int amdgpu_indirect_sram = -1;
 
 static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
 
@@ -941,6 +942,14 @@ MODULE_PARM_DESC(smu_pptable_id,
 	"specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
 module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
 
+/**
+ * DOC: indirect_sram (int)
+ * Allow users to force using (or not) the VCN indirect SRAM mode in the fw load
+ * code. Default is -1, meaning auto (aka, don't mess with driver's behavior).
+ */
+MODULE_PARM_DESC(indirect_sram, "Force VCN indirect SRAM (-1 = auto (default), 0 = disabled, 1 = enabled)");
+module_param_named(indirect_sram, amdgpu_indirect_sram, int, 0444);
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index 1f880e162d9d..a2290087e01c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -137,6 +137,9 @@ int amdgpu_vcn_sw_init(struct amdgpu_device *adev)
 		return -EINVAL;
 	}
 
+	if (amdgpu_indirect_sram >= 0)
+		adev->vcn.indirect_sram = (bool)amdgpu_indirect_sram;
+
 	hdr = (const struct common_firmware_header *)adev->vcn.fw->data;
 	adev->vcn.fw_version = le32_to_cpu(hdr->ucode_version);
 
-- 
2.39.0

