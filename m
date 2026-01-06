Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F8DCF9FA7
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 19:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A990210E53E;
	Tue,  6 Jan 2026 18:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bZc/9836";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FBD10E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 18:11:02 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-78fd0cd23faso13698027b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767723061; x=1768327861; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qo5XXMBMdY5LTPaPUU4z3wTG0bxCY40bhFSPbYmjMlI=;
 b=bZc/98365qE8Y8ydeCOpmGU5TySkQsu9T0sZYM5vVRJM2HkOcmVClI2Wh/RV3HxOuT
 YzzLA2BkSd3rIK3DckihPMZcbimqi8h6+FKJbhPKS3n9y8iFsW/C2jc+Y4BhU2dYhFuW
 F/eRj/3hdUpN6qAWw7zmGmUgNJAqvoCRzxtnr8MNBd9J12U4Xg70nfXDVmRViPeDBR/g
 5j6Xi9TKid0sQAmP9O5t8kemeZrM+8RkK41y1XGw15rCKPkm7A1JB5EhSnUuOmsvU9kY
 UQTWB69Prgcei0+LLBkOqkuikXi75fMaPwM16Um1JqgBc7QUgnfn5+NYf+8UoeBAMv6V
 JHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767723061; x=1768327861;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qo5XXMBMdY5LTPaPUU4z3wTG0bxCY40bhFSPbYmjMlI=;
 b=ORAtSK0z55Cc9DgbnHKu0nDF+ddxjznRRf5jAhPNlNhINvUUrWYE1mzjZY/yuJXS4r
 dspwvz+ZOU4V02B9PmibhkeUKPfWs6g7kvzcDuc1Ba1nsXQGFg3TNHlK6X6Gi9Zmnd91
 gUjemZdDdWonQkWmz1FeU6gKTGApwUxiCqxVXEarlC0CUOyWJBnsS5EpkU4yMBGD4zsd
 mjlq3QiRJMXYGzRO/KLf/Fbj2Oq24OBV5yYgBUlC4HVbrCCGlP10Gf4+4FC3754fl024
 UQJcHbJ5p6FsouXtOrFInxN/sKY4GsSOuF8Ouohg7yB16twwW2+rYjbWL+fLS2ZJ/KpD
 hbUg==
X-Gm-Message-State: AOJu0YxO7oKRg1lZYLCkF41PBcwX+M6rA7X3RZ2QNJgl5DVd9f32ZaRg
 r9kIoj/qhQBGHpxFYIatwMZHfmJ16vJuJ3+8nXWpP+gH2gk/CcAdTWSp/oYUJxMbesj41Sq2A7P
 4pBssubEiZ9IEbVc2VfIlzTulbK8FEnpax/d0Pc0=
X-Gm-Gg: AY/fxX6kGPWaY08p2Q2xAgSW5Sht28yprIeRNZw0RCbCapgPzQAxsbHwrJLwZHAav9E
 xjEW+ExkHYzN3r+zCrvIpdSHdMHYjmEsQlspgLP0yy7aBlZMp4/KmnweOkCKR+3W7/eNB/yV0+A
 ITvclcgvoyOcJCl69/0FK5tENpo4zSSRXG3kuDblBWp5R+wg/1yurc7QSMhLjW7JmnMeA6rLbwm
 L9gMyn0ZgqV0RSTnS2Wl1ztonlBxRmGMQ5GCCEXp/aFzqkXc5z27RKETAMVvjgeiuxB5T8iCQ/9
 PdbX2zDC9HEUWfcVfiXViTdW0bn1QS+VnKXSYVFq+phSToe38j/KARW5+Galis5Gnk2Ht/z/W2T
 alfs0qUiliSfjRqzFEhBbgA01jnTSwf/shT4w33nogD7LXcfi0do4VwGACpe2FcmBCaA1Ypg=
X-Google-Smtp-Source: AGHT+IEV8jTM2dx8Jw1aAZQIHnez4WExph/qUVqBwDzamxl0kDadkYHdEnIog87T8pKb7qUwnCOz1mApoK7Wxkv2jPM=
X-Received: by 2002:a05:690e:1699:b0:646:518b:a88e with SMTP id
 956f58d0204a3-6470c831b2dmr2799861d50.6.1767723059064; Tue, 06 Jan 2026
 10:10:59 -0800 (PST)
