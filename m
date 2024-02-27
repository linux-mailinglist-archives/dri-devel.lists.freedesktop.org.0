Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E621E869D3C
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 18:10:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A7110E958;
	Tue, 27 Feb 2024 17:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="bATfyn+J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 344 seconds by postgrey-1.36 at gabe;
 Tue, 27 Feb 2024 17:10:45 UTC
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 632B510E952;
 Tue, 27 Feb 2024 17:10:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1162E40E019E; 
 Tue, 27 Feb 2024 17:04:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id JtbHwZepHPL9; Tue, 27 Feb 2024 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1709053493; bh=n9r8ifQQ9RMSnetSq1rRyXQuHtEgteGjjXFVnfaR610=;
 h=Date:From:To:Cc:Subject:From;
 b=bATfyn+JJ/rRdYxdXM3vjvlgd6RVk8HPDBFyO8+InOHeZrAxI1Ym4xtc8WqqwXCpn
 VRaguH/TYUzk2qQrz9EocMWOM81B/CLeGI/ShhKqPqrxqP9vrxpCFztCKcaQyiWjVR
 8oW7siJnXdPuL1+4DxsTWU66Gpnh0Cz9TH5u+cejpPzhSKT4FBMjeNu73D0E01+aAI
 0vlozHIBAhBmZohPtdwnLODB77vumfFSpCdPyDgMdaUeDXPmnS3LwM2/1JFb3d+asw
 As1jNq/XYvk+AgCenEXllclW6U0d9vTUxmCG6ZFniwwLLx6KPPukpHUpdRpXPOTo4G
 9Gw2tzRS6welchK+rqxgfaW1qx4GBesoLU+ggMLA9nTinNpzzVgi9VNe18xJ/U99mB
 J/mvoxTQD6XYmsh1IYkgAlTCEqHMN5i9Jr+qmbZuECY1FfD1vTZpDcYJ+D3Pv0zPwn
 nrlRvZY5RSZcV+xf8l6ZbioXoUfhhUp5OqXVOdYdIG//5mjb1oV0M+InnpQwnA2b/G
 N6wD7M3c8Gmf0jCUvTZBes5Fiudm4eDjKtL52o44xlYbmKOUJRB+iZR0FcW19QhY7S
 WRhV0EeI3gJyiGxRsVSfLv5ZTkxeBA9k5VwnmdtKfs0gmBgYmDXr89lL0TOOL7DAQM
 J8mp07eQMez+5KMqV5jpe/vM=
