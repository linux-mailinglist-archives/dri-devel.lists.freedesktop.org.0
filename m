Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60753B259DA
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 05:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0E110E0E5;
	Thu, 14 Aug 2025 03:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="LKJggS/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 439 seconds by postgrey-1.36 at gabe;
 Thu, 14 Aug 2025 03:29:36 UTC
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com
 [51.81.35.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED2D10E0E5;
 Thu, 14 Aug 2025 03:29:36 +0000 (UTC)
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id DB7EB223BE;
 Thu, 14 Aug 2025 03:22:15 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [151.80.165.199])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 6FDA92618F;
 Thu, 14 Aug 2025 03:22:12 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
 by relay2.mymailcheap.com (Postfix) with ESMTPS id E06F03E891;
 Thu, 14 Aug 2025 03:22:09 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 by nf1.mymailcheap.com (Postfix) with ESMTPSA id A006240086;
 Thu, 14 Aug 2025 03:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1755141728; bh=Euf7RGfdcRTByFbTluvA/RIw6+MZ44J8dHtq9uOZQdI=;
 h=From:To:Cc:Subject:Date:From;
 b=LKJggS/WzySivrjP27Hzljd0PMhw8AlnDl04Vq+4nCkQ/e85ipxJFnQeVDppiGw8R
 m547Mh1ywTjS29poQpJpjbE/jBzTjX1pUFrYAyNDTQRP0XjkYwuRcJodA0qBBN7NeM
 WY6qEbAztAXET33Cf/JCHgBiZ9ZeQa30/hhm6BB4=
