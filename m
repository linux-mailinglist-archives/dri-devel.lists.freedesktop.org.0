Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3643B6A7836
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 01:07:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8310410E02A;
	Thu,  2 Mar 2023 00:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FD210E02A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 00:07:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 572B6B81193
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 00:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1555AC433D2
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 00:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677715658;
 bh=flM/8sZF6X4AL9MerFvDMS4JdHJAeADSZSRiiy+TE3I=;
 h=From:To:Subject:Date:From;
 b=BQdzSg5XPS/4A+btCUXa3GJcoFozWIVRVQeE4JPGk/358Kid4xsJtTmLcvXvyWx+t
 EaUpXQE8akUuvRB6d+At9B5gDBpVQy4zBNX9n3Yp5gwHjkLv9SIDyI5Kdnz2JPQ2V8
 qacK1+J2T/cL8nvMQMRWb8OH8DyNTdrzUK+ZAiJtGT1EqymkAkzHp/IJzKArfN2izK
 TFOSjv9vXeSOuyta1Ne2q/oYLZ7Shctq3gWBVVgsO/CZjvQENNo2duiZoHe0Ja82Ls
 RgaMe9YkzEdeFifo/68BUVZEMpXcI6ga+sEVPsM0QfwaFgnEqcthOuNl21eopWdivJ
 BlIAd0n53e+2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0493EC43141; Thu,  2 Mar 2023 00:07:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217110] New: GPU Lockup on Radeon Pitcairn - VAAPI related
Date: Thu, 02 Mar 2023 00:07:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edman007@edman007.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217110-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217110

            Bug ID: 217110
           Summary: GPU Lockup on Radeon Pitcairn - VAAPI related
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.10
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: edman007@edman007.com
        Regression: No

Created attachment 303827
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303827&action=3Dedit
netconsole-kernel.log

Just some overview on my setup, I have chromium setup to use VAAPI decoding,
also, I'm developing an application that uses libavcodec vaapi. This seems
fairly reproducible, across all recent kernels I've used in the last few
months, I can typically reproduce it within a day. It seems related to
initializing VA-API, somehow related to opening chromeim, watch youtube, run
another application with va-api, close chrome, and repeat. When va-api
initializes there is a good chance the GPU locks up and the system becomes
unresponsive (I can't ssh in, but I can tell some USB things are not 100%
dead). This does not happen if you just open and close one application (it
might matter that two different applications use va-api at the same time?)

Anyways my setup:
Distro: Slackware-current
Kernel: Linux caterpillar 6.1.10 #1 SMP PREEMPT_DYNAMIC Mon Feb  6 14:14:20=
 CST
2023 x86_64 Intel(R) Core(TM) i7-4930K CPU @ 3.40GHz GenuineIntel GNU/Linux
GPU: 01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/A=
TI]
Curacao XT / Trinidad XT [Radeon R7 370 / R9 270X/370X] (Xorg says Pictaria=
n)
Xorg driver: radeonsi (required for vaapi on their card)

full dmesg is attached (obtained via netconsole, as this kills the system) =
is
attached. the first line with the power state error is probably unrelated (=
it
happens when the monitor wakes from sleep, and was hours before the crash)

The backtrace is here and in the attachment


4,1439,265142482724,-;WARNING: CPU: 7 PID: 21050 at
drivers/gpu/drm/radeon/radeon_object.c:62 radeon_ttm_bo_destroy+0xd2/0xe0
[radeon]
4,1440,265142482775,-,ncfrag=3D0/983;Modules linked in: cdc_acm netconsole =
fuse
tun it87 hwmon_vid ip6table_filter ip6_tables iptable_filter ip_tables x_ta=
bles
autofs4 efivarfs cfg80211 rfkill
 8021q garp mrp bridge stp llc ipv6 amdgpu iommu_v2 gpu_sched drm_buddy
ir_rc6_decoder rc_rc6_mce hid_picolcd lcd snd_usb_audio snd_usbmidi_lib
ftdi_sio snd_rawmidi usbserial snd_seq_device=20
usblp joydev hid_generic uas usbhid usb_storage hid rc_hauppauge ir_kbd_i2c
ivtv_alsa rc_core tuner_simple tuner_types intel_rapl_msr intel_rapl_common
x86_pkg_temp_thermal intel_powerclamp=20
wm8775 mxm_wmi evdev coretemp tuner snd_hda_codec_realtek radeon
snd_hda_codec_generic ledtrig_audio video drm_ttm_helper snd_hda_codec_hdmi=
 ttm
