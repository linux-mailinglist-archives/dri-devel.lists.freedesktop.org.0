Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597F928646
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 12:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A0E10E975;
	Fri,  5 Jul 2024 10:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="JQiYutZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B12010E80F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 10:01:04 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4265267db01so342575e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2024 03:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720173663; x=1720778463; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uDQJtFfawnDlCAuh+FieIh0di17S7Eb8VSVeIjR1Qzk=;
 b=JQiYutZRJhHW/ZKHGPfj1+0yn8tpIvh5YJxcoESKqZUTm+Vr0Muk+PruCculhQB7la
 H5V+Usij52s9yn4EyxHY9Lc7N75JT7FWr/sAVSjQFRL5uxs/3kbx2sZyPKTW6WiFzfj1
 8Rc9u3ITrEPrsg8u1FTYtwV4AN6LC6Jb4XcMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720173663; x=1720778463;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDQJtFfawnDlCAuh+FieIh0di17S7Eb8VSVeIjR1Qzk=;
 b=i5Jfc9VYJuQIcv+NRqUIoA1WoNYPfCVBWob3mVbkRfIiGcDM+43jFlLnPOXv8aWqm9
 fRMBoKfMh4ePFUOZARfRdDDdQF5ZDtKP2/hvepwebCdFXTwnEhfHlTeshBExORxeiWXx
 GGC3Ptjoamcl0nD8I+/N2GwoPReLz4LLc5rSUMWA95vNjjnAkmeJpkn4Dy0gVa309SbH
 r2mxEv4h+uFyya2ohySMGO5JpQg1uaP8iLgLpNmb5LxLyn+ppBt+jIzq4VRlgH1f6Nw2
 l9CBWBXKtjLt60mvsOvIggywSYnSNa5WTXLFP/b0yKrVkvEHa+0UOm3arCXjBba5wHfX
 BclA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhahZA6KaHElg1bFfyoI+fkI0D6aIE/tT8EzYmHa6T3rEP9R4cqY5GitMJRhli79OXaSW1YMzL3zHkN+by2KGuKWvyWGhWUg09HmuU1UbX
X-Gm-Message-State: AOJu0Yzqa/qPn8K6yfpfzg56h47xWzaNgv+kIBtOzZ5YojDEw8p78Xzo
 2QybfyK4BsxtYG9pHTUfWfsIt044AjKZei191VDJWrGiDsx9hGLjTqpSUta07sA=
X-Google-Smtp-Source: AGHT+IHVDBDQjSu/jtVBhUg0MMX8DwG8XZBuSaob/bi4J6bvGssWyW5R8iOuW4cW7ljmxt+IWDsFfg==
X-Received: by 2002:a05:600c:3ba4:b0:424:a74b:32d3 with SMTP id
 5b1f17b1804b1-4264a35314dmr30840725e9.0.1720173662491; 
 Fri, 05 Jul 2024 03:01:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4264a2fcac1sm55026545e9.48.2024.07.05.03.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 03:01:02 -0700 (PDT)
Date: Fri, 5 Jul 2024 12:00:59 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel.vetter@ffwll.ch
Subject: Re: [pull] amdgpu, amdkfd drm-next-6.11
Message-ID: <ZofEWz0aZkR3cH64@phenom.ffwll.local>
References: <20240628213135.427214-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628213135.427214-1-alexander.deucher@amd.com>
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

