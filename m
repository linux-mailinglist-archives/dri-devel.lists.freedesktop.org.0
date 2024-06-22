Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8249134E7
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2024 17:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DA010E194;
	Sat, 22 Jun 2024 15:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ans.pl header.i=@ans.pl header.b="igd+eU0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Sat, 22 Jun 2024 06:48:18 UTC
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A38D10E112;
 Sat, 22 Jun 2024 06:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net
 [98.45.176.131]) (authenticated bits=0)
 by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 45M6dYhf026247
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 22 Jun 2024 08:39:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
 t=1719038379; bh=xsN9V7/QwkoZWeHGoNV9VDhQO18Q2zAPpFX4eAq2QYs=;
 h=Date:From:Subject:Cc:To;
 b=igd+eU0mdvvJOnu5+9qbTmeYQNY///k3LIldYZW3VfsQ0Q2naNTnE54qTMTkK0DNJ
 wfikMVUAVz/cpKhVQhphTuamsz+xEzIwRiGOKgqRq0LXUa0WGLttd/TLyD68aKlLjn
 RCHJtGvLYGWsIp9ENDBzX39tTlh61JJR1NtNqswE=
Message-ID: <3c1344dc-e102-4916-8752-3f91c9c6beb3@ans.pl>
Date: Fri, 21 Jun 2024 23:39:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
Subject: "Bogus possible_crtcs" on Linux-6.6 with nouveau and Quadro K600
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 22 Jun 2024 15:43:41 +0000
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

Hello,

Not sure when this started exactly (if needed, I can do a git bisect) but with Linux-6.6 (currently running 6.6.31) I get the following set of warnings during the boot on NVIDIA Quadro K600:

[    3.814473] Bogus possible_crtcs: [ENCODER:64:sor-0002-0fc1] possible_crtcs=0xf (full crtc mask=0x3)
[    4.057983] Bogus possible_crtcs: [ENCODER:65:dac-0000-0f02] possible_crtcs=0xf (full crtc mask=0x3)
[    4.302980] Bogus possible_crtcs: [ENCODER:67:sor-0006-0f42] possible_crtcs=0xf (full crtc mask=0x3)
[    4.551955] Bogus possible_crtcs: [ENCODER:68:sor-0002-0f42] possible_crtcs=0xf (full crtc mask=0x3)

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GK107GL [Quadro K600] [10de:0ffa] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Hewlett-Packard Company Device [103c:094b]
        Flags: bus master, fast devsel, latency 0, IRQ 26
        Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at dc80 [size=128]
        Expansion ROM at 000c0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
        Capabilities: [78] Express Endpoint, MSI 00
        Capabilities: [b4] Vendor Specific Information: Len=14 <?>
        Capabilities: [100] Virtual Channel
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
        Kernel driver in use: nouveau

Full dmesg bellow, please let me know if additional information is needed.

