Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672823D785
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 09:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1A86E886;
	Thu,  6 Aug 2020 07:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E1A6E144
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 06:44:34 +0000 (UTC)
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0766h3Ud099616;
 Thu, 6 Aug 2020 15:43:03 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Thu, 06 Aug 2020 15:43:03 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0766h2O5099613
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Thu, 6 Aug 2020 15:43:03 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH 1/8] drm/atomic-helper: reset vblank on crtc reset
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
 <20200702112722.GA18036@pendragon.ideasonboard.com>
 <CAKMK7uGny5Kssrusr5JQSV29WJE62iigD+hx8bgWYAYqhJAiYw@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <a0efe731-dd81-03c7-a539-769492222e42@i-love.sakura.ne.jp>
Date: Thu, 6 Aug 2020 15:43:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uGny5Kssrusr5JQSV29WJE62iigD+hx8bgWYAYqhJAiYw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Aug 2020 07:39:21 +0000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Thierry Reding <treding@nvidia.com>, Brian Masney <masneyb@onstation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jyri Sarha <jsarha@ti.com>, Sean Paul <seanpaul@chromium.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, zhengbin <zhengbin13@huawei.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit 47ec5303d73ea344 ("Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next") on linux.git ,
my VMware environment cannot boot. Do I need to bisect?

