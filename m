Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCjoCV/2dGkM/gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:42:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FBF7E23F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 17:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041DA10E1B7;
	Sat, 24 Jan 2026 16:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q4BziOM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A3310E1B7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:42:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C99A60018
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:42:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75F5CC116D0
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 16:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769272919;
 bh=LXY/nvWZkW0/o8s1p3Apy/qx7BS/i6jy9I2CVy2f/X8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q4BziOM0pJ3iur/YWVeOdwKjfHIokKgv9te0MkuA2mY7Naw224+R1Q68G4ZEyFQJD
 45HBNrIXMbXQZqmdv+yoFOrrl77Zp358xFYjFO8aYsnqVmq19VE+yRpy+xDu2QU8wg
 bp5CjC6r0Jljdwnr1s7Q5gmetJOmWtIMldvU/0SJ3u6uQbbCIJn2zxIrkKfszUzqMa
 7GcKqV1ooFHhMas6ReQqqc55UVQ2uJyJkxHSkq6pEPW+lqCfa+JspvWCIJ+HAR2dkk
 r5j/Adf1wcJcvnpLJiMecFTaIyR3thk4WJ+sZ31oPUK6lFFKJq5bNMprrCpPGzdbgh
 gj/pVwXMLC7cQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6A554C433E1; Sat, 24 Jan 2026 16:41:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221008] amdgpu: Crash with KDE Plasma built from master -
 use-after-free
Date: Sat, 24 Jan 2026 16:41:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asn@samba.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221008-2300-jSZkCQ839g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221008-2300@https.bugzilla.kernel.org/>
References: <bug-221008-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[dri-devel];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 64FBF7E23F
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221008

--- Comment #1 from Andreas Schneider (asn@samba.org) ---
The crash also happens if I remove the vbox modules tainting the kernel.

[   97.025728] [   T4010] ------------[ cut here ]------------
[   97.025731] [   T4010] refcount_t: addition on 0; use-after-free.
[   97.025734] [   T4010] WARNING: CPU: 21 PID: 4010 at lib/refcount.c:25
refcount_warn_saturate+0xe5/0x110
[   97.025739] [   T4010] Modules linked in: af_packet nft_masq
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reje=
ct
nft_ct nft_chain_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_=
ipv4
iptable_mangle iptable_raw iptable_security ip6table_filter qrtr iptable_fi=
lter
binfmt_misc nls_iso8859_1 nls_cp437 vfat fat snd_hda_codec_alc882 amd_atl
intel_rapl_msr snd_hda_codec_realtek_lib intel_rapl_common
snd_hda_codec_generic snd_hda_codec_atihdmi snd_hda_codec_hdmi snd_hda_intel
snd_usb_audio snd_hda_codec snd_usbmidi_lib snd_hda_core uvcvideo snd_ump
edac_mce_amd snd_intel_dspcfg videobuf2_vmalloc eeepc_wmi snd_rawmidi
snd_intel_sdw_acpi uvc asus_wmi kvm_amd snd_seq_device snd_hwdep
videobuf2_memops platform_profile spd5118 videobuf2_v4l2 snd_pcm battery ra=
id1
videobuf2_common kvm snd_timer i2c_piix4 asus_ec_sensors sparse_keymap vide=
odev
snd atlantic irqbypass rfkill
[   97.025758] [   T4010]  wmi_bmof pcspkr i2c_smbus gpio_amdpt k10temp md_=
mod
mc soundcore macsec joydev tiny_power_button amd_3d_vcache gpio_generic
acpi_pad button nvme_fabrics fuse loop efi_pstore hid_logitech_hidpp
hid_multitouch hid_logitech_dj hid_generic amdgpu dm_crypt essiv authenc
trusted usbhid asn1_encoder crc16 tee amdxcp ahci i2c_algo_bit libahci
drm_ttm_helper ttm libata drm_exec ucsi_acpi sd_mod drm_panel_backlight_qui=
rks
typec_ucsi scsi_dh_emc gpu_sched roles typec scsi_dh_rdac drm_suballoc_help=
er
nvme scsi_dh_alua drm_buddy nvme_core polyval_clmulni xhci_pci sg
drm_display_helper nvme_keyring ghash_clmulni_intel xhci_hcd scsi_mod cec
nvme_auth video aesni_intel sp5100_tco ccp scsi_common usbcore rc_core hkdf=
 wmi