MIME-Version: 1.0
References: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
In-Reply-To: <CAFrh3J_OtTdve_ryOXZLfBV9sWDZ--HyTJZi9mSQ6gko98PJrA@mail.gmail.com>
From: Satadru Pramanik <satadru@gmail.com>
Date: Tue, 6 Jan 2026 13:10:47 -0500
X-Gm-Features: AQt7F2o4QPqhtOyO1hDehDZAFDkuaWku-gHCPHuLGCCXWYsTUgkCQWF-Xq3G8tU
Message-ID: <CAFrh3J-+8+210iG4Mj-+p2PQg-RDvwdUpU8u2Bom0oWXVSoEGg@mail.gmail.com>
Subject: Re: 6.19.0-rc4 regression from 6.19.0-rc3 in i915: [drm] PCH PWM1
 enabled
To: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000ff36570647bc18df"
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

--000000000000ff36570647bc18df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maybe worth noting that since I have this output:
lspci -nnd ::03xx
00:02.0 VGA compatible controller [0300]: Intel Corporation Crystal Well
Integrated Graphics Controller [8086:0d26] (rev 08)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107M
[GeForce GT 750M Mac Edition] [10de:0fe9] (rev a1)

I can boot with this: i915.force_probe=3D!0d26 xe.force_probe=3D0d26

But then I get this in my dmesg:

[    3.045178] ------------[ cut here ]------------
[    3.045183] Unpatched return thunk in use. This should not happen!
[    3.045184] WARNING: arch/x86/kernel/cpu/bugs.c:3737 at
__warn_thunk+0x10/0x20, CPU#1: (udev-worker)/353
[    3.045192] Modules linked in: nouveau(+) wl(POE+) snd_hda_codec_generic
snd_hda_codec_hdmi kvm(+) drm_ttm_helper gpu_sched drm_gpuvm drm_exec btusb
mxm_wmi snd_hda_intel drm_buddy i2c_algo_bit btrtl snd_intel_dspcfg ttm
btintel iTCO_wdt snd_seq_midi snd_intel_sdw_acpi ghash_clmulni_intel joydev
uas rapl snd_seq_midi_event hid_generic drm_display_helper snd_hda_codec
facetimehd(OE+) btbcm nvme videobuf2_dma_sg btmtk intel_pmc_bxt
spi_intel_platform snd_hwdep videobuf2_memops spi_intel iTCO_vendor_support
applesmc cec bluetooth sbs(+) snd_rawmidi usb_storage intel_cstate
nvme_core bcm5974 usbhid efi_pstore videobuf2_v4l2 i2c_i801 cfg80211 hid
snd_hda_core videodev rc_core lpc_ich apple_mfi_fastcharge i2c_mux
drm_client_lib i2c_smbus videobuf2_common snd_seq snd_pcm drm_kms_helper mc
thunderbolt sbshc snd_seq_device snd_timer acpi_als drm snd
industrialio_triggered_buffer apple_gmux mei_me kfifo_buf industrialio
video mei soundcore wmi mac_hid dm_mirror dm_region_hash dm_log tcp_bbr
sch_fq_codel pkcs8_key_parser msr
[    3.045271]  parport_pc ppdev lp parport nfnetlink dmi_sysfs autofs4
aesni_intel
[    3.045281] CPU: 1 UID: 0 PID: 353 Comm: (udev-worker) Tainted: P
    OE       6.19.0-rc4 #1 PREEMPT(lazy)
