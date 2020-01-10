Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA81369A9
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 10:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4066F6E9AE;
	Fri, 10 Jan 2020 09:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF006E99E;
 Fri, 10 Jan 2020 09:21:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FA18B016;
 Fri, 10 Jan 2020 09:21:33 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com,
 maarten.lankhorst@linux.intel.com, patrik.r.jakobsson@gmail.com,
 robdclark@gmail.com, sean@poorly.run, benjamin.gaignard@linaro.org,
 vincent.abriou@st.com, yannick.fertre@st.com, philippe.cornu@st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com, eric@anholt.net,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: [PATCH 00/23] drm: Clean up VBLANK callbacks in struct drm_driver
Date: Fri, 10 Jan 2020 10:21:04 +0100
Message-Id: <20200110092127.27847-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VBLANK handlers in struct drm_driver are deprecated. Only legacy,
non-KMS drivers are supposed to used them. DRM drivers with kernel
modesetting are supposed to use VBLANK callbacks of the CRTC
infrastructure.

This patchset converts all DRM drivers to CRTC VBLANK callbacks and
cleans up struct drm_driver. The remaining VBLANK callbacks in struct
drm_driver are only used by legacy drivers.

Patches 1 to 9 move get_scanout_position() to struct drm_crtc_helper_funcs
and convert drivers over. The callback is a helper for the default
implementation of get_vblank_timestamp() (i.e.,
drm_calc_vbltimestamp_from_scanoutpos()). The original callback is removed
from struct drm_driver.

Patch 10 changes the VBLANK code to evaluate vblank_disable_immediate in
struct derm_device. This simplifies the later integration of CRTC VBLANK
callbacks. If necessary, a future patch could move vblank_disable_immedate
to struct drm_crtc, so that high-precision VBLANKs could be enabled on a
per-CRTC basis.

Patches 11 to 23 move get_vblank_timestamp() to struct drm_crtc_funcs
and convert DRM drivers over. All VBLANK callbacks are removed from
struct drm_driver, except for get_vblank_counter(), enable_vblank(), and
disable_vblank(). These interfaces are moved to the legacy section
at the end of the structure.

To cover all affected drivers, I build the patchset in x86, x86-64,
arm and aarch64. I smoke-tested amdgpu, gma500, i915, radeon and vc4 on
respective hardware.

Thomas Zimmermann (23):
  drm: Add get_scanout_position() to struct drm_crtc_helper_funcs
  drm/amdgpu: Convert to struct
    drm_crtc_helper_funcs.get_scanout_position()
  drm/i915: Don't use struct drm_driver.get_scanout_position()
  drm/nouveau: Convert to struct
    drm_crtc_helper_funcs.get_scanout_position()
  drm/radeon: Convert to struct
    drm_crtc_helper_funcs.get_scanout_position()
  drm/msm: Convert to struct
    drm_crtc_helper_funcs.get_scanout_position()
  drm/vc4: Convert to struct
    drm_crtc_helper_funcs.get_scanout_position()
  drm/stm: Convert to struct
    drm_crtc_helper_funcs.get_scanout_position()
  drm: Remove struct drm_driver.get_scanout_position()
  drm: Evaluate struct drm_device.vblank_disable_immediate on each use
  drm: Add get_vblank_timestamp() to struct drm_crtc_funcs
  drm/amdgpu: Convert to CRTC VBLANK callbacks
  drm/gma500: Convert to CRTC VBLANK callbacks
  drm/i915: Convert to CRTC VBLANK callbacks
  drm/msm: Convert to CRTC VBLANK callbacks
  drm/nouveau: Convert to CRTC VBLANK callbacks
  drm/radeon: Convert to CRTC VBLANK callbacks
  drm/sti: Convert to CRTC VBLANK callbacks
  drm/stm: Convert to CRTC VBLANK callbacks
  drm/vc4: Convert to CRTC VBLANK callbacks
  drm/vkms: Convert to CRTC VBLANK callbacks
  drm/vmwgfx: Convert to CRTC VBLANK callbacks
  drm: Cleanup VBLANK callbacks in struct drm_driver

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  12 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  15 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       |  24 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |   5 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |   5 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |   5 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |   5 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |   5 +
 drivers/gpu/drm/amd/amdgpu/dce_virtual.c      |   5 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   5 +-
 drivers/gpu/drm/drm_vblank.c                  | 128 +++++++++-----
 drivers/gpu/drm/gma500/cdv_intel_display.c    |   3 +
 drivers/gpu/drm/gma500/psb_drv.c              |   4 -
 drivers/gpu/drm/gma500/psb_drv.h              |   6 +-
 drivers/gpu/drm/gma500/psb_intel_display.c    |   3 +
 drivers/gpu/drm/gma500/psb_irq.c              |  12 +-
 drivers/gpu/drm/gma500/psb_irq.h              |   7 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   7 +
 drivers/gpu/drm/i915/i915_drv.c               |   3 -
 drivers/gpu/drm/i915/i915_irq.c               | 110 +++++++++++-
 drivers/gpu/drm/i915/i915_irq.h               |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |   2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |  82 +++++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  95 -----------
 drivers/gpu/drm/msm/msm_drv.c                 |  10 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   3 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |   4 +
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   5 +
 drivers/gpu/drm/nouveau/nouveau_display.c     |  28 +---
 drivers/gpu/drm/nouveau/nouveau_display.h     |   6 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   5 -
 drivers/gpu/drm/radeon/atombios_crtc.c        |   1 +
 drivers/gpu/drm/radeon/radeon_display.c       |  25 ++-
 drivers/gpu/drm/radeon/radeon_drv.c           |  18 --
 drivers/gpu/drm/radeon/radeon_kms.c           |  29 ++--
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |   3 +-
 drivers/gpu/drm/radeon/radeon_mode.h          |   6 +
 drivers/gpu/drm/sti/sti_crtc.c                |  11 +-
 drivers/gpu/drm/sti/sti_crtc.h                |   2 -
 drivers/gpu/drm/sti/sti_drv.c                 |   3 -
 drivers/gpu/drm/stm/drv.c                     |   2 -
 drivers/gpu/drm/stm/ltdc.c                    |  66 ++++----
 drivers/gpu/drm/stm/ltdc.h                    |   5 -
 drivers/gpu/drm/vc4/vc4_crtc.c                |  13 +-
 drivers/gpu/drm/vc4/vc4_drv.c                 |   3 -
 drivers/gpu/drm/vc4/vc4_drv.h                 |   4 -
 drivers/gpu/drm/vkms/vkms_crtc.c              |   9 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |   1 -
 drivers/gpu/drm/vkms/vkms_drv.h               |   4 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           |   8 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c           |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c          |   5 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c          |   3 +
 include/drm/drm_crtc.h                        |  41 +++++
 include/drm/drm_drv.h                         | 156 +-----------------
 include/drm/drm_modeset_helper_vtables.h      |  47 ++++++
 include/drm/drm_vblank.h                      |   4 +
 61 files changed, 631 insertions(+), 474 deletions(-)

--
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