thunderbolt btrfs blake2b_generic xor raid6_pq dm_mirror dm_region_hash dm_=
log
dm_mod br_netfilter bridge stp llc nf_tables msr i2c_dev ip6_tables ntsync
nfnetlink efivarfs dmi_sysfs ip_tables x_tables
[   97.025780] [   T4010] CPU: 21 UID: 1001 PID: 4010 Comm: kwin_wayland Not
tainted 6.18.6-1-default #1 PREEMPT(voluntary) openSUSE Tumbleweed=20
92cb00939711ed77e866daec88f8ff02e7729bee
[   97.025782] [   T4010] Hardware name: ASUS System Product Name/ProArt
X870E-CREATOR WIFI, BIOS 1805 12/11/2025
[   97.025783] [   T4010] RIP: 0010:refcount_warn_saturate+0xe5/0x110
[   97.025785] [   T4010] Code: aa 99 ff 0f 0b c3 cc cc cc cc 80 3d 7c 2b b=
2 01
00 0f 85 5e ff ff ff 48 c7 c7 10 6a ed a3 c6 05 68 2b b2 01 01 e8 3b aa 99 =
ff
<0f> 0b c3 cc cc cc cc 48 c7 c7 68 6a ed a3 c6 05 4c 2b b2 01 01 e8
[   97.025786] [   T4010] RSP: 0018:ffffd28909113a28 EFLAGS: 00010246
[   97.025787] [   T4010] RAX: 0000000000000000 RBX: ffff8a4e4d2e9e00 RCX:
0000000000000027
[   97.025787] [   T4010] RDX: ffff8a5cff89ff08 RSI: 0000000000000001 RDI:
ffff8a5cff89ff00
[   97.025788] [   T4010] RBP: ffff8a4e5c8eb000 R08: 0000000000000000 R09:
00000000fffeffff
[   97.025788] [   T4010] R10: ffffffffa54ea0a0 R11: ffffd289091138d0 R12:
ffff8a4e64a47000
[   97.025788] [   T4010] R13: ffff8a4e4d2e9e00 R14: ffff8a4e56324858 R15:
0000000000000001
[   97.025789] [   T4010] FS:  00007f5136f8b640(0000) GS:ffff8a5d5a444000(0=
000)
knlGS:0000000000000000
[   97.025790] [   T4010] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   97.025790] [   T4010] CR2: 00007f513408e3fc CR3: 00000001abb81000 CR4:
0000000000f50ef0
[   97.025791] [   T4010] PKRU: 55555554
[   97.025791] [   T4010] Call Trace:
[   97.025792] [   T4010]  <TASK>
[   97.025794] [   T4010]  amdgpu_dm_crtc_duplicate_state+0x8c/0x190 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.025974] [   T4010]  drm_atomic_get_crtc_state+0x7f/0x120
[   97.025976] [   T4010]  drm_atomic_get_plane_state+0x13c/0x1a0
[   97.025977] [   T4010]  drm_atomic_set_property+0x2ab/0xd50
[   97.025979] [   T4010]  drm_mode_atomic_ioctl+0x225/0xd00
[   97.025981] [   T4010]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   97.025982] [   T4010]  drm_ioctl_kernel+0xa6/0x100
[   97.025983] [   T4010]  drm_ioctl+0x262/0x510
[   97.025984] [   T4010]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   97.025985] [   T4010]  ? amdgpu_drm_ioctl+0x7b/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026071] [   T4010]  amdgpu_drm_ioctl+0x4a/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026149] [   T4010]  __x64_sys_ioctl+0x97/0xe0
[   97.026151] [   T4010]  do_syscall_64+0x81/0x800
[   97.026153] [   T4010]  ? __pfx_drm_mode_addfb2_ioctl+0x10/0x10
[   97.026155] [   T4010]  ? amdgpu_drm_ioctl+0x7b/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026231] [   T4010]  ? __x64_sys_ioctl+0xb1/0xe0
[   97.026232] [   T4010]  ? do_syscall_64+0x81/0x800
[   97.026232] [   T4010]  ? exc_page_fault+0x69/0x170
[   97.026234] [   T4010]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   97.026235] [   T4010] RIP: 0033:0x7f513b91c3ff
[   97.026251] [   T4010] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 0=
4 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f =
05
<89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   97.026251] [   T4010] RSP: 002b:00007ffc91f04d20 EFLAGS: 00000246 ORIG_=
RAX:
0000000000000010
[   97.026252] [   T4010] RAX: ffffffffffffffda RBX: 000000002e174f30 RCX:
00007f513b91c3ff
[   97.026252] [   T4010] RDX: 00007ffc91f04e10 RSI: 00000000c03864bc RDI:
0000000000000013
[   97.026253] [   T4010] RBP: 00007ffc91f04e10 R08: 000000002e174f30 R09:
000000002ea37800
[   97.026253] [   T4010] R10: 000000002ea37938 R11: 0000000000000246 R12:
00000000c03864bc
[   97.026253] [   T4010] R13: 0000000000000013 R14: 000000002ea37938 R15:
000000002ea37800
[   97.026254] [   T4010]  </TASK>
[   97.026255] [   T4010] ---[ end trace 0000000000000000 ]---
[   97.026263] [   T4010] ------------[ cut here ]------------
[   97.026263] [   T4010] refcount_t: underflow; use-after-free.
[   97.026265] [   T4010] WARNING: CPU: 21 PID: 4010 at lib/refcount.c:28
refcount_warn_saturate+0xbe/0x110
[   97.026267] [   T4010] Modules linked in: af_packet nft_masq
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reje=
ct
nft_ct nft_chain_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_=
ipv4
iptable_mangle iptable_raw iptable_security ip6table_filter qrtr iptable_fi=
lter
binfmt_misc nls_iso8859_1 nls_cp437 vfat fat snd_hda_codec_alc882 amd_atl
intel_rapl_msr snd_hda_codec_realtek_lib intel_rapl_common
snd_hda_codec_generic snd_hda_codec_atihdmi snd_hda_codec_hdmi snd_hda_intel
snd_usb_audio snd_hda_codec snd_usbmidi_lib snd_hda_core uvcvideo snd_ump
edac_mce_amd snd_intel_dspcfg videobuf2_vmalloc eeepc_wmi snd_rawmidi
snd_intel_sdw_acpi uvc asus_wmi kvm_amd snd_seq_device snd_hwdep
videobuf2_memops platform_profile spd5118 videobuf2_v4l2 snd_pcm battery ra=
id1
videobuf2_common kvm snd_timer i2c_piix4 asus_ec_sensors sparse_keymap vide=
odev
snd atlantic irqbypass rfkill
[   97.026277] [   T4010]  wmi_bmof pcspkr i2c_smbus gpio_amdpt k10temp md_=
mod
mc soundcore macsec joydev tiny_power_button amd_3d_vcache gpio_generic
acpi_pad button nvme_fabrics fuse loop efi_pstore hid_logitech_hidpp
hid_multitouch hid_logitech_dj hid_generic amdgpu dm_crypt essiv authenc
trusted usbhid asn1_encoder crc16 tee amdxcp ahci i2c_algo_bit libahci
drm_ttm_helper ttm libata drm_exec ucsi_acpi sd_mod drm_panel_backlight_qui=
rks
typec_ucsi scsi_dh_emc gpu_sched roles typec scsi_dh_rdac drm_suballoc_help=
er
nvme scsi_dh_alua drm_buddy nvme_core polyval_clmulni xhci_pci sg
drm_display_helper nvme_keyring ghash_clmulni_intel xhci_hcd scsi_mod cec
nvme_auth video aesni_intel sp5100_tco ccp scsi_common usbcore rc_core hkdf=
 wmi
