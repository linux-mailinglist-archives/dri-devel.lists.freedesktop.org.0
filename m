Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDE7320A6E
	for <lists+dri-devel@lfdr.de>; Sun, 21 Feb 2021 14:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B704B89ECD;
	Sun, 21 Feb 2021 13:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA6E89ECD
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 13:09:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DE14B64E5F
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Feb 2021 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613912979;
 bh=WIYdiVZ+XJXvJj7YGmg0suY9JBOzxbJUFn8+Ue3q4+k=;
 h=From:To:Subject:Date:From;
 b=nsR3MI73OczDqwvD47fwQAxCAEVN/alE/yqw9gHh40fZFxX3pWMqYEmSXblulI2Ke
 ylT+xozKOcY8deMXlrojkGw9LN8WhxwiT/U5eKpgRCsGcARtdv4DY8emiQQZJJK04s
 WIBjzdzE9nJRKBi+sp5I1nGeCVegfiwf6kMub/tV7zqTVjPYsr+1YzC/NyTbD1BvZf
 wtjnYAwLXgYlg2QYaGkE54fzYrJ4Q+OhAA75NqeQtHQsVbmZ/WpqGaKr/TlwmmiFBQ
 /l4RnRBWqJXNW7OuxDbSAtXU4y4nS9KB0aTD8pOBZ5ZiRGgKTioTI7lccT7/cAR1eQ
 c88VjgV8YarhA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id CAF186536A; Sun, 21 Feb 2021 13:09:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211875] New: CPU frequency scaling lost after "WARNING: CPU: 2
 PID: 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]"
Date: Sun, 21 Feb 2021 13:09:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211875-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211875

            Bug ID: 211875
           Summary: CPU frequency scaling lost after "WARNING: CPU: 2 PID:
                    2358578 at
                    smu8_send_msg_to_smc_with_parameter+0xfe/0x140
                    [amdgpu]"
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.11
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: erhard_f@mailbox.org
        Regression: No

Created attachment 295381
  --> https://bugzilla.kernel.org/attachment.cgi?id=295381&action=edit
dmesg (kernel 5.11, A10-9700E)

I get this on kernel 5.10.17 and it happens on 5.11 too (though a lot less
often). Leaving the machine running for some hours sooner or later I get this
"smu8_send_msg_to_smc_with_parameter(0x0011, 0x460) timed out after 3234846 us"
in kernel dmesg and after that CPU clock frequency is hampered to the 800 MHz
base clock of the A10-9700E. Setting cpu manually to performance or back to
ondemand does not change a thing, clock stays down at 800 MHz. The machine does
not crash and is still usable but well ... slow..

