Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF871845459
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 10:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1849C10EAF8;
	Thu,  1 Feb 2024 09:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id BB9D610EAF8
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Feb 2024 09:42:34 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1134)
 id 5D31E20B2000; Thu,  1 Feb 2024 01:42:32 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5D31E20B2000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1706780552;
 bh=TtVVIL0fmT4jjW5yn/IxlLyRPHFaxctFi3+VsBe+BZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nGa8UejeJLqvimFc4lVrLgGnYGlZyDw90nN8sL8OEsPBgrRvhW9sAiD7IJKGLn9jq
 luPCD6RkUlrJyTa+XWSmAZPxsWJJs1YZupadlhNZfqUdQNSRgdfGAYxPDcsRMSEdBq
 NeYawDBEcnIwVqffaTCipB6K6vZePb/Y1C8IBlbU=
Date: Thu, 1 Feb 2024 01:42:32 -0800
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH v3] drm: Check output polling initialized before disabling
Message-ID: <20240201094232.GA22003@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1705293646-31301-1-git-send-email-shradhagupta@linux.microsoft.com>
 <202401191128.db8423f1-oliver.sang@intel.com>
 <20240122104959.GA20221@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122104959.GA20221@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Shradha Gupta <shradhagupta@microsoft.com>,
 oe-lkp@lists.linux.dev, Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 02:49:59AM -0800, Shradha Gupta wrote:
