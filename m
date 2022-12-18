Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041664FEFD
	for <lists+dri-devel@lfdr.de>; Sun, 18 Dec 2022 14:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D73BC10E1A8;
	Sun, 18 Dec 2022 13:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8454210E1A8;
 Sun, 18 Dec 2022 13:28:35 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id m5so2748974qkg.0;
 Sun, 18 Dec 2022 05:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qb03kxSsKf2kA4DzEHi+aZY0BM+dn8goajkko4G0ZYY=;
 b=l7nOnepp+MLJ1eMM4aHXafJxDHGAg2iVyG67OtBwu5VNGnHQ4lfWiI8bf0DtBIfIeX
 XxMeamclWTIhRpLcT674/aurvf4ElJ25qTtC625SiKrlqdAf4qQcL9ksql5q/MTYnvbz
 eIp92R39BXavvYxtoaarpxjiq3rqq0WGZVhVFEhZIbMzWhgjefQ237DjOQUIEjD1FRcZ
 dq8eVplc/YpAXEO+hDnePALoQIH+3BfmVulfj1oGhyTb69p3Vg25oYKsjuxrbSIlzdb7
 rHtlla5tCZgTrDBc9W2uW+rytopGUi0h7ktMXj75TlDlhbHIGDX9hJoE7w7L/BXfzA2E
 jzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qb03kxSsKf2kA4DzEHi+aZY0BM+dn8goajkko4G0ZYY=;
 b=osXHMsRhU4E8t7laU6FsFWMlxnzqce3Qm3kNMsTWyKM2gCPhw9U+5Vf6RUEPNbtqUG
 tZtDXSq/cywUe4a2zrIOHtinotbGs4T8rIgnT2K/WGscZkoXHLIXhrEHFtKUq8vTrPuH
 AWeymbytzyzdAsc9vWFSHLadX2ZdqHeb4/Sg4cd2xKmmW5W5+t3G8+3OqUJPN2IRLlOu
 kuqVhfo8bDfm0anPdf87SjzZusSbG8NhungaPfLpAD89iIDB5//JvHATjjLGp2nIcQHW
 XI4sZgTYXPb3KZfOi3ACqoetx0/U0vW4ZpND1yb/Xb30XnNtLhUuKkyR3O+xJjZHhVaH
 21fw==
X-Gm-Message-State: ANoB5pnzkZ4Vq/oA/jWnqCAzM3E3Hf6JY3ZqyQdmKVt+yWRswTyr1uks
 ZbPOE17ByravQ3ZPgHfxddgfhrEQ72YRrJFxJ/c=
X-Google-Smtp-Source: AA0mqf4C8B6BcDFMn4PftT1GwOAMPcqEpcZkYS7Gtd8l0mSIkRjqI26jNfpJRUUuTOjZbmtbkdwC9PQV0hiQWXRkO9k=
X-Received: by 2002:a05:620a:4382:b0:6ff:9cee:cdb7 with SMTP id
 a2-20020a05620a438200b006ff9ceecdb7mr1413958qkp.327.1671370113717; Sun, 18
 Dec 2022 05:28:33 -0800 (PST)
MIME-Version: 1.0
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sun, 18 Dec 2022 18:28:22 +0500
Message-ID: <CABXGCsNryN9Koz48DiSTPwTBSOKo0U0B3PnW3+gEf2B8n8u0GA@mail.gmail.com>
Subject: [6.2][regression] looks like commit
 aab9cf7b6954136f4339136a1a7fc0602a2c4d8b
 leads to use-after-free and random computer hangs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <Christian.Koenig@amd.com>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, luben.tuikov@amd.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
The kernel 6.2 preparation cycle has begun.
And after the kernel was updated on my Fedora Rawhide I started
receiving use-after-free errors with complete computer hangs.
At least a good reproducer of this behaviour is launch of the game
"Marvel's Avengers".

