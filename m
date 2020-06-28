Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FA20C7A3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 13:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83766E359;
	Sun, 28 Jun 2020 11:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94066E359
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 11:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593343336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/WMKSGQI38TYlNW8WL946gfAiIfyGwK3d+9dBbUgPI=;
 b=F4EZHdQqX63lrcc3gF/ZpmB6bcZokrdZqE5SbwIxdKOtEpJr0TeRcALwOQR1tfMj/7m1x0
 A1y/c8ILu4Wt8MJGblQ8Fzs3fLwBMp6zYg7pJVvhAFSPOSAGV4yis9yLhSNDMp9REPsQh+
 k4YNAoZDbBjR8ROQy/L7DJrOiOZIDSs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-PZ547Fe_O26JmXhR9Zau-A-1; Sun, 28 Jun 2020 07:22:12 -0400
X-MC-Unique: PZ547Fe_O26JmXhR9Zau-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5877ABFC0;
 Sun, 28 Jun 2020 11:22:11 +0000 (UTC)
Received: from starship (unknown [10.35.206.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D89B10013C2;
 Sun, 28 Jun 2020 11:22:10 +0000 (UTC)
Message-ID: <1b4f51c95a5c7c8c7c62c4e33d9c62584dbef3f2.camel@redhat.com>
Subject: Re: Kernel issues with Radeon Pro WX4100 and DP->HDMI dongles
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 28 Jun 2020 14:22:09 +0300
In-Reply-To: <5bd8ffcc829b71651adca7f16cd52c6800508149.camel@redhat.com>
References: <5bd8ffcc829b71651adca7f16cd52c6800508149.camel@redhat.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-06-25 at 10:14 +0300, Maxim Levitsky wrote:
> Hi,
> 
> I recently tried to connect my TV and WX4100 via two different DP->HDMI dongles.
> One of them makes my main monitor to go dark, and system to lockup (I haven't yet debugged this futher), and the other one seems to work,
> most of the time, but sometimes causes a kernel panic on 5.8.0-rc1:
> 
> 
> [  +0.000000] ---[ end trace 0ce8685fac3db6b5 ]---
> [  +2.142125] [drm:dc_link_detect_helper [amdgpu]] *ERROR* No EDID read.
> [  +0.065348] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.001002] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.006310] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.102119] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.000679] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [ +22.037707] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [ +16.202833] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.000685] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.053875] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.000351] [drm] amdgpu_dm_irq_schedule_work FAILED src 8
> [  +0.031764] ------------[ cut here ]------------
> [  +0.000001] WARNING: CPU: 58 PID: 504 at drivers/gpu/drm/amd/amdgpu/../display/dc/gpio/gpio_base.c:66 dal_gpio_open_ex+0x1b/0x40 [amdgpu]
> [  +0.000001] Modules linked in: vfio_pci vfio_virqfd vfio_iommu_type1 vfio xfs rfcomm xt_MASQUERADE xt_conntrack ipt_REJECT iptable_mangle iptable_nat nf_nat ebtable_filter ebtables ip6table_filter
> ip6_tables tun bridge pmbus cmac pmbus_core ee1004 jc42 bnep sunrpc vfat fat dm_mirror dm_region_hash dm_log iwlmvm wmi_bmof mac80211 kvm_amd kvm libarc4 uvcvideo iwlwifi btusb btrtl btbcm btintel
> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 snd_hda_codec_hdmi videobuf2_common snd_usb_audio bluetooth videodev input_leds snd_hda_intel cfg80211 snd_usbmidi_lib joydev snd_intel_dspcfg
> snd_rawmidi mc snd_hda_codec xpad ff_memless snd_hwdep thunderbolt ecdh_generic snd_seq ecc snd_hda_core irqbypass rfkill i2c_nvidia_gpu efi_pstore pcspkr snd_seq_device bfq snd_pcm snd_timer zenpower
> snd i2c_piix4 rtc_cmos tpm_crb tpm_tis tpm_tis_core tpm wmi button binfmt_misc dm_crypt sd_mod uas usb_storage hid_generic usbhid hid ext4 mbcache jbd2 amdgpu gpu_sched ttm drm_kms_helper syscopyarea
> sysfillrect
> [  +0.000018]  sysimgblt crc32_pclmul ahci crc32c_intel fb_sys_fops libahci igb ccp cec xhci_pci libata i2c_algo_bit rng_core nvme xhci_hcd drm nvme_core t10_pi nbd usbmon it87 hwmon_vid fuse i2c_dev
> i2c_core ipv6 autofs4 [last unloaded: nvidia]
> [  +0.000005] CPU: 58 PID: 504 Comm: kworker/58:1 Tainted: P        W  O      5.8.0-rc1.stable #118
> [  +0.000001] Hardware name: Gigabyte Technology Co., Ltd. TRX40 DESIGNARE/TRX40 DESIGNARE, BIOS F4c 03/05/2020
> [  +0.000000] Workqueue: events dm_irq_work_func [amdgpu]
> [  +0.000001] RIP: 0010:dal_gpio_open_ex+0x1b/0x40 [amdgpu]
> [  +0.000001] Code: 08 89 47 10 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 83 7f 08 00 75 0f 48 83 7f 18 00 74 15 89 77 20 e9 65 07 00 00 <0f> 0b e8 ae 5b 8a e0 b8 05 00 00 00 c3 0f 0b e8 a1
> 5b 8a e0 b8 06
> [  +0.000000] RSP: 0018:ffffc90002e93b90 EFLAGS: 00010282
> [  +0.000001] RAX: 0000000000000000 RBX: ffff889fa4736ca0 RCX: 0000000000000000
> [  +0.000000] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff889fa011ff00
> [  +0.000001] RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000231
> [  +0.000000] R10: 000000000000017f R11: ffff889fbeea4b84 R12: ffffc90002e93c74
> [  +0.000000] R13: 0000000000000000 R14: ffff889fa4736ca0 R15: ffff889fb0e2c100
> [  +0.000001] FS:  0000000000000000(0000) GS:ffff889fbee80000(0000) knlGS:0000000000000000
> [  +0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.000001] CR2: 00001ee62a52b000 CR3: 000000174d175000 CR4: 0000000000340ea0
> [  +0.000000] Call Trace:
> [  +0.000000]  dal_ddc_open+0x2d/0xe0 [amdgpu]
> [  +0.000001]  ? dm_read_reg_func+0x33/0xa0 [amdgpu]
> [  +0.000000]  dce_aux_transfer_raw+0xb4/0xa30 [amdgpu]
> [  +0.000000]  ? hrtimer_try_to_cancel+0x28/0x100
> [  +0.000001]  dm_dp_aux_transfer+0x8f/0xf0 [amdgpu]
> [  +0.000000]  drm_dp_dpcd_access+0x6b/0x110 [drm_kms_helper]
> [  +0.000000]  drm_dp_dpcd_read+0xb6/0xf0 [drm_kms_helper]
> [  +0.000001]  dm_helpers_dp_read_dpcd+0x28/0x50 [amdgpu]
> [  +0.000000]  core_link_read_dpcd.part.0+0x1f/0x30 [amdgpu]
> [  +0.000000]  read_hpd_rx_irq_data+0x39/0x90 [amdgpu]
> [  +0.000001]  dc_link_handle_hpd_rx_irq+0x74/0x7c0 [amdgpu]
> [  +0.000000]  handle_hpd_rx_irq+0x62/0x2e0 [amdgpu]
> [  +0.000000]  ? __schedule+0x252/0x6a0
> [  +0.000001]  ? finish_task_switch+0x18d/0x280
> [  +0.000000]  dm_irq_work_func+0x43/0x50 [amdgpu]
> [  +0.000000]  process_one_work+0x1d2/0x390
> [  +0.000000]  worker_thread+0x225/0x3b0
> [  +0.000001]  ? process_one_work+0x390/0x390
> [  +0.000000]  kthread+0xf9/0x130
> [  +0.000000]  ? kthread_park+0x90/0x90
> [  +0.000001]  ret_from_fork+0x1f/0x30
> [  +0.000000] ---[ end trace 0ce8685fac3db6b6 ]---
> [  +0.002807] int3: 0000 [#1] SMP
> [  +0.000001] CPU: 58 PID: 504 Comm: kworker/58:1 Tainted: P        W  O      5.8.0-rc1.stable #118
> [  +0.000001] Hardware name: Gigabyte Technology Co., Ltd. TRX40 DESIGNARE/TRX40 DESIGNARE, BIOS F4c 03/05/2020
> [  +0.000000] Workqueue: events dm_irq_work_func [amdgpu]
> [  +0.000001] RIP: 0010:kgdb_breakpoint+0x10/0x20
> [  +0.000001] Code: 4d f9 ff eb c5 cc cc cc cc cc 0f 1f 44 00 00 31 c0 c3 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 f0 ff 05 3c be 3e 01 0f ae f8 cc <0f> ae f8 f0 ff 0d 2e be 3e 01 c3 0f 1f 44 00 00 0f
> 1f 44 00 00 e8
> [  +0.000000] RSP: 0018:ffffc90002e93b88 EFLAGS: 00000202
> [  +0.000001] RAX: 0000000000000000 RBX: ffff889fa4736ca0 RCX: 0000000000000000
> [  +0.000001] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff889fa011ff00
> [  +0.000000] RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000231
> [  +0.000001] R10: 000000000000017f R11: ffff889fbeea4b84 R12: ffffc90002e93c74
> [  +0.000000] R13: 0000000000000000 R14: ffff889fa4736ca0 R15: ffff889fb0e2c100
> [  +0.000001] FS:  0000000000000000(0000) GS:ffff889fbee80000(0000) knlGS:0000000000000000
> [  +0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.000001] CR2: 00001ee62a52b000 CR3: 000000174d175000 CR4: 0000000000340ea0
> [  +0.000000] Call Trace:
> [  +0.000001]  dal_gpio_open_ex+0x22/0x40 [amdgpu]
> [  +0.000000]  dal_ddc_open+0x2d/0xe0 [amdgpu]
> [  +0.000000]  ? dm_read_reg_func+0x33/0xa0 [amdgpu]
> [  +0.000001]  dce_aux_transfer_raw+0xb4/0xa30 [amdgpu]
> [  +0.000000]  ? hrtimer_try_to_cancel+0x28/0x100
> [  +0.000000]  dm_dp_aux_transfer+0x8f/0xf0 [amdgpu]
> [  +0.000001]  drm_dp_dpcd_access+0x6b/0x110 [drm_kms_helper]
> [  +0.000000]  drm_dp_dpcd_read+0xb6/0xf0 [drm_kms_helper]
> [  +0.000000]  dm_helpers_dp_read_dpcd+0x28/0x50 [amdgpu]
> [  +0.000001]  core_link_read_dpcd.part.0+0x1f/0x30 [amdgpu]
> [  +0.000000]  read_hpd_rx_irq_data+0x39/0x90 [amdgpu]
> [  +0.000000]  dc_link_handle_hpd_rx_irq+0x74/0x7c0 [amdgpu]
> [  +0.000001]  handle_hpd_rx_irq+0x62/0x2e0 [amdgpu]
> [  +0.000000]  ? __schedule+0x252/0x6a0
> [  +0.000000]  ? finish_task_switch+0x18d/0x280
> [  +0.000001]  dm_irq_work_func+0x43/0x50 [amdgpu]
> [  +0.000000]  process_one_work+0x1d2/0x390
> [  +0.000000]  worker_thread+0x225/0x3b0
> [  +0.000001]  ? process_one_work+0x390/0x390
> [  +0.000000]  kthread+0xf9/0x130
> [  +0.000000]  ? kthread_park+0x90/0x90
> [  +0.000001]  ret_from_fork+0x1f/0x30
> [  +0.000000] Modules linked in: vfio_pci vfio_virqfd vfio_iommu_type1 vfio xfs rfcomm xt_MASQUERADE xt_conntrack ipt_REJECT iptable_mangle iptable_nat nf_nat ebtable_filter ebtables ip6table_filter
> ip6_tables tun bridge pmbus cmac pmbus_core ee1004 jc42 bnep sunrpc vfat fat dm_mirror dm_region_hash dm_log iwlmvm wmi_bmof mac80211 kvm_amd kvm libarc4 uvcvideo iwlwifi btusb btrtl btbcm btintel
> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 snd_hda_codec_hdmi videobuf2_common snd_usb_audio bluetooth videodev input_leds snd_hda_intel cfg80211 snd_usbmidi_lib joydev snd_intel_dspcfg
> snd_rawmidi mc snd_hda_codec xpad ff_memless snd_hwdep thunderbolt ecdh_generic snd_seq ecc snd_hda_core irqbypass rfkill i2c_nvidia_gpu efi_pstore pcspkr snd_seq_device bfq snd_pcm snd_timer zenpower
> snd i2c_piix4 rtc_cmos tpm_crb tpm_tis tpm_tis_core tpm wmi button binfmt_misc dm_crypt sd_mod uas usb_storage hid_generic usbhid hid ext4 mbcache jbd2 amdgpu gpu_sched ttm drm_kms_helper syscopyarea
> sysfillrect
> [  +0.000018]  sysimgblt crc32_pclmul ahci crc32c_intel fb_sys_fops libahci igb ccp cec xhci_pci libata i2c_algo_bit rng_core nvme xhci_hcd drm nvme_core t10_pi nbd usbmon it87 hwmon_vid fuse i2c_dev
> i2c_core ipv6 autofs4 [last unloaded: nvidia]
> [  +0.021468] ---[ end trace 0ce8685fac3db6b7 ]---
> [  +0.000000] RIP: 0010:kgdb_breakpoint+0x10/0x20
> [  +0.000001] Code: 4d f9 ff eb c5 cc cc cc cc cc 0f 1f 44 00 00 31 c0 c3 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 f0 ff 05 3c be 3e 01 0f ae f8 cc <0f> ae f8 f0 ff 0d 2e be 3e 01 c3 0f 1f 44 00 00 0f
> 1f 44 00 00 e8
> [  +0.000000] RSP: 0018:ffffc90002e93b88 EFLAGS: 00000202
> [  +0.000001] RAX: 0000000000000000 RBX: ffff889fa4736ca0 RCX: 0000000000000000
> [  +0.000001] RDX: 0000000000000000 RSI: 0000000000000003 RDI: ffff889fa011ff00
> [  +0.000000] RBP: 0000000000000003 R08: 0000000000000001 R09: 0000000000000231
> [  +0.000001] R10: 000000000000017f R11: ffff889fbeea4b84 R12: ffffc90002e93c74
> [  +0.000000] R13: 0000000000000000 R14: ffff889fa4736ca0 R15: ffff889fb0e2c100
> [  +0.000001] FS:  0000000000000000(0000) GS:ffff889fbee80000(0000) knlGS:0000000000000000
> [  +0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  +0.000000] CR2: 00001ee62a52b000 CR3: 000000174d175000 CR4: 0000000000340ea0
> [  +0.000001] Kernel panic - not syncing: Fatal exception in interrupt
> [  +0.001035] Kernel Offset: disabled
> 
> 
> The 'amdgpu_dm_irq_schedule_work FAILED src 8' errors were from previous plugs of this adapter.
> 
> On 5.7-rc7 kernel I also tried booting, I also see the 'amdgpu_dm_irq_schedule_work FAILED' errors
> but it seems for now that the crash doesn't happen, but it might have beeing luck.
> 
> On top of all this, I tried a 3rd dongle and it does appear to work flawlessly (no messages in dmesg).
Disregard this. The 3rd dongle also caused my kernel to crash yestarday.

Best regards,
	Maxim Levitsky

> 
> Best regards,
> 	Maxim Levitsky


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