> Hi all, 
> to me it seems like the patch has uncovered a genuine warning in drm_helper_probe_single_connector_modes() function.
> Before calling drm_kms_helper_poll_enable() there should be check to see if mode_config.poll_enabled is set similar
> to the new suspend/resume changes in the patch.
> Is this understanding correct? Thoughts?
Gentle reminder about this.
I am planning of submitted this suggested fix, along with the original patch in a patchset. Hope that makes sense.
> 
> On Fri, Jan 19, 2024 at 02:46:47PM +0800, kernel test robot wrote:
> > 
> > 
> > Hello,
> > 
> > kernel test robot noticed "WARNING:at_drivers/gpu/drm/drm_probe_helper.c:#drm_kms_helper_poll_enable[drm_kms_helper]" on:
> > 
> > commit: 98a690eb11a5f722cfff1dd5c3ac46f9ba326919 ("[PATCH v3] drm: Check output polling initialized before disabling")
> > url: https://github.com/intel-lab-lkp/linux/commits/Shradha-Gupta/drm-Check-output-polling-initialized-before-disabling/20240115-124300
> > base: git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> > patch subject: [PATCH v3] drm: Check output polling initialized before disabling
> > 
> > in testcase: boot
> > 
> > compiler: gcc-12
> > test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G
> > 
> > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > 
> > 
> > +-------------------------------------------------------------------------------------------+------------+------------+
> > |                                                                                           | 45017df303 | 98a690eb11 |
> > +-------------------------------------------------------------------------------------------+------------+------------+
> > | WARNING:at_drivers/gpu/drm/drm_probe_helper.c:#drm_kms_helper_poll_enable[drm_kms_helper] | 0          | 8          |
> > | RIP:drm_kms_helper_poll_enable[drm_kms_helper]                                            | 0          | 8          |
> > +-------------------------------------------------------------------------------------------+------------+------------+
> > 
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > | Closes: https://lore.kernel.org/oe-lkp/202401191128.db8423f1-oliver.sang@intel.com
> > 
> > 
> > 
> > The kernel config and materials to reproduce are available at:
> > https://download.01.org/0day-ci/archive/20240119/202401191128.db8423f1-oliver.sang@intel.com
> > 
> > 
> > 
> > [   19.037694][  T142] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.0 on minor 0
> > [   19.038726][  T142] ------------[ cut here ]------------
> > [   19.039197][  T142] bochs-drm 0000:00:02.0: drm_WARN_ON_ONCE(!dev->mode_config.poll_enabled)
> > [   19.039241][  T142] WARNING: CPU: 0 PID: 142 at drivers/gpu/drm/drm_probe_helper.c:305 drm_kms_helper_poll_enable+0x329/0x410 [drm_kms_helper]
> > [   19.040963][  T142] Modules linked in: parport(+) bochs(+) joydev serio_raw drm_vram_helper ata_piix(+) drm_ttm_helper ttm libata ipmi_devintf ipmi_msghandler drm_kms_helper i2c_piix4 fuse drm ip_tables
> > [   19.042413][  T142] CPU: 0 PID: 142 Comm: systemd-udevd Not tainted 6.7.0-rc3-00770-g98a690eb11a5 #1
> > [   19.043146][  T142] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
> > [   19.043972][  T142] RIP: 0010:drm_kms_helper_poll_enable+0x329/0x410 [drm_kms_helper]
> > [   19.044685][  T142] Code: 48 8b 6b 50 48 85 ed 74 41 48 89 df e8 30 e0 5d c3 48 c7 c1 e0 8c 4b c0 48 89 ea 48 c7 c7 40 8a 4b c0 48 89 c6 e8 77 a3 d3 c1 <0f> 0b e9 ae fd ff ff e8 9b c6 53 c2 e9 4c fd ff ff 48 8b 7c 24 08
> > [   19.046268][  T142] RSP: 0000:ffffc900007ef1c0 EFLAGS: 00010286
> > [   19.046755][  T142] RAX: 0000000000000000 RBX: ffff888121dc40c0 RCX: 0000000000000027
> > [   19.047400][  T142] RDX: 0000000000000027 RSI: 0000000000000004 RDI: ffff8883af030848
> > [   19.048042][  T142] RBP: ffff888121d84260 R08: 0000000000000001 R09: ffffed1075e06109
> > [   19.048688][  T142] R10: ffff8883af03084b R11: 0000000000000001 R12: ffff88815688a7a0
> > [   19.049362][  T142] R13: 1ffff920000fde3b R14: 0000000000000000 R15: 0000000000000003
> > [   19.050001][  T142] FS:  0000000000000000(0000) GS:ffff8883af000000(0063) knlGS:00000000f7950b00
> > [   19.050722][  T142] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> > [   19.051259][  T142] CR2: 0000000058b17d6c CR3: 000000012463e000 CR4: 00000000000406f0
> > [   19.051892][  T142] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > [   19.052568][  T142] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > [   19.053242][  T142] Call Trace:
> > [   19.053531][  T142]  <TASK>
> > [   19.053780][  T142]  ? __warn+0xcd/0x260
> > [   19.054149][  T142]  ? drm_kms_helper_poll_enable+0x329/0x410 [drm_kms_helper]
> > [   19.054787][  T142]  ? report_bug+0x267/0x2d0
> > [   19.055173][  T142]  ? handle_bug+0x3c/0x70
> > [   19.055523][  T142]  ? exc_invalid_op+0x17/0x40
> > [   19.055904][  T142]  ? asm_exc_invalid_op+0x1a/0x20
> > [   19.056332][  T142]  ? drm_kms_helper_poll_enable+0x329/0x410 [drm_kms_helper]
> > [   19.056941][  T142]  ? drm_kms_helper_poll_fini+0x80/0x80 [drm_kms_helper]
> > [   19.057567][  T142]  ? drm_modeset_lock+0xbf/0x2e0 [drm]
> > [   19.058099][  T142]  drm_helper_probe_single_connector_modes+0x3b6/0xe70 [drm_kms_helper]
> > [   19.058788][  T142]  ? __drm_helper_update_and_validate+0xc30/0xc30 [drm_kms_helper]
> > [   19.059484][  T142]  ? __mutex_lock_slowpath+0x10/0x10
> > [   19.059924][  T142]  drm_client_modeset_probe+0x3ab/0xef0 [drm]
> > [   19.060491][  T142]  ? drm_client_firmware_config+0x1980/0x1980 [drm]
> > [   19.061233][  T142]  __drm_fb_helper_initial_config_and_unlock+0xfa/0x7c0 [drm_kms_helper]
> > [   19.061935][  T142]  ? __drm_fb_helper_find_sizes+0x1170/0x1170 [drm_kms_helper]
> > [   19.062577][  T142]  ? mutex_lock+0xa3/0xf0
> > [   19.062941][  T142]  ? __mutex_lock_slowpath+0x10/0x10
> > [   19.063398][  T142]  ? mutex_lock+0xa3/0xf0
> > [   19.063756][  T142]  ? __mutex_lock_slowpath+0x10/0x10
> > [   19.064214][  T142]  drm_fbdev_generic_client_hotplug+0x161/0x210 [drm_kms_helper]
> > [   19.064868][  T142]  drm_client_register+0x168/0x230 [drm]
> > [   19.065410][  T142]  bochs_pci_probe+0x68f/0x8c0 [bochs]
> > [   19.065860][  T142]  ? _raw_spin_lock_irqsave+0x8b/0xe0
> > [   19.066318][  T142]  ? bochs_hw_init+0x650/0x650 [bochs]
> > [   19.066821][  T142]  ? bochs_hw_init+0x650/0x650 [bochs]
> > [   19.067346][  T142]  local_pci_probe+0xda/0x180
> > [   19.067756][  T142]  pci_call_probe+0x160/0x510
> > [   19.068172][  T142]  ? _raw_spin_lock+0x85/0xe0
> > [   19.068575][  T142]  ? pci_dev_set_disconnected+0x30/0x30
> > [   19.069059][  T142]  ? kernfs_add_one+0x2d4/0x440
> > [   19.069483][  T142]  ? pci_assign_irq+0x8a/0x280
> > [   19.069892][  T142]  ? pci_match_device+0x38c/0x690
> > [   19.070338][  T142]  ? kernfs_put+0x1c/0x30
> > [   19.070700][  T142]  pci_device_probe+0xef/0x230
> > [   19.071112][  T142]  ? pci_dma_configure+0x11d/0x170
> > [   19.071532][  T142]  really_probe+0x3d2/0xb40
> > [   19.071911][  T142]  __driver_probe_device+0x18c/0x440
> > [   19.072369][  T142]  ? klist_iter_init+0x70/0x70
> > [   19.072770][  T142]  driver_probe_device+0x4a/0x120
> > [   19.073209][  T142]  __driver_attach+0x1d2/0x490
> > [   19.073609][  T142]  ? __device_attach_driver+0x260/0x260
> > [   19.074084][  T142]  bus_for_each_dev+0x103/0x180
> > [   19.074494][  T142]  ? bus_remove_file+0x40/0x40
> > [   19.074887][  T142]  ? klist_add_tail+0x133/0x260
> > [   19.075311][  T142]  bus_add_driver+0x29a/0x570
> > [   19.075701][  T142]  driver_register+0x134/0x450
> > [   19.076109][  T142]  ? 0xffffffffc06d6000
> > [   19.076457][  T142]  do_one_initcall+0xa1/0x370
> > [   19.076855][  T142]  ? trace_event_raw_event_initcall_level+0x1a0/0x1a0
> > [   19.077428][  T142]  ? kasan_unpoison+0x44/0x70
> > [   19.077823][  T142]  do_init_module+0x22e/0x720
> > [   19.078222][  T142]  load_module+0x1826/0x25e0
> > [   19.078603][  T142]  ? post_relocation+0x370/0x370
> > [   19.079022][  T142]  ? kernel_read_file+0x243/0x820
> > [   19.079431][  T142]  ? __x64_sys_fspick+0x2a0/0x2a0
> > [   19.079844][  T142]  ? init_module_from_file+0xd1/0x130
> > [   19.080295][  T142]  init_module_from_file+0xd1/0x130
> > [   19.080725][  T142]  ? __ia32_sys_init_module+0xb0/0xb0
> > [   19.081194][  T142]  ? userfaultfd_unmap_prep+0x3d0/0x3d0
> > [   19.081657][  T142]  ? _raw_write_lock_irq+0xe0/0xe0
> > [   19.082097][  T142]  idempotent_init_module+0x23b/0x660
> > [   19.082540][  T142]  ? init_module_from_file+0x130/0x130
> > [   19.082986][  T142]  ? __fget_light+0x57/0x3d0
> > [   19.083386][  T142]  __ia32_sys_finit_module+0xbe/0x130
> > [   19.083818][  T142]  __do_fast_syscall_32+0x61/0xd0
> > [   19.084243][  T142]  do_fast_syscall_32+0x33/0x70
> > [   19.084643][  T142]  entry_SYSENTER_compat_after_hwframe+0x70/0x7a
> > [   19.085165][  T142] RIP: 0023:0xf7fb7579
> > [   19.085503][  T142] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> > [   19.086546][  T142] RSP: 002b:00000000ff888b1c EFLAGS: 00200206 ORIG_RAX: 000000000000015e
> > [   19.087012][  T142] RAX: ffffffffffffffda RBX: 0000000000000012 RCX: 00000000f7fa1d41
> > [   19.087442][  T142] RDX: 0000000000000000 RSI: 0000000056b70730 RDI: 0000000056b6c600
> > [   19.087868][  T142] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> > [   19.088324][  T142] R10: 0000000000000000 R11: 0000000000200206 R12: 0000000000000000
> > [   19.088747][  T142] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> > [   19.089176][  T142]  </TASK>
> > [   19.089354][  T142] ---[ end trace 0000000000000000 ]---
> > 
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
