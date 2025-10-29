Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5907AC19CAE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 11:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E4A10E792;
	Wed, 29 Oct 2025 10:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U09AO8d0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 578FD10E792;
 Wed, 29 Oct 2025 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761734405; x=1793270405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+1UBtFzZk2IbpnlUb+5KWcyNGfPbGulscGnzefkjoog=;
 b=U09AO8d0qcMdplRV2jftnf3lyLLfpF+7dxBVWxMdhewGZsvGRloKuBwa
 q8py6ncGKrMHIeJulfVhMOKuEmXY8M1MghadwSB75+TkJPoqU03mzso6k
 BP9ZYVdSBrDM/dBqz1jmgfa59oSBRwXW71VeOt7oFuJGOX8hV/REslUzu
 5cUnn5eXlFDinEHon+NcYQEh4maayKunqvMZDrAO44F+BhbTI/19mSihz
 OPNaRQrZ9DsFBJCT/maBsgbI7VcG+ggjmHKvD2QQaBedPVF9FWdamYh27
 p2qN9zwh02/HYgfwlATMmNUJ900UqTLRVzbMlqOVKug8H2XqnIPBUpv8v Q==;
X-CSE-ConnectionGUID: l/u3vaGmT/GuQbJXavkH7w==
X-CSE-MsgGUID: lYLfcSJpQtKv8woSXKRnpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63887251"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="63887251"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:40:05 -0700
X-CSE-ConnectionGUID: ndGLE7DoTPeEOMSjtkCUbQ==
X-CSE-MsgGUID: PZoincV3Sr6FairKrqL2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="209213294"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 03:39:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>,
 simona.vetter@ffwll.ch
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm: include drm_print.h where needed
Date: Wed, 29 Oct 2025 12:39:45 +0200
Message-ID: <5fe67395907be33eb5199ea6d540e29fddee71c8.1761734313.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761734313.git.jani.nikula@intel.com>
References: <cover.1761734313.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are a gazillion files that depend on drm_print.h being indirectly
included via drm_buddy.h, drm_mm.h, or ttm/ttm_resource.h. In
preparation for removing those includes, explicitly include drm_print.h
where needed.

Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/accel/amdxdna/amdxdna_gem.c                       | 1 +
 drivers/accel/ethosu/ethosu_job.c                         | 1 +
 drivers/accel/rocket/rocket_gem.c                         | 1 +
 drivers/gpu/drm/adp/adp_drv.c                             | 1 +
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c   | 1 +
 drivers/gpu/drm/arm/hdlcd_crtc.c                          | 1 +
 drivers/gpu/drm/arm/hdlcd_drv.c                           | 1 +
 drivers/gpu/drm/arm/malidp_drv.c                          | 1 +
 drivers/gpu/drm/arm/malidp_mw.c                           | 1 +
 drivers/gpu/drm/armada/armada_crtc.c                      | 1 +
 drivers/gpu/drm/armada/armada_debugfs.c                   | 1 +
 drivers/gpu/drm/armada/armada_fb.c                        | 1 +
 drivers/gpu/drm/armada/armada_fbdev.c                     | 1 +
 drivers/gpu/drm/armada/armada_gem.c                       | 1 +
 drivers/gpu/drm/armada/armada_overlay.c                   | 1 +
 drivers/gpu/drm/armada/armada_plane.c                     | 1 +
 drivers/gpu/drm/ast/ast_mode.c                            | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c              | 1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c           | 1 +
 drivers/gpu/drm/drm_buddy.c                               | 1 +
 drivers/gpu/drm/drm_dumb_buffers.c                        | 1 +
 drivers/gpu/drm/drm_fbdev_dma.c                           | 1 +
 drivers/gpu/drm/drm_fbdev_shmem.c                         | 1 +
 drivers/gpu/drm/drm_gem_dma_helper.c                      | 1 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c              | 1 +
 drivers/gpu/drm/drm_gem_ttm_helper.c                      | 1 +
 drivers/gpu/drm/drm_gem_vram_helper.c                     | 1 +
 drivers/gpu/drm/drm_gpuvm.c                               | 1 +
 drivers/gpu/drm/drm_mipi_dbi.c                            | 1 +
 drivers/gpu/drm/drm_mm.c                                  | 1 +
 drivers/gpu/drm/drm_prime.c                               | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_buffer.c                  | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c                     | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c                     | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c              | 1 +
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c                     | 2 ++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c                     | 2 ++
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c             | 1 +
 drivers/gpu/drm/exynos/exynos7_drm_decon.c                | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fb.c                    | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimd.c                  | 1 +
 drivers/gpu/drm/exynos/exynos_drm_g2d.c                   | 1 +
 drivers/gpu/drm/exynos/exynos_drm_gem.c                   | 1 +
 drivers/gpu/drm/exynos/exynos_drm_ipp.c                   | 1 +
 drivers/gpu/drm/exynos/exynos_drm_plane.c                 | 1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c                  | 1 +
 drivers/gpu/drm/exynos/exynos_mixer.c                     | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c               | 1 +
 drivers/gpu/drm/gma500/backlight.c                        | 2 ++
 drivers/gpu/drm/gma500/cdv_device.c                       | 1 +
 drivers/gpu/drm/gma500/cdv_intel_display.c                | 1 +
 drivers/gpu/drm/gma500/cdv_intel_dp.c                     | 1 +
 drivers/gpu/drm/gma500/cdv_intel_hdmi.c                   | 1 +
 drivers/gpu/drm/gma500/cdv_intel_lvds.c                   | 1 +
 drivers/gpu/drm/gma500/gem.c                              | 1 +
 drivers/gpu/drm/gma500/intel_bios.c                       | 1 +
 drivers/gpu/drm/gma500/intel_gmbus.c                      | 2 ++
 drivers/gpu/drm/gma500/mid_bios.c                         | 1 +
 drivers/gpu/drm/gma500/oaktrail_crtc.c                    | 1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi.c                    | 1 +
 drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c                | 3 +++
 drivers/gpu/drm/gma500/oaktrail_lvds.c                    | 1 +
 drivers/gpu/drm/gma500/opregion.c                         | 3 +++
 drivers/gpu/drm/gma500/psb_drv.c                          | 1 +
 drivers/gpu/drm/gma500/psb_intel_display.c                | 1 +
 drivers/gpu/drm/gma500/psb_intel_lvds.c                   | 1 +
 drivers/gpu/drm/gma500/psb_intel_sdvo.c                   | 1 +
 drivers/gpu/drm/gma500/psb_irq.c                          | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c           | 1 +
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c           | 1 +
 drivers/gpu/drm/i915/display/i9xx_wm.c                    | 2 ++
 drivers/gpu/drm/i915/display/intel_bios.c                 | 1 +
 drivers/gpu/drm/i915/display/intel_bw.c                   | 2 ++
 drivers/gpu/drm/i915/display/intel_cdclk.c                | 1 +
 drivers/gpu/drm/i915/display/intel_connector.c            | 1 +
 drivers/gpu/drm/i915/display/intel_crtc.c                 | 1 +
 drivers/gpu/drm/i915/display/intel_display.c              | 1 +
 drivers/gpu/drm/i915/display/intel_display_debugfs.c      | 1 +
 drivers/gpu/drm/i915/display/intel_display_driver.c       | 1 +
 drivers/gpu/drm/i915/display/intel_display_irq.c          | 1 +
 drivers/gpu/drm/i915/display/intel_display_power.c        | 2 ++
 drivers/gpu/drm/i915/display/intel_display_power_well.c   | 2 ++
 drivers/gpu/drm/i915/display/intel_display_reset.c        | 1 +
 drivers/gpu/drm/i915/display/intel_dpt.c                  | 2 ++
 drivers/gpu/drm/i915/display/intel_fb.c                   | 1 +
 drivers/gpu/drm/i915/display/intel_fb_bo.c                | 1 +
 drivers/gpu/drm/i915/display/intel_fb_pin.c               | 2 ++
 drivers/gpu/drm/i915/display/intel_fbc.c                  | 1 +
 drivers/gpu/drm/i915/display/intel_fbdev_fb.c             | 2 ++
 drivers/gpu/drm/i915/display/intel_frontbuffer.c          | 1 +
 drivers/gpu/drm/i915/display/intel_gmbus.c                | 1 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c             | 1 +
 drivers/gpu/drm/i915/display/intel_hotplug.c              | 1 +
 drivers/gpu/drm/i915/display/intel_overlay.c              | 1 +
 drivers/gpu/drm/i915/display/intel_pipe_crc.c             | 2 ++
 drivers/gpu/drm/i915/display/intel_plane.c                | 1 +
 drivers/gpu/drm/i915/display/intel_plane_initial.c        | 2 ++
 drivers/gpu/drm/i915/display/intel_psr.c                  | 1 +
 drivers/gpu/drm/i915/display/intel_vblank.c               | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_context.c               | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c            | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_pages.c                 | 4 +++-
 drivers/gpu/drm/i915/gem/i915_gem_phys.c                  | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c              | 2 ++
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c                   | 3 ++-
 drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c                | 1 +
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c               | 2 ++
 drivers/gpu/drm/i915/gem/i915_gemfs.c                     | 2 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c  | 2 ++
 drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c        | 2 ++
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c                  | 2 ++
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c          | 2 ++
 drivers/gpu/drm/i915/gt/intel_engine_user.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c      | 2 ++
 drivers/gpu/drm/i915/gt/intel_ggtt.c                      | 1 +
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c              | 2 ++
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c                 | 1 +
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c                | 2 ++
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c             | 2 ++
 drivers/gpu/drm/i915/gt/intel_lrc.c                       | 2 ++
 drivers/gpu/drm/i915/gt/intel_mocs.c                      | 2 ++
 drivers/gpu/drm/i915/gt/intel_rc6.c                       | 2 ++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_renderstate.c               | 2 ++
 drivers/gpu/drm/i915/gt/intel_sa_media.c                  | 1 +
 drivers/gpu/drm/i915/gt/intel_sseu.c                      | 2 ++
 drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c              | 2 ++
 drivers/gpu/drm/i915/gt/intel_timeline.c                  | 1 +
 drivers/gpu/drm/i915/gt/intel_wopcm.c                     | 2 ++
 drivers/gpu/drm/i915/gt/selftest_context.c                | 2 ++
 drivers/gpu/drm/i915/gt/selftest_execlists.c              | 2 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 2 ++
 drivers/gpu/drm/i915/gvt/aperture_gm.c                    | 2 ++
 drivers/gpu/drm/i915/gvt/cfg_space.c                      | 2 ++
 drivers/gpu/drm/i915/gvt/cmd_parser.c                     | 2 ++
 drivers/gpu/drm/i915/gvt/display.c                        | 1 +
 drivers/gpu/drm/i915/gvt/dmabuf.c                         | 1 +
 drivers/gpu/drm/i915/gvt/edid.c                           | 1 +
 drivers/gpu/drm/i915/gvt/gtt.c                            | 2 ++
 drivers/gpu/drm/i915/gvt/handlers.c                       | 1 +
 drivers/gpu/drm/i915/gvt/interrupt.c                      | 2 ++
 drivers/gpu/drm/i915/gvt/kvmgt.c                          | 1 +
 drivers/gpu/drm/i915/gvt/mmio.c                           | 3 +++
 drivers/gpu/drm/i915/gvt/mmio_context.c                   | 2 ++
 drivers/gpu/drm/i915/gvt/scheduler.c                      | 2 ++
 drivers/gpu/drm/i915/gvt/vgpu.c                           | 2 ++
 drivers/gpu/drm/i915/i915_cmd_parser.c                    | 1 +
 drivers/gpu/drm/i915/i915_debugfs.c                       | 1 +
 drivers/gpu/drm/i915/i915_gem.c                           | 1 +
 drivers/gpu/drm/i915/i915_getparam.c                      | 2 ++
 drivers/gpu/drm/i915/i915_irq.c                           | 1 +
 drivers/gpu/drm/i915/i915_module.c                        | 1 +
 drivers/gpu/drm/i915/i915_pmu.c                           | 2 ++
 drivers/gpu/drm/i915/i915_query.c                         | 2 ++
 drivers/gpu/drm/i915/i915_request.c                       | 2 ++
 drivers/gpu/drm/i915/i915_switcheroo.c                    | 2 ++
 drivers/gpu/drm/i915/i915_sysfs.c                         | 2 ++
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c             | 4 ++--
 drivers/gpu/drm/i915/i915_utils.c                         | 1 +
 drivers/gpu/drm/i915/i915_vgpu.c                          | 2 ++
 drivers/gpu/drm/i915/i915_vma.c                           | 2 ++
 drivers/gpu/drm/i915/intel_clock_gating.c                 | 2 ++
 drivers/gpu/drm/i915/intel_gvt.c                          | 2 ++
 drivers/gpu/drm/i915/intel_memory_region.c                | 1 +
 drivers/gpu/drm/i915/intel_pcode.c                        | 2 ++
 drivers/gpu/drm/i915/intel_step.c                         | 2 ++
 drivers/gpu/drm/i915/intel_uncore.c                       | 1 +
 drivers/gpu/drm/i915/intel_wakeref.c                      | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c                      | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c                | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c                  | 2 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c              | 2 ++
 drivers/gpu/drm/i915/selftests/i915_active.c              | 2 ++
 drivers/gpu/drm/i915/selftests/i915_request.c             | 2 ++
 drivers/gpu/drm/i915/soc/intel_dram.c                     | 1 +
 drivers/gpu/drm/i915/soc/intel_gmch.c                     | 1 +
 drivers/gpu/drm/i915/vlv_iosf_sb.c                        | 2 ++
 drivers/gpu/drm/imagination/pvr_ccb.c                     | 1 +
 drivers/gpu/drm/imagination/pvr_fw.c                      | 1 +
 drivers/gpu/drm/imagination/pvr_fw_meta.c                 | 2 ++
 drivers/gpu/drm/imagination/pvr_fw_trace.c                | 1 +
 drivers/gpu/drm/imagination/pvr_power.c                   | 1 +
 drivers/gpu/drm/imagination/pvr_vm.c                      | 1 +
 drivers/gpu/drm/imx/dcss/dcss-plane.c                     | 1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c                   | 1 +
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c                       | 1 +
 drivers/gpu/drm/kmb/kmb_drv.c                             | 1 +
 drivers/gpu/drm/kmb/kmb_plane.c                           | 1 +
 drivers/gpu/drm/lima/lima_sched.c                         | 2 ++
 drivers/gpu/drm/loongson/lsdc_benchmark.c                 | 1 +
 drivers/gpu/drm/loongson/lsdc_crtc.c                      | 1 +
 drivers/gpu/drm/loongson/lsdc_debugfs.c                   | 1 +
 drivers/gpu/drm/loongson/lsdc_drv.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_gem.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_i2c.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_irq.c                       | 1 +
 drivers/gpu/drm/loongson/lsdc_output_7a1000.c             | 1 +
 drivers/gpu/drm/loongson/lsdc_output_7a2000.c             | 1 +
 drivers/gpu/drm/loongson/lsdc_pixpll.c                    | 1 +
 drivers/gpu/drm/loongson/lsdc_plane.c                     | 1 +
 drivers/gpu/drm/loongson/lsdc_ttm.c                       | 1 +
 drivers/gpu/drm/mcde/mcde_display.c                       | 1 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                       | 1 +
 drivers/gpu/drm/mediatek/mtk_gem.c                        | 1 +
 drivers/gpu/drm/mediatek/mtk_plane.c                      | 1 +
 drivers/gpu/drm/meson/meson_overlay.c                     | 1 +
 drivers/gpu/drm/meson/meson_plane.c                       | 1 +
 drivers/gpu/drm/mgag200/mgag200_drv.c                     | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200.c                    | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c                 | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200eh5.c                 | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200er.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ev.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c                 | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200se.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_g200wb.c                  | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga.c                     | 1 +
 drivers/gpu/drm/mgag200/mgag200_vga_bmc.c                 | 1 +
 drivers/gpu/drm/mxsfb/lcdif_kms.c                         | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                         | 1 +
 drivers/gpu/drm/nouveau/nouveau_drv.h                     | 1 +
 drivers/gpu/drm/omapdrm/omap_crtc.c                       | 1 +
 drivers/gpu/drm/omapdrm/omap_debugfs.c                    | 1 +
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c                  | 2 ++
 drivers/gpu/drm/omapdrm/omap_drv.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_fb.c                         | 1 +
 drivers/gpu/drm/omapdrm/omap_fbdev.c                      | 1 +
 drivers/gpu/drm/omapdrm/omap_gem.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_irq.c                        | 1 +
 drivers/gpu/drm/omapdrm/omap_overlay.c                    | 1 +
 drivers/gpu/drm/omapdrm/omap_plane.c                      | 1 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c               | 2 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c                   | 1 +
 drivers/gpu/drm/panfrost/panfrost_gem.c                   | 1 +
 drivers/gpu/drm/panfrost/panfrost_gpu.c                   | 2 ++
 drivers/gpu/drm/panfrost/panfrost_mmu.c                   | 1 +
 drivers/gpu/drm/panthor/panthor_devfreq.c                 | 1 +
 drivers/gpu/drm/panthor/panthor_device.c                  | 1 +
 drivers/gpu/drm/panthor/panthor_drv.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_fw.c                      | 1 +
 drivers/gpu/drm/panthor/panthor_gem.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_gpu.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_heap.c                    | 1 +
 drivers/gpu/drm/panthor/panthor_hw.c                      | 2 ++
 drivers/gpu/drm/panthor/panthor_mmu.c                     | 1 +
 drivers/gpu/drm/panthor/panthor_sched.c                   | 1 +
 drivers/gpu/drm/pl111/pl111_display.c                     | 1 +
 drivers/gpu/drm/qxl/qxl_cmd.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_debugfs.c                         | 1 +
 drivers/gpu/drm/qxl/qxl_display.c                         | 1 +
 drivers/gpu/drm/qxl/qxl_drv.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_gem.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_image.c                           | 2 ++
 drivers/gpu/drm/qxl/qxl_ioctl.c                           | 2 ++
 drivers/gpu/drm/qxl/qxl_irq.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_kms.c                             | 1 +
 drivers/gpu/drm/qxl/qxl_release.c                         | 2 ++
 drivers/gpu/drm/qxl/qxl_ttm.c                             | 1 +
 drivers/gpu/drm/radeon/radeon.h                           | 1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c            | 1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c             | 1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c           | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-core.c                    | 1 +
 drivers/gpu/drm/rockchip/cdn-dp-reg.c                     | 2 ++
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c           | 1 +
 drivers/gpu/drm/rockchip/inno_hdmi.c                      | 1 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c                    | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c               | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c               | 1 +
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c               | 1 +
 drivers/gpu/drm/rockchip/rockchip_lvds.c                  | 1 +
 drivers/gpu/drm/rockchip/rockchip_rgb.c                   | 1 +
 drivers/gpu/drm/sitronix/st7586.c                         | 1 +
 drivers/gpu/drm/sitronix/st7735r.c                        | 1 +
 drivers/gpu/drm/solomon/ssd130x.c                         | 1 +
 drivers/gpu/drm/sti/sti_cursor.c                          | 1 +
 drivers/gpu/drm/sti/sti_drv.c                             | 1 +
 drivers/gpu/drm/sti/sti_gdp.c                             | 1 +
 drivers/gpu/drm/sti/sti_hqvdp.c                           | 1 +
 drivers/gpu/drm/sti/sti_plane.c                           | 1 +
 drivers/gpu/drm/stm/drv.c                                 | 1 +
 drivers/gpu/drm/stm/ltdc.c                                | 1 +
 drivers/gpu/drm/sun4i/sun4i_backend.c                     | 1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c                         | 1 +
 drivers/gpu/drm/sun4i/sun4i_frontend.c                    | 1 +
 drivers/gpu/drm/sun4i/sun8i_mixer.c                       | 1 +
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c                    | 1 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c                    | 1 +
 drivers/gpu/drm/sysfb/efidrm.c                            | 1 +
 drivers/gpu/drm/sysfb/ofdrm.c                             | 1 +
 drivers/gpu/drm/sysfb/simpledrm.c                         | 1 +
 drivers/gpu/drm/sysfb/vesadrm.c                           | 1 +
 drivers/gpu/drm/tegra/dc.c                                | 1 +
 drivers/gpu/drm/tegra/drm.c                               | 1 +
 drivers/gpu/drm/tegra/dsi.c                               | 1 +
 drivers/gpu/drm/tegra/fb.c                                | 1 +
 drivers/gpu/drm/tegra/hdmi.c                              | 1 +
 drivers/gpu/drm/tegra/hub.c                               | 1 +
 drivers/gpu/drm/tegra/sor.c                               | 1 +
 drivers/gpu/drm/tests/drm_mm_test.c                       | 1 +
 drivers/gpu/drm/tidss/tidss_crtc.c                        | 1 +
 drivers/gpu/drm/tidss/tidss_dispc.c                       | 1 +
 drivers/gpu/drm/tiny/bochs.c                              | 1 +
 drivers/gpu/drm/tiny/cirrus-qemu.c                        | 1 +
 drivers/gpu/drm/tiny/gm12u320.c                           | 1 +
 drivers/gpu/drm/tiny/hx8357d.c                            | 1 +
 drivers/gpu/drm/tiny/ili9163.c                            | 1 +
 drivers/gpu/drm/tiny/ili9225.c                            | 1 +
 drivers/gpu/drm/tiny/ili9341.c                            | 1 +
 drivers/gpu/drm/tiny/ili9486.c                            | 1 +
 drivers/gpu/drm/tiny/mi0283qt.c                           | 1 +
 drivers/gpu/drm/tiny/panel-mipi-dbi.c                     | 1 +
 drivers/gpu/drm/tiny/pixpaper.c                           | 1 +
 drivers/gpu/drm/tiny/repaper.c                            | 1 +
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c              | 1 +
 drivers/gpu/drm/ttm/ttm_bo.c                              | 1 +
 drivers/gpu/drm/ttm/ttm_resource.c                        | 1 +
 drivers/gpu/drm/ttm/ttm_tt.c                              | 1 +
 drivers/gpu/drm/tve200/tve200_display.c                   | 1 +
 drivers/gpu/drm/udl/udl_edid.c                            | 1 +
 drivers/gpu/drm/v3d/v3d_bo.c                              | 2 ++
 drivers/gpu/drm/v3d/v3d_debugfs.c                         | 1 +
 drivers/gpu/drm/v3d/v3d_drv.c                             | 1 +
 drivers/gpu/drm/v3d/v3d_gem.c                             | 1 +
 drivers/gpu/drm/v3d/v3d_gemfs.c                           | 2 ++
 drivers/gpu/drm/v3d/v3d_irq.c                             | 2 ++
 drivers/gpu/drm/v3d/v3d_sched.c                           | 1 +
 drivers/gpu/drm/v3d/v3d_submit.c                          | 1 +
 drivers/gpu/drm/vboxvideo/vbox_irq.c                      | 1 +
 drivers/gpu/drm/vboxvideo/vbox_main.c                     | 1 +
 drivers/gpu/drm/vboxvideo/vbox_mode.c                     | 1 +
 drivers/gpu/drm/vboxvideo/vbox_ttm.c                      | 1 +
 drivers/gpu/drm/vc4/vc4_bo.c                              | 1 +
 drivers/gpu/drm/vc4/vc4_debugfs.c                         | 1 +
 drivers/gpu/drm/vc4/vc4_dpi.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_drv.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_dsi.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_gem.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                            | 1 +
 drivers/gpu/drm/vc4/vc4_hvs.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_irq.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_kms.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_perfmon.c                         | 2 ++
 drivers/gpu/drm/vc4/vc4_plane.c                           | 1 +
 drivers/gpu/drm/vc4/vc4_render_cl.c                       | 2 ++
 drivers/gpu/drm/vc4/vc4_txp.c                             | 1 +
 drivers/gpu/drm/vc4/vc4_v3d.c                             | 2 ++
 drivers/gpu/drm/vc4/vc4_validate.c                        | 2 ++
 drivers/gpu/drm/vc4/vc4_validate_shaders.c                | 2 ++
 drivers/gpu/drm/vc4/vc4_vec.c                             | 1 +
 drivers/gpu/drm/virtio/virtgpu_debugfs.c                  | 1 +
 drivers/gpu/drm/virtio/virtgpu_display.c                  | 1 +
 drivers/gpu/drm/virtio/virtgpu_drv.c                      | 1 +
 drivers/gpu/drm/virtio/virtgpu_kms.c                      | 1 +
 drivers/gpu/drm/virtio/virtgpu_object.c                   | 2 ++
 drivers/gpu/drm/virtio/virtgpu_plane.c                    | 1 +
 drivers/gpu/drm/virtio/virtgpu_vq.c                       | 1 +
 drivers/gpu/drm/vkms/vkms_composer.c                      | 1 +
 drivers/gpu/drm/vkms/vkms_crtc.c                          | 1 +
 drivers/gpu/drm/vkms/vkms_drv.c                           | 1 +
 drivers/gpu/drm/vkms/vkms_output.c                        | 1 +
 drivers/gpu/drm/vkms/vkms_plane.c                         | 1 +
 drivers/gpu/drm/vkms/vkms_writeback.c                     | 1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h                       | 1 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                          | 2 ++
 drivers/gpu/drm/xe/xe_tuning.c                            | 1 +
 drivers/gpu/drm/xen/xen_drm_front.c                       | 1 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c                   | 1 +
 drivers/gpu/drm/xen/xen_drm_front_kms.c                   | 1 +
 375 files changed, 470 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