Received: from JellyZhongke (unknown [223.76.243.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 1BB034069D;
 Thu, 14 Aug 2025 03:22:02 +0000 (UTC)
From: Mingcong Bai <jeffbai@aosc.io>
To: linux-kernel@vger.kernel.org
Cc: Wentao Guan <guanwentao@uniontech.com>, WangYuli <wangyuli@uniontech.com>,
 Huacai Chen <chenhuacai@kernel.org>, Kexy Biscuit <kexybiscuit@aosc.io>,
 Mingcong Bai <jeffbai@aosc.io>, Zhang Yuhao <xinmu@xinmu.moe>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/amdkfd: disable HSA_AMD_SVM on LoongArch and AArch64
Date: Thu, 14 Aug 2025 11:21:36 +0800
Message-ID: <20250814032153.227285-1-jeffbai@aosc.io>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.40 / 10.00]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[14];
 ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
 RCVD_COUNT_ONE(0.00)[1]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPFBL_URIBL_EMAIL_FAIL(0.00)[jeffbai.aosc.io:server
 fail,xinmu.xinmu.moe:server fail]; 
 FREEMAIL_CC(0.00)[uniontech.com,kernel.org,aosc.io,xinmu.moe,amd.com,gmail.com,ffwll.ch,lists.freedesktop.org];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: A006240086
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

While testing my ROCm port for LoongArch and AArch64 (patches pending) on
the following platforms:

- LoongArch ...
  - Loongson AC612A0_V1.1 (Loongson 3C6000/S) + AMD Radeon RX 6800
- AArch64 ...
  - FD30M51 (Phytium FT-D3000) + AMD Radeon RX 7600
  - Huawei D920S10 (Huawei Kunpeng 920) + AMD Radeon RX 7600

When HSA_AMD_SVM is enabled, amdgpu would fail to initialise at all on
LoongArch (no output):

  amdgpu 0000:0d:00.0: amdgpu: kiq ring mec 2 pipe 1 q 0
  CPU 0 Unable to handle kernel paging request at virtual address ffffffffff800034, era == 9000000001058044, ra == 9000000001058660
  Oops[#1]:
  CPU: 0 UID: 0 PID: 202 Comm: kworker/0:3 Not tainted 6.16.0+ #103 PREEMPT(full)
  Hardware name: To be filled by O.E.M.To be fill To be filled by O.E.M.To be fill/To be filled by O.E.M.To be fill, BIOS Loongson-UDK2018-V4.0.
  Workqueue: events work_for_cpu_fn
  pc 9000000001058044 ra 9000000001058660 tp 9000000101500000 sp 9000000101503aa0
  a0 ffffffffff800000 a1 0000000ffffe0000 a2 0000000000000000 a3 90000001207c58e0
  a4 9000000001a4c310 a5 0000000000000001 a6 0000000000000000 a7 0000000000000001
  t0 000003ffff800000 t1 0000000000000001 t2 0000040000000000 t3 03ffff0000002000
  t4 0000000000000000 t5 0001010101010101 t6 ffff800000000000 t7 0001000000000000
  t8 000000000000002f u0 0000000000800000 s9 9000000002026000 s0 90000001207c58e0
  s1 0000000000000001 s2 9000000001935c40 s3 0000001000000000 s4 0000000000000001
  s5 0000000ffffe0000 s6 0000000000000040 s7 0001000000000001 s8 0001000000000000
     ra: 9000000001058660 memmap_init_zone_device+0x120/0x1b0
    ERA: 9000000001058044 __init_zone_device_page.constprop.0+0x4/0x1a0
   CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
   PRMD: 00000004 (PPLV0 +PIE -PWE)
   EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
   ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
  ESTAT: 00020000 [PIS] (IS= ECode=2 EsubCode=0)
   BADV: ffffffffff800034
   PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
  Modules linked in: amdgpu(+) vfat fat cfg80211 rfkill 8021q garp stp mrp llc snd_hda_codec_atihdmi snd_hda_codec_hdmi snd_hda_codec_conexant snd_hda_codec_generic drm_client_lib drm_ttm_helper syscopyarea ttm sysfillrect sysimgblt fb_sys_fops drm_panel_backlight_quirks video drm_exec drm_suballoc_helper amdxcp mfd_core drm_buddy gpu_sched drm_display_helper drm_kms_helper cec snd_hda_intel ipmi_ssif snd_intel_dspcfg snd_hda_codec snd_hda_core acpi_ipmi snd_hwdep snd_pcm fb loongson3_cpufreq lcd igc snd_timer ipmi_si spi_loongson_pci spi_loongson_core snd ipmi_devintf soundcore ipmi_msghandler binfmt_misc fuse drm drm_panel_orientation_quirks backlight dm_mod dax nfnetlink
  Process kworker/0:3 (pid: 202, threadinfo=00000000eb7cd5d6, task=000000004ca22b1b)
  Stack : 0000000000001440 0000000000000000 ffffffffff800000 0000000000000001
          90000000020b5978 9000000101503b38 0000000000000001 0000000000000001
          0000000000000000 90000000020b5978 90000000020b3f48 0000000000001440
          0000000000000000 90000001207c58e0 90000001207c5970 9000000000575e20
          90000000010e2e00 90000000020b3f48 900000000205c238 0000000000000000
          00000000000001d3 90000001207c58e0 9000000001958f28 9000000120790848
          90000001207b3510 0000000000000000 9000000120780000 9000000120780010
          90000001207d6000 90000001207c58e0 90000001015660c8 9000000120780000
          0000000000000000 90000000005763a8 90000001207c58e0 00000003ff000000
          9000000120780000 ffff80000296b820 900000012078f968 90000001207c6000
          ...
  Call Trace:
  [<9000000001058044>] __init_zone_device_page.constprop.0+0x4/0x1a0
  [<900000000105865c>] memmap_init_zone_device+0x11c/0x1b0
  [<9000000000575e1c>] memremap_pages+0x24c/0x7b0
  [<90000000005763a4>] devm_memremap_pages+0x24/0x80
  [<ffff80000296b81c>] kgd2kfd_init_zone_device+0x11c/0x220 [amdgpu]
  [<ffff80000265d09c>] amdgpu_device_init+0x27dc/0x2bf0 [amdgpu]
  [<ffff80000265ece8>] amdgpu_driver_load_kms+0x18/0x90 [amdgpu]
  [<ffff800002651fbc>] amdgpu_pci_probe+0x22c/0x890 [amdgpu]
  [<9000000000916adc>] local_pci_probe+0x3c/0xb0
  [<90000000002976c8>] work_for_cpu_fn+0x18/0x30
  [<900000000029aeb4>] process_one_work+0x164/0x320
  [<900000000029b96c>] worker_thread+0x37c/0x4a0
  [<90000000002a695c>] kthread+0x12c/0x220
  [<9000000001055b64>] ret_from_kernel_thread+0x24/0xc0
  [<9000000000237524>] ret_from_kernel_thread_asm+0xc/0x88

  Code: 00000000  00000000  0280040d <2980d08d> 02bffc0e  2980c08e  02c0208d  29c0208d  1400004f

  ---[ end trace 0000000000000000 ]---

Or lock up and/or driver reset during computate tasks, such as when
running llama.cpp over ROCm, at which point the compute process must be
killed before the reset could complete:

  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  amdgpu 0000:0a:00.0: amdgpu: failed to remove hardware queue from MES, doorbell=0x1202
  amdgpu 0000:0a:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 3
  amdgpu 0000:0a:00.0: amdgpu: GPU reset begin!
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  amdgpu 0000:0a:00.0: amdgpu: failed to remove hardware queue from MES, doorbell=0x1004
  amdgpu 0000:0a:00.0: amdgpu: MES might be in unrecoverable state, issue a GPU reset
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 2
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 1
  amdgpu 0000:0a:00.0: amdgpu: Failed to evict queue 0
  amdgpu: Failed to quiesce KFD
  amdgpu 0000:0a:00.0: amdgpu: Dumping IP State
  amdgpu 0000:0a:00.0: amdgpu: Dumping IP State Completed
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MES failed to respond to msg=REMOVE_QUEUE
  [drm:amdgpu_mes_unmap_legacy_queue [amdgpu]] *ERROR* failed to unmap legacy queue
  amdgpu 0000:0a:00.0: amdgpu: MODE1 reset
  amdgpu 0000:0a:00.0: amdgpu: GPU mode1 reset
  amdgpu 0000:0a:00.0: amdgpu: GPU smu mode1 reset
  amdgpu 0000:0a:00.0: amdgpu: GPU reset succeeded, trying to resume

Disabling the aforementioned option makes the issue go away, though it is
unclear whether this is a platform-specific issue or one that lies within
the amdkfd code.

This patch has been tested on all the aforementioned platform
combinations, and sent as an RFC to encourage discussion.

Signed-off-by: Zhang Yuhao <xinmu@xinmu.moe>
Signed-off-by: Mingcong Bai <jeffbai@aosc.io>
Tested-by: Mingcong Bai <jeffbai@aosc.io>
---
 drivers/gpu/drm/amd/amdkfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/Kconfig b/drivers/gpu/drm/amd/amdkfd/Kconfig
index 16e12c9913f94..5d2fa86f60bf8 100644
--- a/drivers/gpu/drm/amd/amdkfd/Kconfig
+++ b/drivers/gpu/drm/amd/amdkfd/Kconfig
@@ -14,7 +14,7 @@ config HSA_AMD
 
 config HSA_AMD_SVM
 	bool "Enable HMM-based shared virtual memory manager"
-	depends on HSA_AMD && DEVICE_PRIVATE
+	depends on HSA_AMD && DEVICE_PRIVATE && !LOONGARCH && !ARM64
 	default y
 	select HMM_MIRROR
 	select MMU_NOTIFIER
-- 
2.50.1

