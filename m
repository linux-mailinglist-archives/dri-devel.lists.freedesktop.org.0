Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F2DB91657
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EBC10E4A8;
	Mon, 22 Sep 2025 13:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQczCvv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFA810E4A8
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758547750; x=1790083750;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Paz8VobsIxUYPs+iWX8OQkPnDcVN3kgKqTINqzBN6qg=;
 b=LQczCvv843CDzUTuRZlAXYtjhqYQfn5ztKeqhioMkxY0IgNRFzQtL/Hk
 ST2j1fw4BZwUvZ9CTzwDu3b3zbvplP+IpQQqx6lEiuejZzFQks7F6GMWX
 TD1hMG6sSXiExMUZt2q9Qf9R8BuoXC1y7r4Rrc3OK4IT2pBuHYUpE9FvP
 piA9yLftocRobmJduH7BbzcJb0x5kRWq7JYEqgnaav2JrtW0zuv01nWin
 f3JLJv9gt9TLubPceH57/FP2AdlrsHRJZ4TnLwDEkGVL5rJwX4cWW7heO
 Ga0kgdN5y6Fu5wQ6NmZbH70t0xIe+hFUPEw7Ym1Xpypn26IKO96wxvn1M w==;
X-CSE-ConnectionGUID: aJIzzyeRRWm7TAIYxPU3kA==
X-CSE-MsgGUID: ON4Pn1BYSvyJOOx01RgZZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71431591"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="71431591"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 06:29:10 -0700
X-CSE-ConnectionGUID: KyiiuRRfTjyymGp9ff16vQ==
X-CSE-MsgGUID: vO7yWu6YTVWElVbgpVJYCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="180733586"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.109])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 06:29:06 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Gustavo Padovan <gustavo@padovan.org>,
 Eric Engestrom <eric.engestrom@imgtec.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] dma-buf/sw-sync: Hide the feature by default
Date: Mon, 22 Sep 2025 15:24:51 +0200
Message-ID: <20250922132837.1504441-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When multiple fences of an sw_sync timeline are signaled via
sw_sync_ioctl_inc(), we now disable interrupts and keep them disabled
while signaling all requested fences of the timeline in a loop.  Since
user space may set up an arbitrary long timeline of fences with
arbitrarily expensive callbacks added to each fence, we may end up running
with interrupts disabled for too long, longer than NMI watchdog limit.
That potentially risky scenario has been demonstrated on Intel DRM CI
trybot[1], on a low end machine fi-pnv-d510, with one of new IGT subtests
that tried to reimplement wait_* test cases of a dma_fence_chain selftest
in user space.

