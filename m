Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954788919B2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 13:45:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350161126D3;
	Fri, 29 Mar 2024 12:45:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P3PMUSiF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CF51126EB
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 12:45:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3362D61926;
 Fri, 29 Mar 2024 12:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D010FC433C7;
 Fri, 29 Mar 2024 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711716298;
 bh=6BdiWNImZdFL0ki28gEPPamLDaqVEij1lQPmtcdVQ4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P3PMUSiFGhsSEfFZTYx2NMonHTsRbaOefIMvbe+x0sPkeipEdSE/mO02FuYjhfwDo
 dOYTBnNZgK3CIKyo38HuWC1c2os9Lc5JIexFTPI/4QXpSWUG5/xse7pGYJFGCd3PAu
 ZJnCVs+8Hx4tjGuV6jOg/nYZEm2VlZUGDcp4MsWu7xpNQMGta2zDWGmIicY/tFzK1v
 bKP3ZTFwLUzG/CrmObTWLA5aCEsiX2Q5Mwgi5Lulz4D2Z845ZqykeQxQmwK02fDI32
 lVp3r6UMXir5DLLT+rN9hZCM9ynZNnqmoomCjlasoOoflAQaoCRo6CzM6Rx+2symqg
 au/tiNdRoUW6Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shradha Gupta <shradhagupta@linux.microsoft.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sasha Levin <sashal@kernel.org>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 46/75] drm: Check output polling initialized
 before disabling
Date: Fri, 29 Mar 2024 08:42:27 -0400
Message-ID: <20240329124330.3089520-46-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124330.3089520-1-sashal@kernel.org>
References: <20240329124330.3089520-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
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

From: Shradha Gupta <shradhagupta@linux.microsoft.com>

[ Upstream commit 5abffb66d12bcac84bf7b66389c571b8bb6e82bd ]

