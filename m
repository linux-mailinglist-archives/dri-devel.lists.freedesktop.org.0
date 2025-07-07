Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0ABAFAFF9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 11:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EC810E31A;
	Mon,  7 Jul 2025 09:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="C1JbOEwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 605 seconds by postgrey-1.36 at gabe;
 Mon, 07 Jul 2025 09:41:01 UTC
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D6110E31A;
 Mon,  7 Jul 2025 09:41:01 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id BF41240E0208; 
 Mon,  7 Jul 2025 09:30:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id jbK1aqKiTf2C; Mon,  7 Jul 2025 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1751880650; bh=1lz/JpPtCN7njwwxfe47p4WGy8o2scBRxB/pzapm9KI=;
 h=Date:From:To:Cc:Subject:From;
 b=C1JbOEwBSbRAVbykwKs8j6NZofsnsHLWDwhg4FLoR2hrJ0ltzP4r7S7+F3KK6mirk
 v/rCCS8xa6TGIIo50OAUFj/q+KaLj9laFQK8H4NU00MYbRd8VELaWqLakGizgVmPxF
 gF130GLXTOK0kC2XMlhqlRWVA+aLXT+NLACNz7uA1ckAbNtp8lfqGpFb5vkZmVAuHu
 bTY5rsJ6MB3w6so3CFXEIDSXBJ+fyJZZmrxUviZh2lyQzhX+k3KgkTHuM44Y4FjA6+
 LPGFHpYKjlTfE9FvW5HXm9dhzt9/MmLGy9lwA19GUkMDF47jgY8/dkbmYv9akmViC0
 dVxS8JAfnC7+wJyzdBsD/Jn1V2kPdHiixWL/IgBEKwT3vE9rLrLV7D75Wg3Qdo/ta+
 fms9sXLrObKOj1kwjm7FtogFPfKm9jvkzzH5mKyMfPZy7rqBk6M2r5bRrg4ZAQRyeW
 fIF2Hhhdi1+q06jLKL4kFOUOKVO0hz1p7JQCr3DeoH2AXqlNmCJ4fXjuAo5EWlPApe
 IMLDnuhHdrXA+eXkdFdqYLFZoVjC5AjrlOvOiVH8JKjCwt3eZe/Fh4YMPr9qtdQwTB
 TNvQTxnEcs9L8vJDnNtg27jlmHoBTkBPyolu5VueCzbaMnJ0WKT+/W7TO4vnDjCaYh
 2azpldGwVqgZj+jC4LTqwKdE=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 50F4940E0198;
 Mon,  7 Jul 2025 09:30:40 +0000 (UTC)
Date: Mon, 7 Jul 2025 11:30:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Ramesh Errabolu <Ramesh.Errabolu@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: WARNING: drivers/gpu/drm/drm_gem.c:286 at
 drm_gem_object_handle_put_unlocked+0xb1/0xf0 [drm]
Message-ID: <20250707093032.GAaGuTuJ0ZYHPgA2q3@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi all,

I see the below on -rc5 + tip, on a RN machine.

---

[    5.592468] cdc_ncm 2-2:2.0 eth0: register 'cdc_ncm' at usb-0000:03:00.3=
-2, CDC NCM (NO ZLP), f8:e4:3b:33:37:71
[    5.593133] usbcore: registered new interface driver cdc_ncm
[    5.597944] usbcore: registered new interface driver cdc_wdm
[    5.600108] usbcore: registered new interface driver cdc_mbim
[    6.912317] ------------[ cut here ]------------
[    6.912377] WARNING: drivers/gpu/drm/drm_gem.c:286 at drm_gem_object_han=
dle_put_unlocked+0xb1/0xf0 [drm], CPU#1: Xorg/629
[    6.912429] Modules linked in: cdc_mbim(E) cdc_wdm(E) cdc_ncm(E) cdc_eth=
er(E) amd_atl(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) joydev(E) amdgpu(=
E) edac_mce_amd(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) snd_hd=
a_scodec_component(E) snd_hda_codec_hdmi(E) rtw88_8822ce(E) hid_multitouch(=
E) amdxcp(E) kvm_amd(E) sha3_generic(E) rtw88_8822c(E) i2c_algo_bit(E) rtw8=
8_pci(E) drm_client_lib(E) snd_hda_intel(E) drm_ttm_helper(E) rtw88_core(E)=
 jitterentropy_rng(E) hid_generic(E) snd_intel_dspcfg(E) tpm_crb(E) wmi_bmo=
