Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE537D8797
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 19:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D5F10E843;
	Thu, 26 Oct 2023 17:33:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 962A810E845
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 17:33:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40907b82ab9so14010745e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698341622; x=1698946422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kODa0N4RmPWhXOkFZtrSi2EV6hRoPP6ATwYExjZLFqU=;
 b=bw5e/8yr1C121WTG64xAwDpntXQ87urxrzQWBeWFHmBG5ABB0zhXmr0OR5uGaictgc
 dHcQRFjT2xZe3L5exjs9lf0MtlVzvMwNOWLM+vXcT4IbKJAj+ZHZRNSZRExfenQnCFer
 gc66yz3Ob1HPaqvz2WeQqgC5+AcW6AqdLRRovC8VBzADqhL424wDa3liJkIJscwPWKSW
 TVj4c1Czi+55rpRqy4lH0Asos535Edq58fsOmASat9ioJOUCO/OwyvyD22fgMsqscYg4
 A8hQd8qDgAFr3+p3hC1aIQK7u/2+3gOeWw+IEbkPxl8AH1H2f1CvcY4eMMass3Z4MRUO
 S+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698341622; x=1698946422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kODa0N4RmPWhXOkFZtrSi2EV6hRoPP6ATwYExjZLFqU=;
 b=pm7rG7UAr/2zy3FtPHjrpYhOdZ0USFVdYRrXI98ERUQnNuBOICb5Y0Kyew58qu/mx5
 9iDyHRjqxHh6yhVlsZvYQZOssCRwoVeZsLuNaod+uEOu3rj7rOiQk1v14zVxNlm1ZFTm
 uCMzmJ9XLjOdEGO6d12LQobP5JG1acWnXOm1qj6Xc7Xa/u9eON1Pm88JUulPpZzqT2hN
 H/fxb9eEbYIakLhQnjJEfTjQo8XmN/mBPHiJdb+K4CEHW9r4zjhmq9twUNGU0gSsAGoD
 tpByIYK4HQak9r5g9Ic564wmj7q6W7UGUDlBoZ9GAUToKc/1LN9FFeCF7pOhQkAHcZQM
 BNaQ==
X-Gm-Message-State: AOJu0YwKUvDDt27l01Yqv0T9ctEz7SQC0YCqa4YWUXmUNcppY3ig4soj
 2fkUBGwVjV04JFbJUe7VaStxoQ==
X-Google-Smtp-Source: AGHT+IHS+e/1aJbW5bTQTAm8VGasNzmiEEEr/R+7zojVf4ISGNWsbt1rRD/ziGfT0qFpFtdXhFPfWQ==
X-Received: by 2002:a05:600c:3c97:b0:402:e68f:8a4f with SMTP id
 bg23-20020a05600c3c9700b00402e68f8a4fmr608518wmb.0.1698341621783; 
 Thu, 26 Oct 2023 10:33:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:c7c:7213:c700:ddfa:8123:b8d1:3b7d])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a05600c474b00b004067e905f44sm3164541wmo.9.2023.10.26.10.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 10:33:41 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [REGRESSION] rx7600 stopped working after "1cfb4d612127 drm/amdgpu:
 put MQDs in VRAM"
Date: Thu, 26 Oct 2023 18:33:20 +0100
Message-ID: <20231026173320.552430-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: mathieu.poirier@linaro.org, Xinhui.Pan@amd.com, klimov.linux@gmail.com,
 luben.tuikov@amd.com, mario.limonciello@amd.com, leo.yan@linaro.org,
 alexander.deucher@amd.com, christian.koenig@amd.com, alexey.klimov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

#regzbot introduced: 1cfb4d612127
#regzbot title: rx7600 stopped working after "1cfb4d612127 drm/amdgpu: put =
MQDs in VRAM"

Hi all,

I've been playing with RX7600 and it was observed that amdgpu stopped worki=
ng between kernel 6.2 and 6.5.
Then I narrowed it down to 6.4 <-> 6.5-rc1 and finally bisect pointed at 1c=
fb4d6121276a829aa94d0e32a7f5e1830ebc21
And I manually checked if it boots/works on the previous commit and the men=
tioned one.

I guess the log also reveals warning in error path. Please see below.

I didn't check any further. This is simple debian testing system with the f=
ollowing cmdline options:
root@avadebian:~# cat /proc/cmdline
BOOT_IMAGE=3D/boot/vmlinuz-6.6-rc7+ ignore_loglevel root=3D/dev/nvme1n1p2 r=
o nr_cpus=3D32

So far simple revert (patch is below) returns things back to normal-ish: th=
ere are huge graphics artifacts on Xorg/X11 under 6.1 to upstream kernel. W=
ayland-based sway works great without issues. Not sure where should I repor=
t this.

Please let me know if I can help debugging, testing or provide some other l=
ogs regarding 1cfb4d612127? Any cmdline options to collect more info?

Thanks,
Alexey



