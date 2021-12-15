Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD34756B9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1B10E40B;
	Wed, 15 Dec 2021 10:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAE610E3B9;
 Wed, 15 Dec 2021 10:43:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4601E1F382;
 Wed, 15 Dec 2021 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639565001; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M2oalJH/koH3roTDPDbPSrvJue1i8o+dUOZK+n2x69g=;
 b=dfzvyDT/oZssAW6P5PRwf4LbbkB0n/PE91+XthjAV3IWhhqI1q2IdUYG1klgx8xKJg4NI2
 xFgjZ3CGlSMTHEO/I5dhzdiZuRR9rcAT2Bpn79yUXDL2ZSgP+9IN1qTSxSUqTdLG/lqLVP
 lZlvojmtJJE1FvjV4CcVMaz56pKTrns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639565001;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=M2oalJH/koH3roTDPDbPSrvJue1i8o+dUOZK+n2x69g=;
 b=Xvr0A3vYEvRf7IvTydmZLjcghPcqKy7Jq8qGRY0vRo94entLQawFpekUISARriGABGY6Uj
 yemJ3KmIrtHiJqAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EECD413B1C;
 Wed, 15 Dec 2021 10:43:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SVlROcjGuWH1eAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 10:43:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com
Subject: [PATCH v2 0/5] drm/dp: Move DisplayPort helpers into own module
Date: Wed, 15 Dec 2021 11:43:12 +0100
Message-Id: <20211215104318.18866-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split-off DisplayPort functions from KMS helper library and move them
into their own module. Reduces the size of drm_kms_helper.ko by ~50%.

This patchset is part of an on-going effort to reduce the minimum
binary size of the DRM core and helpers. It's helpful for systems with
early-boot DRM graphics, which requires DRM to be linked into the
kernel image.

v2:
	* move helper library into subdirectory (Jani)
	* also move DP AUX bus helpers