index 61e0136c21a8..dfa916eeb2d9 100644
--- a/drivers/accel/amdxdna/amdxdna_gem.c
+++ b/drivers/accel/amdxdna/amdxdna_gem.c
@@ -8,6 +8,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-direct.h>
diff --git a/drivers/accel/ethosu/ethosu_job.c b/drivers/accel/ethosu/ethosu_job.c
index 32b89cbfbaad..26e7a2f64d71 100644
--- a/drivers/accel/ethosu/ethosu_job.c
+++ b/drivers/accel/ethosu/ethosu_job.c
@@ -12,6 +12,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/ethosu_accel.h>
 
 #include "ethosu_device.h"
diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index 0551e11cc184..624c4ecf5a34 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -2,6 +2,7 @@
 /* Copyright 2024-2025 Tomeu Vizoso <tomeu@tomeuvizoso.net> */
 
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/drm_utils.h>
 #include <drm/rocket_accel.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 54cde090c3f4..4554cf75565e 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 901f938aefe0..3ca461eb0a24 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -9,6 +9,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "komeda_framebuffer.h"
 #include "komeda_dev.h"
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 806da0aaedf7..4b4a08cb396d 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -22,6 +22,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index c3179d74f3f5..81d45f2dd6a7 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -33,6 +33,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index bc5f5e9798c3..b765f6c9eea4 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -29,6 +29,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b1..47733c85d271 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_writeback.h>
 
diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index 0900e4466ffb..033b19b31f63 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index a763349dd89f..2445365c823f 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index aa4289127086..77098928f821 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -6,6 +6,7 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "armada_drm.h"
 #include "armada_fb.h"
diff --git a/drivers/gpu/drm/armada/armada_fbdev.c b/drivers/gpu/drm/armada/armada_fbdev.c
index 22e2081bfa04..be703d35f6b7 100644
--- a/drivers/gpu/drm/armada/armada_fbdev.c
+++ b/drivers/gpu/drm/armada/armada_fbdev.c
@@ -13,6 +13,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 1a1680d71486..35fcfa0d85ff 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -10,6 +10,7 @@
 
 #include <drm/armada_drm.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "armada_drm.h"
 #include "armada_gem.h"
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index 3b9bd8ecda13..21fd3b4ba10f 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/armada/armada_plane.c b/drivers/gpu/drm/armada/armada_plane.c
index dae81ebafdb4..a0326b4f568e 100644
--- a/drivers/gpu/drm/armada/armada_plane.c
+++ b/drivers/gpu/drm/armada/armada_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 
 #include "armada_crtc.h"
 #include "armada_drm.h"
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9ce874dba69c..de7b6294ce40 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ast_drv.h"
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index acb017a2486b..dd70894c8f38 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 38f60befd7d7..92132be9823f 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -16,6 +16,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "atmel_hlcdc_dc.h"
 
diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index f2c92902e4a3..2f279b46bd2c 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -11,6 +11,7 @@
 #include <linux/sizes.h>
 
 #include <drm/drm_buddy.h>
