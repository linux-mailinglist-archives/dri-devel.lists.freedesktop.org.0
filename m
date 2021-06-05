Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101539D59E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 09:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B196E2B8;
	Mon,  7 Jun 2021 07:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 552 seconds by postgrey-1.36 at gabe;
 Sat, 05 Jun 2021 19:53:10 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2E056E1F9;
 Sat,  5 Jun 2021 19:53:10 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 93AA07A021C;
 Sat,  5 Jun 2021 21:43:56 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer dereference
 in nouveau_bo_sync_for_device
Date: Sat, 5 Jun 2021 21:43:52 +0200
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202106052143.52488.linux@zary.sk>
X-Mailman-Approved-At: Mon, 07 Jun 2021 07:11:17 +0000
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
I'm testing 5.13.0-rc4 and nouveau crashes with NULL pointer dereference in nouveau_bo_sync_for_device.
Found various reports like this but that was back in februaryso that should be fixed now.

[   21.003216] BUG: kernel NULL pointer dereference, address: 00000000
[   21.003235] #PF: supervisor read access in kernel mode
[   21.003243] #PF: error_code(0x0000) - not-present page
[   21.003250] *pde = 00000000
[   21.003258] Oops: 0000 [#1] SMP
[   21.003268] CPU: 0 PID: 222 Comm: systemd-udevd Not tainted 5.13.0-rc4+ #327
[   21.003278] Hardware name:  /848P-ICH5, BIOS 6.00 PG 02/03/2005
[   21.003285] EIP: nouveau_bo_sync_for_device+0x9e/0xbf [nouveau]
[   21.003571] Code: 02 89 45 e8 01 d1 8b 19 89 5d ec bb 01 00 00 00 3b 5d e8 74 0d 89 d8 c1 e0 05 03 45 ec 39 04 99 74 1e 8b 46 10 89 d9 c1 e1 0c <8b> 14 10 8b 47 e0 8b 40 08 6a 01 e8 d5 03 55 df 01 5d f0 58 eb ae
[   21.003588] EAX: 00000000 EBX: 00000010 ECX: 00010000 EDX: 00000000
[   21.003597] ESI: c3e90280 EDI: c185a494 EBP: c2ed7c10 ESP: c2ed7bf8
[   21.003606] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210206
[   21.003615] CR0: 80050033 CR2: 00000000 CR3: 02ecb000 CR4: 00000690
[   21.003625] Call Trace:
[   21.003635]  nouveau_bo_validate+0x3f/0x48 [nouveau]
[   21.003911]  nouveau_bo_pin+0xf0/0x187 [nouveau]
[   21.004182]  nouveau_channel_prep+0xc0/0x269 [nouveau]
[   21.004454]  nouveau_channel_new+0x3c/0x5f5 [nouveau]
[   21.004725]  ? slab_free_freelist_hook+0x3b/0xa7
[   21.004740]  ? kfree+0x9e/0x11a
[   21.004749]  ? nvif_object_sclass_put+0xd/0x16 [nouveau]
[   21.004944]  nouveau_drm_device_init+0x2e2/0x646 [nouveau]
[   21.005186]  ? pci_enable_device_flags+0x23/0x97
[   21.005202]  nouveau_drm_probe+0xe5/0x182 [nouveau]
[   21.005443]  ? nouveau_drm_device_init+0x646/0x646 [nouveau]
[   21.005683]  pci_device_probe+0x89/0xe9
[   21.005696]  really_probe+0x127/0x2b9
[   21.005707]  driver_probe_device+0x62/0x89
[   21.005715]  device_driver_attach+0x2e/0x41
[   21.005724]  __driver_attach+0x83/0x8a
[   21.005732]  bus_for_each_dev+0x4c/0x66
[   21.005740]  driver_attach+0x14/0x16
[   21.005747]  ? device_driver_attach+0x41/0x41
[   21.005756]  bus_add_driver+0xc5/0x16c
[   21.005764]  driver_register+0x87/0xb9
[   21.005772]  __pci_register_driver+0x38/0x3b
[   21.005780]  ? 0xf0be4000
[   21.005787]  nouveau_drm_init+0x14c/0x1000 [nouveau]
[   21.005964]  do_one_initcall+0x5a/0x134
[   21.005975]  ? __vunmap+0x124/0x12d
[   21.005984]  ? __vunmap+0x124/0x12d
[   21.005992]  ? kmem_cache_alloc+0xa8/0xb6
[   21.006001]  ? do_init_module+0x17/0x1cf
[   21.006012]  do_init_module+0x46/0x1cf
[   21.006021]  load_module+0x1799/0x1bcb
[   21.006032]  __ia32_sys_finit_module+0x72/0x7a
[   21.006044]  do_int80_syscall_32+0x53/0x62
[   21.006054]  entry_INT80_32+0xf0/0xf0
[   21.006063] EIP: 0xb7f40092
[   21.006071] Code: 00 00 00 e9 90 ff ff ff ff a3 24 00 00 00 68 30 00 00 00 e9 80 ff ff ff ff a3 e8 ff ff ff 66 90 00 00 00 00 00 00 00 00 cd 80 <c3> 8d b4 26 00 00 00 00 8d b6 00 00 00 00 8b 1c 24 c3 8d b4 26 00
[   21.006086] EAX: ffffffda EBX: 00000010 ECX: b7e9bbdd EDX: 00000000
[   21.006095] ESI: 008f27d0 EDI: 008f9e10 EBP: 00000000 ESP: bfa140b8
[   21.006103] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00200296
[   21.006114] Modules linked in: nouveau(+) snd_intel8x0 snd_ac97_codec pcmcia wmi hwmon ac97_bus yenta_socket pcmcia_rsrc drm_ttm_helper snd_pcm ttm snd_timer pcmcia_core psmouse 8139cp snd sg soundcore serio_raw parport_pc intel_agp parport
[   21.006165] CR2: 0000000000000000
[   21.006201] ---[ end trace 02dc541683feafc6 ]---
[   21.006211] EIP: nouveau_bo_sync_for_device+0x9e/0xbf [nouveau]
[   21.006460] Code: 02 89 45 e8 01 d1 8b 19 89 5d ec bb 01 00 00 00 3b 5d e8 74 0d 89 d8 c1 e0 05 03 45 ec 39 04 99 74 1e 8b 46 10 89 d9 c1 e1 0c <8b> 14 10 8b 47 e0 8b 40 08 6a 01 e8 d5 03 55 df 01 5d f0 58 eb ae
[   21.006476] EAX: 00000000 EBX: 00000010 ECX: 00010000 EDX: 00000000
[   21.006485] ESI: c3e90280 EDI: c185a494 EBP: c2ed7c10 ESP: c2ed7bf8
[   21.006494] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00210206
[   21.006503] CR0: 80050033 CR2: 00000000 CR3: 02ecb000 CR4: 00000690


-- 
Ondrej Zary