The backtrace of the issue looks like:
[  550.435083] ------------[ cut here ]------------
[  550.435110] refcount_t: underflow; use-after-free.
[  550.435808] WARNING: CPU: 9 PID: 738 at lib/refcount.c:25
refcount_warn_saturate+0x97/0x110
[  550.435812] Modules linked in: uinput rfcomm snd_seq_dummy
snd_hrtimer netconsole nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack
[  550.435887] refcount_t: saturated; leaking memory.
[  550.435893]  nf_defrag_ipv6 nf_defrag_ipv4
[  550.435902] WARNING: CPU: 26 PID: 5032 at lib/refcount.c:19
refcount_warn_saturate+0x74/0x110
[  550.435907]  ip_set
[  550.435909] Modules linked in:
[  550.435910]  nf_tables
[  550.435912]  uinput rfcomm
[  550.435918]  nfnetlink
[  550.435919]  snd_seq_dummy snd_hrtimer
[  550.435925]  qrtr
[  550.435926]  netconsole nft_objref
[  550.435931]  bnep
[  550.435933]  nf_conntrack_netbios_ns nf_conntrack_broadcast
[  550.435938]  sunrpc
[  550.435939]  nft_fib_inet
[  550.435941]  binfmt_misc
[  550.435942]  nft_fib_ipv4
[  550.435943]  iwlmvm
[  550.435130] WARNING: CPU: 25 PID: 740 at lib/refcount.c:28
refcount_warn_saturate+0xba/0x110
[  550.435945]  nft_fib_ipv6
[  550.435946]  btusb
[  550.435947]  nft_fib nft_reject_inet
[  550.435954]  btrtl
[  550.435955]  nf_reject_ipv4 nf_reject_ipv6
[  550.435963]  btbcm
[  550.435964]  nft_reject nft_ct
[  550.435969]  btintel
[  550.435971]  nft_chain_nat nf_nat
[  550.435977]  btmtk
[  550.435979]  nf_conntrack nf_defrag_ipv6
[  550.435984]  snd_seq_midi
[  550.435985]  nf_defrag_ipv4 ip_set
[  550.435991]  snd_seq_midi_event
[  550.435992]  nf_tables
[  550.435993]  bluetooth
[  550.435995]  nfnetlink
[  550.435996]  hid_logitech_hidpp
[  550.435142] Modules linked in: uinput rfcomm snd_seq_dummy
snd_hrtimer netconsole nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set
nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc iwlmvm btusb btrtl
btbcm btintel btmtk snd_seq_midi snd_seq_midi_event bluetooth
hid_logitech_hidpp snd_usb_audio iwlwifi xpad ff_memless
snd_usbmidi_lib snd_rawmidi mc ecdh_generic intel_rapl_msr
intel_rapl_common mt76x2u mt76x2_common joydev snd_hda_codec_realtek
mt76x02_usb edac_mce_amd snd_hda_codec_generic mt76_usb
snd_hda_codec_hdmi mt76x02_lib kvm_amd snd_hda_intel snd_intel_dspcfg
snd_intel_sdw_acpi snd_hda_codec mt76 vfat kvm snd_hda_core fat
snd_seq snd_hwdep irqbypass snd_seq_device mac80211 snd_pcm eeepc_wmi
asus_wmi ledtrig_audio sparse_keymap rapl platform_profile wmi_bmof
snd_timer snd pcspkr i2c_piix4
[  550.435997]  qrtr bnep
[  550.436003]  snd_usb_audio
[  550.436004]  sunrpc binfmt_misc
[  550.436010]  iwlwifi
[  550.436012]  iwlmvm btusb
[  550.436018]  xpad
[  550.436019]  btrtl btbcm
[  550.436025]  ff_memless
[  550.436026]  btintel
[  550.436027]  snd_usbmidi_lib
[  550.436029]  btmtk
[  550.436030]  snd_rawmidi
[  550.436031]  snd_seq_midi snd_seq_midi_event
[  550.436037]  mc
[  550.436038]  bluetooth
[  550.436039]  ecdh_generic
[  550.436041]  hid_logitech_hidpp snd_usb_audio
[  550.436046]  intel_rapl_msr
[  550.436048]  iwlwifi xpad
[  550.436054]  intel_rapl_common
[  550.436055]  ff_memless
[  550.436056]  mt76x2u
[  550.436058]  snd_usbmidi_lib snd_rawmidi
[  550.436063]  mt76x2_common
[  550.436064]  mc ecdh_generic
[  550.436070]  joydev
[  550.436071]  intel_rapl_msr intel_rapl_common
[  550.436076]  snd_hda_codec_realtek
[  550.436078]  mt76x2u
[  550.436079]  mt76x02_usb
[  550.436080]  mt76x2_common joydev
[  550.436086]  edac_mce_amd
[  550.436088]  snd_hda_codec_realtek mt76x02_usb
[  550.436094]  snd_hda_codec_generic
[  550.436095]  edac_mce_amd
[  550.436096]  mt76_usb
[  550.436098]  snd_hda_codec_generic mt76_usb
[  550.436104]  snd_hda_codec_hdmi
[  550.436106]  snd_hda_codec_hdmi
[  550.436107]  mt76x02_lib
[  550.435234]  k10temp soundcore libarc4 acpi_cpufreq cfg80211
hid_logitech_dj rfkill zram amdgpu drm_ttm_helper ttm video iommu_v2
gpu_sched drm_buddy crct10dif_pclmul crc32_pclmul crc32c_intel igb
ucsi_ccg drm_display_helper nvme typec_ucsi ghash_clmulni_intel ccp
typec cec sp5100_tco dca sha512_ssse3 nvme_core wmi ip6_tables
ip_tables fuse
[  550.436108]  mt76x02_lib kvm_amd
[  550.436115]  kvm_amd
[  550.436116]  snd_hda_intel snd_intel_dspcfg
[  550.436122]  snd_hda_intel
[  550.436123]  snd_intel_sdw_acpi
[  550.435284] CPU: 25 PID: 740 Comm: sdma2 Tainted: G        W    L
  6.1.0-rc1-13-aab9cf7b6954136f4339136a1a7fc0602a2c4d8b+ #178
