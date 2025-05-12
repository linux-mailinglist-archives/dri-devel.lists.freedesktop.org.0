Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC90AB36D8
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 14:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE08C10E39C;
	Mon, 12 May 2025 12:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.b="fFCUI6tC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7F510E39C;
 Mon, 12 May 2025 12:19:00 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A0D2B40E0258; 
 Mon, 12 May 2025 12:18:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ccwyyjUzt1cm; Mon, 12 May 2025 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1747052330; bh=y2rvk9+xynJQWk4O+d7r1KtnxXxgSq7f47cdvEfH2tc=;
 h=Date:From:To:Cc:Subject:From;
 b=fFCUI6tCCOSnlKQ9ZKEKhnIXJCEfM7Hsf/FWHvEG1oFYTaCNjd2CB2vP/VHniI+MC
 i81A8LNTiN0pZ7r+UKdCbT4Tk4ff4/fePLqyK73JhJVR4fpJlJvQhkHVRv6I2VNMRr
 JcbppzDusbHvPcUgBRIkZ/+aeE2mCqLoMemfMvT82D4vZ+KEPuRonSBu4v+hUMcFNl
 vMUINIES0M5b0FKS4Ua3t5AF5dG1PLJZkhl3JYINL5EfRMtDjk8fod2navo5sjCAZ8
 jhkO3HR3cYwFuZgpEE1pp6TBOgLVDi8XqK3lU1yKE/bHh54vUg+2R0WN21TeHw54a+
 IX1uiepFquM1cUBcYR2btYMpZBksN2aJveRSUEa61YMGs6oCMtBWHBHbE7Vt7KCLOz
 PSaIVQid0LX93+lbjkPVyIo2m2YH/lhrmX3gRI4IrS4o63X/XE7GxxIk0O+nMNwmfL
 pbDhUQVuNcWIhEhR4Zg34T7bNrfyMsX3RwF8aTbeVofBHT8jInuuUONVTXI7s2nBuw
 SG/10upvx34lPUdf7duDW6+tQGLX7VN1zfU5MGltrLBCRpsf3AmlCgu6wOkOdvrD6C
 XbMK1eSteGoVB5bHib48nBTM2BjI0GsXwadYd3JUNtdoAHYI6U8L6AIUUM8swOPcn6
 lIAB4R/HftQl1+KN/Q9lp8QA=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 38F3D40E023B;
 Mon, 12 May 2025 12:18:42 +0000 (UTC)
Date: Mon, 12 May 2025 14:18:36 +0200
From: Borislav Petkov <bp@alien8.de>
To: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: amdgpu RENOIR funky complaints in dmesg
Message-ID: <20250512121836.GDaCHnHNjeBwfyV0hh@fat_crate.local>
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

Hey folks,

this is rc6 + tip/master on a Zen2 RN laptop.

Needless to say, the complaints are brand new.

Thx.