On Fri, Jun 28, 2024 at 05:31:35PM -0400, Alex Deucher wrote:
> Hi Dave, Sima,
> 
> More stuff for 6.11.
> 
> The following changes since commit a78313bb206e0c456a989f380c4cbd8af8af7c76:
> 
>   Merge tag 'drm-intel-gt-next-2024-06-12' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-next (2024-06-27 17:21:44 +1000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-next-6.11-2024-06-28
> 
> for you to fetch changes up to 15eb8573ad72a97b8f70e3c88b9bef6ddc861f77:
> 
>   drm/amd: Don't initialize ISP hardware without FW (2024-06-27 17:34:40 -0400)

Pulled, thanks.
-Sima

> 
> ----------------------------------------------------------------
> amd-drm-next-6.11-2024-06-28:
> 
> amdgpu:
> - JPEG 5.x fixes
> - More FW loading cleanups
> - Misc code cleanups
> - GC 12.x fixes
> - ASPM fix
> - DCN 4.0.1 updates
> - SR-IOV fixes
> - HDCP fix
> - USB4 fixes
> - Silence UBSAN warnings
> - MES submission fixes
> - Update documentation for new products
> - DCC updates
> - Initial ISP 4.x plumbing
> - RAS fixes
> - Misc small fixes
> 
> amdkfd:
> - Fix missing unlock in error path for adding queues
> 
> ----------------------------------------------------------------
> Alex Deucher (3):
>       drm/amdgpu/atomfirmware: fix parsing of vram_info
>       drm/amd/display: Fix Makefile copyright notices
>       drm/amdgpu: fix Kconfig for ISP v2
> 
> Alex Hung (12):
>       drm/amd/display: Remove redundant checks for pipe_ctx->stream
>       drm/amd/display: Run DC_LOG_DC after checking link->link_enc
>       drm/amd/display: Fix uninitialized variables in dcn401
>       drm/amd/display: Remove useless function call
>       drm/amd/display: Check and log for function error codes
>       drm/amd/display: Check and log for function error codes
>       drm/amd/display: Check HDCP returned status
>       drm/amd/display: Add null checks before accessing struct elements
>       drm/amd/display: Ensure curve to hw translation succeed
>       drm/amd/display: Validate function returns
>       drm/amd/display: Remove always true condition
>       drm/amd/display: Remove duplicate null check
> 
> Alvin Lee (2):
>       drm/amd/display: Program CURSOR_DST_X_OFFSET in viewport space
>       drm/amd/display: Wait for double buffer update on ODM changes
> 
> Aric Cyr (1):
>       drm/amd/display: 3.2.290
> 
> Aurabindo Pillai (5):
>       drm/amd/display: Use sw cursor for DCN401 with rotation
>       drm/amd: Add reg definitions for DCN401 DCC
>       drm/amd/display: Enable DCC on DCN401
>       drm/amd: Add some missing register definitions
>       drm/amd/display: Fix null pointer deref in dcn20_resource.c
> 
> Bob Zhou (1):
>       drm/amdgpu: add missing error handling in function amdgpu_gmc_flush_gpu_tlb_pasid
> 
> Dan Carpenter (2):
>       drm/amd/display: Clean up indenting in dm_dp_mst_is_port_support_mode()
>       drm/amdgpu/kfd: Add unlock() on error path to add_queue_mes()
> 
> Daniel Sa (1):
>       drm/amd/display: Fix reduced resolution and refresh rate
> 
> Danijel Slivka (1):
>       drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts
> 
> Dillon Varone (1):
>       drm/amd/display: Make DML2.1 P-State method force per stream
> 
> Duncan Ma (1):
>       drm/amd/display: Reset DSC memory status
> 
> Frank Min (3):
>       drm/amdgpu: update MTYPE mapping for gfx12
>       drm/amdgpu: access ltr through pci cfg space
>       drm/amdgpu: tolerate allocating GTT bo with dcc flag
> 
> George Shen (1):
>       drm/amd/display: Call dpmm when checking mode support
> 
> Hawking Zhang (2):
>       drm/amdgpu: Fix register access violation
>       drm/amdgpu: Fix smatch static checker warning
> 
> Ivan Lipski (2):
>       drm/amd/display: Remove redundant var from display_rq_dig_calc in dml
>       drm/amd/display: Remove unnecessary variable
> 
> Jane Jian (1):
>       drm/amdgpu: normalize registers as local xcc to read/write in gfx_v9_4_3
> 
> Jiapeng Chong (4):
>       drm/amd/display: Remove redundant code and semicolons
>       drm/amd/display: Use ARRAY_SIZE for array length
>       drm/amd/display: Remove unused function reverse_planes_order
>       drm/amd/display: use swap() in is_config_schedulable()
> 
> Joan Lee (1):
>       drm/amd/display: Add Replay general cmd
> 
> Julia Zhang (1):
>       drm/amdgpu: avoid using null object of framebuffer
> 
> Kenneth Feng (2):
>       Revert "drm/amd/pm: workaround to pass jpeg unit test"
>       Revert "drm/amd/amdgpu: add module parameter for jpeg"
> 
> Leo (Hanghong) Ma (1):
>       drm/amd/display: Always enable HPO for DCN4 dGPU
> 
> Lijo Lazar (2):
>       drm/amdgpu: Fix pci state save during mode-1 reset
>       drm/amdgpu: Don't show false warning for reg list
> 
> Ma Ke (1):
>       drm/amd/display: Add null check before access structs
> 
> Mario Limonciello (3):
>       Documentation/amdgpu: Add Ryzen AI 300 series processors
>       Documentation/amdgpu: Add Ryzen 9000 series processors
>       drm/amd: Don't initialize ISP hardware without FW
> 
> Michael Strauss (1):
>       drm/amd/display: Send DP_TOTAL_LTTPR_CNT during detection if LTTPR is present
> 
> Nevenko Stupar (3):
>       drm/amd/display: Fix cursor issues with ODMs and HW rotations
>       drm/amd/display: Fix cursor size issues
>       drm/amd/display: Fix cursor issues with ODMs and magnification
> 
> Nicholas Susanto (1):
>       drm/amd/display: Temporarily disable HPO PG on DCN35
> 
> Pierre-Eric Pelloux-Prayer (1):
>       amdgpu: don't dereference a NULL resource in sysfs code
> 
> Pratap Nirujogi (8):
>       drm/amd/amdgpu: Add ISP support to amdgpu_discovery
>       drm/amd/amdgpu: Add ISP driver support
>       drm/amd/amdgpu: Enable ISP in amdgpu_discovery
>       drm/amd/amdgpu: Map ISP interrupts as generic IRQs
>       drm/amd/amdgpu: Add ISP4.1.0 and ISP4.1.1 modules
>       drm/amd/amdgpu: Disable MMHUB prefetch for ISP v4.1.1
>       drm/amd/amdgpu: Fix 'snprintf' output truncation warning
>       drm/amd/amdgpu: Enable MMHUB prefetch for ISP v4.1.0 and 4.1.1
> 
> Relja Vojvodic (2):
>       drm/amd/display: Refactor dccg401_get_other_enable_symclk_fe
>       drm/amd/display: Fix 1DLUT setting for NL SDR blending
> 
> Roman Li (1):
>       drm/amd/display: Use periodic detection for ipx/headless
> 
> Ryan Seto (2):
>       drm/amd/display: Add HW cursor visual confirm
>       drm/amd/display: Adjust reg field for DSC wait for disconnect
> 
> Sonny Jiang (2):
>       drm/amdgpu/jpeg5: reprogram doorbell setting after power up for each playback
>       drm/amdgpu/jpeg5: Add support for DPG mode
> 
> Sung-huai Wang (1):
>       drm/amd/display: Add workaround to restrict max frac urgent for DPM0
> 
> TungYu Lu (1):
>       drm/amd/display: resync OTG after DIO FIFO resync
> 
> Vignesh Chander (2):
>       drm/amdgpu: Use dev_ prints for virtualization as it supports multi adapter
>       drm/amdgpu: process RAS fatal error MB notification
> 
> Wenjing Liu (1):
>       drm/amd/display: Remove a redundant check in authenticated_dp
> 
> Yang Wang (3):
>       drm/amdgpu: refine gfx11 firmware loading
>       drm/amdgpu: refine gfx12 firmware loading
>       drm/amdgpu: refine isp firmware loading
> 
> YiPeng Chai (4):
>       drm/amdgpu: add variable to record the deferred error number read by driver
>       drm/amdgpu: refine poison creation interrupt handler
>       drm/amdgpu: refine poison consumption interrupt handler
>       drm/amdgpu: add gpu reset check and exception handling
> 
>  Documentation/gpu/amdgpu/apu-asic-info-table.csv   |   2 +
>  drivers/gpu/drm/amd/amdgpu/Kconfig                 |  11 +
>  drivers/gpu/drm/amd/amdgpu/Makefile                |   8 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h                |  11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_atomfirmware.c   |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  16 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c      |  33 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c            |   4 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c            |   5 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c            |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |   3 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c            | 210 ++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h            |  60 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.h           |  31 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c         |  63 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c            |  28 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c            | 197 +++++++++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h            |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c          |   5 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h          |   1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_umc.c            |  11 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c           |  25 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h           |   4 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  18 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c             |  34 ++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c             |  22 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_4_3.c            |  33 +++
>  drivers/gpu/drm/amd/amdgpu/gfxhub_v1_2.c           |   8 +-
>  drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c             |   4 -
>  drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c              |   3 +-
>  drivers/gpu/drm/amd/amdgpu/ih_v6_0.c               |  28 +++
>  drivers/gpu/drm/amd/amdgpu/ih_v6_1.c               |   6 +
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c            | 137 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h            |  39 +++
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c            | 137 ++++++++++
>  drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h            |  39 +++
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c           | 165 ++++++++++--
>  drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.h           |   6 +
>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c            |   8 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c              |  27 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_ai.h              |   4 +-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c              |  31 ++-
>  drivers/gpu/drm/amd/amdgpu/mxgpu_nv.h              |   5 +-
>  drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c           |  14 +-
>  drivers/gpu/drm/amd/amdgpu/psp_gfx_if.h            |   5 +-
>  drivers/gpu/drm/amd/amdgpu/soc24.c                 |   1 +
>  drivers/gpu/drm/amd/amdgpu/umc_v12_0.c             |   4 +-
>  .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c  |   1 +
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  48 ++--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |   3 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c |  48 +++-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c  |   5 +-
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |   5 +-
>  .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    |   4 +-
>  .../gpu/drm/amd/display/dc/bios/command_table2.c   |   3 +-
>  .../amd/display/dc/clk_mgr/dcn201/dcn201_clk_mgr.c |   2 -
>  .../amd/display/dc/clk_mgr/dcn32/dcn32_clk_mgr.c   |  10 +-
>  .../amd/display/dc/clk_mgr/dcn401/dcn401_clk_mgr.c |  10 +-
>  drivers/gpu/drm/amd/display/dc/core/dc.c           |  12 +
>  .../gpu/drm/amd/display/dc/core/dc_hw_sequencer.c  |  11 +
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c    |  29 +++
>  drivers/gpu/drm/amd/display/dc/dc.h                |   9 +-
>  drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c       |   7 +-
>  drivers/gpu/drm/amd/display/dc/dc_types.h          |   1 +
>  .../drm/amd/display/dc/dccg/dcn401/dcn401_dccg.c   |  57 ++---
>  .../gpu/drm/amd/display/dc/dce/dce_link_encoder.c  |   5 +-
>  drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c   |  18 +-
>  .../drm/amd/display/dc/dcn10/dcn10_link_encoder.c  |   8 +-
>  drivers/gpu/drm/amd/display/dc/dcn301/Makefile     |  11 +-
>  drivers/gpu/drm/amd/display/dc/dcn31/Makefile      |  10 +-
>  drivers/gpu/drm/amd/display/dc/dcn314/Makefile     |  11 +-
>  drivers/gpu/drm/amd/display/dc/dcn401/Makefile     |   5 +-
>  .../gpu/drm/amd/display/dc/dml/dcn20/dcn20_fpu.c   |   2 +-
>  .../display/dc/dml/dcn20/display_rq_dlg_calc_20.c  |  14 +-
>  .../dc/dml/dcn20/display_rq_dlg_calc_20v2.c        |  14 +-
>  .../display/dc/dml/dcn21/display_rq_dlg_calc_21.c  |  14 +-
>  .../display/dc/dml/dcn30/display_rq_dlg_calc_30.c  |  14 +-
>  .../display/dc/dml/dcn31/display_rq_dlg_calc_31.c  |  14 +-
>  .../dc/dml/dcn314/display_rq_dlg_calc_314.c        |  14 +-
>  .../dc/dml2/dml21/dml21_translation_helper.c       |   2 +-
>  .../drm/amd/display/dc/dml2/dml21/dml21_wrapper.c  |   4 +-
>  .../dml21/src/dml2_core/dml2_core_dcn4_calcs.c     |   4 +-
>  .../dc/dml2/dml21/src/dml2_core/dml2_core_shared.c |  46 ++--
>  .../dml2/dml21/src/dml2_pmo/dml2_pmo_dcn4_fams2.c  |  11 +-
>  .../display/dc/dml2/dml21/src/dml2_top/dml_top.c   |  17 ++
>  .../dml21/src/inc/dml2_internal_shared_types.h     |   1 +
>  .../drm/amd/display/dc/dml2/dml2_mall_phantom.c    |   2 +
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.c |  29 ++-
>  drivers/gpu/drm/amd/display/dc/dml2/dml2_wrapper.h |   6 +-
>  .../drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c  |  50 ----
>  .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.c   |  24 +-
>  .../gpu/drm/amd/display/dc/dsc/dcn20/dcn20_dsc.h   |  13 +-
>  .../gpu/drm/amd/display/dc/dsc/dcn35/dcn35_dsc.c   |  58 ++++-
>  .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.c |   2 +-
>  .../gpu/drm/amd/display/dc/dsc/dcn401/dcn401_dsc.h |   3 +-
>  .../drm/amd/display/dc/hubbub/dcn20/dcn20_hubbub.c |   3 +-
>  .../drm/amd/display/dc/hubbub/dcn30/dcn30_hubbub.c |   3 +
>  .../drm/amd/display/dc/hubbub/dcn31/dcn31_hubbub.c |   3 +
>  .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.c   | 280 +++++++++++++++++++++
>  .../amd/display/dc/hubbub/dcn401/dcn401_hubbub.h   |   5 +
>  .../gpu/drm/amd/display/dc/hubp/dcn20/dcn20_hubp.h |  14 ++
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.c   |  71 +++---
>  .../drm/amd/display/dc/hubp/dcn401/dcn401_hubp.h   |  14 +-
>  .../drm/amd/display/dc/hwss/dcn10/dcn10_hwseq.c    |  17 --
>  .../drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c    |  34 ++-
>  .../drm/amd/display/dc/hwss/dcn30/dcn30_hwseq.c    |   5 +-
>  .../drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c    |  11 +-
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c  | 169 +++++--------
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.h  |   2 +
>  .../drm/amd/display/dc/hwss/dcn401/dcn401_init.c   |   2 +-
>  drivers/gpu/drm/amd/display/dc/hwss/hw_sequencer.h |   9 +
>  drivers/gpu/drm/amd/display/dc/inc/core_types.h    |   3 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dchubbub.h   |   4 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h       |   1 +
>  .../drm/amd/display/dc/inc/hw/timing_generator.h   |   1 +
>  .../amd/display/dc/link/accessories/link_dp_cts.c  |   2 +-
>  drivers/gpu/drm/amd/display/dc/link/link_factory.c |   6 +-
>  .../display/dc/link/protocols/link_dp_capability.c |  31 ++-
>  .../display/dc/link/protocols/link_dp_training.c   |   3 +-
>  .../gpu/drm/amd/display/dc/optc/dcn10/dcn10_optc.h |   3 +-
>  .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c |  13 +
>  .../gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.h |   2 +
>  .../drm/amd/display/dc/optc/dcn401/dcn401_optc.c   |   1 +
>  .../drm/amd/display/dc/optc/dcn401/dcn401_optc.h   |   1 +
>  .../amd/display/dc/resource/dcn20/dcn20_resource.c |   9 +-
>  .../amd/display/dc/resource/dcn35/dcn35_resource.c |   5 +-
>  .../display/dc/resource/dcn401/dcn401_resource.c   |   9 +
>  .../display/dc/resource/dcn401/dcn401_resource.h   |   2 +
>  drivers/gpu/drm/amd/display/include/dpcd_defs.h    |   5 +
>  .../drm/amd/display/modules/hdcp/hdcp1_execution.c |  24 +-
>  .../gpu/drm/amd/display/modules/hdcp/hdcp_ddc.c    |  12 +-
>  .../gpu/drm/amd/display/modules/hdcp/hdcp_psp.c    |   3 -
>  drivers/gpu/drm/amd/include/amd_shared.h           |   2 +
>  .../amd/include/asic_reg/dcn/dcn_4_1_0_offset.h    |  18 ++
>  .../amd/include/asic_reg/dcn/dcn_4_1_0_sh_mask.h   | 110 ++++++++
>  .../drm/amd/include/ivsrcid/isp/irqsrcs_isp_4_1.h  |  62 +++++
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c          |   3 +-
>  .../gpu/drm/amd/pm/swsmu/smu14/smu_v14_0_2_ppt.c   |  30 +--
>  138 files changed, 2467 insertions(+), 749 deletions(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_isp.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_0.h
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/isp_v4_1_1.h
>  create mode 100644 drivers/gpu/drm/amd/include/ivsrcid/isp/irqsrcs_isp_4_1.h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
