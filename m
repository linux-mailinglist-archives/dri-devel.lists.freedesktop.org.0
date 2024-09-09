Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9A59710EF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 10:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF5510E319;
	Mon,  9 Sep 2024 08:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="jkMqUL2p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6519D10E319
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 08:02:34 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D4C8240E0284; 
 Mon,  9 Sep 2024 08:02:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BubQY1UG0zYB; Mon,  9 Sep 2024 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1725868944; bh=z3avvgf0RPSwKTwCWWF/4sM2ZNrDEy7cyjOWOIK1NG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jkMqUL2pn4sM+04ZqI3ZX+K3H4IbKgDImk8IaBVMxdfs1ph0JbWJjmMf+yJD+yVkY
 l7D5eR9HZ7shm5PvrcEYD6B4IAOytj0Pj0P185GbFKZ2hZTCu0+bQfrO23Y6rbtVKl
 u08GNg4Svn5rvW+aYu0YaCpfAdyouCjrhswZVdVXfTRrHvdczKZFxnNuvGXssW0mDs
 5g9yncujn+Jc0lMStaSszMnJhost3vk8JTDz3sLgh2JFJMOfoGv4EtsIk5U6LinwoN
 LhuOKXQ/dswn2JJDj74FSRMpn0hJiEJqYjiZ/0S02GvADaMVFWtWgnV7jVxWpvAsyD
 3+2POqtkrNrZbFD8URiG4rmQup37zReSD+X76JagfDh9Xj7UayKPK24rHqPK8mERvB
 54bA16wXWuuHiF0KFgbco8sH1eR4Olrizzs7fM1rCKdI28U57NdMfCCEy9Lorwdh7Y
 P1UHdZEE0WcAVK5NkPpyQQvbzWgjiDuyqWPnbsfl2BVOrtZPtfAaNLY9DzOwbj3R1n
 0R7BKj1k+HPQoePR/XQk7iwjHV0wK2pjKz+VZQxnvbMuVWQDEKXt2A01x/lZlL1YL7
 QPMiqH0wFcw2t7bT0/Pb2dw6LIB0zDXl/ntNDGkKl1dks217ueT6KarHPxI/ROGK6i
 +1XN6NhXhT7RLo3NxaFQtmgM=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9D80F40E0198;
 Mon,  9 Sep 2024 08:02:07 +0000 (UTC)
Date: Mon, 9 Sep 2024 10:02:00 +0200
From: Borislav Petkov <bp@alien8.de>
To: Hugues Bruant <hugues.bruant@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Tony Luck <tony.luck@intel.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Brian Norris <briannorris@chromium.org>,
 Julius Werner <jwerner@chromium.org>, chrome-platform@lists.linux.dev,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [REGRESSION] soft lockup on boot starting with kernel 6.10 /
 commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5
Message-ID: <20240909080200.GAZt6reI9c98c9S_Xc@fat_crate.local>
References: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CALvjV29jozswRtmYxDur2TuEQ=1JSDrM+uWVHmghW3hG5Y9F+w@mail.gmail.com>
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

On Sun, Sep 08, 2024 at 11:53:56PM -0700, Hugues Bruant wrote:
> Hi,
>=20
> I have discovered a 100% reliable soft lockup on boot on my laptop:
> Purism Librem 14, Intel Core i7-10710U, 48Gb RAM, Samsung Evo Plus 970
> SSD, CoreBoot BIOS, grub bootloader, Arch Linux.
>=20
> The last working release is kernel 6.9.10, every release from 6.10
> onwards reliably exhibit the issue, which, based on journalctl logs,
> seems to be triggered somewhere in systemd-udev:
> https://gitlab.archlinux.org/-/project/42594/uploads/04583baf22189a0a8bb2=
f8773096e013/lockup.log
>=20
> Bisect points to commit 5186ba33234c9a90833f7c93ce7de80e25fac6f5

That's a merge commit. Meaning, the bisection likely went into the wrong
direction.

Looking at your log, the first warn is in framebuffer_coreboot. Some mess in
the sysfs platform devices registration.

Adding the relevant people for that:

Aug 20 20:29:36 luna kernel: sysfs: cannot create duplicate filename '/bus/=
platform/devices/simple-framebuffer.0'
Aug 20 20:29:36 luna kernel: CPU: 5 PID: 571 Comm: (udev-worker) Tainted: G=
           OE      6.10.6-arch1-1 #1 703d152c24f1971e36f16e505405e456fc9e23=
