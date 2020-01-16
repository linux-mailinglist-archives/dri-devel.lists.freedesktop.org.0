Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8539713DF86
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 17:03:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778806EDAB;
	Thu, 16 Jan 2020 16:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7A56EDAB
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 16:03:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206225] New: nouveau: Screen distortion and lockup on resume
Date: Thu, 16 Jan 2020 16:03:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: derchiller-foren@online.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206225-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206225

            Bug ID: 206225
           Summary: nouveau: Screen distortion and lockup on resume
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.12
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: derchiller-foren@online.de
        Regression: No

When starting suspend or hibernate, it takes approx. 2 mins until the system
actually begins to write RAM contents to disk (when hibernating), although the
screen is switched off immediately.

When resuming, video is completely distorted. Sometimes I am able to restart
Gnome via Alt+F2 or to switch to a VT, but sometimes the system doesn't react
at all.

Syslog contains nouveau errors:

kernel: [10576.555245] nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 0 MP 0:
00000010 [INVALID_OPCODE] at 07fe80 warp 0, opcode f6bfffbf ffffffff
kernel: [10576.555266] nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 0 MP 1:
00000010 [INVALID_OPCODE] at 07fec0 warp 1, opcode fffffffe ffffffff
kernel: [10576.555293] nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 0:
00000010 [INVALID_OPCODE] at 07f540 warp 0, opcode ffffffff ffffdfff
kernel: [10576.555310] nouveau 0000:01:00.0: gr: TRAP_MP_EXEC - TP 1 MP 1:
00000010 [INVALID_OPCODE] at 07f540 warp 0, opcode ffffffff ffffdfff
kernel: [10576.555315] nouveau 0000:01:00.0: gr: 00200000 [] ch 3 [003f8a4000
Xorg[717]] subc 3 class 8297 mthd 15e0 data 00000000

On last resume from hibernate, it additionally contained a call trace
associated with nouveau:

kernel: [ 9985.949290] Trying to vfree() bad address (00000000f5be47e6)
kernel: [ 9985.949282] ------------[ cut here ]------------
kernel: [ 9985.949313] WARNING: CPU: 0 PID: 824 at mm/vmalloc.c:2234
__vunmap+0x1e6/0x210
kernel: [ 9985.949314] Modules linked in: nls_ascii(E) nls_cp437(E) vfat(E)
fat(E) uas(E) usb_storage(E) ctr(E) ccm(E) rfcomm(E) cmac(E) bnep(E)
iTCO_wdt(E) iTCO_vendor_support(E) watchdog(E) fuse(E) btusb(E) btrtl(E)
btbcm(E) iwlmvm(E) acer_wmi(E) sparse_keymap(E) btintel(E) mac80211(E)
libarc4(E) iwlwifi(E) wmi_bmof(E) mxm_wmi(E) hid_multitouch(E) i2c_i801(E)
uvcvideo(E) videobuf2_vmalloc(E) videobuf2_memops(E) videobuf2_v4l2(E)
bluetooth(E) snd_hda_codec_hdmi(E) sr_mod(E) cdrom(E) videodev(E)
snd_hda_codec_realtek(E) snd_hda_codec_generic(E) ledtrig_audio(E)
snd_hda_intel(E) videobuf2_common(E) snd_intel_nhlt(E) snd_hda_codec(E)
lpc_ich(E) mfd_core(E) drbg(E) snd_hwdep(E) snd_hda_core(E) ansi_cprng(E)
snd_pcm(E) ecdh_generic(E) ecc(E) jmb38x_ms(E) xhci_pci(E) sdhci_pci(E)
snd_timer(E) cqhci(E) cfg80211(E) memstick(E) sdhci(E) rfkill(E) snd(E)
ehci_pci(E) xhci_hcd(E) soundcore(E) mmc_core(E) iosf_mbi(E) acpi_cpufreq(E)
binfmt_misc(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E)
kernel: [ 9985.949363]  crc16(E) mbcache(E) jbd2(E) sd_mod(E) hid_generic(E)
usbhid(E) hid(E) ahci(E) libahci(E) libata(E) serio_raw(E) scsi_mod(E)
nouveau(E) uhci_hcd(E) ehci_hcd(E) usbcore(E) ttm(E) wmi(E) evdev(E)
kernel: [ 9985.949381] CPU: 0 PID: 824 Comm: gnome-shell Tainted: G        W  
E     5.4.12 #1
kernel: [ 9985.949383] Hardware name: Acer, inc. Aspire 7730G     /Mammoth     
    , BIOS v0.3636 03/10/2009