+#include <drm/drm_print.h>
 
 enum drm_buddy_free_tree {
 	DRM_BUDDY_CLEAR_TREE = 0,
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e9eed9a5b760..e2b62e5fb891 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -29,6 +29,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index c6196293e424..f8eccea36a1c 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -10,6 +10,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 /*
  * struct fb_ops
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 51573058df6f..6b3dcfa2b725 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -9,6 +9,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_print.h>
 
 /*
  * struct fb_ops
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 9c9bfc9e85c6..12d8307997a0 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -22,6 +22,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 /**
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 4bc89d33df59..9fd4eb02a20f 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include "drm_internal.h"
 
diff --git a/drivers/gpu/drm/drm_gem_ttm_helper.c b/drivers/gpu/drm/drm_gem_ttm_helper.c
index 257cca4cb97a..08ff0fadd0b2 100644
--- a/drivers/gpu/drm/drm_gem_ttm_helper.c
+++ b/drivers/gpu/drm/drm_gem_ttm_helper.c
@@ -4,6 +4,7 @@
 #include <linux/module.h>
 
 #include <drm/drm_gem_ttm_helper.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 0bec6f66682b..9996d42ddc97 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -17,6 +17,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include <drm/ttm/ttm_range_manager.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 936e6c1a60c1..8a06d296561d 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -26,6 +26,7 @@
  */
 
 #include <drm/drm_gpuvm.h>
+#include <drm/drm_print.h>
 
 #include <linux/export.h>
 #include <linux/interval_tree_generic.h>
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index b488c91c20a5..00482227a9cd 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -26,6 +26,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <video/mipi_display.h>
diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b382..6692abe564d3 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -49,6 +49,7 @@
 #include <linux/stacktrace.h>
 
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 
 /**
  * DOC: Overview
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 43a10b4af43a..21809a82187b 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -37,6 +37,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "drm_internal.h"
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
index 88385dc3b30d..ad5e6f7b23f9 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_buffer.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_gpu.h"
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 3e91747ed339..54ceae87b401 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -17,6 +17,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_drv.h"
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index 2f844e82bc46..5d8f3b03d4ae 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <linux/dma-mapping.h>
 #include <linux/shmem_fs.h>
 #include <linux/spinlock.h>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 76c742328edb..a9611c1a773f 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <linux/dma-fence-array.h>
 #include <linux/file.h>
 #include <linux/dma-resv.h>
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index cf0d9049bcf1..ca0be293f5fe 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -16,6 +16,8 @@
 #include <linux/reset.h>
 #include <linux/thermal.h>
 
+#include <drm/drm_print.h>
+
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_dump.h"
 #include "etnaviv_gpu.h"
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index df5192083b20..a992be2ede88 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -6,6 +6,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/scatterlist.h>
 
+#include <drm/drm_print.h>
+
 #include "common.xml.h"
 #include "etnaviv_cmdbuf.h"
 #include "etnaviv_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index b9e206303b48..9ae0fa4667a9 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -20,6 +20,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "exynos_drm_crtc.h"
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index b8d9b7251319..bb74b17f9753 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -20,6 +20,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ddd73e7f26a3..6ecd95bcb0c4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -14,6 +14,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
index a3bd21a827ad..a9d35e8fca6a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -16,6 +16,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 205c238cc73a..b6abdc4f2b0a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -23,6 +23,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index d32f2474cbaa..2bea107dd960 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -21,6 +21,7 @@
 #include <linux/workqueue.h>
 
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 02714c9ab639..b9b2f000072d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index 03c8490af4f4..008def51225a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_drv.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index 6400070a4c9b..67afddd566e2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/exynos_drm.h>
 
 #include "exynos_drm_crtc.h"
diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index e094b8bbc0f1..64c69dd2966e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -14,6 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index a3670d2eaab2..69dea5049309 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -28,6 +28,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/exynos_drm.h>
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 794a87d16f88..a9a341ea6507 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -15,6 +15,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "fsl_dcu_drm_drv.h"
diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
index 8711a7a5b8da..c8f1716a12d5 100644
--- a/drivers/gpu/drm/gma500/backlight.c
+++ b/drivers/gpu/drm/gma500/backlight.c
@@ -11,6 +11,8 @@
 
 #include <acpi/video.h>
 
+#include <drm/drm_print.h>
+
 #include "psb_drv.h"
 #include "psb_intel_reg.h"
 #include "psb_intel_drv.h"
diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 718d45891fc7..fd6ea8998dbe 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm.h>
 #include <drm/drm_crtc_helper.h>
+#include <drm/drm_print.h>
 
 #include "cdv_device.h"
 #include "gma_device.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index bbd0abdd8382..5942a9d46b02 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 
 #include "cdv_device.h"
 #include "framebuffer.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index c85143792019..54bf626f0524 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -34,6 +34,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "gma_display.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
index f2a3e37ef632..8e93ee0d0ccd 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_hdmi.c
@@ -31,6 +31,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "cdv_device.h"
diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 9276e3676ba0..fbe7fe317393 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "cdv_device.h"
diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4b7627a72637..2e44a2ac2742 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -16,6 +16,7 @@
 #include <asm/set_memory.h>
 
 #include <drm/drm.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "gem.h"
diff --git a/drivers/gpu/drm/gma500/intel_bios.c b/drivers/gpu/drm/gma500/intel_bios.c
index d5924ca3ed05..b60720560830 100644
--- a/drivers/gpu/drm/gma500/intel_bios.c
+++ b/drivers/gpu/drm/gma500/intel_bios.c
@@ -8,6 +8,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm.h>
+#include <drm/drm_print.h>
 
 #include "intel_bios.h"
 #include "psb_drv.h"
diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
index ee8b047587f2..2b06ba22f9c6 100644
--- a/drivers/gpu/drm/gma500/intel_gmbus.c
+++ b/drivers/gpu/drm/gma500/intel_gmbus.c
@@ -32,6 +32,8 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 
+#include <drm/drm_print.h>
+
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index cba97d7db131..0326f3ddc621 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -12,6 +12,7 @@
  */
 
 #include <drm/drm.h>
+#include <drm/drm_print.h>
 
 #include "mid_bios.h"
 #include "psb_drv.h"
diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index ea9b41af0867..086d14678a8e 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -10,6 +10,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 
 #include "framebuffer.h"
 #include "gem.h"
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi.c b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
index c0feca58511d..20d027d552c7 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi.c
@@ -30,6 +30,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "psb_drv.h"
diff --git a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
index 6daa6669ed23..48e8ac560a2a 100644
--- a/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
+++ b/drivers/gpu/drm/gma500/oaktrail_hdmi_i2c.c
@@ -30,6 +30,9 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
+
+#include <drm/drm_print.h>
+
 #include "psb_drv.h"
 
 #define HDMI_READ(reg)		readl(hdmi_dev->regs + (reg))
diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/gma500/oaktrail_lvds.c
index 72191d6f0d06..0705ba3813e6 100644
--- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
+++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/gma500/opregion.c b/drivers/gpu/drm/gma500/opregion.c
index 0c271072af63..5f0daa25b86d 100644
--- a/drivers/gpu/drm/gma500/opregion.c
+++ b/drivers/gpu/drm/gma500/opregion.c
@@ -22,6 +22,9 @@
  *
  */
 #include <linux/acpi.h>
+
+#include <drm/drm_print.h>
+
 #include "psb_drv.h"
 #include "psb_irq.h"
 #include "psb_intel_reg.h"
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 85d3557c2eb9..005ab7f5355f 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -25,6 +25,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_pciids.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "framebuffer.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index ff46e88c4768..1ff2bd23db74 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -11,6 +11,7 @@
 
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 
 #include "framebuffer.h"
 #include "gem.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index 9ad611b5956e..f8f3c42e67a7 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "intel_bios.h"
diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
index afda40fc4494..553e7c7d9bb8 100644
--- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
+++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
@@ -36,6 +36,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 
 #include "psb_drv.h"
 #include "psb_intel_drv.h"
diff --git a/drivers/gpu/drm/gma500/psb_irq.c b/drivers/gpu/drm/gma500/psb_irq.c
index 7bbb79b0497d..c224c7ff353c 100644
--- a/drivers/gpu/drm/gma500/psb_irq.c
+++ b/drivers/gpu/drm/gma500/psb_irq.c
@@ -9,6 +9,7 @@
  **************************************************************************/
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "power.h"
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 45c4eb008ad5..76384b4581bf 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -29,6 +29,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 1e1c87be1204..8a11c2df5b88 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/i915/display/i9xx_wm.c b/drivers/gpu/drm/i915/display/i9xx_wm.c
index b262319bc83d..01f3803fa09f 100644
--- a/drivers/gpu/drm/i915/display/i9xx_wm.c
+++ b/drivers/gpu/drm/i915/display/i9xx_wm.c
@@ -5,6 +5,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
+
 #include "soc/intel_dram.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3596dce84c28..9e0647327710 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -32,6 +32,7 @@
 #include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
+#include <drm/drm_print.h>
 
 #include "soc/intel_rom.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i915/display/intel_bw.c
index 92a060e02cf3..8d40041c921b 100644
--- a/drivers/gpu/drm/i915/display/intel_bw.c
+++ b/drivers/gpu/drm/i915/display/intel_bw.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "soc/intel_dram.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
index e92e7fd9fd13..e1d981cc5684 100644
--- a/drivers/gpu/drm/i915/display/intel_cdclk.c
+++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
@@ -26,6 +26,7 @@
 #include <linux/time.h>
 
 #include <drm/drm_fixed.h>
+#include <drm/drm_print.h>
 
 #include "soc/intel_dram.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 6a55854db5b6..79bda1c6ca26 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -28,6 +28,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index d300ba1dcd2c..235fcb3086cc 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_work.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 2744f83bda2e..8871fe314690 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -41,6 +41,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
index 10dddec3796f..8345faa38f04 100644
--- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
+++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
@@ -12,6 +12,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "hsw_ips.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 38672d2896e3..46efca7e547c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -14,6 +14,7 @@
 #include <drm/drm_client_event.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_privacy_screen_consumer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_display_irq.c b/drivers/gpu/drm/i915/display/intel_display_irq.c
index e1a812f6159b..43b27deb4a26 100644
--- a/drivers/gpu/drm/i915/display/intel_display_irq.c
+++ b/drivers/gpu/drm/i915/display/intel_display_irq.c
@@ -3,6 +3,7 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index da4babfd6bcb..c4b919f44556 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -6,6 +6,8 @@
 #include <linux/iopoll.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "soc/intel_dram.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_power_well.c b/drivers/gpu/drm/i915/display/intel_display_power_well.c
index 5e88b930f5aa..d1b70a117d73 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power_well.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power_well.c
@@ -5,6 +5,8 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_reset.c b/drivers/gpu/drm/i915/display/intel_display_reset.c
index f5f38dca14d7..03e8c68d2913 100644
--- a/drivers/gpu/drm/i915/display/intel_display_reset.c
+++ b/drivers/gpu/drm/i915/display/intel_display_reset.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "intel_clock_gating.h"
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index c0a817018d08..58d953472218 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fb.c b/drivers/gpu/drm/i915/display/intel_fb.c
index 6ade38198f39..8ae8fc97f099 100644
--- a/drivers/gpu/drm/i915/display/intel_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fb.c
@@ -9,6 +9,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include "i915_utils.h"
 #include "intel_bo.h"
diff --git a/drivers/gpu/drm/i915/display/intel_fb_bo.c b/drivers/gpu/drm/i915/display/intel_fb_bo.c
index 7336d7294a7b..bfecd73d5fa0 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_bo.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_bo.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_object.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 45af04cb0fb2..7249b784fbba 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -7,6 +7,8 @@
  * DOC: display pinning helpers
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_domain.h"
 #include "gem/i915_gem_object.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbc.c b/drivers/gpu/drm/i915/display/intel_fbc.c
index 10ef3136dadc..ef71befbe2a9 100644
--- a/drivers/gpu/drm/i915/display/intel_fbc.c
+++ b/drivers/gpu/drm/i915/display/intel_fbc.c
@@ -43,6 +43,7 @@
 
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_stolen.h"
 
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
index 0838fdd37254..c3202ba141c5 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev_fb.c
@@ -5,6 +5,8 @@
 
 #include <linux/fb.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_lmem.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_frontbuffer.c b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
index 73ed28ac9573..c88bef22d366 100644
--- a/drivers/gpu/drm/i915/display/intel_frontbuffer.c
+++ b/drivers/gpu/drm/i915/display/intel_frontbuffer.c
@@ -56,6 +56,7 @@
  */
 
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include "i915_active.h"
 #include "i915_vma.h"
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 358210adb8f8..82f3a40ecac7 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -32,6 +32,7 @@
 #include <linux/i2c.h>
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdcp_helper.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
index 6a22862d6be1..c3907aeb0a78 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
@@ -3,6 +3,7 @@
  * Copyright 2023, Intel Corporation.
  */
 
+#include <drm/drm_print.h>
 #include <drm/intel/i915_hdcp_interface.h>
 
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hotplug.c b/drivers/gpu/drm/i915/display/intel_hotplug.c
index 4451a792600a..b2a1df41c12c 100644
--- a/drivers/gpu/drm/i915/display/intel_hotplug.c
+++ b/drivers/gpu/drm/i915/display/intel_hotplug.c
@@ -24,6 +24,7 @@
 #include <linux/debugfs.h>
 #include <linux/kernel.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 272f9e7af4d4..231b1632d64a 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -27,6 +27,7 @@
  */
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_object_frontbuffer.h"
diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index c2b4b2254190..1f27643412f1 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -28,6 +28,8 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_irq.h"
 #include "intel_atomic.h"
diff --git a/drivers/gpu/drm/i915/display/intel_plane.c b/drivers/gpu/drm/i915/display/intel_plane.c
index 78329deb395a..505c776c0585 100644
--- a/drivers/gpu/drm/i915/display/intel_plane.c
+++ b/drivers/gpu/drm/i915/display/intel_plane.c
@@ -43,6 +43,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_panic.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_object.h"
 #include "i9xx_plane_regs.h"
diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
index a9f36b1b50c1..81444e0b3c41 100644
--- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
+++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
@@ -3,6 +3,8 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index cfc8b04f98fa..c2782a5dc9dc 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -26,6 +26,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
index 2fc0c1c0bb87..817c7c272d4f 100644
--- a/drivers/gpu/drm/i915/display/intel_vblank.c
+++ b/drivers/gpu/drm/i915/display/intel_vblank.c
@@ -5,6 +5,7 @@
 
 #include <linux/iopoll.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index ed6599694835..3215ef49c975 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -68,6 +68,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "gt/gen6_ppgtt.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
index c3e6a325872d..cd9686a7ded2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_display.h"
 #include "gem/i915_gem_ioctls.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 7a0dee4111cb..b057c2fa03a4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -9,6 +9,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_auth.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "gem/i915_gem_ioctls.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 478011e5ecb3..e1348a0043db 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -27,6 +27,7 @@
 #include <linux/sched/mm.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_frontbuffer.h"
 #include "pxp/intel_pxp.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 3f09cbce05bb..c2f8e5f95696 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -3,9 +3,11 @@
  * Copyright © 2014-2016 Intel Corporation
  */
 
+#include <linux/vmalloc.h>
+
 #include <drm/drm_cache.h>
 #include <drm/drm_panic.h>
-#include <linux/vmalloc.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_fb.h"
 #include "display/intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index f9e7cab140f8..bc799f182850 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -8,6 +8,7 @@
 #include <linux/swap.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 7a3e74a6676e..e0d1f369a163 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -12,6 +12,8 @@
 #include <linux/dma-buf.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_gt_requests.h"
 #include "gt/intel_gt.h"
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index e73b369c3347..f859c99f969b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -7,6 +7,7 @@
 #include <linux/mutex.h>
 
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 #include <drm/intel/i915_drm.h>
 
 #include "gem/i915_gem_lmem.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 57bb111d65da..f7455c9c34d8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -5,9 +5,10 @@
 
 #include <linux/shmem_fs.h>
 
+#include <drm/drm_buddy.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
-#include <drm/drm_buddy.h>
 
 #include "i915_drv.h"
 #include "i915_ttm_buddy_manager.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
index 61596cecce4d..4824f948daed 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
@@ -3,6 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index 307a18eede72..77cc3af3d518 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -38,6 +38,8 @@
 #include <linux/swap.h>
 #include <linux/sched/mm.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_gem_ioctls.h"
 #include "i915_gem_object.h"
diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/i915/gem/i915_gemfs.c
index 8f13ec4ff0d0..1f1290214031 100644
--- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
+++ b/drivers/gpu/drm/i915/gem/i915_gemfs.c
@@ -7,6 +7,8 @@
 #include <linux/mount.h>
 #include <linux/fs_context.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_gemfs.h"
 #include "i915_utils.h"
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
index 539c620364e3..3557e9e6f422 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_client_blt.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_selftest.h"
 
 #include "display/intel_display_device.h"
diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
index 78734c404a6d..0d250d57496a 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c
@@ -7,6 +7,8 @@
 #include <linux/highmem.h>
 #include <linux/prime_numbers.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index e9f65f27b53f..071c1cc45257 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -3,6 +3,8 @@
  * Copyright © 2014 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gen8_engine_cs.h"
 #include "intel_engine_regs.h"
 #include "intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
index cc866773ba6f..bf6117d5fc57 100644
--- a/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
+++ b/drivers/gpu/drm/i915/gt/intel_breadcrumbs.c
@@ -8,6 +8,8 @@
 #include <trace/events/dma_fence.h>
 #include <uapi/linux/sched/types.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_trace.h"
 #include "intel_breadcrumbs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
index 8d4bb95f8424..c042b2031577 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_request.h"
 
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..be4bbff1a57c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -7,6 +7,8 @@
 #include <linux/list_sort.h>
 #include <linux/llist.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_engine.h"
 #include "intel_engine_user.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 7f389cb0bde4..3df683b0402a 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -110,6 +110,8 @@
 #include <linux/interrupt.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "gen8_engine_cs.h"
 #include "i915_drv.h"
 #include "i915_list_util.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 46a5aa4ab9c8..08c4e735481b 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -9,6 +9,7 @@
 #include <linux/stop_machine.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/intel/i915_drm.h>
 #include <drm/intel/intel-gtt.h>
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 889e61843ff3..5eda98ebc1ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -5,6 +5,8 @@
 
 #include <linux/highmem.h>
 
+#include <drm/drm_print.h>
+
 #include "display/intel_display.h"
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
index c5f5f0bdfb2c..cc5d345c5e29 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
@@ -5,6 +5,7 @@
 
 #include "intel_ggtt_gmch.h"
 
+#include <drm/drm_print.h>
 #include <drm/intel/intel-gtt.h>
 
 #include <linux/agp_backend.h>
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
index dcd40b30a96b..bd9abbd6d3d4 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_debugfs.c
@@ -5,6 +5,8 @@
 
 #include <linux/debugfs.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_gt.h"
 #include "intel_gt_debugfs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
index 87ef85483bae..96411f357f5d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
@@ -7,6 +7,8 @@
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_gt.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index c481b56fa67d..e8927ad49142 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -3,6 +3,8 @@
  * Copyright © 2014 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_lmem.h"
 
 #include "gen8_engine_cs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_mocs.c b/drivers/gpu/drm/i915/gt/intel_mocs.c
index 5dd8121f4b15..e8d93a657ef6 100644
--- a/drivers/gpu/drm/i915/gt/intel_mocs.c
+++ b/drivers/gpu/drm/i915/gt/intel_mocs.c
@@ -3,6 +3,8 @@
  * Copyright © 2015 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 
 #include "intel_engine.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 932f9f1b06b2..286d49ecc449 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -6,6 +6,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "display/vlv_clock.h"
 #include "gem/i915_gem_region.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 51bb27e10a4f..890183de2277 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_pci.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_renderstate.c b/drivers/gpu/drm/i915/gt/intel_renderstate.c
index 4b56ec3743cf..d53766c288f7 100644
--- a/drivers/gpu/drm/i915/gt/intel_renderstate.c
+++ b/drivers/gpu/drm/i915/gt/intel_renderstate.c
@@ -3,6 +3,8 @@
  * Copyright © 2014 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_sa_media.c b/drivers/gpu/drm/i915/gt/intel_sa_media.c
index 2945526d52d1..fb260d1ec360 100644
--- a/drivers/gpu/drm/i915/gt/intel_sa_media.c
+++ b/drivers/gpu/drm/i915/gt/intel_sa_media.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.c b/drivers/gpu/drm/i915/gt/intel_sseu.c
index 9501d323d0d3..656a499b2706 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.c
@@ -5,6 +5,8 @@
 
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_perf_types.h"
 #include "intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
index c2ee5e1826b5..1dc8205bc64d 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_sseu_debugfs.c
@@ -7,6 +7,8 @@
 #include <linux/bitmap.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_gt_debugfs.h"
 #include "intel_gt_regs.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..843f72829a24 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_internal.h"
 
diff --git a/drivers/gpu/drm/i915/gt/intel_wopcm.c b/drivers/gpu/drm/i915/gt/intel_wopcm.c
index 7ebbcc191c2d..1b26ff6488b3 100644
--- a/drivers/gpu/drm/i915/gt/intel_wopcm.c
+++ b/drivers/gpu/drm/i915/gt/intel_wopcm.c
@@ -3,6 +3,8 @@
  * Copyright © 2017-2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "intel_wopcm.h"
 #include "i915_drv.h"
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 5eb46700dc4e..ab76703f6e8b 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -3,6 +3,8 @@
  * Copyright © 2019 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_selftest.h"
 #include "intel_engine_heartbeat.h"
 #include "intel_engine_pm.h"
diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 0454eb1814bb..0855140c2892 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -5,6 +5,8 @@
 
 #include <linux/prime_numbers.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_engine_heartbeat.h"
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
index 9bd29be7656f..dabb870dcdb1 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
@@ -3,6 +3,8 @@
  * Copyright © 2023 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_context.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 62d14f82256f..8cc6e712b0f7 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -34,6 +34,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "gt/intel_ggtt_fencing.h"
diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index 9bafac1eaf48..295a7b5e1d7c 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -31,6 +31,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 #include "intel_pci_config.h"
diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index d432fdd69833..df04e4ead8ea 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -36,6 +36,8 @@
 
 #include <linux/slab.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "display/intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/display.c
index 74197e337585..06517d1f07a2 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -33,6 +33,7 @@
  */
 
 #include <drm/display/drm_dp.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
index 4f599af766b0..92506c80322d 100644
--- a/drivers/gpu/drm/i915/gvt/dmabuf.c
+++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
@@ -33,6 +33,7 @@
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_dmabuf.h"
 
diff --git a/drivers/gpu/drm/i915/gvt/edid.c b/drivers/gpu/drm/i915/gvt/edid.c
index 2031b97de2b7..30e414381af3 100644
--- a/drivers/gpu/drm/i915/gvt/edid.c
+++ b/drivers/gpu/drm/i915/gvt/edid.c
@@ -33,6 +33,7 @@
  */
 
 #include <drm/display/drm_dp.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_dp_aux_regs.h"
 #include "display/intel_gmbus.h"
diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index ae9b0ded3651..076d9139edc6 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -33,6 +33,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
index f446f73f0fe2..36ea12ade849 100644
--- a/drivers/gpu/drm/i915/gvt/handlers.c
+++ b/drivers/gpu/drm/i915/gvt/handlers.c
@@ -37,6 +37,7 @@
  */
 
 #include <drm/display/drm_dp.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/gvt/interrupt.c
index a956da68e6bd..3e66269bc4ee 100644
--- a/drivers/gpu/drm/i915/gvt/interrupt.c
+++ b/drivers/gpu/drm/i915/gvt/interrupt.c
@@ -31,6 +31,8 @@
 
 #include <linux/eventfd.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "display/intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index c43b47687838..bbeba0d3fca8 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -48,6 +48,7 @@
 #include <linux/nospec.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "intel_gvt.h"
diff --git a/drivers/gpu/drm/i915/gvt/mmio.c b/drivers/gpu/drm/i915/gvt/mmio.c
index db5cd65100fe..214eb7effa31 100644
--- a/drivers/gpu/drm/i915/gvt/mmio.c
+++ b/drivers/gpu/drm/i915/gvt/mmio.c
@@ -34,6 +34,9 @@
  */
 
 #include <linux/vmalloc.h>
+
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "display/intel_display_regs.h"
diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i915/gvt/mmio_context.c
index 0b810baad20a..d4e9d485d382 100644
--- a/drivers/gpu/drm/i915/gvt/mmio_context.c
+++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
@@ -33,6 +33,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_context.h"
 #include "gt/intel_engine_regs.h"
 #include "gt/intel_gpu_commands.h"
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index 6e87c10bc454..63ad1fed525a 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -35,6 +35,8 @@
 
 #include <linux/kthread.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_context.h"
 #include "gt/intel_execlists_submission.h"
diff --git a/drivers/gpu/drm/i915/gvt/vgpu.c b/drivers/gpu/drm/i915/gvt/vgpu.c
index 11260392234a..c49e4bf95a30 100644
--- a/drivers/gpu/drm/i915/gvt/vgpu.c
+++ b/drivers/gpu/drm/i915/gvt/vgpu.c
@@ -31,6 +31,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "gvt.h"
 #include "i915_pvinfo.h"
diff --git a/drivers/gpu/drm/i915/i915_cmd_parser.c b/drivers/gpu/drm/i915/i915_cmd_parser.c
index 2905df83e180..7654f1be8d3b 100644
--- a/drivers/gpu/drm/i915/i915_cmd_parser.c
+++ b/drivers/gpu/drm/i915/i915_cmd_parser.c
@@ -28,6 +28,7 @@
 #include <linux/highmem.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index c2e38d4bcd01..42f6b44f0027 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -32,6 +32,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_context.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index e14a0c3db999..638fe20dfe54 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -37,6 +37,7 @@
 #include <linux/mman.h>
 
 #include <drm/drm_cache.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "gem/i915_gem_clflush.h"
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6fcda6d7b5b7..cf47c2491a0a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -2,6 +2,8 @@
  * SPDX-License-Identifier: MIT
  */
 
+#include <drm/drm_print.h>
+
 #include "display/intel_overlay.h"
 #include "gem/i915_gem_mman.h"
 #include "gt/intel_engine_user.h"
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index e0a0bd687f1b..1898be4ddc8b 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -32,6 +32,7 @@
 #include <linux/sysrq.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_display_irq.h"
 #include "display/intel_hotplug.h"
diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
index 5862754c662c..5d9c35b5a182 100644
--- a/drivers/gpu/drm/i915/i915_module.c
+++ b/drivers/gpu/drm/i915/i915_module.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_object.h"
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index d8f69bba79a9..a6697db21c72 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -6,6 +6,8 @@
 
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_engine.h"
 #include "gt/intel_engine_pm.h"
 #include "gt/intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
index 14d9ec0ed777..0c55fb6e9727 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -6,6 +6,8 @@
 
 #include <linux/nospec.h>
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_perf.h"
 #include "i915_query.h"
diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index b9a2b2194c8f..4399941236cb 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -31,6 +31,8 @@
 #include <linux/sched/signal.h>
 #include <linux/sched/mm.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_context.h"
 #include "gt/intel_breadcrumbs.h"
 #include "gt/intel_context.h"
diff --git a/drivers/gpu/drm/i915/i915_switcheroo.c b/drivers/gpu/drm/i915/i915_switcheroo.c
index d5b6d8ab31a2..7e0791024282 100644
--- a/drivers/gpu/drm/i915/i915_switcheroo.c
+++ b/drivers/gpu/drm/i915/i915_switcheroo.c
@@ -5,6 +5,8 @@
 
 #include <linux/vga_switcheroo.h>
 
+#include <drm/drm_print.h>
+
 #include "display/intel_display_device.h"
 
 #include "i915_driver.h"
diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 622c66666935..70e0d8615160 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -30,6 +30,8 @@
 #include <linux/stat.h>
 #include <linux/sysfs.h>
 
+#include <drm/drm_print.h>
+
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_rc6.h"
 #include "gt/intel_rps.h"
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 942345548bc3..d5c6e6605086 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -5,11 +5,11 @@
 
 #include <linux/slab.h>
 
+#include <drm/drm_buddy.h>
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_bo.h>
 
-#include <drm/drm_buddy.h>
-
 #include "i915_ttm_buddy_manager.h"
 
 #include "i915_gem.h"
diff --git a/drivers/gpu/drm/i915/i915_utils.c b/drivers/gpu/drm/i915/i915_utils.c
index 49f7ed413132..89b920ccbccb 100644
--- a/drivers/gpu/drm/i915/i915_utils.c
+++ b/drivers/gpu/drm/i915/i915_utils.c
@@ -6,6 +6,7 @@
 #include <linux/device.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "i915_drv.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/i915/i915_vgpu.c b/drivers/gpu/drm/i915/i915_vgpu.c
index c97323973f9b..d29a06ea51a5 100644
--- a/drivers/gpu/drm/i915/i915_vgpu.c
+++ b/drivers/gpu/drm/i915/i915_vgpu.c
@@ -21,6 +21,8 @@
  * SOFTWARE.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_pvinfo.h"
 #include "i915_vgpu.h"
diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
index 25e97031d76e..ef9c272e60e5 100644
--- a/drivers/gpu/drm/i915/i915_vma.c
+++ b/drivers/gpu/drm/i915/i915_vma.c
@@ -24,7 +24,9 @@
 
 #include <linux/sched/mm.h>
 #include <linux/dma-fence-array.h>
+
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_fb.h"
 #include "display/intel_frontbuffer.h"
diff --git a/drivers/gpu/drm/i915/intel_clock_gating.c b/drivers/gpu/drm/i915/intel_clock_gating.c
index 467740969431..175a240ac848 100644
--- a/drivers/gpu/drm/i915/intel_clock_gating.c
+++ b/drivers/gpu/drm/i915/intel_clock_gating.c
@@ -25,6 +25,8 @@
  *
  */
 
+#include <drm/drm_print.h>
+
 #include "display/i9xx_plane_regs.h"
 #include "display/intel_display.h"
 #include "display/intel_display_core.h"
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index dae9dce7d1b3..c3efc3454ec2 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -21,6 +21,8 @@
  * SOFTWARE.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_vgpu.h"
 #include "intel_gvt.h"
diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
index 59bd603e6deb..ce722f20cab1 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/intel_memory_region.c
@@ -5,6 +5,7 @@
 
 #include <linux/prandom.h>
 
+#include <drm/drm_print.h>
 #include <uapi/drm/i915_drm.h>
 
 #include "intel_memory_region.h"
diff --git a/drivers/gpu/drm/i915/intel_pcode.c b/drivers/gpu/drm/i915/intel_pcode.c
index 55ffedad2490..756652b8ec97 100644
--- a/drivers/gpu/drm/i915/intel_pcode.c
+++ b/drivers/gpu/drm/i915/intel_pcode.c
@@ -3,6 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "i915_wait_util.h"
diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
index 285b96fadfd5..60a2af5307fc 100644
--- a/drivers/gpu/drm/i915/intel_step.c
+++ b/drivers/gpu/drm/i915/intel_step.c
@@ -3,6 +3,8 @@
  * Copyright © 2020,2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "intel_step.h"
 
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index aba90b80854f..4adeb271fcbf 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "display/intel_display_core.h"
 #include "gt/intel_engine_regs.h"
diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
index 7fa194de5d35..b1883dccc22a 100644
--- a/drivers/gpu/drm/i915/intel_wakeref.c
+++ b/drivers/gpu/drm/i915/intel_wakeref.c
@@ -6,6 +6,8 @@
 
 #include <linux/wait_bit.h>
 
+#include <drm/drm_print.h>
+
 #include "intel_runtime_pm.h"
 #include "intel_wakeref.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp.c b/drivers/gpu/drm/i915/pxp/intel_pxp.c
index 27d545c4e6a5..d4b0c76f335b 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp.c
@@ -5,6 +5,8 @@
 
 #include <linux/workqueue.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_context.h"
 #include "gt/intel_context.h"
 #include "gt/intel_gt.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
index 75df959b0aa0..2763773e627d 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2023 Intel Corporation.
  */
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 
 #include "gt/intel_context.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
index 0e609547bef8..9fc575a3d0d5 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2021-2022, Intel Corporation. All rights reserved.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 
 #include "gem/i915_gem_region.h"
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
index 091c86e03d1a..1e63261b620f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_session.c
@@ -3,6 +3,8 @@
  * Copyright(c) 2020, Intel Corporation. All rights reserved.
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 
 #include "intel_pxp.h"
diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
index 0d89d70b9c36..36c3a5460221 100644
--- a/drivers/gpu/drm/i915/selftests/i915_active.c
+++ b/drivers/gpu/drm/i915/selftests/i915_active.c
@@ -7,6 +7,8 @@
 #include <linux/kref.h>
 #include <linux/string_helpers.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_pm.h"
 #include "gt/intel_gt.h"
 
diff --git a/drivers/gpu/drm/i915/selftests/i915_request.c b/drivers/gpu/drm/i915/selftests/i915_request.c
index 48cd617247d1..1260601bda1f 100644
--- a/drivers/gpu/drm/i915/selftests/i915_request.c
+++ b/drivers/gpu/drm/i915/selftests/i915_request.c
@@ -26,6 +26,8 @@
 #include <linux/prime_numbers.h>
 #include <linux/sort.h>
 
+#include <drm/drm_print.h>
+
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_pm.h"
 #include "gem/selftests/mock_context.h"
diff --git a/drivers/gpu/drm/i915/soc/intel_dram.c b/drivers/gpu/drm/i915/soc/intel_dram.c
index 8841cfe1cac8..2e16346a6cc0 100644
--- a/drivers/gpu/drm/i915/soc/intel_dram.c
+++ b/drivers/gpu/drm/i915/soc/intel_dram.c
@@ -6,6 +6,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "../display/intel_display_core.h" /* FIXME */
 
diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index f210c9655b53..271da30c8290 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -8,6 +8,7 @@
 #include <linux/vgaarb.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/intel/i915_drm.h>
 
 #include "../display/intel_display_core.h" /* FIXME */
diff --git a/drivers/gpu/drm/i915/vlv_iosf_sb.c b/drivers/gpu/drm/i915/vlv_iosf_sb.c
index f4b386933141..38a75651b0dc 100644
--- a/drivers/gpu/drm/i915/vlv_iosf_sb.c
+++ b/drivers/gpu/drm/i915/vlv_iosf_sb.c
@@ -3,6 +3,8 @@
  * Copyright © 2013-2021 Intel Corporation
  */
 
+#include <drm/drm_print.h>
+
 #include "i915_drv.h"
 #include "i915_iosf_mbi.h"
 #include "i915_reg.h"
diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 2bbdc05a3b97..9294b4ba1de7 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -10,6 +10,7 @@
 #include "pvr_power.h"
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <linux/compiler.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/imagination/pvr_fw.c
index b2f8cba77346..779a58fe6ee8 100644
--- a/drivers/gpu/drm/imagination/pvr_fw.c
+++ b/drivers/gpu/drm/imagination/pvr_fw.c
@@ -17,6 +17,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
 #include <linux/math.h>
diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 60db3668ad3c..9ff03bc60a08 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -16,6 +16,8 @@
 #include <linux/ktime.h>
 #include <linux/types.h>
 
+#include <drm/drm_print.h>
+
 #define ROGUE_FW_HEAP_META_SHIFT 25 /* 32 MB */
 
 #define POLL_TIMEOUT_USEC 1000000
diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm/imagination/pvr_fw_trace.c
index a1098b521485..8a56952f6730 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
@@ -9,6 +9,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include <linux/build_bug.h>
 #include <linux/dcache.h>
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index c6e7ff9e935d..b9f801c63260 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/interrupt.h>
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 3d97990170bf..48e52c5561be 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -13,6 +13,7 @@
 #include <drm/drm_exec.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gpuvm.h>
+#include <drm/drm_print.h>
 
 #include <linux/bug.h>
 #include <linux/container_of.h>
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 3a063a53c8df..0b99b407ac0a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "dcss-dev.h"
 #include "dcss-kms.h"
diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index df19560e41b4..db50eccea0ca 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include <video/imx-ipu-v3.h>
 
diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index 8d6a0bb31c48..e200b40f30fe 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 32cda134ae3e..7c2eb1152fc2 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 9562fe6711ff..a935ff1503cd 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "kmb_drv.h"
 #include "kmb_plane.h"
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 739e8c6c6d90..9a1e6b9ecbe5 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -8,6 +8,8 @@
 #include <linux/vmalloc.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "lima_devfreq.h"
 #include "lima_drv.h"
 #include "lima_sched.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.c b/drivers/gpu/drm/loongson/lsdc_benchmark.c
index b088646a2ff9..659173381814 100644
--- a/drivers/gpu/drm/loongson/lsdc_benchmark.c
+++ b/drivers/gpu/drm/loongson/lsdc_benchmark.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_benchmark.h"
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c b/drivers/gpu/drm/loongson/lsdc_crtc.c
index 03958b79f251..a5b7d5c5fd20 100644
--- a/drivers/gpu/drm/loongson/lsdc_crtc.c
+++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_debugfs.c b/drivers/gpu/drm/loongson/lsdc_debugfs.c
index b9c2e6b1701f..19aa7ef577de 100644
--- a/drivers/gpu/drm/loongson/lsdc_debugfs.c
+++ b/drivers/gpu/drm/loongson/lsdc_debugfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_benchmark.h"
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_drv.c b/drivers/gpu/drm/loongson/lsdc_drv.c
index 12193d2a301a..abf5bf68eec2 100644
--- a/drivers/gpu/drm/loongson/lsdc_drv.c
+++ b/drivers/gpu/drm/loongson/lsdc_drv.c
@@ -15,6 +15,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
index c29dd730a894..6372db2d3093 100644
--- a/drivers/gpu/drm/loongson/lsdc_gem.c
+++ b/drivers/gpu/drm/loongson/lsdc_gem.c
@@ -10,6 +10,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_gem.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_i2c.c b/drivers/gpu/drm/loongson/lsdc_i2c.c
index ce90c25536d2..012b4761c538 100644
--- a/drivers/gpu/drm/loongson/lsdc_i2c.c
+++ b/drivers/gpu/drm/loongson/lsdc_i2c.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_output.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_irq.c b/drivers/gpu/drm/loongson/lsdc_irq.c
index efdc4d10792d..e8b7cc327f04 100644
--- a/drivers/gpu/drm/loongson/lsdc_irq.c
+++ b/drivers/gpu/drm/loongson/lsdc_irq.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2023 Loongson Technology Corporation Limited
  */
 
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "lsdc_irq.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
index 600ed4fb0884..ccca67e01fd9 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a1000.c
@@ -5,6 +5,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
index 2bd797a9b9ff..aa7daee4c065 100644
--- a/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
+++ b/drivers/gpu/drm/loongson/lsdc_output_7a2000.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "lsdc_drv.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_pixpll.c b/drivers/gpu/drm/loongson/lsdc_pixpll.c
index 2609a2256da4..51b9a032cf43 100644
--- a/drivers/gpu/drm/loongson/lsdc_pixpll.c
+++ b/drivers/gpu/drm/loongson/lsdc_pixpll.c
@@ -6,6 +6,7 @@
 #include <linux/delay.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 
diff --git a/drivers/gpu/drm/loongson/lsdc_plane.c b/drivers/gpu/drm/loongson/lsdc_plane.c
index 2967a5cca069..9675344128d0 100644
--- a/drivers/gpu/drm/loongson/lsdc_plane.c
+++ b/drivers/gpu/drm/loongson/lsdc_plane.c
@@ -9,6 +9,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_regs.h"
diff --git a/drivers/gpu/drm/loongson/lsdc_ttm.c b/drivers/gpu/drm/loongson/lsdc_ttm.c
index 2e42c6970c9f..383a758bbd7e 100644
--- a/drivers/gpu/drm/loongson/lsdc_ttm.c
+++ b/drivers/gpu/drm/loongson/lsdc_ttm.c
@@ -8,6 +8,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "lsdc_drv.h"
 #include "lsdc_ttm.h"
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 52043a12a2e8..257a6e84dd58 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index bc7527542fdc..68646a61f74d 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
index a172456d1d7b..024cc7e9036c 100644
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -11,6 +11,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 
 #include "mtk_drm_drv.h"
 #include "mtk_gem.h"
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 1b5667ddbb03..c22166476423 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -11,6 +11,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <linux/align.h>
 
 #include "mtk_crtc.h"
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 7f98de38842b..783572b16963 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -16,6 +16,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "meson_overlay.h"
 #include "meson_registers.h"
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b43ac61201f3..f8d0e0874a5d 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -20,6 +20,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "meson_plane.h"
 #include "meson_registers.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 32cd8ac018c0..a32be27c39e8 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
 #include <drm/drm_pciids.h>
+#include <drm/drm_print.h>
 
 #include "mgag200_drv.h"
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200.c b/drivers/gpu/drm/mgag200/mgag200_g200.c
index f874e2949840..a5e291b344db 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh.c b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
index e2305f8e00f8..d2aa931f579d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
index 11ae76eb081d..7bea7a728f56 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh3.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
index e2a2942a80a0..36da6529d74f 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200eh5.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c b/drivers/gpu/drm/mgag200/mgag200_g200er.c
index 23debc70dc54..8fa8fe943abf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
index f8796e2b7a0f..3fadbeb10af9 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
index 31624c9ab7b7..e387a455eae5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200ew3.c
@@ -6,6 +6,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
index e80da12ba1fe..a0ac19ee0353 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_g200wb.c b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
index a0e7b9ad46cd..d847fa8ded8c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_g200wb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_g200wb.c
@@ -7,6 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_drv.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga.c b/drivers/gpu/drm/mgag200/mgag200_vga.c
index 60568f32736d..b07c1362ddd4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga.c
@@ -2,6 +2,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_ddc.h"
diff --git a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
index a5a3ac108bd5..a855f1734316 100644
--- a/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_vga_bmc.c
@@ -3,6 +3,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "mgag200_ddc.h"
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1c3b33be6c40..72eb0de46b54 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -26,6 +26,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "lcdif_drv.h"
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7ed2516b6de0..8cac0a275b7d 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -26,6 +26,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "mxsfb_drv.h"
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..84a275b06295 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -49,6 +49,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/omapdrm/omap_crtc.c b/drivers/gpu/drm/omapdrm/omap_crtc.c
index 63ddc5127f7b..1c2a1920c0a6 100644
--- a/drivers/gpu/drm/omapdrm/omap_crtc.c
+++ b/drivers/gpu/drm/omapdrm/omap_crtc.c
@@ -10,6 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_mode.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index a3d470468e5b..9edc1b3f9f95 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -11,6 +11,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "omap_drv.h"
 #include "omap_dmm_tiler.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 3fff32c000a6..bbe427ab43c1 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -26,6 +26,8 @@
 #include <linux/vmalloc.h>
 #include <linux/wait.h>
 
+#include <drm/drm_print.h>
+
 #include "omap_dmm_tiler.h"
 #include "omap_dmm_priv.h"
 
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 794267f0f007..1b96343226a5 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/omapdrm/omap_fb.c b/drivers/gpu/drm/omapdrm/omap_fb.c
index bb3105556f19..b8c249ec1891 100644
--- a/drivers/gpu/drm/omapdrm/omap_fb.c
+++ b/drivers/gpu/drm/omapdrm/omap_fb.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b5df2923d2a6..d89761f13cd7 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -15,6 +15,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 78563a8d8732..71e79f53489a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -12,6 +12,7 @@
 
 #include <drm/drm_dumb_buffers.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
index a6f0bbc879d2..943c5307da00 100644
--- a/drivers/gpu/drm/omapdrm/omap_irq.c
+++ b/drivers/gpu/drm/omapdrm/omap_irq.c
@@ -5,6 +5,7 @@
  */
 
 #include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
 
 #include "omap_drv.h"
 
diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index fb97c74386f2..6fb7510cbebb 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -6,6 +6,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index d74ef6694c10..f9698890c989 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -10,6 +10,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 
 #include "omap_dmm_tiler.h"
 #include "omap_drv.h"
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index ac05df2a54fe..b51c30778811 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -8,6 +8,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 
+#include <drm/drm_print.h>
+
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 1c3c574cd64a..7d8c7c337606 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -16,6 +16,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 #include <drm/drm_utils.h>
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 0528de674a4f..8041b65c6609 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -8,6 +8,7 @@
 #include <linux/dma-mapping.h>
 
 #include <drm/panfrost_drm.h>
+#include <drm/drm_print.h>
 #include "panfrost_device.h"
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 8d049a07d393..483d278eb154 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -12,6 +12,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "panfrost_device.h"
 #include "panfrost_features.h"
 #include "panfrost_issues.h"
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 02ccc05e23bb..8f3b7a7b6ad0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -2,6 +2,7 @@
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
 #include <drm/panfrost_drm.h>
+#include <drm/drm_print.h>
 
 #include <linux/atomic.h>
 #include <linux/bitfield.h>
diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2df1d76d84a0..7d1425a84382 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -8,6 +8,7 @@
 #include <linux/pm_opp.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index c7033d82cef5..f488b8dd62e8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -13,6 +13,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index fb4b293f17f0..a1cd31c2ca09 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -20,6 +20,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_exec.h>
 #include <drm/drm_ioctl.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 #include <drm/drm_utils.h>
 #include <drm/gpu_scheduler.h>
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index df767e82148a..0d6c6bb1e0ea 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -16,6 +16,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 156c7a0b62a2..7e7d2f223cfa 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -8,6 +8,7 @@
 #include <linux/err.h>
 #include <linux/slab.h>
 
+#include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
 #include "panthor_device.h"
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9d98720ce03f..eda670229184 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "panthor_device.h"
 #include "panthor_gpu.h"
diff --git a/drivers/gpu/drm/panthor/panthor_heap.c b/drivers/gpu/drm/panthor/panthor_heap.c
index d236e9ceade4..0b6ff4c0a11b 100644
--- a/drivers/gpu/drm/panthor/panthor_heap.c
+++ b/drivers/gpu/drm/panthor/panthor_heap.c
@@ -4,6 +4,7 @@
 #include <linux/iosys-map.h>
 #include <linux/rwsem.h>
 
+#include <drm/drm_print.h>
 #include <drm/panthor_drm.h>
 
 #include "panthor_device.h"
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4f2858114e5e..c44033a0bba8 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 /* Copyright 2025 ARM Limited. All rights reserved. */
 
+#include <drm/drm_print.h>
+
 #include "panthor_device.h"
 #include "panthor_hw.h"
 #include "panthor_regs.h"
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 5bfdc0ebf8fb..bfc0f3a46166 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -7,6 +7,7 @@
 #include <drm/drm_exec.h>
 #include <drm/drm_gpuvm.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index f5e01cb16cfc..fc0826db8f48 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -5,6 +5,7 @@
 #include <drm/drm_exec.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 6d567e5c7c6f..3a9661b9b1fc 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -20,6 +20,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "pl111_drm.h"
diff --git a/drivers/gpu/drm/qxl/qxl_cmd.c b/drivers/gpu/drm/qxl/qxl_cmd.c
index d6ea01f3797b..2e3200db2f39 100644
--- a/drivers/gpu/drm/qxl/qxl_cmd.c
+++ b/drivers/gpu/drm/qxl/qxl_cmd.c
@@ -27,6 +27,7 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
 #include "qxl_drv.h"
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..b66b14b08b61 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -30,6 +30,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index b7d0e60c0de2..a134820aac58 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -34,6 +34,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb..2bbb1168a3ff 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -44,6 +44,7 @@
 #include <drm/drm_module.h>
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/qxl/qxl_gem.c b/drivers/gpu/drm/qxl/qxl_gem.c
index d26043424e95..4939b57a2a48 100644
--- a/drivers/gpu/drm/qxl/qxl_gem.c
+++ b/drivers/gpu/drm/qxl/qxl_gem.c
@@ -24,6 +24,7 @@
  */
 
 #include <drm/drm.h>
+#include <drm/drm_print.h>
 
 #include "qxl_drv.h"
 #include "qxl_object.h"
diff --git a/drivers/gpu/drm/qxl/qxl_image.c b/drivers/gpu/drm/qxl/qxl_image.c
index ffff54e5fb31..3cc45997533d 100644
--- a/drivers/gpu/drm/qxl/qxl_image.c
+++ b/drivers/gpu/drm/qxl/qxl_image.c
@@ -26,6 +26,8 @@
 #include <linux/gfp.h>
 #include <linux/slab.h>
 
+#include <drm/drm_print.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_ioctl.c b/drivers/gpu/drm/qxl/qxl_ioctl.c
index 506ae1f5e099..336cbff26089 100644
--- a/drivers/gpu/drm/qxl/qxl_ioctl.c
+++ b/drivers/gpu/drm/qxl/qxl_ioctl.c
@@ -26,6 +26,8 @@
 #include <linux/pci.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_print.h>
+
 #include "qxl_drv.h"
 #include "qxl_object.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_irq.c b/drivers/gpu/drm/qxl/qxl_irq.c
index 665278ee3b6d..4018bcf808e5 100644
--- a/drivers/gpu/drm/qxl/qxl_irq.c
+++ b/drivers/gpu/drm/qxl/qxl_irq.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "qxl_drv.h"
 
diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index dc3828db1991..461b7ab9ad5c 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -28,6 +28,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "qxl_drv.h"
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 05204a6a3fa8..7b3c9a6016db 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -22,6 +22,8 @@
 
 #include <linux/delay.h>
 
+#include <drm/drm_print.h>
+
 #include <trace/events/dma_fence.h>
 
 #include "qxl_drv.h"
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 765a144cea14..a6dd2d1f1004 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -28,6 +28,7 @@
 #include <drm/drm.h>
 #include <drm/drm_file.h>
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 #include <drm/qxl_drm.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 63c47585afbc..527b9d19d730 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -80,6 +80,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_audio_component.h>
 #include <drm/drm_suballoc.h>
+#include <drm/drm_print.h>
 
 #include "radeon_family.h"
 #include "radeon_mode.h"
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7e175dbfd892..289f245c517e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -17,6 +17,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "rcar_cmm.h"
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index d948ff3594c4..031d07f4508e 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -24,6 +24,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "rcar_du_drv.h"
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 937f83cf42fc..d30fef00c34c 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -28,6 +28,7 @@
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b7e3f5dcf8d5..177e30445ee8 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -21,6 +21,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
index 924fb1d3ece2..0dc3804051a9 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-reg.c
@@ -11,6 +11,8 @@
 #include <linux/iopoll.h>
 #include <linux/reset.h>
 
+#include <drm/drm_print.h>
+
 #include "cdn-dp-core.h"
 #include "cdn-dp-reg.h"
 
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index de8405ee8241..2dad6b7b61b2 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -24,6 +24,7 @@
 #include <drm/bridge/dw_mipi_dsi.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "rockchip_drm_drv.h"
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421..9f7a8cf0ab44 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a..997429115068 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -10,6 +10,7 @@
 #include <drm/display/drm_hdmi_state_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index eb77bde9f628..c5c6e2b5772d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 3bd06202e232..df9a8bff2e22 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -14,6 +14,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
 #include "rockchip_drm_drv.h"
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 5369b77ea434..ad4ab894391a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -27,6 +27,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 2411260db51d..75f898a10cbc 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -22,6 +22,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 811020665120..5c0c6e2cc28d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -15,6 +15,7 @@
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/sitronix/st7586.c b/drivers/gpu/drm/sitronix/st7586.c
index a29672d84ede..b57ebf37a664 100644
--- a/drivers/gpu/drm/sitronix/st7586.c
+++ b/drivers/gpu/drm/sitronix/st7586.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 /* controller-specific commands */
diff --git a/drivers/gpu/drm/sitronix/st7735r.c b/drivers/gpu/drm/sitronix/st7735r.c
index 1d60f6e5b3bc..c1f8228495f6 100644
--- a/drivers/gpu/drm/sitronix/st7735r.c
+++ b/drivers/gpu/drm/sitronix/st7735r.c
@@ -24,6 +24,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_print.h>
 
 #define ST7735R_FRMCTR1		0xb1
 #define ST7735R_FRMCTR2		0xb2
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 7e2e69ce890f..96cf39320137 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -33,6 +33,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "ssd130x.h"
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index c59fcb4dca32..4e12a465be7f 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -14,6 +14,7 @@
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_cursor.h"
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index 5e9332df21df..4980aadb218e 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index f046f5f7ad25..1e5aa8c30645 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -16,6 +16,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_gdp.h"
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index b76606e9a82d..57ef4ba3554e 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -20,6 +20,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 29e669ccec5b..948f947b5cad 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -12,6 +12,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 
 #include "sti_compositor.h"
 #include "sti_drv.h"
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index ab00d1a6140c..56d53ac3082d 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index d1501e86a5b1..f7e847cfa38f 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -34,6 +34,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 2dded3b828df..40405a52a073 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -23,6 +23,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_backend.h"
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index c11dfb2739fa..8a409eee1dca 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 5ab1604f12dd..5e9c4b97c84c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -19,6 +19,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_print.h>
 
 #include "sun4i_drv.h"
 #include "sun4i_frontend.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 31a8409b98f4..e2a532e11183 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -21,6 +21,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun4i_drv.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 94ac6ad6f306..6108dda1e414 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -18,6 +18,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun8i_mixer.h"
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1f77e1d29845..de2fe1942840 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -11,6 +11,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "sun8i_csc.h"
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index 1883c4a8604c..1b683d55d6ea 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include <video/edid.h>
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 8d8ab39c5f36..d38ba70f4e0d 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm_sysfb_helper.h"
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 9b16d5164ef4..7a95d2dacd9d 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm_sysfb_helper.h"
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index c318df0adad5..7b7b5ba26317 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include <video/edid.h>
diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0f80da3544c9..5d0f0a8de8ff 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -27,6 +27,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 4596073fe28f..4bf10c1bc373 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -22,6 +22,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index b5089b772267..ae7aeb8e90ef 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index dd041089f797..1cef8c5cac50 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -13,6 +13,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include "drm.h"
 #include "gem.h"
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index c4820f5e7658..0adcd4244a42 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -28,6 +28,7 @@
 #include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index 8f779f23dc09..c924ffba4094 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -20,6 +20,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm.h"
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index bc7dd562cf6b..4023cb5998f1 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -24,6 +24,7 @@
 #include <drm/drm_eld.h>
 #include <drm/drm_file.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_simple_kms_helper.h>
 
 #include "dc.h"
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 6174d0929020..aec9eccdeae9 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -14,6 +14,7 @@
 #include <linux/ktime.h>
 
 #include <drm/drm_mm.h>
+#include <drm/drm_print.h>
 
 #include "../lib/drm_random.h"
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 8fcc6a2f9477..722b6e7b232c 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_gem_dma_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "tidss_crtc.h"
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index d0b191c470ca..7892168d3f3d 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -27,6 +27,7 @@
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 
 #include "tidss_crtc.h"
 #include "tidss_dispc.h"
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 71e874c19610..222e4ae1abbd 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -21,6 +21,7 @@
 #include <drm/drm_module.h>
 #include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
index f728fa48ac88..9ba0eab489bb 100644
--- a/drivers/gpu/drm/tiny/cirrus-qemu.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -44,6 +44,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_module.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index fb0004166f4a..d73dfebb4353 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -25,6 +25,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index df263818f45f..9f26aaca0bfa 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -25,6 +25,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 #define HX8357D_SETOSC 0xb0
diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
index 62cadf5e033d..7c154c008344 100644
--- a/drivers/gpu/drm/tiny/ili9163.c
+++ b/drivers/gpu/drm/tiny/ili9163.c
@@ -15,6 +15,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 6de44ff69b51..d32538b1eb09 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -29,6 +29,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 #define ILI9225_DRIVER_READ_CODE	0x00
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index e55029433509..2ab750cba505 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -24,6 +24,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 #define ILI9341_FRMCTR1		0xb1
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 093661c771a0..1e411a0f4567 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -23,6 +23,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #define ILI9486_ITFCTR1         0xb0
 #define ILI9486_PWCTRL1         0xc2
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index b6b4664908ae..a063eff77624 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -22,6 +22,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 #include <video/mipi_display.h>
 
 #define ILI9341_FRMCTR1		0xb1
diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 23914a9f7fd3..82dfa169f762 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_mipi_dbi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_print.h>
 
 #include <video/mipi_display.h>
 
diff --git a/drivers/gpu/drm/tiny/pixpaper.c b/drivers/gpu/drm/tiny/pixpaper.c
index 32598fb2fee7..df3ec42edd57 100644
--- a/drivers/gpu/drm/tiny/pixpaper.c
+++ b/drivers/gpu/drm/tiny/pixpaper.c
@@ -17,6 +17,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 /*
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 4824f863fdba..c8270591afc7 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -36,6 +36,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_rect.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
index d7eb6471f2ed..dd395229e388 100644
--- a/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
+++ b/drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/export.h>
+#include <linux/module.h>
 
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_device.h>
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index fba2a68a556e..44559dbf62f9 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -31,6 +31,7 @@
 
 #define pr_fmt(fmt) "[TTM] " fmt
 
+#include <drm/drm_print.h>
 #include <drm/ttm/ttm_bo.h>
 #include <drm/ttm/ttm_placement.h>
 #include <drm/ttm/ttm_tt.h>
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index d93d1bef6768..1a39c30f22fb 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -34,6 +34,7 @@
 #include <drm/ttm/ttm_resource.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 
 /* Detach the cursor from the bulk move list*/
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 506e257dfba8..705c7d2f5798 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -40,6 +40,7 @@
 #include <linux/shmem_fs.h>
 #include <drm/drm_cache.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/drm_util.h>
 #include <drm/ttm/ttm_backup.h>
 #include <drm/ttm/ttm_bo.h>
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 37bdd976ae59..26b6c65ef6fd 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -21,6 +21,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include "tve200_drm.h"
diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
index 12f48ae17073..af4cff2a7c51 100644
--- a/drivers/gpu/drm/udl/udl_edid.c
+++ b/drivers/gpu/drm/udl/udl_edid.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include "udl_drv.h"
 #include "udl_edid.h"
diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index c41476ddde68..d9547f5117b9 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -18,6 +18,8 @@
 #include <linux/dma-buf.h>
 #include <linux/vmalloc.h>
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 #include "uapi/drm/v3d_drm.h"
 
diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index 7e789e181af0..89f24eec62a7 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -8,6 +8,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_print.h>
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index c5a3bbbc74c5..e8a46c8bad8a 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -25,6 +25,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <uapi/drm/v3d_drm.h>
 
 #include "v3d_drv.h"
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index bb110d35f749..5a180dc6c452 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -11,6 +11,7 @@
 #include <linux/uaccess.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "v3d_drv.h"
 #include "v3d_regs.h"
diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
index c1a30166c099..bf351fc0d488 100644
--- a/drivers/gpu/drm/v3d/v3d_gemfs.c
+++ b/drivers/gpu/drm/v3d/v3d_gemfs.c
@@ -5,6 +5,8 @@
 #include <linux/mount.h>
 #include <linux/fs_context.h>
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 
 void v3d_gemfs_init(struct v3d_dev *v3d)
diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 31ecc5b4ba5a..b55880fd6c50 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -16,6 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/sched/clock.h>
 
+#include <drm/drm_print.h>
+
 #include "v3d_drv.h"
 #include "v3d_regs.h"
 #include "v3d_trace.h"
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 0ec06bfbbebb..0867250db7a6 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -21,6 +21,7 @@
 #include <linux/sched/clock.h>
 #include <linux/kthread.h>
 
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "v3d_drv.h"
diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index f3652e90683c..7de5a95ee7ca 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2023 Raspberry Pi
  */
 
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "v3d_drv.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_irq.c b/drivers/gpu/drm/vboxvideo/vbox_irq.c
index 903a6c48ee8b..37c66668df57 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_irq.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_irq.c
@@ -12,6 +12,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "vbox_drv.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index 7f686a0190e6..aa6664542b20 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -12,6 +12,7 @@
 #include <linux/vbox_err.h>
 
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_print.h>
 
 #include "vbox_drv.h"
 #include "vboxvideo_guest.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index aa0dded595b6..d363c3f0afdf 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -22,6 +22,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include "hgsmi_channels.h"
diff --git a/drivers/gpu/drm/vboxvideo/vbox_ttm.c b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
index dc24c2172fd4..19bf8d023dc8 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_ttm.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_ttm.c
@@ -8,6 +8,7 @@
  */
 #include <linux/pci.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include "vbox_drv.h"
 
 int vbox_mm_init(struct vbox_private *vbox)
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 4aaa587be3a5..46b4474ac41d 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -19,6 +19,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 
 #include "vc4_drv.h"
 #include "uapi/drm/vc4_drm.h"
diff --git a/drivers/gpu/drm/vc4/vc4_debugfs.c b/drivers/gpu/drm/vc4/vc4_debugfs.c
index fac624a663ea..e765904e13f3 100644
--- a/drivers/gpu/drm/vc4/vc4_debugfs.c
+++ b/drivers/gpu/drm/vc4/vc4_debugfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include <linux/seq_file.h>
 #include <linux/circ_buf.h>
diff --git a/drivers/gpu/drm/vc4/vc4_dpi.c b/drivers/gpu/drm/vc4/vc4_dpi.c
index 960550c166d9..2afc88394d64 100644
--- a/drivers/gpu/drm/vc4/vc4_dpi.c
+++ b/drivers/gpu/drm/vc4/vc4_dpi.c
@@ -17,6 +17,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index c7cb1e3a6434..3846996f9028 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -36,6 +36,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 458e5d987964..deeeaebc702f 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -36,6 +36,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 255e5817618e..ab16164b5eda 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -30,6 +30,7 @@
 #include <linux/dma-fence-array.h>
 
 #include <drm/drm_exec.h>
+#include <drm/drm_print.h>
 #include <drm/drm_syncobj.h>
 
 #include "uapi/drm/vc4_drm.h"
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 049c92dd5d27..1798d1156d10 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -39,6 +39,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4811d794001f..ee8d0738501b 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -26,6 +26,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
 #include <soc/bcm2835/raspberrypi-firmware.h>
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 69b399f3b802..63e88f90eef7 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -48,6 +48,7 @@
 #include <linux/platform_device.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_print.h>
 
 #include "vc4_drv.h"
 #include "vc4_regs.h"
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 8f983edb81ff..e563c1210937 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -19,6 +19,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index f1342f917cf7..1ac80c0b258f 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -9,6 +9,8 @@
  * The V3D block provides 16 hardware counters which can count various events.
  */
 
+#include <drm/drm_print.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b4a53f68865b..f00d4076ba07 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -24,6 +24,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_print.h>
 
 #include "uapi/drm/vc4_drm.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index 14079853338e..edc471e71c0e 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -35,6 +35,8 @@
  * actually fairly low.
  */
 
+#include <drm/drm_print.h>
+
 #include "uapi/drm/vc4_drm.h"
 #include "vc4_drv.h"
 #include "vc4_packet.h"
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 42acac05fe47..9082902100e4 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -21,6 +21,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index bb09df5000bd..3ffe09bc89d2 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -10,6 +10,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_print.h>
+
 #include "vc4_drv.h"
 #include "vc4_regs.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index 1e7bdda55698..545c4c3608f5 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -43,6 +43,8 @@
  * to use) happens.
  */
 