[...]
------------[ cut here ]------------
smu8_send_msg_to_smc_with_parameter(0x0011, 0x460) timed out after 3234846 us
WARNING: CPU: 2 PID: 2358578 at smu8_send_msg_to_smc_with_parameter+0xfe/0x140
[amdgpu]
Modules linked in: fuse rfkill input_leds joydev ext4 crc16 mbcache jbd2
hid_generic usbhid hid crc32_generic crc32_pclmul f2fs evdev amdgpu aesni_intel
libaes crypto_simd cryptd snd_hda_codec_hdmi glue_helper drm_ttm_helper
snd_hda_codec_realtek ttm snd_hda_codec_generic ledtrig_audio led_class r8169
fam15h_power realtek gpu_sched k10temp mdio_devres ehci_pci ehci_hcd i2c_piix4
libphy snd_hda_intel snd_intel_dspcfg i2c_algo_bit snd_hda_codec drm_kms_helper
snd_hwdep cfbfillrect snd_hda_core syscopyarea xhci_pci cfbimgblt snd_pcm
xhci_hcd sysfillrect sysimgblt snd_timer usbcore fb_sys_fops cfbcopyarea snd
usb_common fb soundcore font fbdev video acpi_cpufreq button processor nfsd
zram nct6775 auth_rpcgss zsmalloc hwmon_vid jc42 lockd hwmon grace sunrpc drm
drm_panel_orientation_quirks nfs_ssc backlight
CPU: 2 PID: 2358578 Comm: kworker/2:0 Not tainted 5.11.0-gentoo #2
Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./A320M-HDV R3.0,
BIOS P3.10 06/26/2019
Workqueue: events dm_irq_work_func [amdgpu]
RIP: 0010:smu8_send_msg_to_smc_with_parameter+0xfe/0x140 [amdgpu]
Code: c0 48 c7 c7 a0 4b a8 c0 48 89 c1 48 f7 ea 48 89 c8 44 89 f1 48 c1 f8 3f
48 c1 fa 07 48 29 c2 49 89 d0 44 89 ea e8 db a8 e4 d5 <0f> 0b eb b3 41 bc ea ff
ff ff eb ab 48 8b 7d 60 be c0 01 00 00 48
RSP: 0018:ffffb25b4015bb48 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 00009c65e3a5a2a5 RCX: ffffa23c0f512d58
RDX: 0000000000000000 RSI: 0000000000000027 RDI: ffffa23c0f512d50
RBP: ffffa23908ceec00 R08: 0000000000000000 R09: ffffb25b4015b980
R10: 0000000000000003 R11: ffffffff96e57e48 R12: 00000000ffffffc2
R13: 0000000000000011 R14: 0000000000000460 R15: ffffa2390e53128c
FS:  0000000000000000(0000) GS:ffffa23c0f500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f99db4fbbc0 CR3: 0000000134f00000 CR4: 00000000001506e0
Call Trace:
 smum_send_msg_to_smc_with_parameter+0xbe/0xf0 [amdgpu]
 smu8_set_power_state_tasks+0x1d6/0x360 [amdgpu]
 phm_set_power_state+0x44/0x68 [amdgpu]
 psm_adjust_power_state_dynamic+0xb6/0x1b8 [amdgpu]
 ? amdgpu_fence_wait_empty+0x80/0xd0 [amdgpu]
 pp_dpm_dispatch_tasks+0x35/0x58 [amdgpu]
 dm_pp_apply_display_requirements+0x197/0x1c0 [amdgpu]
 dce11_update_clocks+0x8f/0xe8 [amdgpu]
 dc_commit_updates_for_stream+0xc2c/0x1980 [amdgpu]
 ? dc_link_detect_helper+0x516/0xe90 [amdgpu]
 dm_set_dpms_off+0x85/0xd0 [amdgpu]
 handle_hpd_irq+0xf1/0x148 [amdgpu]
 dm_irq_work_func+0x44/0x50 [amdgpu]
 process_one_work+0x1b8/0x318
 worker_thread+0x4b/0x3a0
 ? rescuer_thread+0x360/0x360
 kthread+0x11c/0x138
 ? __kthread_bind_mask+0x58/0x58
 ret_from_fork+0x22/0x30
---[ end trace 0fa0eb110cfd5fb7 ]---
amdgpu: smu8_send_msg_to_smc_with_parameter(0x026e) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x002f) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0012) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0013) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0011) aborted; SMU still
servicing msg (0x0011)
[drm] amdgpu_dm_irq_schedule_work FAILED src 2
[drm] amdgpu_dm_irq_schedule_work FAILED src 2
amdgpu: smu8_send_msg_to_smc_with_parameter(0x026e) aborted; SMU still
servicing msg (0x0011)
[drm] amdgpu_dm_irq_schedule_work FAILED src 2
amdgpu: smu8_send_msg_to_smc_with_parameter(0x002f) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0012) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0013) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x0011) aborted; SMU still
servicing msg (0x0011)
amdgpu: smu8_send_msg_to_smc_with_parameter(0x026e) aborted; SMU still
servicing msg (0x0011)
[...]

Some data about the machine:
 $ inxi -b
System:    Kernel: 5.11.0-gentoo x86_64 bits: 64 Desktop: MATE 1.24.0 Distro:
Gentoo Base System release 2.7 
Machine:   Type: Desktop Mobo: ASRock model: A320M-HDV R3.0 serial:
<superuser/root required> 
           UEFI [Legacy]: American Megatrends v: P3.10 date: 06/26/2019 
CPU:       Info: Quad Core AMD A10-9700E RADEON R7 10 COMPUTE CORES 4C+6G [MCP]
speed: 2485 MHz min/max: 800/3000 MHz 
Graphics:  Device-1: Advanced Micro Devices [AMD/ATI] Wani [Radeon R5/R6/R7
Graphics] driver: amdgpu v: kernel 
           Display: x11 server: X.Org 1.20.10 driver: amdgpu,ati unloaded:
fbdev,modesetting resolution: 1920x1080~60Hz 
           OpenGL: renderer: AMD CARRIZO (DRM 3.40.0 5.11.0-gentoo LLVM 11.0.0)
v: 4.6 Mesa 20.2.6 
Network:   Device-1: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet
driver: r8169

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