[  550.436124]  snd_intel_dspcfg
[  550.436126]  snd_hda_codec
[  550.436127]  snd_intel_sdw_acpi
[  550.436128]  mt76 vfat
[  550.436134]  snd_hda_codec
[  550.436135]  kvm
[  550.436136]  mt76
[  550.436138]  snd_hda_core fat
[  550.436144]  vfat
[  550.436145]  snd_seq snd_hwdep
[  550.436152]  kvm
[  550.436153]  irqbypass
[  550.436154]  snd_hda_core
[  550.436156]  snd_seq_device mac80211
[  550.436161]  fat
[  550.436163]  snd_pcm eeepc_wmi
[  550.436168]  snd_seq
[  550.436170]  asus_wmi ledtrig_audio
[  550.436176]  snd_hwdep
[  550.436177]  sparse_keymap
[  550.436178]  irqbypass
[  550.436180]  rapl platform_profile
[  550.436185]  snd_seq_device
[  550.436186]  wmi_bmof
[  550.436188]  mac80211
[  550.436189]  snd_timer
[  550.436190]  snd_pcm
[  550.436192]  snd pcspkr
[  550.436198]  eeepc_wmi
[  550.436200]  i2c_piix4 k10temp
[  550.436205]  asus_wmi
[  550.435292] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4408 10/28/2022
[  550.436207]  soundcore
[  550.436208]  ledtrig_audio
[  550.436209]  libarc4 acpi_cpufreq
[  550.436215]  sparse_keymap
[  550.436216]  cfg80211
[  550.436217]  rapl
[  550.436219]  hid_logitech_dj rfkill
[  550.436224]  platform_profile
[  550.436225]  zram
[  550.436226]  wmi_bmof
[  550.436228]  amdgpu drm_ttm_helper
[  550.436234]  snd_timer
[  550.436235]  ttm
[  550.436236]  snd
[  550.436237]  video iommu_v2
[  550.436244]  pcspkr
[  550.436245]  gpu_sched
[  550.436246]  i2c_piix4
[  550.435299] RIP: 0010:refcount_warn_saturate+0xba/0x110
[  550.436248]  drm_buddy crct10dif_pclmul
[  550.436253]  k10temp
[  550.436255]  crc32_pclmul
[  550.436256]  soundcore
[  550.436257]  crc32c_intel igb
[  550.436263]  libarc4
[  550.436264]  ucsi_ccg
[  550.436265]  acpi_cpufreq
[  550.436267]  drm_display_helper nvme
[  550.436273]  cfg80211
[  550.436274]  typec_ucsi
[  550.436275]  hid_logitech_dj
[  550.436277]  ghash_clmulni_intel ccp
[  550.435308] Code: 01 01 e8 35 09 6f 00 0f 0b e9 02 af a5 00 80 3d
dd 84 be 01 00 75 85 48 c7 c7 70 83 87 b5 c6 05 cd 84 be 01 01 e8 12
09 6f 00 <0f> 0b e9 df ae a5 00 80 3d b8 84 be 01 00 0f 85 5e ff ff ff
48 c7
[  550.436283]  rfkill
[  550.436284]  typec
[  550.436285]  zram
[  550.436286]  cec sp5100_tco
[  550.436293]  amdgpu
[  550.436294]  dca
[  550.436295]  drm_ttm_helper
[  550.436297]  sha512_ssse3 nvme_core
[  550.436303]  ttm
[  550.436304]  wmi
[  550.436305]  video
[  550.436307]  ip6_tables ip_tables
[  550.436312]  iommu_v2
[  550.436314]  fuse
[  550.436315]  gpu_sched
[  550.436316]
[  550.436318] CPU: 26 PID: 5032 Comm: Avengers.exe Tainted: G
W    L     6.1.0-rc1-13-aab9cf7b6954136f4339136a1a7fc0602a2c4d8b+ #178
[  550.436322]  drm_buddy
[  550.436324] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4408 10/28/2022
[  550.436325] RIP: 0010:refcount_warn_saturate+0x74/0x110
[  550.436329]  crct10dif_pclmul
[  550.436331] Code: 01 01 e8 7b 09 6f 00 0f 0b e9 48 af a5 00 80 3d
26 85 be 01 00 75 cb 48 c7 c7 18 83 87 b5 c6 05 16 85 be 01 01 e8 58
09 6f 00 <0f> 0b e9 25 af a5 00 80 3d 01 85 be 01 00 75 a8 48 c7 c7 40
83 87
[  550.436336]  crc32_pclmul
[  550.436338] RSP: 0018:ffffb11a471cf968 EFLAGS: 00010296
[  550.435315] RSP: 0018:ffffb11a47d27e68 EFLAGS: 00010296
[  550.436344]  crc32c_intel
[  550.436345]
[  550.436346]  igb
[  550.436348] RAX: 0000000000000026 RBX: ffffb11a471cf9d8 RCX: 00000000000=
00000
[  550.436354]  ucsi_ccg
[  550.436355] RDX: 0000000000000001 RSI: ffffffffb585efed RDI: 00000000fff=
fffff
[  550.436356] RBP: ffff9a8223960640 R08: 0000000000000001 R09: 00000000000=
00001
[  550.436361]  drm_display_helper
[  550.436362] R10: 0000000000000001 R11: 0000000000000000 R12: 00000000fff=
fffff
[  550.436363] R13: ffffb11a471cfb48 R14: ffffb11a471cfb48 R15: 00000008001=
0c600
[  550.435324] RAX: 0000000000000026 RBX: ffff9a820d62e360 RCX: 00000000000=
00000
[  550.436368]  nvme
[  550.436369] FS:  00000000124ff6c0(0000) GS:ffff9a90e9200000(0000)
knlGS:000000000bdb0000
[  550.436375]  typec_ucsi
[  550.436376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  550.436378] CR2: 000000001af20870 CR3: 000000029c884000 CR4: 00000000003=
50ee0
[  550.436382]  ghash_clmulni_intel
[  550.436383] Call Trace:
[  550.436384]  <TASK>
[  550.436389]  ccp
[  550.436390]  dma_resv_iter_walk_unlocked.part.0+0x143/0x1b0
[  550.436396]  typec
[  550.436400]  dma_resv_iter_first_unlocked+0x5d/0x200
[  550.435331] RDX: 0000000000000001 RSI: ffffffffb585efed RDI: 00000000fff=
fffff
[  550.436405]  cec
[  550.436408]  amdgpu_vm_sdma_update+0x5d/0x360 [amdgpu]
[  550.436581]  sp5100_tco
[  550.436700]  amdgpu_vm_ptes_update+0x28f/0x850 [amdgpu]
[  550.436844]  dca
[  550.436859]  amdgpu_vm_update_range+0x1f9/0x6d0 [amdgpu]
[  550.436994]  sha512_ssse3
[  550.437007]  amdgpu_vm_bo_update+0x29c/0x670 [amdgpu]
[  550.437138]  nvme_core
[  550.437152]  amdgpu_gem_va_ioctl+0x4bd/0x500 [amdgpu]
[  550.437311]  wmi
[  550.437331]  ? amdgpu_gem_va_map_flags+0x70/0x70 [amdgpu]
[  550.437463]  ip6_tables
[  550.437467]  drm_ioctl_kernel+0xa4/0x150
[  550.437471]  ip_tables
[  550.437477]  drm_ioctl+0x1de/0x460
[  550.437480]  fuse
[  550.435338] RBP: ffff9a8210fa4400 R08: 0000000000000000 R09: ffffb11a47d=
27d18
[  550.437546] CPU: 9 PID: 738 Comm: sdma0 Tainted: G        W    L
 6.1.0-rc1-13-aab9cf7b6954136f4339136a1a7fc0602a2c4d8b+ #178
