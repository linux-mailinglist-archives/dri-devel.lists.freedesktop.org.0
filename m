Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE4C92CD33
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 10:37:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877D610E68E;
	Wed, 10 Jul 2024 08:37:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="KxCTiBlu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F5810E6AB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 08:37:40 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4212b102935so7427005e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 01:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1720600659; x=1721205459; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0UYTy7791VpD93HF44CnAyMY65sI1wRnCQ6enS2B9N8=;
 b=KxCTiBlu7+bwDqIQ6LkoQUOQ/+qCc5c+5AyTD077uMBhFI+MJSmdxu25v29tfddmpv
 v+X/PoQwESjVtd0bP0SqnxNpiUeKgLDDexQ/rFPufuN9/tMeoLCsZXEszrcfL3VALQHr
 gHWA55nMLIBD5G8/J0pAuKQcef86hSVXRzigs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720600659; x=1721205459;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0UYTy7791VpD93HF44CnAyMY65sI1wRnCQ6enS2B9N8=;
 b=G2mbBGtDBG/VNdx0qqoE+i8gxLKLfAQvub/ymw6HplFvrf2qSUWNy/3uTaYlzgwUER
 IQu3L0NC9on3kMSucTwhV/lKxeS9EAOPwkYnkfdjAeoeMB8HWdc1+nPN3twGkNAWLvmZ
 rISTz086xWoXmxnz8bnt7Q3d/oybYj1/C6C+Toyef4tFEK8KCYMY2dXcmuMaJeljlHfu
 qb08l+C63f1l9fIjDrEjh665RKwj6mq8DKOIxQAP29ME9Bpbv5QP5w1tWVLTi1m0dz/s
 CaAoIqL9xBusJwe14NZTIbX0Tm3CzwY9CMlOVeB0HxutifxXJMegNpE8WZ3xfw8a+N9w
 2zwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5T66jEBLUJqVj3oyx+ZDRf8Ky0wt6s1v+7/XiQXDq27ywUzvXc0YAF5TLHdk8oJVk0X4KJTEaXDirVdBbaZE2+/z9G7/P8sejPU84Guuo
X-Gm-Message-State: AOJu0YwXmJuvtHyKV45uptvMz6mcJa5DR3le0IrYgy2nQim6V9Z++DLW
 oWnLVvkc4vfCBrOESpWh9ZSi63aUIkSFTdOeiL4N4bC3S+aH/d+3uzqOW7eGff4=
X-Google-Smtp-Source: AGHT+IGYFzqQ+nqRKk2mJhykuig+tHqK5R2qVD/ZmX8lMFX3rzVw6+TS9LaM1zSabgway2v49/Xarg==
X-Received: by 2002:a5d:5888:0:b0:35f:2584:76e9 with SMTP id
 ffacd0b85a97d-367cea451f2mr3155067f8f.2.1720600658471; 
 Wed, 10 Jul 2024 01:37:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab141sm4657740f8f.96.2024.07.10.01.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 01:37:37 -0700 (PDT)
Date: Wed, 10 Jul 2024 10:37:35 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-next
Message-ID: <Zo5ITzoxHtYNt_zv@phenom.ffwll.local>
References: <875xttazx2.fsf@intel.com>
 <Zo2dJlm2pUMyQq0y@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zo2dJlm2pUMyQq0y@intel.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Tue, Jul 09, 2024 at 04:27:18PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 28, 2024 at 05:46:01PM +0300, Jani Nikula wrote:
> > 
> > Hi Dave & Sima -
> > 
> > Another feature pull towards v6.11, hopefully last. This should also fix
> > the 32-bit build issue [1] seen in drm-next.
> 
> Sima, Dave,
> 
> I just noticed that we don't have this one yet in drm-next.
> 
> Anything missing or wrong with this PR?

Nothing, I just made a mess last week processing -next and then lost this
one.

Pulled into drm-next now, and thanks for the ping.
-Sima