[    9.314496][    T1] vga16fb: mapped to 0x0000000071050562
[    9.467770][    T1] Console: switching to colour frame buffer device 80x30
[    9.632092][    T1] fb0: VGA16 VGA frame buffer device
[    9.651768][    T1] ACPI: AC Adapter [ACAD] (on-line)
[    9.672544][    T1] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    9.722373][    T1] ACPI: Power Button [PWRF]
[    9.744231][    T1] ioatdma: Intel(R) QuickData Technology Driver 5.00
[    9.820147][    T1] N_HDLC line discipline registered with maxframe=4096
[    9.835649][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    9.852567][    T1] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[   10.033372][    T1] Cyclades driver 2.6
[   10.049928][    T1] Initializing Nozomi driver 2.1d
[   10.065493][    T1] RocketPort device driver module, version 2.09, 12-June-2003
[   10.095368][    T1] No rocketport ports found; unloading driver
[   10.112430][    T1] Non-volatile memory driver v1.3
[   10.127090][    T1] Linux agpgart interface v0.103
[   10.144037][    T1] agpgart-intel 0000:00:00.0: Intel 440BX Chipset
[   10.162275][    T1] agpgart-intel 0000:00:00.0: AGP aperture is 256M @ 0x0
[   10.181130][    T1] [drm] DMA map mode: Caching DMA mappings.
[   10.195150][    T1] [drm] Capabilities:
[   10.208728][    T1] [drm]   Rect copy.
[   10.222772][    T1] [drm]   Cursor.
[   10.235364][    T1] [drm]   Cursor bypass.
[   10.249121][    T1] [drm]   Cursor bypass 2.
[   10.260590][    T1] [drm]   8bit emulation.
[   10.272220][    T1] [drm]   Alpha cursor.
[   10.284670][    T1] [drm]   3D.
[   10.295051][    T1] [drm]   Extended Fifo.
[   10.305180][    T1] [drm]   Multimon.
[   10.315506][    T1] [drm]   Pitchlock.
[   10.325167][    T1] [drm]   Irq mask.
[   10.334262][    T1] [drm]   Display Topology.
[   10.343519][    T1] [drm]   GMR.
[   10.352775][    T1] [drm]   Traces.
[   10.362166][    T1] [drm]   GMR2.
[   10.370716][    T1] [drm]   Screen Object 2.
[   10.379220][    T1] [drm]   Command Buffers.
[   10.388489][    T1] [drm]   Command Buffers 2.
[   10.396055][    T1] [drm]   Guest Backed Resources.
[   10.403290][    T1] [drm]   DX Features.
[   10.409911][    T1] [drm]   HP Command Queue.
[   10.417820][    T1] [drm] Capabilities2:
[   10.424216][    T1] [drm]   Grow oTable.
[   10.430423][    T1] [drm]   IntraSurface copy.
[   10.436371][    T1] [drm] Max GMR ids is 64
[   10.442651][    T1] [drm] Max number of GMR pages is 65536
[   10.450317][    T1] [drm] Max dedicated hypervisor surface memory is 0 kiB
[   10.458809][    T1] [drm] Maximum display memory size is 262144 kiB
[   10.466330][    T1] [drm] VRAM at 0xe8000000 size is 4096 kiB
[   10.474704][    T1] [drm] MMIO at 0xfe000000 size is 256 kiB
[   10.484625][    T1] [TTM] Zone  kernel: Available graphics memory: 4030538 KiB
[   10.500730][    T1] [TTM] Zone   dma32: Available graphics memory: 2097152 KiB
[   10.516851][    T1] [TTM] Initializing pool allocator
[   10.527542][    T1] [TTM] Initializing DMA pool allocator
[   10.540197][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000438
[   10.550087][    T1] #PF: supervisor read access in kernel mode
[   10.550087][    T1] #PF: error_code(0x0000) - not-present page
[   10.550087][    T1] PGD 0 P4D 0 
[   10.550087][    T1] Oops: 0000 [#1] PREEMPT SMP
[   10.550087][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0+ #271
[   10.550087][    T1] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[   10.550087][    T1] RIP: 0010:drm_dev_has_vblank+0x9/0x20
[   10.550087][    T1] Code: 5d 41 5e 41 5f e9 e7 fa 01 ff e8 e2 fa 01 ff 45 31 e4 41 8b 5f 48 eb a7 cc cc cc cc cc cc cc cc cc 53 48 89 fb e8 c7 fa 01 ff <8b> 83 38 04 00 00 5b 85 c0 0f 95 c0 c3 66 2e 0f 1f 84 00 00 00 00
[   10.550087][    T1] RSP: 0000:ffffc90000027b80 EFLAGS: 00010293
[   10.550087][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   10.550087][    T1] RDX: ffff88823544c040 RSI: ffffffff823265b9 RDI: 0000000000000000
[   10.550087][    T1] RBP: ffff888227238800 R08: 0000000000000001 R09: 0000000000000000
[   10.550087][    T1] R10: ffff888227238800 R11: 0000000000000001 R12: 0000000000000000
[   10.550087][    T1] R13: ffff888235103000 R14: 0000000000000000 R15: ffff888226cc6af0
[   10.850690][    T1] FS:  0000000000000000(0000) GS:ffff888236e00000(0000) knlGS:0000000000000000
[   10.850690][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.850690][    T1] CR2: 0000000000000438 CR3: 0000000004a89001 CR4: 00000000003706f0
[   10.850690][    T1] Call Trace:
[   10.850690][    T1]  __drm_atomic_helper_crtc_reset+0x28/0x50
[   10.850690][    T1]  vmw_du_crtc_reset+0x62/0x80
[   10.850690][    T1]  vmw_kms_stdu_init_display+0x302/0x3f0
[   10.850690][    T1]  vmw_kms_init+0x6f/0xe0
[   10.850690][    T1]  vmw_probe+0xd52/0x1730
[   10.850690][    T1]  local_pci_probe+0x3a/0x90
[   10.850690][    T1]  pci_device_probe+0x163/0x230
[   10.850690][    T1]  ? pci_device_remove+0x100/0x100
[   10.850690][    T1]  really_probe+0x228/0x480
[   10.850690][    T1]  ? rdinit_setup+0x3b/0x3b
[   10.850690][    T1]  driver_probe_device+0x6c/0xe0
[   10.850690][    T1]  device_driver_attach+0x5a/0x60
[   10.850690][    T1]  __driver_attach+0xbd/0x100
[   10.850690][    T1]  ? device_driver_attach+0x60/0x60
[   10.850690][    T1]  bus_for_each_dev+0x9e/0x110
[   10.850690][    T1]  bus_add_driver+0x1c8/0x260
[   10.850690][    T1]  driver_register+0x96/0x160
[   10.850690][    T1]  ? i915_global_vma_init+0x51/0x51
[   11.202435][    T1]  vmwgfx_init+0x2e/0x4e
[   11.202435][    T1]  do_one_initcall+0x84/0x4a0
[   11.202435][    T1]  ? rdinit_setup+0x3b/0x3b
[   11.202435][    T1]  ? rcu_read_lock_sched_held+0x4d/0x80
[   11.202435][    T1]  ? cpumask_test_cpu.constprop.19+0x12/0x30
[   11.202435][    T1]  ? rdinit_setup+0x3b/0x3b
[   11.202435][    T1]  kernel_init_freeable+0x298/0x30c
[   11.202435][    T1]  ? rest_init+0x2c0/0x2c0
[   11.202435][    T1]  kernel_init+0xf/0x170
[   11.282173][    T1]  ? _raw_spin_unlock_irq+0x3a/0x50
[   11.282173][    T1]  ? rest_init+0x2c0/0x2c0
[   11.282173][    T1]  ret_from_fork+0x1f/0x30
[   11.282173][    T1] Modules linked in:
[   11.282173][    T1] CR2: 0000000000000438
[   11.282173][    T1] ---[ end trace fb560758d9d704d3 ]---
[   11.282173][    T1] RIP: 0010:drm_dev_has_vblank+0x9/0x20
[   11.282173][    T1] Code: 5d 41 5e 41 5f e9 e7 fa 01 ff e8 e2 fa 01 ff 45 31 e4 41 8b 5f 48 eb a7 cc cc cc cc cc cc cc cc cc 53 48 89 fb e8 c7 fa 01 ff <8b> 83 38 04 00 00 5b 85 c0 0f 95 c0 c3 66 2e 0f 1f 84 00 00 00 00
[   11.282173][    T1] RSP: 0000:ffffc90000027b80 EFLAGS: 00010293
[   11.282173][    T1] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[   11.282173][    T1] RDX: ffff88823544c040 RSI: ffffffff823265b9 RDI: 0000000000000000
[   11.282173][    T1] RBP: ffff888227238800 R08: 0000000000000001 R09: 0000000000000000
[   11.282173][    T1] R10: ffff888227238800 R11: 0000000000000001 R12: 0000000000000000
[   11.282173][    T1] R13: ffff888235103000 R14: 0000000000000000 R15: ffff888226cc6af0
[   11.282173][    T1] FS:  0000000000000000(0000) GS:ffff888236e00000(0000) knlGS:0000000000000000
[   11.282173][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   11.282173][    T1] CR2: 0000000000000438 CR3: 0000000004a89001 CR4: 00000000003706f0
[   11.282173][    T1] Kernel panic - not syncing: Fatal exception
[   11.282173][    T1] Kernel Offset: disabled
[   11.282173][    T1] Rebooting in 86400 seconds..


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
