Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D22966CB428
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 04:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC410E28C;
	Tue, 28 Mar 2023 02:32:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B2910E28C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 02:32:10 +0000 (UTC)
X-UUID: 9e4cd9b106cf4a5684c3be19ffc29b47-20230328
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20, REQID:8978e95c-fe86-4f39-b70c-94e2bf5e2d58,
 IP:-32
 768,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FIL
 E:-32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-INFO: VERSION:1.1.20, REQID:8978e95c-fe86-4f39-b70c-94e2bf5e2d58,
 IP:-3276
 8,URL:-32768,TC:-32768,Content:-32768,EDM:-32768,RT:-32768,SF:-32768,FILE:
 -32768,BULK:-32768,RULE:Release_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:25b5999, CLOUDID:nil, BulkID:nil, BulkQuantity:0,
 Recheck:
 0,SF:nil,TC:nil,Content:nil,EDM:nil,IP:nil,URL:nil,File:nil,Bulk:nil,QS:ni
 l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 9e4cd9b106cf4a5684c3be19ffc29b47-20230328
X-User: zhouzongmin@kylinos.cn
Received: from thinkpadx13gen2i.. [(116.128.244.169)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>) (Generic MTA)
 with ESMTP id 917128933; Tue, 28 Mar 2023 10:31:33 +0800
From: Zongmin Zhou <zhouzongmin@kylinos.cn>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/probe_helper: fix the warning reported when calling
 drm_kms_helper_poll_disable during suspend
Date: Tue, 28 Mar 2023 10:31:29 +0800
Message-Id: <20230328023129.3596968-1-zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: neil.armstrong@linaro.org, tony.luck@intel.com, keescook@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Zongmin Zhou <zhouzongmin@kylinos.cn>, gpiccoli@igalia.com,
 linux-hardening@vger.kernel.org, laurentiu.palcu@oss.nxp.com,
 dmitry.baryshkov@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When drivers call drm_kms_helper_poll_disable from
their device suspend implementation without enabled output polling before,
following warning will be reported,due to work->func not be initialized:

[   55.141361] WARNING: CPU: 3 PID: 372 at kernel/workqueue.c:3066 __flush_work+0x22f/0x240
[   55.141382] Modules linked in: nls_iso8859_1 snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi snd_seq intel_rapl_msr intel_rapl_common bochs drm_vram_helper drm_ttm_helper snd_seq_device nfit ttm crct10dif_pclmul snd_timer ghash_clmulni_intel binfmt_misc sha512_ssse3 aesni_intel drm_kms_helper joydev input_leds syscopyarea crypto_simd snd cryptd sysfillrect sysimgblt mac_hid serio_raw soundcore qemu_fw_cfg sch_fq_codel msr parport_pc ppdev lp parport drm ramoops reed_solomon pstore_blk pstore_zone efi_pstore virtio_rng ip_tables x_tables autofs4 hid_generic usbhid hid ahci virtio_net i2c_i801 crc32_pclmul psmouse virtio_scsi libahci i2c_smbus lpc_ich xhci_pci net_failover virtio_blk xhci_pci_renesas failover
[   55.141430] CPU: 3 PID: 372 Comm: kworker/u16:9 Not tainted 6.2.0-rc6+ #16
[   55.141433] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
[   55.141435] Workqueue: events_unbound async_run_entry_fn
[   55.141441] RIP: 0010:__flush_work+0x22f/0x240
[   55.141444] Code: 8b 43 28 48 8b 53 30 89 c1 e9 f9 fe ff ff 4c 89 f7 e8 b5 95 d9 00 e8 00 53 08 00 45 31 ff e9 11 ff ff ff 0f 0b e9 0a ff ff ff <0f> 0b 45 31 ff e9 00 ff ff ff e8 e2 54 d8 00 66 90 90 90 90 90 90
[   55.141446] RSP: 0018:ff59221940833c18 EFLAGS: 00010246
[   55.141449] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff9b72bcbe
[   55.141450] RDX: 0000000000000001 RSI: 0000000000000001 RDI: ff3ea01e4265e330
[   55.141451] RBP: ff59221940833c90 R08: 0000000000000000 R09: 8080808080808080
[   55.141453] R10: ff3ea01e42b3caf4 R11: 000000000000000f R12: ff3ea01e4265e330
[   55.141454] R13: 0000000000000001 R14: ff3ea01e505e5e80 R15: 0000000000000001
[   55.141455] FS:  0000000000000000(0000) GS:ff3ea01fb7cc0000(0000) knlGS:0000000000000000
[   55.141456] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   55.141458] CR2: 0000563543ad1546 CR3: 000000010ee82005 CR4: 0000000000771ee0
[   55.141464] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   55.141465] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   55.141466] PKRU: 55555554
[   55.141467] Call Trace:
[   55.141469]  <TASK>
[   55.141472]  ? pcie_wait_cmd+0xdf/0x220
[   55.141478]  ? mptcp_seq_show+0xe0/0x180
[   55.141484]  __cancel_work_timer+0x124/0x1b0
[   55.141487]  cancel_delayed_work_sync+0x17/0x20
[   55.141490]  drm_kms_helper_poll_disable+0x26/0x40 [drm_kms_helper]
[   55.141516]  drm_mode_config_helper_suspend+0x25/0x90 [drm_kms_helper]
[   55.141531]  ? __pm_runtime_resume+0x64/0x90
[   55.141536]  bochs_pm_suspend+0x16/0x20 [bochs]
[   55.141540]  pci_pm_suspend+0x8b/0x1b0
[   55.141545]  ? __pfx_pci_pm_suspend+0x10/0x10
[   55.141547]  dpm_run_callback+0x4c/0x160
[   55.141550]  __device_suspend+0x14c/0x4c0
[   55.141553]  async_suspend+0x24/0xa0
[   55.141555]  async_run_entry_fn+0x34/0x120
[   55.141557]  process_one_work+0x21a/0x3f0
[   55.141560]  worker_thread+0x4e/0x3c0
[   55.141563]  ? __pfx_worker_thread+0x10/0x10
[   55.141565]  kthread+0xf2/0x120
[   55.141568]  ? __pfx_kthread+0x10/0x10
[   55.141570]  ret_from_fork+0x29/0x50
[   55.141575]  </TASK>
[   55.141575] ---[ end trace 0000000000000000 ]---

Fixes: a4e771729a51 ("drm/probe_helper: sort out poll_running vs poll_enabled")
Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
---
 drivers/gpu/drm/drm_probe_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 8127be134c39..ac72b18e2257 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -855,7 +855,8 @@ void drm_kms_helper_poll_disable(struct drm_device *dev)
 	if (dev->mode_config.poll_running)
 		drm_kms_helper_disable_hpd(dev);
 
-	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
+	if (dev->mode_config.poll_enabled)
+		cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
 
 	dev->mode_config.poll_running = false;
 }
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus
