Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37A2948C5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 09:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A6F6F472;
	Wed, 21 Oct 2020 07:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
 [209.85.219.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3626E04A;
 Tue, 20 Oct 2020 08:07:07 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id c129so1152215yba.8;
 Tue, 20 Oct 2020 01:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4I18OZGYkDfxBwkR1g7lilOU8U/ASuhheWL+dSsw1yc=;
 b=FZSI50sElEW4DLbHYyt+Kz5aX3zK6WBHACoBhhRkEaVpc9yEjhTFyVcd/frx8UJx4H
 eIm1hlZvWLkrWCH6VU5vlkRSytX0ZjFXiobZM7/CtPP7N4yggIeiwD8olWMDXZuEM+uU
 rx1pISlCO7Q5pDH4A5TrJbsd/xVmH3Xm0/prkxUgahYXftKVHgNl2grxBfWYIQNParae
 XzvYH5oLF1zOItZUct30Phb8KIWh0DqL1jcg8nA/sbiVDvw/bFBloWNq8pyPsqAnCeXr
 OsAxherC+W9R5CnUHg27aJE0U8tAWsV18Jj+yKDLzuPhWr0i/jpJhBqq1xBi+dS7brKP
 e0Ig==
X-Gm-Message-State: AOAM530u9V203KcarWoc108LYGdlUKrKwVKdl8e1wdZTIyJmQ2W2DB8x
 uRaMuQYVg11Q9IxPaSuLAZyBTQFDeNmOI1GLshY=
X-Google-Smtp-Source: ABdhPJw2LFjqTCfBjsZKhA1ut1K3FStWA8z/LBq+Y6Wnvym2e6AlaG+ifoVhU5GTbxOlL05P5+wG9PLixoDnYThfjd4=
X-Received: by 2002:a25:90b:: with SMTP id 11mr2333497ybj.132.1603181226238;
 Tue, 20 Oct 2020 01:07:06 -0700 (PDT)
MIME-Version: 1.0
From: Mathieu Malaterre <malat@debian.org>
Date: Tue, 20 Oct 2020 10:06:55 +0200
Message-ID: <CA+7wUsyRXSJCoC-YTFM88-B+MMRSa9GThrAgRVtuOrqX8D5X9A@mail.gmail.com>
Subject: RIP: 0010:g84_gr_tlb_flush+0x2eb/0x300 [nouveau]
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
X-Mailman-Approved-At: Wed, 21 Oct 2020 07:16:42 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi there,

Could someone please comment on the following hard-lock (*). Staring
at the code, I see `nvkm_rd32` calls are enclosed in a timeout
detection, except one.

drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c#L171
...
nvkm_msec(device, 2000,
  if (!(nvkm_rd32(device, 0x100c80) & 0x00000001))
  break;
);
...

Would it make sense to also enclose this in the do/while loop ?

Full ref:
* https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/536

Thanks

(*)
Oct 20 08:44:13 vostrodell kernel: [55669.783436] ------------[ cut
here ]------------
Oct 20 08:44:13 vostrodell kernel: [55669.783446] nouveau 0000:01:00.0: timeout
Oct 20 08:44:13 vostrodell kernel: [55669.783527] WARNING: CPU: 1 PID:
7812 at drivers/gpu/drm/nouveau/nvkm/engine/gr/g84.c:171
g84_gr_tlb_flush+0x2eb/0x300 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.783527] Modules linked in:
cdc_acm(OE) fuse md4 sha512_ssse3 sha512_generic cmac nls_utf8 cifs
dns_resolver fscache libdes intel_rapl_msr intel_rapl_common
x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm ath9k
irqbypass ath9k_common ath9k_hw crc32_pclmul ath
snd_hda_codec_conexant ghash_clmulni_intel snd_hda_codec_generic
snd_hda_codec_hdmi ledtrig_audio mac80211 snd_hda_intel
snd_intel_dspcfg aesni_intel libaes crypto_simd snd_hda_codec
snd_hda_core cryptd snd_hwdep cfg80211 glue_helper dcdbas snd_pcm rapl
iTCO_wdt snd_timer intel_pmc_bxt mei_me intel_cstate rfkill
iTCO_vendor_support snd intel_uncore dell_smm_hwmon mei serio_raw
soundcore watchdog libarc4 at24 sg pcspkr evdev binfmt_misc ip_tables
x_tables autofs4 ext4 crc16 mbcache jbd2 crc32c_generic sd_mod sr_mod
t10_pi cdrom crc_t10dif crct10dif_generic hid_generic usbhid hid uas
ata_generic usb_storage nouveau mxm_wmi wmi ata_piix crct10dif_pclmul
crct10dif_common video i2c_algo_bit libata ttm crc32c_intel
Oct 20 08:44:13 vostrodell kernel: [55669.783551]  drm_kms_helper
psmouse scsi_mod i2c_i801 i2c_smbus cec lpc_ich ehci_pci ehci_hcd drm
usbcore r8169 realtek libphy usb_common button [last unloaded:
cdc_acm]
Oct 20 08:44:13 vostrodell kernel: [55669.783558] CPU: 1 PID: 7812
Comm: kworker/1:0 Tainted: G           OE     5.8.0-0.bpo.2-amd64 #1
Debian 5.8.10-1~bpo10+1
Oct 20 08:44:13 vostrodell kernel: [55669.783559] Hardware name: Dell
Inc. Vostro 260   /0GDG8Y       , BIOS A10 02/22/2013
Oct 20 08:44:13 vostrodell kernel: [55669.783595] Workqueue: events
nouveau_cli_work [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.783631] RIP:
0010:g84_gr_tlb_flush+0x2eb/0x300 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.783633] Code: 8b 40 10 48 8b
78 10 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 87 e7 ab e7 4c 89 e2 48
c7 c7 6c 43 63 c0 48 89 c6 e8 30 af 58 e7 <0f> 0b e9 44 ff ff ff e8 d9
d7 cf e7 66 0f 1f 84 00 00 00 00 00 66
Oct 20 08:44:13 vostrodell kernel: [55669.783634] RSP:
0018:ffffae76c66db998 EFLAGS: 00010082
Oct 20 08:44:13 vostrodell kernel: [55669.783634] RAX:
0000000000000000 RBX: ffff9dc2450f8c00 RCX: 0000000000000027
Oct 20 08:44:13 vostrodell kernel: [55669.783635] RDX:
0000000000000027 RSI: ffff9dc277498ac0 RDI: ffff9dc277498ac8
Oct 20 08:44:13 vostrodell kernel: [55669.783636] RBP:
0000000000000000 R08: 00000000000004df R09: 0000000000000004
Oct 20 08:44:13 vostrodell kernel: [55669.783636] R10:
0000000000000000 R11: 0000000000000001 R12: ffff9dc26fc42290
Oct 20 08:44:13 vostrodell kernel: [55669.783637] R13:
000032a15d0363a0 R14: ffff9dc277560580 R15: 0000000000000001
Oct 20 08:44:13 vostrodell kernel: [55669.783638] FS:
0000000000000000(0000) GS:ffff9dc277480000(0000)
knlGS:0000000000000000
Oct 20 08:44:13 vostrodell kernel: [55669.783639] CS:  0010 DS: 0000
ES: 0000 CR0: 0000000080050033
Oct 20 08:44:13 vostrodell kernel: [55669.783639] CR2:
00007f72949e5000 CR3: 000000020480a001 CR4: 00000000000606e0
Oct 20 08:44:13 vostrodell kernel: [55669.783640] Call Trace:
Oct 20 08:44:13 vostrodell kernel: [55669.783648]  ?
enqueue_task_fair+0x8e/0x690
Oct 20 08:44:13 vostrodell kernel: [55669.783683]  ?
nv04_timer_read+0x42/0x60 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831715]
nv50_vmm_flush+0x1f1/0x220 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831719]  ?
refcount_dec_and_mutex_lock+0x26/0x60
Oct 20 08:44:13 vostrodell kernel: [55669.831751]
nvkm_vmm_iter.constprop.10+0x364/0x820 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831783]  ?
nvkm_vmm_map_choose+0xa0/0xa0 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831815]  ?
nv44_vmm_new+0xe0/0xe0 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831847]
nvkm_vmm_ptes_unmap_put+0x2c/0x40 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831885]  ?
nvkm_vmm_map_choose+0xa0/0xa0 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831922]  ?
nv44_vmm_new+0xe0/0xe0 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.831968]
nvkm_vmm_put_locked+0x203/0x240 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832000]
nvkm_uvmm_mthd+0x249/0x710 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832022]
nvkm_ioctl+0xd8/0x170 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832042]
nvif_object_mthd+0x108/0x130 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832045]  ? sched_clock+0x5/0x10
Oct 20 08:44:13 vostrodell kernel: [55669.832048]  ? sched_clock_cpu+0xc/0xb0
Oct 20 08:44:13 vostrodell kernel: [55669.832068]
nvif_vmm_put+0x5c/0x80 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832101]
nouveau_vma_del+0x78/0xc0 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832135]
nouveau_gem_object_delete_work+0x36/0x60 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832168]
nouveau_cli_work+0xc9/0x120 [nouveau]
Oct 20 08:44:13 vostrodell kernel: [55669.832171]  process_one_work+0x1ad/0x370
Oct 20 08:44:13 vostrodell kernel: [55669.832172]  ? create_worker+0x1a0/0x1a0
Oct 20 08:44:13 vostrodell kernel: [55669.832173]  worker_thread+0x30/0x390
Oct 20 08:44:13 vostrodell kernel: [55669.832175]  ? create_worker+0x1a0/0x1a0
Oct 20 08:44:13 vostrodell kernel: [55669.832176]  kthread+0x116/0x130
Oct 20 08:44:13 vostrodell kernel: [55669.832178]  ? kthread_park+0x80/0x80
Oct 20 08:44:13 vostrodell kernel: [55669.832180]  ret_from_fork+0x22/0x30
Oct 20 08:44:13 vostrodell kernel: [55669.832182] ---[ end trace
1981412a7db068a0 ]---
Oct 20 08:44:13 vostrodell kernel: [55672.342498] ------------[ cut
here ]------------
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
