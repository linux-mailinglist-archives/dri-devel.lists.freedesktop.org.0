Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0A08B6B62
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 09:26:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0022D10EB2D;
	Tue, 30 Apr 2024 07:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Mk/i/Cpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 953 seconds by postgrey-1.36 at gabe;
 Tue, 30 Apr 2024 06:31:42 UTC
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id AE00D10F2BD;
 Tue, 30 Apr 2024 06:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=OykVS
 bzCv4+d4dPQLDypPadwOtIhxe1BrterZQ+EVfc=; b=Mk/i/CporQhNjM1Pb4Fxn
 JzDrNc4n/H6i6Uz/6EZ+8yQgmt26tYyrfSqBhYGHAu/ubD170GE/f2+fQ2XzKy8k
 +t995s0ICyjIoM/UQJktZ4tYUBOt7rgYAcT5UU020DHxF6e+CgfTL2v5iQ8GwkiH
 TGxBUVX71rndtgrfXtIBus=
Received: from localhost.localdomain (unknown [111.35.187.227])
 by gzga-smtp-mta-g0-3 (Coremail) with SMTP id _____wD3v3dtjDBmw0B8Cw--.43676S4;
 Tue, 30 Apr 2024 14:15:18 +0800 (CST)
From: David Wang <00107082@163.com>
To: dreaming.about.electric.sheep@gmail.com, airlied@redhat.com,
 kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, David Wang <00107082@163.com>
Subject: [Regression] 6.9.0: WARNING: workqueue: WQ_MEM_RECLAIM
 ttm:ttm_bo_delayed_delete [ttm] is flushing !WQ_MEM_RECLAIM
 events:qxl_gc_work [qxl]
Date: Tue, 30 Apr 2024 14:13:37 +0800
Message-Id: <20240430061337.764633-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID: _____wD3v3dtjDBmw0B8Cw--.43676S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3JrWkWF4kWry3AFWrKw13CFg_yoWxuF1Dpr
 yYyF109FWrJw1qya1kJr1Fyws2qFsF9FWUZFyfGr10k3W5XF1rJa13Ga43KrWUCr9rJFW7
 Awnrta4YyFnrAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUhL8UUUUU=
X-Originating-IP: [111.35.187.227]
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/1tbiMw7PqmXAk7vy7wABsJ
X-Mailman-Approved-At: Tue, 30 Apr 2024 07:26:16 +0000
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

Hi,
I got following kernel WARNING when the my 2-core KVM(6.9.0-rc6) is under h=
igh cpu load.

	[Mon Apr 29 21:36:04 2024] ------------[ cut here ]------------
	[Mon Apr 29 21:36:04 2024] workqueue: WQ_MEM_RECLAIM ttm:ttm_bo_delayed_de=
lete [ttm] is flushing !WQ_MEM_RECLAIM events:qxl_gc_work [qxl]
	[Mon Apr 29 21:36:04 2024] WARNING: CPU: 1 PID: 792 at kernel/workqueue.c:=
3728 check_flush_dependency+0xfd/0x120
	[Mon Apr 29 21:36:04 2024] Modules linked in: xt_conntrack(E) nft_chain_na=
t(E) xt_MASQUERADE(E) nf_nat(E) nf_conntrack_netlink(E) xfrm_user(E) xfrm_a=
lgo(E) xt_addrtype(E) nft_compat(E) nf_tables(E) br_netfilter(E) bridge(E) =
stp(E) llc(E) ip_set(E) nfnetlink(E) ip_vs_sh(E) ip_vs_wrr(E) ip_vs_rr(E) i=
p_vs(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) intel_rapl_msr(=
E) intel_rapl_common(E) crct10dif_pclmul(E) ghash_clmulni_intel(E) snd_hda_=
codec_generic(E) snd_hda_intel(E) snd_intel_dspcfg(E) sha512_ssse3(E) snd_h=
da_codec(E) sha512_generic(E) sha256_ssse3(E) overlay(E) sha1_ssse3(E) snd_=
hda_core(E) snd_hwdep(E) aesni_intel(E) snd_pcm(E) crypto_simd(E) pcspkr(E)=
 cryptd(E) joydev(E) qxl(E) snd_timer(E) drm_ttm_helper(E) ttm(E) evdev(E) =
