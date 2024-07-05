Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DF492864B
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48710E99E;
	Fri,  5 Jul 2024 10:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="QzdI8Kzg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF310E80F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:03:03 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ed5af6b214so2473751fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720173782; x=1720778582; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PYi/dPUjqzERsqEaILXwuBJdCc58IvoClY54Ae6Fp84=;
 b=QzdI8Kzg2zjlEShB6p/USQkdl0yx2X1uYTFrLZzOQhjDG1ObdvDTxMa83vpsnGQwH3
 8tx17gT03WHH1yIu/800q/wT/aKEOHVSqpyUW0wFSg/GGPKks0hT4jPuJgczFM0+oUR4
 CmxWrC5K/6W1FyFLJ3v3Gx1qV9TOOIJYwq178=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173782; x=1720778582;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PYi/dPUjqzERsqEaILXwuBJdCc58IvoClY54Ae6Fp84=;
 b=ZIY6gwZD8RawmYMqCEhQP0AsVYLFplfkuFgPDuJplL3FFlEanvQrYmgaFuHFhJrFZ3
 MMH2wghCQ7fcz0sJXYyEB1Uqkb2DcaKL9ULXApxaVGeOHFjvtH9LvPHdq4MTi1Tj/rX9
 L2kP0cRQ6JSlEzY5yBQCA7qsKyGlQ2PWL9SozIvzt4BUn1zHY3IYlOFBBxYV41tu8tJP
 flb0Cf3jmCMu0pSWH6Et7mSbpOJcwZ0XsC7zKFrk3AO4Y6mPX2bzTEZk/SLSDa2eqh1m
 P/EOAPaxGIYmzWrLp5wztcep1AazdNyRNpG7o0wAw5h8oCS5pykkx5Ds0aSx4BAZkfP0
 R2bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSoT24fQ9aSijgdmmShN9jo8XJhfh3ZkXWz6X4iwuGo2lWMrbYiuDTb4Hyb8ynlS4cRhM5023xVpu0gmXUIHqwXmDnqnhcBLP0v/sxu7bW
X-Gm-Message-State: AOJu0YwAb+IL7GRxCsOJ4lDiTPJQzIp5lLsV4nCnzup9v1UdBpaU5PuP
 gPg0L/L8L0MclX2oDDfbAlsdEziXA/0PG+XFsvCp1F87iZi60HrRKT7O8V1Sxss=
X-Google-Smtp-Source: AGHT+IHCMWK88BhkaHsOCeeacznd1b8XpgM+PIvsDvZB6BYVm0ZpxjCh6XtORjKGpKOcGUQiIq+Z6g==
X-Received: by 2002:a05:651c:210:b0:2ec:5467:375b with SMTP id
 38308e7fff4ca-2ee8ec7c37fmr26227461fa.0.1720173781588; 
 Fri, 05 Jul 2024 03:03:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4265476ce75sm8177445e9.1.2024.07.05.03.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:03:01 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:02:59 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: Re: [pull] amdgpu, radeon drm-next-6.11