Thomas Zimmermann (5):
  drm/dp_mst: Remove trailing whitespace.
  drm/dp: Move DP declarations into separate header file
  drm/dp: Move DisplayPort helpers into separate helper module
  drm/dp: Move public DisplayPort headers into dp/
  drm/dp: Move DisplayPort AUX bus helpers into dp/

 drivers/gpu/drm/Kconfig                       |  8 +++++
 drivers/gpu/drm/Makefile                      | 12 +++----
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |  4 +--
 drivers/gpu/drm/amd/amdgpu/atombios_dp.c      |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  4 +--
 .../drm/amd/display/dc/core/dc_link_dpcd.c    |  2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |  2 +-
 drivers/gpu/drm/amd/display/dc/os_types.h     |  2 +-
 .../gpu/drm/amd/display/include/dpcd_defs.h   |  2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp.h   |  2 +-
 drivers/gpu/drm/bridge/Kconfig                |  4 +++
 drivers/gpu/drm/bridge/analogix/Kconfig       |  2 ++
 .../drm/bridge/analogix/analogix-anx6345.c    |  2 +-
 .../drm/bridge/analogix/analogix-anx78xx.c    |  2 +-
 .../drm/bridge/analogix/analogix-i2c-dptx.c   |  2 +-
 .../drm/bridge/analogix/analogix_dp_core.h    |  2 +-
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  2 +-
 drivers/gpu/drm/bridge/cadence/Kconfig        |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  2 +-
 drivers/gpu/drm/bridge/parade-ps8640.c        |  4 +--
 drivers/gpu/drm/bridge/tc358767.c             |  2 +-
 drivers/gpu/drm/bridge/tc358775.c             |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  4 +--
 drivers/gpu/drm/dp/Makefile                   |  9 +++++
 .../gpu/drm/{drm_dp_helper.c => dp/drm_dp.c}  |  6 ++--
 drivers/gpu/drm/{ => dp}/drm_dp_aux_bus.c     |  4 +--
 drivers/gpu/drm/{ => dp}/drm_dp_aux_dev.c     |  6 ++--
 drivers/gpu/drm/{ => dp}/drm_dp_cec.c         |  2 +-
 .../drm/{ => dp}/drm_dp_dual_mode_helper.c    |  2 +-
 drivers/gpu/drm/dp/drm_dp_helper_internal.h   | 33 +++++++++++++++++++
 drivers/gpu/drm/dp/drm_dp_helper_mod.c        | 22 +++++++++++++
 .../gpu/drm/{ => dp}/drm_dp_mst_topology.c    |  6 ++--
 .../{ => dp}/drm_dp_mst_topology_internal.h   |  2 +-
 drivers/gpu/drm/drm_crtc_helper_internal.h    | 27 ---------------
 drivers/gpu/drm/drm_dsc.c                     |  2 +-
 drivers/gpu/drm/drm_kms_helper_common.c       | 14 --------
 drivers/gpu/drm/gma500/cdv_intel_dp.c         |  2 +-
 drivers/gpu/drm/gma500/intel_bios.c           |  2 +-
 drivers/gpu/drm/i915/Kconfig                  |  1 +
 drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  2 +-
 .../drm/i915/display/intel_display_types.h    |  4 +--
 drivers/gpu/drm/i915/display/intel_dp.c       |  2 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  4 +--
 .../drm/i915/display/intel_dp_link_training.h |  2 +-
 drivers/gpu/drm/i915/display/intel_lspcon.c   |  2 +-
 drivers/gpu/drm/msm/Kconfig                   |  1 +
 drivers/gpu/drm/msm/dp/dp_audio.c             |  2 +-
 drivers/gpu/drm/msm/dp/dp_aux.h               |  2 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  2 +-
 drivers/gpu/drm/msm/edp/edp.h                 |  2 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c            |  2 +-
 drivers/gpu/drm/nouveau/Kconfig               |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.h   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h     |  4 +--
 drivers/gpu/drm/panel/panel-edp.c             |  4 +--
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  |  4 +--
 drivers/gpu/drm/radeon/atombios_dp.c          |  2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_mode.h          |  4 +--
 drivers/gpu/drm/rockchip/Kconfig              |  1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
 drivers/gpu/drm/rockchip/rockchip_lvds.c      |  2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c       |  2 +-
 .../drm/selftests/test-drm_dp_mst_helper.c    |  2 +-
 drivers/gpu/drm/tegra/Kconfig                 |  1 +
 drivers/gpu/drm/tegra/dp.c                    |  2 +-
 drivers/gpu/drm/tegra/dpaux.c                 |  2 +-
 drivers/gpu/drm/tegra/sor.c                   |  2 +-
 drivers/gpu/drm/xlnx/Kconfig                  |  1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c              |  2 +-
 include/drm/{ => dp}/drm_dp_aux_bus.h         |  0
 .../drm/{ => dp}/drm_dp_dual_mode_helper.h    |  0
 include/drm/{ => dp}/drm_dp_helper.h          |  0
 include/drm/{ => dp}/drm_dp_mst_helper.h      |  2 +-
 include/drm/drm_dsc.h                         |  2 +-
 86 files changed, 173 insertions(+), 133 deletions(-)
 create mode 100644 drivers/gpu/drm/dp/Makefile
 rename drivers/gpu/drm/{drm_dp_helper.c => dp/drm_dp.c} (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_aux_bus.c (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_aux_dev.c (98%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_cec.c (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_dual_mode_helper.c (99%)
 create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_internal.h
 create mode 100644 drivers/gpu/drm/dp/drm_dp_helper_mod.c
 rename drivers/gpu/drm/{ => dp}/drm_dp_mst_topology.c (99%)
 rename drivers/gpu/drm/{ => dp}/drm_dp_mst_topology_internal.h (94%)
 rename include/drm/{ => dp}/drm_dp_aux_bus.h (100%)
 rename include/drm/{ => dp}/drm_dp_dual_mode_helper.h (100%)
 rename include/drm/{ => dp}/drm_dp_helper.h (100%)
 rename include/drm/{ => dp}/drm_dp_mst_helper.h (99%)


base-commit: 3f422828221d9ceefcddef0be33561b1646a1cbe
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: d7624cd450e9961cb3a1efa61f906213316ab2a5
--
2.34.1