[141.993704] [IGT] syncobj_timeline: starting subtest stress-enable-all-signal-all-forward
[164.964389] watchdog: CPU3: Watchdog detected hard LOCKUP on cpu 3
[164.964407] Modules linked in: snd_hda_codec_alc662 snd_hda_codec_realtek_lib snd_hda_codec_generic snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer snd soundcore i915 prime_numbers ttm drm_buddy drm_display_helper cec rc_core i2c_algo_bit video wmi overlay at24 ppdev gpio_ich binfmt_misc nls_iso8859_1 coretemp i2c_i801 i2c_mux i2c_smbus r8169 lpc_ich realtek parport_pc parport nvme_fabrics dm_multipath fuse msr efi_pstore nfnetlink autofs4
[164.964569] irq event stamp: 1002206
[164.964575] hardirqs last  enabled at (1002205): [<ffffffff82898ac7>] _raw_spin_unlock_irq+0x27/0x70
[164.964599] hardirqs last disabled at (1002206): [<ffffffff8287d021>] sysvec_irq_work+0x11/0xc0
[164.964616] softirqs last  enabled at (1002138): [<ffffffff81341bc5>] fpu_clone+0xb5/0x270
[164.964631] softirqs last disabled at (1002136): [<ffffffff81341b97>] fpu_clone+0x87/0x270
[164.964650] CPU: 3 UID: 0 PID: 1515 Comm: syncobj_timelin Tainted: G     U              6.17.0-rc6-Trybot_154715v1-gc1b827f32471+ #1 PREEMPT(voluntary)
[164.964662] Tainted: [U]=USER
[164.964665] Hardware name:  /D510MO, BIOS MOPNV10J.86A.0311.2010.0802.2346 08/02/2010
[164.964669] RIP: 0010:lock_release+0x13d/0x2a0
[164.964680] Code: c2 01 48 8d 4d c8 44 89 f6 4c 89 ef e8 bc fc ff ff 0b 05 96 ca 42 06 0f 84 fc 00 00 00 b8 ff ff ff ff 65 0f c1 05 0b 71 a9 02 <83> f8 01 0f 85 2f 01 00 00 48 f7 45 c0 00 02 00 00 74 06 fb 0f 1f
[164.964686] RSP: 0018:ffffc90000170e70 EFLAGS: 00000057
[164.964693] RAX: 0000000000000001 RBX: ffffffff83595520 RCX: 0000000000000000
[164.964698] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[164.964701] RBP: ffffc90000170eb0 R08: 0000000000000000 R09: 0000000000000000
[164.964706] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffff8226a948
[164.964710] R13: ffff88802423b340 R14: 0000000000000001 R15: ffff88802423c238
[164.964714] FS:  0000729f4d972940(0000) GS:ffff8880f8e77000(0000) knlGS:0000000000000000
[164.964720] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[164.964725] CR2: 0000729f4d92e720 CR3: 000000003afe4000 CR4: 00000000000006f0
[164.964729] Call Trace:
[164.964734]  <IRQ>
[164.964750]  dma_fence_chain_get_prev+0x13d/0x240
[164.964769]  dma_fence_chain_walk+0xbd/0x200
[164.964784]  dma_fence_chain_enable_signaling+0xb2/0x280
[164.964803]  dma_fence_chain_irq_work+0x1b/0x80
[164.964816]  irq_work_single+0x75/0xa0
[164.964834]  irq_work_run_list+0x33/0x60
[164.964846]  irq_work_run+0x18/0x40
[164.964856]  __sysvec_irq_work+0x35/0x170
[164.964868]  sysvec_irq_work+0x9b/0xc0
[164.964879]  </IRQ>
[164.964882]  <TASK>
[164.964890]  asm_sysvec_irq_work+0x1b/0x20
[164.964900] RIP: 0010:_raw_spin_unlock_irq+0x2d/0x70
[164.964907] Code: 00 00 55 48 89 e5 53 48 89 fb 48 83 c7 18 48 8b 75 08 e8 06 63 bf fe 48 89 df e8 be 98 bf fe e8 59 ee d3 fe fb 0f 1f 44 00 00 <65> ff 0d 5c 85 68 01 74 14 48 8b 5d f8 c9 31 c0 31 d2 31 c9 31 f6
[164.964913] RSP: 0018:ffffc9000070fca0 EFLAGS: 00000246
[164.964919] RAX: 0000000000000000 RBX: ffff88800c2d8b10 RCX: 0000000000000000
[164.964923] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[164.964927] RBP: ffffc9000070fca8 R08: 0000000000000000 R09: 0000000000000000
[164.964931] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88800c2d8ac0
[164.964934] R13: ffffc9000070fcc8 R14: ffff88800c2d8ac0 R15: 00000000ffffffff
[164.964967]  sync_timeline_signal+0x153/0x2c0
[164.964989]  sw_sync_ioctl+0x98/0x580
[164.965017]  __x64_sys_ioctl+0xa2/0x100
[164.965034]  x64_sys_call+0x1226/0x2680
[164.965046]  do_syscall_64+0x93/0x980
[164.965057]  ? do_syscall_64+0x1b7/0x980
[164.965070]  ? lock_release+0xce/0x2a0
[164.965082]  ? __might_fault+0x53/0xb0
[164.965096]  ? __might_fault+0x89/0xb0
[164.965104]  ? __might_fault+0x53/0xb0
[164.965116]  ? _copy_to_user+0x53/0x70
[164.965131]  ? __x64_sys_rt_sigprocmask+0x8f/0xe0
[164.965152]  ? do_syscall_64+0x1b7/0x980
[164.965169]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[164.965176] RIP: 0033:0x729f4fb24ded
[164.965188] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
[164.965193] RSP: 002b:00007ffdc36220e0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
[164.965200] RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000729f4fb24ded
[164.965205] RDX: 00007ffdc3622174 RSI: 0000000040045701 RDI: 0000000000000007
[164.965209] RBP: 00007ffdc3622130 R08: 0000000000000000 R09: 0000000000000000
[164.965213] R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffdc3622174
[164.965217] R13: 0000000040045701 R14: 0000000000000007 R15: 0000000000000003
[164.965248]  </TASK>
[166.952984] perf: interrupt took too long (11861 > 6217), lowering kernel.perf_event_max_sample_rate to 16000
[166.953134] clocksource: Long readout interval, skipping watchdog check: cs_nsec: 13036276804 wd_nsec: 13036274445

As explained by Christian Köenig[2], "The purpose of the sw-sync is to
test what happens if drivers exposing dma-fences doesn't behave well.  So
being able to trigger the NMI watchdog for example is part of why that
functionality exists in the first place. ... You can actually use the
functionality to intentionally deadlock drivers and even the core memory
management."

Let the feature show up only if EXPERT is selected.

[1] https://patchwork.freedesktop.org/series/154715/
[2] https://patchwork.freedesktop.org/patch/675579/#comment_1239269

Fixes: 35538d7822e86 ("dma-buf/sw_sync: de-stage SW_SYNC")
Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/dma-buf/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index b46eb8a552d7b..e726948b64f67 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -18,7 +18,7 @@ config SYNC_FILE
 	  Documentation/driver-api/sync_file.rst.
 
 config SW_SYNC
-	bool "Sync File Validation Framework"
+	bool "Sync File Validation Framework" if EXPERT
 	default n
 	depends on SYNC_FILE
 	depends on DEBUG_FS
-- 
2.51.0

