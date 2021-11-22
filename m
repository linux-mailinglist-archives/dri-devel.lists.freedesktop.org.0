Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848D345935C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 17:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032C089C08;
	Mon, 22 Nov 2021 16:47:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39EC389C08;
 Mon, 22 Nov 2021 16:47:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4E6960F48;
 Mon, 22 Nov 2021 16:47:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iOCicwL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637599637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nx1NlZdwj8PiM1PkkfjZLo7ZeKru7gZg5nAsco+kW4s=;
 b=iOCicwL2JFJ9wuSXZb/K3vmWDQ9s2K25J+oTxVSHB5Enjp/uXVM59zhr1PjFEFtnl4ONy4
 lL1dlXFzgPIvyiMp+afDjjYsjhOD4IGH913za0oVgzRkwCRYLv1/WW5Yv8NBsYKuDYB3H9
 OQtjUTTHsO14O8Bz41uc2UUboaLRKXQ=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 3351b3c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 22 Nov 2021 16:47:16 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id d10so51821822ybe.3;
 Mon, 22 Nov 2021 08:47:16 -0800 (PST)
X-Gm-Message-State: AOAM533LqUxdQ0pIbB4t+Hz5qLUISi4fKKWredJGKImXxCTcJ0KiM3s0
 OsQtBiiwyVgoVri8LewMUmNyiOPJHBFBzA7Fivo=
X-Google-Smtp-Source: ABdhPJyObd5dZicfYqfgZGS7t623RNq1HBJuihwrzy+uNE8E/S1ybLq2MDhXTWvYE6go/0WP8FDk7HMUmfiwoT/terk=
X-Received: by 2002:a25:ae12:: with SMTP id a18mr62038171ybj.412.1637599635956; 
 Mon, 22 Nov 2021 08:47:15 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Nov 2021 17:47:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9pShXywMogVkcBsXtfKxFHmQLe0F9cMF27aveUz6iyWhA@mail.gmail.com>
Message-ID: <CAHmME9pShXywMogVkcBsXtfKxFHmQLe0F9cMF27aveUz6iyWhA@mail.gmail.com>
Subject: RPM raw-wakeref not held in intel_pxp_fini_hw
To: Vitaly Lubart <vitaly.lubart@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, 
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Intel PXPers,

I hit this splat on 5.16-rc1 during system suspend:

Nov 22 13:54:09 thinkpad systemd-logind[934]: Lid closed.
Nov 22 13:54:09 thinkpad systemd[1]: Reached target Sleep.
Nov 22 13:54:09 thinkpad systemd[1]: Starting System Suspend...
Nov 22 13:54:09 thinkpad systemd-sleep[519259]: Entering sleep state
'suspend'...
Nov 22 13:54:09 thinkpad kernel: PM: suspend entry (s2idle)
Nov 22 15:22:05 thinkpad kernel: Filesystems sync: 0.124 seconds
Nov 22 15:22:05 thinkpad kernel: Freezing user space processes ...
(elapsed 0.001 seconds) done.
Nov 22 15:22:05 thinkpad kernel: OOM killer disabled.
Nov 22 15:22:05 thinkpad kernel: Freezing remaining freezable tasks
... (elapsed 0.001 seconds) done.
Nov 22 15:22:05 thinkpad kernel: printk: Suspending console(s) (use
no_console_suspend to debug)
Nov 22 15:22:05 thinkpad kernel: ------------[ cut here ]------------
Nov 22 15:22:05 thinkpad kernel: RPM wakelock ref not held during HW access
Nov 22 15:22:05 thinkpad kernel: WARNING: CPU: 10 PID: 519259 at
drivers/gpu/drm/i915/intel_runtime_pm.h:112
fwtable_write32+0x1cb/0x200 [i915]
Nov 22 15:22:05 thinkpad kernel: Modules linked in: cdc_mbim cdc_wdm
cdc_ncm cdc_ether usbnet mii snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device rfcomm cmac algif_skcipher bnep uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 btusb
videobuf2_common btintel blue>
Nov 22 15:22:05 thinkpad kernel:  i2c_designware_platform
i2c_designware_core mei_pxp mei_hdcp ac97_bus kvm_intel snd_hda_intel
snd_intel_dspcfg intel_rapl_msr think_lmi snd_intel_sdw_acpi i915
firmware_attributes_class wmi_bmof snd_hda_codec kvm i2c_algo_bit
snd_hwdep int>
Nov 22 15:22:05 thinkpad kernel: CPU: 10 PID: 519259 Comm:
systemd-sleep Tainted: G S   U            5.16.0-rc1+ #192
Nov 22 15:22:05 thinkpad kernel: Hardware name: LENOVO
20Y5CTO1WW/20Y5CTO1WW, BIOS N40ET28W (1.10 ) 09/09/2021
Nov 22 15:22:05 thinkpad kernel: RIP: 0010:fwtable_write32+0x1cb/0x200 [i915]
Nov 22 15:22:05 thinkpad kernel: Code: 21 cb df 0f 0b e9 85 fe ff ff
80 3d 36 68 1f 00 00 0f 85 82 fe ff ff 48 c7 c7 70 cf c4 a1 c6 05 22
68 1f 00 01 e8 1c 21 cb df <0f> 0b e9 68 fe ff ff 48 8b bb 40 01 00 00
e8 a2 cf ce df b9 01 00
Nov 22 15:22:05 thinkpad kernel: RSP: 0018:ffff88821d283c80 EFLAGS: 00010282
Nov 22 15:22:05 thinkpad kernel: RAX: 000000000000002a RBX:
ffff88813df707d0 RCX: 0000000000000027
Nov 22 15:22:05 thinkpad kernel: RDX: ffff88901f69b448 RSI:
0000000000000001 RDI: ffff88901f69b440
Nov 22 15:22:05 thinkpad kernel: RBP: 00000000000320f0 R08:
0000000000000d17 R09: ffff88821d283c20
Nov 22 15:22:05 thinkpad kernel: R10: 3fffffffffffffff R11:
fffffffffff93a78 R12: 0000000040000000
Nov 22 15:22:05 thinkpad kernel: R13: 0000000000000000 R14:
ffff888101311150 R15: ffffffff81491b20
Nov 22 15:22:05 thinkpad kernel: FS:  00007efcfaa87800(0000)
GS:ffff88901f680000(0000) knlGS:0000000000000000
Nov 22 15:22:05 thinkpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 22 15:22:05 thinkpad kernel: CR2: 00007efcfb41e6f0 CR3:
00000005ed937004 CR4: 0000000000770ee0
Nov 22 15:22:05 thinkpad kernel: PKRU: 55555554
Nov 22 15:22:05 thinkpad kernel: Call Trace:
Nov 22 15:22:05 thinkpad kernel:  <TASK>
Nov 22 15:22:05 thinkpad kernel:  intel_pxp_fini_hw+0x23/0x30 [i915]
Nov 22 15:22:05 thinkpad kernel:  intel_pxp_suspend+0x2f/0x40 [i915]
Nov 22 15:22:05 thinkpad kernel:  i915_gem_backup_suspend+0x6e/0x150 [i915]
Nov 22 15:22:05 thinkpad kernel:  ? pci_target_state+0xc/0xc0
Nov 22 15:22:05 thinkpad kernel:  pci_pm_prepare+0x28/0x60
Nov 22 15:22:05 thinkpad kernel:  dpm_prepare+0xbd/0x370
Nov 22 15:22:05 thinkpad kernel:  dpm_suspend_start+0x16/0x80
Nov 22 15:22:05 thinkpad kernel:  suspend_devices_and_enter+0x104/0x6d0
Nov 22 15:22:05 thinkpad kernel:  pm_suspend.cold+0x2f6/0x33d
Nov 22 15:22:05 thinkpad kernel:  state_store+0x6b/0xe0
Nov 22 15:22:05 thinkpad kernel:  kernfs_fop_write_iter+0x107/0x190
Nov 22 15:22:05 thinkpad kernel:  new_sync_write+0x100/0x170
Nov 22 15:22:05 thinkpad kernel:  vfs_write+0x1c5/0x260
Nov 22 15:22:05 thinkpad kernel:  ksys_write+0x4a/0xc0
Nov 22 15:22:05 thinkpad kernel:  do_syscall_64+0x35/0x80
Nov 22 15:22:05 thinkpad kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
Nov 22 15:22:05 thinkpad kernel: RIP: 0033:0x7efcfb27ccb3
Nov 22 15:22:05 thinkpad kernel: Code: 8b 15 81 11 0f 00 f7 d8 64 89
02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0
75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48
83 ec 28 48 89 54 24 18
Nov 22 15:22:05 thinkpad kernel: RSP: 002b:00007fff279a5308 EFLAGS:
00000246 ORIG_RAX: 0000000000000001
Nov 22 15:22:05 thinkpad kernel: RAX: ffffffffffffffda RBX:
0000000000000004 RCX: 00007efcfb27ccb3
Nov 22 15:22:05 thinkpad kernel: RDX: 0000000000000004 RSI:
00007fff279a5400 RDI: 0000000000000004
Nov 22 15:22:05 thinkpad kernel: RBP: 00005571997e72d0 R08:
0000000000000007 R09: 00005571997eb4a0
Nov 22 15:22:05 thinkpad kernel: R10: 11500bc5676901a3 R11:
0000000000000246 R12: 0000000000000004
Nov 22 15:22:05 thinkpad kernel: R13: 00007fff279a5400 R14:
0000000000000004 R15: 00007efcfb36aa00
Nov 22 15:22:05 thinkpad kernel:  </TASK>
Nov 22 15:22:05 thinkpad kernel: ---[ end trace efcf3c6627ff7163 ]---
Nov 22 15:22:05 thinkpad kernel: ------------[ cut here ]------------
Nov 22 15:22:05 thinkpad kernel: RPM raw-wakeref not held
Nov 22 15:22:05 thinkpad kernel: WARNING: CPU: 0 PID: 518230 at
drivers/gpu/drm/i915/intel_runtime_pm.h:104
fwtable_write32+0x1a4/0x200 [i915]
Nov 22 15:22:05 thinkpad kernel: Modules linked in: cdc_mbim cdc_wdm
cdc_ncm cdc_ether usbnet mii snd_seq_dummy snd_hrtimer snd_seq
snd_seq_device rfcomm cmac algif_skcipher bnep uvcvideo
videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 btusb
videobuf2_common btintel blue>
Nov 22 15:22:05 thinkpad kernel:  i2c_designware_platform
i2c_designware_core mei_pxp mei_hdcp ac97_bus kvm_intel snd_hda_intel
snd_intel_dspcfg intel_rapl_msr think_lmi snd_intel_sdw_acpi i915
firmware_attributes_class wmi_bmof snd_hda_codec kvm i2c_algo_bit
snd_hwdep int>
Nov 22 15:22:05 thinkpad kernel: CPU: 0 PID: 518230 Comm:
kworker/u32:4 Tainted: G S   U  W         5.16.0-rc1+ #192
Nov 22 15:22:05 thinkpad kernel: Hardware name: LENOVO
20Y5CTO1WW/20Y5CTO1WW, BIOS N40ET28W (1.10 ) 09/09/2021
Nov 22 15:22:05 thinkpad kernel: Workqueue: events_unbound async_run_entry_fn
Nov 22 15:22:05 thinkpad kernel: RIP: 0010:fwtable_write32+0x1a4/0x200 [i915]
Nov 22 15:22:05 thinkpad kernel: Code: 00 00 c6 00 00 e9 02 ff ff ff
80 3d 5e 68 1f 00 00 0f 85 9f fe ff ff 48 c7 c7 a0 51 c7 a1 c6 05 4a
68 1f 00 01 e8 43 21 cb df <0f> 0b e9 85 fe ff ff 80 3d 36 68 1f 00 00
0f 85 82 fe ff ff 48 c7
Nov 22 15:22:05 thinkpad kernel: RSP: 0018:ffff8882e341bc60 EFLAGS: 00010286
Nov 22 15:22:05 thinkpad kernel: RAX: 0000000000000018 RBX:
ffff88813df707d0 RCX: 0000000000000027
Nov 22 15:22:05 thinkpad kernel: RDX: ffff88901f41b448 RSI:
0000000000000001 RDI: ffff88901f41b440
Nov 22 15:22:05 thinkpad kernel: RBP: 00000000000320f0 R08:
0000000000000da7 R09: ffff8882e341bc00
Nov 22 15:22:05 thinkpad kernel: R10: 3fffffffffffffff R11:
fffffffffff94e08 R12: 0000000040000000
Nov 22 15:22:05 thinkpad kernel: R13: 0000000000000000 R14:
ffff888102394150 R15: ffff888100068005
Nov 22 15:22:05 thinkpad kernel: FS:  0000000000000000(0000)
GS:ffff88901f400000(0000) knlGS:0000000000000000
Nov 22 15:22:05 thinkpad kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Nov 22 15:22:05 thinkpad kernel: CR2: 00007f3018027098 CR3:
000000000200a001 CR4: 0000000000770ef0
Nov 22 15:22:05 thinkpad kernel: PKRU: 55555554
Nov 22 15:22:05 thinkpad kernel: Call Trace:
Nov 22 15:22:05 thinkpad kernel:  <TASK>
Nov 22 15:22:05 thinkpad kernel:  intel_pxp_fini_hw+0x23/0x30 [i915]
Nov 22 15:22:05 thinkpad kernel:  i915_pxp_tee_component_unbind+0x19/0x40 [i915]
Nov 22 15:22:05 thinkpad kernel:  component_unbind+0x26/0x40
Nov 22 15:22:05 thinkpad kernel:  component_unbind_all+0x85/0x90
Nov 22 15:22:05 thinkpad kernel:  component_master_del+0x73/0x90
Nov 22 15:22:05 thinkpad kernel:  mei_pxp_remove+0x23/0x50 [mei_pxp]
Nov 22 15:22:05 thinkpad kernel:  mei_cl_device_remove+0x1a/0x80 [mei]
Nov 22 15:22:05 thinkpad kernel:  __device_release_driver+0x172/0x230
Nov 22 15:22:05 thinkpad kernel:  device_release_driver+0x1f/0x30
Nov 22 15:22:05 thinkpad kernel:  mei_cl_bus_remove_devices+0x56/0x70 [mei]
Nov 22 15:22:05 thinkpad kernel:  mei_stop+0x32/0xc0 [mei]
Nov 22 15:22:05 thinkpad kernel:  mei_me_pci_suspend+0x1f/0x50 [mei_me]
Nov 22 15:22:05 thinkpad kernel:  ? pci_pm_suspend_noirq+0x270/0x270
Nov 22 15:22:05 thinkpad kernel:  pci_pm_suspend+0x6c/0x200
Nov 22 15:22:05 thinkpad kernel:  ? pci_pm_suspend_noirq+0x270/0x270
Nov 22 15:22:05 thinkpad kernel:  dpm_run_callback+0x36/0x100
Nov 22 15:22:05 thinkpad kernel:  __device_suspend+0x122/0x4c0
Nov 22 15:22:05 thinkpad kernel:  async_suspend+0x16/0x90
Nov 22 15:22:05 thinkpad kernel:  async_run_entry_fn+0x15/0x90
Nov 22 15:22:05 thinkpad kernel:  process_one_work+0x1ce/0x370
Nov 22 15:22:05 thinkpad kernel:  worker_thread+0x48/0x3c0
Nov 22 15:22:05 thinkpad kernel:  ? rescuer_thread+0x350/0x350
Nov 22 15:22:05 thinkpad kernel:  kthread+0x13c/0x160
Nov 22 15:22:05 thinkpad kernel:  ? set_kthread_struct+0x40/0x40
Nov 22 15:22:05 thinkpad kernel:  ret_from_fork+0x1f/0x30
Nov 22 15:22:05 thinkpad kernel:  </TASK>
Nov 22 15:22:05 thinkpad kernel: ---[ end trace efcf3c6627ff7164 ]---

As this is new code in 5.16, I thought I should report it to you. I
haven't started debugging it yet, and I'll load up rc2 this evening as
well.

Jason
