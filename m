Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F796209B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C0EF89DFA;
	Mon,  8 Jul 2019 14:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DCEE89DFA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 14:38:02 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 249E072167; Mon,  8 Jul 2019 14:38:02 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111089] Multiple calls to ddcutil cause hard process hangs from
 within the DRM/i2c system
Date: Mon, 08 Jul 2019 14:38:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick@nickvahalik.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111089-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============2127828324=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2127828324==
Content-Type: multipart/alternative; boundary="15625966820.BdC5411D.16242"
Content-Transfer-Encoding: 7bit


--15625966820.BdC5411D.16242
Date: Mon, 8 Jul 2019 14:38:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111089

            Bug ID: 111089
           Summary: Multiple calls to ddcutil cause hard process hangs
                    from within the DRM/i2c system
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: nick@nickvahalik.com

Recently found out that my monitors can be controlled via DDC and so I have
been playing around with using ddcutil[1] to control the brightness. e.g.

    /usr/bin/ddcutil -d 1 setvcp 10 50 &
    /usr/bin/ddcutil -d 2 setvcp 10 50 &

Everything works beautifully... until I attempt to set the brightness on bo=
th
of my monitors at the same time. Doing so causes second and subsequent call=
s to
ddcutil to fail and hangs the process such that they cannot be killed and t=
he
system has to be hard reset.

Here is the dmesg dump. I've tested this on 4.16, 4.19 and 4.20 kernels.

The current workaround is to add a brief sleep between calls like this:

    /usr/bin/ddcutil -d 1 setvcp 10 50
    sleep .1
    /usr/bin/ddcutil -d 2 setvcp 10 50

I'm attaching a copy of the backtrace from dmesg. I've also opened a ticket
with ddcutil [2] which may or may not be of help.


[1]: https://github.com/rockowitz/ddcutil
[2]: https://github.com/rockowitz/ddcutil/issues/86