In drm_kms_helper_poll_disable() check if output polling
support is initialized before disabling polling. If not flag
this as a warning.
Additionally in drm_mode_config_helper_suspend() and
drm_mode_config_helper_resume() calls, that re the callers of these
functions, avoid invoking them if polling is not initialized.
For drivers like hyperv-drm, that do not initialize connector
polling, if suspend is called without this check, it leads to
suspend failure with following stack
[  770.719392] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
[  770.720592] printk: Suspending console(s) (use no_console_suspend to debug)
[  770.948823] ------------[ cut here ]------------
[  770.948824] WARNING: CPU: 1 PID: 17197 at kernel/workqueue.c:3162 __flush_work.isra.0+0x212/0x230
[  770.948831] Modules linked in: rfkill nft_counter xt_conntrack xt_owner udf nft_compat crc_itu_t nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink vfat fat mlx5_ib ib_uverbs ib_core mlx5_core intel_rapl_msr intel_rapl_common kvm_amd ccp mlxfw kvm psample hyperv_drm tls drm_shmem_helper drm_kms_helper irqbypass pcspkr syscopyarea sysfillrect sysimgblt hv_balloon hv_utils joydev drm fuse xfs libcrc32c pci_hyperv pci_hyperv_intf sr_mod sd_mod cdrom t10_pi sg hv_storvsc scsi_transport_fc hv_netvsc serio_raw hyperv_keyboard hid_hyperv crct10dif_pclmul crc32_pclmul crc32c_intel hv_vmbus ghash_clmulni_intel dm_mirror dm_region_hash dm_log dm_mod
[  770.948863] CPU: 1 PID: 17197 Comm: systemd-sleep Not tainted 5.14.0-362.2.1.el9_3.x86_64 #1
[  770.948865] Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS Hyper-V UEFI Release v4.1 05/09/2022
[  770.948866] RIP: 0010:__flush_work.isra.0+0x212/0x230
[  770.948869] Code: 8b 4d 00 4c 8b 45 08 89 ca 48 c1 e9 04 83 e2 08 83 e1 0f 83 ca 02 89 c8 48 0f ba 6d 00 03 e9 25 ff ff ff 0f 0b e9 4e ff ff ff <0f> 0b 45 31 ed e9 44 ff ff ff e8 8f 89 b2 00 66 66 2e 0f 1f 84 00
[  770.948870] RSP: 0018:ffffaf4ac213fb10 EFLAGS: 00010246
[  770.948871] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8c992857
[  770.948872] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ffff9aad82b00330
[  770.948873] RBP: ffff9aad82b00330 R08: 0000000000000000 R09: ffff9aad87ee3d10
[  770.948874] R10: 0000000000000200 R11: 0000000000000000 R12: ffff9aad82b00330
[  770.948874] R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
[  770.948875] FS:  00007ff1b2f6bb40(0000) GS:ffff9aaf37d00000(0000) knlGS:0000000000000000
[  770.948878] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  770.948878] CR2: 0000555f345cb666 CR3: 00000001462dc005 CR4: 0000000000370ee0
[  770.948879] Call Trace:
[  770.948880]  <TASK>
[  770.948881]  ? show_trace_log_lvl+0x1c4/0x2df
[  770.948884]  ? show_trace_log_lvl+0x1c4/0x2df
[  770.948886]  ? __cancel_work_timer+0x103/0x190
[  770.948887]  ? __flush_work.isra.0+0x212/0x230
[  770.948889]  ? __warn+0x81/0x110
[  770.948891]  ? __flush_work.isra.0+0x212/0x230
[  770.948892]  ? report_bug+0x10a/0x140
[  770.948895]  ? handle_bug+0x3c/0x70
[  770.948898]  ? exc_invalid_op+0x14/0x70
[  770.948899]  ? asm_exc_invalid_op+0x16/0x20
[  770.948903]  ? __flush_work.isra.0+0x212/0x230
[  770.948905]  __cancel_work_timer+0x103/0x190
[  770.948907]  ? _raw_spin_unlock_irqrestore+0xa/0x30
[  770.948910]  drm_kms_helper_poll_disable+0x1e/0x40 [drm_kms_helper]
[  770.948923]  drm_mode_config_helper_suspend+0x1c/0x80 [drm_kms_helper]
[  770.948933]  ? __pfx_vmbus_suspend+0x10/0x10 [hv_vmbus]
[  770.948942]  hyperv_vmbus_suspend+0x17/0x40 [hyperv_drm]
[  770.948944]  ? __pfx_vmbus_suspend+0x10/0x10 [hv_vmbus]
[  770.948951]  dpm_run_callback+0x4c/0x140
[  770.948954]  __device_suspend_noirq+0x74/0x220
[  770.948956]  dpm_noirq_suspend_devices+0x148/0x2a0
[  770.948958]  dpm_suspend_end+0x54/0xe0
[  770.948960]  create_image+0x14/0x290
[  770.948963]  hibernation_snapshot+0xd6/0x200
[  770.948964]  hibernate.cold+0x8b/0x1fb
[  770.948967]  state_store+0xcd/0xd0
[  770.948969]  kernfs_fop_write_iter+0x124/0x1b0
[  770.948973]  new_sync_write+0xff/0x190
[  770.948976]  vfs_write+0x1ef/0x280
[  770.948978]  ksys_write+0x5f/0xe0
[  770.948979]  do_syscall_64+0x5c/0x90
[  770.948981]  ? syscall_exit_work+0x103/0x130
[  770.948983]  ? syscall_exit_to_user_mode+0x12/0x30
[  770.948985]  ? do_syscall_64+0x69/0x90
[  770.948986]  ? do_syscall_64+0x69/0x90
[  770.948987]  ? do_user_addr_fault+0x1d6/0x6a0
[  770.948989]  ? do_syscall_64+0x69/0x90
[  770.948990]  ? exc_page_fault+0x62/0x150
[  770.948992]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[  770.948995] RIP: 0033:0x7ff1b293eba7
[  770.949010] Code: 0b 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f 1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
[  770.949011] RSP: 002b:00007ffde3912128 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  770.949012] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007ff1b293eba7
[  770.949013] RDX: 0000000000000005 RSI: 00007ffde3912210 RDI: 0000000000000004
[  770.949014] RBP: 00007ffde3912210 R08: 000055d7dd4c9510 R09: 00007ff1b29b14e0
[  770.949014] R10: 00007ff1b29b13e0 R11: 0000000000000246 R12: 0000000000000005
[  770.949015] R13: 000055d7dd4c53e0 R14: 0000000000000005 R15: 00007ff1b29f69e0
[  770.949016]  </TASK>
[  770.949017] ---[ end trace e6fa0618bfa2f31d ]---