f(E) drbg(E) ttm(E) kvm(E) snd_hda_codec(E) drm_exec(E) mac80211(E) irqbypa=
ss(E) snd_hwdep(E) snd_hda_core(E) ghash_clmulni_intel(E) gpu_sched(E) liba=
rc4(E) aesni_intel(E) snd_pcm(E) drm_suballoc_helper(E) drm_panel_backlight=
_quirks(E) sp5100_tco(E) rapl(E) cec(E) snd_timer(E) watchdog(E) cfg80211(E=
) drm_buddy(E) snd_rn_pci_acp3x(E) ucsi_acpi(E) snd_acp_config(E) drm_displ=
ay_helper(E) pcspkr(E) i2c_piix4(E) xhci_pci(E) snd_soc_acpi(E) acpi_cpufre=
q(E) snd(E) video(E) typec_ucsi(E) roles(E) drm_kms_helper(E)
[    6.912495]  ccp(E) soundcore(E) snd_pci_acp3x(E) xhci_hcd(E) k10temp(E)=
 rfkill(E) i2c_smbus(E) typec(E) battery(E) wmi(E) tpm_tis(E) i2c_hid_acpi(=
E) tpm_tis_core(E) i2c_hid(E) hid(E) ac(E) button(E) fuse(E) drm(E) efi_pst=
ore(E) tpm(E) libaescfb(E) ecdh_generic(E) ecc(E) rng_core(E) autofs4(E) ev=
dev(E) serio_raw(E)
[    6.912538] CPU: 1 UID: 0 PID: 629 Comm: Xorg Tainted: G            E   =
    6.16.0-rc5+ #1 PREEMPT(voluntary)=20