[ 1290.270967] WARNING: CPU: 11 PID: 13323 at
drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.c:64
dal_gpio_open_ex+0x29/0x40 [amdgpu]
[ 1290.270968] Modules linked in: i2c_dev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev media edac_mce_amd
kvm_amd kvm irqbypass snd_hda_codec_realtek nls_iso8859_1 amdgpu
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul
snd_hda_codec snd_usb_audio snd_hda_core snd_usbmidi_lib crc32_pclmul snd_h=
wdep
chash ghash_clmulni_intel amd_iommu_v2 snd_pcm gpu_sched snd_seq_dummy ttm
snd_seq_oss snd_seq_midi drm_kms_helper snd_seq_midi_event snd_rawmidi drm
snd_seq drm_panel_orientation_quirks cfbfillrect cfbimgblt snd_seq_device
aesni_intel snd_timer cfbcopyarea eeepc_wmi fb_sys_fops syscopyarea asus_wmi
aes_x86_64 snd sysfillrect crypto_simd sparse_keymap input_leds joydev
sysimgblt cryptd glue_helper mxm_wmi video wmi_bmof soundcore ccp k10temp fb
fbdev mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic usbhid hid igb i2c_algo_bit i2c_piix4 dca nvme i2c_core
ahci nvme_core libahci gpio_amdpt wmi
[ 1290.271002]  gpio_generic
[ 1290.271005] CPU: 11 PID: 13323 Comm: ddcutil Not tainted
4.20.17-042017-generic #201903190933
[ 1290.271006] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 4207 12/07/2018
[ 1290.271075] RIP: 0010:dal_gpio_open_ex+0x29/0x40 [amdgpu]
[ 1290.271076] Code: 00 0f 1f 44 00 00 55 48 83 7f 08 00 48 89 e5 75 19 89 =
77
18 8b 57 14 4c 8d 47 08 89 f1 8b 77 10 48 8b 3f e8 f9 04 00 00 5d c3 <0f> 0=
b e8
e0 1a 87 c3 b8 05 00 00 00 5d c3 66 0f 1f 84 00 00 00 00
[ 1290.271077] RSP: 0018:ffffb2af4fe83b70 EFLAGS: 00010286
[ 1290.271079] RAX: 0000000000000000 RBX: ffff920037f87380 RCX:
0000000000000000
[ 1290.271080] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff920037f87ca0
[ 1290.271080] RBP: ffffb2af4fe83b70 R08: 0000000000000000 R09:
0000000000000001
[ 1290.271081] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1290.271082] R13: 0000000000000000 R14: 0000000000000001 R15:
0000000000000030
[ 1290.271083] FS:  00007fd33ac28b80(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.271084] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.271085] CR2: 00007f762abaa040 CR3: 000000063cfe0000 CR4:
00000000003406e0
[ 1290.271085] Call Trace:
[ 1290.271155]  dal_ddc_open+0x32/0xe0 [amdgpu]
[ 1290.271224]  acquire+0x3b/0x80 [amdgpu]
[ 1290.271286]  dc_link_aux_transfer+0x98/0x150 [amdgpu]
[ 1290.271355]  dm_dp_aux_transfer+0x9f/0x130 [amdgpu]
[ 1290.271361]  drm_dp_i2c_do_msg+0x8b/0x290 [drm_kms_helper]
[ 1290.271367]  drm_dp_i2c_xfer+0xc4/0x250 [drm_kms_helper]
[ 1290.271372]  __i2c_transfer+0x14a/0x450 [i2c_core]
[ 1290.271376]  ? _cond_resched+0x19/0x30
[ 1290.271379]  i2c_transfer+0x5a/0xd0 [i2c_core]
[ 1290.271383]  i2c_transfer_buffer_flags+0x4d/0x70 [i2c_core]
[ 1290.271386]  i2cdev_write+0x56/0xa0 [i2c_dev]
[ 1290.271389]  __vfs_write+0x3a/0x190
[ 1290.271391]  ? apparmor_file_permission+0x1a/0x20
[ 1290.271394]  ? security_file_permission+0x31/0xc0
[ 1290.271396]  vfs_write+0xab/0x1b0
[ 1290.271397]  ksys_write+0x55/0xc0
[ 1290.271399]  __x64_sys_write+0x1a/0x20
[ 1290.271402]  do_syscall_64+0x5a/0x110
[ 1290.271404]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1290.271405] RIP: 0033:0x7fd3398a7154
[ 1290.271407] Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 66 90 48 8d 05 b1 07 2e 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3=
d 00
f0 ff ff 77 54 f3 c3 66 90 41 54 55 49 89 d4 53 48 89 f5
[ 1290.271407] RSP: 002b:00007ffee3079758 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 1290.271409] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007fd3398a7154
[ 1290.271409] RDX: 0000000000000001 RSI: 00007ffee30797b7 RDI:
0000000000000003
[ 1290.271410] RBP: 00007ffee30797b7 R08: 00007ffee31480a0 R09:
00007ffee3148080
[ 1290.271411] R10: 000000000008bdb0 R11: 0000000000000246 R12:
15adf9c617cac805
[ 1290.271411] R13: 0000000000000003 R14: 0000000000000000 R15:
000055d724af4b88
[ 1290.271413] ---[ end trace b558afb76afe3f3f ]---
[ 1290.271420] int3: 0000 [#1] SMP NOPTI
[ 1290.271424] CPU: 11 PID: 13323 Comm: ddcutil Tainted: G        W=20=20=
=20=20=20=20=20=20
4.20.17-042017-generic #201903190933
[ 1290.271425] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 4207 12/07/2018
[ 1290.271429] RIP: 0010:kgdb_breakpoint+0x14/0x20
[ 1290.271431] Code: 00 5d c3 0f 1f 00 0f 1f 44 00 00 55 31 c0 48 89 e5 5d =
c3
0f 1f 00 0f 1f 44 00 00 55 48 89 e5 f0 ff 05 18 fb 61 01 0f ae f8 cc <0f> a=
e f8
f0 ff 0d 0a fb 61 01 5d c3 0f 1f 44 00 00 55 48 89 e5 e8
[ 1290.271432] RSP: 0018:ffffb2af4fe83b60 EFLAGS: 00000202
[ 1290.271434] RAX: 0000000000000000 RBX: ffff920037f87380 RCX:
0000000000000000
[ 1290.271435] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff920037f87ca0
[ 1290.271436] RBP: ffffb2af4fe83b60 R08: 0000000000000000 R09:
0000000000000001
[ 1290.271437] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1290.271438] R13: 0000000000000000 R14: 0000000000000001 R15:
0000000000000030
[ 1290.271440] FS:  00007fd33ac28b80(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.271441] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.271443] CR2: 00007f762abaa040 CR3: 000000063cfe0000 CR4:
00000000003406e0
[ 1290.271444] Call Trace:
[ 1290.271512]  dal_gpio_open_ex+0x30/0x40 [amdgpu]
[ 1290.271580]  dal_ddc_open+0x32/0xe0 [amdgpu]
[ 1290.271650]  acquire+0x3b/0x80 [amdgpu]
[ 1290.271706]  dc_link_aux_transfer+0x98/0x150 [amdgpu]
[ 1290.271767]  dm_dp_aux_transfer+0x9f/0x130 [amdgpu]
[ 1290.271773]  drm_dp_i2c_do_msg+0x8b/0x290 [drm_kms_helper]
[ 1290.271779]  drm_dp_i2c_xfer+0xc4/0x250 [drm_kms_helper]
[ 1290.271784]  __i2c_transfer+0x14a/0x450 [i2c_core]
[ 1290.271785]  ? _cond_resched+0x19/0x30
[ 1290.271789]  i2c_transfer+0x5a/0xd0 [i2c_core]
[ 1290.271793]  i2c_transfer_buffer_flags+0x4d/0x70 [i2c_core]
[ 1290.271795]  i2cdev_write+0x56/0xa0 [i2c_dev]
[ 1290.271798]  __vfs_write+0x3a/0x190
[ 1290.271799]  ? apparmor_file_permission+0x1a/0x20
[ 1290.271801]  ? security_file_permission+0x31/0xc0
[ 1290.271804]  vfs_write+0xab/0x1b0
[ 1290.271806]  ksys_write+0x55/0xc0
[ 1290.271808]  __x64_sys_write+0x1a/0x20
[ 1290.271810]  do_syscall_64+0x5a/0x110
[ 1290.271812]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1290.271813] RIP: 0033:0x7fd3398a7154
[ 1290.271814] Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 66 90 48 8d 05 b1 07 2e 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 <48> 3=
d 00
f0 ff ff 77 54 f3 c3 66 90 41 54 55 49 89 d4 53 48 89 f5
[ 1290.271816] RSP: 002b:00007ffee3079758 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 1290.271817] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007fd3398a7154
[ 1290.271818] RDX: 0000000000000001 RSI: 00007ffee30797b7 RDI:
0000000000000003
[ 1290.271819] RBP: 00007ffee30797b7 R08: 00007ffee31480a0 R09:
00007ffee3148080
[ 1290.271820] R10: 000000000008bdb0 R11: 0000000000000246 R12:
15adf9c617cac805
[ 1290.271821] R13: 0000000000000003 R14: 0000000000000000 R15:
000055d724af4b88
[ 1290.271823] Modules linked in: i2c_dev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev media edac_mce_amd
kvm_amd kvm irqbypass snd_hda_codec_realtek nls_iso8859_1 amdgpu
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul
snd_hda_codec snd_usb_audio snd_hda_core snd_usbmidi_lib crc32_pclmul snd_h=
wdep
chash ghash_clmulni_intel amd_iommu_v2 snd_pcm gpu_sched snd_seq_dummy ttm
snd_seq_oss snd_seq_midi drm_kms_helper snd_seq_midi_event snd_rawmidi drm
snd_seq drm_panel_orientation_quirks cfbfillrect cfbimgblt snd_seq_device
aesni_intel snd_timer cfbcopyarea eeepc_wmi fb_sys_fops syscopyarea asus_wmi
aes_x86_64 snd sysfillrect crypto_simd sparse_keymap input_leds joydev
sysimgblt cryptd glue_helper mxm_wmi video wmi_bmof soundcore ccp k10temp fb
fbdev mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic usbhid hid igb i2c_algo_bit i2c_piix4 dca nvme i2c_core
ahci nvme_core libahci gpio_amdpt wmi
[ 1290.271840]  gpio_generic
[ 1290.271844] ---[ end trace b558afb76afe3f40 ]---
[ 1290.271846] RIP: 0010:kgdb_breakpoint+0x14/0x20
[ 1290.271848] Code: 00 5d c3 0f 1f 00 0f 1f 44 00 00 55 31 c0 48 89 e5 5d =
c3
0f 1f 00 0f 1f 44 00 00 55 48 89 e5 f0 ff 05 18 fb 61 01 0f ae f8 cc <0f> a=
e f8
f0 ff 0d 0a fb 61 01 5d c3 0f 1f 44 00 00 55 48 89 e5 e8
[ 1290.271849] RSP: 0018:ffffb2af4fe83b60 EFLAGS: 00000202
[ 1290.271850] RAX: 0000000000000000 RBX: ffff920037f87380 RCX:
0000000000000000
[ 1290.271851] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff920037f87ca0
[ 1290.271852] RBP: ffffb2af4fe83b60 R08: 0000000000000000 R09:
0000000000000001
[ 1290.271853] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1290.271854] R13: 0000000000000000 R14: 0000000000000001 R15:
0000000000000030
[ 1290.271855] FS:  00007fd33ac28b80(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.271857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.271858] CR2: 00007f762abaa040 CR3: 000000063cfe0000 CR4:
00000000003406e0
[ 1290.272193] WARNING: CPU: 11 PID: 0 at kernel/rcu/tree.c:574
rcu_idle_enter+0x83/0x90
[ 1290.272195] Modules linked in: i2c_dev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev media edac_mce_amd
kvm_amd kvm irqbypass snd_hda_codec_realtek nls_iso8859_1 amdgpu
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul
snd_hda_codec snd_usb_audio snd_hda_core snd_usbmidi_lib crc32_pclmul snd_h=
wdep
chash ghash_clmulni_intel amd_iommu_v2 snd_pcm gpu_sched snd_seq_dummy ttm
snd_seq_oss snd_seq_midi drm_kms_helper snd_seq_midi_event snd_rawmidi drm
snd_seq drm_panel_orientation_quirks cfbfillrect cfbimgblt snd_seq_device
aesni_intel snd_timer cfbcopyarea eeepc_wmi fb_sys_fops syscopyarea asus_wmi
aes_x86_64 snd sysfillrect crypto_simd sparse_keymap input_leds joydev
sysimgblt cryptd glue_helper mxm_wmi video wmi_bmof soundcore ccp k10temp fb
fbdev mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic usbhid hid igb i2c_algo_bit i2c_piix4 dca nvme i2c_core
ahci nvme_core libahci gpio_amdpt wmi
[ 1290.272217]  gpio_generic
[ 1290.272222] CPU: 11 PID: 0 Comm: swapper/11 Tainted: G      D W=20=20=20=
=20=20=20=20=20
4.20.17-042017-generic #201903190933
[ 1290.272223] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 4207 12/07/2018
[ 1290.272226] RIP: 0010:rcu_idle_enter+0x83/0x90
[ 1290.272227] Code: 05 1a de cf 7b 48 c7 80 a8 00 00 00 00 00 00 00 48 89 =
d0
65 48 03 05 04 de cf 7b ba 02 00 00 00 f0 0f c1 90 b8 00 00 00 5d c3 <0f> 0=
b eb
a7 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 c7 c0
[ 1290.272229] RSP: 0018:ffffb2af4329bec0 EFLAGS: 00010002
[ 1290.272230] RAX: ffff92003ece3980 RBX: 000000000000000b RCX:
4000000000000000
[ 1290.272232] RDX: 0000000000023980 RSI: 000000000000091c RDI:
ffffffff8555dc40
[ 1290.272233] RBP: ffffb2af4329bec0 R08: 000000000000022d R09:
00000000000005b3
[ 1290.272235] R10: ffff92003ece1b84 R11: ffff92003ece1b64 R12:
ffffffff8562ab60
[ 1290.272236] R13: ffff920031a62c00 R14: ffffffff8555dc40 R15:
0000000000000002
[ 1290.272238] FS:  0000000000000000(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.272239] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.272240] CR2: 00007f762abaa040 CR3: 00000003fca0a000 CR4:
00000000003406e0
[ 1290.272242] Call Trace:
[ 1290.272246]  do_idle+0x22c/0x280
[ 1290.272249]  cpu_startup_entry+0x1d/0x20
[ 1290.272252]  start_secondary+0x1ab/0x200
[ 1290.272255]  secondary_startup_64+0xa4/0xb0
[ 1290.272257] ---[ end trace b558afb76afe3f41 ]---

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625966820.BdC5411D.16242
Date: Mon, 8 Jul 2019 14:38:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Multiple calls to ddcutil cause hard process hangs from w=
ithin the DRM/i2c system"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111089">111089</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Multiple calls to ddcutil cause hard process hangs from withi=
n the DRM/i2c system
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>nick&#64;nickvahalik.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Recently found out that my monitors can be controlled via DDC =
and so I have
been playing around with using ddcutil[1] to control the brightness. e.g.

    /usr/bin/ddcutil -d 1 setvcp 10 50 &amp;
    /usr/bin/ddcutil -d 2 setvcp 10 50 &amp;

