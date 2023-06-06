Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF97240DC
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 13:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FDA10E32F;
	Tue,  6 Jun 2023 11:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C6110E330
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 11:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686051017; x=1717587017;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=W0yn6ZzdxjW94gO1XpT+ulvVzj+3KSLXCjaqro+pinc=;
 b=leAv7qzoo+s3ifh0qq0OPDtoQYmfNL9cwoelRlj/6KwHp4hs5aEvxy7g
 BEX/MRhT4yc8YElqeTgzvT/tlaxa34VFG0qmvP0L140/6FKC78R5LE2BD
 Wjm9mvyTNRxwifSyLeERjZgVzaGPKO1g1elaoXhc3fKn+8NwkqSTz0aeA
 FQb1xO0n/j7LodLlW8O/f0NROutnULwtzBW7ZdFthep7nHfx8gdFTOpN8
 bj+7MvbzV6JUi7w9LhsP7vPN8jymMVivngbondoTQSXzDn00uzHaghviu
 1Mo3NMv6ZcB1dLZkWYHEDp269s1fGAaSPosN9K0xZDXIkJPJ03fRfWAyt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341281290"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="341281290"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:30:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778954162"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="778954162"
Received: from abobyr-mobl1.ccr.corp.intel.com (HELO localhost) ([10.252.59.4])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 04:30:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Siddh Raman Pant <code@siddh.me>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH v9 0/8] drm: Remove usage of deprecated DRM_* macros
In-Reply-To: <cover.1686047727.git.code@siddh.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1686047727.git.code@siddh.me>
Date: Tue, 06 Jun 2023 14:30:05 +0300
Message-ID: <87sfb4u8ua.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jun 2023, Siddh Raman Pant <code@siddh.me> wrote:
> This patchset aims to remove usages of deprecated DRM_* macros from the
> files residing in drivers/gpu/drm root.
>
> In process, I found out that NULL as first argument of drm_dbg_* wasn't
> working, but it was listed as the alternative in deprecation comment,
> so I fixed that before removing usages of DRM_DEBUG_* macros.
>
> Courtesy discussion on v1, I added support for NULL in drm_()* macros too.
>
> Courtesy discussion on v7, I removed generic macro stuff meant to accomodate
> stuff like mipi_dsi_host, and instead reverted a commit which used the
> drm_err() macro incorrectly by passing mipi_dsi_host.
>
> This patchset should be applied in order as changes might be dependent.
>
> Please review and let me know if any errors are there, and hopefully
> this gets accepted.

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> ---
>
> v8 -> v9 (today):
> - Rebased to drm-misc-next.
>
> v7 -> v8 (28 Feb 2023):
> - Reverted 1040e424353f ("drm: mipi-dsi: Convert logging to drm_* functions.")
>   which used drm_err macro incorrectly by passing mipi_dsi_host.
> - Thus, removed _Generic and allow only drm_device.
>
> v6 -> v7 (26 Feb 2023):
> - Rebased to drm-misc-next, accounting for the merger of last 3 patches
>   in the previous series (4665280990fa, fc2602b553c8, 7bd224b6625a),
>   and 7428ff70a18 ("drm: initialize accel framework").
>
> v5 -> v6 (09 Jan 2023):
> - Move drm_device to default case in _Generic as it is the default behaviour.
> - Fix incorrect const drm_device handling in _Generic.
> - Minor positioning / comment changes.
>
> v4 -> v5 (07 Jan 2023):
> - Make separate function instead of using boolean in _Generic (sravn on IRC).
> - Also, simplified the Generic macro, and renamed the function and macro.
>
> v3 -> v4 (05 Jan 2023):
> - Fix commit message for DRM_NOTE erroneously mentioning DRM_INFO.
> - Rebased to drm-misc-next, as 723dad977acd added drm_dbg_core() to some
>   files.
> - Move Generic out to a separate macro __drm_get_dev_ptr, so that interface
>   of drm_dbg_*() is also same as other drm_*() macros.
> - Fix comment in __drm_get_dev_ptr (now ___drm_get_dev_ptr) to use correct
>   name.
>
> v2 -> v3 (26 Dec 2022):
> - Added support for NULL in __drm_printk and thus by extension to drm_()*.
> - Thus, converted dropped pr_()* changes to drm_*(NULL, ...).
> - Rebased to drm-misc-next and resulting appropriate changes.
>
> v1 (20 Dec 2022) -> v2 (22 Dec 2022):
> - Removed conversions to pr_*() in DRM_INFO, DRM_NOTE, and DRM_ERROR changes.
> - Due to above, DRM_NOTE usage cannot be removed and the patch is dropped.
> - DRY: NULL support is now achieved by way of a separate function.
>
> Siddh Raman Pant (8):
>   Revert "drm: mipi-dsi: Convert logging to drm_* functions."
>   drm/print: Fix and add support for NULL as first argument in drm_*
>     macros
>   drm: Remove usage of deprecated DRM_INFO
>   drm: Remove usage of deprecated DRM_NOTE
>   drm: Remove usage of deprecated DRM_ERROR
>   drm: Remove usage of deprecated DRM_DEBUG
>   drm: Remove usage of deprecated DRM_DEBUG_DRIVER
>   drm: Remove usage of deprecated DRM_DEBUG_KMS
>
>  drivers/gpu/drm/drm_agpsupport.c        |   4 +-
>  drivers/gpu/drm/drm_bridge.c            |   8 +-
>  drivers/gpu/drm/drm_bufs.c              | 122 ++++++++++++------------
>  drivers/gpu/drm/drm_client_modeset.c    | 118 +++++++++++++----------
>  drivers/gpu/drm/drm_color_mgmt.c        |   4 +-
>  drivers/gpu/drm/drm_connector.c         |  28 +++---
>  drivers/gpu/drm/drm_context.c           |  18 ++--
>  drivers/gpu/drm/drm_crtc.c              |  36 ++++---
>  drivers/gpu/drm/drm_crtc_helper.c       |  62 ++++++------
>  drivers/gpu/drm/drm_debugfs_crc.c       |   8 +-
>  drivers/gpu/drm/drm_displayid.c         |   6 +-
>  drivers/gpu/drm/drm_dma.c               |  10 +-
>  drivers/gpu/drm/drm_drv.c               |  28 +++---
>  drivers/gpu/drm/drm_edid.c              |  17 ++--
>  drivers/gpu/drm/drm_flip_work.c         |   2 +-
>  drivers/gpu/drm/drm_framebuffer.c       |   3 +-
>  drivers/gpu/drm/drm_gem.c               |   7 +-
>  drivers/gpu/drm/drm_gem_dma_helper.c    |   2 +-
>  drivers/gpu/drm/drm_hashtab.c           |  10 +-
>  drivers/gpu/drm/drm_irq.c               |   4 +-
>  drivers/gpu/drm/drm_kms_helper_common.c |   2 +-
>  drivers/gpu/drm/drm_lease.c             |   4 +-
>  drivers/gpu/drm/drm_legacy_misc.c       |   4 +-
>  drivers/gpu/drm/drm_lock.c              |  36 +++----
>  drivers/gpu/drm/drm_mipi_dbi.c          |  19 ++--
>  drivers/gpu/drm/drm_mipi_dsi.c          |  15 +--
>  drivers/gpu/drm/drm_mm.c                |   8 +-
>  drivers/gpu/drm/drm_mode_config.c       |   2 +-
>  drivers/gpu/drm/drm_mode_object.c       |   6 +-
>  drivers/gpu/drm/drm_modes.c             |  36 +++----
>  drivers/gpu/drm/drm_modeset_helper.c    |   2 +-
>  drivers/gpu/drm/drm_pci.c               |  14 +--
>  drivers/gpu/drm/drm_plane.c             |  46 ++++-----
>  drivers/gpu/drm/drm_probe_helper.c      |  39 ++++----
>  drivers/gpu/drm/drm_rect.c              |   4 +-
>  drivers/gpu/drm/drm_scatter.c           |  19 ++--
>  drivers/gpu/drm/drm_syncobj.c           |   2 +-
>  drivers/gpu/drm/drm_sysfs.c             |  22 ++---
>  drivers/gpu/drm/drm_vm.c                |  45 +++++----
>  include/drm/drm_print.h                 |  81 ++++++++++------
>  40 files changed, 480 insertions(+), 423 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
