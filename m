Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E87F36EA97
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 14:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3E16EE90;
	Thu, 29 Apr 2021 12:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8316EE90
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:37:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 94A15613F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619699846;
 bh=3oEy9VKBw5pVNlovcuwyN8KYxq+GUVNZRhFP8QVVjuQ=;
 h=From:To:Subject:Date:From;
 b=EfP+bKwER6K88SKc+RgD1QUqdcIgpxqGue1AVyHE7gC2izJfItRHhBgm7wq6tYo9B
 kxZSa1igHFn/K7yeQdDmnQrbpuVeGsSGLPUTkFpcE99mCOrXFvwS12EfRoi/jf/QwW
 LI9hiNSLLetnWbIyqw3C/mZzAXY5jUrU1tsbKQ9BujwAwgze494mLBA2Lli2eNwkRK
 1R96OKVIb3Gm+9Hi5kCaUtAwIfPX6JGnVBSTVWsH7MKDyf0J/TOCvs4AxEfv4Drwty
 fu/xCRKnYRAIrCghmNw53xmS3TA24JDRMshx+DXpbLMCmEcBsl20/YpHTEEn28x9cn
 BSzn3CuB4m20w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8A23361057; Thu, 29 Apr 2021 12:37:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212881] New: nouveau: BUG: kernel NULL pointer dereference in
 nouveau_bo_sync_for_device
Date: Thu, 29 Apr 2021 12:37:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dave.mueller@gmx.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212881-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212881

            Bug ID: 212881
           Summary: nouveau: BUG: kernel NULL pointer dereference in
                    nouveau_bo_sync_for_device
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11.0
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dave.mueller@gmx.ch
        Regression: No

Since kernel 5.11, the nouveau driver crash with a NULL pointer exception.
Below is the (stripped) dmesg output from kernel 5.12, which still shows the
same problem.
The same (old) hardware works fine with kernel 5.10.

[    0.000000] Linux version 5.12.0 (root@test) (gcc (GCC) 5.5.0, GNU ld
version
 2.27-slack15) #2 PREEMPT Wed Apr 28 15:34:45 CEST 2021
