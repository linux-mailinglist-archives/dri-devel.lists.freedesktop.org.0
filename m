Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BA82EF4C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:00:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A6710E05B;
	Tue, 16 Jan 2024 12:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com
 [203.205.221.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991C610E05B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1705409988; bh=5oxncUkI6wfKy9fRGdvKdpVnx2LCd9lJ/F3dibwUr1s=;
 h=From:To:Cc:Subject:Date;
 b=llp/sIjHkC9Ea+bBEj2qaUF8Jyak+FC/Z9zyFfnLXRTmCDqe1Pbk2WNK1S9jET2oR
 EEI9bcUezf2yiW/kkJnGBlvvRzm4RSlFmpnNSP9E24VgO7GgAInWJcixLcOxdT5SLq
 N3CcHkSqTE4ZpdWgSFSnYjWa7RBWRwQB/OTfaAQE=
Received: from cyy-pc.lan ([218.70.255.90])
 by newxmesmtplogicsvrszb9-1.qq.com (NewEsmtp) with SMTP
 id ED48E241; Tue, 16 Jan 2024 20:59:20 +0800
X-QQ-mid: xmsmtpt1705409960tfe7f0q3w
Message-ID: <tencent_40DF99E09A3681E339EE570C430878232106@qq.com>
X-QQ-XMAILINFO: NTd5rXTd3igrH8PrXgnd8vqogNMgdHx4OoUEIy9Jq4TiBLKptFWJ6e1h4HB9H6
 OUJ/GsbLYX3Q3LUIX6YhudSOyy+cZzp8bsk+JQI1Woe/kiAVyA+I+qYUoGBVIWCRV+pQ+js2eatZ
 7tfVh2bEg2aRdx1a/b0MByssX+RwevMs/TE1Wd5mFkWfN2UWB1CfopWhdj2IG8wrlNw+pxtuyqpm
 lzTB0B+V/BGeHTNQMmXvqZKOkN7DezKmbM2Ukdy1d38J7EujW9sn1QcyR2ecPuI+Ym2ofEeUqhyD
 Vij4rDyT3M2ScRrEghOnbfGs7s7DhFakQq+WQ7jkWUkhLoLJldPUiAEogMNTRIbzS8cHncVKv/O/
 EMCjOuX14gOLRd6IeaAUDkOrXsgJ23KCNEpgVXejxDn/yY9fE4ZETCKxx34d/XOZhHRdY4q7azo/
 R/ykqvPDdHnek12YoQOp6Klz6MgHJV/vX1oIKOfJLtrbdVQjp0DHXiLEuLrN4+61y9KVUU2ngaJs
 ffHGTBFzDfwAN5YyiqWChmYXEwkvLzSEjjZAD5nMJ7pAn8Xw/jMmxaE4sl7MPiocZNCk+9xvXuqB
 tkQVLtzDzq6nU0yRCTSxHOSXAX88qt/adnI77i2o8lLSXAGKeokWxiFdJhPca8OEWWjgWBowN3Cn
 ILtId/rwnfUdLmBJQ7GV9apECgydv45kj4r9LXxOvzUMz18nyVL8f8Hq82QYYgw2cwTBV+fQgLgg
 8TeGPqOKeL0e7dTTU71HumE5fmRagPkB7eqHQ4dpYhe7M9BCA20ZyqVce+XK4BaPQMbFqIcRx2kO
 PLBfeHtTZsUD3LEyuuL2G55Z65nFYDE90XsCHLlks65o8eYu+KYLeOvxrhMrEt6CYHt2SbCQUl2e
 JiBLWnxlHT1Nx2JwGuICW/4McyY6i/f5fYCDv3I3wKTjIixjC1vREz49X/DhTGUqv6Wr3WoeONBc
 TCxIidewmjYkYRP3sJ39Fi9aX/raHhVAURruot/piRpaClV5BgVsIwVyXHaYiaFcJ1DRDwzqrvxp
 u+FiC/7CcPPN92JNqq
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] drm/ttm: allocate dummy_read_page without DMA32 on fail
Date: Tue, 16 Jan 2024 20:58:56 +0800
X-OQ-MSGID: <20240116125856.148504-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel@ffwll.ch>, Jiuyang Liu <liu@jiuyang.me>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Yangyu Chen <cyy@cyyself.name>, Huang Rui <ray.huang@amd.com>,
 Icenowy Zheng <uwu@icenowy.me>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Christian Koenig <christian.koenig@amd.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some platforms may not have any memory below 4GB address space, but the
kernel defines ZONE_DMA32 on their ISA. Thus these platforms will have
an empty DMA32 zone, resulting ttm failing when alloc_page with GFP_DMA32
flag. However, we can't directly allocate dummy_read_page without
GFP_DMA32 as some reasons mentioned in the previous patch review [1].

