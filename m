Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE80E8B0B9A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF48113B7F;
	Wed, 24 Apr 2024 13:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ks4wYu2+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE878113B7A;
 Wed, 24 Apr 2024 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713966916; x=1745502916;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bEpLXpXJZlO7QVOIBwyX7K/h0f9lrxOzKxmYdFse+2E=;
 b=Ks4wYu2+9k0F0+1nSeqgvHn42hfCr8SXbQZ5pFF5GiUTyGqgY/TUoBJj
 HvT3/D9NrSS+2SA6+fG4IogoisPVW7vZMZnZiri+/WQxqix+UHp5XZAcy
 toP5M/nRxO1Er5iog7MUNgOlXIQwxBXxbHoIV6lJs4ISvakNuCo2tIQ6a
 BeNuCquMRfmI2K23eK4U/dIbFF7+Z0MeRZ6/LvpxpAb+IfeVwsqQ+cGMR
 PVzvGU/ald5ePQU/GydFgO+x70g00TWN5EF+gQiQTFULD0wd1qbYQZyDq
 +84lIXo0i63ywhO8trLcu7No42ztlQtrvmQ3yqFoSJWjS+v28y+sliHaz g==;
X-CSE-ConnectionGUID: /6WNjQGsSo2NWxgExrLAlA==
X-CSE-MsgGUID: c207XUx/QbOLqLfcuTWcUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="13387919"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="13387919"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 06:55:14 -0700
X-CSE-ConnectionGUID: 6lRKGZa/SbG8032P/JXUkQ==
X-CSE-MsgGUID: 1M71Elb/QmqaiqUmCHIKGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="25234526"
Received: from vgrigo2x-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.49])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 06:55:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard
 <mripard@kernel.org>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Huang Rui <ray.huang@amd.com>, Zack Rusin
 <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/print: drop include debugfs.h and include where
 needed
In-Reply-To: <20240422121011.4133236-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240422121011.4133236-1-jani.nikula@intel.com>
Date: Wed, 24 Apr 2024 16:54:59 +0300
Message-ID: <87v846q30s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Surprisingly many places depend on debugfs.h to be included via
> drm_print.h. Fix them.
>
> v3: Also fix armada, ite-it6505, imagination, msm, sti, vc4, and xe
>
> v2: Also fix ivpu and vmwgfx
>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20240410141434.157908=
-1-jani.nikula@intel.com
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

While the changes all over the place are small, mostly just adding the
debugfs.h include, please consider acking. I've sent this a few times
already.

Otherwise, I'll merge this by the end of the week, acks or not.

Thanks,
Jani.



