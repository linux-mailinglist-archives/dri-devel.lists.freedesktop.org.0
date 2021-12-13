Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE5472D64
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 14:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078A310E8E2;
	Mon, 13 Dec 2021 13:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8B110E8E2;
 Mon, 13 Dec 2021 13:34:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238675399"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="238675399"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 05:34:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="517751011"
Received: from ppolasze-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.20.7])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 05:34:15 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: Re: [PATCH 0/3] drm/dp: Move DisplayPort helpers into own module
In-Reply-To: <20211213093650.19598-1-tzimmermann@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211213093650.19598-1-tzimmermann@suse.de>
Date: Mon, 13 Dec 2021 15:34:12 +0200
Message-ID: <87lf0o7hnv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Dec 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Split-off DisplayPort functions from KMS helper library and move them
> into their own module. Reduces the size of drm_kms_helper.ko by ~50%.
>
> This patchset is part of an on-going effort to reduce the minimum
> binary size of the DRM core and helpers. It's helpful for systems with
> early-boot DRM graphics, which requires DRM to be linked into the
> kernel image.

Would it be time to add a subdirectory for each non-driver, non-core drm
module? We've touched this topic before. I find it increasingly hard to
remember which files are part of helpers. This would also help with the
arbitrary drm_dp_helper_mod.c naming.

Perhaps drivers/gpu/drm/drm_dp/?

BR,
Jani.



>
> Thomas Zimmermann (3):
>   drm/dp_mst: Remove trailing whitespace.
>   drm/dp: Move DP declarations into separate header file
>   drm/dp: Move DisplayPort helpers into separate helper module
>
>  drivers/gpu/drm/Kconfig                       |  8 ++++++
>  drivers/gpu/drm/Makefile                      | 14 ++++++----
>  drivers/gpu/drm/bridge/Kconfig                |  4 +++
>  drivers/gpu/drm/bridge/analogix/Kconfig       |  2 ++
>  drivers/gpu/drm/bridge/cadence/Kconfig        |  1 +
>  drivers/gpu/drm/drm_crtc_helper_internal.h    | 27 ------------------
>  drivers/gpu/drm/{drm_dp_helper.c => drm_dp.c} |  2 +-
>  drivers/gpu/drm/drm_dp_aux_dev.c              |  2 +-
>  drivers/gpu/drm/drm_dp_helper_internal.h      | 28 +++++++++++++++++++
>  drivers/gpu/drm/drm_dp_helper_mod.c           | 22 +++++++++++++++
>  drivers/gpu/drm/drm_dp_mst_topology.c         |  4 +--
>  drivers/gpu/drm/drm_kms_helper_common.c       | 14 ----------
>  drivers/gpu/drm/i915/Kconfig                  |  1 +
>  drivers/gpu/drm/msm/Kconfig                   |  1 +
>  drivers/gpu/drm/nouveau/Kconfig               |  1 +
>  drivers/gpu/drm/rockchip/Kconfig              |  1 +
>  drivers/gpu/drm/tegra/Kconfig                 |  1 +
>  drivers/gpu/drm/xlnx/Kconfig                  |  1 +
>  18 files changed, 83 insertions(+), 51 deletions(-)
>  rename drivers/gpu/drm/{drm_dp_helper.c => drm_dp.c} (99%)
>  create mode 100644 drivers/gpu/drm/drm_dp_helper_internal.h
>  create mode 100644 drivers/gpu/drm/drm_dp_helper_mod.c
>
>
> base-commit: 3f422828221d9ceefcddef0be33561b1646a1cbe
> prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> --
> 2.34.1
>

-- 
Jani Nikula, Intel Open Source Graphics Center