[   11.415023] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[   11.416766] Console: switching to colour dummy device 80x25
[   11.417616] nouveau 0000:01:00.0: NVIDIA NV17 (017200a5)
[   11.517414] nouveau 0000:01:00.0: bios: version 04.17.00.45.00
[   11.518545] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[   11.518692] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   11.518748] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   11.518918] agpgart-intel 0000:00:00.0: AGP 2.0 bridge
[   11.518941] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   11.518977] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   11.519038] nouveau 0000:01:00.0: timer: unknown input clock freq
[   11.521866] nouveau 0000:01:00.0: fb: 64 MiB DDR1
[   11.522352] sr 2:0:0:0: Attached scsi CD-ROM sr1
[   11.534498] [TTM] Zone  kernel: Available graphics memory: 569334 KiB
[   11.534524] [TTM] Zone highmem: Available graphics memory: 1033956 KiB
[   11.534581] nouveau 0000:01:00.0: DRM: VRAM: 63 MiB
[   11.534593] nouveau 0000:01:00.0: DRM: GART: 128 MiB
[   11.534604] nouveau 0000:01:00.0: DRM: BMP version 5.21
[   11.534614] nouveau 0000:01:00.0: DRM: DCB version 2.0
[   11.534625] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000100 000088b8
[   11.534636] nouveau 0000:01:00.0: DRM: DCB outp 01: 02010111 00000003
[   11.534646] nouveau 0000:01:00.0: DRM: DCB outp 02: 02010211 00000003
[   11.534657] nouveau 0000:01:00.0: DRM: Merging DCB entries 1 and 2
[   11.535551] nouveau 0000:01:00.0: DRM: Loading NV17 power sequencing
microcode
[   11.536036] BUG: kernel NULL pointer dereference, address: 00000000
[   11.536053] #PF: supervisor read access in kernel mode
[   11.536062] #PF: error_code(0x0000) - not-present page
[   11.536070] *pde = 00000000 
[   11.536079] Oops: 0000 [#1] PREEMPT
[   11.536089] CPU: 0 PID: 388 Comm: udevd Not tainted 5.12.0 #2
[   11.536099] Hardware name: Dell Computer Corporation Dimension 4550         
     /, BIOS A08 09/23/2003
[   11.536110] EIP: nouveau_bo_sync_for_device+0x91/0x103 [nouveau]
[   11.536393] Code: 85 8b 00 00 00 bb 01 00 00 00 eb 08 83 c2 24 3b 14 87 75
0a 83 c3 01 83 c0 01 39 c1 77 ee 89 d9 c1 e1 0c 8b 45 10 8b 7c 24 10 <8b> 14 38
8b 44 24 14 8b 40 e0 8b 40 08 c7 04 24 01 00 00 00 e8 7b
[   11.536411] EAX: 00000000 EBX: 00000010 ECX: 00010000 EDX: f624e040
[   11.536421] ESI: 00000000 EDI: 00000000 EBP: b20f5cc0 ESP: b1c83b44
[   11.536430] DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010206
[   11.536439] CR0: 80050033 CR2: 00000000 CR3: 01c63000 CR4: 000006d0
[   11.536449] Call Trace:
[   11.536459]  ? nouveau_bo_validate+0x5d/0x77 [nouveau]
[   11.536780]  ? nouveau_bo_pin+0x10e/0x287 [nouveau]
[   11.537099]  ? nouveau_bo_new+0x64/0x74 [nouveau]
[   11.537418]  ? nouveau_channel_prep+0x113/0x32e [nouveau]
[   11.537744]  ? nouveau_channel_new+0x59/0x75d [nouveau]
[   11.538067]  ? ttm_bo_kmap+0x1a7/0x1f0 [ttm]
[   11.538084]  ? ttm_bo_kmap+0x1a7/0x1f0 [ttm]
[   11.538098]  ? nouveau_bo_pin+0x150/0x287 [nouveau]
[   11.538417]  ? nouveau_bo_map+0x75/0x8b [nouveau]
[   11.538736]  ? nvif_object_sclass_put+0xa/0x12 [nouveau]
[   11.538976]  ? kfree+0x66/0xca
[   11.538992]  ? nouveau_drm_device_init+0x42f/0x7d7 [nouveau]
[   11.539311]  ? pci_read_config_word+0x27/0x2c
[   11.539325]  ? pci_enable_device_flags+0xd0/0xe5
[   11.539335]  ? nouveau_drm_probe+0x110/0x1e5 [nouveau]
[   11.539654]  ? nouveau_drm_device_init+0x7d7/0x7d7 [nouveau]
[   11.539973]  ? pci_device_probe+0x82/0xf0
[   11.539984]  ? sysfs_create_link+0x1d/0x2e
[   11.539996]  ? really_probe+0x19a/0x341
[   11.540007]  ? driver_probe_device+0x3d/0x85
[   11.540016]  ? device_driver_attach+0x3c/0x40
[   11.540024]  ? __driver_attach+0x6f/0x95
[   11.540033]  ? device_driver_attach+0x40/0x40
[   11.540041]  ? bus_for_each_dev+0x48/0x88
[   11.540049]  ? driver_attach+0x16/0x1a
[   11.540056]  ? device_driver_attach+0x40/0x40
[   11.540065]  ? bus_add_driver+0x111/0x1b4
[   11.540073]  ? driver_register+0x51/0xe5
[   11.540083]  ? nouveau_drm_init+0x12c/0x1000 [nouveau]
[   11.540281]  ? 0xf7fba000
[   11.540288]  ? do_one_initcall+0x41/0x1a6
[   11.540300]  ? do_init_module+0x42/0x1c7
[   11.540311]  ? load_module+0x2040/0x24cb
[   11.540327]  ? __ia32_sys_init_module+0x129/0x14d
[   11.540338]  ? do_int80_syscall_32+0x29/0x34
[   11.540349]  ? entry_INT80_32+0xf3/0xf3
[   11.540362] Modules linked in: nouveau(+) btusb btrtl btbcm btintel
bluetooth ftdi_sio usbserial ecdh_generic ecc rfkill mousedev usb_storage hwmon
wmi video i2c_algo_bit drm_ttm_helper ttm drm_kms_helper i2c_dev evdev
cfbfillrect input_leds syscopyarea psmouse cfbimgblt led_class sysfillrect
sysimgblt dcdbas fb_sys_fops serio_raw sr_mod i2c_i801 cdrom cfbcopyarea
i2c_smbus snd_emu10k1x drm snd_ac97_codec ac97_bus snd_rawmidi snd_seq_device
e100 ohci_pci firewire_ohci snd_pcm ohci_hcd mii firewire_core crc_itu_t
snd_timer uhci_hcd snd ehci_pci i2c_core ehci_hcd drm_panel_orientation_quirks
soundcore backlight usbcore parport_pc 8250 floppy parport 8250_base rtc_cmos
lpc_ich mfd_core intel_agp serial_core intel_gtt tiny_power_button agpgart
intel_rng usb_common button rng_core processor loop
[   11.540544] CR2: 0000000000000000
[   11.540642] ---[ end trace 1cf246b74e8c5b23 ]---
[   11.540654] EIP: nouveau_bo_sync_for_device+0x91/0x103 [nouveau]
[   11.540898] Code: 85 8b 00 00 00 bb 01 00 00 00 eb 08 83 c2 24 3b 14 87 75
0a 83 c3 01 83 c0 01 39 c1 77 ee 89 d9 c1 e1 0c 8b 45 10 8b 7c 24 10 <8b> 14 38
8b 44 24 14 8b 40 e0 8b 40 08 c7 04 24 01 00 00 00 e8 7b
[   11.540915] EAX: 00000000 EBX: 00000010 ECX: 00010000 EDX: f624e040
[   11.540925] ESI: 00000000 EDI: 00000000 EBP: b20f5cc0 ESP: b1c83b44
[   11.540934] DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010206
[   11.540943] CR0: 80050033 CR2: 00000000 CR3: 01c63000 CR4: 000006d0

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
