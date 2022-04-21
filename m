Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D5C50991A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9205F10F5E4;
	Thu, 21 Apr 2022 07:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA4A10F5E0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:31:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 495CD21115;
 Thu, 21 Apr 2022 07:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650526270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Kl+ZKA6UG2OZEDx6bTmNz4BjgJ9HRS/sRdIuINmbi2Q=;
 b=mxBvYFNWZ2AMGmkQI28hSGtN2tybph/ZU+MVAA8W1rMPZSX1DhkkhOX58ge8nJGwYlKFyi
 EGUDXuom6BkyrBbTTB62IWDYeK47WTxccWZimT9YM4UWhvTkeGGvZOf3szpe+foChldAyJ
 KF3yHPuivIjCqTMaSOuH67DtR+2DPn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650526270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Kl+ZKA6UG2OZEDx6bTmNz4BjgJ9HRS/sRdIuINmbi2Q=;
 b=SZoRccAkFslNZ3pTvKxdjQVognYfqaCbGBzHXTqByHgBWS/jDlGnEQX7mBcEdlJoPV3iSG
 AmHwh8SlVbvwBGAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F4F413A84;
 Thu, 21 Apr 2022 07:31:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DZIXAj4IYWIzDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 07:31:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com,
 javierm@redhat.com
Subject: [PATCH v3 0/8] drm: Introduce display-helper library
Date: Thu, 21 Apr 2022 09:31:00 +0200
Message-Id: <20220421073108.19226-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move DisplayPort, HDMI and various other display helpers from KMS
helpers into a new module. Adapt all drivers.

This patch is part of an on-going effort to reduce the minimum size
of DRM when linked into the kernel binary. The helpers for various
display and video-output standards are not required for minimal
graphics output and can be moved into a separate module.

The DisplayPort code was already part of the DP module, which now
forms the base of the display-helper module. Moving other helpers
into the new module reduces KMS helpers by ~14 KiB (from 243 KiB to
229 KiB). More importantly, restructuring the code allows for a more
fine-grained selection of helpers and dependencies.

Built on x86-64, i586, aarch64, and arm.

v3:
	* fix Kconfig dependencies (Javier)
v2:
	* reduce number of HDMI helpers (Jani)
	* make individual helpers selectable via Kconfig
	* fix several include statements
	* minor cleanups