Received: from zn.tnic (pd953021b.dip0.t-ipconnect.de [217.83.2.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7AFCF40E016B;
 Tue, 27 Feb 2024 17:04:44 +0000 (UTC)
Date: Tue, 27 Feb 2024 18:04:36 +0100
From: Borislav Petkov <bp@alien8.de>
To: amd-gfx@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: amdgpu kmemleaks
Message-ID: <20240227170436.GDZd4WJO7edBGZ8y-u@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi folks,

anyone interested in a bunch of amdgpu kmemleak reports from latest Linus tree
+ tip?

GPU is:

[   11.317312] [drm] amdgpu kernel modesetting enabled.
[   11.363627] [drm] initializing kernel modesetting (CARRIZO 0x1002:0x9874 0x103C:0x807E 0xC4).
[   11.364077] [drm] register mmio base: 0xD0C00000
[   11.364547] [drm] register mmio size: 262144
[   11.365347] [drm] add ip block number 0 <vi_common>
[   11.365580] [drm] add ip block number 1 <gmc_v8_0>
[   11.365840] [drm] add ip block number 2 <cz_ih>
[   11.366047] [drm] add ip block number 3 <gfx_v8_0>
[   11.366263] [drm] add ip block number 4 <sdma_v3_0>
[   11.366470] [drm] add ip block number 5 <powerplay>
[   11.366662] [drm] add ip block number 6 <dm>
[   11.366835] [drm] add ip block number 7 <uvd_v6_0>
[   11.367022] [drm] add ip block number 8 <vce_v3_0>
[   11.382774] [drm] BIOS signature incorrect 5b 7
[   11.383002] resource: resource sanity check: requesting [mem 0x00000000000c0000-0x00000000000dffff], which spans more than PCI Bus 0000:00 [mem 0x000c0000-0x000cbfff window]
[   11.383655] caller pci_map_rom+0x68/0x1d0 mapping multiple BARs
[   11.384009] amdgpu 0000:00:01.0: amdgpu: Fetched VBIOS from ROM BAR
[   11.384402] amdgpu: ATOM BIOS: SWBRT27354.001
[   11.385827] [drm] UVD is enabled in physical mode
[   11.386063] [drm] VCE enabled in physical mode
[   11.386886] amdgpu 0000:00:01.0: vgaarb: deactivate vga console
[   11.389089] Console: switching to colour dummy device 80x25
[   11.389543] amdgpu 0000:00:01.0: amdgpu: Trusted Memory Zone (TMZ) feature not supported
[   11.390482] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment size is 9-bit
[   11.390793] amdgpu 0000:00:01.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
[   11.391129] amdgpu 0000:00:01.0: amdgpu: GART: 1024M 0x000000FF00000000 - 0x000000FF3FFFFFFF
[   11.391456] [drm] Detected VRAM RAM=512M, BAR=512M
[   11.391632] [drm] RAM width 128bits UNKNOWN
[   11.394546] [drm] amdgpu: 512M of VRAM memory ready
[   11.394751] [drm] amdgpu: 7622M of GTT memory ready.
[   11.395299] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   11.395813] [drm] PCIE GART of 1024M enabled (table at 0x000000F400A00000).
[   11.404914] amdgpu: hwmgr_sw_init smu backed is smu8_smu
[   11.407177] [drm] Found UVD firmware Version: 1.91 Family ID: 11
[   11.407670] [drm] UVD ENC is disabled
[   11.409969] [drm] Found VCE firmware Version: 52.4 Binary ID: 3
[   11.412601] amdgpu: smu version 18.62.00
[   11.419275] [drm] DM_PPLIB: values for Engine clock
[   11.419480] [drm] DM_PPLIB:   300000
[   11.419610] [drm] DM_PPLIB:   360000
[   11.419740] [drm] DM_PPLIB:   423530
[   11.419869] [drm] DM_PPLIB:   514290
[   11.419998] [drm] DM_PPLIB:   626090
[   11.420127] [drm] DM_PPLIB:   720000
[   11.420327] [drm] DM_PPLIB: Validation clocks:
[   11.420536] [drm] DM_PPLIB:    engine_max_clock: 72000
[   11.420722] [drm] DM_PPLIB:    memory_max_clock: 80000
[   11.420907] [drm] DM_PPLIB:    level           : 8
[   11.421083] [drm] DM_PPLIB: values for Display clock
[   11.421266] [drm] DM_PPLIB:   300000
[   11.421395] [drm] DM_PPLIB:   400000
[   11.421524] [drm] DM_PPLIB:   496560
[   11.421652] [drm] DM_PPLIB:   626090
[   11.421781] [drm] DM_PPLIB:   685720
[   11.421910] [drm] DM_PPLIB:   757900
[   11.422039] [drm] DM_PPLIB: Validation clocks:
[   11.422201] [drm] DM_PPLIB:    engine_max_clock: 72000
[   11.422386] [drm] DM_PPLIB:    memory_max_clock: 80000
[   11.422572] [drm] DM_PPLIB:    level           : 8
[   11.422746] [drm] DM_PPLIB: values for Memory clock
[   11.422923] [drm] DM_PPLIB:   333000
[   11.423052] [drm] DM_PPLIB:   800000
[   11.423181] [drm] DM_PPLIB: Validation clocks:
[   11.423342] [drm] DM_PPLIB:    engine_max_clock: 72000
[   11.423528] [drm] DM_PPLIB:    memory_max_clock: 80000
[   11.423713] [drm] DM_PPLIB:    level           : 8
[   11.424561] [drm] Display Core v3.2.266 initialized on DCE 11.0
[   11.516117] [drm] UVD initialized successfully.
[   11.716119] [drm] VCE initialized successfully.


unreferenced object 0xffff88810e6faa80 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 00 0a 28 0a 48 0a c8 0a 00 00 a0 05  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 5201319b):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<000000007b61fcfc>] do_detailed_mode+0x323/0x670
    [<0000000079955120>] drm_for_each_detailed_block.part.0+0x34/0x180
    [<000000009a087c6a>] _drm_edid_connector_add_modes.part.0+0x8f/0x10b0
    [<00000000d791cdfb>] drm_add_edid_modes+0x14e/0x160
    [<000000000a49b747>] amdgpu_dm_connector_get_modes+0x13b/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