thunderbolt btrfs blake2b_generic xor raid6_pq dm_mirror dm_region_hash dm_=
log
dm_mod br_netfilter bridge stp llc nf_tables msr i2c_dev ip6_tables ntsync
nfnetlink efivarfs dmi_sysfs ip_tables x_tables
[   97.026290] [   T4010] CPU: 21 UID: 1001 PID: 4010 Comm: kwin_wayland
Tainted: G        W           6.18.6-1-default #1 PREEMPT(voluntary) openSU=
SE
Tumbleweed  92cb00939711ed77e866daec88f8ff02e7729bee
[   97.026291] [   T4010] Tainted: [W]=3DWARN
[   97.026292] [   T4010] Hardware name: ASUS System Product Name/ProArt
X870E-CREATOR WIFI, BIOS 1805 12/11/2025
[   97.026292] [   T4010] RIP: 0010:refcount_warn_saturate+0xbe/0x110
[   97.026293] [   T4010] Code: 01 01 e8 85 aa 99 ff 0f 0b c3 cc cc cc cc 8=
0 3d
9e 2b b2 01 00 75 85 48 c7 c7 40 6a ed a3 c6 05 8e 2b b2 01 01 e8 62 aa 99 =
ff
<0f> 0b c3 cc cc cc cc 80 3d 7c 2b b2 01 00 0f 85 5e ff ff ff 48 c7
[   97.026297] [   T4010] RSP: 0018:ffffd28909113ab0 EFLAGS: 00010246
[   97.026297] [   T4010] RAX: 0000000000000000 RBX: ffff8a4e4d2e9e00 RCX:
0000000000000027
[   97.026298] [   T4010] RDX: ffff8a5cff89ff08 RSI: 0000000000000001 RDI:
ffff8a5cff89ff00
[   97.026298] [   T4010] RBP: 0000000000000000 R08: 0000000000000000 R09:
00000000fffeffff
[   97.026299] [   T4010] R10: ffffffffa54ea0a0 R11: ffffd28909113958 R12:
ffff8a4e63080010
[   97.026299] [   T4010] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
[   97.026299] [   T4010] FS:  00007f5136f8b640(0000) GS:ffff8a5d5a444000(0=
000)
knlGS:0000000000000000
[   97.026300] [   T4010] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   97.026300] [   T4010] CR2: 00007f513408e3fc CR3: 00000001abb81000 CR4:
0000000000f50ef0
[   97.026301] [   T4010] PKRU: 55555554
[   97.026301] [   T4010] Call Trace:
[   97.026301] [   T4010]  <TASK>
[   97.026301] [   T4010]  amdgpu_dm_crtc_destroy_state+0x1e/0x30 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026445] [   T4010]  drm_atomic_state_default_clear+0x123/0x2d0
[   97.026447] [   T4010]  __drm_atomic_state_free+0x71/0xb0
[   97.026448] [   T4010]  drm_mode_atomic_ioctl+0x77b/0xd00
[   97.026449] [   T4010]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   97.026450] [   T4010]  drm_ioctl_kernel+0xa6/0x100
[   97.026451] [   T4010]  drm_ioctl+0x262/0x510
[   97.026452] [   T4010]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   97.026453] [   T4010]  ? amdgpu_drm_ioctl+0x7b/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026527] [   T4010]  amdgpu_drm_ioctl+0x4a/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026600] [   T4010]  __x64_sys_ioctl+0x97/0xe0
[   97.026601] [   T4010]  do_syscall_64+0x81/0x800
[   97.026602] [   T4010]  ? __pfx_drm_mode_addfb2_ioctl+0x10/0x10
[   97.026603] [   T4010]  ? amdgpu_drm_ioctl+0x7b/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.026676] [   T4010]  ? __x64_sys_ioctl+0xb1/0xe0
[   97.026677] [   T4010]  ? do_syscall_64+0x81/0x800
[   97.026677] [   T4010]  ? exc_page_fault+0x69/0x170
[   97.026678] [   T4010]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   97.026679] [   T4010] RIP: 0033:0x7f513b91c3ff
[   97.026681] [   T4010] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 0=
4 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f =
05
<89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   97.026681] [   T4010] RSP: 002b:00007ffc91f04d20 EFLAGS: 00000246 ORIG_=
RAX:
0000000000000010
[   97.026683] [   T4010] RAX: ffffffffffffffda RBX: 000000002e174f30 RCX:
00007f513b91c3ff
[   97.026683] [   T4010] RDX: 00007ffc91f04e10 RSI: 00000000c03864bc RDI:
0000000000000013
[   97.026684] [   T4010] RBP: 00007ffc91f04e10 R08: 000000002e174f30 R09:
000000002ea37800
[   97.026684] [   T4010] R10: 000000002ea37938 R11: 0000000000000246 R12:
00000000c03864bc
[   97.026684] [   T4010] R13: 0000000000000013 R14: 000000002ea37938 R15:
000000002ea37800
[   97.026685] [   T4010]  </TASK>
[   97.026685] [   T4010] ---[ end trace 0000000000000000 ]---
[   97.028025] [   T4067] ------------[ cut here ]------------
[   97.028027] [   T4067] refcount_t: saturated; leaking memory.
[   97.028030] [   T4067] WARNING: CPU: 2 PID: 4067 at lib/refcount.c:22
refcount_warn_saturate+0x55/0x110
[   97.028033] [   T4067] Modules linked in: af_packet nft_masq
nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet nft_fib_ipv4
nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reje=
ct
nft_ct nft_chain_nat ip6table_nat ip6table_mangle ip6table_raw
ip6table_security iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_=
ipv4
iptable_mangle iptable_raw iptable_security ip6table_filter qrtr iptable_fi=
lter
binfmt_misc nls_iso8859_1 nls_cp437 vfat fat snd_hda_codec_alc882 amd_atl
intel_rapl_msr snd_hda_codec_realtek_lib intel_rapl_common
snd_hda_codec_generic snd_hda_codec_atihdmi snd_hda_codec_hdmi snd_hda_intel
snd_usb_audio snd_hda_codec snd_usbmidi_lib snd_hda_core uvcvideo snd_ump
edac_mce_amd snd_intel_dspcfg videobuf2_vmalloc eeepc_wmi snd_rawmidi
snd_intel_sdw_acpi uvc asus_wmi kvm_amd snd_seq_device snd_hwdep
videobuf2_memops platform_profile spd5118 videobuf2_v4l2 snd_pcm battery ra=
id1
videobuf2_common kvm snd_timer i2c_piix4 asus_ec_sensors sparse_keymap vide=
odev
snd atlantic irqbypass rfkill
[   97.028051] [   T4067]  wmi_bmof pcspkr i2c_smbus gpio_amdpt k10temp md_=
mod
mc soundcore macsec joydev tiny_power_button amd_3d_vcache gpio_generic
acpi_pad button nvme_fabrics fuse loop efi_pstore hid_logitech_hidpp
hid_multitouch hid_logitech_dj hid_generic amdgpu dm_crypt essiv authenc
trusted usbhid asn1_encoder crc16 tee amdxcp ahci i2c_algo_bit libahci
drm_ttm_helper ttm libata drm_exec ucsi_acpi sd_mod drm_panel_backlight_qui=
rks
typec_ucsi scsi_dh_emc gpu_sched roles typec scsi_dh_rdac drm_suballoc_help=
er
nvme scsi_dh_alua drm_buddy nvme_core polyval_clmulni xhci_pci sg
drm_display_helper nvme_keyring ghash_clmulni_intel xhci_hcd scsi_mod cec
nvme_auth video aesni_intel sp5100_tco ccp scsi_common usbcore rc_core hkdf=
 wmi
