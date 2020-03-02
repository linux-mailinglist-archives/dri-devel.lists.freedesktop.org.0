Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A699175FBB
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 17:33:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0EE6E575;
	Mon,  2 Mar 2020 16:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D446E56A;
 Mon,  2 Mar 2020 16:33:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 08:33:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; d="scan'208";a="351575084"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by fmsmga001.fm.intel.com with ESMTP; 02 Mar 2020 08:33:06 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm: drm_fb_helper cleanup.
Date: Mon,  2 Mar 2020 21:51:43 +0530
Message-Id: <20200302162151.52349-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.20.1
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
Cc: pankaj.laxminarayan.bharadiya@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series addresses below drm_fb_helper tasks from
Documentation/gpu/todo.rst.

- The max connector argument for drm_fb_helper_init() isn't used
  anymore and can be removed.

- The helper doesn't keep an array of connectors anymore so these can
  be removed: drm_fb_helper_single_add_all_connectors(),
  drm_fb_helper_add_one_connector() and
  drm_fb_helper_remove_one_connector().

Changes since v1:
   - Squashed warning fixes into the patch that introduced the
     warnings (into 5/7) (Laurent)
   - Fixed reflow in in 9/9 (Laurent)

Pankaj Bharadiya (7):
  drm: Remove unused arg from drm_fb_helper_init
  drm/radeon: remove radeon_fb_{add,remove}_connector functions
  drm/amdgpu: Remove drm_fb_helper_{add,remove}_one_connector calls
  drm/i915/display: Remove drm_fb_helper_{add,remove}_one_connector
    calls
  drm: Remove drm_fb_helper add, add all and remove connector calls
  drm/fb-helper: Remove drm_fb_helper add, add_all and remove connector
    functions
  drm/todo: Update drm_fb_helper tasks

 Documentation/gpu/todo.rst                    |  7 -----
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  5 +---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 13 ---------
 drivers/gpu/drm/armada/armada_fbdev.c         |  8 +-----
 drivers/gpu/drm/bridge/tc358764.c             |  3 ---
 drivers/gpu/drm/drm_fb_helper.c               |  6 ++---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       |  1 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 10 +------
 drivers/gpu/drm/gma500/framebuffer.c          |  6 +----
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 12 ---------
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  4 +--
 drivers/gpu/drm/msm/msm_fbdev.c               |  6 +----
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  7 -----
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       |  6 +----
 drivers/gpu/drm/omapdrm/omap_fbdev.c          |  6 +----
 drivers/gpu/drm/radeon/radeon_dp_mst.c        | 10 -------
 drivers/gpu/drm/radeon/radeon_fb.c            | 19 +------------
 drivers/gpu/drm/radeon/radeon_mode.h          |  3 ---
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c |  9 +------
 drivers/gpu/drm/tegra/fb.c                    |  8 +-----
 include/drm/drm_fb_helper.h                   | 27 ++-----------------
 21 files changed, 15 insertions(+), 161 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