Message-ID: <ZofE05llA6zhTZ2l@phenom.ffwll.local>
References: <20240703211314.2041893-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240703211314.2041893-1-alexander.deucher@amd.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Wed, Jul 03, 2024 at 05:13:13PM -0400, Alex Deucher wrote:
> Hi Dave, Sima,
> 
> More new stuff for 6.11.  There will be a few additional patches next
> week for new IPs that were added in this cycle just to get them tied off,
> but this should be it for general changes.
> 
> The following changes since commit 15eb8573ad72a97b8f70e3c88b9bef6ddc861f77:
> 
>   drm/amd: Don't initialize ISP hardware without FW (2024-06-27 17:34:40 -0400)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-07-03
> 
> for you to fetch changes up to 4ed6a3689caba239e6df18c60af9489001f481c3:
> 
>   drm/amdgpu/atomfirmware: silence UBSAN warning (2024-07-02 18:07:31 -0400)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> amd-drm-next-6.11-2024-07-03:
> 
> amdgpu:
> - Use vmalloc for dc_state
> - Replay fixes
> - Freesync fixes
> - DCN 4.0.1 fixes
> - DML fixes
> - DCC updates
> - Misc code cleanups and bug fixes
> - 8K display fixes
> - DCN 3.5 fixes
> - Restructure DIO code
> - DML1 fixes
> - DML2 fixes
> - GFX11 fix
> - GFX12 updates
> - GFX12 modifiers fixes
> - RAS fixes
> - IP dump fixes
> - Add some updated IP version checks
> _ Silence UBSAN warning
> 
> radeon:
> - GPUVM fix
> 
> ----------------------------------------------------------------
> Alex Deucher (2):
>       drm/amd/display: use vmalloc for struct dc_state
>       drm/amdgpu/atomfirmware: silence UBSAN warning
> 
> Alex Hung (3):
>       drm/amd/display: Fix possible overflow in integer multiplication
>       drm/amd/display: Check denominator pbn_div before used
>       drm/amd/display: Check denominator crb_pipes before used
> 
> Alvin Lee (1):
>       drm/amd/display: Account for cursor prefetch BW in DML1 mode support
> 
> Anthony Koo (1):
>       drm/amd/display: Add replay state entry to replay_state
> 
> Aric Cyr (1):
>       drm/amd/display: 3.2.291
> 
> Bhuvanachandra Pinninti (1):
>       drm/amd/display: Move dio files into dio folder
> 
> Dillon Varone (1):
>       drm/amd/display: Cleanup dce_get_dp_ref_freq_khz
> 
> Fangzhi Zuo (2):
>       drm/amd/display: Fix dmub timeout after fams2 enabled
>       drm/amd/display: Update efficiency bandwidth for dcn351
> 
> George Shen (2):
>       drm/amd/display: Fix divide by zero in CURSOR_DST_X_OFFSET calculation
>       drm/amd/display: Add ASIC cap to limit DCC surface width
> 
> Hawking Zhang (2):
>       drm/amdgpu: Correct register used to clear fault status
>       drm/amdgpu: Fix hbm stack id in boot error report
> 
> Jiapeng Chong (5):
>       drm/amd/display: Fix unsigned comparison with less than zero
>       drm/amd/display: Fix warning comparing pointer to 0
>       drm/amd/display: Fix warning comparing pointer to 0
>       drm/amd/display: Fix warning comparing pointer to 0
>       drm/amd/display: Fix warning comparing pointer to 0
> 
> Joshua Aberback (1):
>       drm/amd/display: Remove unnecessary error message
> 
> Li Ma (1):
>       drm/amd/pm: smu v14.0.4 reuse smu v14.0.0 dpmtable
> 
> Lijo Lazar (1):
>       drm/amdkfd: Use device based logging for errors
> 
> Marek Olšák (13):
>       drm/amdgpu: check for LINEAR_ALIGNED correctly in check_tiling_flags_gfx6
>       drm/amdgpu/gfx11: remove superfluous cache flags
>       drm/amdgpu/gfx12: remove superfluous cache flags
>       drm/amdgpu/gfx12: remove GDS leftovers
>       drm/amdgpu: remove AMD_FMT_MOD_GFX12_DCC_MAX_COMPRESSED_BLOCK_* definitions
>       drm/amdgpu/display: handle gfx12 in dm_check_cursor_fb
>       drm/amdgpu: don't use amdgpu_lookup_format_info on gfx12
>       drm/amdgpu: handle gfx12 in amdgpu_display_verify_sizes
>       drm/amdgpu/display: handle gfx12 in amdgpu_dm_plane_format_mod_supported
>       drm/amdgpu/display: set plane attributes for gfx12 correctly
>       drm/amdgpu/display: add all gfx12 modifiers
>       drm/amdgpu: add amdgpu_framebuffer::gfx12_dcc
>       drm/amdgpu: rewrite convert_tiling_flags_to_modifier_gfx12
> 
> Nevenko Stupar (1):
>       drm/amd/display: Adjust cursor visibility between MPC slices
> 
> Nicholas Kazlauskas (1):
>       drm/amd/display: Add debug option for disabling SLDO optimizations
> 
> Paul Hsieh (1):
>       drm/amd/display: un-block 8k with single dimm
> 
> Pierre-Eric Pelloux-Prayer (1):
>       drm/radeon: check bo_va->bo is non-NULL before using it
> 
> Roman Li (1):
>       drm/amd/display: Fix array-index-out-of-bounds in dml2/FCLKChangeSupport
> 
> Ryan Seto (1):
>       drm/amd/display: Add available bandwidth calculation for audio
> 
> Sherry Wang (1):
>       drm/amd/display: Skip unnecessary abm disable
> 
> Sung Joon Kim (1):
>       drm/amd/display: Choose HUBP unbounded request based on DML output
> 
> Sunil Khatri (2):
>       drm/amdgpu: fix out of bounds access in gfx10 during ip dump
>       drm/amdgpu: fix out of bounds access in gfx11 during ip dump
> 
> Teeger (1):
>       drm/amd/display: Revert Add workaround to restrict max frac urgent for DPM0
> 
> Tim Huang (21):
>       drm/amdgpu: initialize GC IP v11.5.2
>       drm/amdgpu: add GFXHUB IP v11.5.2 support
>       drm/amdgpu: add tmz support for GC IP v11.5.2
>       drm/amdgpu: add GC IP v11.5.2 soc21 support
>       drm/amdgpu: add GC IP v11.5.2 to GC 11.5.0 family
>       drm/amdkfd: add KFD support for GC IP v11.5.2
>       drm/amdgpu: add firmware for GC IP v11.5.2
>       drm/amdgpu: add SDMA IP v6.1.2 discovery support
>       drm/amdkfd: add KFD support for SDMA IP v6.1.2
>       drm/amdgpu: add firmware for SDMA IP v6.1.2
>       drm/amdgpu: add NBIO IP v7.11.3 discovery support
>       drm/amdgpu: Add NBIO IP v7.11.3 support
>       drm/amdgpu: add VPE IP v6.1.3 support
>       drm/amdgpu: add VPE IP v6.1.3 discovery support
>       drm/amdgpu: add firmware for VPE IP v6.1.3
>       drm/amdgpu: add PSP IP v14.0.4 support
>       drm/amdgpu: add PSP IP v14.0.4 discovery support
>       drm/amd/pm: add SMU IP v14.0.4 support
>       drm/amdgpu: add SMU IP v14.0.4 discovery support
>       drm/amdgpu: enable mode2 reset for SMU IP v14.0.4
>       drm/amdgpu: add firmware for PSP IP v14.0.4
> 
> Tom Chung (3):
>       drm/amd/display: Reset freesync config before update new state
>       drm/amd/display: Add refresh rate range check
>       drm/amd/display: Fix refresh rate range for some panel
> 
> Wenjing Liu (1):
>       drm/amd/display: fix a crash when clock source is reference for non otg master pipe
> 
> Xi (Alex) Liu (1):
>       drm/amd/display: replace CRTC disable function call
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  11 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  94 +++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c            |   1 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c             |   2 +
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  20 ++--
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  22 -----
>  drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c             |   2 +
>  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c             |   1 +
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c             |   2 +
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   2 +-
>  drivers/gpu/drm/amd/amdgpu/psp_v13_0.c             |   3 +
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c             |   1 +
>  drivers/gpu/drm/amd/amdgpu/soc21.c                 |  28 ++++++
>  drivers/gpu/drm/amd/amdgpu/vpe_v6_1.c              |   1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_crat.c              |   1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_device.c            |   7 ++
>  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c       |   3 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_kernel_queue.c      |  21 ++--
>  drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c       |   8 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_packet_manager.c    |  63 +++++++-----
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c           |  24 +++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  63 +++++++++++-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   4 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   6 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 108 +++++++++++++++------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |   2 +-
>  drivers/gpu/drm/amd/display/dc/basics/dce_calcs.c  |   2 +-
>  .../amd/display/dc/clk_mgr/dce100/dce_clk_mgr.c    |   2 +-
>  .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |   2 +-
>  .../amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c   |   4 +-
>  .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  38 ++++----
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c  |   8 +-
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |   6 +-
>  drivers/gpu/drm/amd/display/dc/dc.h                |   4 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_audio.c     |   5 +-
>  .../gpu/drm/amd/display/dc/dce/dce_clock_source.c  |   8 +-
>  .../gpu/drm/amd/display/dc/dce/dce_panel_cntl.c    |   2 +-
>  drivers/gpu/drm/amd/display/dc/dcn10/Makefile      |   1 -
>  drivers/gpu/drm/amd/display/dc/dcn20/Makefile      |   1 -
>  drivers/gpu/drm/amd/display/dc/dcn30/Makefile      |   2 -
>  drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |   2 +-
>  drivers/gpu/drm/amd/display/dc/dio/Makefile        |  36 +++++++
>  .../dc/{ => dio}/dcn10/dcn10_link_encoder.c        |   0
>  .../dc/{ => dio}/dcn10/dcn10_link_encoder.h        |   0
>  .../dc/{ => dio}/dcn10/dcn10_stream_encoder.c      |   0
>  .../dc/{ => dio}/dcn10/dcn10_stream_encoder.h      |   0
>  .../dc/{ => dio}/dcn20/dcn20_link_encoder.c        |   0
>  .../dc/{ => dio}/dcn20/dcn20_link_encoder.h        |   0
>  .../dc/{ => dio}/dcn20/dcn20_stream_encoder.c      |   0
>  .../dc/{ => dio}/dcn20/dcn20_stream_encoder.h      |   0
>  .../dc/{ => dio}/dcn30/dcn30_dio_link_encoder.c    |   0
>  .../dc/{ => dio}/dcn30/dcn30_dio_link_encoder.h    |   0
>  .../dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.c  |   0
>  .../dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.h  |   0
>  .../dc/{ => dio}/dcn31/dcn31_dio_link_encoder.c    |   0
>  .../dc/{ => dio}/dcn31/dcn31_dio_link_encoder.h    |   0
>  .../gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c   |   2 +-
>  .../amd/display/dc/dml/dcn32/display_mode_vba_32.c |   3 +
>  .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |  22 +++--
>  .../dml2/dml21/src/dml2_core/dml2_core_factory.c   |   2 +-
>  .../dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c   |   2 +-
>  .../dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c  |   2 +-
>  .../dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c  |   2 +-
>  .../amd/display/dc/dml2/dml2_translation_helper.c  |   1 +
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_utils.c   |  14 +--
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  15 ---
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   2 -
>  .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   |   6 ++
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  15 ++-
>  .../drm/amd/display/dc/hwss/dce110/dce110_hwseq.c  |  62 +++++++++++-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |   2 +-
>  .../drm/amd/display/dc/hwss/dcn21/dcn21_hwseq.c    |   6 ++
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  |  47 +++++++--
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   1 +
>  .../dc/link/protocols/link_edp_panel_control.c     |   2 +-
>  .../display/dc/resource/dcn314/dcn314_resource.c   |  22 -----
>  .../display/dc/resource/dcn315/dcn315_resource.c   |   2 +-
>  .../amd/display/dc/resource/dcn35/dcn35_resource.c |   2 -
>  .../display/dc/resource/dcn401/dcn401_resource.c   |   3 +
>  drivers/gpu/drm/amd/display/dc/spl/dc_spl.c        |   8 +-
>  drivers/gpu/drm/amd/display/dmub/dmub_srv.h        |   1 +
>  drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |   5 +-
>  drivers/gpu/drm/amd/display/dmub/src/dmub_dcn35.c  |   1 +
>  .../drm/amd/display/modules/freesync/freesync.c    |   2 +-
>  drivers/gpu/drm/amd/include/atomfirmware.h         |   2 +-
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   1 +
>  drivers/gpu/drm/amd/pm/swsmu/smu14/smu_v14_0.c     |  20 ++--
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_0_ppt.c   |  30 +++---
>  drivers/gpu/drm/radeon/radeon_gem.c                |   2 +-
>  include/uapi/drm/drm_fourcc.h                      |   5 +-
>  94 files changed, 624 insertions(+), 318 deletions(-)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_link_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_link_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_stream_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn10/dcn10_stream_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_link_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_link_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_stream_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn20/dcn20_stream_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_link_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_link_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn30/dcn30_dio_stream_encoder.h (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn31/dcn31_dio_link_encoder.c (100%)
>  rename drivers/gpu/drm/amd/display/dc/{ => dio}/dcn31/dcn31_dio_link_encoder.h (100%)

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