> 
> Thanks,
> Rodrigo.
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > [1] https://lore.kernel.org/r/CAPM=9tyNGA2wEgnsKdSyjHRGVikywZLdueZj=syTMFYEUNzxhw@mail.gmail.com
> > 
> > 
> > drm-intel-next-2024-06-28:
> > drm/i915 feature pull #2 for v6.11:
> > 
> > Features and functionality:
> > - More eDP Panel Replay enabling (Jouni)
> > - Add async flip and flip done tracepoints (Ville)
> > 
> > Refactoring and cleanups:
> > - Clean up BDW+ pipe interrupt register definitions (Ville)
> > - Prep work for DSB based plane programming (Ville)
> > - Relocate encoder suspend/shutdown helpers (Imre)
> > - Polish plane surface alignment handling (Ville)
> > 
> > Fixes:
> > - Enable more fault interrupts on TGL+/MTL+ (Ville)
> > - Fix CMRR 32-bit build (Mitul)
> > - Fix PSR Selective Update Region Scan Line Capture Indication (Jouni)
> > - Fix cursor fb unpinning (Maarten, Ville)
> > - Fix Cx0 PHY PLL state verification in TBT mode (Imre)
> > - Fix unnecessary MG DP programming on MTL+ Type-C (Imre)
> > 
> > DRM changes:
> > - Rename drm_plane_check_pixel_format() to drm_plane_has_format() and export
> >   (Ville)
> > - Add drm_vblank_work_flush_all() (Maarten)
> > 
> > Xe driver changes:
> > - Call encoder .suspend_complete() hook also on Xe (Imre)
> > 
> > BR,
> > Jani.
> > 
> > The following changes since commit d754ed2821fd9675d203cb73c4afcd593e28b7d0:
> > 
> >   Merge drm/drm-next into drm-intel-next (2024-06-19 11:38:31 +0300)
> > 
> > are available in the Git repository at:
> > 
> >   https://gitlab.freedesktop.org/drm/i915/kernel.git tags/drm-intel-next-2024-06-28
> > 
> > for you to fetch changes up to 32a120f52a4c0121bca8f2328d4680d283693d60:
> > 
> >   drm/i915/mtl: Skip PLL state verification in TBT mode (2024-06-28 12:50:52 +0300)
> > 
> > ----------------------------------------------------------------
> > drm/i915 feature pull #2 for v6.11:
> > 
> > Features and functionality:
> > - More eDP Panel Replay enabling (Jouni)
> > - Add async flip and flip done tracepoints (Ville)
> > 
> > Refactoring and cleanups:
> > - Clean up BDW+ pipe interrupt register definitions (Ville)
> > - Prep work for DSB based plane programming (Ville)
> > - Relocate encoder suspend/shutdown helpers (Imre)
> > - Polish plane surface alignment handling (Ville)
> > 
> > Fixes:
> > - Enable more fault interrupts on TGL+/MTL+ (Ville)
> > - Fix CMRR 32-bit build (Mitul)
> > - Fix PSR Selective Update Region Scan Line Capture Indication (Jouni)
> > - Fix cursor fb unpinning (Maarten, Ville)
> > - Fix Cx0 PHY PLL state verification in TBT mode (Imre)
> > - Fix unnecessary MG DP programming on MTL+ Type-C (Imre)
> > 
> > DRM changes:
> > - Rename drm_plane_check_pixel_format() to drm_plane_has_format() and export
> >   (Ville)
> > - Add drm_vblank_work_flush_all() (Maarten)
> > 
> > Xe driver changes:
> > - Call encoder .suspend_complete() hook also on Xe (Imre)
> > 
> > ----------------------------------------------------------------
> > Imre Deak (5):
> >       drm/i915: Move encoder suspend/shutdown helpers to intel_encoder.c
> >       drm/i915: Pass intel_display to the encoder suspend/shutdown helpers
> >       drm/xe: Use the encoder suspend helper also used by the i915 driver
> >       drm/i915/display: For MTL+ platforms skip mg dp programming
> >       drm/i915/mtl: Skip PLL state verification in TBT mode
> > 
> > Jouni Högander (12):
> >       drm/i915/psr: Set DP_PSR_SU_REGION_SCANLINE_CAPTURE bit when needed
> >       drm/i915/psr: Check panel ALPM capability for eDP Panel Replay
> >       drm/i915/psr: Inform Panel Replay source support on eDP as well
> >       drm/i915/psr: enable sink for eDP1.5 Panel Replay
> >       drm/i915/psr: Check panel Early Transport capability for eDP PR
> >       drm/i915/psr: 128b/132b Panel Replay is not supported on eDP
> >       drm/i915/psr: HW will not allow PR on eDP when HDCP enabled
> >       drm/i915/alpm: Make crtc_state as const in intel_alpm_compute_params
> >       drm/i915/psr: Perform psr2 checks related to ALPM for Panel Replay
> >       drm/i915/psr: Perform scanline indication check for Panel Replay as well
> >       drm/i915/psr: Check Early Transport for Panel Replay as well
> >       drm/i915/psr: Modify dg2_activate_panel_replay to support eDP
> > 
> > Maarten Lankhorst (2):
> >       drm: Add drm_vblank_work_flush_all().
> >       drm/i915: Use the same vblank worker for atomic unpin
> > 
> > Mitul Golani (1):
> >       drm/i915/display: Consider adjusted_pixel_rate to be u64
> > 
> > Ville Syrjälä (28):
> >       drm/i915: Use REG_BIT() for bdw+ pipe interrupts
> >       drm/i915: Document bdw+ pipe interrupt bits
> >       drm/i915: Sort bdw+ pipe interrupt bits
> >       drm/i915: Extend GEN9_PIPE_PLANE_FLIP_DONE() to cover all universal planes
> >       drm/i915: Nuke the intermediate pipe fault bitmasks
> >       drm/i915: Enable pipeDMC fault interrupts on tgl+
> >       drm/i915: Enable plane/pipeDMC ATS fault interrupts on mtl
> >       drm/i915: Extract intel_crtc_arm_vblank_event()
> >       drm/i915: Add async flip tracepoint
> >       drm/i915: Add flip done tracepoint
> >       drm/i915: Introduce intel_mode_vdisplay()
> >       drm/i915: Pass the whole atomic state to intel_color_prepare_commit()
> >       drm/i915/dsb: Plumb the whole atomic state into intel_dsb_prepare()
> >       drm/i915/dsb: Convert the DSB code to use intel_display rather than i915
> >       drm/i915/dsb: Add i915.enable_dsb module parameter
> >       drm/i915: Drop useless intel_dsb.h include
> >       drm/i915/dsb: Document that the ATS fault bits are for mtl+
> >       drm: Rename drm_plane_check_pixel_format() to drm_plane_has_format()
> >       drm: Export drm_plane_has_format()
> >       drm/i915: Introduce the plane->min_alignment() vfunc
> >       drm/i915: Introduce fb->min_alignment
> >       drm/i915: Split cursor alignment to per-platform vfuncs
> >       drm/i915: Split pre-skl platforms out from intel_surf_alignment()
> >       drm/i915: Move intel_surf_alignment() into skl_univerals_plane.c
> >       drm/i915: Update plane alignment requirements for TGL+
> >       drm/i915: Nuke the TGL+ chroma plane tile row alignment stuff
> >       drm/i915: Use vblank worker to unpin old legacy cursor fb safely
> >       drm/i915/dsb: Try to document that DSB_STATUS bit 16 is level triggered
> > 
> >  drivers/gpu/drm/drm_atomic.c                       |   7 +-
> >  drivers/gpu/drm/drm_crtc.c                         |   6 +-
> >  drivers/gpu/drm/drm_crtc_internal.h                |   2 -
> >  drivers/gpu/drm/drm_plane.c                        |  32 ++--
> >  drivers/gpu/drm/drm_vblank_work.c                  |  22 +++
> >  drivers/gpu/drm/i915/display/i9xx_plane.c          |  75 +++++++++-
> >  drivers/gpu/drm/i915/display/intel_alpm.c          |   9 +-
> >  drivers/gpu/drm/i915/display/intel_alpm.h          |   2 +-
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.c  |  35 ++++-
> >  drivers/gpu/drm/i915/display/intel_atomic_plane.h  |   6 +
> >  drivers/gpu/drm/i915/display/intel_color.c         |  13 +-
> >  drivers/gpu/drm/i915/display/intel_color.h         |   3 +-
> >  drivers/gpu/drm/i915/display/intel_crtc.c          |  59 ++++++--
> >  drivers/gpu/drm/i915/display/intel_crtc.h          |   1 +
> >  drivers/gpu/drm/i915/display/intel_cursor.c        |  64 +++++++-
> >  drivers/gpu/drm/i915/display/intel_cursor.h        |   3 +
> >  drivers/gpu/drm/i915/display/intel_cx0_phy.c       |  11 +-
> >  drivers/gpu/drm/i915/display/intel_ddi.c           |  11 +-
> >  drivers/gpu/drm/i915/display/intel_display.c       |  15 +-
> >  drivers/gpu/drm/i915/display/intel_display_irq.c   |  50 ++++++-
> >  .../gpu/drm/i915/display/intel_display_params.c    |   3 +
> >  .../gpu/drm/i915/display/intel_display_params.h    |   1 +
> >  drivers/gpu/drm/i915/display/intel_display_trace.h |  50 +++++++
> >  drivers/gpu/drm/i915/display/intel_display_types.h |   8 +
> >  drivers/gpu/drm/i915/display/intel_dpll_mgr.h      |   1 +
> >  drivers/gpu/drm/i915/display/intel_dsb.c           |  66 ++++----
> >  drivers/gpu/drm/i915/display/intel_dsb.h           |   4 +-
> >  drivers/gpu/drm/i915/display/intel_dsb_regs.h      |   6 +-
> >  drivers/gpu/drm/i915/display/intel_encoder.c       |  44 ++++++
> >  drivers/gpu/drm/i915/display/intel_encoder.h       |   4 +
> >  drivers/gpu/drm/i915/display/intel_fb.c            | 151 ++++---------------
> >  drivers/gpu/drm/i915/display/intel_fb.h            |   3 -
> >  drivers/gpu/drm/i915/display/intel_fb_pin.c        |  39 +++--
> >  drivers/gpu/drm/i915/display/intel_fb_pin.h        |   3 +-
> >  drivers/gpu/drm/i915/display/intel_fbdev.c         |   5 +-
> >  drivers/gpu/drm/i915/display/intel_psr.c           | 166 +++++++++++++++++----
> >  drivers/gpu/drm/i915/display/intel_sprite.c        |  26 ++++
> >  drivers/gpu/drm/i915/display/intel_vblank.c        |  10 ++
> >  drivers/gpu/drm/i915/display/intel_vblank.h        |   1 +
> >  drivers/gpu/drm/i915/display/intel_vrr.c           |   2 +-
> >  drivers/gpu/drm/i915/display/skl_universal_plane.c |  85 ++++++++++-
> >  drivers/gpu/drm/i915/i915_driver.c                 |  51 +------
> >  drivers/gpu/drm/i915/i915_reg.h                    |  80 +++++-----
> >  drivers/gpu/drm/xe/display/xe_display.c            |  18 +--
> >  drivers/gpu/drm/xe/display/xe_fb_pin.c             |   3 +-
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c      |   4 +-
> >  include/drm/drm_plane.h                            |   2 +
> >  include/drm/drm_vblank_work.h                      |   2 +
> >  48 files changed, 873 insertions(+), 391 deletions(-)
> > 
> > -- 
> > Jani Nikula, Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