kvm_intel drm_display_helper snd_hda_intel sn
d_intel_dspcfg cx25840 drm_kms_helper snd_intel_sdw_acpi snd_hda_codec kvm =
ivtv
drm snd_hda_core irqbypass cx2341x crct10dif_pclmul crc32_pclmul tveeprom
polyval_clmulni polyval_generic snd_
hwdep ghash_clmulni_intel agpgart videodev
sha512_4,1440,265142482775,-,ncfrag=3D965/983;ssse3 fb_sys_fops
4,1441,265142482852,c; snd_pcm syscopyarea i2c_i801 xhci_pci mc snd_timer
xhci_pci_renesas sysfillrect rapl i2c_smbus i2c_algo_bit sysimgblt mei_me s=
nd
lpc_ich ehci_pci ioatdma intel_cstate=20
xhci_hcd i2c_core mfd_core e1000e soundcore ehci_hcd mei dca wmi button loop
4,1442,265142482892,-;CPU: 7 PID: 21050 Comm: chromium Not tainted 6.1.10 #1
4,1443,265142482897,-;Hardware name: Gigabyte Technology Co., Ltd. To be fi=
lled
by O.E.M./X79-UP4, BIOS F7 03/19/2014
4,1444,265142482903,-;RIP: 0010:radeon_ttm_bo_destroy+0xd2/0xe0 [radeon]
4,1445,265142482942,-;Code: 00 00 00 74 0f 48 8b b3 a8 01 00 00 48 89 df e8=
 84
6f 7b ff 48 89 df e8 bc 66 7a ff 4c 89 e7 5b 5d 41 5c 41 5d e9 9e de 1a da =
<0f>
0b eb cd 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 81 bf
4,1446,265142482949,-;RSP: 0018:ffffb74a83693bd0 EFLAGS: 00010297
4,1447,265142482955,-;RAX: ffff95c80b202668 RBX: ffff95c80b202478 RCX:
000000008020001f
4,1448,265142482960,-;RDX: ffff95c7b667ad80 RSI: 0000000000000001 RDI:
ffff95c7471f9cc8
4,1449,265142482965,-;RBP: ffffffffffffffff R08: 0000000000000000 R09:
ffffffffc0a50201
4,1450,265142482969,-;R10: ffff95c766c04688 R11: 0000000000000000 R12:
ffff95c80b202400
4,1464,265142483209,-; drm_file_free.part.0+0x1d9/0x2b0 [drm]
4,1465,265142483242,-; drm_release+0x64/0xd0 [drm]
4,1466,265142483275,-; __fput+0x89/0x250
4,1451,265142482973,-;R13: 0000000000000001 R14: ffff95c7b7db7a40 R15:
ffff95cbe6f74028
4,1467,265142483284,-; task_work_run+0x59/0x90
4,1452,265142482978,-;FS:  0000000000000000(0000) GS:ffff95d24fbc0000(0000)
knlGS:0000000000000000
4,1468,265142483291,-; do_exit+0x335/0xa80
4,1453,265142482983,-;CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
4,1454,265142482988,-;CR2: 000055bdabf78210 CR3: 000000010960e004 CR4:
00000000001706e0
4,1455,265142482992,-;Call Trace:
4,1456,265142482999,-; <TASK>
4,1457,265142483004,-; radeon_bo_unref+0x1a/0x30 [radeon]
4,1458,265142483042,-; radeon_gem_object_free+0x30/0x50 [radeon]
4,1459,265142483081,-; drm_gem_object_release_handle+0x50/0x60 [drm]
4,1460,265142483124,-; ? drm_gem_object_handle_put_unlocked+0xf0/0xf0 [drm]
4,1461,265142483156,-; idr_for_each+0x5e/0xe0
4,1462,265142483166,-; ? ktime_get_mono_fast_ns+0x3d/0x90
4,1463,265142483175,-; drm_gem_release+0x1c/0x30 [drm]
4,1469,265142483298,-; ? radeon_gem_wait_idle_ioctl+0xb4/0x100 [radeon]
4,1470,265142483339,-; do_group_exit+0x2d/0x80
4,1471,265142483346,-; get_signal+0x953/0x960
4,1472,265142483355,-; ? radeon_gem_busy_ioctl+0xb0/0xb0 [radeon]
4,1473,265142483394,-; arch_do_signal_or_restart+0x30/0x710
4,1474,265142483403,-; ? __rseq_handle_notify_resume+0xa6/0x480
4,1475,265142483409,-; ? __pm_runtime_suspend+0x6a/0x100
4,1476,265142483417,-; exit_to_user_mode_prepare+0xca/0x190
4,1477,265142483424,-; syscall_exit_to_user_mode+0x1d/0x40
4,1478,265142483432,-; do_syscall_64+0x46/0x90
4,1479,265142483437,-; entry_SYSCALL_64_after_hwframe+0x63/0xcd
4,1480,265142483442,-;RIP: 0033:0x7f20bcad84e8
4,1481,265142483446,-;Code: Unable to access opcode bytes at 0x7f20bcad84be.
4,1482,265142483449,-;RSP: 002b:00007ffd48fb2f18 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
4,1483,265142483454,-;RAX: fffffffffffffff5 RBX: 000028c403117180 RCX:
00007f20bcad84e8
4,1484,265142483458,-;RDX: 00007ffd48fb2f68 RSI: 0000000040086464 RDI:
0000000000000017
4,1485,265142483463,-;RBP: 00007ffd48fb2f68 R08: 0000000000000000 R09:
ffffffffffffffff
4,1486,265142483466,-;R10: 0000000000000000 R11: 0000000000000246 R12:
0000000040086464
4,1487,265142483471,-;R13: 0000000000000017 R14: 000028c400226e00 R15:
0000000000000000
4,1488,265142483476,-; </TASK>
4,1489,265142483480,-;---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