[    0.875804] ACPI: bus type drm_connector registered
[    0.877903] [drm] Initialized vgem 1.0.0 for vgem on minor 0
[    0.880430] [drm] Initialized vkms 1.0.0 for vkms on minor 1
[    0.922159] platform vkms: [drm] fb0: vkmsdrmfb frame buffer device
[   11.655127] [drm] amdgpu kernel modesetting enabled.
[   11.833426] amdgpu: Virtual CRAT table created for CPU
[   11.835726] amdgpu: Topology: Add CPU node
[   11.837865] amdgpu 0000:06:00.0: enabling device (0006 -> 0007)
[   11.839494] [drm] initializing kernel modesetting (RENOIR 0x1002:0x1636 0x17AA:0x5099 0xD1).
[   11.842925] [drm] register mmio base: 0xFD300000
[   11.843821] [drm] register mmio size: 524288
[   11.866875] amdgpu 0000:06:00.0: amdgpu: detected ip block number 0 <soc15_common>
[   11.867854] amdgpu 0000:06:00.0: amdgpu: detected ip block number 1 <gmc_v9_0>
[   11.868731] amdgpu 0000:06:00.0: amdgpu: detected ip block number 2 <vega10_ih>
[   11.869567] amdgpu 0000:06:00.0: amdgpu: detected ip block number 3 <psp>
[   11.870389] amdgpu 0000:06:00.0: amdgpu: detected ip block number 4 <smu>
[   11.871295] amdgpu 0000:06:00.0: amdgpu: detected ip block number 5 <dm>
[   11.872154] amdgpu 0000:06:00.0: amdgpu: detected ip block number 6 <gfx_v9_0>
[   11.872984] amdgpu 0000:06:00.0: amdgpu: detected ip block number 7 <sdma_v4_0>
[   11.873802] amdgpu 0000:06:00.0: amdgpu: detected ip block number 8 <vcn_v2_0>
[   11.874629] amdgpu 0000:06:00.0: amdgpu: detected ip block number 9 <jpeg_v2_0>
[   11.875457] amdgpu 0000:06:00.0: amdgpu: Fetched VBIOS from VFCT
[   11.876246] amdgpu: ATOM BIOS: 113-RENOIR-026
[   11.916515] amdgpu 0000:06:00.0: vgaarb: deactivate vga console
[   11.917441] amdgpu 0000:06:00.0: amdgpu: Trusted Memory Zone (TMZ) feature enabled
[   11.918275] amdgpu 0000:06:00.0: amdgpu: MODE2 reset
[   11.920343] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[   11.921245] amdgpu 0000:06:00.0: amdgpu: VRAM: 512M 0x000000F400000000 - 0x000000F41FFFFFFF (512M used)
[   11.922102] amdgpu 0000:06:00.0: amdgpu: GART: 1024M 0x0000000000000000 - 0x000000003FFFFFFF
[   11.923005] [drm] Detected VRAM RAM=512M, BAR=512M
[   11.923822] [drm] RAM width 128bits DDR4
[   11.927674] [drm] amdgpu: 512M of VRAM memory ready
[   11.928527] [drm] amdgpu: 7569M of GTT memory ready.
[   11.929974] [drm] GART: num cpu pages 262144, num gpu pages 262144
[   11.931833] [drm] PCIE GART of 1024M enabled.
[   11.932659] [drm] PTB located at 0x000000F41FC00000
[   11.936483] [drm] Loading DMUB firmware via PSP: version=0x01010028
[   11.940719] amdgpu 0000:06:00.0: amdgpu: Found VCN firmware Version ENC: 1.21 DEC: 6 VEP: 0 Revision: 0
[   12.929948] amdgpu 0000:06:00.0: amdgpu: reserve 0x400000 from 0xf41f800000 for PSP TMR
[   13.019057] amdgpu 0000:06:00.0: amdgpu: RAS: optional ras ta ucode is not available
[   13.029393] amdgpu 0000:06:00.0: amdgpu: RAP: optional rap ta ucode is not available
[   13.034982] amdgpu 0000:06:00.0: amdgpu: psp gfx command LOAD_TA(0x1) failed and response status is (0x7)
[   13.036793] amdgpu 0000:06:00.0: amdgpu: psp gfx command INVOKE_CMD(0x3) failed and response status is (0x4)
[   13.037973] amdgpu 0000:06:00.0: amdgpu: Secure display: Generic Failure.
[   13.038885] amdgpu 0000:06:00.0: amdgpu: SECUREDISPLAY: query securedisplay TA failed. ret 0x0
[   13.040151] amdgpu 0000:06:00.0: amdgpu: SMU is initialized successfully!
[   13.042348] [drm] Display Core v3.2.325 initialized on DCN 2.1
[   13.043396] [drm] DP-HDMI FRL PCON supported
[   13.044896] [drm] DMUB hardware initialized: version=0x01010028
[   13.073956] snd_hda_intel 0000:06:00.1: bound 0000:06:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   13.085947] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.087463] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.089942] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.090882] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.093284] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.094155] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.096543] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.097394] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.099734] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.100573] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.102937] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.103750] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.106074] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.106964] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.109336] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.110187] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.112599] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.113459] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.115840] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.116698] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.119046] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.119899] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.122234] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.123114] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.125463] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.126282] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.128622] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.129437] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.131730] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.132535] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.134838] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.135643] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.137930] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.138771] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.141164] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.142002] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.144354] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.145133] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.147373] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.148141] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.150425] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.151226] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.153517] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.154260] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.156568] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.157310] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.159568] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.160293] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.162561] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.163241] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.165433] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.166145] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.168424] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.169140] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.171397] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.172111] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.174317] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.175157] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.177436] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.178125] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.180371] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.181090] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.183345] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   13.184062] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   13.272389] amdgpu 0000:06:00.0: amdgpu: [drm] Using ACPI provided EDID for eDP-1
[   13.284163] [drm] kiq ring mec 2 pipe 1 q 0
[   13.300102] kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[   13.301009] kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[   13.304093] amdgpu: Virtual CRAT table created for GPU
[   13.307633] amdgpu: Topology: Add dGPU node [0x1636:0x1002]
[   13.308735] kfd kfd: amdgpu: added device 1002:1636
[   13.309670] amdgpu 0000:06:00.0: amdgpu: SE 1, SH per SE 1, CU per SH 8, active_cu_number 7
[   13.310667] amdgpu 0000:06:00.0: amdgpu: ring gfx uses VM inv eng 0 on hub 0
[   13.311465] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[   13.312242] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[   13.312985] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 5 on hub 0
[   13.313712] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 6 on hub 0
[   13.314435] amdgpu 0000:06:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 7 on hub 0
[   13.315229] amdgpu 0000:06:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 8 on hub 0
[   13.315997] amdgpu 0000:06:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 9 on hub 0
[   13.316742] amdgpu 0000:06:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 10 on hub 0
[   13.317487] amdgpu 0000:06:00.0: amdgpu: ring kiq_0.2.1.0 uses VM inv eng 11 on hub 0
[   13.318232] amdgpu 0000:06:00.0: amdgpu: ring sdma0 uses VM inv eng 0 on hub 8
[   13.319114] amdgpu 0000:06:00.0: amdgpu: ring vcn_dec uses VM inv eng 1 on hub 8
[   13.319867] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc0 uses VM inv eng 4 on hub 8
[   13.320578] amdgpu 0000:06:00.0: amdgpu: ring vcn_enc1 uses VM inv eng 5 on hub 8
[   13.321284] amdgpu 0000:06:00.0: amdgpu: ring jpeg_dec uses VM inv eng 6 on hub 8
[   13.329495] amdgpu 0000:06:00.0: amdgpu: Runtime PM not available
[   13.336874] amdgpu 0000:06:00.0: amdgpu: [drm] Using custom brightness curve
[   13.345049] [drm] Initialized amdgpu 3.63.0 for 0000:06:00.0 on minor 2
[   13.365870] fbcon: amdgpudrmfb (fb1) is primary device
[   13.367117] [drm] pre_validate_dsc:1621 MST_DSC dsc precompute is not needed
[   13.573337] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:3
[   13.574721] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:3
[   13.574793] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.575609] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.576327] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.577042] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.577759] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.578521] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.579237] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.579951] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.580667] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.581382] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.582096] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.582811] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.583527] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.584241] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.584956] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.585672] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.586387] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.587101] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.587816] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.588531] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.589245] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.589960] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.590670] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.591385] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.592101] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.592816] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.593530] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.594246] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.594961] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.595676] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.595767] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.596483] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.597198] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.597913] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.598570] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.599286] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.600000] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.600715] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.601431] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.602146] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.602860] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.603575] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.604290] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.605004] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.605719] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.606435] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.607197] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.607912] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.608628] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.609343] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.610058] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.610774] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.611489] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.612204] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.612920] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.613635] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.614351] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.615066] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.615780] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.616495] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.617210] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.617924] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.618009] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.618724] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.619440] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.620155] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.620870] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.621586] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.622301] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.623016] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.623731] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.624447] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.625161] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.625876] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.626570] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.627284] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.627999] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.628714] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.629429] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.630143] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.630858] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.631572] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.632287] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.633002] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.633718] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.634433] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.635196] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.635911] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.636625] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.637341] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.638057] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.638771] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.639487] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   13.640202] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: DP AUX transfer fail:4
[   14.151445] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.151460] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.152974] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.152983] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.154517] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.154526] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.156046] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.156054] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.157573] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.157581] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.159099] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.159107] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.160626] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.160634] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.162154] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.162163] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.163681] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.163690] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.165197] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.165205] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.166715] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.166724] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.168243] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.168252] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.169772] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.169780] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.171343] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.171351] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.172871] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.172879] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.174398] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.174406] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.175926] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.175934] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.177453] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.177461] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.178973] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.178982] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.180488] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.180497] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.182015] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.182024] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.183540] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.183548] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.185056] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.185064] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.186578] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.186587] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.188093] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.188101] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.189621] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.189629] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.191137] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.191146] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.192666] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.192674] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.194193] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.194201] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.195725] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.195734] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.197241] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.197250] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   14.198764] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX partially written
[   14.198772] amdgpu 0000:06:00.0: amdgpu: [drm] amdgpu: AUX reply command not ACK: 0x01.
[   18.646254] amdgpu 0000:06:00.0: [drm] fb1: amdgpudrmfb frame buffer device

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