[  550.437484]  ? amdgpu_gem_va_map_flags+0x70/0x70 [amdgpu]
[  550.437566] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4408 10/28/2022
[  550.437567] RIP: 0010:refcount_warn_saturate+0x97/0x110
[  550.437570] Code: 01 01 e8 58 09 6f 00 0f 0b e9 25 af a5 00 80 3d
01 85 be 01 00 75 a8 48 c7 c7 40 83 87 b5 c6 05 f1 84 be 01 01 e8 35
09 6f 00 <0f> 0b e9 02 af a5 00 80 3d dd 84 be 01 00 75 85 48 c7 c7 70
83 87
[  550.437572] RSP: 0018:ffffb11a47d17e68 EFLAGS: 00010296
[  550.437574] RAX: 000000000000002a RBX: ffff9a822fac7520 RCX: 00000000000=
00000
[  550.437576] RDX: 0000000000000001 RSI: ffffffffb585efed RDI: 00000000fff=
fffff
[  550.437577] RBP: ffff9a8210fa2000 R08: 0000000000000001 R09: 00000000000=
00001
[  550.437578] R10: 0000000000000001 R11: 0000000000000000 R12: ffff9a82239=
60640
[  550.437580] R13: ffff9a8223961700 R14: ffff9a822fad0578 R15: ffff9a822fa=
d0578
[  550.437581] FS:  0000000000000000(0000) GS:ffff9a90e4e00000(0000)
knlGS:0000000000000000
[  550.437583] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  550.437584] CR2: 00007f85fc297020 CR3: 000000029c884000 CR4: 00000000003=
50ee0
[  550.437586] Call Trace:
[  550.437587]  <TASK>
[  550.437588]  drm_sched_entity_pop_job+0x47e/0x490 [gpu_sched]
[  550.435345] R10: 0000000000000003 R11: ffff9a912e2fffe8 R12: 00000000fff=
fffff
[  550.437595]  drm_sched_main+0xa7/0x4a0 [gpu_sched]
[  550.437602]  ? prepare_to_wait_exclusive+0xd0/0xd0
[  550.437608]  ? trace_event_raw_event_drm_sched_job+0xf0/0xf0 [gpu_sched]
[  550.437612]  kthread+0xf5/0x120
[  550.435353] R13: ffff9a8223960700 R14: ffff9a822fad1e88 R15: ffff9a822fa=
d1e88
[  550.437624]  ? kthread_complete_and_exit+0x20/0x20
[  550.437636]  ? lock_release+0x14f/0x460
[  550.437641]  ret_from_fork+0x22/0x30
[  550.437647]  ? _raw_spin_unlock_irqrestore+0x30/0x60
[  550.437662]  </TASK>
[  550.437666]  ? _raw_spin_unlock_irqrestore+0x30/0x60
[  550.437672] irq event stamp: 11657
[  550.437674]  ? lockdep_hardirqs_on+0x7d/0x100
[  550.437679] hardirqs last  enabled at (11667): [<ffffffffb418cbc2>]
console_emit_next_record.constprop.0+0x232/0x300
[  550.437687]  ? _raw_spin_unlock_irqrestore+0x40/0x60
[  550.435360] FS:  0000000000000000(0000) GS:ffff9a90e8e00000(0000)
knlGS:0000000000000000
[  550.437693] hardirqs last disabled at (11676): [<ffffffffb418cc01>]
console_emit_next_record.constprop.0+0x271/0x300
[  550.437695] softirqs last  enabled at (11498): [<ffffffffb40fe739>]
__irq_exit_rcu+0xf9/0x170
[  550.437704]  amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
[  550.437912] softirqs last disabled at (11493): [<ffffffffb40fe739>]
__irq_exit_rcu+0xf9/0x170
[  550.435367] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  550.437923]  __x64_sys_ioctl+0x90/0xd0
[  550.437929]  do_syscall_64+0x3a/0x90
[  550.437932] ---[ end trace 0000000000000000 ]---
[  550.437935]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[  550.438006] ------------[ cut here ]------------
[  550.435375] CR2: 00007f2aa40330a8 CR3: 0000000119742000 CR4: 00000000003=
50ee0
[  550.438041] RIP: 0033:0x7f2b1e49065f
[  550.438062] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00
00 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28
00 00
[  550.435382] Call Trace:
[  550.438064] RSP: 002b:00000000124fe120 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  550.438067] RAX: ffffffffffffffda RBX: 00007f2acca74540 RCX: 00007f2b1e4=
9065f
[  550.438068] RDX: 00000000124fe1c0 RSI: 00000000c0286448 RDI: 00000000000=
00021
[  550.438070] RBP: 00000000124fe1c0 R08: ffff80010a600000 R09: 00000000000=
0000e
[  550.438071] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000c02=
86448
[  550.438073] R13: 0000000000000021 R14: 0000000000000000 R15: 000000007e1=
32290
[  550.438086]  </TASK>
[  550.438166] refcount_t: saturated; leaking memory.
[  550.438184] WARNING: CPU: 30 PID: 0 at lib/refcount.c:22
refcount_warn_saturate+0x51/0x110
[  550.438194] Modules linked in: uinput
[  550.438202] irq event stamp: 233045
[  550.438204] hardirqs last  enabled at (233051):
[<ffffffffb418e2c2>] vprintk_emit+0x342/0x350
[  550.435389]  <TASK>
[  550.438207] hardirqs last disabled at (233056):
[<ffffffffb418e271>] vprintk_emit+0x2f1/0x350
[  550.438404]  rfcomm snd_seq_dummy
[  550.438414] softirqs last  enabled at (231056):
[<ffffffffb40fe739>] __irq_exit_rcu+0xf9/0x170
[  550.438417] softirqs last disabled at (231049):
[<ffffffffb40fe739>] __irq_exit_rcu+0xf9/0x170
[  550.438477]  snd_hrtimer
[  550.438479] ---[ end trace 0000000000000000 ]---
[  550.435396]  drm_sched_entity_pop_job+0x10c/0x490 [gpu_sched]
[  550.438483]  netconsole nft_objref nf_conntrack_netbios_ns
nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip_set
nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc iwlmvm btusb btrtl
btbcm btintel btmtk snd_seq_midi snd_seq_midi_event bluetooth
hid_logitech_hidpp snd_usb_audio iwlwifi xpad ff_memless
snd_usbmidi_lib snd_rawmidi mc ecdh_generic intel_rapl_msr
intel_rapl_common mt76x2u mt76x2_common joydev snd_hda_codec_realtek
mt76x02_usb edac_mce_amd snd_hda_codec_generic mt76_usb
snd_hda_codec_hdmi mt76x02_lib kvm_amd snd_hda_intel snd_intel_dspcfg
snd_intel_sdw_acpi snd_hda_codec mt76 vfat kvm snd_hda_core fat
snd_seq snd_hwdep irqbypass snd_seq_device mac80211 snd_pcm eeepc_wmi
asus_wmi ledtrig_audio sparse_keymap rapl platform_profile wmi_bmof
snd_timer snd pcspkr i2c_piix4 k10temp soundcore libarc4 acpi_cpufreq
cfg80211 hid_logitech_dj
[  550.435410]  drm_sched_main+0xa7/0x4a0 [gpu_sched]
[  550.438792]  rfkill zram amdgpu drm_ttm_helper ttm video iommu_v2
gpu_sched drm_buddy crct10dif_pclmul crc32_pclmul crc32c_intel igb
ucsi_ccg drm_display_helper nvme typec_ucsi ghash_clmulni_intel ccp
typec cec sp5100_tco dca sha512_ssse3 nvme_core wmi ip6_tables
ip_tables fuse
[  550.438870] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W
L     6.1.0-rc1-13-aab9cf7b6954136f4339136a1a7fc0602a2c4d8b+ #178
[  550.438929] RSP: 0018:ffffb11a40798dc0 EFLAGS: 00010082
[  550.438943] RAX: 0000000000000026 RBX: ffff9a8223960600 RCX: 00000000000=
00000
[  550.438956] RDX: 0000000000010003 RSI: ffffffffb585efed RDI: 00000000fff=
fffff
[  550.435423]  ? prepare_to_wait_exclusive+0xd0/0xd0
[  550.438969] RBP: ffff9a822fad0578 R08: 0000000000000002 R09: 00000000249=
24924
[  550.438981] R10: 0000000000000001 R11: 0000000000000000 R12: ffff9a82239=
60678
[  550.438993] R13: 0000000000000002 R14: 00000000ffffffff R15: ffff9a822fa=
d0488
[  550.439006] FS:  0000000000000000(0000) GS:ffff9a90ea200000(0000)
knlGS:0000000000000000
[  550.439019] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  550.439032] CR2: 000000007febe698 CR3: 000000031dfee000 CR4: 00000000003=
50ee0
[  550.439045] Call Trace:
[  550.439057]  <IRQ>
[  550.435435]  ? trace_event_raw_event_drm_sched_job+0xf0/0xf0 [gpu_sched]
[  550.439069]  drm_sched_job_done.isra.0+0x1ad/0x1e0 [gpu_sched]
[  550.439093]  dma_fence_signal_timestamp_locked+0x9e/0x1c0
[  550.439113]  dma_fence_signal+0x36/0x70
[  550.435445]  kthread+0xf5/0x120
[  550.435453]  ? kthread_complete_and_exit+0x20/0x20
[  550.439130]  amdgpu_fence_process+0xd5/0x140 [amdgpu]
[  550.435464]  ret_from_fork+0x22/0x30
[  550.435536]  </TASK>
[  550.439402]  sdma_v5_2_process_trap_irq+0x103/0x150 [amdgpu]
[  550.435542] irq event stamp: 22001
[  550.435571] hardirqs last  enabled at (22023): [<ffffffffb418b64e>]
__up_console_sem+0x5e/0x70
[  550.435581] hardirqs last disabled at (22032): [<ffffffffb418b633>]
__up_console_sem+0x43/0x70
[  550.439695]  amdgpu_irq_dispatch+0x10c/0x2b0 [amdgpu]
[  550.435589] softirqs last  enabled at (22020): [<ffffffffb40fe739>]
__irq_exit_rcu+0xf9/0x170
[  550.435598] softirqs last disabled at (22011): [<ffffffffb40fe739>]
__irq_exit_rcu+0xf9/0x170
[  550.439980]  amdgpu_ih_process+0x66/0x100 [amdgpu]
[  550.435606] ---[ end trace 0000000000000000 ]---
[  550.440255]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
[  550.440525]  __handle_irq_event_percpu+0x93/0x330
[  550.440546]  handle_irq_event+0x34/0x70
[  550.440563]  handle_edge_irq+0x9f/0x240
[  550.440580]  __common_interrupt+0x71/0x150
[  550.440598]  common_interrupt+0xb4/0xd0
[  550.440612]  </IRQ>
[  550.440623]  <TASK>
[  550.440638]  asm_common_interrupt+0x22/0x40
[  550.440654] RIP: 0010:cpuidle_enter_state+0xeb/0x320
[  550.440670] Code: 1b ae 5a ff 45 84 ff 74 16 9c 58 0f 1f 40 00 f6
c4 02 0f 85 05 02 00 00 31 ff e8 20 d0 62 ff e8 3b b4 6a ff fb 0f 1f
44 00 00 <45> 85 ed 0f 88 e2 00 00 00 49 63 cd 4c 89 f2 48 8d 04 49 48
8d 04
[  550.440683] RSP: 0018:ffffb11a4025fe98 EFLAGS: 00000206
[  550.440698] RAX: 00000000001058c9 RBX: ffff9a822f5bb000 RCX: 00000000000=
00001
[  550.440711] RDX: 0000000000000000 RSI: ffffffffb590ab9f RDI: ffffffffb58=
7927e
[  550.440723] RBP: 0000000000000002 R08: 0000000000000001 R09: 00000000000=
00001
[  550.440736] R10: 0000000000000018 R11: 0000000000000191 R12: ffffffffb62=
f7820
[  550.440748] R13: 0000000000000002 R14: 0000008028a95e72 R15: 00000000000=
00000
[  550.435771] ------------[ cut here ]------------
[  550.440897]  </TASK>
[  550.440909] irq event stamp: 1071306
[  550.440921] hardirqs last  enabled at (1071305):
[<ffffffffb4bb03e5>] cpuidle_enter_state+0xe5/0x320
[  550.440936] hardirqs last disabled at (1071306):
[<ffffffffb4f09895>] common_interrupt+0x15/0xd0
[  550.440950] softirqs last  enabled at (1071294):
[<ffffffffb40fe739>] __irq_exit_rcu+0xf9/0x170
[  550.435771] ------------[ cut here ]------------
[  550.440965] softirqs last disabled at (1071289):
[<ffffffffb40fe739>] __irq_exit_rcu+0xf9/0x170
[  550.440980] ---[ end trace 0000000000000000 ]---
[  550.440998] BUG: kernel NULL pointer dereference, address: 0000000000000=
008
[  550.441004] #PF: supervisor write access in kernel mode
[  550.441011] #PF: error_code(0x0002) - not-present page
[  550.441017] PGD 309296067 P4D 309296067 PUD 31a01b067 PMD 31a019067 PTE =
0
[  550.441028] Oops: 0002 [#1] PREEMPT SMP NOPTI
[  550.441036] CPU: 30 PID: 0 Comm: swapper/30 Tainted: G        W
L     6.1.0-rc1-13-aab9cf7b6954136f4339136a1a7fc0602a2c4d8b+ #178
[  550.441043] Hardware name: System manufacturer System Product
Name/ROG STRIX X570-I GAMING, BIOS 4408 10/28/2022
[  550.441049] RIP: 0010:dma_fence_signal_timestamp_locked+0x35/0x1c0
[  550.441057] Code: 53 48 89 f3 48 83 ec 10 8b 05 e3 94 9b 01 85 c0
0f 85 ef 00 00 00 f0 48 0f ba 6d 30 00 0f 82 63 01 00 00 48 8b 45 10
49 89 e4 <4c> 89 60 08 48 89 04 24 48 8b 45 18 48 89 44 24 08 4c 89 20
48 89
[  550.441064] RSP: 0018:ffffb11a40798d70 EFLAGS: 00010002
[  550.441071] RAX: 0000000000000000 RBX: 0000008046b8fe15 RCX: 00000000000=
00001
[  550.441078] RDX: 0000000000000000 RSI: ffffffffb57ceec9 RDI: ffffffffb58=
7927e
[  550.441084] RBP: ffff9a8223960640 R08: 0000000000000002 R09: 00000000249=
24924
[  550.441090] R10: 0000000000000001 R11: 0000000000000000 R12: ffffb11a407=
98d70
[  550.441096] R13: 0000000000000002 R14: 00000000ffffffff R15: ffff9a822fa=
d0488
[  550.441102] FS:  0000000000000000(0000) GS:ffff9a90ea200000(0000)
knlGS:0000000000000000
[  550.441133]  ? recalibrate_cpu_khz+0x10/0x10
[  550.441140]  ? ktime_get+0x4d/0xb0
[  550.441149]  dma_fence_signal+0x36/0x70
[  550.441157]  drm_sched_job_done.isra.0+0x1b5/0x1e0 [gpu_sched]
[  550.441170]  dma_fence_signal_timestamp_locked+0x9e/0x1c0
[  550.441179]  dma_fence_signal+0x36/0x70
[  550.435792] refcount_t: addition on 0; use-after-free.
[  550.441187]  amdgpu_fence_process+0xd5/0x140 [amdgpu]
[  550.441442]  sdma_v5_2_process_trap_irq+0x103/0x150 [amdgpu]
[  550.441714]  amdgpu_irq_dispatch+0x10c/0x2b0 [amdgpu]
[  550.441979]  amdgpu_ih_process+0x66/0x100 [amdgpu]
[  550.442241]  amdgpu_irq_handler+0x1f/0x60 [amdgpu]
[  550.442501]  __handle_irq_event_percpu+0x93/0x330
[  550.442512]  handle_irq_event+0x34/0x70
[  550.442522]  handle_edge_irq+0x9f/0x240
[  550.442531]  __common_interrupt+0x71/0x150
[  550.442539]  common_interrupt+0xb4/0xd0
[  550.442546]  </IRQ>
[  550.442551]  <TASK>
[  550.442558]  asm_common_interrupt+0x22/0x40
[  550.442567] RIP: 0010:cpuidle_enter_state+0xeb/0x320
[  550.442575] Code: 1b ae 5a ff 45 84 ff 74 16 9c 58 0f 1f 40 00 f6
c4 02 0f 85 05 02 00 00 31 ff e8 20 d0 62 ff e8 3b b4 6a ff fb 0f 1f
44 00 00 <45> 85 ed 0f 88 e2 00 00 00 49 63 cd 4c 89 f2 48 8d 04 49 48
8d 04
[  550.442582] RSP: 0018:ffffb11a4025fe98 EFLAGS: 00000206
[  550.442589] RAX: 00000000001058c9 RBX: ffff9a822f5bb000 RCX: 00000000000=
00001
[  550.442823] RSP: 0018:ffffb11a40798d70 EFLAGS: 00010002
[  550.442830] RAX: 0000000000000000 RBX: 0000008046b8fe15 RCX: 00000000000=
00001
[  550.442835] RDX: 0000000000000000 RSI: ffffffffb57ceec9 RDI: ffffffffb58=
7927e
[  550.442841] RBP: ffff9a8223960640 R08: 0000000000000002 R09: 00000000249=
24924
[  550.442848] R10: 0000000000000001 R11: 0000000000000000 R12: ffffb11a407=
98d70
[  550.442854] R13: 0000000000000002 R14: 00000000ffffffff R15: ffff9a822fa=
d0488
[  550.442861] FS:  0000000000000000(0000) GS:ffff9a90ea200000(0000)
knlGS:0000000000000000
[  550.442867] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  550.442873] CR2: 0000000000000008 CR3: 000000031dfee000 CR4: 00000000003=
50ee0
[  550.442880] Kernel panic - not syncing: Fatal exception in interrupt
[  551.913615] Shutting down cpus with NMI
[  551.913641] Kernel Offset: 0x33000000 from 0xffffffff81000000
(relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[  551.913652] ---[ end Kernel panic - not syncing: Fatal exception in
interrupt ]---

Bisecting blames this commit:
aab9cf7b6954136f4339136a1a7fc0602a2c4d8b is the first bad commit
commit aab9cf7b6954136f4339136a1a7fc0602a2c4d8b
Author: Christian K=C3=B6nig <christian.koenig@amd.com>
Date:   Thu Sep 29 13:34:34 2022 +0200

    drm/amdgpu: use scheduler dependencies for VM updates

    Instead of putting that into the job sync object.

    Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
    Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20221014084641.1282=
80-9-christian.koenig@amd.com

 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c    | 56 +++++++++++++++++++++----=
----
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h    |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c | 10 ++++--
 3 files changed, 52 insertions(+), 16 deletions(-)

Unfortunately I couldn't check the correctness of the find, because
the kernel was not compiled when I reverted this commit, I got this
compilation error:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c: In function =E2=80=98amdgpu_cs_sync=
_rings=E2=80=99:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:1209:21: error: implicit
declaration of function =E2=80=98amdgpu_sync_push_to_job=E2=80=99
[-Werror=3Dimplicit-function-declaration]
 1209 |                 r =3D amdgpu_sync_push_to_job(&p->sync, p->jobs[i])=
;
      |                     ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [scripts/Makefile.build:250:
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.o] Error 1
make[4]: *** [scripts/Makefile.build:502: drivers/gpu/drm/amd/amdgpu] Error=
 2
make[4]: *** Waiting for unfinished jobs....

Christian, can you help me check the correctness of find?

Thanks.

--=20
Best Regards,
Mike Gavrilov.