Thus, a solution is to allocate dummy_read_page with GFP_DMA32 first,
if it fails, then allocate it without GFP_DMA32. After this patch, the
amdgpu works on such platforms.

Here is dmesg output on such RISC-V platforms with Radeon RX550 after this
patch:

[    0.000000] Linux version 6.7.0-dirty (cyy@cyy-pc) (riscv64-linux-gnu-gcc (Debian 13.2.0-7) 13.2.0, GNU ld (GNU Binutils for Debian) 2.41.50.20231227) #12 SMP Tue Jan 16 18:55:13 CST 2024
[    0.000000] Machine model: 
[    0.000000] SBI specification v2.0 detected
[    0.000000] SBI implementation ID=0x1 Version=0x10004
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] efi: UEFI not found.
[    0.000000] OF: reserved mem: 0x0000002000000000..0x000000200003ffff (256 KiB) nomap non-reusable mmode_resv1@20,0
[    0.000000] OF: reserved mem: 0x0000002000040000..0x000000200005ffff (128 KiB) nomap non-reusable mmode_resv0@20,40000
[    0.000000] Zone ranges:
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000002000000000-0x00000021ffffffff]
...
[   35.834951] [drm] amdgpu kernel modesetting enabled.
[   35.840235] [drm] initializing kernel modesetting (POLARIS12 0x1002:0x699F 0x1043:0x0513 0xC7).
[   35.848966] [drm] register mmio base: 0xA8100000
[   35.853585] [drm] register mmio size: 262144
[   35.857971] [drm] add ip block number 0 <vi_common>
[   35.862858] [drm] add ip block number 1 <gmc_v8_0>
[   35.867659] [drm] add ip block number 2 <tonga_ih>
[   35.867662] [drm] add ip block number 3 <gfx_v8_0>
[   35.867665] [drm] add ip block number 4 <sdma_v3_0>
[   35.867667] [drm] add ip block number 5 <powerplay>
[   35.867670] [drm] add ip block number 6 <dm>
[   35.867672] [drm] add ip block number 7 <uvd_v6_0>
[   35.867674] [drm] add ip block number 8 <vce_v3_0>
[   36.075310] amdgpu 0000:05:00.0: amdgpu: Fetched VBIOS from ROM BAR
[   36.081605] amdgpu: ATOM BIOS: 115-C994PI2-100
[   36.087612] [drm] UVD is enabled in VM mode
[   36.095773] [drm] UVD ENC is enabled in VM mode
[   36.100470] [drm] VCE enabled in VM mode
[   36.104401] amdgpu 0000:05:00.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[   36.112502] amdgpu 0000:05:00.0: amdgpu: PCIE atomic ops is not supported
[   36.119314] [drm] GPU posting now...
[   36.234098] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[   36.246817] amdgpu 0000:05:00.0: amdgpu: VRAM: 4096M 0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[   36.256397] amdgpu 0000:05:00.0: amdgpu: GART: 256M 0x000000FF00000000 - 0x000000FF0FFFFFFF
[   36.264758] [drm] Detected VRAM RAM=4096M, BAR=256M
[   36.269642] [drm] RAM width 128bits GDDR5
[   36.269691] warn_alloc: 8 callbacks suppressed
[   36.269693] (udev-worker): page allocation failure: order:0, mode:0x104(GFP_DMA32|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
[   36.290196] CPU: 2 PID: 145 Comm: (udev-worker) Not tainted 6.7.0-dirty #12
[   36.302796] Hardware name: (DT)
[   36.307670] Call Trace:
[   36.310285] [<ffffffff80006056>] dump_backtrace+0x1c/0x24
[   36.315685] [<ffffffff8096b860>] show_stack+0x2c/0x38
[   36.320737] [<ffffffff80977f14>] dump_stack_lvl+0x3c/0x54
[   36.326135] [<ffffffff80977f40>] dump_stack+0x14/0x1c
[   36.331184] [<ffffffff8018e66c>] warn_alloc+0xee/0x16c
[   36.336321] [<ffffffff8018f17a>] __alloc_pages+0xa90/0xb40
[   36.350397] [<ffffffff017bd850>] ttm_global_init+0x12a/0x1d4 [ttm]
[   36.356746] [<ffffffff017bd92c>] ttm_device_init+0x32/0x158 [ttm]
[   36.362851] [<ffffffff0186d8bc>] amdgpu_ttm_init+0x7a/0x638 [amdgpu]
[   36.377419] [<ffffffff01b758b8>] amdgpu_bo_init+0x76/0x82 [amdgpu]
[   36.386468] [<ffffffff018ebb6e>] gmc_v8_0_sw_init+0x36c/0x652 [amdgpu]
[   36.395840] [<ffffffff0185b8fa>] amdgpu_device_init+0x1648/0x20fa [amdgpu]
[   36.408621] [<ffffffff0185dc1a>] amdgpu_driver_load_kms+0x1e/0x158 [amdgpu]
[   36.418384] [<ffffffff018549d4>] amdgpu_pci_probe+0x124/0x46c [amdgpu]
[   36.433203] [<ffffffff804ae3ae>] pci_device_probe+0x7a/0xf0
[   36.438944] [<ffffffff8058cfb6>] really_probe+0x86/0x242
[   36.444255] [<ffffffff8058d1ce>] __driver_probe_device+0x5c/0xda
[   36.450264] [<ffffffff8058d278>] driver_probe_device+0x2c/0xb2
[   36.456099] [<ffffffff8058d3f8>] __driver_attach+0x6c/0x11a
[   36.461669] [<ffffffff8058b14c>] bus_for_each_dev+0x60/0xae
[   36.467242] [<ffffffff8058ca08>] driver_attach+0x1a/0x22
[   36.477928] [<ffffffff8058c368>] bus_add_driver+0xd0/0x1ba
[   36.483581] [<ffffffff8058e046>] driver_register+0x3e/0xd8
[   36.489064] [<ffffffff804ad04a>] __pci_register_driver+0x58/0x62
[   36.495074] [<ffffffff015b7078>] amdgpu_init+0x78/0x1000 [amdgpu]
[   36.506718] [<ffffffff8000212c>] do_one_initcall+0x58/0x19c
[   36.512457] [<ffffffff80086d22>] do_init_module+0x4e/0x1b0
[   36.517941] [<ffffffff80088456>] load_module+0x1374/0x1768
[   36.523424] [<ffffffff80088a10>] init_module_from_file+0x76/0xaa
[   36.529427] [<ffffffff80088c2c>] __riscv_sys_finit_module+0x1cc/0x2ba
[   36.535865] [<ffffffff80978952>] do_trap_ecall_u+0xba/0x12e
[   36.541437] [<ffffffff809819f4>] ret_from_exception+0x0/0x64
[   36.547122] Mem-Info:
[   36.549397] active_anon:37 inactive_anon:4457 isolated_anon:0
                active_file:12636 inactive_file:24633 isolated_file:0
                unevictable:0 dirty:484 writeback:0
                slab_reclaimable:3427 slab_unreclaimable:3937
                mapped:4793 shmem:332 pagetables:583
                sec_pagetables:0 bounce:0
                kernel_misc_reclaimable:0
                free:1984989 free_pcp:0 free_cma:0
[   36.575090] Node 0 hugepages_total=0 hugepages_free=0 hugepages_surp=0 hugepages_size=2048kB
[   36.592995] 37615 total pagecache pages
[   36.596831] 0 pages in swap cache
[   36.600146] Free swap  = 0kB
[   36.603028] Total swap = 0kB
[   36.605904] 2097152 pages RAM
[   36.608872] 0 pages HighMem/MovableOnly
[   36.612709] 45269 pages reserved
[   36.615942] [TTM DEVICE] Failed to allocate dummy_read_page with GFP_DMA32, some old graphics card only has 32bit DMA may not work properly.
[   36.628671] [drm] amdgpu: 4096M of VRAM memory ready
[   36.633650] [drm] amdgpu: 4007M of GTT memory ready.
[   36.638675] [drm] GART: num cpu pages 65536, num gpu pages 65536
[   36.645921] [drm] PCIE GART of 256M enabled (table at 0x000000F400000000).
[   36.655183] [drm] Chained IB support enabled!
[   36.663894] amdgpu: hwmgr_sw_init smu backed is polaris10_smu
[   36.675300] [drm] Found UVD firmware Version: 1.130 Family ID: 16
[   36.704412] [drm] Found VCE firmware Version: 53.26 Binary ID: 3
[   37.055868] [drm] Display Core v3.2.259 initialized on DCE 11.2
[   37.117397] [drm] UVD and UVD ENC initialized successfully.
[   37.224048] [drm] VCE initialized successfully.
[   37.229365] amdgpu 0000:05:00.0: amdgpu: SE 2, SH per SE 1, CU per SH 5, active_cu_number 8
[   37.242633] amdgpu 0000:05:00.0: amdgpu: Using BACO for runtime pm
[   37.249602] [drm] Initialized amdgpu 3.56.0 20150101 for 0000:05:00.0 on minor 0
[   37.313567] Console: switching to colour frame buffer device 160x45
[   37.336468] amdgpu 0000:05:00.0: [drm] fb0: amdgpudrmfb frame buffer device


[1]. https://lore.kernel.org/lkml/2b715134-9d63-4de1-94e5-37e180aeefd2@amd.com/

Yangyu Chen (1):
  drm/ttm: allocate dummy_read_page without DMA32 on fail

 drivers/gpu/drm/ttm/ttm_device.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.43.0