snd(E) iTCO_wdt(E) serio_raw(E) sg(E) virtio_balloon(E) virtio_console(E) i=
TCO_vendor_support(E) soundcore(E) qemu_fw_cfg(E) drm_kms_helper(E) button(=
E) binfmt_misc(E) fuse(E) drm(E) configfs(E) virtio_rng(E) rng_core(E) ip_t=
ables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E)
	[Mon Apr 29 21:36:04 2024]  hid_generic(E) usbhid(E) hid(E) sr_mod(E) cdro=
m(E) ahci(E) libahci(E) virtio_net(E) net_failover(E) failover(E) virtio_bl=
k(E) libata(E) xhci_pci(E) crc32_pclmul(E) crc32c_intel(E) scsi_mod(E) scsi=
_common(E) lpc_ich(E) i2c_i801(E) xhci_hcd(E) psmouse(E) i2c_smbus(E) virti=
o_pci(E) usbcore(E) virtio_pci_legacy_dev(E) virtio_pci_modern_dev(E) usb_c=
ommon(E) virtio(E) mfd_core(E) virtio_ring(E)
	[Mon Apr 29 21:36:04 2024] CPU: 1 PID: 792 Comm: kworker/u13:4 Tainted: G =
           E      6.9.0-rc6-linan-5 #197
	[Mon Apr 29 21:36:04 2024] Hardware name: QEMU Standard PC (Q35 + ICH9, 20=
09), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
	[Mon Apr 29 21:36:04 2024] Workqueue: ttm ttm_bo_delayed_delete [ttm]
	[Mon Apr 29 21:36:04 2024] RIP: 0010:check_flush_dependency+0xfd/0x120
	[Mon Apr 29 21:36:04 2024] Code: 8b 45 18 48 8d b2 c0 00 00 00 49 89 e8 48=
 8d 8b c0 00 00 00 48 c7 c7 68 30 a4 a7 c6 05 9b 12 6e 01 01 48 89 c2 e8 53=
 b9 fd ff <0f> 0b e9 1e ff ff ff 80 3d 86 12 6e 01 00 75 93 e9 4a ff ff ff =
66
	[Mon Apr 29 21:36:04 2024] RSP: 0018:ffff9d31805abce8 EFLAGS: 00010086
	[Mon Apr 29 21:36:04 2024] RAX: 0000000000000000 RBX: ffff8c8c4004ee00 RCX=
: 0000000000000000
	[Mon Apr 29 21:36:04 2024] RDX: 0000000000000003 RSI: 0000000000000027 RDI=
: 00000000ffffffff
	[Mon Apr 29 21:36:04 2024] RBP: ffffffffc0b53570 R08: 0000000000000000 R09=
: 0000000000000003
	[Mon Apr 29 21:36:04 2024] R10: ffff9d31805abb80 R11: ffffffffa7cc1108 R12=
: ffff8c8c42eb8000
	[Mon Apr 29 21:36:04 2024] R13: ffff8c8c48077900 R14: ffff8c8cbbd30b80 R15=
: 0000000000000001
	[Mon Apr 29 21:36:04 2024] FS:  0000000000000000(0000) GS:ffff8c8cbbd00000=
(0000) knlGS:0000000000000000
	[Mon Apr 29 21:36:04 2024] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
	[Mon Apr 29 21:36:04 2024] CR2: 00007ffd38bb3ff8 CR3: 000000010217a000 CR4=
