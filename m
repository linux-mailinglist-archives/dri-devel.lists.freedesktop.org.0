Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA614FAD6
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2020 23:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1E76E43D;
	Sat,  1 Feb 2020 22:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764B96E43D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2020 22:42:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206385] New: [drm] [amdgpu] system freeze during shutdown
Date: Sat, 01 Feb 2020 22:42:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rw_iw@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206385-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206385

            Bug ID: 206385
           Summary: [drm] [amdgpu] system freeze during shutdown
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.16, 5.3.18, 5.3.0
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: rw_iw@yahoo.com
        Regression: No

Created attachment 287063
  --> https://bugzilla.kernel.org/attachment.cgi?id=287063&action=edit
dmesg

Hi

I have regular system freeze (hang).

The way to reproduce:
X session, relatively long video stream play

System hangs (SysRq useless) when:
1. Shutdown
2. Switch to console (Ctrl+Alt+F2) and back (Ctrl+Alt+F1)

Hardware:
ASUS FX505DD-AL124, AMD Ryzen 5 3550H, 8G, Nvidia 1050

dmesg:
[14535.803486] [drm] REG_WAIT timeout 10us * 200000 tries -
rv1_vbios_smu_send_msg_with_param line:82
[14535.803522] ------------[ cut here ]------------
[14535.803615] WARNING: CPU: 0 PID: 5028 at
drivers/gpu/drm/amd/amdgpu/../display/dc/dc_helper.c:332
generic_reg_wait.cold+0x24/0x2b [amdgpu]
[14535.803616] Modules linked in: btrfs xor zstd_compress raid6_pq ufs qnx4
hfsplus hfs minix ntfs msdos jfs xfs libcrc32c uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev mc snd_hda_codec_hdmi
binfmt_misc nls_iso8859_1 snd_hda_codec_realtek snd_hda_codec_generic
ledtrig_audio snd_hda_intel snd_intel_nhlt snd_hda_codec snd_hda_core snd_hwdep
snd_pcm snd_seq_midi snd_seq_midi_event snd_rawmidi joydev snd_seq 8821ce(OE)
edac_mce_amd snd_seq_device kvm_amd ccp kvm snd_timer irqbypass cfg80211
input_leds wmi_bmof asus_nb_wmi asus_wmi serio_raw sparse_keymap snd
hid_multitouch soundcore k10temp asus_wireless mac_hid nvidia_uvm(OE)
sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables autofs4
nvidia_drm(POE) nvidia_modeset(POE) hid_generic amdgpu crct10dif_pclmul
nvidia(POE) crc32_pclmul ghash_clmulni_intel amd_iommu_v2 gpu_sched
i2c_algo_bit nvme ttm aesni_intel drm_kms_helper crypto_simd syscopyarea
sysfillrect cryptd sysimgblt fb_sys_fops glue_helper drm
[14535.803648]  r8169 ipmi_devintf i2c_piix4 nvme_core realtek ipmi_msghandler
wmi video i2c_hid hid
[14535.803655] CPU: 0 PID: 5028 Comm: Xorg Tainted: P           OE     5.4.16
#1
[14535.803656] Hardware name: ASUSTeK COMPUTER INC. TUF Gaming
FX505DD_FX505DD/FX505DD, BIOS FX505DD.308 09/19/2019
[14535.803738] RIP: 0010:generic_reg_wait.cold+0x24/0x2b [amdgpu]
[14535.803740] Code: d0 e9 d4 19 fe ff 44 8b 45 20 8b 55 10 44 89 e6 48 c7 c7
40 b5 e9 c1 48 8b 4d 18 e8 d4 1e 74 e7 83 7b 20 01 0f 84 89 27 fe ff <0f> 0b e9
82 27 fe ff 55 48 89 e5 e8 27 54 e8 ff 48 c7 c7 00 40 eb
[14535.803741] RSP: 0018:ffffae8cc11f7670 EFLAGS: 00010297
[14535.803743] RAX: 0000000000000056 RBX: ffff9b05c2392680 RCX:
0000000000000000
[14535.803744] RDX: 0000000000000000 RSI: ffff9b05d7217448 RDI:
ffff9b05d7217448
[14535.803745] RBP: ffffae8cc11f76b0 R08: ffff9b05d7217448 R09:
0000000000000004
[14535.803746] R10: 0000000000000000 R11: 0000000000000001 R12:
000000000000000a
[14535.803746] R13: 000000000001629b R14: 0000000000030d41 R15:
0000000000000001
[14535.803748] FS:  00007f3cf9aeea80(0000) GS:ffff9b05d7200000(0000)
knlGS:0000000000000000
[14535.803749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[14535.803750] CR2: 00007f3ca24fea00 CR3: 0000000213826000 CR4:
00000000003406f0
[14535.803751] Call Trace:
[14535.803839]  rv1_vbios_smu_send_msg_with_param+0xa9/0x1d0 [amdgpu]
[14535.803922]  rv1_vbios_smu_set_dispclk+0x44/0xd0 [amdgpu]
[14535.804002]  rv1_update_clocks+0x237/0x490 [amdgpu]
[14535.804082]  dcn10_prepare_bandwidth+0x63/0x130 [amdgpu]
[14535.804157]  dc_commit_updates_for_stream+0xec5/0x14c0 [amdgpu]
[14535.804171]  ? drm_vblank_enable+0x111/0x130 [drm]
[14535.804251]  amdgpu_dm_atomic_commit_tail+0xb5e/0x1d70 [amdgpu]

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