[    3.045285] Tainted: [P]=3DPROPRIETARY_MODULE, [O]=3DOOT_MODULE,
[E]=3DUNSIGNED_MODULE
[    3.045286] Hardware name: Apple Inc.
MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
[    3.045288] RIP: 0010:__warn_thunk+0x10/0x20
[    3.045293] Code: 50 00 5d 48 98 c3 cc cc cc cc 90 90 90 90 90 90 90 90
90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 48 8d 3d 10 e1 45 02
<67> 48 0f b9 3a 5d c3 cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90
[    3.045295] RSP: 0018:ffffb9dc8061fa18 EFLAGS: 00010202
[    3.045298] RAX: 0000000000000010 RBX: 0000000000000000 RCX:
0000000000000000
[    3.045299] RDX: 0000000000000000 RSI: ffffffffc190fc0f RDI:
ffffffff9114d790
[    3.045301] RBP: ffffb9dc8061fa18 R08: 0000000000000020 R09:
0000000000000000
[    3.045303] R10: ffffb9dc8061fb38 R11: ffff9303437ea2e0 R12:
ffffffffc190fc0f
[    3.045304] R13: 0000000000000000 R14: ffffffffc0b9b010 R15:
0000000000000000
[    3.045306] FS:  00007f8662192980(0000) GS:ffff93071d83d000(0000)
knlGS:0000000000000000
[    3.045308] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.045310] CR2: 00007f8661386000 CR3: 0000000117fd7001 CR4:
00000000001706f0
[    3.045312] Call Trace:
[    3.045321]  <TASK>
[    3.045323]  warn_thunk_thunk+0x16/0x30
[    3.045329]  getvar+0x20/0x70 [wl]
[    3.045382]  wl_module_init+0x17/0xa0 [wl]
[    3.045418]  do_one_initcall+0x59/0x310
[    3.045424]  do_init_module+0x6a/0x260
[    3.045427]  ? module_decompress_cleanup+0x4f/0x70
[    3.045431]  load_module+0x1de9/0x2060
[    3.045437]  init_module_from_file+0xe9/0x170
[    3.045439]  ? init_module_from_file+0xe9/0x170
[    3.045444]  idempotent_init_module+0x10e/0x2f0
[    3.045448]  __x64_sys_finit_module+0x73/0xf0
[    3.045450]  ? __secure_computing+0x7c/0xd0
[    3.045455]  x64_sys_call+0x15b8/0x1da0
[    3.045458]  do_syscall_64+0x6d/0x650
[    3.045462]  ? switch_fpu_return+0x5c/0xe0
[    3.045466]  ? do_syscall_64+0x29b/0x650
[    3.045469]  ? irqentry_exit+0x3a/0x510
[    3.045473]  ? exc_page_fault+0x90/0x1a0
[    3.045477]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    3.045480] RIP: 0033:0x7f8662cd68cd
[    3.045483] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05
<48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 13 f5 0f 00 f7 d8 64 89 01 48
[    3.045485] RSP: 002b:00007ffd8fc05cd8 EFLAGS: 00000246 ORIG_RAX:
0000000000000139
[    3.045488] RAX: ffffffffffffffda RBX: 00005591fd6d3990 RCX:
00007f8662cd68cd
[    3.045489] RDX: 0000000000000004 RSI: 00007f866146c336 RDI:
000000000000001d
[    3.045491] RBP: 00007ffd8fc05d70 R08: 0000000000000000 R09:
00005591fd6d6d00
[    3.045492] R10: 0000000000000000 R11: 0000000000000246 R12:
00007f866146c336
[    3.045494] R13: 0000000000020000 R14: 00005591fd6d59c0 R15:
00005591fd6d6cc0
[    3.045497]  </TASK>
[    3.045499] ---[ end trace 0000000000000000 ]---


On Tue, Jan 6, 2026 at 12:07=E2=80=AFPM Satadru Pramanik <satadru@gmail.com=
> wrote:

> Hello all, I'm newly getting this in my dmesg on my MacBookPro11,3 after
> updating from 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I'm using the
> nouveau driver for my display, but this warning appears to be from i915,
> which my laptop also may be using for some portion of display enablement.
>
> [  200.760128] ------------[ cut here ]------------
> [  200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled
> [  200.760134] WARNING:
> drivers/gpu/drm/i915/display/intel_display_power.c:1234 at
> hsw_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378
> [  200.760351] Modules linked in: snd_seq_dummy snd_hrtimer
> scsi_transport_iscsi qrtr ccm algif_aead des3_ede_x86_64 des_generic libd=
es
> md4 rfcomm cmac algif_hash algif_skcipher af_alg bnep blocklayoutdriver
> nfsv4 nfs lockd grace nfs_localio netfs sunrpc binfmt_misc nls_iso8859_1
> cmdlinepart spi_nor mtd snd_hda_codec_intelhdmi intel_rapl_msr zfs(POE)
> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp nouveau input_led=
s
> i915 spl(OE) snd_hda_codec_cs420x snd_hda_codec_generic
> snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple drm_ttm_helper coretemp
> facetimehd(OE) snd_hda_intel gpu_sched btusb videobuf2_dma_sg
> snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw_acpi
> videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event
> drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_bit
> btmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE) joyd=
ev
> hid_generic videobuf2_common kvm spi_intel snd_hda_core iTCO_vendor_suppo=
rt
> applesmc ghash_clmulni_intel nvme ttm rapl bluetooth
> [  200.760418]  snd_seq intel_cstate uas usbhid drm_display_helper snd_pc=
m
> nvme_core cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbolt
> apple_mfi_fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux
> usb_storage i2c_smbus lpc_ich sbshc snd_timer apple_gmux snd_seq_device
> acpi_als industrialio_triggered_buffer mei_me kfifo_buf drm snd
> industrialio mei soundcore video wmi mac_hid dm_mirror dm_region_hash
> dm_log tcp_bbr sch_fq_codel pkcs8_key_parser msr parport_pc ppdev lp
> parport nfnetlink dmi_sysfs autofs4 aesni_intel
> [  200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Tainted: P
> U  W  OE       6.19.0-rc4 #1 PREEMPT(lazy)
> [  200.760466] Tainted: [P]=3DPROPRIETARY_MODULE, [U]=3DUSER, [W]=3DWARN,
> [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
> [  200.760468] Hardware name: Apple Inc.
> MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60.3.0.0 10/27/2021
> [  200.760470] Workqueue: pm pm_runtime_work
> [  200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unknown_linux_gnu
> (enabled+all), task: runnable_at=3D+0ms
> [  200.760480] RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]
> [  200.760653] Code: 32 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67 50 4d 8=
5
> e4 75 03 4c 8b 27 e8 e3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c6
> <67> 48 0f b9 3a e9 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f 84
> [  200.760655] RSP: 0018:ffffaf668250fc68 EFLAGS: 00010282
> [  200.760658] RAX: ffffffffc1d688a4 RBX: ffff920740f62000 RCX:
> ffffffffc180f0d0
> [  200.760660] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI:
> ffffffffc1c038d0
> [  200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09:
> 0000000000000064
> [  200.760663] R10: 0000000000000000 R11: 0000000000000001 R12:
> ffff920742008030
> [  200.760664] R13: ffff920740ed4000 R14: 0000000000000000 R15:
> ffff920740ed4000
> [  200.760666] FS:  0000000000000000(0000) GS:ffff920b06bfd000(0000)
> knlGS:0000000000000000
> [  200.760668] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4:
> 00000000001726f0
> [  200.760671] Call Trace:
> [  200.760673]  <TASK>
> [  200.760678]  intel_display_power_suspend+0x61/0x80 [i915]
> [  200.760852]  intel_runtime_suspend+0xd7/0x230 [i915]
> [  200.760963]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [  200.760970]  pci_pm_runtime_suspend+0x6a/0x1a0
> [  200.760974]  __rpm_callback+0x4b/0x1f0
> [  200.760979]  ? __pfx_pci_pm_runtime_suspend+0x10/0x10
> [  200.760983]  rpm_callback+0x6f/0x80
> [  200.760986]  rpm_suspend+0xe1/0x5e0
> [  200.760990]  ? __schedule+0x44b/0x1650
> [  200.760996]  pm_runtime_work+0x91/0xa0
> [  200.761000]  process_one_work+0x188/0x360
> [  200.761005]  worker_thread+0x327/0x460
> [  200.761007]  ? __pfx_worker_thread+0x10/0x10
> [  200.761010]  kthread+0x10b/0x220
> [  200.761015]  ? __pfx_kthread+0x10/0x10
> [  200.761018]  ret_from_fork+0x16e/0x1e0
> [  200.761023]  ? __pfx_kthread+0x10/0x10
> [  200.761027]  ret_from_fork_asm+0x1a/0x30
> [  200.761034]  </TASK>
> [  200.761035] ---[ end trace 0000000000000000 ]---
>
>
> inxi -IG gives me this:
> Graphics:
>   Device-1: Intel Crystal Well Integrated Graphics driver: i915 v: kernel
>   Device-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau
>     v: kernel
>   Display: wayland server: X.Org v: 24.1.8 with: Xwayland v: 24.1.8
>     compositor: gnome-shell v: 49.0 driver: X: loaded: modesetting
>     unloaded: fbdev,vesa dri: nouveau gpu: nouveau resolution:
> 3840x2400~60Hz
>   API: EGL v: 1.5 drivers: crocus,nouveau,swrast
>     platforms: gbm,wayland,x11,surfaceless,device
>   API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa
>     v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 renderer: NVE7
>   API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe
>     surfaces: xcb,xlib,wayland
>   Info: Tools: api: eglinfo, glxinfo, vulkaninfo x11: xdriinfo, xdpyinfo,
>     xprop, xrandr
> Info:
>   Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB (31.2%)
>   Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39
>
> Please let me know if I'm sending this to the wrong list?
>
> Regards,
>
> Satadru Pramanik
>

--000000000000ff36570647bc18df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe worth noting that since I have this output:<br>lspci=
 -nnd ::03xx<br>00:02.0 VGA compatible controller [0300]: Intel Corporation=
 Crystal Well Integrated Graphics Controller [8086:0d26] (rev 08)<br>01:00.=
0 VGA compatible controller [0300]: NVIDIA Corporation GK107M [GeForce GT 7=
50M Mac Edition] [10de:0fe9] (rev a1)<br><br>I can boot with this: i915.for=
ce_probe=3D!0d26 xe.force_probe=3D0d26<br><br>But then I get this in my dme=
sg:<br><br>[ =C2=A0 =C2=A03.045178] ------------[ cut here ]------------<br=
>[ =C2=A0 =C2=A03.045183] Unpatched return thunk in use. This should not ha=
ppen!<br>[ =C2=A0 =C2=A03.045184] WARNING: arch/x86/kernel/cpu/bugs.c:3737 =
at __warn_thunk+0x10/0x20, CPU#1: (udev-worker)/353<br>[ =C2=A0 =C2=A03.045=
192] Modules linked in: nouveau(+) wl(POE+) snd_hda_codec_generic snd_hda_c=
odec_hdmi kvm(+) drm_ttm_helper gpu_sched drm_gpuvm drm_exec btusb mxm_wmi =
snd_hda_intel drm_buddy i2c_algo_bit btrtl snd_intel_dspcfg ttm btintel iTC=
O_wdt snd_seq_midi snd_intel_sdw_acpi ghash_clmulni_intel joydev uas rapl s=
nd_seq_midi_event hid_generic drm_display_helper snd_hda_codec facetimehd(O=
E+) btbcm nvme videobuf2_dma_sg btmtk intel_pmc_bxt spi_intel_platform snd_=
hwdep videobuf2_memops spi_intel iTCO_vendor_support applesmc cec bluetooth=
 sbs(+) snd_rawmidi usb_storage intel_cstate nvme_core bcm5974 usbhid efi_p=
store videobuf2_v4l2 i2c_i801 cfg80211 hid snd_hda_core videodev rc_core lp=
c_ich apple_mfi_fastcharge i2c_mux drm_client_lib i2c_smbus videobuf2_commo=
n snd_seq snd_pcm drm_kms_helper mc thunderbolt sbshc snd_seq_device snd_ti=
mer acpi_als drm snd industrialio_triggered_buffer apple_gmux mei_me kfifo_=
buf industrialio video mei soundcore wmi mac_hid dm_mirror dm_region_hash d=
m_log tcp_bbr sch_fq_codel pkcs8_key_parser msr<br>[ =C2=A0 =C2=A03.045271]=
 =C2=A0parport_pc ppdev lp parport nfnetlink dmi_sysfs autofs4 aesni_intel<=
br>[ =C2=A0 =C2=A03.045281] CPU: 1 UID: 0 PID: 353 Comm: (udev-worker) Tain=
ted: P =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OE =C2=A0 =C2=A0 =C2=A0 6.19.0-rc=
4 #1 PREEMPT(lazy) <br>[ =C2=A0 =C2=A03.045285] Tainted: [P]=3DPROPRIETARY_=
MODULE, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE<br>[ =C2=A0 =C2=A03.045286]=
 Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE1663, BIOS 432.60=
.3.0.0 10/27/2021<br>[ =C2=A0 =C2=A03.045288] RIP: 0010:__warn_thunk+0x10/0=
x20<br>[ =C2=A0 =C2=A03.045293] Code: 50 00 5d 48 98 c3 cc cc cc cc 90 90 9=
0 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 55 48 89 e5 48 8d 3=
d 10 e1 45 02 &lt;67&gt; 48 0f b9 3a 5d c3 cc cc cc cc 0f 1f 44 00 00 90 90=
 90 90 90 90<br>[ =C2=A0 =C2=A03.045295] RSP: 0018:ffffb9dc8061fa18 EFLAGS:=
 00010202<br>[ =C2=A0 =C2=A03.045298] RAX: 0000000000000010 RBX: 0000000000=
000000 RCX: 0000000000000000<br>[ =C2=A0 =C2=A03.045299] RDX: 0000000000000=
000 RSI: ffffffffc190fc0f RDI: ffffffff9114d790<br>[ =C2=A0 =C2=A03.045301]=
 RBP: ffffb9dc8061fa18 R08: 0000000000000020 R09: 0000000000000000<br>[ =C2=
=A0 =C2=A03.045303] R10: ffffb9dc8061fb38 R11: ffff9303437ea2e0 R12: ffffff=
ffc190fc0f<br>[ =C2=A0 =C2=A03.045304] R13: 0000000000000000 R14: ffffffffc=
0b9b010 R15: 0000000000000000<br>[ =C2=A0 =C2=A03.045306] FS: =C2=A000007f8=
662192980(0000) GS:ffff93071d83d000(0000) knlGS:0000000000000000<br>[ =C2=
=A0 =C2=A03.045308] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 0000000080050033<=
br>[ =C2=A0 =C2=A03.045310] CR2: 00007f8661386000 CR3: 0000000117fd7001 CR4=
: 00000000001706f0<br>[ =C2=A0 =C2=A03.045312] Call Trace:<br>[ =C2=A0 =C2=
=A03.045321] =C2=A0&lt;TASK&gt;<br>[ =C2=A0 =C2=A03.045323] =C2=A0warn_thun=
k_thunk+0x16/0x30<br>[ =C2=A0 =C2=A03.045329] =C2=A0getvar+0x20/0x70 [wl]<b=
r>[ =C2=A0 =C2=A03.045382] =C2=A0wl_module_init+0x17/0xa0 [wl]<br>[ =C2=A0 =
=C2=A03.045418] =C2=A0do_one_initcall+0x59/0x310<br>[ =C2=A0 =C2=A03.045424=
] =C2=A0do_init_module+0x6a/0x260<br>[ =C2=A0 =C2=A03.045427] =C2=A0? modul=
e_decompress_cleanup+0x4f/0x70<br>[ =C2=A0 =C2=A03.045431] =C2=A0load_modul=
e+0x1de9/0x2060<br>[ =C2=A0 =C2=A03.045437] =C2=A0init_module_from_file+0xe=
9/0x170<br>[ =C2=A0 =C2=A03.045439] =C2=A0? init_module_from_file+0xe9/0x17=
0<br>[ =C2=A0 =C2=A03.045444] =C2=A0idempotent_init_module+0x10e/0x2f0<br>[=
 =C2=A0 =C2=A03.045448] =C2=A0__x64_sys_finit_module+0x73/0xf0<br>[ =C2=A0 =
=C2=A03.045450] =C2=A0? __secure_computing+0x7c/0xd0<br>[ =C2=A0 =C2=A03.04=
5455] =C2=A0x64_sys_call+0x15b8/0x1da0<br>[ =C2=A0 =C2=A03.045458] =C2=A0do=
_syscall_64+0x6d/0x650<br>[ =C2=A0 =C2=A03.045462] =C2=A0? switch_fpu_retur=
n+0x5c/0xe0<br>[ =C2=A0 =C2=A03.045466] =C2=A0? do_syscall_64+0x29b/0x650<b=
r>[ =C2=A0 =C2=A03.045469] =C2=A0? irqentry_exit+0x3a/0x510<br>[ =C2=A0 =C2=
=A03.045473] =C2=A0? exc_page_fault+0x90/0x1a0<br>[ =C2=A0 =C2=A03.045477] =
=C2=A0entry_SYSCALL_64_after_hwframe+0x76/0x7e<br>[ =C2=A0 =C2=A03.045480] =
RIP: 0033:0x7f8662cd68cd<br>[ =C2=A0 =C2=A03.045483] Code: ff c3 66 2e 0f 1=
f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 8=
9 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48&gt; 3d 01 f0 ff ff 73 01 c3 48 8b=
 0d 13 f5 0f 00 f7 d8 64 89 01 48<br>[ =C2=A0 =C2=A03.045485] RSP: 002b:000=
07ffd8fc05cd8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139<br>[ =C2=A0 =C2=
=A03.045488] RAX: ffffffffffffffda RBX: 00005591fd6d3990 RCX: 00007f8662cd6=
8cd<br>[ =C2=A0 =C2=A03.045489] RDX: 0000000000000004 RSI: 00007f866146c336=
 RDI: 000000000000001d<br>[ =C2=A0 =C2=A03.045491] RBP: 00007ffd8fc05d70 R0=
8: 0000000000000000 R09: 00005591fd6d6d00<br>[ =C2=A0 =C2=A03.045492] R10: =
0000000000000000 R11: 0000000000000246 R12: 00007f866146c336<br>[ =C2=A0 =
=C2=A03.045494] R13: 0000000000020000 R14: 00005591fd6d59c0 R15: 00005591fd=
6d6cc0<br>[ =C2=A0 =C2=A03.045497] =C2=A0&lt;/TASK&gt;<br>[ =C2=A0 =C2=A03.=
045499] ---[ end trace 0000000000000000 ]---<br><br></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Jan 6, 2026 at 12:07=E2=80=AFPM Satadru Pramanik &lt;<a href=3D"mail=
to:satadru@gmail.com">satadru@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hello all, I&#=
39;m newly getting this in my dmesg on my MacBookPro11,3 after updating fro=
m 6.19.0-rc3 to 6.19.0-rc4 on Ubuntu 25.10. I&#39;m using the nouveau drive=
r for my display, but this warning appears to be from i915, which my laptop=
 also may be using for some portion of display enablement.</div><div><br></=
div><div>[ =C2=A0200.760128] ------------[ cut here ]------------<br>[ =C2=
=A0200.760132] i915 0000:00:02.0: [drm] PCH PWM1 enabled<br>[ =C2=A0200.760=
134] WARNING: drivers/gpu/drm/i915/display/intel_display_power.c:1234 at hs=
w_enable_pc8+0x8a4/0xb10 [i915], CPU#0: kworker/u32:6/1378<br>[ =C2=A0200.7=
60351] Modules linked in: snd_seq_dummy snd_hrtimer scsi_transport_iscsi qr=
tr ccm algif_aead des3_ede_x86_64 des_generic libdes md4 rfcomm cmac algif_=
hash algif_skcipher af_alg bnep blocklayoutdriver nfsv4 nfs lockd grace nfs=
_localio netfs sunrpc binfmt_misc nls_iso8859_1 cmdlinepart spi_nor mtd snd=
_hda_codec_intelhdmi intel_rapl_msr zfs(POE) intel_rapl_common x86_pkg_temp=
_thermal intel_powerclamp nouveau input_leds i915 spl(OE) snd_hda_codec_cs4=
20x snd_hda_codec_generic snd_hda_codec_nvhdmi snd_hda_codec_hdmi hid_apple=
 drm_ttm_helper coretemp facetimehd(OE) snd_hda_intel gpu_sched btusb video=
buf2_dma_sg snd_intel_dspcfg drm_gpuvm videobuf2_memops btrtl snd_intel_sdw=
_acpi videobuf2_v4l2 snd_seq_midi snd_hda_codec btintel snd_seq_midi_event =
drm_exec drm_buddy iTCO_wdt videodev kvm_intel btbcm mxm_wmi i2c_algo_bit b=
tmtk snd_hwdep intel_pmc_bxt snd_rawmidi spi_intel_platform wl(POE) joydev =
hid_generic videobuf2_common kvm spi_intel snd_hda_core iTCO_vendor_support=
 applesmc ghash_clmulni_intel nvme ttm rapl bluetooth<br>[ =C2=A0200.760418=
] =C2=A0snd_seq intel_cstate uas usbhid drm_display_helper snd_pcm nvme_cor=
e cfg80211 cec efi_pstore rc_core hid mc bcm5974 sbs thunderbolt apple_mfi_=
fastcharge drm_client_lib i2c_i801 drm_kms_helper i2c_mux usb_storage i2c_s=
mbus lpc_ich sbshc snd_timer apple_gmux snd_seq_device acpi_als industriali=
o_triggered_buffer mei_me kfifo_buf drm snd industrialio mei soundcore vide=
o wmi mac_hid dm_mirror dm_region_hash dm_log tcp_bbr sch_fq_codel pkcs8_ke=
y_parser msr parport_pc ppdev lp parport nfnetlink dmi_sysfs autofs4 aesni_=
intel<br>[ =C2=A0200.760461] CPU: 0 UID: 0 PID: 1378 Comm: kworker/u32:6 Ta=
inted: P =C2=A0 =C2=A0 U =C2=A0W =C2=A0OE =C2=A0 =C2=A0 =C2=A0 6.19.0-rc4 #=
1 PREEMPT(lazy) <br>[ =C2=A0200.760466] Tainted: [P]=3DPROPRIETARY_MODULE, =
[U]=3DUSER, [W]=3DWARN, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE<br>[ =C2=A0=
200.760468] Hardware name: Apple Inc. MacBookPro11,3/Mac-2BD1B31983FE1663, =
BIOS 432.60.3.0.0 10/27/2021<br>[ =C2=A0200.760470] Workqueue: pm pm_runtim=
e_work<br>[ =C2=A0200.760478] Sched_ext: lavd_1.0.20_g3c8138b8_x86_64_unkno=
wn_linux_gnu (enabled+all), task: runnable_at=3D+0ms<br>[ =C2=A0200.760480]=
 RIP: 0010:hsw_enable_pc8+0x8aa/0xb10 [i915]<br>[ =C2=A0200.760653] Code: 3=
2 12 00 48 85 ff 74 04 48 8b 7f 08 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 e=
3 73 a7 e4 48 8d 3d dc 03 30 00 4c 89 e2 48 89 c6 &lt;67&gt; 48 0f b9 3a e9=
 df f9 ff ff 48 8b 3b 80 bb 4b 14 00 00 00 0f 84<br>[ =C2=A0200.760655] RSP=
: 0018:ffffaf668250fc68 EFLAGS: 00010282<br>[ =C2=A0200.760658] RAX: ffffff=
ffc1d688a4 RBX: ffff920740f62000 RCX: ffffffffc180f0d0<br>[ =C2=A0200.76066=
0] RDX: ffff920742008030 RSI: ffffffffc1d688a4 RDI: ffffffffc1c038d0<br>[ =
=C2=A0200.760661] RBP: ffffaf668250fc90 R08: 0000000000000002 R09: 00000000=
00000064<br>[ =C2=A0200.760663] R10: 0000000000000000 R11: 0000000000000001=
 R12: ffff920742008030<br>[ =C2=A0200.760664] R13: ffff920740ed4000 R14: 00=
00000000000000 R15: ffff920740ed4000<br>[ =C2=A0200.760666] FS: =C2=A000000=
00000000000(0000) GS:ffff920b06bfd000(0000) knlGS:0000000000000000<br>[ =C2=
=A0200.760668] CS: =C2=A00010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>[ =
=C2=A0200.760669] CR2: 00007f72423b701c CR3: 00000001777eb004 CR4: 00000000=
001726f0<br>[ =C2=A0200.760671] Call Trace:<br>[ =C2=A0200.760673] =C2=A0&l=
t;TASK&gt;<br>[ =C2=A0200.760678] =C2=A0intel_display_power_suspend+0x61/0x=
80 [i915]<br>[ =C2=A0200.760852] =C2=A0intel_runtime_suspend+0xd7/0x230 [i9=
15]<br>[ =C2=A0200.760963] =C2=A0? __pfx_pci_pm_runtime_suspend+0x10/0x10<b=
r>[ =C2=A0200.760970] =C2=A0pci_pm_runtime_suspend+0x6a/0x1a0<br>[ =C2=A020=
0.760974] =C2=A0__rpm_callback+0x4b/0x1f0<br>[ =C2=A0200.760979] =C2=A0? __=
pfx_pci_pm_runtime_suspend+0x10/0x10<br>[ =C2=A0200.760983] =C2=A0rpm_callb=
ack+0x6f/0x80<br>[ =C2=A0200.760986] =C2=A0rpm_suspend+0xe1/0x5e0<br>[ =C2=
=A0200.760990] =C2=A0? __schedule+0x44b/0x1650<br>[ =C2=A0200.760996] =C2=
=A0pm_runtime_work+0x91/0xa0<br>[ =C2=A0200.761000] =C2=A0process_one_work+=
0x188/0x360<br>[ =C2=A0200.761005] =C2=A0worker_thread+0x327/0x460<br>[ =C2=
=A0200.761007] =C2=A0? __pfx_worker_thread+0x10/0x10<br>[ =C2=A0200.761010]=
 =C2=A0kthread+0x10b/0x220<br>[ =C2=A0200.761015] =C2=A0? __pfx_kthread+0x1=
0/0x10<br>[ =C2=A0200.761018] =C2=A0ret_from_fork+0x16e/0x1e0<br>[ =C2=A020=
0.761023] =C2=A0? __pfx_kthread+0x10/0x10<br>[ =C2=A0200.761027] =C2=A0ret_=
from_fork_asm+0x1a/0x30<br>[ =C2=A0200.761034] =C2=A0&lt;/TASK&gt;<br>[ =C2=
=A0200.761035] ---[ end trace 0000000000000000 ]---</div><div><br></div><di=
v><br></div><div>inxi -IG gives me this:<br>Graphics:<br>=C2=A0 Device-1: I=
ntel Crystal Well Integrated Graphics driver: i915 v: kernel<br>=C2=A0 Devi=
ce-2: NVIDIA GK107M [GeForce GT 750M Mac Edition] driver: nouveau<br>=C2=A0=
 =C2=A0 v: kernel<br>=C2=A0 Display: wayland server: X.Org v: 24.1.8 with: =
Xwayland v: 24.1.8<br>=C2=A0 =C2=A0 compositor: gnome-shell v: 49.0 driver:=
 X: loaded: modesetting<br>=C2=A0 =C2=A0 unloaded: fbdev,vesa dri: nouveau =
gpu: nouveau resolution: 3840x2400~60Hz<br>=C2=A0 API: EGL v: 1.5 drivers: =
crocus,nouveau,swrast<br>=C2=A0 =C2=A0 platforms: gbm,wayland,x11,surfacele=
ss,device<br>=C2=A0 API: OpenGL v: 4.6 compat-v: 4.3 vendor: mesa<br>=C2=A0=
 =C2=A0 v: 25.3.2+git2512181741.a943c55aea0~q~mesarc2 renderer: NVE7<br>=C2=
=A0 API: Vulkan v: 1.4.321 drivers: nvk,intel,llvmpipe<br>=C2=A0 =C2=A0 sur=
faces: xcb,xlib,wayland<br>=C2=A0 Info: Tools: api: eglinfo, glxinfo, vulka=
ninfo x11: xdriinfo, xdpyinfo,<br>=C2=A0 =C2=A0 xprop, xrandr<br>Info:<br>=
=C2=A0 Memory: total: 16 GiB available: 15.53 GiB used: 4.85 GiB (31.2%)<br=
>=C2=A0 Processes: 468 Uptime: 17m Shell: Bash inxi: 3.3.39</div><div><br><=
/div><div>Please let me know if I&#39;m sending this to the wrong list?</di=
v><div><br></div><div>Regards,</div><div><br></div><div>Satadru Pramanik</d=
iv></div>
</blockquote></div>

--000000000000ff36570647bc18df--