[    6.912542] Tainted: [E]=3DUNSIGNED_MODULE
[    6.912544] Hardware name: HP HP ProBook 635 Aero G7 Notebook PC/8830, B=
IOS S84 Ver. 01.05.00 05/14/2021
[    6.912547] RIP: 0010:drm_gem_object_handle_put_unlocked+0xb1/0xf0 [drm]
[    6.912573] Code: 55 d1 1e f3 48 89 ef e8 fd 22 1e f3 eb d8 48 8b 43 08 =
48 8d b8 f8 0c 00 00 e8 cb 85 1a f3 c7 83 18 01 00 00 00 00 00 00 eb 98 <0f=
> 0b 5b 5d e9 26 d1 1e f3 48 8b 83 f8 01 00 00 48 8b 00 48 85 c0
[    6.912575] RSP: 0018:ffffb5ebc32e3ba0 EFLAGS: 00010246
[    6.912578] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffb5ebc32=
e3b1c
[    6.912581] RDX: 0000000000000000 RSI: ffff9efb8cb005e8 RDI: ffff9efb861=
cd448
[    6.912583] RBP: ffff9efb8cb00010 R08: 0000000000000001 R09: ffff9efb8cb=
00610
[    6.912584] R10: 0000000000000000 R11: ffffb5ebc32e3b58 R12: ffff9efb8c2=
41700
[    6.912586] R13: 00000000ffffffdd R14: ffffb5ebc32e3c80 R15: ffff9efb8cb=
00010
[    6.912588] FS:  00007f320acb2b00(0000) GS:ffff9efcd29b8000(0000) knlGS:=
0000000000000000
[    6.912591] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.912593] CR2: 00005605532d6164 CR3: 000000000bee9000 CR4: 00000000003=
50ef0
[    6.912595] Call Trace:
[    6.912597]  <TASK>
[    6.912599]  drm_gem_fb_destroy+0x2c/0x50 [drm_kms_helper]
[    6.912616]  drm_mode_cursor_universal+0x10d/0x2a0 [drm]
[    6.912647]  drm_mode_cursor_common.part.0+0xb0/0x200 [drm]
[    6.912676]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
[    6.912700]  drm_ioctl_kernel+0xa9/0x100 [drm]
[    6.912728]  drm_ioctl+0x275/0x520 [drm]
[    6.912752]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
[    6.912777]  ? lock_release+0xc6/0x290
[    6.912783]  ? _raw_spin_unlock_irqrestore+0x44/0x60
[    6.912789]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[    6.913114]  __x64_sys_ioctl+0x85/0xd0
[    6.913120]  do_syscall_64+0x6a/0x2e0
[    6.913125]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    6.913128] RIP: 0033:0x7f320b0338db
[    6.913131] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[    6.913134] RSP: 002b:00007ffd66400810 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[    6.913137] RAX: ffffffffffffffda RBX: 00007ffd664008a0 RCX: 00007f320b0=
338db
[    6.913139] RDX: 00007ffd664008a0 RSI: 00000000c02464bb RDI: 00000000000=
0000f
[    6.913141] RBP: 00007ffd664008a0 R08: 00007f320a8cbb20 R09: 00000000000=
00001
[    6.913143] R10: 000000000000004b R11: 0000000000000246 R12: 00000000c02=
464bb
[    6.913145] R13: 000000000000000f R14: 0000000000000001 R15: 00005605530=
01d10
[    6.913152]  </TASK>
[    6.913153] irq event stamp: 354561
[    6.913155] hardirqs last  enabled at (354569): [<ffffffffb2b951f2>] __u=
p_console_sem+0x52/0x60
[    6.913159] hardirqs last disabled at (354576): [<ffffffffb2b951d7>] __u=
p_console_sem+0x37/0x60
[    6.913161] softirqs last  enabled at (352542): [<ffffffffb2aeb586>] __i=
rq_exit_rcu+0x96/0xc0
[    6.913165] softirqs last disabled at (352537): [<ffffffffb2aeb586>] __i=
rq_exit_rcu+0x96/0xc0
[    6.913167] ---[ end trace 0000000000000000 ]---
[    6.913288] ------------[ cut here ]------------
[    6.913290] WARNING: drivers/gpu/drm/drm_gem.c:286 at drm_gem_object_han=
dle_put_unlocked+0xb1/0xf0 [drm], CPU#1: Xorg/629
[    6.913318] Modules linked in: cdc_mbim(E) cdc_wdm(E) cdc_ncm(E) cdc_eth=
er(E) amd_atl(E) nls_ascii(E) nls_cp437(E) vfat(E) fat(E) joydev(E) amdgpu(=
E) edac_mce_amd(E) snd_hda_codec_realtek(E) snd_hda_codec_generic(E) snd_hd=
a_scodec_component(E) snd_hda_codec_hdmi(E) rtw88_8822ce(E) hid_multitouch(=
E) amdxcp(E) kvm_amd(E) sha3_generic(E) rtw88_8822c(E) i2c_algo_bit(E) rtw8=
8_pci(E) drm_client_lib(E) snd_hda_intel(E) drm_ttm_helper(E) rtw88_core(E)=
 jitterentropy_rng(E) hid_generic(E) snd_intel_dspcfg(E) tpm_crb(E) wmi_bmo=
f(E) drbg(E) ttm(E) kvm(E) snd_hda_codec(E) drm_exec(E) mac80211(E) irqbypa=
ss(E) snd_hwdep(E) snd_hda_core(E) ghash_clmulni_intel(E) gpu_sched(E) liba=
rc4(E) aesni_intel(E) snd_pcm(E) drm_suballoc_helper(E) drm_panel_backlight=
_quirks(E) sp5100_tco(E) rapl(E) cec(E) snd_timer(E) watchdog(E) cfg80211(E=
) drm_buddy(E) snd_rn_pci_acp3x(E) ucsi_acpi(E) snd_acp_config(E) drm_displ=
ay_helper(E) pcspkr(E) i2c_piix4(E) xhci_pci(E) snd_soc_acpi(E) acpi_cpufre=
q(E) snd(E) video(E) typec_ucsi(E) roles(E) drm_kms_helper(E)
[    6.913380]  ccp(E) soundcore(E) snd_pci_acp3x(E) xhci_hcd(E) k10temp(E)=
 rfkill(E) i2c_smbus(E) typec(E) battery(E) wmi(E) tpm_tis(E) i2c_hid_acpi(=
E) tpm_tis_core(E) i2c_hid(E) hid(E) ac(E) button(E) fuse(E) drm(E) efi_pst=
ore(E) tpm(E) libaescfb(E) ecdh_generic(E) ecc(E) rng_core(E) autofs4(E) ev=
dev(E) serio_raw(E)
[    6.913408] CPU: 1 UID: 0 PID: 629 Comm: Xorg Tainted: G        W   E   =
    6.16.0-rc5+ #1 PREEMPT(voluntary)=20