Built-on: Rhel9, Ubuntu22
Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/1706856208-9617-1-git-send-email-shradhagupta@linux.microsoft.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_modeset_helper.c | 19 ++++++++++++++++---
 drivers/gpu/drm/drm_probe_helper.c   | 13 +++++++++++--
 2 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index f858dfedf2cfc..2c582020cb423 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -193,13 +193,22 @@ int drm_mode_config_helper_suspend(struct drm_device *dev)
 
 	if (!dev)
 		return 0;
+	/*
+	 * Don't disable polling if it was never initialized
+	 */
+	if (dev->mode_config.poll_enabled)
+		drm_kms_helper_poll_disable(dev);
 
-	drm_kms_helper_poll_disable(dev);
 	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 1);
 	state = drm_atomic_helper_suspend(dev);
 	if (IS_ERR(state)) {
 		drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
-		drm_kms_helper_poll_enable(dev);
+		/*
+		 * Don't enable polling if it was never initialized
+		 */
+		if (dev->mode_config.poll_enabled)
+			drm_kms_helper_poll_enable(dev);
+
 		return PTR_ERR(state);
 	}
 
@@ -239,7 +248,11 @@ int drm_mode_config_helper_resume(struct drm_device *dev)
 	dev->mode_config.suspend_state = NULL;
 
 	drm_fb_helper_set_suspend_unlocked(dev->fb_helper, 0);
-	drm_kms_helper_poll_enable(dev);
+	/*
+	 * Don't enable polling if it is not initialized
+	 */
+	if (dev->mode_config.poll_enabled)
+		drm_kms_helper_poll_enable(dev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 3f479483d7d80..bd76603dc3876 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -293,14 +293,17 @@ static void reschedule_output_poll_work(struct drm_device *dev)
  * Drivers can call this helper from their device resume implementation. It is
  * not an error to call this even when output polling isn't enabled.
  *
+ * If device polling was never initialized before, this call will trigger a
+ * warning and return.
+ *
  * Note that calls to enable and disable polling must be strictly ordered, which
  * is automatically the case when they're only call from suspend/resume
  * callbacks.
  */
 void drm_kms_helper_poll_enable(struct drm_device *dev)
 {
-	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll ||
-	    dev->mode_config.poll_running)
+	if (drm_WARN_ON_ONCE(dev, !dev->mode_config.poll_enabled) ||
+	    !drm_kms_helper_poll || dev->mode_config.poll_running)
 		return;
 
 	if (drm_kms_helper_enable_hpd(dev) ||
@@ -871,12 +874,18 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
  * not an error to call this even when output polling isn't enabled or already
  * disabled. Polling is re-enabled by calling drm_kms_helper_poll_enable().
  *
+ * If however, the polling was never initialized, this call will trigger a
+ * warning and return
+ *
  * Note that calls to enable and disable polling must be strictly ordered, which
  * is automatically the case when they're only call from suspend/resume
  * callbacks.
  */
 void drm_kms_helper_poll_disable(struct drm_device *dev)
 {
+	if (drm_WARN_ON(dev, !dev->mode_config.poll_enabled))
+		return;
+
 	if (dev->mode_config.poll_running)
 		drm_kms_helper_disable_hpd(dev);
 
-- 
2.43.0

