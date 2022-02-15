Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1F24B6FEA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:43:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCF110E658;
	Tue, 15 Feb 2022 15:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6499D10E660
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:43:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5049D61738;
 Tue, 15 Feb 2022 15:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B52C340EB;
 Tue, 15 Feb 2022 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939791;
 bh=SKGn7wND7KsEt36XShzXq7j0Folx5a1fiX2ekqpJ1GI=;
 h=Date:From:To:cc:Subject:From;
 b=fNOn8vALJVmXGzrsUX16C3s9cuKmdnX0wryuVtmQkiLH1ftCdRaHdgu22H+w9XMvK
 0Mbyn1H9RHQQ0r91MwaVV7f30yl+XkCR/FAUufv9VZDr+daiQNlo5m7DmN4x5tvDth
 0KEKd0160VQny9iNZkiF4gtaZ/ei6RVSeeZeUPeysacJQI1bptdzIgzCn5USOSJPvJ
 8yZz364boDacSkjWahmjLbyTrVQ54ubVtZ/6U/TbAMhniGDX9eZjf2SnYSIjeZXz4o
 r7qnOGi+WQq8EgHM2cARhgS8g/J7NryPHpYm0G0o4JNoDRbkxMULPi+zzgFXvhihDu
 0zBy5sr4uK2YA==
Date: Tue, 15 Feb 2022 16:43:08 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Sebastian Siewior <bigeasy@linutronix.de>
Subject: [PATCH] drm: fb-helper: Avoid nesting spinlock_t into raw_spinlock_t
Message-ID: <nycvar.YFH.7.76.2202151640200.11721@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiri Kosina <jkosina@suse.cz>

drm_fb_helper_damage() is acquiring spinlock_t (helper->damage_lock), 
while it can be called from contexts where raw_spinlock_t is held (e.g. 
console_owner lock obtained on vprintk_emit() codepath).

As the critical sections protected by damage_lock are super-tiny, let's 
fix this by converting it to raw_spinlock_t in order not to violate 
PREEMPT_RT-imposed lock nesting rules.

This fixes the splat below.

 =============================
 [ BUG: Invalid wait context ]
 5.17.0-rc4-00002-gd567f5db412e #1 Not tainted
 -----------------------------
 swapper/0/0 is trying to lock:
 ffff8c5687cc4158 (&helper->damage_lock){....}-{3:3}, at: drm_fb_helper_damage.isra.22+0x4a/0xf0
 other info that might help us debug this:
 context-{2:2}
 3 locks held by swapper/0/0:
  #0: ffffffffad776520 (console_lock){+.+.}-{0:0}, at: vprintk_emit+0xb8/0x2a0
  #1: ffffffffad696120 (console_owner){-...}-{0:0}, at: console_unlock+0x17f/0x550
  #2: ffffffffad926a58 (printing_lock){....}-{3:3}, at: vt_console_print+0x7d/0x3e0
 stack backtrace:
 CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.17.0-rc4-00002-gd567f5db412e #1 bed1d5e19e0e7e8c9d97fd8afa1322f7f47a4f38
 Hardware name: LENOVO 20UJS2B905/20UJS2B905, BIOS R1CET63W(1.32 ) 04/09/2021
 Call Trace:
  <IRQ>
  dump_stack_lvl+0x58/0x71
  __lock_acquire+0x165b/0x1780
  ? secondary_startup_64_no_verify+0xd5/0xdb
  lock_acquire+0x278/0x300
  ? drm_fb_helper_damage.isra.22+0x4a/0xf0
  ? save_trace+0x3e/0x340
  ? __bfs+0x10f/0x240
  _raw_spin_lock_irqsave+0x48/0x60
  ? drm_fb_helper_damage.isra.22+0x4a/0xf0
  drm_fb_helper_damage.isra.22+0x4a/0xf0
  soft_cursor+0x194/0x240
  bit_cursor+0x386/0x630
  ? get_color+0x29/0x120
  ? bit_putcs+0x4b0/0x4b0
  ? console_unlock+0x17f/0x550
  hide_cursor+0x2f/0x90
  vt_console_print+0x3c5/0x3e0
  ? console_unlock+0x17f/0x550
  console_unlock+0x515/0x550
  vprintk_emit+0x1c8/0x2a0
  _printk+0x52/0x6e
  ? sched_clock_tick+0x3d/0x60
  collect_cpu_info_amd+0x93/0xd0
  collect_cpu_info_local+0x23/0x30
  flush_smp_call_function_queue+0x137/0x220
  __sysvec_call_function_single+0x43/0x1c0
  sysvec_call_function_single+0x43/0x80
  </IRQ>
  <TASK>
  asm_sysvec_call_function_single+0x12/0x20
 RIP: 0010:cpuidle_enter_state+0x111/0x4b0
 Code: 7c ff 45 84 ff 74 17 9c 58 0f 1f 44 00 00 f6 c4 02 0f 85 71 03 00 00 31 ff e8 bb 21 86 ff e8 76 2f 8e ff fb 66 0f 1f 44 00 00 <45> 85 f6 0f 88 12 01 00 00 49 63 d6 4c 2b 24 24 48 8d 04 52 48 8d
 RSP: 0018:ffffffffad603e48 EFLAGS: 00000206
 RAX: 00000000000127c3 RBX: 0000000000000003 RCX: 0000000000000000
 RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffffac32617a
 RBP: ffff8c5687ba4400 R08: 0000000000000001 R09: 0000000000000001
 R10: ffffffffad603e10 R11: 0000000000000000 R12: 00000000685eb4a0
 R13: ffffffffad918f80 R14: 0000000000000003 R15: 0000000000000000
  ? cpuidle_enter_state+0x10a/0x4b0
  ? cpuidle_enter_state+0x10a/0x4b0
  cpuidle_enter+0x29/0x40
  do_idle+0x24d/0x2c0
  cpu_startup_entry+0x19/0x20
  start_kernel+0x9c2/0x9e9
  secondary_startup_64_no_verify+0xd5/0xdb
  </TASK>

Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/gpu/drm/drm_fb_helper.c | 14 +++++++-------
 include/drm/drm_fb_helper.h     |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ed43b987d306..7c4ab6e6f865 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -436,11 +436,11 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	unsigned long flags;
 	int ret;
 