thunderbolt btrfs blake2b_generic xor raid6_pq dm_mirror dm_region_hash dm_=
log
dm_mod br_netfilter bridge stp llc nf_tables msr i2c_dev ip6_tables ntsync
nfnetlink efivarfs dmi_sysfs ip_tables x_tables
[   97.028073] [   T4067] CPU: 2 UID: 1001 PID: 4067 Comm: DP-3 Tainted: G=
=20=20=20=20=20
  W           6.18.6-1-default #1 PREEMPT(voluntary) openSUSE Tumbleweed=20
92cb00939711ed77e866daec88f8ff02e7729bee
[   97.028075] [   T4067] Tainted: [W]=3DWARN
[   97.028076] [   T4067] Hardware name: ASUS System Product Name/ProArt
X870E-CREATOR WIFI, BIOS 1805 12/11/2025
[   97.028076] [   T4067] RIP: 0010:refcount_warn_saturate+0x55/0x110
[   97.028078] [   T4067] Code: 84 bc 00 00 00 c3 cc cc cc cc 85 f6 74 46 8=
0 3d
09 2c b2 01 00 75 ee 48 c7 c7 e8 69 ed a3 c6 05 f9 2b b2 01 01 e8 cb aa 99 =
ff
<0f> 0b c3 cc cc cc cc 80 3d e2 2b b2 01 00 75 cb 48 c7 c7 98 6a ed
[   97.028079] [   T4067] RSP: 0018:ffffd28909dbf9f8 EFLAGS: 00010246
[   97.028080] [   T4067] RAX: 0000000000000000 RBX: ffff8a4e4bf1c000 RCX:
0000000000000027
[   97.028081] [   T4067] RDX: ffff8a5cfef1ff08 RSI: 0000000000000001 RDI:
ffff8a5cfef1ff00
[   97.028082] [   T4067] RBP: ffff8a4e5c8eb000 R08: 0000000000000000 R09:
00000000fffeffff
[   97.028082] [   T4067] R10: ffffffffa54ea0a0 R11: ffffd28909dbf8a0 R12:
ffff8a4e64a47000
[   97.028083] [   T4067] R13: ffff8a4e4bf1c000 R14: ffff8a4e56324858 R15:
0000000000000001
[   97.028083] [   T4067] FS:  00007f511edf36c0(0000) GS:ffff8a5d59ac4000(0=
000)
knlGS:0000000000000000
[   97.028084] [   T4067] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   97.028085] [   T4067] CR2: 00007f5118003108 CR3: 00000001abb81000 CR4:
0000000000f50ef0
[   97.028085] [   T4067] PKRU: 55555554
[   97.028086] [   T4067] Call Trace:
[   97.028087] [   T4067]  <TASK>
[   97.028088] [   T4067]  amdgpu_dm_crtc_duplicate_state+0x8c/0x190 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.028290] [   T4067]  drm_atomic_get_crtc_state+0x7f/0x120
[   97.028292] [   T4067]  drm_atomic_get_plane_state+0x13c/0x1a0
[   97.028293] [   T4067]  drm_atomic_set_property+0x2ab/0xd50
[   97.028295] [   T4067]  drm_mode_atomic_ioctl+0x225/0xd00
[   97.028297] [   T4067]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   97.028299] [   T4067]  drm_ioctl_kernel+0xa6/0x100
[   97.028300] [   T4067]  drm_ioctl+0x262/0x510
[   97.028301] [   T4067]  ? __pfx_drm_mode_atomic_ioctl+0x10/0x10
[   97.028303] [   T4067]  amdgpu_drm_ioctl+0x4a/0x90 [amdgpu
45f09201b4c3f4190eea5be314ae03fe3ec728a5]
[   97.028415] [   T4067]  __x64_sys_ioctl+0x97/0xe0
[   97.028417] [   T4067]  do_syscall_64+0x81/0x800
[   97.028418] [   T4067]  ? __handle_mm_fault+0xa48/0xf00
[   97.028420] [   T4067]  ? count_memcg_events+0xc2/0x190
[   97.028422] [   T4067]  ? handle_mm_fault+0x1d7/0x2d0
[   97.028423] [   T4067]  ? do_user_addr_fault+0x21a/0x690
[   97.028426] [   T4067]  ? exc_page_fault+0x69/0x170
[   97.028427] [   T4067]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   97.028428] [   T4067] RIP: 0033:0x7f513b91c3ff
[   97.028433] [   T4067] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 0=
4 24
10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f =
05
<89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00 00
[   97.028434] [   T4067] RSP: 002b:00007f511edf2490 EFLAGS: 00000246 ORIG_=
RAX:
0000000000000010
[   97.028435] [   T4067] RAX: ffffffffffffffda RBX: 00007f5118003200 RCX:
00007f513b91c3ff
[   97.028436] [   T4067] RDX: 00007f511edf2580 RSI: 00000000c03864bc RDI:
0000000000000013
[   97.028436] [   T4067] RBP: 00007f511edf2580 R08: 00007f5118003200 R09:
00007f5118002940
[   97.028437] [   T4067] R10: 00007f5118002a18 R11: 0000000000000246 R12:
00000000c03864bc
[   97.028437] [   T4067] R13: 0000000000000013 R14: 00007f5118002a18 R15:
00007f5118002940
[   97.028438] [   T4067]  </TASK>
[   97.028439] [   T4067] ---[ end trace 0000000000000000 ]---
cccccbvlkvdhihvhhbgbvtuhjec

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
