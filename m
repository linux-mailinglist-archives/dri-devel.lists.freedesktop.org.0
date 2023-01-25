Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FB467A99E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 05:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6390210E366;
	Wed, 25 Jan 2023 04:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Wed, 25 Jan 2023 04:31:13 UTC
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62E010E366
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 04:31:13 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-oHX1Z916MB2I-BBQeMzB4Q-1; Tue, 24 Jan 2023 23:25:02 -0500
X-MC-Unique: oHX1Z916MB2I-BBQeMzB4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 440FE858F09;
 Wed, 25 Jan 2023 04:25:02 +0000 (UTC)
Received: from dreadlord.bne.redhat.com (fdacunha.bne.redhat.com [10.64.0.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 900D453A0;
 Wed, 25 Jan 2023 04:24:59 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] xe: use Makefile/include_next magic to avoid need for
 symlinks.
Date: Wed, 25 Jan 2023 14:24:54 +1000
Message-Id: <20230125042454.1219738-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Brost <matthew.brost@intel.com>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

I don't really like the symlinks, my other idea was creating new
files which just include the original, but this idea seems to at
least build.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_de.h          |  4 ++++
 .../gpu/drm/i915/display/intel_display_trace.h   |  4 ----
 drivers/gpu/drm/xe/Makefile                      | 16 ++++++++++++++++
 drivers/gpu/drm/xe/display/ext/intel_dram.c      |  2 +-
 drivers/gpu/drm/xe/display/i915_reg.h            |  1 -
 drivers/gpu/drm/xe/display/icl_dsi.c             |  1 -
 drivers/gpu/drm/xe/display/icl_dsi.h             |  1 -
 drivers/gpu/drm/xe/display/icl_dsi_regs.h        |  1 -
 drivers/gpu/drm/xe/display/intel_acpi.c          |  1 -
 drivers/gpu/drm/xe/display/intel_acpi.h          |  1 -
 drivers/gpu/drm/xe/display/intel_atomic.c        |  1 -
 drivers/gpu/drm/xe/display/intel_atomic.h        |  1 -
 drivers/gpu/drm/xe/display/intel_atomic_plane.c  |  1 -
 drivers/gpu/drm/xe/display/intel_atomic_plane.h  |  1 -
 drivers/gpu/drm/xe/display/intel_audio.c         |  1 -
 drivers/gpu/drm/xe/display/intel_audio.h         |  1 -
 drivers/gpu/drm/xe/display/intel_audio_regs.h    |  1 -
 drivers/gpu/drm/xe/display/intel_backlight.c     |  1 -
 drivers/gpu/drm/xe/display/intel_backlight.h     |  1 -
 .../gpu/drm/xe/display/intel_backlight_regs.h    |  1 -
 drivers/gpu/drm/xe/display/intel_bios.c          |  1 -
 drivers/gpu/drm/xe/display/intel_bios.h          |  1 -
 drivers/gpu/drm/xe/display/intel_bw.c            |  1 -
 drivers/gpu/drm/xe/display/intel_bw.h            |  1 -
 drivers/gpu/drm/xe/display/intel_cdclk.c         |  1 -
 drivers/gpu/drm/xe/display/intel_cdclk.h         |  1 -
 drivers/gpu/drm/xe/display/intel_color.c         |  1 -
 drivers/gpu/drm/xe/display/intel_color.h         |  1 -
 drivers/gpu/drm/xe/display/intel_combo_phy.c     |  1 -
 drivers/gpu/drm/xe/display/intel_combo_phy.h     |  1 -
 .../gpu/drm/xe/display/intel_combo_phy_regs.h    |  1 -
 drivers/gpu/drm/xe/display/intel_connector.c     |  1 -
 drivers/gpu/drm/xe/display/intel_connector.h     |  1 -
 drivers/gpu/drm/xe/display/intel_crtc.c          |  1 -
 drivers/gpu/drm/xe/display/intel_crtc.h          |  1 -
 .../gpu/drm/xe/display/intel_crtc_state_dump.c   |  1 -
 .../gpu/drm/xe/display/intel_crtc_state_dump.h   |  1 -
 drivers/gpu/drm/xe/display/intel_cursor.c        |  1 -
 drivers/gpu/drm/xe/display/intel_cursor.h        |  1 -
 drivers/gpu/drm/xe/display/intel_ddi.c           |  1 -
 drivers/gpu/drm/xe/display/intel_ddi.h           |  1 -
 drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c |  1 -
 drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h |  1 -
 drivers/gpu/drm/xe/display/intel_display.c       |  1 -
 drivers/gpu/drm/xe/display/intel_display.h       |  1 -
 drivers/gpu/drm/xe/display/intel_display_core.h  |  1 -
 .../gpu/drm/xe/display/intel_display_debugfs.c   |  1 -
 .../gpu/drm/xe/display/intel_display_debugfs.h   |  1 -
 drivers/gpu/drm/xe/display/intel_display_power.c |  1 -
 drivers/gpu/drm/xe/display/intel_display_power.h |  1 -
 .../gpu/drm/xe/display/intel_display_power_map.c |  1 -
 .../gpu/drm/xe/display/intel_display_power_map.h |  1 -
 .../drm/xe/display/intel_display_power_well.c    |  1 -
 .../drm/xe/display/intel_display_power_well.h    |  1 -
 drivers/gpu/drm/xe/display/intel_display_trace.c |  1 -
 drivers/gpu/drm/xe/display/intel_display_trace.h |  1 -
 drivers/gpu/drm/xe/display/intel_display_types.h |  1 -
 drivers/gpu/drm/xe/display/intel_dmc.c           |  1 -
 drivers/gpu/drm/xe/display/intel_dmc.h           |  1 -
 drivers/gpu/drm/xe/display/intel_dmc_regs.h      |  1 -
 drivers/gpu/drm/xe/display/intel_dp.c            |  1 -
 drivers/gpu/drm/xe/display/intel_dp.h            |  1 -
 drivers/gpu/drm/xe/display/intel_dp_aux.c        |  1 -
 drivers/gpu/drm/xe/display/intel_dp_aux.h        |  1 -
 .../gpu/drm/xe/display/intel_dp_aux_backlight.c  |  1 -
 .../gpu/drm/xe/display/intel_dp_aux_backlight.h  |  1 -
 drivers/gpu/drm/xe/display/intel_dp_hdcp.c       |  1 -
 drivers/gpu/drm/xe/display/intel_dp_hdcp.h       |  1 -
 .../gpu/drm/xe/display/intel_dp_link_training.c  |  1 -
 .../gpu/drm/xe/display/intel_dp_link_training.h  |  1 -
 drivers/gpu/drm/xe/display/intel_dp_mst.c        |  1 -
 drivers/gpu/drm/xe/display/intel_dp_mst.h        |  1 -
 drivers/gpu/drm/xe/display/intel_dpio_phy.h      |  1 -
 drivers/gpu/drm/xe/display/intel_dpll.c          |  1 -
 drivers/gpu/drm/xe/display/intel_dpll.h          |  1 -
 drivers/gpu/drm/xe/display/intel_dpll_mgr.c      |  1 -
 drivers/gpu/drm/xe/display/intel_dpll_mgr.h      |  1 -
 drivers/gpu/drm/xe/display/intel_dpt.h           |  1 -
 drivers/gpu/drm/xe/display/intel_drrs.c          |  1 -
 drivers/gpu/drm/xe/display/intel_drrs.h          |  1 -
 drivers/gpu/drm/xe/display/intel_dsb.c           |  1 -
 drivers/gpu/drm/xe/display/intel_dsb.h           |  1 -
 drivers/gpu/drm/xe/display/intel_dsi.c           |  1 -
 drivers/gpu/drm/xe/display/intel_dsi.h           |  1 -
 .../gpu/drm/xe/display/intel_dsi_dcs_backlight.c |  1 -
 .../gpu/drm/xe/display/intel_dsi_dcs_backlight.h |  1 -
 drivers/gpu/drm/xe/display/intel_dsi_vbt.c       |  1 -
 drivers/gpu/drm/xe/display/intel_dsi_vbt.h       |  1 -
 drivers/gpu/drm/xe/display/intel_fb.c            |  1 -
 drivers/gpu/drm/xe/display/intel_fb.h            |  1 -
 drivers/gpu/drm/xe/display/intel_fb_pin.h        |  1 -
 drivers/gpu/drm/xe/display/intel_fbc.c           |  1 -
 drivers/gpu/drm/xe/display/intel_fbc.h           |  1 -
 drivers/gpu/drm/xe/display/intel_fbdev.c         |  1 -
 drivers/gpu/drm/xe/display/intel_fbdev.h         |  1 -
 drivers/gpu/drm/xe/display/intel_fdi.c           |  1 -
 drivers/gpu/drm/xe/display/intel_fdi.h           |  1 -
 drivers/gpu/drm/xe/display/intel_fifo_underrun.c |  1 -
 drivers/gpu/drm/xe/display/intel_fifo_underrun.h |  1 -
 drivers/gpu/drm/xe/display/intel_frontbuffer.c   |  1 -
 drivers/gpu/drm/xe/display/intel_frontbuffer.h   |  1 -
 drivers/gpu/drm/xe/display/intel_global_state.c  |  1 -
 drivers/gpu/drm/xe/display/intel_global_state.h  |  1 -
 drivers/gpu/drm/xe/display/intel_gmbus.c         |  1 -
 drivers/gpu/drm/xe/display/intel_gmbus.h         |  1 -
 drivers/gpu/drm/xe/display/intel_hdcp.c          |  1 -
 drivers/gpu/drm/xe/display/intel_hdcp.h          |  1 -
 drivers/gpu/drm/xe/display/intel_hdcp_regs.h     |  1 -
 drivers/gpu/drm/xe/display/intel_hdmi.c          |  1 -
 drivers/gpu/drm/xe/display/intel_hdmi.h          |  1 -
 drivers/gpu/drm/xe/display/intel_hotplug.c       |  1 -
 drivers/gpu/drm/xe/display/intel_hotplug.h       |  1 -
 drivers/gpu/drm/xe/display/intel_lpe_audio.h     |  1 -
 drivers/gpu/drm/xe/display/intel_lspcon.c        |  1 -
 drivers/gpu/drm/xe/display/intel_lspcon.h        |  1 -
 drivers/gpu/drm/xe/display/intel_lvds.c          |  1 -
 drivers/gpu/drm/xe/display/intel_lvds.h          |  1 -
 drivers/gpu/drm/xe/display/intel_modeset_setup.c |  1 -
 drivers/gpu/drm/xe/display/intel_modeset_setup.h |  1 -
 .../gpu/drm/xe/display/intel_modeset_verify.c    |  1 -
 .../gpu/drm/xe/display/intel_modeset_verify.h    |  1 -
 drivers/gpu/drm/xe/display/intel_opregion.c      |  1 -
 drivers/gpu/drm/xe/display/intel_opregion.h      |  1 -
 drivers/gpu/drm/xe/display/intel_panel.c         |  1 -
 drivers/gpu/drm/xe/display/intel_panel.h         |  1 -
 drivers/gpu/drm/xe/display/intel_pch_display.h   |  1 -
 drivers/gpu/drm/xe/display/intel_pch_refclk.h    |  1 -
 drivers/gpu/drm/xe/display/intel_pipe_crc.c      |  1 -
 drivers/gpu/drm/xe/display/intel_pipe_crc.h      |  1 -
 drivers/gpu/drm/xe/display/intel_plane_initial.h |  1 -
 drivers/gpu/drm/xe/display/intel_pps.c           |  1 -
 drivers/gpu/drm/xe/display/intel_pps.h           |  1 -
 drivers/gpu/drm/xe/display/intel_psr.c           |  1 -
 drivers/gpu/drm/xe/display/intel_psr.h           |  1 -
 drivers/gpu/drm/xe/display/intel_qp_tables.c     |  1 -
 drivers/gpu/drm/xe/display/intel_qp_tables.h     |  1 -
 drivers/gpu/drm/xe/display/intel_quirks.c        |  1 -
 drivers/gpu/drm/xe/display/intel_quirks.h        |  1 -
 drivers/gpu/drm/xe/display/intel_snps_phy.c      |  1 -
 drivers/gpu/drm/xe/display/intel_snps_phy.h      |  1 -
 drivers/gpu/drm/xe/display/intel_snps_phy_regs.h |  1 -
 drivers/gpu/drm/xe/display/intel_sprite.c        |  1 -
 drivers/gpu/drm/xe/display/intel_sprite.h        |  1 -
 drivers/gpu/drm/xe/display/intel_tc.c            |  1 -
 drivers/gpu/drm/xe/display/intel_tc.h            |  1 -
 drivers/gpu/drm/xe/display/intel_tc_phy_regs.h   |  1 -
 drivers/gpu/drm/xe/display/intel_vbt_defs.h      |  1 -
 drivers/gpu/drm/xe/display/intel_vdsc.c          |  1 -
 drivers/gpu/drm/xe/display/intel_vdsc.h          |  1 -
 drivers/gpu/drm/xe/display/intel_vga.c           |  1 -
 drivers/gpu/drm/xe/display/intel_vga.h           |  1 -
 drivers/gpu/drm/xe/display/intel_vrr.c           |  1 -
 drivers/gpu/drm/xe/display/intel_vrr.h           |  1 -
 drivers/gpu/drm/xe/display/skl_scaler.c          |  1 -
 drivers/gpu/drm/xe/display/skl_scaler.h          |  1 -
 drivers/gpu/drm/xe/display/skl_universal_plane.c |  1 -
 drivers/gpu/drm/xe/display/skl_universal_plane.h |  1 -
 drivers/gpu/drm/xe/display/skl_watermark.c       |  1 -
 drivers/gpu/drm/xe/display/skl_watermark.h       |  1 -
 159 files changed, 21 insertions(+), 160 deletions(-)
 delete mode 120000 drivers/gpu/drm/xe/display/i915_reg.h
 delete mode 120000 drivers/gpu/drm/xe/display/icl_dsi.c
 delete mode 120000 drivers/gpu/drm/xe/display/icl_dsi.h
 delete mode 120000 drivers/gpu/drm/xe/display/icl_dsi_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_acpi.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_acpi.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic_plane.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_atomic_plane.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_audio.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_audio.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_audio_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_backlight.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_backlight.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_backlight_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_bios.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_bios.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_bw.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_bw.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_cdclk.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_cdclk.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_color.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_color.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_combo_phy.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_combo_phy.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_combo_phy_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_connector.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_connector.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc_state_dump.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_crtc_state_dump.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_cursor.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_cursor.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_core.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_debugfs.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_debugfs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_map.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_map.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_well.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_power_well.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_trace.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_trace.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_display_types.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dmc.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dmc.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dmc_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_hdcp.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_hdcp.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_link_training.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_link_training.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_mst.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dp_mst.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dpio_phy.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll_mgr.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dpll_mgr.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dpt.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_drrs.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_drrs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsb.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsb.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_vbt.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_dsi_vbt.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fb.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fb.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fb_pin.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fbc.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fbc.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fbdev.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fbdev.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fdi.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fdi.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fifo_underrun.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_fifo_underrun.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_frontbuffer.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_frontbuffer.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_global_state.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_global_state.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_gmbus.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_gmbus.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hdcp.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hdcp.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hdcp_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hdmi.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hdmi.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hotplug.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_hotplug.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_lpe_audio.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_lspcon.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_lspcon.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_lvds.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_lvds.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_setup.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_setup.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_verify.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_modeset_verify.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_opregion.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_opregion.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_panel.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_panel.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_pch_display.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_pch_refclk.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_pipe_crc.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_pipe_crc.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_plane_initial.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_pps.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_pps.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_psr.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_psr.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_qp_tables.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_qp_tables.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_quirks.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_quirks.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_snps_phy.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_snps_phy.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_snps_phy_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_sprite.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_sprite.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_tc.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_tc.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_tc_phy_regs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vbt_defs.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vdsc.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vdsc.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vga.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vga.h
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vrr.c
 delete mode 120000 drivers/gpu/drm/xe/display/intel_vrr.h
 delete mode 120000 drivers/gpu/drm/xe/display/skl_scaler.c
 delete mode 120000 drivers/gpu/drm/xe/display/skl_scaler.h
 delete mode 120000 drivers/gpu/drm/xe/display/skl_universal_plane.c
 delete mode 120000 drivers/gpu/drm/xe/display/skl_universal_plane.h
 delete mode 120000 drivers/gpu/drm/xe/display/skl_watermark.c
 delete mode 120000 drivers/gpu/drm/xe/display/skl_watermark.h

diff --git a/drivers/gpu/drm/i915/display/intel_de.h b/drivers/gpu/drm/i915=
/display/intel_de.h
index da1b51b670e9..366be66b46d6 100644
--- a/drivers/gpu/drm/i915/display/intel_de.h
+++ b/drivers/gpu/drm/i915/display/intel_de.h
@@ -3,6 +3,9 @@
  * Copyright =C2=A9 2019 Intel Corporation
  */
=20
+#ifdef BUILD_FOR_XE
+#include_next "intel_de.h"
+#else
 #ifndef __INTEL_DE_H__
 #define __INTEL_DE_H__
=20
@@ -155,3 +158,4 @@ static inline int intel_de_pcode_request(struct drm_i91=
5_private *i915, u32 mbox
 }
=20
 #endif /* __INTEL_DE_H__ */
+#endif
diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/g=
pu/drm/i915/display/intel_display_trace.h
index b4812bde3d54..d428c4f6a221 100644
--- a/drivers/gpu/drm/i915/display/intel_display_trace.h
+++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
@@ -586,10 +586,6 @@ TRACE_EVENT(intel_frontbuffer_flush,
 /* This part must be outside protection */
 #undef TRACE_INCLUDE_PATH
 #undef TRACE_INCLUDE_FILE
-#ifdef I915
 #define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
-#else
-#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe/display
-#endif
 #define TRACE_INCLUDE_FILE intel_display_trace
 #include <trace/define_trace.h>
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 5d81a6cee56b..3abc306c333f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -105,11 +105,27 @@ xe-y +=3D xe_bb.o \
=20
 # i915 compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) +=3D -I$(srctree)/$(src)/display/e=
xt \
+=09-I$(srctree)/drivers/gpu/drm/xe/display/ \
+=09-I$(srctree)/drivers/gpu/drm/i915/display/ \
+=09-I$(srctree)/drivers/gpu/drm/i915/ \
+=09-DBUILD_FOR_XE=3D1 \
 =09-Ddrm_i915_gem_object=3Dxe_bo \
 =09-Ddrm_i915_private=3Dxe_device
=20
 CFLAGS_display/intel_fbdev.o =3D $(call cc-disable-warning, override-init)
=20
+$(obj)/display/i915_%.o: $(srctree)/drivers/gpu/drm/i915/display/i915_%.c =
FORCE
+=09$(call cmd,force_checksrc)
+=09$(call if_changed_rule,cc_o_c)
+
+$(obj)/display/skl_%.o: $(srctree)/drivers/gpu/drm/i915/display/skl_%.c FO=
RCE
+=09$(call cmd,force_checksrc)
+=09$(call if_changed_rule,cc_o_c)
+
+$(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.=
c FORCE
+=09$(call cmd,force_checksrc)
+=09$(call if_changed_rule,cc_o_c)
+
 # Display..
 xe-$(CONFIG_DRM_XE_DISPLAY) +=3D \
 =09display/icl_dsi.o \
diff --git a/drivers/gpu/drm/xe/display/ext/intel_dram.c b/drivers/gpu/drm/=
xe/display/ext/intel_dram.c
index f591d61d389a..e57457ceb8d8 100644
--- a/drivers/gpu/drm/xe/display/ext/intel_dram.c
+++ b/drivers/gpu/drm/xe/display/ext/intel_dram.c
@@ -6,7 +6,7 @@
 #include <linux/string_helpers.h>
=20
 #include "../i915_drv.h"
-#include "../i915_reg.h"
+#include "i915_reg.h"
 #include "../intel_de.h"
 #include "intel_dram.h"
 #include "../i915/intel_mchbar_regs.h"
diff --git a/drivers/gpu/drm/xe/display/i915_reg.h b/drivers/gpu/drm/xe/dis=
play/i915_reg.h
deleted file mode 120000
index 67a259605561..000000000000
--- a/drivers/gpu/drm/xe/display/i915_reg.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/i915_reg.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/icl_dsi.c b/drivers/gpu/drm/xe/disp=
lay/icl_dsi.c
deleted file mode 120000
index 2a1831df0934..000000000000
--- a/drivers/gpu/drm/xe/display/icl_dsi.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/icl_dsi.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/icl_dsi.h b/drivers/gpu/drm/xe/disp=
lay/icl_dsi.h
deleted file mode 120000
index 6f06694111f0..000000000000
--- a/drivers/gpu/drm/xe/display/icl_dsi.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/icl_dsi.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/icl_dsi_regs.h b/drivers/gpu/drm/xe=
/display/icl_dsi_regs.h
deleted file mode 120000
index 8ef4e4a8249d..000000000000
--- a/drivers/gpu/drm/xe/display/icl_dsi_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/icl_dsi_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_acpi.c b/drivers/gpu/drm/xe/d=
isplay/intel_acpi.c
deleted file mode 120000
index 687ee6ee7f2f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_acpi.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_acpi.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_acpi.h b/drivers/gpu/drm/xe/d=
isplay/intel_acpi.h
deleted file mode 120000
index 988da00b3c16..000000000000
--- a/drivers/gpu/drm/xe/display/intel_acpi.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_acpi.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_atomic.c b/drivers/gpu/drm/xe=
/display/intel_atomic.c
deleted file mode 120000
index 48b811df4572..000000000000
--- a/drivers/gpu/drm/xe/display/intel_atomic.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_atomic.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_atomic.h b/drivers/gpu/drm/xe=
/display/intel_atomic.h
deleted file mode 120000
index e3ccf21d1bce..000000000000
--- a/drivers/gpu/drm/xe/display/intel_atomic.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_atomic.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_atomic_plane.c b/drivers/gpu/=
drm/xe/display/intel_atomic_plane.c
deleted file mode 120000
index 139b2f50f95b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_atomic_plane.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_atomic_plane.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_atomic_plane.h b/drivers/gpu/=
drm/xe/display/intel_atomic_plane.h
deleted file mode 120000
index 0556c55776bb..000000000000
--- a/drivers/gpu/drm/xe/display/intel_atomic_plane.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_atomic_plane.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_audio.c b/drivers/gpu/drm/xe/=
display/intel_audio.c
deleted file mode 120000
index 9c5892a08fda..000000000000
--- a/drivers/gpu/drm/xe/display/intel_audio.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_audio.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_audio.h b/drivers/gpu/drm/xe/=
display/intel_audio.h
deleted file mode 120000
index d45e1292849c..000000000000
--- a/drivers/gpu/drm/xe/display/intel_audio.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_audio.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_audio_regs.h b/drivers/gpu/dr=
m/xe/display/intel_audio_regs.h
deleted file mode 120000
index 1bc2fe1d27af..000000000000
--- a/drivers/gpu/drm/xe/display/intel_audio_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_audio_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_backlight.c b/drivers/gpu/drm=
/xe/display/intel_backlight.c
deleted file mode 120000
index 75e47d1d1bf9..000000000000
--- a/drivers/gpu/drm/xe/display/intel_backlight.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_backlight.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_backlight.h b/drivers/gpu/drm=
/xe/display/intel_backlight.h
deleted file mode 120000
index d277b1b0bb26..000000000000
--- a/drivers/gpu/drm/xe/display/intel_backlight.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_backlight.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_backlight_regs.h b/drivers/gp=
u/drm/xe/display/intel_backlight_regs.h
deleted file mode 120000
index 9d3919c9b31f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_backlight_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_backlight_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_bios.c b/drivers/gpu/drm/xe/d=
isplay/intel_bios.c
deleted file mode 120000
index c41ea3374da3..000000000000
--- a/drivers/gpu/drm/xe/display/intel_bios.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_bios.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_bios.h b/drivers/gpu/drm/xe/d=
isplay/intel_bios.h
deleted file mode 120000
index 431ad6b3184f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_bios.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_bios.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_bw.c b/drivers/gpu/drm/xe/dis=
play/intel_bw.c
deleted file mode 120000
index a7d701a83498..000000000000
--- a/drivers/gpu/drm/xe/display/intel_bw.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_bw.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_bw.h b/drivers/gpu/drm/xe/dis=
play/intel_bw.h
deleted file mode 120000
index a3742f627475..000000000000
--- a/drivers/gpu/drm/xe/display/intel_bw.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_bw.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_cdclk.c b/drivers/gpu/drm/xe/=
display/intel_cdclk.c
deleted file mode 120000
index a2c04b6e768f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_cdclk.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_cdclk.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_cdclk.h b/drivers/gpu/drm/xe/=
display/intel_cdclk.h
deleted file mode 120000
index b80d7208da6e..000000000000
--- a/drivers/gpu/drm/xe/display/intel_cdclk.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_cdclk.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_color.c b/drivers/gpu/drm/xe/=
display/intel_color.c
deleted file mode 120000
index 0c5371c9dd67..000000000000
--- a/drivers/gpu/drm/xe/display/intel_color.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_color.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_color.h b/drivers/gpu/drm/xe/=
display/intel_color.h
deleted file mode 120000
index 00fd91f94752..000000000000
--- a/drivers/gpu/drm/xe/display/intel_color.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_color.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_combo_phy.c b/drivers/gpu/drm=
/xe/display/intel_combo_phy.c
deleted file mode 120000
index d459ce79ef4d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_combo_phy.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_combo_phy.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_combo_phy.h b/drivers/gpu/drm=
/xe/display/intel_combo_phy.h
deleted file mode 120000
index 18d50bcc01a5..000000000000
--- a/drivers/gpu/drm/xe/display/intel_combo_phy.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_combo_phy.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_combo_phy_regs.h b/drivers/gp=
u/drm/xe/display/intel_combo_phy_regs.h
deleted file mode 120000
index 3dbdfb88ca72..000000000000
--- a/drivers/gpu/drm/xe/display/intel_combo_phy_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_combo_phy_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_connector.c b/drivers/gpu/drm=
/xe/display/intel_connector.c
deleted file mode 120000
index 18c91af30246..000000000000
--- a/drivers/gpu/drm/xe/display/intel_connector.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_connector.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_connector.h b/drivers/gpu/drm=
/xe/display/intel_connector.h
deleted file mode 120000
index 9fb4e9cfa7c0..000000000000
--- a/drivers/gpu/drm/xe/display/intel_connector.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_connector.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_crtc.c b/drivers/gpu/drm/xe/d=
isplay/intel_crtc.c
deleted file mode 120000
index 5160fba21c04..000000000000
--- a/drivers/gpu/drm/xe/display/intel_crtc.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_crtc.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_crtc.h b/drivers/gpu/drm/xe/d=
isplay/intel_crtc.h
deleted file mode 120000
index 0cf7909bc5ad..000000000000
--- a/drivers/gpu/drm/xe/display/intel_crtc.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_crtc.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.c b/drivers/g=
pu/drm/xe/display/intel_crtc_state_dump.c
deleted file mode 120000
index f23e0597fea6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_crtc_state_dump.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.h b/drivers/g=
pu/drm/xe/display/intel_crtc_state_dump.h
deleted file mode 120000
index 6e4daa77558a..000000000000
--- a/drivers/gpu/drm/xe/display/intel_crtc_state_dump.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_crtc_state_dump.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_cursor.c b/drivers/gpu/drm/xe=
/display/intel_cursor.c
deleted file mode 120000
index 740715826c84..000000000000
--- a/drivers/gpu/drm/xe/display/intel_cursor.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_cursor.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_cursor.h b/drivers/gpu/drm/xe=
/display/intel_cursor.h
deleted file mode 120000
index 5fb2fc440479..000000000000
--- a/drivers/gpu/drm/xe/display/intel_cursor.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_cursor.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_ddi.c b/drivers/gpu/drm/xe/di=
splay/intel_ddi.c
deleted file mode 120000
index b8bd93acc243..000000000000
--- a/drivers/gpu/drm/xe/display/intel_ddi.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_ddi.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_ddi.h b/drivers/gpu/drm/xe/di=
splay/intel_ddi.h
deleted file mode 120000
index 48eba126b662..000000000000
--- a/drivers/gpu/drm/xe/display/intel_ddi.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_ddi.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c b/drivers/gpu=
/drm/xe/display/intel_ddi_buf_trans.c
deleted file mode 120000
index 25205d44064b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_ddi_buf_trans.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h b/drivers/gpu=
/drm/xe/display/intel_ddi_buf_trans.h
deleted file mode 120000
index 0144b866e6c6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_ddi_buf_trans.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_ddi_buf_trans.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display.c b/drivers/gpu/drm/x=
e/display/intel_display.c
deleted file mode 120000
index 156027497bf0..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display.h b/drivers/gpu/drm/x=
e/display/intel_display.h
deleted file mode 120000
index fbdf72fadf7a..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_core.h b/drivers/gpu/=
drm/xe/display/intel_display_core.h
deleted file mode 120000
index 044ffa4021d4..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_core.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_core.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_debugfs.c b/drivers/g=
pu/drm/xe/display/intel_display_debugfs.c
deleted file mode 120000
index a38b035962a5..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_debugfs.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_debugfs.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_debugfs.h b/drivers/g=
pu/drm/xe/display/intel_display_debugfs.h
deleted file mode 120000
index dc10537f5d0d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_debugfs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_debugfs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_power.c b/drivers/gpu=
/drm/xe/display/intel_display_power.c
deleted file mode 120000
index a892bb7f846f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_power.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_power.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_power.h b/drivers/gpu=
/drm/xe/display/intel_display_power.h
deleted file mode 120000
index 210a06440d8d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_power.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_power.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_power_map.c b/drivers=
/gpu/drm/xe/display/intel_display_power_map.c
deleted file mode 120000
index 556d5ef34704..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_power_map.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_power_map.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_power_map.h b/drivers=
/gpu/drm/xe/display/intel_display_power_map.h
deleted file mode 120000
index ab553ade715f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_power_map.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_power_map.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_power_well.c b/driver=
s/gpu/drm/xe/display/intel_display_power_well.c
deleted file mode 120000
index dab308034739..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_power_well.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_power_well.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_power_well.h b/driver=
s/gpu/drm/xe/display/intel_display_power_well.h
deleted file mode 120000
index c4ba490f7bc8..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_power_well.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_power_well.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_trace.c b/drivers/gpu=
/drm/xe/display/intel_display_trace.c
deleted file mode 120000
index 3e64b8d83207..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_trace.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_trace.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_trace.h b/drivers/gpu=
/drm/xe/display/intel_display_trace.h
deleted file mode 120000
index 8e77060b0688..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_trace.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_trace.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_display_types.h b/drivers/gpu=
/drm/xe/display/intel_display_types.h
deleted file mode 120000
index 60c391ef8878..000000000000
--- a/drivers/gpu/drm/xe/display/intel_display_types.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_display_types.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dmc.c b/drivers/gpu/drm/xe/di=
splay/intel_dmc.c
deleted file mode 120000
index 6758b5fc0af2..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dmc.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dmc.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dmc.h b/drivers/gpu/drm/xe/di=
splay/intel_dmc.h
deleted file mode 120000
index abbf15cc3883..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dmc.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dmc.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dmc_regs.h b/drivers/gpu/drm/=
xe/display/intel_dmc_regs.h
deleted file mode 120000
index 9460d31a1c8c..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dmc_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dmc_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp.c b/drivers/gpu/drm/xe/dis=
play/intel_dp.c
deleted file mode 120000
index e04f8a550df1..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp.h b/drivers/gpu/drm/xe/dis=
play/intel_dp.h
deleted file mode 120000
index f097e4e1d34a..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux.c b/drivers/gpu/drm/xe=
/display/intel_dp_aux.c
deleted file mode 120000
index bc448c0a93f6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_aux.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_aux.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux.h b/drivers/gpu/drm/xe=
/display/intel_dp_aux.h
deleted file mode 120000
index 4968a8994f20..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_aux.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_aux.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c b/drivers/=
gpu/drm/xe/display/intel_dp_aux_backlight.c
deleted file mode 120000
index 8f7f4647f30b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_aux_backlight.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h b/drivers/=
gpu/drm/xe/display/intel_dp_aux_backlight.h
deleted file mode 120000
index 30058e73c02c..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_aux_backlight.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_aux_backlight.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_hdcp.c b/drivers/gpu/drm/x=
e/display/intel_dp_hdcp.c
deleted file mode 120000
index 41792a7313e5..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_hdcp.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_hdcp.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_hdcp.h b/drivers/gpu/drm/x=
e/display/intel_dp_hdcp.h
deleted file mode 120000
index 07fd9a6d18eb..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_hdcp.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_hdcp.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_link_training.c b/drivers/=
gpu/drm/xe/display/intel_dp_link_training.c
deleted file mode 120000
index c5052f4c2832..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_link_training.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_link_training.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_link_training.h b/drivers/=
gpu/drm/xe/display/intel_dp_link_training.h
deleted file mode 120000
index 2bf6f0327bd7..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_link_training.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_link_training.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_mst.c b/drivers/gpu/drm/xe=
/display/intel_dp_mst.c
deleted file mode 120000
index 6ee2cb589fa6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_mst.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_mst.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dp_mst.h b/drivers/gpu/drm/xe=
/display/intel_dp_mst.h
deleted file mode 120000
index 54df2b7009f0..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dp_mst.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dp_mst.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dpio_phy.h b/drivers/gpu/drm/=
xe/display/intel_dpio_phy.h
deleted file mode 120000
index 4f70bd7d5e69..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dpio_phy.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dpio_phy.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dpll.c b/drivers/gpu/drm/xe/d=
isplay/intel_dpll.c
deleted file mode 120000
index d45ab4ac02af..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dpll.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dpll.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dpll.h b/drivers/gpu/drm/xe/d=
isplay/intel_dpll.h
deleted file mode 120000
index dcae42f20ead..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dpll.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dpll.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dpll_mgr.c b/drivers/gpu/drm/=
xe/display/intel_dpll_mgr.c
deleted file mode 120000
index 1f70a7e81eec..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dpll_mgr.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dpll_mgr.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dpll_mgr.h b/drivers/gpu/drm/=
xe/display/intel_dpll_mgr.h
deleted file mode 120000
index 188708bdbd4f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dpll_mgr.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dpll_mgr.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dpt.h b/drivers/gpu/drm/xe/di=
splay/intel_dpt.h
deleted file mode 120000
index 3771f0ee9e3b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dpt.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dpt.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_drrs.c b/drivers/gpu/drm/xe/d=
isplay/intel_drrs.c
deleted file mode 120000
index 9f292c670cd5..000000000000
--- a/drivers/gpu/drm/xe/display/intel_drrs.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_drrs.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_drrs.h b/drivers/gpu/drm/xe/d=
isplay/intel_drrs.h
deleted file mode 120000
index b760b6f188b4..000000000000
--- a/drivers/gpu/drm/xe/display/intel_drrs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_drrs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsb.c b/drivers/gpu/drm/xe/di=
splay/intel_dsb.c
deleted file mode 120000
index 080e3b2b2a3a..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsb.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsb.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsb.h b/drivers/gpu/drm/xe/di=
splay/intel_dsb.h
deleted file mode 120000
index 8ae3ab260ec0..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsb.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsb.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsi.c b/drivers/gpu/drm/xe/di=
splay/intel_dsi.c
deleted file mode 120000
index dede46fa511b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsi.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsi.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsi.h b/drivers/gpu/drm/xe/di=
splay/intel_dsi.h
deleted file mode 120000
index 444e98104455..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsi.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsi.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c b/drivers=
/gpu/drm/xe/display/intel_dsi_dcs_backlight.c
deleted file mode 120000
index 2423e330a9cd..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsi_dcs_backlight.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h b/drivers=
/gpu/drm/xe/display/intel_dsi_dcs_backlight.h
deleted file mode 120000
index 8c6f6d596cee..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsi_dcs_backlight.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsi_dcs_backlight.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsi_vbt.c b/drivers/gpu/drm/x=
e/display/intel_dsi_vbt.c
deleted file mode 120000
index dbbf882b3935..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsi_vbt.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsi_vbt.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_dsi_vbt.h b/drivers/gpu/drm/x=
e/display/intel_dsi_vbt.h
deleted file mode 120000
index 17bc45d2b805..000000000000
--- a/drivers/gpu/drm/xe/display/intel_dsi_vbt.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_dsi_vbt.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fb.c b/drivers/gpu/drm/xe/dis=
play/intel_fb.c
deleted file mode 120000
index 7f573cd75157..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fb.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fb.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fb.h b/drivers/gpu/drm/xe/dis=
play/intel_fb.h
deleted file mode 120000
index b0ea84fef6dd..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fb.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fb.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fb_pin.h b/drivers/gpu/drm/xe=
/display/intel_fb_pin.h
deleted file mode 120000
index 7cb45a179327..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fb_pin.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fb_pin.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fbc.c b/drivers/gpu/drm/xe/di=
splay/intel_fbc.c
deleted file mode 120000
index 2561b363d18e..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fbc.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fbc.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fbc.h b/drivers/gpu/drm/xe/di=
splay/intel_fbc.h
deleted file mode 120000
index 1e54107d4faa..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fbc.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fbc.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev.c b/drivers/gpu/drm/xe/=
display/intel_fbdev.c
deleted file mode 120000
index c59c682b886e..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fbdev.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fbdev.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fbdev.h b/drivers/gpu/drm/xe/=
display/intel_fbdev.h
deleted file mode 120000
index 0ce2d63dc1ce..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fbdev.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fbdev.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fdi.c b/drivers/gpu/drm/xe/di=
splay/intel_fdi.c
deleted file mode 120000
index 92d343e18c27..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fdi.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fdi.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fdi.h b/drivers/gpu/drm/xe/di=
splay/intel_fdi.h
deleted file mode 120000
index 360365a5b014..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fdi.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fdi.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fifo_underrun.c b/drivers/gpu=
/drm/xe/display/intel_fifo_underrun.c
deleted file mode 120000
index 80be33f1a499..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fifo_underrun.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fifo_underrun.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_fifo_underrun.h b/drivers/gpu=
/drm/xe/display/intel_fifo_underrun.h
deleted file mode 120000
index e70367d69c9b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_fifo_underrun.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_fifo_underrun.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_frontbuffer.c b/drivers/gpu/d=
rm/xe/display/intel_frontbuffer.c
deleted file mode 120000
index ac7a8a97606f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_frontbuffer.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_frontbuffer.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_frontbuffer.h b/drivers/gpu/d=
rm/xe/display/intel_frontbuffer.h
deleted file mode 120000
index 5a05d93a0c74..000000000000
--- a/drivers/gpu/drm/xe/display/intel_frontbuffer.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_frontbuffer.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_global_state.c b/drivers/gpu/=
drm/xe/display/intel_global_state.c
deleted file mode 120000
index d107abcd9339..000000000000
--- a/drivers/gpu/drm/xe/display/intel_global_state.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_global_state.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_global_state.h b/drivers/gpu/=
drm/xe/display/intel_global_state.h
deleted file mode 120000
index 24c757b52c7f..000000000000
--- a/drivers/gpu/drm/xe/display/intel_global_state.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_global_state.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_gmbus.c b/drivers/gpu/drm/xe/=
display/intel_gmbus.c
deleted file mode 120000
index 666f8bf04d13..000000000000
--- a/drivers/gpu/drm/xe/display/intel_gmbus.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_gmbus.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_gmbus.h b/drivers/gpu/drm/xe/=
display/intel_gmbus.h
deleted file mode 120000
index 2cf0b56aef9d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_gmbus.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_gmbus.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hdcp.c b/drivers/gpu/drm/xe/d=
isplay/intel_hdcp.c
deleted file mode 120000
index cb8e1ae66c37..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hdcp.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hdcp.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hdcp.h b/drivers/gpu/drm/xe/d=
isplay/intel_hdcp.h
deleted file mode 120000
index 2b4e1dfaf2c6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hdcp.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hdcp.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hdcp_regs.h b/drivers/gpu/drm=
/xe/display/intel_hdcp_regs.h
deleted file mode 120000
index 297f8d358ecb..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hdcp_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hdcp_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hdmi.c b/drivers/gpu/drm/xe/d=
isplay/intel_hdmi.c
deleted file mode 120000
index 301a48121fb7..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hdmi.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hdmi.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hdmi.h b/drivers/gpu/drm/xe/d=
isplay/intel_hdmi.h
deleted file mode 120000
index 5cc4d8c45b8d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hdmi.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hdmi.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hotplug.c b/drivers/gpu/drm/x=
e/display/intel_hotplug.c
deleted file mode 120000
index a7f3bd35486e..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hotplug.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hotplug.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_hotplug.h b/drivers/gpu/drm/x=
e/display/intel_hotplug.h
deleted file mode 120000
index fb7de83b64fa..000000000000
--- a/drivers/gpu/drm/xe/display/intel_hotplug.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_hotplug.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_lpe_audio.h b/drivers/gpu/drm=
/xe/display/intel_lpe_audio.h
deleted file mode 120000
index 12ecf90e969e..000000000000
--- a/drivers/gpu/drm/xe/display/intel_lpe_audio.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_lpe_audio.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_lspcon.c b/drivers/gpu/drm/xe=
/display/intel_lspcon.c
deleted file mode 120000
index 24c00fa0a106..000000000000
--- a/drivers/gpu/drm/xe/display/intel_lspcon.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_lspcon.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_lspcon.h b/drivers/gpu/drm/xe=
/display/intel_lspcon.h
deleted file mode 120000
index 97c59ade9150..000000000000
--- a/drivers/gpu/drm/xe/display/intel_lspcon.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_lspcon.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_lvds.c b/drivers/gpu/drm/xe/d=
isplay/intel_lvds.c
deleted file mode 120000
index 9fbbb96a3564..000000000000
--- a/drivers/gpu/drm/xe/display/intel_lvds.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_lvds.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_lvds.h b/drivers/gpu/drm/xe/d=
isplay/intel_lvds.h
deleted file mode 120000
index 580c10fb55a2..000000000000
--- a/drivers/gpu/drm/xe/display/intel_lvds.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_lvds.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_modeset_setup.c b/drivers/gpu=
/drm/xe/display/intel_modeset_setup.c
deleted file mode 120000
index 8abfcfad8bd9..000000000000
--- a/drivers/gpu/drm/xe/display/intel_modeset_setup.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_modeset_setup.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_modeset_setup.h b/drivers/gpu=
/drm/xe/display/intel_modeset_setup.h
deleted file mode 120000
index 699532a8f408..000000000000
--- a/drivers/gpu/drm/xe/display/intel_modeset_setup.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_modeset_setup.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_modeset_verify.c b/drivers/gp=
u/drm/xe/display/intel_modeset_verify.c
deleted file mode 120000
index 74ed76570cdf..000000000000
--- a/drivers/gpu/drm/xe/display/intel_modeset_verify.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_modeset_verify.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_modeset_verify.h b/drivers/gp=
u/drm/xe/display/intel_modeset_verify.h
deleted file mode 120000
index ea64f21d0ac8..000000000000
--- a/drivers/gpu/drm/xe/display/intel_modeset_verify.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_modeset_verify.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_opregion.c b/drivers/gpu/drm/=
xe/display/intel_opregion.c
deleted file mode 120000
index 61b5f4c05b1d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_opregion.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_opregion.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_opregion.h b/drivers/gpu/drm/=
xe/display/intel_opregion.h
deleted file mode 120000
index 32db39fdec30..000000000000
--- a/drivers/gpu/drm/xe/display/intel_opregion.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_opregion.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_panel.c b/drivers/gpu/drm/xe/=
display/intel_panel.c
deleted file mode 120000
index 37ca379aa267..000000000000
--- a/drivers/gpu/drm/xe/display/intel_panel.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_panel.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_panel.h b/drivers/gpu/drm/xe/=
display/intel_panel.h
deleted file mode 120000
index 8ef48628d9f5..000000000000
--- a/drivers/gpu/drm/xe/display/intel_panel.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_panel.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pch_display.h b/drivers/gpu/d=
rm/xe/display/intel_pch_display.h
deleted file mode 120000
index 8faa264c0dac..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pch_display.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_pch_display.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pch_refclk.h b/drivers/gpu/dr=
m/xe/display/intel_pch_refclk.h
deleted file mode 120000
index 6bdb700f12e1..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pch_refclk.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_pch_refclk.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pipe_crc.c b/drivers/gpu/drm/=
xe/display/intel_pipe_crc.c
deleted file mode 120000
index 40bb44769ac3..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pipe_crc.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_pipe_crc.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pipe_crc.h b/drivers/gpu/drm/=
xe/display/intel_pipe_crc.h
deleted file mode 120000
index 2a6c75ff8f00..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pipe_crc.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_pipe_crc.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_plane_initial.h b/drivers/gpu=
/drm/xe/display/intel_plane_initial.h
deleted file mode 120000
index 1315223e9410..000000000000
--- a/drivers/gpu/drm/xe/display/intel_plane_initial.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_plane_initial.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pps.c b/drivers/gpu/drm/xe/di=
splay/intel_pps.c
deleted file mode 120000
index ce8eef664f23..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pps.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_pps.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_pps.h b/drivers/gpu/drm/xe/di=
splay/intel_pps.h
deleted file mode 120000
index 9aeac4c55ca6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_pps.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_pps.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_psr.c b/drivers/gpu/drm/xe/di=
splay/intel_psr.c
deleted file mode 120000
index 768587ae29df..000000000000
--- a/drivers/gpu/drm/xe/display/intel_psr.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_psr.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_psr.h b/drivers/gpu/drm/xe/di=
splay/intel_psr.h
deleted file mode 120000
index 3dda0616ccaf..000000000000
--- a/drivers/gpu/drm/xe/display/intel_psr.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_psr.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_qp_tables.c b/drivers/gpu/drm=
/xe/display/intel_qp_tables.c
deleted file mode 120000
index 966f911cddd9..000000000000
--- a/drivers/gpu/drm/xe/display/intel_qp_tables.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_qp_tables.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_qp_tables.h b/drivers/gpu/drm=
/xe/display/intel_qp_tables.h
deleted file mode 120000
index fe4260d5ce44..000000000000
--- a/drivers/gpu/drm/xe/display/intel_qp_tables.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_qp_tables.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_quirks.c b/drivers/gpu/drm/xe=
/display/intel_quirks.c
deleted file mode 120000
index b27e4f9cfe8a..000000000000
--- a/drivers/gpu/drm/xe/display/intel_quirks.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_quirks.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_quirks.h b/drivers/gpu/drm/xe=
/display/intel_quirks.h
deleted file mode 120000
index 2db941dc66f3..000000000000
--- a/drivers/gpu/drm/xe/display/intel_quirks.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_quirks.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_snps_phy.c b/drivers/gpu/drm/=
xe/display/intel_snps_phy.c
deleted file mode 120000
index b40e895077a1..000000000000
--- a/drivers/gpu/drm/xe/display/intel_snps_phy.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_snps_phy.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_snps_phy.h b/drivers/gpu/drm/=
xe/display/intel_snps_phy.h
deleted file mode 120000
index 737ee835ec1d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_snps_phy.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_snps_phy.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_snps_phy_regs.h b/drivers/gpu=
/drm/xe/display/intel_snps_phy_regs.h
deleted file mode 120000
index b5b12e9dea1e..000000000000
--- a/drivers/gpu/drm/xe/display/intel_snps_phy_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_snps_phy_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_sprite.c b/drivers/gpu/drm/xe=
/display/intel_sprite.c
deleted file mode 120000
index 5dc50a886417..000000000000
--- a/drivers/gpu/drm/xe/display/intel_sprite.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_sprite.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_sprite.h b/drivers/gpu/drm/xe=
/display/intel_sprite.h
deleted file mode 120000
index a33ed10f3203..000000000000
--- a/drivers/gpu/drm/xe/display/intel_sprite.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_sprite.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_tc.c b/drivers/gpu/drm/xe/dis=
play/intel_tc.c
deleted file mode 120000
index 529ea5e9af91..000000000000
--- a/drivers/gpu/drm/xe/display/intel_tc.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_tc.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_tc.h b/drivers/gpu/drm/xe/dis=
play/intel_tc.h
deleted file mode 120000
index cc9eb2e620d5..000000000000
--- a/drivers/gpu/drm/xe/display/intel_tc.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_tc.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_tc_phy_regs.h b/drivers/gpu/d=
rm/xe/display/intel_tc_phy_regs.h
deleted file mode 120000
index 99972b50c144..000000000000
--- a/drivers/gpu/drm/xe/display/intel_tc_phy_regs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_tc_phy_regs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vbt_defs.h b/drivers/gpu/drm/=
xe/display/intel_vbt_defs.h
deleted file mode 120000
index dd3b5c93e2e3..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vbt_defs.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vbt_defs.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vdsc.c b/drivers/gpu/drm/xe/d=
isplay/intel_vdsc.c
deleted file mode 120000
index 60ca4950dd4d..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vdsc.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vdsc.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vdsc.h b/drivers/gpu/drm/xe/d=
isplay/intel_vdsc.h
deleted file mode 120000
index 2b554d01cbc6..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vdsc.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vdsc.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vga.c b/drivers/gpu/drm/xe/di=
splay/intel_vga.c
deleted file mode 120000
index d4086ba46f1a..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vga.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vga.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vga.h b/drivers/gpu/drm/xe/di=
splay/intel_vga.h
deleted file mode 120000
index b404f3800e95..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vga.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vga.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vrr.c b/drivers/gpu/drm/xe/di=
splay/intel_vrr.c
deleted file mode 120000
index 6721f68892b4..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vrr.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vrr.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/intel_vrr.h b/drivers/gpu/drm/xe/di=
splay/intel_vrr.h
deleted file mode 120000
index a3d468fcac9b..000000000000
--- a/drivers/gpu/drm/xe/display/intel_vrr.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/intel_vrr.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/skl_scaler.c b/drivers/gpu/drm/xe/d=
isplay/skl_scaler.c
deleted file mode 120000
index 8df8eb3fafee..000000000000
--- a/drivers/gpu/drm/xe/display/skl_scaler.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/skl_scaler.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/skl_scaler.h b/drivers/gpu/drm/xe/d=
isplay/skl_scaler.h
deleted file mode 120000
index 90d00a96fea6..000000000000
--- a/drivers/gpu/drm/xe/display/skl_scaler.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/skl_scaler.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/skl_universal_plane.c b/drivers/gpu=
/drm/xe/display/skl_universal_plane.c
deleted file mode 120000
index f5f93ec6f66b..000000000000
--- a/drivers/gpu/drm/xe/display/skl_universal_plane.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/skl_universal_plane.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/skl_universal_plane.h b/drivers/gpu=
/drm/xe/display/skl_universal_plane.h
deleted file mode 120000
index 89c89dffc2f7..000000000000
--- a/drivers/gpu/drm/xe/display/skl_universal_plane.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/skl_universal_plane.h
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/skl_watermark.c b/drivers/gpu/drm/x=
e/display/skl_watermark.c
deleted file mode 120000
index 2ec3b47dbd72..000000000000
--- a/drivers/gpu/drm/xe/display/skl_watermark.c
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/skl_watermark.c
\ No newline at end of file
diff --git a/drivers/gpu/drm/xe/display/skl_watermark.h b/drivers/gpu/drm/x=
e/display/skl_watermark.h
deleted file mode 120000
index e9351cb0c6f7..000000000000
--- a/drivers/gpu/drm/xe/display/skl_watermark.h
+++ /dev/null
@@ -1 +0,0 @@
-../../i915/display/skl_watermark.h
\ No newline at end of file
--=20
2.39.0