-	spin_lock_irqsave(&helper->damage_lock, flags);
+	raw_spin_lock_irqsave(&helper->damage_lock, flags);
 	clip_copy = *clip;
 	clip->x1 = clip->y1 = ~0;
 	clip->x2 = clip->y2 = 0;
-	spin_unlock_irqrestore(&helper->damage_lock, flags);
+	raw_spin_unlock_irqrestore(&helper->damage_lock, flags);
 
 	/* Call damage handlers only if necessary */
 	if (!(clip_copy.x1 < clip_copy.x2 && clip_copy.y1 < clip_copy.y2))
@@ -465,12 +465,12 @@ static void drm_fb_helper_damage_work(struct work_struct *work)
 	 * Restore damage clip rectangle on errors. The next run
 	 * of the damage worker will perform the update.
 	 */
-	spin_lock_irqsave(&helper->damage_lock, flags);
+	raw_spin_lock_irqsave(&helper->damage_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, clip_copy.x1);
 	clip->y1 = min_t(u32, clip->y1, clip_copy.y1);
 	clip->x2 = max_t(u32, clip->x2, clip_copy.x2);
 	clip->y2 = max_t(u32, clip->y2, clip_copy.y2);
-	spin_unlock_irqrestore(&helper->damage_lock, flags);
+	raw_spin_unlock_irqrestore(&helper->damage_lock, flags);
 }
 
 /**
@@ -486,7 +486,7 @@ void drm_fb_helper_prepare(struct drm_device *dev, struct drm_fb_helper *helper,
 			   const struct drm_fb_helper_funcs *funcs)
 {
 	INIT_LIST_HEAD(&helper->kernel_fb_list);
-	spin_lock_init(&helper->damage_lock);
+	raw_spin_lock_init(&helper->damage_lock);
 	INIT_WORK(&helper->resume_work, drm_fb_helper_resume_worker);
 	INIT_WORK(&helper->damage_work, drm_fb_helper_damage_work);
 	helper->damage_clip.x1 = helper->damage_clip.y1 = ~0;
@@ -670,12 +670,12 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	if (!drm_fbdev_use_shadow_fb(helper))
 		return;
 
-	spin_lock_irqsave(&helper->damage_lock, flags);
+	raw_spin_lock_irqsave(&helper->damage_lock, flags);
 	clip->x1 = min_t(u32, clip->x1, x);
 	clip->y1 = min_t(u32, clip->y1, y);
 	clip->x2 = max_t(u32, clip->x2, x + width);
 	clip->y2 = max_t(u32, clip->y2, y + height);
-	spin_unlock_irqrestore(&helper->damage_lock, flags);
+	raw_spin_unlock_irqrestore(&helper->damage_lock, flags);
 
 	schedule_work(&helper->damage_work);
 }
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3af4624368d8..91178958896e 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -131,7 +131,7 @@ struct drm_fb_helper {
 	struct fb_info *fbdev;
 	u32 pseudo_palette[17];
 	struct drm_clip_rect damage_clip;
-	spinlock_t damage_lock;
+	raw_spinlock_t damage_lock;
 	struct work_struct damage_work;
 	struct work_struct resume_work;
 

-- 
Jiri Kosina
SUSE Labs