Thomas Zimmermann (8):
  drm: Put related statements next to each other in Makefile
  drm: Rename dp/ to display/
  drm/display: Introduce a DRM display-helper module
  drm/display: Split DisplayPort header into core and helper
  drm/display: Move DSC header and helpers into display-helper module
  drm/display: Move HDCP helpers into display-helper module
  drm/display: Move HDMI helpers into display-helper module
  drm/display: Move SCDC helpers into display-helper library

 Documentation/gpu/drm-kms-helpers.rst         |  43 +-
 drivers/gpu/drm/Kconfig                       |  40 +-
 drivers/gpu/drm/Makefile                      |  29 +-
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |   4 +-
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |   3 +-
 drivers/gpu/drm/amd/display/Kconfig           |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   5 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |   2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   4 +-
 .../drm/amd/display/dc/core/dc_link_dpcd.c    |   2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c  |   2 +
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h  |   2 +-
 .../drm/amd/display/dc/dml/dsc/rc_calc_fpu.h  |   2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |   4 +-
 .../gpu/drm/amd/display/dc/dsc/dscc_types.h   |   2 +-
 .../gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c  |   2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h     |   2 +-
 .../gpu/drm/amd/display/include/dpcd_defs.h   |   2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp.h   |   4 +-
 drivers/gpu/drm/bridge/Kconfig                |  16 +-
 drivers/gpu/drm/bridge/analogix/Kconfig       |  10 +-
 .../drm/bridge/analogix/analogix-anx6345.c    |   2 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |   2 +-
 .../drm/bridge/analogix/analogix-i2c-dptx.c   |   2 +-
 .../drm/bridge/analogix/analogix_dp_core.h    |   2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |   6 +-
 drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |   4 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |   2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |   2 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |   4 +-
 drivers/gpu/drm/bridge/parade-ps8640.c        |   4 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig       |   2 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   4 +-
 drivers/gpu/drm/bridge/tc358767.c             |   2 +-
 drivers/gpu/drm/bridge/tc358775.c             |   2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |   4 +-
 drivers/gpu/drm/display/Kconfig               |  49 ++
 drivers/gpu/drm/display/Makefile              |  16 +
 .../drm_display_helper_mod.c}                 |  10 +-
 .../gpu/drm/{dp => display}/drm_dp_aux_bus.c  |   4 +-
 .../gpu/drm/{dp => display}/drm_dp_aux_dev.c  |   4 +-
 drivers/gpu/drm/{dp => display}/drm_dp_cec.c  |   2 +-
 .../{dp => display}/drm_dp_dual_mode_helper.c |   2 +-
 .../{dp/drm_dp.c => display/drm_dp_helper.c}  |   4 +-
 .../{dp => display}/drm_dp_helper_internal.h  |   0
 .../drm/{dp => display}/drm_dp_mst_topology.c |   2 +-
 .../drm_dp_mst_topology_internal.h            |   2 +-
 .../{drm_dsc.c => display/drm_dsc_helper.c}   |   5 +-
 .../{drm_hdcp.c => display/drm_hdcp_helper.c} |   4 +-
 drivers/gpu/drm/display/drm_hdmi_helper.c     | 199 +++++
 .../gpu/drm/{ => display}/drm_scdc_helper.c   |   3 +-
 drivers/gpu/drm/dp/Makefile                   |   9 -
 drivers/gpu/drm/drm_connector.c               |  34 -
 drivers/gpu/drm/drm_edid.c                    | 160 ----
 drivers/gpu/drm/drm_mipi_dsi.c                |   6 +-
 drivers/gpu/drm/exynos/Kconfig                |   3 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |   2 +-
 drivers/gpu/drm/gma500/intel_bios.c           |   3 +-
 drivers/gpu/drm/i915/Kconfig                  |   5 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   1 +
 drivers/gpu/drm/i915/display/intel_bios.c     |   3 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   2 +-
 .../drm/i915/display/intel_display_types.h    |   6 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |   5 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |   6 +-
 .../drm/i915/display/intel_dp_link_training.h |   2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   5 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |   4 +-
 .../gpu/drm/i915/display/intel_qp_tables.c    |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   1 +
 drivers/gpu/drm/i915/display/intel_vdsc.c     |   2 +
 drivers/gpu/drm/msm/Kconfig                   |   3 +-
 drivers/gpu/drm/msm/dp/dp_audio.c             |   2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h               |   2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |   3 +-
 drivers/gpu/drm/msm/edp/edp.h                 |   3 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c            |   3 +-
 drivers/gpu/drm/nouveau/Kconfig               |   4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |   6 +-
 drivers/gpu/drm/panel/Kconfig                 |   3 +-
 drivers/gpu/drm/panel/panel-edp.c             |   4 +-
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  |   4 +-
 drivers/gpu/drm/radeon/atombios_dp.c          |   2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |   2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |   2 +-
 drivers/gpu/drm/radeon/radeon_mode.h          |   4 +-
 drivers/gpu/drm/rockchip/Kconfig              |   4 +-
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |   2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |   2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |   2 +-
 .../drm/selftests/test-drm_dp_mst_helper.c    |   4 +-
 drivers/gpu/drm/tegra/Kconfig                 |   4 +-
 drivers/gpu/drm/tegra/dp.c                    |   2 +-
 drivers/gpu/drm/tegra/dpaux.c                 |   4 +-
 drivers/gpu/drm/tegra/sor.c                   |   4 +-
 drivers/gpu/drm/vc4/Kconfig                   |   2 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   4 +-
 drivers/gpu/drm/xlnx/Kconfig                  |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |   2 +-
 drivers/misc/mei/hdcp/mei_hdcp.h              |   2 +-
 .../{dp/drm_dp_helper.h => display/drm_dp.h}  | 698 +----------------
 include/drm/{dp => display}/drm_dp_aux_bus.h  |   0
 .../{dp => display}/drm_dp_dual_mode_helper.h |   0
 include/drm/display/drm_dp_helper.h           | 722 ++++++++++++++++++
 .../drm/{dp => display}/drm_dp_mst_helper.h   |   2 +-
 include/drm/{ => display}/drm_dsc.h           |   8 +-
 include/drm/display/drm_dsc_helper.h          |  20 +
 include/drm/{ => display}/drm_hdcp.h          |  14 +-
 include/drm/display/drm_hdcp_helper.h         |  22 +
 include/drm/display/drm_hdmi_helper.h         |  27 +
 .../{drm_scdc_helper.h => display/drm_scdc.h} |  52 +-
 include/drm/display/drm_scdc_helper.h         |  79 ++
 include/drm/drm_connector.h                   |   3 -
 include/drm/drm_edid.h                        |  12 -
 include/drm/i915_mei_hdcp_interface.h         |   2 +-
 127 files changed, 1382 insertions(+), 1187 deletions(-)
 create mode 100644 drivers/gpu/drm/display/Kconfig
 create mode 100644 drivers/gpu/drm/display/Makefile
 rename drivers/gpu/drm/{dp/drm_dp_helper_mod.c => display/drm_display_helper_mod.c} (51%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_aux_bus.c (99%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_aux_dev.c (99%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_cec.c (99%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_dual_mode_helper.c (99%)
 rename drivers/gpu/drm/{dp/drm_dp.c => display/drm_dp_helper.c} (99%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_helper_internal.h (100%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_mst_topology.c (99%)
 rename drivers/gpu/drm/{dp => display}/drm_dp_mst_topology_internal.h (94%)
 rename drivers/gpu/drm/{drm_dsc.c => display/drm_dsc_helper.c} (99%)
 rename drivers/gpu/drm/{drm_hdcp.c => display/drm_hdcp_helper.c} (99%)
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_helper.c
 rename drivers/gpu/drm/{ => display}/drm_scdc_helper.c (99%)
 delete mode 100644 drivers/gpu/drm/dp/Makefile
 rename include/drm/{dp/drm_dp_helper.h => display/drm_dp.h} (74%)
 rename include/drm/{dp => display}/drm_dp_aux_bus.h (100%)
 rename include/drm/{dp => display}/drm_dp_dual_mode_helper.h (100%)
 create mode 100644 include/drm/display/drm_dp_helper.h
 rename include/drm/{dp => display}/drm_dp_mst_helper.h (99%)
 rename include/drm/{ => display}/drm_dsc.h (97%)
 create mode 100644 include/drm/display/drm_dsc_helper.h
 rename include/drm/{ => display}/drm_hdcp.h (95%)
 create mode 100644 include/drm/display/drm_hdcp_helper.h
 create mode 100644 include/drm/display/drm_hdmi_helper.h
 rename include/drm/{drm_scdc_helper.h => display/drm_scdc.h} (65%)
 create mode 100644 include/drm/display/drm_scdc_helper.h


base-commit: d97978df553d768e457cb68c637b2b0a6188b87c
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 171147059747f2df58a2eceade4375d365bfb525
prerequisite-patch-id: 7a0633e1d5a688c6b2a17b61afe13ab529e6e3cb
prerequisite-patch-id: 42766bc91909134bef7001ad67774cc3523645f2
prerequisite-patch-id: fd18625b82ac9a6fdff3a4b085a7130eb1aa869e
-- 
2.35.1