[    6.913412] Tainted: [W]=3DWARN, [E]=3DUNSIGNED_MODULE
[    6.913414] Hardware name: HP HP ProBook 635 Aero G7 Notebook PC/8830, B=
IOS S84 Ver. 01.05.00 05/14/2021
[    6.913416] RIP: 0010:drm_gem_object_handle_put_unlocked+0xb1/0xf0 [drm]
[    6.913438] Code: 55 d1 1e f3 48 89 ef e8 fd 22 1e f3 eb d8 48 8b 43 08 =
48 8d b8 f8 0c 00 00 e8 cb 85 1a f3 c7 83 18 01 00 00 00 00 00 00 eb 98 <0f=
> 0b 5b 5d e9 26 d1 1e f3 48 8b 83 f8 01 00 00 48 8b 00 48 85 c0
[    6.913441] RSP: 0018:ffffb5ebc32e3ba0 EFLAGS: 00010246
[    6.913443] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffffb5ebc32=
e3b1c
[    6.913445] RDX: 0000000000000000 RSI: ffff9efb8cb005e8 RDI: ffff9efb861=
cd448
[    6.913447] RBP: ffff9efb8cb00010 R08: 0000000000000001 R09: ffff9efb8cb=
00610
[    6.913449] R10: 0000000000000000 R11: ffffb5ebc32e3b58 R12: ffff9efb8c2=
41700
[    6.913451] R13: 00000000ffffffdd R14: ffffb5ebc32e3c80 R15: ffff9efb8cb=
00010
[    6.913453] FS:  00007f320acb2b00(0000) GS:ffff9efcd29b8000(0000) knlGS:=
0000000000000000
[    6.913455] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    6.913457] CR2: 00005605532d6164 CR3: 000000000bee9000 CR4: 00000000003=
50ef0
[    6.913459] Call Trace:
[    6.913461]  <TASK>
[    6.913464]  drm_gem_fb_destroy+0x2c/0x50 [drm_kms_helper]
[    6.913477]  drm_mode_cursor_universal+0x10d/0x2a0 [drm]
[    6.913506]  drm_mode_cursor_common.part.0+0xb0/0x200 [drm]
[    6.913534]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
[    6.913557]  drm_ioctl_kernel+0xa9/0x100 [drm]
[    6.913583]  drm_ioctl+0x275/0x520 [drm]
[    6.913607]  ? __pfx_drm_mode_cursor2_ioctl+0x10/0x10 [drm]
[    6.913631]  ? lock_release+0xc6/0x290
[    6.913637]  ? _raw_spin_unlock_irqrestore+0x44/0x60
[    6.913642]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
[    6.913818]  __x64_sys_ioctl+0x85/0xd0
[    6.913823]  do_syscall_64+0x6a/0x2e0
[    6.913828]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[    6.913830] RIP: 0033:0x7f320b0338db
[    6.913832] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 =
00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89=
> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[    6.913835] RSP: 002b:00007ffd66400810 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000010
[    6.913838] RAX: ffffffffffffffda RBX: 00007ffd664008a0 RCX: 00007f320b0=
338db
[    6.913839] RDX: 00007ffd664008a0 RSI: 00000000c02464bb RDI: 00000000000=
0000f
[    6.913841] RBP: 00007ffd664008a0 R08: 00007f320a8cbb20 R09: 00000000000=
00001
[    6.913843] R10: 000000000000004b R11: 0000000000000246 R12: 00000000c02=
464bb
[    6.913845] R13: 000000000000000f R14: 0000000000000001 R15: 00005605530=
01d10
[    6.913852]  </TASK>
[    6.913853] irq event stamp: 355561
[    6.913855] hardirqs last  enabled at (355569): [<ffffffffb2b951f2>] __u=
p_console_sem+0x52/0x60
[    6.913858] hardirqs last disabled at (355576): [<ffffffffb2b951d7>] __u=
p_console_sem+0x37/0x60
[    6.913861] softirqs last  enabled at (352542): [<ffffffffb2aeb586>] __i=
rq_exit_rcu+0x96/0xc0
[    6.913864] softirqs last disabled at (352537): [<ffffffffb2aeb586>] __i=
rq_exit_rcu+0x96/0xc0
[    6.913866] ---[ end trace 0000000000000000 ]---
[   45.744032]     percentage:          78%
[  225.782261]     percentage:          79%

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
