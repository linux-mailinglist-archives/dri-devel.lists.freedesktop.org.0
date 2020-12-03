Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E92CD47B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 12:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE06A6E995;
	Thu,  3 Dec 2020 11:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 474366E995
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 11:23:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210465] New: Vega 3 lock MCLK on 1200mhz
Date: Thu, 03 Dec 2020 11:23:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: intervionly@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-210465-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210465

            Bug ID: 210465
           Summary: Vega 3 lock MCLK on 1200mhz
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.11, 5.4.80-2
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: intervionly@gmail.com
        Regression: No

Created attachment 293913
  --> https://bugzilla.kernel.org/attachment.cgi?id=293913&action=edit
dmesg

Lock at start (disabled display manager, check in console):
[root@hard alex]# cat /sys/class/drm/card0/device/pp_dpm_mclk
0: 400Mhz 
1: 933Mhz 
2: 1067Mhz 
3: 1200Mhz *

Suspend does not work: freeze black screen. Low battery life.

Found two warnings in dmesg:

[   18.539019] ------------[ cut here ]------------
[   18.539021] Bogus possible_crtcs: [ENCODER:65:TMDS-65] possible_crtcs=0xf
(full crtc mask=0x7)
[   18.539077] WARNING: CPU: 3 PID: 439 at
drivers/gpu/drm/drm_mode_config.c:617 drm_mode_config_validate+0x178/0x200
[drm]
[   18.539077] Modules linked in: cmac algif_hash algif_skcipher af_alg bnep
8821ce(OE) btusb btrtl btbcm edac_mce_amd btintel kvm_amd rtw88_8821ce
amdgpu(+) nls_iso8859_1 bluetooth rtw88_8821c nls_cp437 vfat fat rtw88_pci kvm
rtw88_core ecdh_generic wmi_bmof ecc mac80211 uvcvideo snd_hda_codec_realtek
pcspkr snd_hda_codec_generic irqbypass rapl ledtrig_audio snd_hda_codec_hdmi
videobuf2_vmalloc videobuf2_memops rndis_host snd_rn_pci_acp3x k10temp
cdc_ether snd_hda_intel snd_pci_acp3x videobuf2_v4l2 usbnet snd_intel_dspcfg
videobuf2_common mousedev input_leds snd_hda_codec i2c_hid snd_hda_core joydev
mii videodev r8169 snd_hwdep snd_pcm mc cfg80211 realtek snd_timer mdio_devres
of_mdio snd fixed_phy ideapad_laptop gpu_sched sp5100_tco sparse_keymap
i2c_algo_bit soundcore libphy libarc4 rfkill battery i2c_piix4 ac elan_i2c
mac_hid evdev wmi pinctrl_amd acpi_cpufreq vboxnetflt(OE) vboxnetadp(OE)
vboxdrv(OE) vboxvideo drm_vram_helper drm_ttm_helper ttm drm_kms_helper cec
rc_core drm syscopyarea
[   18.539113]  sysfillrect sysimgblt fb_sys_fops vboxsf fuse vboxguest
crypto_user acpi_call(OE) agpgart ip_tables x_tables ext4 crc32c_generic crc16
mbcache jbd2 dm_crypt cbc encrypted_keys trusted tpm hid_generic usbhid hid
dm_mod serio_raw atkbd libps2 crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper xhci_pci
xhci_pci_renesas ccp xhci_hcd rng_core i8042 serio
[   18.539134] CPU: 3 PID: 439 Comm: systemd-udevd Tainted: G           OE    
5.9.11-arch2-1 #1
[   18.539135] Hardware name: LENOVO 81LW/LNVNB161216, BIOS ARCN32WW 07/11/2019
[   18.539150] RIP: 0010:drm_mode_config_validate+0x178/0x200 [drm]
[   18.539153] Code: 39 d6 75 e6 45 85 c8 74 0a 44 89 c0 f7 d0 44 85 c8 74 19
49 8b 55 38 41 8b 75 18 44 89 c9 48 c7 c7 70 61 46 c0 e8 38 9f 79 d1 <0f> 0b 49
8b 45 08 4c 8d 68 f8 49 39 c4 0f 85 ed fe ff ff 5b 5d 41
[   18.539155] RSP: 0018:ffffaf0e405cfa58 EFLAGS: 00010282
[   18.539157] RAX: 0000000000000000 RBX: ffff9f25700c1ad0 RCX:
0000000000000000
[   18.539158] RDX: 0000000000000001 RSI: ffffffff92559a97 RDI:
00000000ffffffff
[   18.539159] RBP: 0000000000000001 R08: 000000000000044f R09:
0000000000000001
[   18.539160] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9f25700c1ad8
[   18.539161] R13: ffff9f25649ffc00 R14: ffff9f25700c1ad8 R15:
000000000000001f
[   18.539163] FS:  00007fc5ceee7ec0(0000) GS:ffff9f2574ac0000(0000)
knlGS:0000000000000000
[   18.539164] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.539165] CR2: 00007fa743c07270 CR3: 00000002b0202000 CR4:
00000000003506e0
[   18.539166] Call Trace:
[   18.539188]  drm_dev_register+0x158/0x1b0 [drm]
[   18.539303]  amdgpu_pci_probe+0x107/0x180 [amdgpu]
[   18.539310]  local_pci_probe+0x42/0x80
[   18.539313]  ? pci_match_device+0xd7/0x100
[   18.539317]  pci_device_probe+0xfa/0x1b0
[   18.539322]  really_probe+0x205/0x460
[   18.539325]  driver_probe_device+0xe1/0x150
[   18.539329]  device_driver_attach+0xa1/0xb0
[   18.539332]  __driver_attach+0x8a/0x150
[   18.539334]  ? device_driver_attach+0xb0/0xb0
[   18.539336]  ? device_driver_attach+0xb0/0xb0
[   18.539338]  bus_for_each_dev+0x89/0xd0
[   18.539340]  bus_add_driver+0x12b/0x1e0
[   18.539342]  driver_register+0x8b/0xe0
[   18.539345]  ? 0xffffffffc17d2000
[   18.539348]  do_one_initcall+0x59/0x240
[   18.539353]  do_init_module+0x5c/0x260
[   18.539359]  load_module+0x21a7/0x2450
[   18.539365]  __do_sys_init_module+0x12d/0x180
[   18.539373]  do_syscall_64+0x33/0x40
[   18.539376]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   18.539378] RIP: 0033:0x7fc5cf7d6e4e
[   18.539380] Code: 48 8b 0d 25 10 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f2 0f 0c 00 f7 d8 64 89 01 48
[   18.539381] RSP: 002b:00007ffd09434ca8 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[   18.539383] RAX: ffffffffffffffda RBX: 00005634744ec9f0 RCX:
00007fc5cf7d6e4e
[   18.539384] RDX: 00005634744ec3d0 RSI: 0000000000afd361 RDI:
00007fc5cd0db010
[   18.539385] RBP: 00007fc5cd0db010 R08: fffffffffffffff0 R09:
0000000000afd370
[   18.539386] R10: 0000563474393010 R11: 0000000000000246 R12:
00005634744ec3d0
[   18.539387] R13: 0000000000000060 R14: 00005634744f1b30 R15:
00005634744ec9f0
[   18.539390] ---[ end trace 6aa1c68690dd6fcb ]---
[   18.539391] ------------[ cut here ]------------
[   18.539393] Bogus possible_crtcs: [ENCODER:71:TMDS-71] possible_crtcs=0xf
(full crtc mask=0x7)
[   18.539432] WARNING: CPU: 3 PID: 439 at
drivers/gpu/drm/drm_mode_config.c:617 drm_mode_config_validate+0x178/0x200
[drm]
[   18.539432] Modules linked in: cmac algif_hash algif_skcipher af_alg bnep
8821ce(OE) btusb btrtl btbcm edac_mce_amd btintel kvm_amd rtw88_8821ce
amdgpu(+) nls_iso8859_1 bluetooth rtw88_8821c nls_cp437 vfat fat rtw88_pci kvm
rtw88_core ecdh_generic wmi_bmof ecc mac80211 uvcvideo snd_hda_codec_realtek
pcspkr snd_hda_codec_generic irqbypass rapl ledtrig_audio snd_hda_codec_hdmi
videobuf2_vmalloc videobuf2_memops rndis_host snd_rn_pci_acp3x k10temp
cdc_ether snd_hda_intel snd_pci_acp3x videobuf2_v4l2 usbnet snd_intel_dspcfg
videobuf2_common mousedev input_leds snd_hda_codec i2c_hid snd_hda_core joydev
mii videodev r8169 snd_hwdep snd_pcm mc cfg80211 realtek snd_timer mdio_devres
of_mdio snd fixed_phy ideapad_laptop gpu_sched sp5100_tco sparse_keymap
i2c_algo_bit soundcore libphy libarc4 rfkill battery i2c_piix4 ac elan_i2c
mac_hid evdev wmi pinctrl_amd acpi_cpufreq vboxnetflt(OE) vboxnetadp(OE)
vboxdrv(OE) vboxvideo drm_vram_helper drm_ttm_helper ttm drm_kms_helper cec
rc_core drm syscopyarea
[   18.539461]  sysfillrect sysimgblt fb_sys_fops vboxsf fuse vboxguest
crypto_user acpi_call(OE) agpgart ip_tables x_tables ext4 crc32c_generic crc16
mbcache jbd2 dm_crypt cbc encrypted_keys trusted tpm hid_generic usbhid hid
dm_mod serio_raw atkbd libps2 crct10dif_pclmul crc32_pclmul crc32c_intel
ghash_clmulni_intel aesni_intel crypto_simd cryptd glue_helper xhci_pci
xhci_pci_renesas ccp xhci_hcd rng_core i8042 serio
[   18.539475] CPU: 3 PID: 439 Comm: systemd-udevd Tainted: G        W  OE    
5.9.11-arch2-1 #1
[   18.539476] Hardware name: LENOVO 81LW/LNVNB161216, BIOS ARCN32WW 07/11/2019
[   18.539495] RIP: 0010:drm_mode_config_validate+0x178/0x200 [drm]
[   18.539499] Code: 39 d6 75 e6 45 85 c8 74 0a 44 89 c0 f7 d0 44 85 c8 74 19
49 8b 55 38 41 8b 75 18 44 89 c9 48 c7 c7 70 61 46 c0 e8 38 9f 79 d1 <0f> 0b 49
8b 45 08 4c 8d 68 f8 49 39 c4 0f 85 ed fe ff ff 5b 5d 41
[   18.539500] RSP: 0018:ffffaf0e405cfa58 EFLAGS: 00010282
[   18.539502] RAX: 0000000000000000 RBX: ffff9f25700c1ad0 RCX:
0000000000000000
[   18.539503] RDX: 0000000000000001 RSI: ffffffff92559a97 RDI:
00000000ffffffff
[   18.539504] RBP: 0000000000000001 R08: 0000000000000480 R09:
0000000000000001
[   18.539505] R10: 0000000000000000 R11: 0000000000000001 R12:
ffff9f25700c1ad8
[   18.539507] R13: ffff9f2564956000 R14: ffff9f25700c1ad8 R15:
000000000000001f
[   18.539508] FS:  00007fc5ceee7ec0(0000) GS:ffff9f2574ac0000(0000)
knlGS:0000000000000000
[   18.539509] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.539511] CR2: 00007fa743c07270 CR3: 00000002b0202000 CR4:
00000000003506e0
[   18.539513] Call Trace:
[   18.539534]  drm_dev_register+0x158/0x1b0 [drm]
[   18.539631]  amdgpu_pci_probe+0x107/0x180 [amdgpu]
[   18.539634]  local_pci_probe+0x42/0x80
[   18.539636]  ? pci_match_device+0xd7/0x100
[   18.539640]  pci_device_probe+0xfa/0x1b0
[   18.539644]  really_probe+0x205/0x460
[   18.539648]  driver_probe_device+0xe1/0x150
[   18.539650]  device_driver_attach+0xa1/0xb0
[   18.539654]  __driver_attach+0x8a/0x150
[   18.539659]  ? device_driver_attach+0xb0/0xb0
[   18.539662]  ? device_driver_attach+0xb0/0xb0
[   18.539664]  bus_for_each_dev+0x89/0xd0
[   18.539668]  bus_add_driver+0x12b/0x1e0
[   18.539672]  driver_register+0x8b/0xe0
[   18.539675]  ? 0xffffffffc17d2000
[   18.539677]  do_one_initcall+0x59/0x240
[   18.539681]  do_init_module+0x5c/0x260
[   18.539686]  load_module+0x21a7/0x2450
[   18.539692]  __do_sys_init_module+0x12d/0x180
[   18.539697]  do_syscall_64+0x33/0x40
[   18.539700]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   18.539702] RIP: 0033:0x7fc5cf7d6e4e
[   18.539704] Code: 48 8b 0d 25 10 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e
0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d f2 0f 0c 00 f7 d8 64 89 01 48
[   18.539705] RSP: 002b:00007ffd09434ca8 EFLAGS: 00000246 ORIG_RAX:
00000000000000af
[   18.539708] RAX: ffffffffffffffda RBX: 00005634744ec9f0 RCX:
00007fc5cf7d6e4e
[   18.539710] RDX: 00005634744ec3d0 RSI: 0000000000afd361 RDI:
00007fc5cd0db010
[   18.539712] RBP: 00007fc5cd0db010 R08: fffffffffffffff0 R09:
0000000000afd370
[   18.539713] R10: 0000563474393010 R11: 0000000000000246 R12:
00005634744ec3d0
[   18.539715] R13: 0000000000000060 R14: 00005634744f1b30 R15:
00005634744ec9f0
[   18.539718] ---[ end trace 6aa1c68690dd6fcc ]---

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