unreferenced object 0xffff88810e6fa400 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    62 87 02 00 00 0a 28 0a 48 0a c8 0a 00 00 a0 05  b.....(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc af0a5c0b):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<000000007b61fcfc>] do_detailed_mode+0x323/0x670
    [<0000000079955120>] drm_for_each_detailed_block.part.0+0x34/0x180
    [<000000009a087c6a>] _drm_edid_connector_add_modes.part.0+0x8f/0x10b0
    [<00000000d791cdfb>] drm_add_edid_modes+0x14e/0x160
    [<000000000a49b747>] amdgpu_dm_connector_get_modes+0x13b/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
unreferenced object 0xffff88810e6fa080 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 80 02 28 0a 48 0a c8 0a 00 00 e0 01  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 56e320f1):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff88810e6fad80 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 20 03 28 0a 48 0a c8 0a 00 00 58 02  .... .(.H.....X.
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 6478e3b9):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff88810e6faf00 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 00 04 28 0a 48 0a c8 0a 00 00 00 03  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc f8073c6a):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff88810e6fa380 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 00 05 28 0a 48 0a c8 0a 00 00 d0 02  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 7690650b):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff88810e6fad00 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 00 05 28 0a 48 0a c8 0a 00 00 20 03  ......(.H..... .
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 70b12ae7):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff88810e6fa200 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 00 05 28 0a 48 0a c8 0a 00 00 00 04  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc b3fbb73c):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff888105e13580 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 a0 05 28 0a 48 0a c8 0a 00 00 84 03  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc a2fc9ebc):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff888105e13980 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 90 06 28 0a 48 0a c8 0a 00 00 1a 04  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc d157dc2e):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff888105e13e80 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 40 06 28 0a 48 0a c8 0a 00 00 b0 04  ....@.(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 954e8c7a):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff888105e13b80 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 80 07 28 0a 48 0a c8 0a 00 00 38 04  ......(.H.....8.
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 1fc84ee7):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0
unreferenced object 0xffff888105e13a80 (size 128):
  comm "systemd-udevd", pid 1219, jiffies 4294895080
  hex dump (first 32 bytes):
    18 cb 03 00 80 07 28 0a 48 0a c8 0a 00 00 b0 04  ......(.H.......
    aa 05 b4 05 dc 05 00 00 0a 00 00 00 00 00 00 00  ................
  backtrace (crc 2e97b37a):
    [<000000006e1e4989>] kmalloc_trace+0x25a/0x300
    [<00000000ead03882>] drm_mode_duplicate+0x1f/0x50
    [<000000001f333f56>] amdgpu_dm_connector_add_common_modes+0xc8/0x130 [amdgpu]
    [<00000000704848b1>] amdgpu_dm_connector_get_modes+0x1e1/0x470 [amdgpu]
    [<000000005f5da5a5>] amdgpu_dm_init.isra.0+0x12ed/0x1e50 [amdgpu]
    [<00000000ee7b0caa>] dm_hw_init+0xe/0x20 [amdgpu]
    [<00000000c2cf0e8f>] amdgpu_device_init+0x1f17/0x2530 [amdgpu]
    [<000000009c22ce56>] amdgpu_driver_load_kms+0x23/0x1a0 [amdgpu]
    [<000000008bc75f74>] amdgpu_pci_probe+0x1b5/0x550 [amdgpu]
    [<0000000084a99ccb>] local_pci_probe+0x53/0xb0
    [<000000003753ec80>] pci_device_probe+0xbc/0x1d0
    [<0000000027472ad9>] really_probe+0x1a6/0x3f0
    [<00000000e27cb5c7>] __driver_probe_device+0x78/0x160
    [<00000000c5fbf154>] driver_probe_device+0x2d/0xb0
    [<00000000649c4014>] __driver_attach+0xdc/0x1d0
    [<0000000018e16ae6>] bus_for_each_dev+0x6a/0xb0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