: 0000000000350ef0
	[Mon Apr 29 21:36:04 2024] Call Trace:
	[Mon Apr 29 21:36:04 2024]  <TASK>
	[Mon Apr 29 21:36:04 2024]  ? __warn+0x7c/0x120
	[Mon Apr 29 21:36:04 2024]  ? check_flush_dependency+0xfd/0x120
	[Mon Apr 29 21:36:04 2024]  ? report_bug+0x18d/0x1c0
	[Mon Apr 29 21:36:04 2024]  ? srso_return_thunk+0x5/0x5f
	[Mon Apr 29 21:36:04 2024]  ? handle_bug+0x3c/0x80
	[Mon Apr 29 21:36:04 2024]  ? exc_invalid_op+0x13/0x60
	[Mon Apr 29 21:36:04 2024]  ? asm_exc_invalid_op+0x16/0x20
	[Mon Apr 29 21:36:04 2024]  ? __pfx_qxl_gc_work+0x10/0x10 [qxl]
	[Mon Apr 29 21:36:04 2024]  ? check_flush_dependency+0xfd/0x120
	[Mon Apr 29 21:36:04 2024]  ? check_flush_dependency+0xfd/0x120
	[Mon Apr 29 21:36:04 2024]  __flush_work.isra.0+0xc0/0x270
	[Mon Apr 29 21:36:04 2024]  ? srso_return_thunk+0x5/0x5f
	[Mon Apr 29 21:36:04 2024]  ? srso_return_thunk+0x5/0x5f
	[Mon Apr 29 21:36:04 2024]  ? __queue_work.part.0+0x18b/0x3d0
	[Mon Apr 29 21:36:04 2024]  ? srso_return_thunk+0x5/0x5f
	[Mon Apr 29 21:36:04 2024]  qxl_queue_garbage_collect+0x7f/0x90 [qxl]
	[Mon Apr 29 21:36:04 2024]  qxl_fence_wait+0x9c/0x180 [qxl]
	[Mon Apr 29 21:36:04 2024]  dma_fence_wait_timeout+0x61/0x130
	[Mon Apr 29 21:36:04 2024]  dma_resv_wait_timeout+0x6d/0xd0
	[Mon Apr 29 21:36:04 2024]  ttm_bo_delayed_delete+0x26/0x80 [ttm]
	[Mon Apr 29 21:36:04 2024]  process_one_work+0x18c/0x3b0
	[Mon Apr 29 21:36:04 2024]  worker_thread+0x273/0x390
	[Mon Apr 29 21:36:04 2024]  ? __pfx_worker_thread+0x10/0x10
	[Mon Apr 29 21:36:04 2024]  kthread+0xdd/0x110
	[Mon Apr 29 21:36:04 2024]  ? __pfx_kthread+0x10/0x10
	[Mon Apr 29 21:36:04 2024]  ret_from_fork+0x30/0x50
	[Mon Apr 29 21:36:04 2024]  ? __pfx_kthread+0x10/0x10
	[Mon Apr 29 21:36:04 2024]  ret_from_fork_asm+0x1a/0x30
	[Mon Apr 29 21:36:04 2024]  </TASK>
	[Mon Apr 29 21:36:04 2024] ---[ end trace 0000000000000000 ]---

I find that the exact warning message mentioned in
 https://lore.kernel.org/lkml/20240404181448.1643-1-dreaming.about.electric=
.sheep@gmail.com/T/#m8c2ecc83ebba8717b1290ec28d4dc15f2fa595d5
And confirmed that the warning is caused by 07ed11afb68d94eadd4ffc082b97c23=
31307c5ea and reverting it can fix.


It seems that under heavy load, qxl_queue_garbage_collect would be called w=
ithin
a WQ_MEM_RECLAIM worker, and flush qxl_gc_work which is a
!WQ_MEM_RECLAIM worker. This will trigger the kernel WARNING by
check_flush_dependency.

And I tried following changes, setting flush flag to false.
The warning is gone, but I am not sure whether there is any other side-effe=
ct,
especially the issue mentioned in=20
https://lore.kernel.org/lkml/20240404181448.1643-2-dreaming.about.electric.=
sheep@gmail.com/T/#m988ffad2000c794dcfdab7e60b03db93d8726391

Signed-off-by: David Wang <00107082@163.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_re=
lease.c
index 9febc8b73f09..f372085c5aad 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -76,7 +76,7 @@ static long qxl_fence_wait(struct dma_fence *fence, bool =
intr,
 	qxl_io_notify_oom(qdev);
=20
 	for (count =3D 0; count < 11; count++) {
-		if (!qxl_queue_garbage_collect(qdev, true))
+		if (!qxl_queue_garbage_collect(qdev, false))
 			break;
=20
 		if (dma_fence_is_signaled(fence))
--=20
2.39.2



David