From 214372d5cedcf8757dd80d5f4d058377a3d92c52 Mon Sep 17 00:00:00 2001
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 26 Oct 2023 17:01:02 +0100
Subject: [PATCH] drm/amdgpu: Revert "drm/amdgpu: put MQDs in VRAM"

This reverts commit 1cfb4d6121276a829aa94d0e32a7f5e1830ebc21.

amdgpu driver fails during initialisation with RX7600/gfx11 on
ADLINK Ampere Altra Developer Platform (AVA developer platform)
with mentioned commit:

[   12.559893] [drm] Display Core v3.2.247 initialized on DCN 3.2.1
[   12.565906] [drm] DP-HDMI FRL PCON supported
[   12.572192] [drm] DMUB hardware initialized: version=3D0x07000C00
[   12.582541] snd_hda_intel 000d:03:00.1: bound 000d:03:00.0 (ops amdgpu_d=
m_audio_component_bind_ops [amdgpu])
[   12.625357] [drm] kiq ring mec 3 pipe 1 q 0
[   12.857087] amdgpu 000d:03:00.0: [drm:amdgpu_ring_test_helper [amdgpu]] =
*ERROR* ring comp_1.0.0 test failed (-110)
[   12.867930] [drm:amdgpu_device_init [amdgpu]] *ERROR* hw_init of IP bloc=
k <gfx_v11_0> failed -110
[   12.877289] amdgpu 000d:03:00.0: amdgpu: amdgpu_device_ip_init failed
[   12.883723] amdgpu 000d:03:00.0: amdgpu: Fatal error during GPU init
[   12.890070] amdgpu 000d:03:00.0: amdgpu: amdgpu: finishing device.
[   12.896586] [drm] DSC precompute is not needed.
[   12.901142] ------------[ cut here ]------------
[   12.905747] WARNING: CPU: 0 PID: 212 at drivers/gpu/drm/amd/amdgpu/amdgp=
u_irq.c:615 amdgpu_irq_put+0xa8/0xc8 [amdgpu]
[   12.916841] Modules linked in: hid_generic(E) usbhid(E) hid(E) qrtr(E) i=
ptable_nat(E) amdgpu(E+) nf_nat(E) nf_conntrack(E) snd_hda_codec_hdmi(E) nf=
_defrag_ipv6(E) nf_defrag_ipv4(E) libcrc32c(E) iptable_mangle(E) iptable_fi=
lter(E) amdxcp(E) drm_exec(E) gpu_sched(E) snd_hda_intel(E) aes_ce_blk(E) s=
nd_intel_dspcfg(E) drm_buddy(E) aes_ce_cipher(E) snd_hda_codec(E) xhci_pci(=
E) video(E) crct10dif_ce(E) polyval_ce(E) snd_hda_core(E) xhci_hcd(E) drm_s=
uballoc_helper(E) snd_hwdep(E) polyval_generic(E) drm_ttm_helper(E) snd_pcm=
(E) ghash_ce(E) ast(E) ttm(E) gf128mul(E) snd_timer(E) ipmi_ssif(E) drm_dis=
play_helper(E) drm_shmem_helper(E) sha2_ce(E) sha256_arm64(E) ipmi_devintf(=
E) usbcore(E) snd(E) drm_kms_helper(E) igb(E) sha1_ce(E) sbsa_gwdt(E) ipmi_=
msghandler(E) arm_spe_pmu(E) soundcore(E) usb_common(E) i2c_algo_bit(E) cpp=
c_cpufreq(E) i2c_designware_platform(E) arm_dsu_pmu(E) arm_cmn(E) xgene_hwm=
on(E) i2c_designware_core(E) evdev(E) binfmt_misc(E) loop(E) fuse(E) efi_ps=
tore(E) drm(E) dm_mod(E) dax(E) configfs(E) efivarfs(E)
[   12.916916]  ip_tables(E) x_tables(E) autofs4(E)
[   13.011111] CPU: 0 PID: 212 Comm: kworker/0:2 Tainted: G            E   =
   6.6.0-rc7+ #23
[   13.019277] Hardware name: ADLINK Ampere Altra Developer Platform/Ampere=
 Altra Developer Platform, BIOS TianoCore 2.04.100.10 (SYS: 2.06.20220308) =