Everything works beautifully... until I attempt to set the brightness on bo=
th
of my monitors at the same time. Doing so causes second and subsequent call=
s to
ddcutil to fail and hangs the process such that they cannot be killed and t=
he
system has to be hard reset.

Here is the dmesg dump. I've tested this on 4.16, 4.19 and 4.20 kernels.

The current workaround is to add a brief sleep between calls like this:

    /usr/bin/ddcutil -d 1 setvcp 10 50
    sleep .1
    /usr/bin/ddcutil -d 2 setvcp 10 50

I'm attaching a copy of the backtrace from dmesg. I've also opened a ticket
with ddcutil [2] which may or may not be of help.


[1]: <a href=3D"https://github.com/rockowitz/ddcutil">https://github.com/ro=
ckowitz/ddcutil</a>
[2]: <a href=3D"https://github.com/rockowitz/ddcutil/issues/86">https://git=
hub.com/rockowitz/ddcutil/issues/86</a>


[ 1290.270967] WARNING: CPU: 11 PID: 13323 at
drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.c:64
dal_gpio_open_ex+0x29/0x40 [amdgpu]
[ 1290.270968] Modules linked in: i2c_dev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev media edac_mce_amd
kvm_amd kvm irqbypass snd_hda_codec_realtek nls_iso8859_1 amdgpu
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul
snd_hda_codec snd_usb_audio snd_hda_core snd_usbmidi_lib crc32_pclmul snd_h=
wdep
chash ghash_clmulni_intel amd_iommu_v2 snd_pcm gpu_sched snd_seq_dummy ttm
snd_seq_oss snd_seq_midi drm_kms_helper snd_seq_midi_event snd_rawmidi drm
snd_seq drm_panel_orientation_quirks cfbfillrect cfbimgblt snd_seq_device
aesni_intel snd_timer cfbcopyarea eeepc_wmi fb_sys_fops syscopyarea asus_wmi
aes_x86_64 snd sysfillrect crypto_simd sparse_keymap input_leds joydev
sysimgblt cryptd glue_helper mxm_wmi video wmi_bmof soundcore ccp k10temp fb
fbdev mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic usbhid hid igb i2c_algo_bit i2c_piix4 dca nvme i2c_core
ahci nvme_core libahci gpio_amdpt wmi
[ 1290.271002]  gpio_generic
[ 1290.271005] CPU: 11 PID: 13323 Comm: ddcutil Not tainted
4.20.17-042017-generic #201903190933
[ 1290.271006] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 4207 12/07/2018
[ 1290.271075] RIP: 0010:dal_gpio_open_ex+0x29/0x40 [amdgpu]
[ 1290.271076] Code: 00 0f 1f 44 00 00 55 48 83 7f 08 00 48 89 e5 75 19 89 =
77
18 8b 57 14 4c 8d 47 08 89 f1 8b 77 10 48 8b 3f e8 f9 04 00 00 5d c3 &lt;0f=
&gt; 0b e8
e0 1a 87 c3 b8 05 00 00 00 5d c3 66 0f 1f 84 00 00 00 00
[ 1290.271077] RSP: 0018:ffffb2af4fe83b70 EFLAGS: 00010286
[ 1290.271079] RAX: 0000000000000000 RBX: ffff920037f87380 RCX:
0000000000000000
[ 1290.271080] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff920037f87ca0
[ 1290.271080] RBP: ffffb2af4fe83b70 R08: 0000000000000000 R09:
0000000000000001
[ 1290.271081] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1290.271082] R13: 0000000000000000 R14: 0000000000000001 R15:
0000000000000030
[ 1290.271083] FS:  00007fd33ac28b80(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.271084] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.271085] CR2: 00007f762abaa040 CR3: 000000063cfe0000 CR4:
00000000003406e0
[ 1290.271085] Call Trace:
[ 1290.271155]  dal_ddc_open+0x32/0xe0 [amdgpu]
[ 1290.271224]  acquire+0x3b/0x80 [amdgpu]
[ 1290.271286]  dc_link_aux_transfer+0x98/0x150 [amdgpu]
[ 1290.271355]  dm_dp_aux_transfer+0x9f/0x130 [amdgpu]
[ 1290.271361]  drm_dp_i2c_do_msg+0x8b/0x290 [drm_kms_helper]
[ 1290.271367]  drm_dp_i2c_xfer+0xc4/0x250 [drm_kms_helper]
[ 1290.271372]  __i2c_transfer+0x14a/0x450 [i2c_core]
[ 1290.271376]  ? _cond_resched+0x19/0x30
[ 1290.271379]  i2c_transfer+0x5a/0xd0 [i2c_core]
[ 1290.271383]  i2c_transfer_buffer_flags+0x4d/0x70 [i2c_core]
[ 1290.271386]  i2cdev_write+0x56/0xa0 [i2c_dev]
[ 1290.271389]  __vfs_write+0x3a/0x190
[ 1290.271391]  ? apparmor_file_permission+0x1a/0x20
[ 1290.271394]  ? security_file_permission+0x31/0xc0
[ 1290.271396]  vfs_write+0xab/0x1b0
[ 1290.271397]  ksys_write+0x55/0xc0
[ 1290.271399]  __x64_sys_write+0x1a/0x20
[ 1290.271402]  do_syscall_64+0x5a/0x110
[ 1290.271404]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1290.271405] RIP: 0033:0x7fd3398a7154
[ 1290.271407] Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 66 90 48 8d 05 b1 07 2e 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 &lt;48=
&gt; 3d 00
f0 ff ff 77 54 f3 c3 66 90 41 54 55 49 89 d4 53 48 89 f5
[ 1290.271407] RSP: 002b:00007ffee3079758 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 1290.271409] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007fd3398a7154
[ 1290.271409] RDX: 0000000000000001 RSI: 00007ffee30797b7 RDI:
0000000000000003
[ 1290.271410] RBP: 00007ffee30797b7 R08: 00007ffee31480a0 R09:
00007ffee3148080
[ 1290.271411] R10: 000000000008bdb0 R11: 0000000000000246 R12:
15adf9c617cac805
[ 1290.271411] R13: 0000000000000003 R14: 0000000000000000 R15:
000055d724af4b88
[ 1290.271413] ---[ end trace b558afb76afe3f3f ]---
[ 1290.271420] int3: 0000 [#1] SMP NOPTI
[ 1290.271424] CPU: 11 PID: 13323 Comm: ddcutil Tainted: G        W=20=20=
=20=20=20=20=20=20
4.20.17-042017-generic #201903190933
[ 1290.271425] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 4207 12/07/2018
[ 1290.271429] RIP: 0010:kgdb_breakpoint+0x14/0x20
[ 1290.271431] Code: 00 5d c3 0f 1f 00 0f 1f 44 00 00 55 31 c0 48 89 e5 5d =
c3
0f 1f 00 0f 1f 44 00 00 55 48 89 e5 f0 ff 05 18 fb 61 01 0f ae f8 cc &lt;0f=
&gt; ae f8
f0 ff 0d 0a fb 61 01 5d c3 0f 1f 44 00 00 55 48 89 e5 e8
[ 1290.271432] RSP: 0018:ffffb2af4fe83b60 EFLAGS: 00000202
[ 1290.271434] RAX: 0000000000000000 RBX: ffff920037f87380 RCX:
0000000000000000
[ 1290.271435] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff920037f87ca0
[ 1290.271436] RBP: ffffb2af4fe83b60 R08: 0000000000000000 R09:
0000000000000001
[ 1290.271437] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1290.271438] R13: 0000000000000000 R14: 0000000000000001 R15:
0000000000000030
[ 1290.271440] FS:  00007fd33ac28b80(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.271441] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.271443] CR2: 00007f762abaa040 CR3: 000000063cfe0000 CR4:
00000000003406e0
[ 1290.271444] Call Trace:
[ 1290.271512]  dal_gpio_open_ex+0x30/0x40 [amdgpu]
[ 1290.271580]  dal_ddc_open+0x32/0xe0 [amdgpu]
[ 1290.271650]  acquire+0x3b/0x80 [amdgpu]
[ 1290.271706]  dc_link_aux_transfer+0x98/0x150 [amdgpu]
[ 1290.271767]  dm_dp_aux_transfer+0x9f/0x130 [amdgpu]
[ 1290.271773]  drm_dp_i2c_do_msg+0x8b/0x290 [drm_kms_helper]
[ 1290.271779]  drm_dp_i2c_xfer+0xc4/0x250 [drm_kms_helper]
[ 1290.271784]  __i2c_transfer+0x14a/0x450 [i2c_core]
[ 1290.271785]  ? _cond_resched+0x19/0x30
[ 1290.271789]  i2c_transfer+0x5a/0xd0 [i2c_core]
[ 1290.271793]  i2c_transfer_buffer_flags+0x4d/0x70 [i2c_core]
[ 1290.271795]  i2cdev_write+0x56/0xa0 [i2c_dev]
[ 1290.271798]  __vfs_write+0x3a/0x190
[ 1290.271799]  ? apparmor_file_permission+0x1a/0x20
[ 1290.271801]  ? security_file_permission+0x31/0xc0
[ 1290.271804]  vfs_write+0xab/0x1b0
[ 1290.271806]  ksys_write+0x55/0xc0
[ 1290.271808]  __x64_sys_write+0x1a/0x20
[ 1290.271810]  do_syscall_64+0x5a/0x110
[ 1290.271812]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1290.271813] RIP: 0033:0x7fd3398a7154
[ 1290.271814] Code: 89 02 48 c7 c0 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 =
00
00 66 90 48 8d 05 b1 07 2e 00 8b 00 85 c0 75 13 b8 01 00 00 00 0f 05 &lt;48=
&gt; 3d 00
f0 ff ff 77 54 f3 c3 66 90 41 54 55 49 89 d4 53 48 89 f5
[ 1290.271816] RSP: 002b:00007ffee3079758 EFLAGS: 00000246 ORIG_RAX:
0000000000000001
[ 1290.271817] RAX: ffffffffffffffda RBX: 0000000000000001 RCX:
00007fd3398a7154
[ 1290.271818] RDX: 0000000000000001 RSI: 00007ffee30797b7 RDI:
0000000000000003
[ 1290.271819] RBP: 00007ffee30797b7 R08: 00007ffee31480a0 R09:
00007ffee3148080
[ 1290.271820] R10: 000000000008bdb0 R11: 0000000000000246 R12:
15adf9c617cac805
[ 1290.271821] R13: 0000000000000003 R14: 0000000000000000 R15:
000055d724af4b88
[ 1290.271823] Modules linked in: i2c_dev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev media edac_mce_amd
kvm_amd kvm irqbypass snd_hda_codec_realtek nls_iso8859_1 amdgpu
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul
snd_hda_codec snd_usb_audio snd_hda_core snd_usbmidi_lib crc32_pclmul snd_h=
wdep
chash ghash_clmulni_intel amd_iommu_v2 snd_pcm gpu_sched snd_seq_dummy ttm
snd_seq_oss snd_seq_midi drm_kms_helper snd_seq_midi_event snd_rawmidi drm
snd_seq drm_panel_orientation_quirks cfbfillrect cfbimgblt snd_seq_device
aesni_intel snd_timer cfbcopyarea eeepc_wmi fb_sys_fops syscopyarea asus_wmi
aes_x86_64 snd sysfillrect crypto_simd sparse_keymap input_leds joydev
sysimgblt cryptd glue_helper mxm_wmi video wmi_bmof soundcore ccp k10temp fb
fbdev mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic usbhid hid igb i2c_algo_bit i2c_piix4 dca nvme i2c_core
ahci nvme_core libahci gpio_amdpt wmi
[ 1290.271840]  gpio_generic
[ 1290.271844] ---[ end trace b558afb76afe3f40 ]---
[ 1290.271846] RIP: 0010:kgdb_breakpoint+0x14/0x20
[ 1290.271848] Code: 00 5d c3 0f 1f 00 0f 1f 44 00 00 55 31 c0 48 89 e5 5d =
c3
0f 1f 00 0f 1f 44 00 00 55 48 89 e5 f0 ff 05 18 fb 61 01 0f ae f8 cc &lt;0f=
&gt; ae f8
f0 ff 0d 0a fb 61 01 5d c3 0f 1f 44 00 00 55 48 89 e5 e8
[ 1290.271849] RSP: 0018:ffffb2af4fe83b60 EFLAGS: 00000202
[ 1290.271850] RAX: 0000000000000000 RBX: ffff920037f87380 RCX:
0000000000000000
[ 1290.271851] RDX: 0000000000000000 RSI: 0000000000000003 RDI:
ffff920037f87ca0
[ 1290.271852] RBP: ffffb2af4fe83b60 R08: 0000000000000000 R09:
0000000000000001
[ 1290.271853] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1290.271854] R13: 0000000000000000 R14: 0000000000000001 R15:
0000000000000030
[ 1290.271855] FS:  00007fd33ac28b80(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.271857] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.271858] CR2: 00007f762abaa040 CR3: 000000063cfe0000 CR4:
00000000003406e0
[ 1290.272193] WARNING: CPU: 11 PID: 0 at kernel/rcu/tree.c:574
rcu_idle_enter+0x83/0x90
[ 1290.272195] Modules linked in: i2c_dev uvcvideo videobuf2_vmalloc
videobuf2_memops videobuf2_v4l2 videobuf2_common videodev media edac_mce_amd
kvm_amd kvm irqbypass snd_hda_codec_realtek nls_iso8859_1 amdgpu
snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel crct10dif_pclmul
snd_hda_codec snd_usb_audio snd_hda_core snd_usbmidi_lib crc32_pclmul snd_h=
wdep
chash ghash_clmulni_intel amd_iommu_v2 snd_pcm gpu_sched snd_seq_dummy ttm
snd_seq_oss snd_seq_midi drm_kms_helper snd_seq_midi_event snd_rawmidi drm
snd_seq drm_panel_orientation_quirks cfbfillrect cfbimgblt snd_seq_device
aesni_intel snd_timer cfbcopyarea eeepc_wmi fb_sys_fops syscopyarea asus_wmi
aes_x86_64 snd sysfillrect crypto_simd sparse_keymap input_leds joydev
sysimgblt cryptd glue_helper mxm_wmi video wmi_bmof soundcore ccp k10temp fb
fbdev mac_hid sch_fq_codel parport_pc ppdev lp parport ip_tables x_tables
autofs4 hid_generic usbhid hid igb i2c_algo_bit i2c_piix4 dca nvme i2c_core
ahci nvme_core libahci gpio_amdpt wmi
[ 1290.272217]  gpio_generic
[ 1290.272222] CPU: 11 PID: 0 Comm: swapper/11 Tainted: G      D W=20=20=20=
=20=20=20=20=20
4.20.17-042017-generic #201903190933
[ 1290.272223] Hardware name: System manufacturer System Product Name/PRIME
X470-PRO, BIOS 4207 12/07/2018
[ 1290.272226] RIP: 0010:rcu_idle_enter+0x83/0x90
[ 1290.272227] Code: 05 1a de cf 7b 48 c7 80 a8 00 00 00 00 00 00 00 48 89 =
d0
65 48 03 05 04 de cf 7b ba 02 00 00 00 f0 0f c1 90 b8 00 00 00 5d c3 &lt;0f=
&gt; 0b eb
a7 66 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 48 c7 c0
[ 1290.272229] RSP: 0018:ffffb2af4329bec0 EFLAGS: 00010002
[ 1290.272230] RAX: ffff92003ece3980 RBX: 000000000000000b RCX:
4000000000000000
[ 1290.272232] RDX: 0000000000023980 RSI: 000000000000091c RDI:
ffffffff8555dc40
[ 1290.272233] RBP: ffffb2af4329bec0 R08: 000000000000022d R09:
00000000000005b3
[ 1290.272235] R10: ffff92003ece1b84 R11: ffff92003ece1b64 R12:
ffffffff8562ab60
[ 1290.272236] R13: ffff920031a62c00 R14: ffffffff8555dc40 R15:
0000000000000002
[ 1290.272238] FS:  0000000000000000(0000) GS:ffff92003ecc0000(0000)
knlGS:0000000000000000
[ 1290.272239] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1290.272240] CR2: 00007f762abaa040 CR3: 00000003fca0a000 CR4:
00000000003406e0
[ 1290.272242] Call Trace:
[ 1290.272246]  do_idle+0x22c/0x280
[ 1290.272249]  cpu_startup_entry+0x1d/0x20
[ 1290.272252]  start_secondary+0x1ab/0x200
[ 1290.272255]  secondary_startup_64+0xa4/0xb0
[ 1290.272257] ---[ end trace b558afb76afe3f41 ]---</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625966820.BdC5411D.16242--

--===============2127828324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2127828324==--
