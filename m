Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05040C40B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 12:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1446E908;
	Wed, 15 Sep 2021 10:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76B36E908;
 Wed, 15 Sep 2021 10:59:51 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/i915: Add mmap lock around vma_lookup() to prevent
 lockdep splats
Date: Wed, 15 Sep 2021 12:59:46 +0200
Message-Id: <20210915105946.394412-1-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following splat:

i915: Running i915_gem_mman_live_selftests/igt_mmap
------------[ cut here ]------------
WARNING: CPU: 3 PID: 5654 at include/linux/mmap_lock.h:164 find_vma+0x4e/0xb0
Modules linked in: i915(+) vgem fuse snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio mei_hdcp x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_intel_dspcfg snd_hda_codec snd_hwdep e1000e snd_hda_core ptp snd_pcm ttm mei_me pps_core i2c_i801 prime_numbers i2c_smbus mei [last unloaded: i915]
CPU: 3 PID: 5654 Comm: i915_selftest Tainted: G     U            5.15.0-rc1-CI-Trybot_7984+ #1
Hardware name: Micro-Star International Co., Ltd. MS-7B54/Z370M MORTAR (MS-7B54), BIOS 1.00 10/31/2017
RIP: 0010:find_vma+0x4e/0xb0
Code: de 48 89 ef e8 d3 94 fe ff 48 85 c0 74 34 48 83 c4 08 5b 5d c3 48 8d bf 28 01 00 00 be ff ff ff ff e8 d6 46 8b 00 85 c0 75 c8 <0f> 0b 48 8b 85 b8 00 00 00 48 85 c0 75 c6 48 89 ef e8 12 26 87 00
RSP: 0018:ffffc900013df980 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 00007f9df2b80000 RCX: 0000000000000000
RDX: 0000000000000001 RSI: ffffffff822e314c RDI: ffffffff8233c83f
RBP: ffff88811bafc840 R08: ffff888107d0ddb8 R09: 00000000fffffffe
R10: 0000000000000001 R11: 00000000ffbae7ba R12: 0000000000000000
R13: 0000000000000000 R14: ffff88812a710000 R15: ffff888114fa42c0
FS:  00007f9def9d4c00(0000) GS:ffff888266580000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f799627fe50 CR3: 000000011bbc2006 CR4: 00000000003706e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __igt_mmap+0xe0/0x490 [i915]
 igt_mmap+0xd2/0x160 [i915]
 ? __trace_bprintk+0x6e/0x80
 __i915_subtests.cold.7+0x42/0x92 [i915]
 ? i915_perf_selftests+0x20/0x20 [i915]
 ? __i915_nop_setup+0x10/0x10 [i915]
 __run_selftests.part.3+0x10d/0x172 [i915]
 i915_live_selftests.cold.5+0x1f/0x47 [i915]
 i915_pci_probe+0x93/0x1d0 [i915]

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Closes: https://gitlab.freedesktop.org/drm/intel/issues/4129
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 02d40eb31a4c..e69e8861352d 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -907,7 +907,9 @@ static int __igt_mmap(struct drm_i915_private *i915,
 
 	pr_debug("igt_mmap(%s, %d) @ %lx\n", obj->mm.region->name, type, addr);
 
+	mmap_read_lock(current->mm);
 	area = vma_lookup(current->mm, addr);
+	mmap_read_unlock(current->mm);
 	if (!area) {
 		pr_err("%s: Did not create a vm_area_struct for the mmap\n",
 		       obj->mm.region->name);
-- 
2.33.0