+#include <drm/drm_print.h>
+
 #include "uapi/drm/vc4_drm.h"
 #include "vc4_drv.h"
 #include "vc4_packet.h"
diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
index 2d74e786914c..b50b6cdac3f4 100644
--- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
+++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
@@ -41,6 +41,8 @@
  * this validation is only performed at BO creation time.
  */
 
+#include <drm/drm_print.h>
+
 #include "vc4_drv.h"
 #include "vc4_qpu_defines.h"
 
diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
index 06d702e879b0..b84fad2a5b23 100644
--- a/drivers/gpu/drm/vc4/vc4_vec.c
+++ b/drivers/gpu/drm/vc4/vc4_vec.c
@@ -17,6 +17,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..3a68a16b58ae 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -27,6 +27,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index e972d9b015a9..6a962c1d6e95 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -30,6 +30,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 71c6ccad4b99..a5ce96fb8a1d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -39,6 +39,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
index 1c15cbf326b7..f3594695bb82 100644
--- a/drivers/gpu/drm/virtio/virtgpu_kms.c
+++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
@@ -29,6 +29,7 @@
 
 #include <drm/drm_file.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index e6363c887500..4270bfede7b9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -26,6 +26,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/moduleparam.h>
 
+#include <drm/drm_print.h>
+
 #include "virtgpu_drv.h"
 
 static int virtio_gpu_virglrenderer_workaround = 1;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 29e4b458ae57..a7863f8ee4ee 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -30,6 +30,7 @@
 #include <linux/virtio_dma_buf.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_panic.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 8181b22b9b46..0c194b4e9488 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -32,6 +32,7 @@
 #include <linux/virtio_ring.h>
 
 #include <drm/drm_edid.h>