kernel: [ 9985.949386] RIP: 0010:__vunmap+0x1e6/0x210
kernel: [ 9985.949389] Code: 41 5d 41 5e e9 9b 58 02 00 31 d2 31 f6 48 c7 c7 ff
ff ff ff e8 eb fc ff ff eb b5 48 89 fe 48 c7 c7 88 50 97 ab e8 c8 39 e7 ff <0f>
0b 5b 5d 41 5c 41 5d 41 5e c3 4c 89 e6 48 c7 c7 b0 50 97 ab e8
kernel: [ 9985.949391] RSP: 0018:ffffb528033ebc08 EFLAGS: 00010286
kernel: [ 9985.949394] RAX: 0000000000000000 RBX: ffff9f3771eb2180 RCX:
0000000000000006
kernel: [ 9985.949396] RDX: 0000000000000007 RSI: 0000000000000096 RDI:
ffff9f377ba16540
kernel: [ 9985.949398] RBP: 0000000000000720 R08: ffffb528033ebabd R09:
00000000000004f1
kernel: [ 9985.949400] R10: 0000000000000008 R11: ffffb528033ebabd R12:
ffff9f3771f71720
kernel: [ 9985.949401] R13: 0000091508ee4d8d R14: 0000000000000000 R15:
00000000000000ff
kernel: [ 9985.949404] FS:  0000000000000000(0000) GS:ffff9f377ba00000(0000)
knlGS:0000000000000000
kernel: [ 9985.949406] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
kernel: [ 9985.949408] CR2: 000055f8c838e020 CR3: 000000010c1c6000 CR4:
00000000000406f0
kernel: [ 9985.949410] Call Trace:
kernel: [ 9985.949489]  nvkm_umem_unmap+0x49/0x60 [nouveau]
kernel: [ 9985.949521]  nvkm_object_dtor+0x99/0x100 [nouveau]
kernel: [ 9985.949550]  nvkm_object_del+0x20/0xa0 [nouveau]
kernel: [ 9985.949578]  nvkm_ioctl_del+0x37/0x50 [nouveau]
kernel: [ 9985.949606]  nvkm_ioctl+0xdf/0x180 [nouveau]
kernel: [ 9985.949635]  nvif_object_fini+0x59/0x80 [nouveau]
kernel: [ 9985.949669]  nouveau_mem_fini+0x53/0x70 [nouveau]
kernel: [ 9985.949705]  nouveau_mem_del+0x11/0x30 [nouveau]
kernel: [ 9985.949711]  ttm_bo_put+0x26e/0x2d0 [ttm]
kernel: [ 9985.949746]  nouveau_gem_object_del+0x51/0x80 [nouveau]
kernel: [ 9985.949750]  drm_gem_object_release_handle+0x70/0x90
kernel: [ 9985.949753]  ? drm_gem_object_handle_put_unlocked+0xa0/0xa0
kernel: [ 9985.949757]  idr_for_each+0x5e/0xd0
kernel: [ 9985.949761]  drm_gem_release+0x1c/0x30
kernel: [ 9985.949763]  drm_file_free.part.0+0x230/0x280
kernel: [ 9985.949766]  drm_release+0xa7/0xe0
kernel: [ 9985.949769]  __fput+0xb9/0x250
kernel: [ 9985.949774]  task_work_run+0x89/0xa0
kernel: [ 9985.949777]  exit_to_usermode_loop+0xb6/0xc0
kernel: [ 9985.949780]  do_syscall_64+0x13f/0x150
kernel: [ 9985.949784]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
kernel: [ 9985.949787] RIP: 0033:0x7fd77d831090
kernel: [ 9985.949794] Code: Bad RIP value.
kernel: [ 9985.949796] RSP: 002b:00007ffff3ade1d0 EFLAGS: 00000200 ORIG_RAX:
000000000000003b
kernel: [ 9985.949798] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000000
kernel: [ 9985.949800] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
kernel: [ 9985.949802] RBP: 0000000000000000 R08: 0000000000000000 R09:
0000000000000000
kernel: [ 9985.949803] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000000
kernel: [ 9985.949805] R13: 0000000000000000 R14: 0000000000000000 R15:
0000000000000000
kernel: [ 9985.949808] ---[ end trace 542952d6d128998b ]---

I already encountered that issue on 5.3.9 and it vanished after installing
Debian package 'firmware-misc-nonfree', but now with 5.4.12, it is back again,
while 5.4.11 was ok.

I should mention that even with 5.4.12, this only happens after having worked
with the system for a while, not when suspending/hibernating immediately after
startup.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
