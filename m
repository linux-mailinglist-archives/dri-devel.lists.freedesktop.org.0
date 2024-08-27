Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A640960A99
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 14:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F2910E30A;
	Tue, 27 Aug 2024 12:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Hbe/L3BE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3E10E309
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 12:37:22 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso47138465e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1724762241; x=1725367041; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yss1u6EE2Y7nt3vhy21qGf9QHrU7rN6+hapr2SNcePQ=;
 b=Hbe/L3BEWGfbHjG2nGMkfD87kJnG4jKkKglTP2zL5c0TgdjJMkPR5KtHpUJHBavK83
 6Vdo/nBERlzD6k3Uph2LNVDnN0I4c14KfAvC2n40TeAhBKMguKruM8gv6fX0807Zds8B
 RjVA2RQ1OpB6PeQ25p6kuyxNiCOm7wDTuq78k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724762241; x=1725367041;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yss1u6EE2Y7nt3vhy21qGf9QHrU7rN6+hapr2SNcePQ=;
 b=uQ8Go42mi14dMgOqB0DMyGN3xUdxkl/lEpty4YonGBgmczawljbLUjrI3CSGhGOzml
 FBhwbxE9+ZNyTqMuJiBPI3kyYzyM+N8Vna+hkqOD9y3gIu823ic5FT6fhZ9vBqJ0PjR3
 HOn3d+8of/yHjcJy0yOJ45OVLJDV9nqcItTVmeLmgpRMXv+AKKyRpNmHrUhhz/q0MoHM
 CbWvYC+bm+Tm6/r/wjxaBWYbvnMtFk8zSb6cQE+dir0+mUk3IH/VSrdjv48rWRwxV6AS
 w6hrlR1oYyX6Xr5JhDSlAWOm/mq9ULeucdVhIQd/tnqtJaZWCUKtgo0S9c/igAv7LohN
 u8Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi3+jksl+juPkKB23HTkR+Q7CC0LM1Lqb068pcQKpJKGDSXu5BkHaSfN1/4hGuJcutWDaupGlK8hI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPuwOOqavXACZ/I+K02IiPpB/jCrlet/YCVdZt5RwrglOpnvIR
 CLnU5vjzLPK6yiHxQuRBzTbUtAugUP720Pio//cx5waTXD1P6EM+3ytAFyfvl4I=
X-Google-Smtp-Source: AGHT+IF/0ZQjpWTO/kzswQv3D7B/zyMEX3622m/+POuuA3VxiWPDi60YnkH9B5R9v8yUrOcCd3sTgQ==
X-Received: by 2002:a05:600c:46c4:b0:427:ff1e:ab1f with SMTP id
 5b1f17b1804b1-42b9add4859mr18463505e9.14.1724762240874; 
 Tue, 27 Aug 2024 05:37:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37308110420sm13086827f8f.6.2024.08.27.05.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 05:37:20 -0700 (PDT)
Date: Tue, 27 Aug 2024 14:37:18 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: Re: [pull] amdgpu, amdkfd, radeon, drm drm-next-6.12
Message-ID: <Zs3IfhJQVRnwRYDJ@phenom.ffwll.local>
References: <20240826201528.55307-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240826201528.55307-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
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

On Mon, Aug 26, 2024 at 04:15:26PM -0400, Alex Deucher wrote:
> Hi Dave, Sima,
> 
> New stuff for 6.12.
> 
> The following changes since commit 627a24f5f25d689682f395f3df1411273be4436b:
> 
>   Merge tag 'amd-drm-fixes-6.11-2024-07-18' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2024-07-22 13:03:50 +1000)

I ignored some busted fixes sha1:

dim: 2dc3851ef7d9 ("drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1"): Fixes: SHA1 in not pointing at an ancestor:
dim:     a03ebf116303 ("drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell")

I understand how this can happen in -fixes with cherry-pick, but in -next
it's a bit confusing. But pls don't rebase or the cherry-pick sha1 in
-fixes won't ever make sense :-)

Also I fixed a functional conflict with Christian's patch to drop
full_recovery from drm_sched_start, which landed through -misc. Please
double-check it's all looking good, and maybe backemerge (since I also
pulled in -rc5 with the conflicts with cherry-picks).

Pulled into drm-next, thanks.
-Sima

> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.12-2024-08-26
> 
> for you to fetch changes up to 3376f922bfe070eff762164b3fc66981e3079417:
> 
>   drm/amd/pm: Drop unsupported features on smu v14_0_2 (2024-08-23 10:55:22 -0400)
> 
> ----------------------------------------------------------------
> amd-drm-next-6.12-2024-08-26:
> 
> amdgpu:
> - SDMA devcoredump support
> - DCN 4.0.1 updates
> - DC SUBVP fixes
> - Refactor OPP in DC
> - Refactor MMHUBBUB in DC
> - DC DML 2.1 updates
> - DC FAMS2 updates
> - RAS updates
> - GFX12 updates
> - VCN 4.0.3 updates
> - JPEG 4.0.3 updates
> - Enable wave kill (soft recovery) for compute queues
> - Clean up CP error interrupt handling
> - Enable CP bad opcode interrupts
> - VCN 4.x fixes
> - VCN 5.x fixes
> - GPU reset fixes
> - Fix vbios embedded EDID size handling
> - SMU 14.x updates
> - Misc code cleanups and spelling fixes
> - VCN devcoredump support
> - ISP MFD i2c support
> - DC vblank fixes
> - GFX 12 fixes
> - PSR fixes
> - Convert vbios embedded EDID to drm_edid
> - DCN 3.5 updates
> - DMCUB updates
> - Cursor fixes
> - Overdrive support for SMU 14.x
> - GFX CP padding optimizations
> - DCC fixes
> - DSC fixes
> - Preliminary per queue reset infrastructure
> - Initial per queue reset support for GFX 9
> - Initial per queue reset support for GFX 7, 8
> - DCN 3.2 fixes
> - DP MST fixes
> - SR-IOV fixes
> - GFX 9.4.3/4 devcoredump support
> - Add process isolation framework
> - Enable process isolation support for GFX 9.4.3/4
> - Take IOMMU remapping into account for P2P DMA checks
> 
> amdkfd:
> - CRIU fixes
> - Improved input validation for user queues
> - HMM fix
> - Enable process isolation support for GFX 9.4.3/4
> - Initial per queue reset support for GFX 9
> - Allow users to target recommended SDMA engines
> 
> radeon:
> - remove .load and drm_dev_alloc
> - Fix vbios embedded EDID size handling
> - Convert vbios embedded EDID to drm_edid
> - Use GEM references instead of TTM
> - r100 cp init cleanup
> - Fix potential overflows in evergreen CS offset tracking
> 
> UAPI:
> - KFD support for targetting queues on recommended SDMA engines
>   Proposed userspace:
>   https://github.com/ROCm/ROCR-Runtime/commit/2f588a24065f41c208c3701945e20be746d8faf7
>   https://github.com/ROCm/ROCR-Runtime/commit/eb30a5bbc7719c6ffcf2d2dd2878bc53a47b3f30
> 
> drm/buddy:
> - Add start address support for trim function
> 
> ----------------------------------------------------------------
> Alex Deucher (47):
>       drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell
>       drm/amdgpu/gfx7: enable wave kill for compute queues
>       drm/amdgpu/gfx8: enable wave kill for compute queues
>       drm/amdgpu/gfx9: enable wave kill for compute queues
>       drm/amdgpu/gfx9.4.3: implement wave kill for compute queues
>       drm/amdgpu/gfx10: enable wave kill for compute queues
>       drm/amdgpu/gfx11: enable wave kill for compute queues
>       drm/amdgpu/gfx12: enable wave kill for compute queues
>       drm/amdgpu/gfx10: properly handle error ints on all pipes
>       drm/amdgpu/gfx11: properly handle error ints on all pipes
>       drm/amdgpu/gfx12: properly handle error ints on all pipes
>       drm/amdgpu/gfx9: properly handle error ints on all pipes
>       drm/amdgpu/gfx: add bad opcode interrupt
>       drm/amdgpu/gfx9: Enable bad opcode interrupt
>       drm/amdgpu/gfx9.4.3: Enable bad opcode interrupt
>       drm/amdgpu: properly handle vbios fake edid sizing
>       drm/radeon: properly handle vbios fake edid sizing
>       drm/amdgpu: Fix APU handling in amdgpu_pm_load_smu_firmware()
>       drm/amdgpu/jpeg2: properly set atomics vmid field
>       drm/amdgpu/jpeg4: properly set atomics vmid field
>       drm/amdgpu/mes: add API for legacy queue reset
>       drm/amdgpu/mes11: add API for legacy queue reset
>       drm/amdgpu/mes12: add API for legacy queue reset
>       drm/amdgpu: add new ring reset callback
>       drm/amdgpu: add per ring reset support (v5)
>       drm/amdgpu/gfx9: add ring reset callback
>       drm/amdgpu/gfx9.4.3: add ring reset callback
>       drm/amdgpu/gfx9: per queue reset only on bare metal
>       drm/amdgpu/gfx9: add ring reset callback for gfx
>       drm/amdgpu/gfx9: use proper rlc safe mode helpers
>       drm/amdgpu/gfx9.4.3: use proper rlc safe mode helpers
>       drm/amdgpu/gfx9.4.3: use rlc safe mode for soft recovery
>       drm/amdgpu/gfx9: use rlc safe mode for soft recovery
>       drm/amdgpu/gfx8: add ring reset callback for gfx
>       drm/amdgpu/gfx7: add ring reset callback for gfx
>       drm/amdgpu/gfx11: enter safe mode before touching CP_INT_CNTL
>       drm/amdgpu/gfx11: add a mutex for the gfx semaphore
>       drm/amdgpu/gfx11: export gfx_v11_0_request_gfx_index_mutex()
>       drm/amdgpu/mes: add API for user queue reset
>       drm/amdgpu/mes11: add API for user queue reset
>       drm/amdgpu/mes12: add API for user queue reset
>       drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1
>       drm/amdgpu: handle enforce isolation on non-0 gfxhub
>       drm/amdgpu: Emit cleaner shader at end of IB submission
>       drm/amdgpu: fix eGPU hotplug regression
>       drm/amd/gfx11: move the gfx mutex into the caller
>       drm/amdgpu/gfx12: set UNORD_DISPATCH in compute MQDs
> 
> Alex Hung (21):
>       drm/amd/display: Revert "Check HDCP returned status"
>       drm/amd/display: Initialize denominators' default to 1
>       drm/amd/display: Check null-initialized variables
>       drm/amd/display: Check phantom_stream before it is used
>       drm/amd/display: Pass non-null to dcn20_validate_apply_pipe_split_flags
>       drm/amd/display: Check null pointers before using them
>       drm/amd/display: Check stream before comparing them
>       drm/amd/display: Check link_res->hpo_dp_link_enc before using it
>       drm/amd/display: Check null pointers before used
>       drm/amd/display: Check null pointers before multiple uses
>       drm/amd/display: Increase array size of dummy_boolean
>       drm/amd/display: Add MST debug message when link detection fails
>       drm/amd/display: Check link_res->hpo_dp_link_enc before using it
>       drm/amd/display: Fix possible overflow in integer multiplication
>       drm/amd/display: Check null pointers before using them
>       drm/amd/display: Check stream_status before it is used
>       drm/amd/display: Avoid overflow assignment in link_dp_cts
>       drm/amd/display: Check null values from functions
>       drm/amd/display: Initialize get_bytes_per_element's default to 1
>       drm/amd/display: Check UnboundedRequestEnabled's value
>       drm/amd/display: Check null pointers before using dc->clk_mgr
> 
> Alvin Lee (7):
>       drm/amd/display: Disable HBR audio for DP2 for certain ASICs
>       drm/amd/display: Don't consider cursor for no plane case in DML1
>       drm/amd/display: When resync fifo ensure to use correct pipe ctx
>       drm/amd/display: Disable subvp based on HW cursor requirement
>       drm/amd/display: Calculate ODM width using odm slice rect, not recout
>       drm/amd/display: Add option to disable unbounded req in DML21
>       drm/amd/display: For FAMS2 don't program P-State force from driver
> 
> Amber Lin (2):
>       drm/amdkfd: APIs to stop/start KFD scheduling
>       drm/amdkfd: Enable processes isolation on gfx9
> 
> Aric Cyr (4):
>       drm/amd/display: 3.2.292
>       drm/amd/display: 3.2.293
>       drm/amd/display: 3.2.294
>       drm/amd/display: 3.2.295
> 
> Arnd Bergmann (1):
>       drm/amd: Use a constant format string for amdgpu_ucode_request
> 
> Arunpravin Paneer Selvam (3):
>       drm/buddy: Add start address support to trim function
>       drm/amdgpu: Add address alignment support to DCC buffers
>       drm/amdgpu: Add DCC GFX12 flag to enable address alignment
> 
> Aurabindo Pillai (7):
>       drm/amd/display: free bo used for dmub bounding box
>       drm/amd/display: rename dcn3/dcn4 to more sound terms
>       drm/amd/display: rename dcn401_soc to dcn4_variant_a_soc
>       drm/amd/display: remove unused folder
>       drm/amd/display: fix a UBSAN warning in DML2.1
>       drm/amd/display: Add more logging for MALL static screen
>       drm/amd/display: remove an extraneous call for checking dchub clock
> 
> Austin Zheng (4):
>       drm/amd/display: Check if Mode is Supported Before Returning Result
>       drm/amd/display: Disable SubVP if Hardware Rotation is Used
>       drm/amd/display: Unlock Pipes Based On DET Allocation
>       drm/amd/display: DML2.1 Reintegration for Various Fixes
> 
> Bas Nieuwenhuizen (1):
>       drm/amdgpu: Actually check flags for all context ops.
> 
> Bhuvanachandra Pinninti (1):
>       drm/amd/display: Refactor for dio
> 
> Candice Li (2):
>       drm/amdgpu: Validate TA binary size
>       drm/amd/pm: Drop unsupported features on smu v14_0_2
> 
> Chaitanya Dhere (1):
>       drm/amd/display: DML2.1 resynchronization
> 
> Charlene Liu (3):
>       drm/amd/display: restore immediate_disable_crtc for w/a
>       drm/amd/display: sync dmub output event type.
>       drm/amd/display: remove redundant msg to pmfw at boot/resume
> 
> Chris Park (3):
>       drm/amd/display: Deallocate DML memory if allocation fails
>       drm/amd/display: Add two dmmuy I2C entry for GPIO port mapping issue
>       drm/amd/display: Address coverity change
> 
> Christian König (2):
>       drm/amdgpu: fix contiguous handling for IB parsing v2
>       drm/radeon: use GEM references instead of TTMs
> 
> Colin Ian King (2):
>       drm/amd/display: Fix spelling mistake "tolarance" -> "tolerance"
>       drm/amd/display: remove extraneous ; after statements
> 
> Cruise (2):
>       drm/amd/display: Add logs for debugging outbox
>       drm/amd/display: Get link index for AUX reply notification
> 
> Daniel Sa (2):
>       drm/amd/display: Set Cursor Matrix to bypass instead of Input Plane
>       drm/amd/display: Underflow Seen on DCN401 eGPU
> 
> David (Ming Qiang) Wu (2):
>       drm/amd/amdgpu: command submission parser for JPEG
>       drm/amd/amdgpu: cleanup parse_cs callbacks
> 
> David Belanger (1):
>       drm/amdgpu: Fix atomics on GFX12
> 
> Dillon Varone (11):
>       drm/amd/display: Add blanked streams override to DML2.1
>       drm/amd/display: Add P-State Keepout to dcn401 Global Sync
>       drm/amd/display: Export additional FAMS2 global configuration options from DML
>       drm/amd/display: Remove hardmax usage for dcn401
>       drm/amd/display: Various DML2 fixes for FAMS2
>       drm/amd/display: Force enable 3DLUT DMA check for dcn401 in DML
>       drm/amd/display: Add DML2.1 option to disable DRR clamped P-State Strategies
>       drm/amd/display: Reduce redundant minimal transitions due to SubVP
>       drm/amd/display: Disable DCN401 UCLK P-State support on full updates
>       drm/amd/display: Perform outstanding programming on full updates
>       drm/amd/display: Set max VTotal cap for dcn401
> 
> Duncan Ma (1):
>       drm/amd/display: Add visual confirm for Idle State
> 
> Fangzhi Zuo (3):
>       drm/amd/display: Print Pcon FRL Link BW in Debug Message
>       drm/amd/display: Skip Recompute DSC Params if no Stream on Link
>       drm/amd/display: Fix MST BW calculation Regression
> 
> Frank Min (2):
>       drm/amdgpu: change non-dcc buffer copy configuration
>       drm/amdgpu: correct sdma7 max dw
> 
> Fudong Wang (1):
>       drm/amd/display: skip crtc power down when ips switch
> 
> Fudongwang (1):
>       drm/amd/display: add dmcub support check
> 
> Gabe Teeger (3):
>       drm/amd/display: Fix DP-DVI dongle hotplug
>       drm/amd/display: Fix Potential Null Dereference
>       drm/amd/display: Revert Avoid overflow assignment
> 
> Geert Uytterhoeven (1):
>       drm/radeon/r100: Handle unknown family in r100_cp_init_microcode()
> 
> Hamza Mahfooz (1):
>       drm/amd/display: fix s2idle entry for DCN3.5+
> 
> Hansen Dsouza (10):
>       drm/amd/display: Add private data type for RCG
>       drm/amd/display: Add RCG helper functions
>       drm/amd/display: Add source select helper functions
>       drm/amd/display: Add new enable and disable functions
>       drm/amd/display: Add new enable and disable functions for DCN35
>       drm/amd/display: Add stream and char control callback
>       drm/amd/display: Add clock control callbacks
>       drm/amd/display: Add clock control callbacks
>       drm/amd/display: Update to using new dccg callbacks
>       Revert "drm/amd/display: Update to using new dccg callbacks"
> 
> Hawking Zhang (4):
>       drm/amdgpu: Add more types for boot time error reporting
>       drm/amdkfd: Check int source id for utcl2 poison event
>       drm/amdkfd: Drop poison hanlding from gfx v10
>       drm/amdgpu: Retire query_utcl2_poison_status callback
> 
> Ilya Bakoulin (3):
>       drm/amd/display: Add helper function to check for non-address fast updates
>       drm/amd/display: Use correct cm_helper function
>       drm/amd/display: Fix construct_phy with MXM connector
> 
> Jack Xiao (9):
>       drm/amdgpu/mes: fix mes ring buffer overflow
>       drm/amdgpu/mes12: update mes_v12_api_def.h
>       drm/amdgpu/mes: add multiple mes ring instances support
>       drm/amdgpu/mes12: load unified mes fw on pipe0 and pipe1
>       drm/amdgpu/mes12: add mes pipe switch support
>       drm/amdgpu/mes12: adjust mes12 sw/hw init for multiple pipes
>       drm/amdgpu/mes12: configure two pipes hardware resources
>       drm/amdgpu/mes12: sw/hw fini for unified mes
>       drm/amdgpu/mes12: fix suspend issue
> 
> Jane Jian (1):
>       drm/amdgpu/vcn: Use offsets local to VCN/JPEG in VF
> 
> Jesse Zhang (3):
>       drm/amdgpu/gfx11: Enable bad opcode interrupt
>       drm/amdgpu/gfx10: Enable bad opcode interrupt
>       drm/amdgpu/gfx12: Enable bad opcode interrupt
> 
> Jiadong Zhu (7):
>       drm/amdgpu/gfx9: remap queue after reset successfully
>       drm/amdgpu/gfx9: wait for reset done before remap
>       drm/amdgpu/gfx9.4.3: remap queue after reset successfully
>       drm/amdgpu/gfx_9.4.3: wait for reset done before remap
>       drm/amdgpu/gfx: add a new kiq_pm4_funcs callback for reset_hw_queue
>       drm/amdgpu/gfx9: implement reset_hw_queue for gfx9
>       drm/amdgpu/gfx9.4.3: implement reset_hw_queue for gfx9.4.3
> 
> Jiapeng Chong (2):
>       drm/amd/display: use swap() in sort()
>       drm/amd/display: remove unneeded semicolon
> 
> Jingwen Zhu (1):
>       drm/amd/display: avoid disable otg when dig was disabled
> 
> Jinjie Ruan (4):
>       drm/amd/display: Make core_dcn4_g6_temp_read_blackout_table static
>       drm/amd/display: Make core_dcn4_ip_caps_base static
>       drm/amd/display: Make dcn35_hubp_funcs static
>       drm/amd/display: Make dcn401_dsc_funcs static
> 
> Jonathan Kim (5):
>       drm/amdkfd: allow users to target recommended SDMA engines
>       drm/amdkfd: support per-queue reset on gfx9
>       drm/amdkfd: fix debug watchpoints for logical devices
>       drm/amdkfd: fix partition query when setting up recommended sdma engines
>       drm/amdkfd: fallback to pipe reset on queue reset fail for gfx9
> 
> Joshua Aberback (3):
>       drm/amd/display: Remove unnecessary DSC power gating for DCN401
>       drm/amd/display: Remove duplicate HWSS interfaces
>       drm/amd/display: Assume 32 bpp cursor in DML21
> 
> Joshua Ashton (1):
>       drm/amdgpu: Forward soft recovery errors to userspace
> 
> Kenneth Feng (5):
>       drm/amdgpu/pm: support gpu_metrics sysfs interface for smu v14.0.2/3
>       drm/amd/pm: update powerplay structure on smu v14.0.2/3
>       drm/amd/pm: add overdrive support on smu v14.0.2/3
>       drm/amd/amdgpu: add HDP_SD support on gc 12.0.0/1
>       drm/amd/pm: update message interface for smu v14.0.2/3
> 
> Leo Li (2):
>       drm/amd/display: Let drm_crtc_vblank_on/off manage interrupts
>       drm/amd/display: Run idle optimizations at end of vblank handler
> 
> Lijo Lazar (5):
>       drm/amdgpu: Add empty HDP flush function to JPEG v4.0.3
>       drm/amdgpu: Add empty HDP flush function to VCN v4.0.3
>       drm/amdkfd: Add node_id to location_id generically
>       drm/amdgpu: Reorder to read EFI exported ROM first
>       drm/amd/pm: Add support for new P2S table revision
> 
> Likun Gao (3):
>       drm/amdgpu: force to use legacy inv in mmhub
>       drm/amdgpu: add golden setting for gc v12
>       drm/amdgpu: support for gc_info table v1.3
> 
> Loan Chen (1):
>       drm/amd/display: Enable otg synchronization logic for DCN321
> 
> Ma Ke (4):
>       drm/radeon: fix null pointer dereference in radeon_add_common_modes
>       drm/amdgpu: fix a possible null pointer dereference
>       drm/amd/amdgpu: Fix uninitialized variable warnings
>       drm/amd/display: avoid using null object of framebuffer
> 
> Martin Leung (2):
>       drm/amd/display: Promote DAL to 3.2.296
>       drm/amd/display: Promote DC to 3.2.297
> 
> Meenakshikumar Somasundaram (1):
>       drm/amd/display: Enable aux transfer path via dmub for dp tunneling
> 
> Melissa Wen (1):
>       drm/amd/display: fix cursor offset on rotation 180
> 
> Michael Chen (1):
>       drm/amdgpu: increase mes log buffer size for gfx12
> 
> Michael Strauss (3):
>       drm/amd/display: Fix overlay with pre-blend color processing
>       drm/amd/display: Update HPO I/O When Handling Link Retrain Automation Request
>       drm/amd/display: Allow UHBR Interop With eDP Supported Link Rates Table
> 
> Mounika Adhuri (1):
>       drm/amd/display: Refactoring MPC
> 
> Mudimela (1):
>       drm/amd/display: Refactoring DWB related files from dcn30 Files
> 
> Muhammad Ahmed (1):
>       drm/amd/display: guard otg disable w/a for test
> 
> Mukul Joshi (3):
>       drm/amdgpu: Implement MES Suspend and Resume APIs for GFX11
>       drm/amdkfd: Update queue unmap after VM fault with MES
>       drm/amdkfd: Update BadOpcode Interrupt handling with MES
> 
> Nathan Chancellor (1):
>       drm/amd/display: Reapply 2fde4fdddc1f
> 
> Nevenko Stupar (2):
>       drm/amd/display: Issue with 3 or more mcaches per surface
>       drm/amd/display: Hardware cursor changes color when switched to software cursor
> 
> Nicholas Kazlauskas (3):
>       drm/amd/display: Request 0MHz dispclk for zero display case
>       drm/amd/display: Add seamless boot support for more DIG operation modes
>       drm/amd/display: Use gpuvm_min_page_size_kbytes for DML2 surfaces
> 
> Nicholas Susanto (2):
>       drm/amd/display: Remove redundant check in DCN35 hwseq
>       drm/amd/display: DCN35 set min dispclk to 50Mhz
> 
> Nikita Zhandarovich (1):
>       drm/radeon/evergreen_cs: fix int overflow errors in cs track offsets
> 
> Philip Yang (11):
>       drm/amdkfd: kfd_bo_mapped_dev support partition
>       drm/amdkfd: amdkfd_free_gtt_mem clear the correct pointer
>       drm/amdkfd: Refactor queue wptr_bo GART mapping
>       drm/amdkfd: Validate user queue buffers
>       drm/amdkfd: Ensure user queue buffers residency
>       drm/amdkfd: Validate user queue svm memory residency
>       drm/amdkfd: Validate user queue update
>       drm/amdkfd: Store queue cwsr area size to node properties
>       drm/amdkfd: Validate queue cwsr area and eop buffer size
>       drm/amdkfd: Fix compile error if HMM support not enabled
>       drm/amdkfd: Handle queue destroy buffer access race
> 
> Pierre-Eric Pelloux-Prayer (1):
>       drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit
> 
> Prike Liang (1):
>       drm/amdgpu: increase the reset counter for the queue reset
> 
> Rahul Jain (1):
>       drm/amdgpu: Take IOMMU remapping into account for p2p checks
> 
> Relja Vojvodic (2):
>       drm/amd/display: Implement bias and scale pre scl
>       drm/amd/display: 3DLUT non-DMA refactor
> 
> Remington Brasga (1):
>       drm/amdgpu/uvd4: fix mask and shift definitions
> 
> Revalla Hari Krishna (3):
>       drm/amd/display: Refactoring OPP
>       drm/amd/display: Refactoring MMHUBBUB
>       drm/amd/display: Refactoring HPO
> 
> Robin Chen (1):
>       drm/amd/display: Optimize vstartup position for AS-SDP
> 
> Rodrigo Siqueira (23):
>       drm/amd/display: Remove unused dml2_core_ip_params struct
>       drm/amd/display: Remove ASSERT if significance is zero in math_ceil2
>       drm/amd/display: Remove old comments
>       drm/amd/display: Re-order enum in a header file
>       drm/amd/display: Setup two pixel per container
>       drm/amd/display: Replace dm_execute_dmub_cmd with dc_wake_and_execute_dmub_cmd
>       drm/amd/display: Add missing DET segments programming
>       drm/amd/display: Remove duplicated code
>       drm/amd/display: Add missing mcache registers
>       drm/amd/display: Add dcc propagation value
>       drm/amd/display: Add missing registers for dcn32
>       drm/amd/display: Remove unused code
>       drm/amd/display: Add missing DCN314 to the DML Makefile
>       drm/amd/display: Cleanup dml2 and dc/resource Makefile
>       drm/amd/display: Remove useless defines
>       drm/amd/display: Remove unused fields from dmub_cmd_update_dirty_rect_data
>       drm/amd/display: Remove unused fields from dc_caps
>       drm/amd/display: Add missing program DET segment call to pipe init
>       drm/amd/display: Check null pointer before try to access it
>       drm/amd/display: Remove unused field
>       drm/amd/display: Improve FAM control for DCN401
>       drm/amd/display: Adjust cursor position
>       drm/amd/display: Remove unnecessary call to REG_SEQ_SUBMIT|WAIT_DONE
> 
> Roman Li (2):
>       drm/amd/display: Replace assert with error message in dp_retrieve_lttpr_cap()
>       drm/amd/display: Fix print format specifiers in DC_LOG_IPS
> 
> Ryan Seto (2):
>       drm/amd/display: Added logging for automated DPM testing
>       drm/amd/display: Fix visual confirm bug for SubVP
> 
> Samson Tam (4):
>       drm/amd/display: quality improvements for EASF and ISHARP
>       drm/amd/display: remove dc dependencies from SPL library
>       drm/amd/display: ensure EASF and ISHARP coefficients are programmed together
>       drm/amd/display: roll back quality EASF and ISHARP and dc dependency changes
> 
> Soham Dandapat (1):
>       drm/amdgpu: Return earlier in amdgpu_sw_ring_ib_end if mcbp is off
> 
> Sridevi Arvindekar (1):
>       drm/amd/display: Add option to allow transition when odm is forced
> 
> Srinivasan Shanmugam (36):
>       drm/amd/display: Add 'pstate_keepout' kdoc entry in 'optc1_program_timing'
>       drm/amd/display: Add kdoc entry for 'bs_coeffs_updated' in dpp401_dscl_program_isharp
>       drm/amd/display: Fix index out of bounds in DCN30 degamma hardware format translation
>       drm/amd/display: Fix index out of bounds in degamma hardware format translation
>       drm/amd/display: Implement bounds check for stream encoder creation in DCN401
>       drm/amd/display: Fix index out of bounds in DCN30 color transformation
>       drm/amd/display: Add null check for head_pipe in dcn201_acquire_free_pipe_for_layer
>       drm/amd/display: Add null check for head_pipe in dcn32_acquire_idle_pipe_for_head_pipe_in_layer
>       drm/amd/display: Add NULL check for clk_mgr and clk_mgr->funcs in dcn30_init_hw
>       drm/amd/display: Add NULL check for clk_mgr and clk_mgr->funcs in dcn401_init_hw
>       drm/amd/display: Add NULL check for clk_mgr in dcn32_init_hw
>       drm/amd/display: Add null check for set_output_gamma in dcn30_set_output_transfer_func
>       drm/amd/display: Add null check for pipe_ctx->plane_state in dcn20_program_pipe
>       drm/amd/display: Add null check for top_pipe_to_program in commit_planes_for_stream
>       drm/amdkfd: Fix missing error code in kfd_queue_acquire_buffers
>       drm/amd/display: Handle null 'stream_status' in 'planes_changed_for_existing_stream'
>       drm/amd/display: Align 'dpp401_dscl_program_isharp' with actual function parameters
>       drm/amd/display: Add NULL check for function pointer in dcn20_set_output_transfer_func
>       drm/amd/display: Add NULL check for function pointer in dcn401_set_output_transfer_func
>       drm/amd/display: Add NULL check for function pointer in dcn32_set_output_transfer_func
>       drm/amd/display: Add null check for 'afb' in amdgpu_dm_update_cursor (v2)
>       drm/amd/display: Add null check for 'afb' in amdgpu_dm_plane_handle_cursor_update (v2)
>       drm/amd/display: Align hwss_wait_for_all_blank_complete descriptor with implementation
>       drm/amdgpu: Add infrastructure for Cleaner Shader feature
>       drm/amdgpu: Make enforce_isolation setting per GPU
>       drm/amdgpu: Enforce isolation as part of the job
>       drm/amdgpu: Add enforce_isolation sysfs attribute
>       drm/amdgpu: Add sysfs interface for running cleaner shader
>       drm/amdgpu: Add PACKET3_RUN_CLEANER_SHADER for cleaner shader execution
>       drm/amdgpu/gfx9: Implement cleaner shader support for GFX9 hardware
>       drm/amdgpu/gfx9: Implement cleaner shader support for GFX9.4.3 hardware
>       drm/amdgpu/gfx9: Add cleaner shader for GFX9.4.3
>       drm/amdgpu/gfx9: Add cleaner shader support for GFX9.4.4 hardware
>       drm/amdgpu: Implement Enforce Isolation Handler for KGD/KFD serialization
>       drm/amdgpu/gfx9: Apply Isolation Enforcement to GFX & Compute rings
>       drm/amdgpu/gfx_v9_4_3: Apply Isolation Enforcement to GFX & Compute rings
> 
> Stanley.Yang (1):
>       drm/amdgpu: Fix eeprom max record count
> 
> Sung Joon Kim (5):
>       drm/amd/display: Do 1-to-1 mapping between OPP and DSC in DML2
>       drm/amd/display: Check stream pointer is initialized before accessing
>       drm/amd/display: Check for NULL pointer
>       drm/amd/display: Check top sink only when multiple streams for DP2
>       drm/amd/display: Support UHBR10 link rate on eDP
> 
> Sung Lee (1):
>       drm/amd/display: Fix Cursor Offset in Scaled Scenarios
> 
> Sunil Khatri (60):
>       drm/amdgpu: Add sdma_v5_2 ip dump for devcoredump
>       drm/amdgpu: add print support for sdma_v_5_2 ip_dump
>       drm/amdgpu: fix the extra space between two functions
>       drm/amdgpu: fix the print message in devcoredump
>       drm/amdgpu: Add sdma_v6_0 ip dump for devcoredump
>       drm/amdgpu: add print support for sdma_v_6_0 ip_dump
>       drm/amdgpu: Add sdma_v5_0 ip dump for devcoredump
>       drm/amdgpu: add print support for sdma_v_5_0 ip_dump
>       drm/amdgpu: Add sdma_v7_0 ip dump for devcoredump
>       drm/amdgpu: add print support for sdma_v_7_0 ip_dump
>       drm/amdgpu: Add sdma_v4_0 ip dump for devcoredump
>       drm/amdgpu: add print support for sdma_v_4_0 ip_dump
>       drm/amdgpu: Add sdma_v4_4_2 ip dump for devcoredump
>       drm/amdgpu: add print support for sdma_v_4_4_2 ip_dump
>       drm/amdgpu: add vcn ip dump ptr in vcn global struct
>       drm/amdgpu: add macro to calculate offset with instance
>       drm/amdgpu: add vcn_v3_0 ip dump support
>       drm/amdgpu: add print support for vcn_v3_0 ip dump
>       drm/amdgpu: print VCN instance dump for valid instance
>       drm/amdgpu: trigger ip dump before suspend of IP's
>       drm/amdgpu: Remove debugfs amdgpu_reset_dump_register_list
>       drm/amdgpu: Clean up the register dump via debugfs list
>       drm/amdgpu: optimize the padding for gfx10
>       drm/amdgpu: do not call insert_nop fn for zero count
>       drm/amdgpu: optimize the padding for gfx11
>       drm/amdgpu: optimize the padding for gfx12
>       drm/amdgpu: optimize the padding for gfx9
>       drm/amdgpu: optimize the padding for gfx_v9_4_3
>       drm/amdgpu: add vcn_v5_0 ip dump support
>       Revert "drm/amdgpu: add vcn_v5_0 ip dump support"
>       Revert "drm/amdgpu: add print support for vcn_v3_0 ip dump"
>       Revert "drm/amdgpu: add vcn_v3_0 ip dump support"
>       Revert "drm/amdgpu: add vcn ip dump ptr in vcn global struct"
>       drm/amdgpu: fix ptr check warning in gfx9 ip_dump
>       drm/amdgpu: fix ptr check warning in gfx10 ip_dump
>       drm/amdgpu: fix ptr check warning in gfx11 ip_dump
>       drm/amdgpu: fix ptr check warning in gfx12 ip_dump
>       drm/amdgpu: add gfx9_4_3 register support in ipdump
>       drm/amdgpu: add print support for gfx9_4_3 ipdump
>       drm/amdgpu: add cp queue registers for gfx9_4_3 ipdump
>       drm/amdgpu: add cp queue registers print for gfx9_4_3
>       drm/amdgpu: remove ME0 registers from  mi300 dump
>       drm/amdgpu: add vcn ip dump ptr in vcn global struct
>       drm/amdgpu: add vcn_v3_0 ip dump support
>       drm/amdgpu: add print support for vcn_v3_0 ip dump
>       drm/amdgpu: add vcn_v5_0 ip dump support
>       drm/amdgpu: add print support for vcn_v5_0 ip dump
>       drm/amdgpu: add vcn_v4_0_3 ip dump support
>       drm/amdgpu: add vcn_v4_0 ip dump support
>       drm/amdgpu: add vcn_v4_0_5 ip dump support
>       drm/amdgpu: add print support for vcn_v4_0_3 ip dump
>       drm/amdgpu: add print support for vcn_v4_0 ip dump
>       drm/amdgpu: add print support for vcn_v4_0_5 ip dump
>       drm/amdgpu: add vcn_v1_0 ip dump support
>       drm/amdgpu: add print support for vcn_v1_0 ip dump
>       drm/amdgpu: add vcn_v2_0 ip dump support
>       drm/amdgpu: add print support for vcn_v2_0 ip dump
>       drm/amdgpu: add vcn_v2_5 ip dump support
>       drm/amdgpu: add print support for vcn_v2_5 ip dump
>       drm/amdgpu: add vcn ip dump support for vcn_v2_6
> 
> Tao Zhou (3):
>       drm/amdgpu: create function to check RAS RMA status
>       drm/amdgpu: update bad state check in GPU recovery
>       drm/amdgpu: report bad status in GPU recovery
> 
> Thomas Weißschuh (2):
>       drm/amdgpu: convert bios_hardcoded_edid to drm_edid
>       drm/radeon: convert bios_hardcoded_edid to drm_edid
> 
> Tim Huang (6):
>       drm/amdgpu: add missed harvest check for VCN IP v4/v5
>       drm/amd/pm: fix unchecked return value warning for vega10_hwmgr
>       drm/amdgpu: fix unchecked return value warning for amdgpu_gfx
>       drm/amdgpu: fix unchecked return value warning for amdgpu_atombios
>       drm/amd/display: fix double free issue during amdgpu module unload
>       drm/amd/pm: ensure the fw_info is not null before using it
> 
> Tobias Jakobi (3):
>       drm/amd: Make amd_ip_funcs static for SDMA v5.0
>       drm/amd: Make amd_ip_funcs static for SDMA v5.2
>       drm/amdgpu/swsmu: fix SMU11 typos (memlk -> memclk)
> 
> Tom Chung (5):
>       drm/amd/display: Disable replay if VRR capability is false
>       drm/amd/display: Fix VRR cannot enable
>       drm/amd/display: Add a missing PSR state
>       drm/amd/display: Reset VRR config during resume
>       drm/amd/display: Re-enable panel replay feature
> 
> Tvrtko Ursulin (1):
>       drm/amdpgu: Micro-optimise amdgpu_ring_commit
> 
> Venkata Narendra Kumar Gutta (1):
>       drm/amdgpu: Add MFD support for ISP I2C bus
> 
> Victor Skvortsov (4):
>       Revert "drm/amdgpu: Extend KIQ reg polling wait for VF"
>       drm/amdgpu: Disable dpm_enabled flag while VF is in reset
>       drm/amdgpu: Block MMR_READ IOCTL in reset
>       drm/amdgpu: abort KIQ waits when there is a pending reset
> 
> Victor Zhao (2):
>       drm/amd/sriov: extend NV_MAILBOX_POLL_MSG_TIMEDOUT
>       drm/amd/amdgpu: allow use kiq to do hdp flush under sriov
> 
> WangYuli (1):
>       drm/amd/amdgpu: Properly tune the size of struct
> 
> Wayne Lin (1):
>       drm/amd/display: Check null pointer before try to access it
> 
> Wenjing Liu (4):
>       drm/amd/display: fix dscclk programming sequence on DCN401
>       drm/amd/display: apply vmin optimization even if it doesn't reach vmin level
>       drm/amd/display: fix minor coding errors where dml21 phase 5 uses wrong variables
>       drm/amd/display: apply vmin optimization even if it doesn't reach vmin level
> 
> Wu Hoi Pok (6):
>       drm/radeon: change variable name "dev" to "ddev" for consistency
>       drm/radeon: remove load callback from kms_driver
>       drm/radeon: use variable flags as parameter
>       drm/radeon: add helper rdev_to_drm(rdev)
>       drm/radeon: change rdev->ddev to rdev_to_drm(rdev)
>       drm/radeon: change drm_dev_alloc to devm_drm_dev_alloc
> 
> Xiaogang Chen (1):
>       drm/amdkfd: Change kfd/svm page fault drain handling
> 
> Yang Wang (3):
>       drm/amdgpu: remove RAS unused paramter 'err_addr'
>       drm/amdgpu: fixing rlc firmware loading failure issue
>       drm/amdgpu: add list empty check to avoid null pointer issue
> 
> YiPeng Chai (4):
>       drm/amdgpu: optimize umc v12 address conversion function
>       drm/amdgpu: optimize logging deferred error info
>       drm/amdgpu: Remove unused code
>       drm/amdgpu: fix ras UE error injection failure issue
> 
> Yifan Zhang (2):
>       drm/amdgpu: skip kfd init if GFX is not ready.
>       drm/amdgpu: use CPU for page table update if SDMA is unavailable
> 
> Yinjie Yao (1):
>       drm/amdgpu: Update kmd_fw_shared for VCN5
> 
> Zhang Zekun (1):
>       drm/amd: Remove unused declarations
> 
> ZhenGuo Yin (1):
>       drm/amdgpu: reset vm state machine after gpu reset(vram lost)
> 
>  drivers/gpu/drm/amd/amdgpu/Makefile                |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |   32 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_aca.c            |   16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c         |   48 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h         |   22 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_aldebaran.c   |    2 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_arcturus.c    |    4 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gc_9_4_3.c    |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.c |   16 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10.h |    9 +
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v10_3.c   |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v11.c |   18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.c  |  101 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gfx_v9.h  |    9 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c   |   24 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c       |   35 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c           |   10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c            |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |    9 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |   26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c            |    8 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c        |   96 --
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c   |   12 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  132 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_df.h             |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |   18 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h           |    2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c            |  481 ++++++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h            |   44 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfxhub.h         |    2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |    8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h            |    6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c            |   17 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h            |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c            |   23 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h            |    3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c            |   43 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mca.c            |   14 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c            |  229 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mes.h            |   49 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mmhub.h          |    2 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.h         |    6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp_ta.c         |    3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   73 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   33 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.c     |    3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h          |    6 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c           |    8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h           |    3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ring_mux.c       |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.h           |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  102 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.h            |    5 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c       |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c            |    3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c            |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.h            |    8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |   10 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |    1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c             |   25 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h             |    2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c       |   36 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c           |    4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h        |    4 +-
>  drivers/gpu/drm/amd/amdgpu/aqua_vanjaram.c         |    4 +
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |   38 +-
>  drivers/gpu/drm/amd/amdgpu/cikd.h                  |    1 +
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |    2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |    2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/df_v4_15.c              |   45 +
>  drivers/gpu/drm/amd/amdgpu/df_v4_15.h              |   30 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |  238 +++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  251 +++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.h             |    3 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0_3.c           |    2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  289 ++++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c              |   77 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v8_0.c              |   76 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c              |  367 +++++-
>  .../gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h   |   26 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  599 ++++++++-
>  .../drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.asm   |  153 +++
>  .../gpu/drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.h |   64 +
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c           |   18 -
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   17 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c             |    3 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |    2 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   20 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |    4 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v4_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v5_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v6_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/hdp_v7_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            |   57 +-
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |   11 +
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            |   57 +-
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |   11 +
>  drivers/gpu/drm/amd/amdgpu/jpeg_v2_0.c             |    4 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.c           |   90 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_3.h           |    7 +-
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           |    1 +
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |  147 ++-
>  drivers/gpu/drm/amd/amdgpu/mes_v12_0.c             |  370 ++++--
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   21 +-
>  drivers/gpu/drm/amd/amdgpu/mmhub_v4_1_0.c          |    3 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             |  102 ++
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c           |  104 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c             |  106 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.h             |    1 -
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c             |  120 +-
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.h             |    1 -
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |  112 ++
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c             |  120 +-
>  drivers/gpu/drm/amd/amdgpu/smu_v13_0_10.c          |    2 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.h                 |    4 +
>  drivers/gpu/drm/amd/amdgpu/soc15d.h                |   10 +
>  drivers/gpu/drm/amd/amdgpu/soc24.c                 |    6 +
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |  173 ++-
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.h             |    5 +
>  drivers/gpu/drm/amd/amdgpu/vce_v3_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/vce_v4_0.c              |    2 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v1_0.c              |  112 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_0.c              |  113 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v2_5.c              |  118 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c              |  113 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c              |  120 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_3.c            |  169 ++-
>  drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c            |  119 +-
>  drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c            |  116 +-
>  drivers/gpu/drm/amd/amdgpu/vid.h                   |    1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c           |   78 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_debug.c             |   20 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   48 +-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |  426 +++++-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.h  |   21 +
>  drivers/gpu/drm/amd/amdkfd/kfd_events.c            |   22 +
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v10.c   |   71 -
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c   |    9 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c    |   18 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |    2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v12.c   |    1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager_v9.c    |    6 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager_v9.c |   14 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_pm4_headers_ai.h    |    5 +-
>  .../gpu/drm/amd/amdkfd/kfd_pm4_headers_aldebaran.h |    2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h              |   41 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |    4 +-
>  .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c |   84 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_queue.c             |  373 ++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c               |  107 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h               |    5 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c          |   55 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.h          |    5 +
>  drivers/gpu/drm/amd/amdkfd/soc15_int.h             |    1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  130 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |   60 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |    5 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   12 +
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   36 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    |    3 +
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   12 +-
>  drivers/gpu/drm/amd/display/dc/Makefile            |    1 -
>  drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.c |   27 +
>  .../amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.c |    2 +-
>  .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   28 +-
>  .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  300 +++--
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  199 +--
>  .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  225 +++-
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   54 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stat.c      |    1 +
>  drivers/gpu/drm/amd/display/dc/core/dc_state.c     |   14 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_surface.c   |    3 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |   21 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   63 +-
>  drivers/gpu/drm/amd/display/dc/dc_hw_types.h       |    7 -
>  drivers/gpu/drm/amd/display/dc/dc_spl_translate.c  |    2 +-
>  drivers/gpu/drm/amd/display/dc/dc_stream.h         |    9 +
>  drivers/gpu/drm/amd/display/dc/dc_types.h          |    1 +
>  .../gpu/drm/amd/display/dc/dccg/dcn20/dcn20_dccg.h |    6 +-
>  .../gpu/drm/amd/display/dc/dccg/dcn35/dcn35_dccg.c | 1356 ++++++++++++++++++++
>  .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |   32 +-
>  .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.h   |    4 -
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |    6 +
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.h     |    1 +
>  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       |   10 +-
>  drivers/gpu/drm/amd/display/dc/dce/dmub_psr.c      |    3 +
>  drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |    5 +-
>  .../display/dc/dce110/dce110_timing_generator.c    |    1 +
>  .../display/dc/dce110/dce110_timing_generator.h    |    1 +
>  .../display/dc/dce110/dce110_timing_generator_v.c  |    1 +
>  .../display/dc/dce120/dce120_timing_generator.c    |    1 +
>  .../amd/display/dc/dce60/dce60_timing_generator.c  |    3 +-
>  .../amd/display/dc/dce80/dce80_timing_generator.c  |    3 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |    2 -
>  .../gpu/drm/amd/display/dc/dcn10/dcn10_cm_common.c |    2 +
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |    3 +-
>  drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |    6 +-
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_cm_common.c |    6 +-
>  drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |    2 +-
>  drivers/gpu/drm/amd/display/dc/dcn303/Makefile     |   13 -
>  drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |    2 +-
>  drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |   10 -
>  drivers/gpu/drm/amd/display/dc/dcn401/Makefile     |   10 -
>  drivers/gpu/drm/amd/display/dc/dio/Makefile        |   18 +
>  .../dc/{ => dio}/dcn301/dcn301_dio_link_encoder.c  |    0
>  .../dc/{ => dio}/dcn301/dcn301_dio_link_encoder.h  |    0
>  .../{ => dio}/dcn314/dcn314_dio_stream_encoder.c   |    0
>  .../{ => dio}/dcn314/dcn314_dio_stream_encoder.h   |    0
>  .../dc/dio/dcn321/dcn321_dio_link_encoder.c        |    1 -
>  .../dc/dio/dcn35/dcn35_dio_stream_encoder.c        |   29 +-
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h        |    3 +
>  drivers/gpu/drm/amd/display/dc/dml/Makefile        |    2 +
>  .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |    5 +-
>  .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |    2 +-
>  .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |    2 +-
>  .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |    2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   11 +-
>  .../gpu/drm/amd/display/dc/dml/dcn321/dcn321_fpu.c |    4 +-
>  .../drm/amd/display/dc/dml/display_mode_structs.h  |    1 +
>  .../amd/display/dc/dml/dml1_display_rq_dlg_calc.c  |    2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile       |    8 -
>  .../dc/dml2/dml21/dml21_translation_helper.c       |  106 +-
>  .../dc/dml2/dml21/dml21_translation_helper.h       |    1 +
>  .../drm/amd/display/dc/dml2/dml21/dml21_utils.c    |  167 ++-
>  .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |    4 +-
>  .../dc/dml2/dml21/inc/bounding_boxes/dcn3_soc_bb.h |    8 +-
>  .../dc/dml2/dml21/inc/bounding_boxes/dcn4_soc_bb.h |   25 +-
>  .../drm/amd/display/dc/dml2/dml21/inc/dml_top.h    |    1 -
>  .../dc/dml2/dml21/inc/dml_top_dchub_registers.h    |    1 -
>  .../dc/dml2/dml21/inc/dml_top_display_cfg_types.h  |    3 +-
>  .../dc/dml2/dml21/inc/dml_top_policy_types.h       |    1 -
>  .../dml2/dml21/inc/dml_top_soc_parameter_types.h   |   17 +-
>  .../amd/display/dc/dml2/dml21/inc/dml_top_types.h  |   13 +-
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.c   |  127 +-
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4.h   |    1 -
>  .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |  927 +++++++------
>  .../dml21/src/dml2_core/dml2_core_dcn4_calcs.h     |    2 +-
>  .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |    3 +-
>  .../dml2/dml21/src/dml2_core/dml2_core_factory.h   |    1 -
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  224 ++--
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.h |   38 -
>  .../dml21/src/dml2_core/dml2_core_shared_types.h   |   30 +-
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.c  |  631 +++++++++
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_utils.h  |   39 +
>  .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.c   |  169 ++-
>  .../dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_dcn4.h   |    1 -
>  .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |    3 +-
>  .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.h   |    1 -
>  .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.c     |    1 -
>  .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_dcn4.h     |    1 -
>  .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |    1 -
>  .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.h  |    1 -
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.c     |    9 +-
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn3.h     |    1 -
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c     | 1250 ------------------
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h     |   25 -
>  .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  587 +++++----
>  .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.h  |    1 -
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |    8 +-
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.h  |    1 -
>  .../src/dml2_standalone_libraries/lib_float_math.c |    3 -
>  .../src/dml2_standalone_libraries/lib_float_math.h |    1 -
>  .../dml21/src/dml2_top/dml2_top_optimization.c     |    1 -
>  .../dml21/src/dml2_top/dml2_top_optimization.h     |    1 -
>  .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |   23 +-
>  .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.c    |   23 +-
>  .../dc/dml2/dml21/src/dml2_top/dml_top_mcache.h    |    1 -
>  .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.c |    1 -
>  .../amd/display/dc/dml2/dml21/src/inc/dml2_debug.h |    1 -
>  .../dml21/src/inc/dml2_internal_shared_types.h     |   27 +-
>  .../drm/amd/display/dc/dml2/dml2_internal_types.h  |    1 +
>  .../amd/display/dc/dml2/dml2_translation_helper.c  |   61 +-
>  .../amd/display/dc/dml2/dml2_translation_helper.h  |    2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |    8 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |    2 +-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |    1 +
>  .../drm/amd/display/dc/dpp/dcn10/dcn10_dpp_cm.c    |    3 -
>  .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.c   |   27 +-
>  .../gpu/drm/amd/display/dc/dpp/dcn35/dcn35_dpp.h   |    3 +
>  .../gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp.c |    3 +-
>  .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |   19 +-
>  .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |    2 +-
>  drivers/gpu/drm/amd/display/dc/dwb/Makefile        |    9 +
>  .../display/dc/{ => dwb}/dcn30/dcn30_cm_common.h   |    0
>  .../drm/amd/display/dc/{ => dwb}/dcn30/dcn30_dwb.c |    0
>  .../drm/amd/display/dc/{ => dwb}/dcn30/dcn30_dwb.h |    0
>  .../amd/display/dc/{ => dwb}/dcn30/dcn30_dwb_cm.c  |    0
>  .../gpu/drm/amd/display/dc/dwb/dcn35/dcn35_dwb.c   |    1 -
>  .../amd/display/dc/gpio/dcn401/hw_factory_dcn401.c |   16 +-
>  drivers/gpu/drm/amd/display/dc/hpo/Makefile        |   15 +
>  .../dc/{ => hpo}/dcn31/dcn31_hpo_dp_link_encoder.c |    0
>  .../dc/{ => hpo}/dcn31/dcn31_hpo_dp_link_encoder.h |    0
>  .../{ => hpo}/dcn31/dcn31_hpo_dp_stream_encoder.c  |    0
>  .../{ => hpo}/dcn31/dcn31_hpo_dp_stream_encoder.h  |    0
>  .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |  387 +++---
>  .../gpu/drm/amd/display/dc/hubp/dcn10/dcn10_hubp.c |    3 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.c |    3 +-
>  .../gpu/drm/amd/display/dc/hubp/dcn35/dcn35_hubp.c |    2 +-
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |    5 +-
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |   65 +-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   31 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn10/dcn10_init.c |    2 -
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |   54 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn20/dcn20_init.c |    1 -
>  .../drm/amd/display/dc/hwss/dcn201/dcn201_init.c   |    1 -
>  .../gpu/drm/amd/display/dc/hwss/dcn21/dcn21_init.c |    2 -
>  .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   21 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn30/dcn30_init.c |    1 -
>  .../drm/amd/display/dc/hwss/dcn301/dcn301_init.c   |    1 -
>  .../drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c    |    4 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn31/dcn31_init.c |    3 +-
>  .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.c  |   13 +-
>  .../drm/amd/display/dc/hwss/dcn314/dcn314_hwseq.h  |    2 +-
>  .../drm/amd/display/dc/hwss/dcn314/dcn314_init.c   |    3 +-
>  .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  108 +-
>  .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.h    |    6 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn32/dcn32_init.c |    3 +-
>  .../drm/amd/display/dc/hwss/dcn35/dcn35_hwseq.c    |   28 +-
>  .../gpu/drm/amd/display/dc/hwss/dcn35/dcn35_init.c |    3 +-
>  .../drm/amd/display/dc/hwss/dcn351/dcn351_init.c   |    4 +-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  235 +++-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |    3 +
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   10 +-
>  drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   19 +-
>  .../drm/amd/display/dc/hwss/hw_sequencer_private.h |    5 +-
>  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |    2 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/audio.h      |    2 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/clk_mgr.h    |    4 +-
>  .../drm/amd/display/dc/inc/hw/clk_mgr_internal.h   |    4 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dccg.h       |    5 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |    1 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hw_shared.h  |   13 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/mem_input.h  |    2 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/optc.h       |    5 +-
>  .../gpu/drm/amd/display/dc/inc/hw/stream_encoder.h |    2 +
>  .../drm/amd/display/dc/inc/hw/timing_generator.h   |    4 +-
>  drivers/gpu/drm/amd/display/dc/inc/hw/transform.h  |   10 -
>  drivers/gpu/drm/amd/display/dc/inc/resource.h      |    7 +
>  .../amd/display/dc/link/accessories/link_dp_cts.c  |   13 +-
>  .../drm/amd/display/dc/link/hwss/link_hwss_dio.c   |    5 +-
>  .../amd/display/dc/link/hwss/link_hwss_hpo_dp.c    |   12 +
>  .../gpu/drm/amd/display/dc/link/link_detection.c   |    8 +-
>  drivers/gpu/drm/amd/display/dc/link/link_dpms.c    |   45 +-
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c |    3 +-
>  .../display/dc/link/protocols/link_dp_capability.c |   69 +-
>  .../dc/link/protocols/link_edp_panel_control.c     |   14 +-
>  .../dc/link/protocols/link_edp_panel_control.h     |    2 +-
>  drivers/gpu/drm/amd/display/dc/mmhubbub/Makefile   |    9 +
>  .../dc/{ => mmhubbub}/dcn20/dcn20_mmhubbub.c       |    0
>  .../dc/{ => mmhubbub}/dcn20/dcn20_mmhubbub.h       |    0
>  drivers/gpu/drm/amd/display/dc/mpc/Makefile        |   27 +
>  .../drm/amd/display/dc/{ => mpc}/dcn10/dcn10_mpc.c |    0
>  .../drm/amd/display/dc/{ => mpc}/dcn10/dcn10_mpc.h |    0
>  .../drm/amd/display/dc/{ => mpc}/dcn20/dcn20_mpc.c |    0
>  .../drm/amd/display/dc/{ => mpc}/dcn20/dcn20_mpc.h |    0
>  .../drm/amd/display/dc/{ => mpc}/dcn30/dcn30_mpc.c |    2 +-
>  .../drm/amd/display/dc/{ => mpc}/dcn30/dcn30_mpc.h |    0
>  drivers/gpu/drm/amd/display/dc/opp/Makefile        |   16 +
>  .../drm/amd/display/dc/{ => opp}/dcn10/dcn10_opp.c |    0
>  .../drm/amd/display/dc/{ => opp}/dcn10/dcn10_opp.h |    0
>  .../drm/amd/display/dc/{ => opp}/dcn20/dcn20_opp.c |    0
>  .../drm/amd/display/dc/{ => opp}/dcn20/dcn20_opp.h |    0
>  .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.c |   10 +-
>  .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |    7 +-
>  .../gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c |    8 +-
>  .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   36 +-
>  .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |    6 +-
>  drivers/gpu/drm/amd/display/dc/resource/Makefile   |    2 -
>  .../display/dc/resource/dce110/dce110_resource.c   |    1 +
>  .../display/dc/resource/dce112/dce112_resource.c   |    5 +-
>  .../amd/display/dc/resource/dcn20/dcn20_resource.c |    3 +-
>  .../display/dc/resource/dcn201/dcn201_resource.c   |    4 +-
>  .../amd/display/dc/resource/dcn21/dcn21_resource.c |    3 +-
>  .../amd/display/dc/resource/dcn31/dcn31_resource.c |    1 +
>  .../amd/display/dc/resource/dcn32/dcn32_resource.c |   11 +-
>  .../amd/display/dc/resource/dcn32/dcn32_resource.h |    5 +
>  .../dc/resource/dcn32/dcn32_resource_helpers.c     |   14 +-
>  .../display/dc/resource/dcn321/dcn321_resource.c   |    4 +
>  .../amd/display/dc/resource/dcn35/dcn35_resource.c |    2 +
>  .../display/dc/resource/dcn401/dcn401_resource.c   |    5 +-
>  .../display/dc/resource/dcn401/dcn401_resource.h   |    7 +-
>  drivers/gpu/drm/amd/display/dc/spl/Makefile        |    2 +-
>  drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   16 +-
>  drivers/gpu/drm/amd/display/dc/spl/dc_spl.h        |    8 -
>  .../drm/amd/display/dc/spl/dc_spl_isharp_filters.c |    1 -
>  .../drm/amd/display/dc/spl/dc_spl_scl_filters.c    |    1 -
>  .../amd/display/dc/spl/dc_spl_scl_filters_old.c    |   25 +
>  drivers/gpu/drm/amd/display/dc/spl/dc_spl_types.h  |   44 +-
>  drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h  |   77 ++
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |    3 +
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   12 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn31.c  |    4 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn32.c  |    4 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |    4 +
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn401.c |    4 +
>  drivers/gpu/drm/amd/display/include/fixed31_32.h   |    6 +
>  drivers/gpu/drm/amd/display/include/logger_types.h |    1 +
>  .../drm/amd/display/modules/hdcp/hdcp1_execution.c |   18 +-
>  .../drm/amd/include/asic_reg/df/df_4_15_offset.h   |   28 +
>  .../drm/amd/include/asic_reg/df/df_4_15_sh_mask.h  |   28 +
>  .../drm/amd/include/asic_reg/uvd/uvd_4_0_sh_mask.h |    2 -
>  drivers/gpu/drm/amd/include/discovery.h            |   42 +
>  drivers/gpu/drm/amd/include/kgd_kfd_interface.h    |    6 +
>  drivers/gpu/drm/amd/include/kgd_pp_interface.h     |    1 +
>  drivers/gpu/drm/amd/include/mes_v11_api_def.h      |    3 +
>  drivers/gpu/drm/amd/include/mes_v12_api_def.h      |   10 +-
>  drivers/gpu/drm/amd/pm/amdgpu_dpm.c                |    9 +-
>  .../drm/amd/pm/powerplay/hwmgr/processpptables.c   |    2 +
>  .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c  |    4 +-
>  .../amd/pm/swsmu/inc/pmfw_if/smu_v14_0_2_ppsmc.h   |   18 +-
>  .../gpu/drm/amd/pm/swsmu/inc/smu_v14_0_2_pptable.h |   52 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu11/navi10_ppt.c    |    4 +-
>  .../drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c    |    4 +-
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_6_ppt.c   |    7 +-
>  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |   11 +-
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  978 +++++++++++++-
>  drivers/gpu/drm/drm_buddy.c                        |   25 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c         |    2 +-
>  drivers/gpu/drm/radeon/cik.c                       |   14 +-
>  drivers/gpu/drm/radeon/dce6_afmt.c                 |    2 +-
>  drivers/gpu/drm/radeon/evergreen.c                 |   12 +-
>  drivers/gpu/drm/radeon/evergreen_cs.c              |   62 +-
>  drivers/gpu/drm/radeon/ni.c                        |    2 +-
>  drivers/gpu/drm/radeon/r100.c                      |   94 +-
>  drivers/gpu/drm/radeon/r300.c                      |    6 +-
>  drivers/gpu/drm/radeon/r420.c                      |    6 +-
>  drivers/gpu/drm/radeon/r520.c                      |    2 +-
>  drivers/gpu/drm/radeon/r600.c                      |   12 +-
>  drivers/gpu/drm/radeon/r600_cs.c                   |    2 +-
>  drivers/gpu/drm/radeon/r600_dpm.c                  |    4 +-
>  drivers/gpu/drm/radeon/r600_hdmi.c                 |    2 +-
>  drivers/gpu/drm/radeon/radeon.h                    |    7 +-
>  drivers/gpu/drm/radeon/radeon_acpi.c               |   10 +-
>  drivers/gpu/drm/radeon/radeon_agp.c                |    2 +-
>  drivers/gpu/drm/radeon/radeon_atombios.c           |   40 +-
>  drivers/gpu/drm/radeon/radeon_audio.c              |    4 +-
>  drivers/gpu/drm/radeon/radeon_combios.c            |   38 +-
>  drivers/gpu/drm/radeon/radeon_connectors.c         |    7 +-
>  drivers/gpu/drm/radeon/radeon_device.c             |   13 +-
>  drivers/gpu/drm/radeon/radeon_display.c            |   76 +-
>  drivers/gpu/drm/radeon/radeon_drv.c                |   27 +-
>  drivers/gpu/drm/radeon/radeon_fbdev.c              |   26 +-
>  drivers/gpu/drm/radeon/radeon_fence.c              |    8 +-
>  drivers/gpu/drm/radeon/radeon_gem.c                |    4 +-
>  drivers/gpu/drm/radeon/radeon_i2c.c                |    2 +-
>  drivers/gpu/drm/radeon/radeon_ib.c                 |    2 +-
>  drivers/gpu/drm/radeon/radeon_irq_kms.c            |   12 +-
>  drivers/gpu/drm/radeon/radeon_kms.c                |    8 +-
>  drivers/gpu/drm/radeon/radeon_mode.h               |    4 +-
>  drivers/gpu/drm/radeon/radeon_object.c             |    9 +-
>  drivers/gpu/drm/radeon/radeon_pm.c                 |   20 +-
>  drivers/gpu/drm/radeon/radeon_ring.c               |    2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c                |    6 +-
>  drivers/gpu/drm/radeon/rs400.c                     |    6 +-
>  drivers/gpu/drm/radeon/rs600.c                     |   14 +-
>  drivers/gpu/drm/radeon/rs690.c                     |    2 +-
>  drivers/gpu/drm/radeon/rv515.c                     |    4 +-
>  drivers/gpu/drm/radeon/rv770.c                     |    2 +-
>  drivers/gpu/drm/radeon/si.c                        |    4 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c               |    2 +-
>  include/drm/drm_buddy.h                            |    2 +
>  include/uapi/linux/kfd_ioctl.h                     |    6 +-
>  469 files changed, 14069 insertions(+), 5248 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_15.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/df_v4_15.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_0_cleaner_shader.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.asm
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3_cleaner_shader.h
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn303/Makefile
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn314/Makefile
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dcn401/Makefile
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn301/dcn301_dio_link_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn301/dcn301_dio_link_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn314/dcn314_dio_stream_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn314/dcn314_dio_stream_encoder.h (100%)
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.h
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.c
>  create mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_utils.h
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.c
>  delete mode 100644 drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4.h
>  rename drivers/gpu/drm/amd/display/dc/{ => dwb}/dcn30/dcn30_cm_common.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dwb}/dcn30/dcn30_dwb.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dwb}/dcn30/dcn30_dwb.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dwb}/dcn30/dcn30_dwb_cm.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => hpo}/dcn31/dcn31_hpo_dp_link_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => hpo}/dcn31/dcn31_hpo_dp_link_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => hpo}/dcn31/dcn31_hpo_dp_stream_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => hpo}/dcn31/dcn31_hpo_dp_stream_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mmhubbub}/dcn20/dcn20_mmhubbub.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mmhubbub}/dcn20/dcn20_mmhubbub.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn10/dcn10_mpc.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn10/dcn10_mpc.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn20/dcn20_mpc.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn20/dcn20_mpc.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn30/dcn30_mpc.c (99%)
>  rename drivers/gpu/drm/amd/display/dc/{ => mpc}/dcn30/dcn30_mpc.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => opp}/dcn10/dcn10_opp.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => opp}/dcn10/dcn10_opp.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => opp}/dcn20/dcn20_opp.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => opp}/dcn20/dcn20_opp.h (100%)
>  create mode 100644 drivers/gpu/drm/amd/display/dc/spl/dc_spl_scl_filters_old.c
>  create mode 100644 drivers/gpu/drm/amd/display/dc/spl/spl_os_types.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_15_offset.h
>  create mode 100644 drivers/gpu/drm/amd/include/asic_reg/df/df_4_15_sh_mask.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