04/18/2
[   13.033084] Workqueue: events work_for_cpu_fn
[   13.037434] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   13.044384] pc : amdgpu_irq_put+0xa8/0xc8 [amdgpu]
[   13.049652] lr : amdgpu_fence_driver_hw_fini+0x118/0x160 [amdgpu]
[   13.056220] sp : ffff80008012bc10
[   13.059522] x29: ffff80008012bc20 x28: 0000000000000000 x27: 00000000000=
00000
[   13.066647] x26: 0000000000000000 x25: ffff07ff98580010 x24: ffff07ff985=
80000
[   13.073772] x23: ffff07ff985a78f0 x22: ffff07ff98580010 x21: ffff07ff985=
904c8
[   13.080896] x20: ffff07ff985900e8 x19: ffff07ff98598580 x18: 00000000000=
00006
[   13.088020] x17: 0000000000000020 x16: ffffbb510d0d7140 x15: fffffffffff=
ffefb
[   13.095145] x14: 0000000000000000 x13: 2e64656465656e20 x12: ffff07ff8c7=
fd9e0
[   13.102268] x11: 00000000000003e8 x10: ffff07ff8c7fd9e0 x9 : ffffbb50ac3=
345e0
[   13.109392] x8 : ffffbb50abf18000 x7 : 0000000000000000 x6 : 000000007a4=
56104
[   13.116516] x5 : 0000000000000000 x4 : ffff07ff98580000 x3 : 00000000000=
00000
[   13.123641] x2 : 0000000000000000 x1 : ffff07ff985a78f0 x0 : ffff07ffc5f=
d4000
[   13.130765] Call trace:
[   13.133200]  amdgpu_irq_put+0xa8/0xc8 [amdgpu]
[   13.138121]  amdgpu_device_fini_hw+0xb8/0x380 [amdgpu]
[   13.143732]  amdgpu_driver_unload_kms+0x54/0x80 [amdgpu]
[   13.149517]  amdgpu_driver_load_kms+0x100/0x1c0 [amdgpu]
[   13.155301]  amdgpu_pci_probe+0x134/0x428 [amdgpu]
[   13.160564]  local_pci_probe+0x48/0xb8
[   13.164305]  work_for_cpu_fn+0x24/0x40
[   13.168043]  process_one_work+0x170/0x3d0
[   13.172042]  worker_thread+0x2bc/0x3e0
[   13.175781]  kthread+0x118/0x128
[   13.178999]  ret_from_fork+0x10/0x20
[   13.182564] ---[ end trace 0000000000000000 ]---
...
[   16.984679] amdgpu: probe of 000d:03:00.0 failed with error -110

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Fixes: 1cfb4d612127 drm/amdgpu: put MQDs in VRAM
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 9 ++-------
 drivers/gpu/drm/amd/amdgpu/mes_v10_1.c  | 1 -
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c  | 1 -
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gfx.c
index 2382921710ec..1f2d8be0fc44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -382,11 +382,6 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 	int r, i, j;
 	struct amdgpu_kiq *kiq =3D &adev->gfx.kiq[xcc_id];
 	struct amdgpu_ring *ring =3D &kiq->ring;
-	u32 domain =3D AMDGPU_GEM_DOMAIN_GTT;
-
-	/* Only enable on gfx10 and 11 for now to avoid changing behavior on olde=
r chips */
-	if (adev->ip_versions[GC_HWIP][0] >=3D IP_VERSION(10, 0, 0))
-		domain |=3D AMDGPU_GEM_DOMAIN_VRAM;
=20
 	/* create MQD for KIQ */
 	if (!adev->enable_mes_kiq && !ring->mqd_obj) {
@@ -421,7 +416,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 			ring =3D &adev->gfx.gfx_ring[i];
 			if (!ring->mqd_obj) {
 				r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
-							    domain, &ring->mqd_obj,
+							    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
 							    &ring->mqd_gpu_addr, &ring->mqd_ptr);
 				if (r) {
 					dev_warn(adev->dev, "failed to create ring mqd bo (%d)", r);
@@ -445,7 +440,7 @@ int amdgpu_gfx_mqd_sw_init(struct amdgpu_device *adev,
 		ring =3D &adev->gfx.compute_ring[j];
 		if (!ring->mqd_obj) {
 			r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
-						    domain, &ring->mqd_obj,
+						    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
 						    &ring->mqd_gpu_addr, &ring->mqd_ptr);
 			if (r) {
 				dev_warn(adev->dev, "failed to create ring mqd bo (%d)", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c b/drivers/gpu/drm/amd/a=
mdgpu/mes_v10_1.c
index eb06d749876f..080e7eb3f98d 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v10_1.c
@@ -898,7 +898,6 @@ static int mes_v10_1_mqd_sw_init(struct amdgpu_device *=
adev,
 		return 0;
=20
 	r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
-				    AMDGPU_GEM_DOMAIN_VRAM |
 				    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
 				    &ring->mqd_gpu_addr, &ring->mqd_ptr);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/a=
mdgpu/mes_v11_0.c
index 6827d547042e..0608710306b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
@@ -1004,7 +1004,6 @@ static int mes_v11_0_mqd_sw_init(struct amdgpu_device=
 *adev,
 		return 0;
=20
 	r =3D amdgpu_bo_create_kernel(adev, mqd_size, PAGE_SIZE,
-				    AMDGPU_GEM_DOMAIN_VRAM |
 				    AMDGPU_GEM_DOMAIN_GTT, &ring->mqd_obj,
 				    &ring->mqd_gpu_addr, &ring->mqd_ptr);
 	if (r) {
--=20
2.42.0

