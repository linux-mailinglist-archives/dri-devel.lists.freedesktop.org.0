Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3270A2C3
	for <lists+dri-devel@lfdr.de>; Sat, 20 May 2023 00:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9233C10E0DC;
	Fri, 19 May 2023 22:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9494710E0DC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 22:24:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7CE560D14
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 22:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 570E5C433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684535047;
 bh=gyLom+hCb8Xm6NkBtoo83P6R3ubivtin+u2dSWjAVdQ=;
 h=From:To:Subject:Date:From;
 b=hlNew3TP337i+Rxgigr0x0s98GBiNs3wGUCHor/x1rLrt30pbbOR2dsawOlGGnzrV
 vXL47YOMzHR97uBWvXHxXeHbMJBDQ+SArQ3sVUxDULzJRDsLxJnqBNLA9UFf3QVKBr
 cNPkUNS2FYJMJpeZW/guEqnvYzbzQU3QZsxDNU5YiF++TvuHMn7JeiUaXX0hmw9Xie
 EwMZYPENcYcqQkBc6xhgvHvI9i7+SJy6ChqXF0OAcSQYJfzcMezeiCtZVBCYN2iOig
 ed9tAGFIp7hp68eW3+j2k1g5Iv5u4iOFeKbHUeGnJUGash21EenD23vh82aSYWAZHd
 wy1ImM4HWwbbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3F705C43143; Fri, 19 May 2023 22:24:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217464] New: Radeon Driver Crash
Date: Fri, 19 May 2023 22:24:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: neilsikka@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217464-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217464

            Bug ID: 217464
           Summary: Radeon Driver Crash
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: neilsikka@gmail.com
        Regression: No

I have a Dell Precision M4800 laptop running Debian with a custom built van=
illa
kernel 6.3.3 taken from kernel.org with this GPU shown in lspci:

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] V=
enus
XT [Radeon HD 8870M / R9 M270X/M370X] (rev ff)

I have HDMI out connected to my TV to play video games and watch movies, wi=
th
the laptop lid shut. Whenever I play a 3D OpenGL game or use VLC to watch
videos with hardware rendering enabled, I get a driver crash after a few
minutes (more frequently and reliably reproduced with the OpenGL video game=
).
The kernel stays up and I can ssh into it, but the TV screen loses signal.
Heres the dmesg output:

[30834.383138] radeon 0000:01:00.0: ring 0 stalled for more than 10236msec
[30834.383144] radeon 0000:01:00.0: GPU lockup (current fence id
0x000000000006080c last fence id 0x0000000000060812 on ring 0)
[30835.171667] BUG: unable to handle page fault for address: ffffae54809f1f=
fc
[30835.171672] #PF: supervisor read access in kernel mode
[30835.171674] #PF: error_code(0x0000) - not-present page
[30835.171675] PGD 100000067 P4D 100000067 PUD 0=20
[30835.171678] Oops: 0000 [#1] PREEMPT SMP PTI
[30835.171680] CPU: 0 PID: 13942 Comm: kworker/0:2H Tainted: G        W   E=
=20=20=20=20
 6.3.3 #6
[30835.171683] Hardware name: Dell Inc. Precision M4800/0T3YTY, BIOS A09
06/26/2014
[30835.171684] Workqueue: radeon-crtc radeon_flip_work_func [radeon]
[30835.171731] RIP: 0010:radeon_ring_backup+0xc4/0x140 [radeon]
[30835.171764] Code: cd 49 89 06 48 85 c0 74 6d 41 8d 7c 24 ff 31 d2 48 c1 =
e7
02 eb 07 49 8b 06 48 83 c2 04 48 8b 75 10 8d 4b 01 89 db 48 8d 34 9e <8b> 3=
6 89
34 10 23 4d 5c 89 cb 48 39 d7 75 dd 4c 89 ef e8 85 b7 b2
[30835.171766] RSP: 0018:ffffae5083217d60 EFLAGS: 00010206
[30835.171768] RAX: ffff8907ce600000 RBX: 00000000ffffffff RCX:
0000000000000000
[30835.171769] RDX: 0000000000000000 RSI: ffffae54809f1ffc RDI:
00000000000cb400
[30835.171770] RBP: ffff8905018895c0 R08: 0000000000000000 R09:
0000000000000006
[30835.171771] R10: 0000000000000002 R11: 0000000000000100 R12:
0000000000032d01
[30835.171772] R13: ffff8905018895a0 R14: ffffae5083217dc0 R15:
ffff890501888000
[30835.171774] FS:  0000000000000000(0000) GS:ffff89081dc00000(0000)
knlGS:0000000000000000
[30835.171775] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[30835.171776] CR2: ffffae54809f1ffc CR3: 000000037a61a003 CR4:
00000000001706f0
[30835.171777] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[30835.171778] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[30835.171779] Call Trace:
[30835.171791]  <TASK>
[30835.171794]  radeon_gpu_reset+0xb3/0x300 [radeon]
[30835.171827]  ? radeon_fence_wait_timeout+0x7c/0xe0 [radeon]
[30835.171854]  radeon_flip_work_func+0x201/0x260 [radeon]
[30835.171884]  ? __schedule+0x3c7/0xaa0
[30835.171888]  process_one_work+0x1e5/0x3f0
[30835.171891]  ? __pfx_worker_thread+0x10/0x10
[30835.171893]  worker_thread+0x54/0x3a0
[30835.171894]  ? __pfx_worker_thread+0x10/0x10
[30835.171895]  kthread+0xdc/0x100
[30835.171898]  ? __pfx_kthread+0x10/0x10
[30835.171900]  ret_from_fork+0x2c/0x50
[30835.171904]  </TASK>
[30835.171905] Modules linked in: intel_rapl_msr(E) intel_rapl_common(E)
x86_pkg_temp_thermal(E) intel_powerclamp(E) coretemp(E) kvm_intel(E) kvm(E)
irqbypass(E) ghash_clmulni_intel(E) iwldvm(E) sha512_ssse3(E) sha512_generi=
c(E)
snd_hda_codec_realtek(E) snd_hda_codec_generic(E) mac80211(E) ledtrig_audio=
(E)
uvcvideo(E) snd_hda_codec_hdmi(E) libarc4(E) aesni_intel(E)
videobuf2_vmalloc(E) uvc(E) snd_hda_intel(E) libaes(E) videobuf2_memops(E)
snd_soc_rt5640(E) snd_intel_dspcfg(E) mei_wdt(E) mei_hdcp(E) crypto_simd(E)
videobuf2_v4l2(E) snd_usb_audio(E) snd_intel_sdw_acpi(E) snd_soc_rl6231(E)
iwlwifi(E) cryptd(E) snd_hda_codec(E) snd_usbmidi_lib(E) videodev(E)
snd_soc_core(E) rapl(E) snd_hda_core(E) iTCO_wdt(E) snd_rawmidi(E) tpm_tis(=
E)
dell_smm_hwmon(E) intel_cstate(E) mei_me(E) snd_seq_device(E)
videobuf2_common(E) snd_compress(E) snd_hwdep(E) intel_pmc_bxt(E)
tpm_tis_core(E) cfg80211(E) snd_pcm(E) iTCO_vendor_support(E) joydev(E) mc(=
E)
intel_uncore(E) watchdog(E) snd_timer(E) sg(E) mei(E) wmi_bmof(E) at24(E)
rfkill(E)
[30835.171939]  serio_raw(E) pcspkr(E) tpm(E) snd(E) rng_core(E) soundcore(=
E)
evdev(E) ac(E) parport_pc(E) ppdev(E) lp(E) parport(E) fuse(E) configfs(E)
ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E) crc16(E)
mbcache(E) jbd2(E) amdgpu(E) drm_buddy(E) gpu_sched(E) sd_mod(E) t10_pi(E)
hid_generic(E) crc64_rocksoft(E) crc64(E) sr_mod(E) crc_t10dif(E)
crct10dif_generic(E) cdrom(E) usbhid(E) hid(E) radeon(E) i2c_algo_bit(E)
ahci(E) drm_display_helper(E) libahci(E) cec(E) drm_ttm_helper(E) sdhci_pci=
(E)
xhci_pci(E) e1000e(E) libata(E) ttm(E) cqhci(E) crct10dif_pclmul(E) xhci_hc=
d(E)
crct10dif_common(E) ehci_pci(E) ptp(E) scsi_mod(E) drm_kms_helper(E)
crc32_pclmul(E) sdhci(E) i2c_i801(E) ehci_hcd(E) crc32c_intel(E) psmouse(E)
lpc_ich(E) i2c_smbus(E) scsi_common(E) mmc_core(E) usbcore(E) drm(E)
pps_core(E) usb_common(E) battery(E) video(E) wmi(E) button(E)
[30835.171975] Unloaded tainted modules: snd_pcsp(E):1 ie31200_edac(E):1
pcc_cpufreq(E):2 acpi_cpufreq(E):2 fjes(E):2
[30835.171981] CR2: ffffae54809f1ffc
[30835.171983] ---[ end trace 0000000000000000 ]---
[30835.171984] RIP: 0010:radeon_ring_backup+0xc4/0x140 [radeon]
[30835.172016] Code: cd 49 89 06 48 85 c0 74 6d 41 8d 7c 24 ff 31 d2 48 c1 =
e7
02 eb 07 49 8b 06 48 83 c2 04 48 8b 75 10 8d 4b 01 89 db 48 8d 34 9e <8b> 3=
6 89
34 10 23 4d 5c 89 cb 48 39 d7 75 dd 4c 89 ef e8 85 b7 b2
[30835.172018] RSP: 0018:ffffae5083217d60 EFLAGS: 00010206
[30835.172019] RAX: ffff8907ce600000 RBX: 00000000ffffffff RCX:
0000000000000000
[30835.172020] RDX: 0000000000000000 RSI: ffffae54809f1ffc RDI:
00000000000cb400
[30835.172021] RBP: ffff8905018895c0 R08: 0000000000000000 R09:
0000000000000006
[30835.172022] R10: 0000000000000002 R11: 0000000000000100 R12:
0000000000032d01
[30835.172023] R13: ffff8905018895a0 R14: ffffae5083217dc0 R15:
ffff890501888000
[30835.172024] FS:  0000000000000000(0000) GS:ffff89081dc00000(0000)
knlGS:0000000000000000
[30835.172025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[30835.172026] CR2: ffffae54809f1ffc CR3: 000000037a61a003 CR4:
00000000001706f0
[30835.172027] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[30835.172028] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[30835.172029] note: kworker/0:2H[13942] exited with irqs disabled

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