>
> ---
>
> Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Cc: Oded Gabbay <ogabbay@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
> ---
>  drivers/accel/ivpu/ivpu_debugfs.c           | 2 ++
>  drivers/gpu/drm/armada/armada_debugfs.c     | 1 +
>  drivers/gpu/drm/bridge/ite-it6505.c         | 1 +
>  drivers/gpu/drm/bridge/panel.c              | 2 ++
>  drivers/gpu/drm/drm_print.c                 | 6 +++---
>  drivers/gpu/drm/i915/display/intel_dmc.c    | 1 +
>  drivers/gpu/drm/imagination/pvr_fw_trace.c  | 1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 ++
>  drivers/gpu/drm/nouveau/dispnv50/crc.c      | 2 ++
>  drivers/gpu/drm/radeon/r100.c               | 1 +
>  drivers/gpu/drm/radeon/r300.c               | 1 +
>  drivers/gpu/drm/radeon/r420.c               | 1 +
>  drivers/gpu/drm/radeon/r600.c               | 3 ++-
>  drivers/gpu/drm/radeon/radeon_fence.c       | 1 +
>  drivers/gpu/drm/radeon/radeon_gem.c         | 1 +
>  drivers/gpu/drm/radeon/radeon_ib.c          | 2 ++
>  drivers/gpu/drm/radeon/radeon_pm.c          | 1 +
>  drivers/gpu/drm/radeon/radeon_ring.c        | 2 ++
>  drivers/gpu/drm/radeon/radeon_ttm.c         | 1 +
>  drivers/gpu/drm/radeon/rs400.c              | 1 +
>  drivers/gpu/drm/radeon/rv515.c              | 1 +
>  drivers/gpu/drm/sti/sti_drv.c               | 1 +
>  drivers/gpu/drm/ttm/ttm_device.c            | 1 +
>  drivers/gpu/drm/ttm/ttm_resource.c          | 3 ++-
>  drivers/gpu/drm/ttm/ttm_tt.c                | 5 +++--
>  drivers/gpu/drm/vc4/vc4_drv.h               | 1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c         | 2 ++
>  drivers/gpu/drm/xe/xe_debugfs.c             | 1 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c          | 2 ++
>  drivers/gpu/drm/xe/xe_uc_debugfs.c          | 2 ++
>  include/drm/drm_print.h                     | 2 +-
>  31 files changed, 46 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_debugfs.c b/drivers/accel/ivpu/ivpu_=
debugfs.c
> index d09d29775b3f..e07e447d08d1 100644
> --- a/drivers/accel/ivpu/ivpu_debugfs.c
> +++ b/drivers/accel/ivpu/ivpu_debugfs.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2020-2023 Intel Corporation
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_print.h>
> diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/ar=
mada/armada_debugfs.c
> index 29f4b52e3c8d..a763349dd89f 100644
> --- a/drivers/gpu/drm/armada/armada_debugfs.c
> +++ b/drivers/gpu/drm/armada/armada_debugfs.c
> @@ -5,6 +5,7 @@
>   */
>=20=20
>  #include <linux/ctype.h>
> +#include <linux/debugfs.h>
>  #include <linux/module.h>
>  #include <linux/seq_file.h>
>  #include <linux/uaccess.h>
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge=
/ite-it6505.c
> index 27334173e911..3f68c82888c2 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2020, The Linux Foundation. All rights reserved.
>   */
>  #include <linux/bits.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 7f41525f7a6e..32506524d9a2 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -4,6 +4,8 @@
>   * Copyright (C) 2017 Broadcom
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_connector.h>
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 699b7dbffd7b..cf2efb44722c 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -23,13 +23,13 @@
>   * Rob Clark <robdclark@gmail.com>
>   */
>=20=20
> -#include <linux/stdarg.h>
> -
> +#include <linux/debugfs.h>
> +#include <linux/dynamic_debug.h>
>  #include <linux/io.h>
>  #include <linux/moduleparam.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> -#include <linux/dynamic_debug.h>
> +#include <linux/stdarg.h>
>=20=20
>  #include <drm/drm.h>
>  #include <drm/drm_drv.h>
> diff --git a/drivers/gpu/drm/i915/display/intel_dmc.c b/drivers/gpu/drm/i=
915/display/intel_dmc.c
> index 3697a02b51b6..09346afd1f0e 100644
> --- a/drivers/gpu/drm/i915/display/intel_dmc.c
> +++ b/drivers/gpu/drm/i915/display/intel_dmc.c
> @@ -22,6 +22,7 @@
>   *
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>=20=20
>  #include "i915_drv.h"
> diff --git a/drivers/gpu/drm/imagination/pvr_fw_trace.c b/drivers/gpu/drm=
/imagination/pvr_fw_trace.c
> index 31199e45b72e..73707daa4e52 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw_trace.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw_trace.c
> @@ -12,6 +12,7 @@
>=20=20
>  #include <linux/build_bug.h>
>  #include <linux/dcache.h>
> +#include <linux/debugfs.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
>=20=20
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_hw_sspp.c
> index 0bf8a83e8df3..8586f2761782 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -2,6 +2,8 @@
>  /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include "dpu_hwio.h"
>  #include "dpu_hw_catalog.h"
>  #include "dpu_hw_lm.h"
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nou=
veau/dispnv50/crc.c
> index 9c942fbd836d..5936b6b3b15d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: MIT
> +#include <linux/debugfs.h>
>  #include <linux/string.h>
> +
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
> index 86b8b770af19..0b1e19345f43 100644
> --- a/drivers/gpu/drm/radeon/r100.c
> +++ b/drivers/gpu/drm/radeon/r100.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/r300.c b/drivers/gpu/drm/radeon/r300.c
> index 25201b9a5aae..1620f534f55f 100644
> --- a/drivers/gpu/drm/radeon/r300.c
> +++ b/drivers/gpu/drm/radeon/r300.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r420.c b/drivers/gpu/drm/radeon/r420.c
> index eae8a6389f5e..a979662eaa73 100644
> --- a/drivers/gpu/drm/radeon/r420.c
> +++ b/drivers/gpu/drm/radeon/r420.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/pci.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
> diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
> index b5e97d95a19f..087d41e370fd 100644
> --- a/drivers/gpu/drm/radeon/r600.c
> +++ b/drivers/gpu/drm/radeon/r600.c
> @@ -26,11 +26,12 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/slab.h>
>  #include <linux/seq_file.h>
> +#include <linux/slab.h>
>=20=20
>  #include <drm/drm_device.h>
>  #include <drm/drm_vblank.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_fence.c b/drivers/gpu/drm/rade=
on/radeon_fence.c
> index 9ebe4a0b9a6c..4fb780d96f32 100644
> --- a/drivers/gpu/drm/radeon/radeon_fence.c
> +++ b/drivers/gpu/drm/radeon/radeon_fence.c
> @@ -30,6 +30,7 @@
>   */
>=20=20
>  #include <linux/atomic.h>
> +#include <linux/debugfs.h>
>  #include <linux/firmware.h>
>  #include <linux/kref.h>
>  #include <linux/sched/signal.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon=
/radeon_gem.c
> index 3fec3acdaf28..2ef201a072f1 100644
> --- a/drivers/gpu/drm/radeon/radeon_gem.c
> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/iosys-map.h>
>  #include <linux/pci.h>
>=20=20
> diff --git a/drivers/gpu/drm/radeon/radeon_ib.c b/drivers/gpu/drm/radeon/=
radeon_ib.c
> index fb9ecf5dbe2b..63d914f3414d 100644
> --- a/drivers/gpu/drm/radeon/radeon_ib.c
> +++ b/drivers/gpu/drm/radeon/radeon_ib.c
> @@ -27,6 +27,8 @@
>   *          Christian K=C3=B6nig
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_file.h>
>=20=20
>  #include "radeon.h"
> diff --git a/drivers/gpu/drm/radeon/radeon_pm.c b/drivers/gpu/drm/radeon/=
radeon_pm.c
> index 4482c8c5f5ce..2d9d9f46f243 100644
> --- a/drivers/gpu/drm/radeon/radeon_pm.c
> +++ b/drivers/gpu/drm/radeon/radeon_pm.c
> @@ -21,6 +21,7 @@
>   *          Alex Deucher <alexdeucher@gmail.com>
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/hwmon.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/radeon_ring.c b/drivers/gpu/drm/radeo=
n/radeon_ring.c
> index 38048593bb4a..8d1d458286a8 100644
> --- a/drivers/gpu/drm/radeon/radeon_ring.c
> +++ b/drivers/gpu/drm/radeon/radeon_ring.c
> @@ -27,6 +27,8 @@
>   *          Christian K=C3=B6nig
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
>=20=20
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index 2078b0000e22..5c65b6dfb99a 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -30,6 +30,7 @@
>   *    Dave Airlie
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/pagemap.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/radeon/rs400.c b/drivers/gpu/drm/radeon/rs40=
0.c
> index d7f552d441ab..d4d1501e6576 100644
> --- a/drivers/gpu/drm/radeon/rs400.c
> +++ b/drivers/gpu/drm/radeon/rs400.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>=20=20
> diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv51=
5.c
> index 79709d26d983..bbc6ccabf788 100644
> --- a/drivers/gpu/drm/radeon/rv515.c
> +++ b/drivers/gpu/drm/radeon/rv515.c
> @@ -26,6 +26,7 @@
>   *          Jerome Glisse
>   */
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/seq_file.h>
>  #include <linux/slab.h>
>=20=20
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index 4bab93c4fefd..1799c12babf5 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -5,6 +5,7 @@
>   */
>=20=20
>  #include <linux/component.h>
> +#include <linux/debugfs.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> index 76027960054f..434cf0258000 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -27,6 +27,7 @@
>=20=20
>  #define pr_fmt(fmt) "[TTM DEVICE] " fmt
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/mm.h>
>=20=20
>  #include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index be8d286513f9..4a66b851b67d 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -22,8 +22,9 @@
>   * Authors: Christian K=C3=B6nig
>   */
>=20=20
> -#include <linux/iosys-map.h>
> +#include <linux/debugfs.h>
>  #include <linux/io-mapping.h>
> +#include <linux/iosys-map.h>
>  #include <linux/scatterlist.h>
>=20=20
>  #include <drm/ttm/ttm_bo.h>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 578a7c37f00b..474fe7aad2a0 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -32,10 +32,11 @@
>  #define pr_fmt(fmt) "[TTM] " fmt
>=20=20
>  #include <linux/cc_platform.h>
> -#include <linux/sched.h>
> -#include <linux/shmem_fs.h>
> +#include <linux/debugfs.h>
>  #include <linux/file.h>
>  #include <linux/module.h>
> +#include <linux/sched.h>
> +#include <linux/shmem_fs.h>
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index ab61e96e7e14..08e29fa82563 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -5,6 +5,7 @@
>  #ifndef _VC4_DRV_H_
>  #define _VC4_DRV_H_
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/of.h>
>  #include <linux/refcount.h>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_gem.c
> index 2132a8ad8c0c..07185c108218 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -30,6 +30,8 @@
>  #include "drm/drm_prime.h"
>  #include "drm/drm_gem_ttm_helper.h"
>=20=20
> +#include <linux/debugfs.h>
> +
>  static void vmw_gem_object_free(struct drm_gem_object *gobj)
>  {
>  	struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(gobj);
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index c9b30dbdc14d..0b7aebaae843 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -5,6 +5,7 @@
>=20=20
>  #include "xe_debugfs.h"
>=20=20
> +#include <linux/debugfs.h>
>  #include <linux/string_helpers.h>
>=20=20
>  #include <drm/drm_debugfs.h>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_g=
t_debugfs.c
> index ff7f4cf52fa9..8cf0b2625efc 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -5,6 +5,8 @@
>=20=20
>  #include "xe_gt_debugfs.h"
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_managed.h>
>=20=20
> diff --git a/drivers/gpu/drm/xe/xe_uc_debugfs.c b/drivers/gpu/drm/xe/xe_u=
c_debugfs.c
> index 0a39ec5a6e99..78eb8db73791 100644
> --- a/drivers/gpu/drm/xe/xe_uc_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_uc_debugfs.c
> @@ -3,6 +3,8 @@
>   * Copyright =C2=A9 2022 Intel Corporation
>   */
>=20=20
> +#include <linux/debugfs.h>
> +
>  #include <drm/drm_debugfs.h>
>=20=20
>  #include "xe_gt.h"
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 9cc473e5d353..561c3b96b6fd 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -30,11 +30,11 @@
>  #include <linux/printk.h>
>  #include <linux/seq_file.h>
>  #include <linux/device.h>
> -#include <linux/debugfs.h>
>  #include <linux/dynamic_debug.h>
>=20=20
>  #include <drm/drm.h>
>=20=20
> +struct debugfs_regset32;
>  struct drm_device;
>=20=20
>  /* Do *not* use outside of drm_print.[ch]! */

--=20
Jani Nikula, Intel