[    2.977016] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    2.989494] Console: switching to colour dummy device 80x25
[    2.995336] nouveau 0000:01:00.0: NVIDIA GK107 (0e73a0a2)
[    3.104491] nouveau 0000:01:00.0: bios: version 80.07.c5.00.0c
[    3.111279] nouveau 0000:01:00.0: fb: 1024 MiB DDR3
[    3.789122] nouveau 0000:01:00.0: DRM: VRAM: 1024 MiB
[    3.794163] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    3.799461] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    3.805191] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    3.810313] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    3.816735] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    3.823157] nouveau 0000:01:00.0: DRM: DCB outp 02: 02811fa6 0f420010
[    3.829577] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[    3.835998] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    3.841640] nouveau 0000:01:00.0: DRM: DCB conn 01: 00002146
[    3.848777] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    3.856740] ------------[ cut here ]------------
[    3.861346] Bogus possible_crtcs: [ENCODER:64:sor-0002-0fc1] possible_crtcs=0xf (full crtc mask=0x3)
[    3.870467] WARNING: CPU: 3 PID: 1 at drivers/gpu/drm/drm_mode_config.c:626 drm_mode_config_validate+0x1b5/0x3fb
[    3.880618] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 6.6.31-o4 #1
[    3.886779] Hardware name: Dell Inc. Precision WorkStation T3400  /0TP412, BIOS A14 04/30/2012
[    3.895363] RIP: 0010:drm_mode_config_validate+0x1b5/0x3fb
[    3.900834] Code: 48 83 e8 10 eb df 8b 4b 48 44 85 c1 74 09 44 89 c0 f7 d0 85 c8 74 15 48 8b 53 38 48 c7 c7 27 48 ea 9a 8b 73 18 e8 78 38 8e ff <0f> 0b 48 8b 5b 08 48 83 eb 08 e9 ae fe ff ff 48 8b 85 e0 02 00 00
[    3.919550] RSP: 0000:ffffb65a8001fc80 EFLAGS: 00010282
[    3.924760] RAX: 0000000000000000 RBX: ffff91e400af8800 RCX: 0000000000000003
[    3.931872] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 00000000ffffffff
[    3.938984] RBP: ffff91e406265800 R08: 0000000000000000 R09: 0000000000000000
[    3.946097] R10: 0720072007200720 R11: 0720072007200720 R12: ffff91e406265aa8
[    3.953211] R13: ffff91e406265ab0 R14: 0000000000000001 R15: ffff91e406265ab0
[    3.960323] FS:  0000000000000000(0000) GS:ffff91e533cc0000(0000) knlGS:0000000000000000
[    3.968390] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.974119] CR2: 0000000000000000 CR3: 00000000ad644000 CR4: 00000000000406e0
[    3.981234] Call Trace:
[    3.983675]  <TASK>
[    3.985767]  ? __warn+0x93/0x11a
[    3.988988]  ? report_bug+0xeb/0x162
[    3.992555]  ? drm_mode_config_validate+0x1b5/0x3fb
[    3.997422]  ? handle_bug+0x3c/0x63
[    4.000902]  ? exc_invalid_op+0x17/0x64
[    4.004727]  ? asm_exc_invalid_op+0x1a/0x20
[    4.008901]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.013766]  ? __pfx___driver_attach+0x10/0x10
[    4.018199]  drm_dev_register+0x24/0x209
[    4.022113]  ? __pfx___driver_attach+0x10/0x10
[    4.026547]  nouveau_drm_probe+0x11b/0x20c
[    4.030633]  pci_device_probe+0xbe/0x12f
[    4.034547]  really_probe+0x101/0x248
[    4.038201]  __driver_probe_device+0xbb/0xed
[    4.042461]  driver_probe_device+0x1a/0x72
[    4.046547]  __driver_attach+0xd8/0xf1
[    4.050288]  bus_for_each_dev+0x8b/0xcf
[    4.054113]  bus_add_driver+0xc2/0x1b6
[    4.057853]  driver_register+0x9e/0xdc
[    4.061591]  ? __pfx_nouveau_drm_init+0x10/0x10
[    4.066110]  do_one_initcall+0x99/0x18e
[    4.069937]  kernel_init_freeable+0x1c3/0x209
[    4.074283]  ? __pfx_kernel_init+0x10/0x10
[    4.078368]  kernel_init+0x15/0x110
[    4.081849]  ret_from_fork+0x23/0x35
[    4.085415]  ? __pfx_kernel_init+0x10/0x10
[    4.089500]  ret_from_fork_asm+0x1b/0x30
[    4.093413]  </TASK>
[    4.095591] ---[ end trace 0000000000000000 ]---
[    4.100197] ------------[ cut here ]------------
[    4.104804] Bogus possible_crtcs: [ENCODER:65:dac-0000-0f02] possible_crtcs=0xf (full crtc mask=0x3)
[    4.113917] WARNING: CPU: 2 PID: 1 at drivers/gpu/drm/drm_mode_config.c:626 drm_mode_config_validate+0x1b5/0x3fb
[    4.124067] CPU: 2 PID: 1 Comm: swapper/0 Tainted: G        W          6.6.31-o4 #1
[    4.131702] Hardware name: Dell Inc. Precision WorkStation T3400  /0TP412, BIOS A14 04/30/2012
[    4.140287] RIP: 0010:drm_mode_config_validate+0x1b5/0x3fb
[    4.145758] Code: 48 83 e8 10 eb df 8b 4b 48 44 85 c1 74 09 44 89 c0 f7 d0 85 c8 74 15 48 8b 53 38 48 c7 c7 27 48 ea 9a 8b 73 18 e8 78 38 8e ff <0f> 0b 48 8b 5b 08 48 83 eb 08 e9 ae fe ff ff 48 8b 85 e0 02 00 00
[    4.164473] RSP: 0000:ffffb65a8001fc80 EFLAGS: 00010282
[    4.169683] RAX: 0000000000000000 RBX: ffff91e400afb800 RCX: 0000000000000003
[    4.176796] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 00000000ffffffff
[    4.183908] RBP: ffff91e406265800 R08: 0000000000000000 R09: 0000000000000000
[    4.191021] R10: 0720072007200720 R11: 0720072007200720 R12: ffff91e406265aa8
[    4.198137] R13: ffff91e406265ab0 R14: 0000000000000001 R15: ffff91e406265ab0
[    4.205250] FS:  0000000000000000(0000) GS:ffff91e533c80000(0000) knlGS:0000000000000000
[    4.213315] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.219044] CR2: 0000000000000000 CR3: 00000000ad644000 CR4: 00000000000406e0
[    4.226159] Call Trace:
[    4.228597]  <TASK>
[    4.230688]  ? __warn+0x93/0x11a
[    4.233908]  ? report_bug+0xeb/0x162
[    4.237474]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.242339]  ? handle_bug+0x3c/0x63
[    4.245818]  ? exc_invalid_op+0x17/0x64
[    4.249643]  ? asm_exc_invalid_op+0x1a/0x20
[    4.253816]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.258681]  ? __pfx___driver_attach+0x10/0x10
[    4.263115]  drm_dev_register+0x24/0x209
[    4.267028]  ? __pfx___driver_attach+0x10/0x10
[    4.271460]  nouveau_drm_probe+0x11b/0x20c
[    4.275546]  pci_device_probe+0xbe/0x12f
[    4.279457]  really_probe+0x101/0x248
[    4.283110]  __driver_probe_device+0xbb/0xed
[    4.287370]  driver_probe_device+0x1a/0x72
[    4.291456]  __driver_attach+0xd8/0xf1
[    4.295194]  bus_for_each_dev+0x8b/0xcf
[    4.299018]  bus_add_driver+0xc2/0x1b6
[    4.302757]  driver_register+0x9e/0xdc
[    4.306496]  ? __pfx_nouveau_drm_init+0x10/0x10
[    4.311015]  do_one_initcall+0x99/0x18e
[    4.314841]  kernel_init_freeable+0x1c3/0x209
[    4.319187]  ? __pfx_kernel_init+0x10/0x10
[    4.323275]  kernel_init+0x15/0x110
[    4.326772]  ret_from_fork+0x23/0x35
[    4.330342]  ? __pfx_kernel_init+0x10/0x10
[    4.334430]  ret_from_fork_asm+0x1b/0x30
[    4.338358]  </TASK>
[    4.340542] ---[ end trace 0000000000000000 ]---
[    4.345150] ------------[ cut here ]------------
[    4.349755] Bogus possible_crtcs: [ENCODER:67:sor-0006-0f42] possible_crtcs=0xf (full crtc mask=0x3)
[    4.358867] WARNING: CPU: 3 PID: 1 at drivers/gpu/drm/drm_mode_config.c:626 drm_mode_config_validate+0x1b5/0x3fb
[    4.369015] CPU: 3 PID: 1 Comm: swapper/0 Tainted: G        W          6.6.31-o4 #1
[    4.376649] Hardware name: Dell Inc. Precision WorkStation T3400  /0TP412, BIOS A14 04/30/2012
[    4.385236] RIP: 0010:drm_mode_config_validate+0x1b5/0x3fb
[    4.390707] Code: 48 83 e8 10 eb df 8b 4b 48 44 85 c1 74 09 44 89 c0 f7 d0 85 c8 74 15 48 8b 53 38 48 c7 c7 27 48 ea 9a 8b 73 18 e8 78 38 8e ff <0f> 0b 48 8b 5b 08 48 83 eb 08 e9 ae fe ff ff 48 8b 85 e0 02 00 00
[    4.409420] RSP: 0000:ffffb65a8001fc80 EFLAGS: 00010282
[    4.414632] RAX: 0000000000000000 RBX: ffff91e400af8c00 RCX: 0000000000000003
[    4.419829] Freeing initrd memory: 16956K
[    4.421743] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 00000000ffffffff
[    4.421746] RBP: ffff91e406265800 R08: 0000000000000000 R09: 0000000000000000
[    4.421749] R10: 0720072007200720 R11: 0720072007200720 R12: ffff91e406265aa8
[    4.447156] R13: ffff91e406265ab0 R14: 0000000000000001 R15: ffff91e406265ab0
[    4.454269] FS:  0000000000000000(0000) GS:ffff91e533cc0000(0000) knlGS:0000000000000000
[    4.462335] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.468062] CR2: 0000000000000000 CR3: 00000000ad644000 CR4: 00000000000406e0
[    4.475176] Call Trace:
[    4.477614]  <TASK>
[    4.479706]  ? __warn+0x93/0x11a
[    4.482925]  ? report_bug+0xeb/0x162
[    4.486490]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.491355]  ? handle_bug+0x3c/0x63
[    4.494833]  ? exc_invalid_op+0x17/0x64
[    4.498657]  ? asm_exc_invalid_op+0x1a/0x20
[    4.502832]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.507698]  ? __pfx___driver_attach+0x10/0x10
[    4.512131]  drm_dev_register+0x24/0x209
[    4.516044]  ? __pfx___driver_attach+0x10/0x10
[    4.520476]  nouveau_drm_probe+0x11b/0x20c
[    4.524573]  pci_device_probe+0xbe/0x12f
[    4.528487]  really_probe+0x101/0x248
[    4.532140]  __driver_probe_device+0xbb/0xed
[    4.536398]  driver_probe_device+0x1a/0x72
[    4.540482]  __driver_attach+0xd8/0xf1
[    4.544223]  bus_for_each_dev+0x8b/0xcf
[    4.548049]  bus_add_driver+0xc2/0x1b6
[    4.551788]  driver_register+0x9e/0xdc
[    4.555527]  ? __pfx_nouveau_drm_init+0x10/0x10
[    4.560046]  do_one_initcall+0x99/0x18e
[    4.563873]  kernel_init_freeable+0x1c3/0x209
[    4.568220]  ? __pfx_kernel_init+0x10/0x10
[    4.572305]  kernel_init+0x15/0x110
[    4.575785]  ret_from_fork+0x23/0x35
[    4.579350]  ? __pfx_kernel_init+0x10/0x10
[    4.583435]  ret_from_fork_asm+0x1b/0x30
[    4.587347]  </TASK>
[    4.589525] ---[ end trace 0000000000000000 ]---
[    4.594143] ------------[ cut here ]------------
[    4.598761] Bogus possible_crtcs: [ENCODER:68:sor-0002-0f42] possible_crtcs=0xf (full crtc mask=0x3)
[    4.607889] WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_mode_config.c:626 drm_mode_config_validate+0x1b5/0x3fb
[    4.618042] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W          6.6.31-o4 #1
[    4.625675] Hardware name: Dell Inc. Precision WorkStation T3400  /0TP412, BIOS A14 04/30/2012
[    4.634260] RIP: 0010:drm_mode_config_validate+0x1b5/0x3fb
[    4.639731] Code: 48 83 e8 10 eb df 8b 4b 48 44 85 c1 74 09 44 89 c0 f7 d0 85 c8 74 15 48 8b 53 38 48 c7 c7 27 48 ea 9a 8b 73 18 e8 78 38 8e ff <0f> 0b 48 8b 5b 08 48 83 eb 08 e9 ae fe ff ff 48 8b 85 e0 02 00 00
[    4.658447] RSP: 0000:ffffb65a8001fc80 EFLAGS: 00010282
[    4.663657] RAX: 0000000000000000 RBX: ffff91e400afa000 RCX: 0000000000000003
[    4.670769] RDX: 0000000000000000 RSI: 0000000000000003 RDI: 00000000ffffffff
[    4.677881] RBP: ffff91e406265800 R08: 0000000000000000 R09: 0000000000000000
[    4.684994] R10: 0720072007200720 R11: 0720072007200720 R12: ffff91e406265aa8
[    4.692108] R13: ffff91e406265ab0 R14: 0000000000000001 R15: ffff91e406265ab0
[    4.699220] FS:  0000000000000000(0000) GS:ffff91e533c40000(0000) knlGS:0000000000000000
[    4.707286] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    4.713014] CR2: 0000000000000000 CR3: 00000000ad644000 CR4: 00000000000406e0
[    4.720128] Call Trace:
[    4.722579]  <TASK>
[    4.724671]  ? __warn+0x93/0x11a
[    4.727891]  ? report_bug+0xeb/0x162
[    4.731457]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.736321]  ? handle_bug+0x3c/0x63
[    4.739801]  ? exc_invalid_op+0x17/0x64
[    4.743626]  ? asm_exc_invalid_op+0x1a/0x20
[    4.747800]  ? drm_mode_config_validate+0x1b5/0x3fb
[    4.752663]  ? __pfx___driver_attach+0x10/0x10
[    4.757096]  drm_dev_register+0x24/0x209
[    4.761009]  ? __pfx___driver_attach+0x10/0x10
[    4.765440]  nouveau_drm_probe+0x11b/0x20c
[    4.769526]  pci_device_probe+0xbe/0x12f
[    4.773437]  really_probe+0x101/0x248
[    4.777091]  __driver_probe_device+0xbb/0xed
[    4.781349]  driver_probe_device+0x1a/0x72
[    4.785436]  __driver_attach+0xd8/0xf1
[    4.789177]  bus_for_each_dev+0x8b/0xcf
[    4.793002]  bus_add_driver+0xc2/0x1b6
[    4.796741]  driver_register+0x9e/0xdc
[    4.800478]  ? __pfx_nouveau_drm_init+0x10/0x10
[    4.804998]  do_one_initcall+0x99/0x18e
[    4.808826]  kernel_init_freeable+0x1c3/0x209
[    4.813171]  ? __pfx_kernel_init+0x10/0x10
[    4.817257]  kernel_init+0x15/0x110
[    4.820741]  ret_from_fork+0x23/0x35
[    4.824308]  ? __pfx_kernel_init+0x10/0x10
[    4.828393]  ret_from_fork_asm+0x1b/0x30
[    4.832306]  </TASK>
[    4.834482] ---[ end trace 0000000000000000 ]---
[    4.839468] [drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 on minor 0
[    4.960667] fbcon: nouveaudrmfb (fb0) is primary device
[    5.117719] Console: switching to colour frame buffer device 160x64
[    5.136866] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device

Best regards,
 Krzysztof Oledzki
