Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF833A919
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 01:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FEE89B60;
	Mon, 15 Mar 2021 00:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822A489B60
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 00:37:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 46F1964E7C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 00:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615768653;
 bh=6qjDu/w83m90CJMEO7llgjOVChdHwGDHIOrchNJcjzM=;
 h=From:To:Subject:Date:From;
 b=Ja5mPgG2xcOjPqjNYfzSzPPFlvsx9kNgKdS9ejxTirIzjdstSqEjpkbxukUaARapU
 981/euZqNhdtnYl06GPbfX9myxY0MnSEoq3zq57gfqVkjbi368hRVIz1CFs/nTRAAU
 NAcxl/pSyWBNch3loUTlWxDtTrXYycEjZxkEOMJeifEaKoFliqZDV8cTbr9wZB2G0+
 qsLKx8eT9p5nG8S3vkTgKYhyxnq5ai0c0JAthgYM+bSaTT9e0/RrVEqnSrXE7GdDi2
 4fVS5Gmfrh3ybPQq/+ISAxnQj2KzVvbvFntSiNRmkJsBNknAlbxuxma3CBJAqRxhIu
 SatFgmqGrli1Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 31F6E652F6; Mon, 15 Mar 2021 00:37:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212281] New: AMDGPU warning stack trace in dmesg
 (dcn20_validate_bandwidth_fp)
Date: Mon, 15 Mar 2021 00:37:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: tomas@sandven.email
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212281-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212281

            Bug ID: 212281
           Summary: AMDGPU warning stack trace in dmesg
                    (dcn20_validate_bandwidth_fp)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: low
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: tomas@sandven.email
        Regression: No

I keep dmesg open in the background while I'm gaming on my Windows VM (I'm
passing through a GPU.)

Today my entire PC stuttered for a second and I lost my headset in the VM, and
my game crashed. I found this in dmesg:

> [ +10.038620] ------------[ cut here ]------------
> [  +0.000002] WARNING: CPU: 16 PID: 1866 at
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_resource.c:3238
> dcn20_validate_bandwidth_fp+0x8d/0xd0 [amdgpu]
> [  +0.000130] Modules linked in: vhost_net vhost vhost_iotlb tap tun uhid
> nls_utf8 cifs dns_resolver fscache libdes rfcomm xt_CHECKSUM xt_conntrack
> ipt_REJECT nf_reject_ipv4 xt_MASQUERADE nf_conntrack_netlink xt_tcpudp
> xt_addrtype br_netfilter ip6table_mangle ip6table_nat ip6table_filter
> ip6_tables iptable_mangle iptable_nat nf_nat nf_conntrack nf_defrag_ipv6
> nf_defrag_ipv4 overlay iptable_filter bridge nf_tables nfnetlink uvcvideo
> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 snd_usb_audio
> videobuf2_common videodev snd_usbmidi_lib snd_rawmidi snd_seq_device mc
> hid_logitech_hidpp joydev mousedev hid_logitech_dj usbhid iwlmvm cmac 8021q
> algif_hash garp snd_hda_codec_realtek algif_skcipher snd_hda_codec_generic
> af_alg mrp it87 intel_rapl_msr stp bnep llc intel_rapl_common hwmon_vid
> mac80211 ledtrig_audio snd_hda_codec_hdmi snd_hda_intel libarc4
> snd_intel_dspcfg soundwire_intel nls_iso8859_1 soundwire_generic_allocation
> vfat soundwire_cadence fat iwlwifi edac_mce_amd snd_hda_codec
> [  +0.000031]  kvm_amd btusb btrtl snd_hda_core btbcm snd_hwdep btintel
> soundwire_bus kvm bluetooth snd_soc_core snd_compress ac97_bus
> crct10dif_pclmul nouveau wmi_bmof crc32_pclmul ecdh_generic snd_pcm_dmaengine
> ghash_clmulni_intel cfg80211 ecc aesni_intel snd_pcm crypto_simd r8169 cryptd
> snd_timer igb glue_helper ccp realtek snd mdio_devres mxm_wmi rapl sp5100_tco
> soundcore k10temp pcspkr rng_core i2c_piix4 libphy rfkill dca video wmi
> pinctrl_amd mac_hid acpi_cpufreq uinput pkcs8_key_parser fuse crypto_user
> bpf_preload ip_tables x_tables ext4 crc16 mbcache jbd2 dm_snapshot dm_bufio
> xhci_pci xhci_pci_renesas amdgpu drm_ttm_helper ttm gpu_sched i2c_algo_bit
> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops cec drm agpgart
> vfio_pci irqbypass vfio_virqfd vfio_iommu_type1 vfio raid0 dm_raid raid456
> libcrc32c crc32c_generic crc32c_intel async_raid6_recov async_memcpy async_pq
> async_xor xor async_tx raid6_pq dm_mod md_mod
> [  +0.000042] CPU: 16 PID: 1866 Comm: sway Not tainted 5.11.4-arch1-1 #1
> [  +0.000002] Hardware name: Gigabyte Technology Co., Ltd. X570 AORUS
> MASTER/X570 AORUS MASTER, BIOS F33c 02/17/2021
> [  +0.000001] RIP: 0010:dcn20_validate_bandwidth_fp+0x8d/0xd0 [amdgpu]
> [  +0.000121] Code: 00 7b 35 22 85 1c 1f 00 00 75 2f 31 d2 f2 0f 11 85 58 26
> 00 00 48 89 ee 4c 89 e7 e8 3d f6 ff ff 89 c2 22 95 1c 1f 00 00 75 30 <0f> 0b
> 48 89 9d 58 26 00 00 5b 5d 41 5c c3 75 c9 48 89 9d 58 26 00
> [  +0.000001] RSP: 0018:ffffb0ee864b3b18 EFLAGS: 00010246
> [  +0.000001] RAX: 0000000000000001 RBX: 4079400000000000 RCX:
> 00000001ad796010
> [  +0.000001] RDX: 0000000000000000 RSI: 99381ed72af9ad02 RDI:
> 00000000000311a0
> [  +0.000001] RBP: ffff942d923c0000 R08: ffffb0ee864b3ac0 R09:
> ffff942d0e4d0000
> [  +0.000001] R10: ffff942d0d628000 R11: 0000000100000001 R12:
> ffff942d0e4d0000
> [  +0.000000] R13: 0000000000000000 R14: ffff942d0cda4800 R15:
> ffff942d923c0000
> [  +0.000001] FS:  00007f353dc58940(0000) GS:ffff943bfee00000(0000)
> knlGS:0000000000000000
> [  +0.000001] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.000001] CR2: 0000561752847ef0 CR3: 000000013f944000 CR4:
> 0000000000350ee0
> [  +0.000001] Call Trace:
> [  +0.000003]  dcn20_validate_bandwidth+0x29/0x40 [amdgpu]
> [  +0.000135]  dc_validate_global_state+0x2f2/0x390 [amdgpu]
> [  +0.000115]  amdgpu_dm_atomic_check+0xbb3/0xcc0 [amdgpu]
> [  +0.000117]  drm_atomic_check_only+0x5db/0x8d0 [drm]
> [  +0.000018]  drm_atomic_commit+0x13/0x50 [drm]
> [  +0.000015]  drm_mode_atomic_ioctl+0x934/0xaf0 [drm]
> [  +0.000016]  ? drm_mode_obj_get_properties_ioctl+0x13f/0x1a0 [drm]
> [  +0.000017]  ? drm_atomic_set_property+0xb30/0xb30 [drm]
> [  +0.000015]  drm_ioctl_kernel+0xb2/0x100 [drm]
> [  +0.000015]  drm_ioctl+0x215/0x390 [drm]
> [  +0.000014]  ? drm_atomic_set_property+0xb30/0xb30 [drm]
> [  +0.000015]  amdgpu_drm_ioctl+0x49/0x80 [amdgpu]
> [  +0.000084]  __x64_sys_ioctl+0x83/0xb0
> [  +0.000003]  do_syscall_64+0x33/0x40
> [  +0.000004]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  +0.000002] RIP: 0033:0x7f353e97fe6b
> [  +0.000001] Code: ff ff ff 85 c0 79 8b 49 c7 c4 ff ff ff ff 5b 5d 4c 89 e0
> 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 73 01 c3 48 8b 0d d5 af 0c 00 f7 d8 64 89 01 48
> [  +0.000001] RSP: 002b:00007fff17b6abc8 EFLAGS: 00000246 ORIG_RAX:
> 0000000000000010
> [  +0.000001] RAX: ffffffffffffffda RBX: 00007fff17b6ac10 RCX:
> 00007f353e97fe6b
> [  +0.000001] RDX: 00007fff17b6ac10 RSI: 00000000c03864bc RDI:
> 0000000000000009
> [  +0.000001] RBP: 00000000c03864bc R08: 0000000000000003 R09:
> 0000000000000003
> [  +0.000001] R10: 00007f353ea4ba00 R11: 0000000000000246 R12:
> 0000561752e57640
> [  +0.000000] R13: 0000000000000009 R14: 0000561752db2a90 R15:
> 00005617528055f0
> [  +0.000002] ---[ end trace 9c14d3bba9da5187 ]---

No clue what it means, and my GPU is still working in spite of this dump. Just
pasting it here in case it's useful to someone. If it's not, please delete this
report.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