f8
Aug 20 20:29:36 luna kernel: Hardware name: Purism Librem 14/Librem 14, BIO=
S 4.14-Purism-1 06/18/2021
Aug 20 20:29:36 luna kernel: Call Trace:
Aug 20 20:29:36 luna kernel:  <TASK>
Aug 20 20:29:36 luna kernel:  dump_stack_lvl+0x5d/0x80
Aug 20 20:29:36 luna kernel:  sysfs_warn_dup.cold+0x17/0x23
Aug 20 20:29:36 luna kernel:  sysfs_do_create_link_sd+0xcf/0xe0
Aug 20 20:29:36 luna kernel:  bus_add_device+0x6b/0x130
Aug 20 20:29:36 luna kernel:  device_add+0x3b3/0x870
Aug 20 20:29:36 luna kernel:  platform_device_add+0xed/0x250
Aug 20 20:29:36 luna kernel:  platform_device_register_full+0xbb/0x140
Aug 20 20:29:36 luna kernel:  platform_device_register_resndata.constprop.0=
+0x54/0x80 [framebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
Aug 20 20:29:36 luna kernel:  framebuffer_probe+0x165/0x1b0 [framebuffer_co=
reboot a587d2fc243ebaa0205c3badd33442a004d284e0]
Aug 20 20:29:36 luna kernel:  really_probe+0xdb/0x340
Aug 20 20:29:36 luna kernel:  ? pm_runtime_barrier+0x54/0x90
Aug 20 20:29:36 luna kernel:  ? __pfx___driver_attach+0x10/0x10
Aug 20 20:29:36 luna kernel:  __driver_probe_device+0x78/0x110
Aug 20 20:29:36 luna kernel:  driver_probe_device+0x1f/0xa0
Aug 20 20:29:36 luna kernel:  __driver_attach+0xba/0x1c0
Aug 20 20:29:36 luna kernel:  bus_for_each_dev+0x8c/0xe0
Aug 20 20:29:36 luna kernel:  bus_add_driver+0x112/0x1f0
Aug 20 20:29:36 luna kernel:  driver_register+0x72/0xd0
Aug 20 20:29:36 luna kernel:  ? __pfx_framebuffer_driver_init+0x10/0x10 [fr=
amebuffer_coreboot a587d2fc243ebaa0205c3badd33442a004d284e0]
Aug 20 20:29:36 luna kernel:  do_one_initcall+0x58/0x310
Aug 20 20:29:36 luna kernel:  do_init_module+0x60/0x220
Aug 20 20:29:36 luna kernel:  init_module_from_file+0x89/0xe0
Aug 20 20:29:36 luna kernel:  idempotent_init_module+0x121/0x320
Aug 20 20:29:36 luna kernel:  __x64_sys_finit_module+0x5e/0xb0
Aug 20 20:29:36 luna kernel:  do_syscall_64+0x82/0x190
Aug 20 20:29:36 luna kernel:  ? __do_sys_newfstatat+0x3c/0x80
Aug 20 20:29:36 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
Aug 20 20:29:36 luna kernel:  ? do_syscall_64+0x8e/0x190
Aug 20 20:29:36 luna kernel:  ? do_sys_openat2+0x9c/0xe0
Aug 20 20:29:36 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
Aug 20 20:29:36 luna kernel:  ? do_syscall_64+0x8e/0x190
Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
Aug 20 20:29:36 luna kernel:  ? clear_bhb_loop+0x25/0x80
Aug 20 20:29:36 luna kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Aug 20 20:29:36 luna kernel: RIP: 0033:0x7b1bee2f81fd

The real issue is in i915 however.

However, you have out-of-tree modules. Try reproducing it without them.

Adding i915 people too.

Aug 20 20:29:37 luna kernel: resource: Trying to free nonexistent resource =
<0x00000000a0000000-0x00000000a0257fff>
Aug 20 20:29:37 luna kernel: BUG: unable to handle page fault for address: =
0000000300000031
Aug 20 20:29:37 luna kernel: #PF: supervisor read access in kernel mode
Aug 20 20:29:37 luna kernel: #PF: error_code(0x0000) - not-present page
Aug 20 20:29:37 luna kernel: PGD 0 P4D 0=20
Aug 20 20:29:37 luna kernel: Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
Aug 20 20:29:37 luna kernel: CPU: 9 PID: 552 Comm: (udev-worker) Tainted: G=
           OE      6.10.6-arch1-1 #1 703d152c24f1971e36f16e505405e456fc9e23=
f8
Aug 20 20:29:37 luna kernel: Hardware name: Purism Librem 14/Librem 14, BIO=
S 4.14-Purism-1 06/18/2021
Aug 20 20:29:37 luna kernel: RIP: 0010:__release_resource+0x34/0xb0
Aug 20 20:29:37 luna kernel: Code: 8d 50 38 48 8b 40 38 48 85 c0 75 27 eb 6=
a 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 90 4=
8 8d 50 30 <48> 8b 40 30 48 85 c0 74 45 48 39 c7 75 ee 40 84 f6 75 45 48 8b=
 4f
Aug 20 20:29:37 luna kernel: RSP: 0018:ffffb30dc207f930 EFLAGS: 00010296
Aug 20 20:29:37 luna kernel: RAX: 0000000300000001 RBX: ffff8fa34616e900 RC=
X: ffff8fa3424aac50
Aug 20 20:29:37 luna kernel: RDX: 0000000300000031 RSI: 0000000000000001 RD=
I: ffff8fa34616e900
Aug 20 20:29:37 luna kernel: RBP: ffff8fa3460e1400 R08: ffff8fa3424a97b8 R0=
9: 0000000000000000
Aug 20 20:29:37 luna kernel: R10: 0000000000000000 R11: 0000000000000000 R1=
2: ffff8fa341671000
Aug 20 20:29:37 luna kernel: R13: 0000000000000000 R14: ffff8fa3416710c8 R1=
5: ffff8fa341671000
Aug 20 20:29:37 luna kernel: FS:  00007b1bee0eb880(0000) GS:ffff8fae6e48000=
0(0000) knlGS:0000000000000000
Aug 20 20:29:37 luna kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
Aug 20 20:29:37 luna kernel: CR2: 0000000300000031 CR3: 0000000103924002 CR=
4: 00000000003706f0
Aug 20 20:29:37 luna kernel: Call Trace:
Aug 20 20:29:37 luna kernel:  <TASK>
Aug 20 20:29:37 luna kernel:  ? __die_body.cold+0x19/0x27
Aug 20 20:29:37 luna kernel:  ? page_fault_oops+0x15a/0x2d0
Aug 20 20:29:37 luna kernel:  ? exc_page_fault+0x81/0x190
Aug 20 20:29:37 luna kernel:  ? asm_exc_page_fault+0x26/0x30
Aug 20 20:29:37 luna kernel:  ? __release_resource+0x34/0xb0
Aug 20 20:29:37 luna kernel:  release_resource+0x26/0x40
Aug 20 20:29:37 luna kernel:  platform_device_del+0x51/0x90
Aug 20 20:29:37 luna kernel:  platform_device_unregister+0x12/0x30
Aug 20 20:29:37 luna kernel:  sysfb_disable+0x2f/0x80
Aug 20 20:29:37 luna kernel:  aperture_remove_conflicting_pci_devices+0x8c/=
0xa0
Aug 20 20:29:37 luna kernel:  i915_driver_probe+0x7c8/0xac0 [i915 6caac5d02=
e3122d822ca0c852e7e5ed826a3aaea]
Aug 20 20:29:37 luna kernel:  local_pci_probe+0x42/0x90
Aug 20 20:29:37 luna kernel:  pci_device_probe+0xbd/0x290
Aug 20 20:29:37 luna kernel:  ? sysfs_do_create_link_sd+0x6e/0xe0
Aug 20 20:29:37 luna kernel:  really_probe+0xdb/0x340
Aug 20 20:29:37 luna kernel:  ? pm_runtime_barrier+0x54/0x90
Aug 20 20:29:37 luna kernel:  ? __pfx___driver_attach+0x10/0x10
Aug 20 20:29:37 luna kernel:  __driver_probe_device+0x78/0x110
Aug 20 20:29:37 luna kernel:  driver_probe_device+0x1f/0xa0
Aug 20 20:29:37 luna kernel:  __driver_attach+0xba/0x1c0
Aug 20 20:29:37 luna kernel:  bus_for_each_dev+0x8c/0xe0
Aug 20 20:29:37 luna kernel:  bus_add_driver+0x112/0x1f0
Aug 20 20:29:37 luna kernel:  driver_register+0x72/0xd0
Aug 20 20:29:37 luna kernel:  i915_init+0x23/0x90 [i915 6caac5d02e3122d822c=
a0c852e7e5ed826a3aaea]
Aug 20 20:29:37 luna kernel:  ? __pfx_i915_init+0x10/0x10 [i915 6caac5d02e3=
122d822ca0c852e7e5ed826a3aaea]
Aug 20 20:29:37 luna kernel:  do_one_initcall+0x58/0x310
Aug 20 20:29:37 luna kernel:  do_init_module+0x60/0x220
Aug 20 20:29:37 luna kernel:  init_module_from_file+0x89/0xe0
Aug 20 20:29:37 luna kernel:  idempotent_init_module+0x121/0x320
Aug 20 20:29:37 luna kernel:  __x64_sys_finit_module+0x5e/0xb0
Aug 20 20:29:37 luna kernel:  do_syscall_64+0x82/0x190
Aug 20 20:29:37 luna kernel:  ? switch_fpu_return+0x4e/0xd0
Aug 20 20:29:37 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
Aug 20 20:29:37 luna kernel:  ? do_syscall_64+0x8e/0x190
Aug 20 20:29:37 luna kernel:  ? syscall_exit_to_user_mode+0x72/0x200
Aug 20 20:29:37 luna kernel:  ? do_syscall_64+0x8e/0x190
Aug 20 20:29:37 luna kernel:  ? clear_bhb_loop+0x25/0x80
Aug 20 20:29:37 luna kernel:  ? clear_bhb_loop+0x25/0x80
Aug 20 20:29:37 luna kernel:  ? clear_bhb_loop+0x25/0x80
Aug 20 20:29:37 luna kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Aug 20 20:29:37 luna kernel: RIP: 0033:0x7b1bee2f81fd
Aug 20 20:29:37 luna kernel: Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f=
3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 2=
4 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 fa 0c 00 f7 d8 64 89 01=
 48
Aug 20 20:29:37 luna kernel: RSP: 002b:00007ffe062c2ac8 EFLAGS: 00000246 OR=
IG_RAX: 0000000000000139
Aug 20 20:29:37 luna kernel: RAX: ffffffffffffffda RBX: 000056171c8d0a00 RC=
X: 00007b1bee2f81fd
Aug 20 20:29:37 luna kernel: RDX: 0000000000000004 RSI: 00007b1bee0e5061 RD=
I: 0000000000000026
Aug 20 20:29:37 luna kernel: RBP: 00007ffe062c2b80 R08: 0000000000000001 R0=
9: 00007ffe062c2b10
Aug 20 20:29:37 luna kernel: R10: 0000000000000040 R11: 0000000000000246 R1=
2: 00007b1bee0e5061
Aug 20 20:29:37 luna kernel: R13: 0000000000020000 R14: 000056171c8d18c0 R1=
5: 000056171c8d31e0
Aug 20 20:29:37 luna kernel:  </TASK>
Aug 20 20:29:37 luna kernel: Modules linked in: intel_powerclamp ath9k(+) s=
nd_compress coretemp ac97_bus ath9k_common snd_pcm_dmaengine kvm_intel snd_=
hda_intel ath9k_hw joydev snd_intel_dspcfg mousedev ath snd_intel_sdw_acpi =
i915(+) kvm snd_hda_codec iTCO_wdt mac80211 snd_hda_core processor_thermal_=
device_pci_legacy intel_pmc_bxt snd_hwdep processor_thermal_device hid_mult=
itouch ee1004 iTCO_vendor_support processor_thermal_wt_hint drm_buddy snd_p=
cm rapl processor_thermal_rfim hid_generic spi_nor r8169 i2c_i801 i2c_algo_=
bit libarc4 memconsole_coreboot processor_thermal_rapl snd_timer intel_csta=
te intel_rapl_msr framebuffer_coreboot memconsole cbmem intel_uncore snd in=
tel_rapl_common realtek ttm i2c_smbus cfg80211 mtd processor_thermal_wt_req=
 psmouse mdio_devres pcspkr soundcore i2c_mux processor_thermal_power_floor=
 drm_display_helper intel_lpss_pci libphy processor_thermal_mbox intel_lpss=
 cec rfkill int340x_thermal_zone intel_pmc_core i2c_hid_acpi idma64 intel_g=
tt intel_soc_dts_iosf intel_pch_thermal i2c_hid intel_vsec intel_hid video
Aug 20 20:29:37 luna kernel:  pmt_telemetry pmt_class pinctrl_cannonlake wm=
i sparse_keymap coreboot_table mac_hid pkcs8_key_parser crypto_user loop ac=
pi_call(OE) nfnetlink ip_tables x_tables ext4 crc32c_generic crc16 mbcache =
jbd2 uas usb_storage dm_crypt cbc encrypted_keys trusted asn1_encoder tee d=
m_mod crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni polyval_ge=
neric gf128mul ghash_clmulni_intel serio_raw sha512_ssse3 atkbd sha256_ssse=
3 sha1_ssse3 libps2 aesni_intel vivaldi_fmap nvme crypto_simd nvme_core spi=
_intel_pci cryptd xhci_pci spi_intel i8042 nvme_auth xhci_pci_renesas serio=
 librem_ec_acpi(OE)
Aug 20 20:29:37 luna kernel: CR2: 0000000300000031
Aug 20 20:29:37 luna kernel: ---[ end trace 0000000000000000 ]---

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