+#include <drm/drm_print.h>
 
 #include "virtgpu_drv.h"
 #include "virtgpu_trace.h"
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index fa269d279e25..c1ab12a44621 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -8,6 +8,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <linux/minmax.h>
 
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index bac0790c6577..9a7db1d51022 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -5,6 +5,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 6d299903fab2..1f80b1f126b6 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -23,6 +23,7 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 2ee3749e2b28..81d17b7dc0eb 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -4,6 +4,7 @@
 #include "vkms_connector.h"
 #include "vkms_drv.h"
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 int vkms_output_init(struct vkms_device *vkmsdev)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e592e47a5736..89a9fc91e059 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 
 #include "vkms_drv.h"
 #include "vkms_formats.h"
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 45d69a3b85f6..097ae1f0a230 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -6,6 +6,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_writeback.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index eda5b6f8f4c4..f2abaf1bda6a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -16,6 +16,7 @@
 #include <drm/drm_auth.h>
 #include <drm/drm_device.h>
 #include <drm/drm_file.h>
+#include <drm/drm_print.h>
 #include <drm/drm_rect.h>
 
 #include <drm/ttm/ttm_execbuf_util.h>
diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
index a415ca488791..2b3d49dd394c 100644
--- a/drivers/gpu/drm/xe/xe_heci_gsc.c
+++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
@@ -8,6 +8,8 @@
 #include <linux/pci.h>
 #include <linux/sizes.h>
 
+#include <drm/drm_print.h>
+
 #include "xe_device_types.h"
 #include "xe_drv.h"
 #include "xe_heci_gsc.h"
diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
index 7c140d8cb1e0..5766fa7742d3 100644
--- a/drivers/gpu/drm/xe/xe_tuning.c
+++ b/drivers/gpu/drm/xe/xe_tuning.c
@@ -8,6 +8,7 @@
 #include <kunit/visibility.h>
 
 #include <drm/drm_managed.h>
+#include <drm/drm_print.h>
 
 #include "regs/xe_gt_regs.h"
 #include "xe_gt_types.h"
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1bda7ef606cc..4fa45dbe1dcb 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -18,6 +18,7 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_print.h>
 
 #include <xen/platform_pci.h>
 #include <xen/xen.h>
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index 63112ed975c4..386ae7441093 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -15,6 +15,7 @@
 
 #include <drm/drm_gem.h>
 #include <drm/drm_prime.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
 #include <xen/balloon.h>
diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/xen/xen_drm_front_kms.c
index 806ec66ee7f7..48772b5fe71c 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
-- 
2.47.3

