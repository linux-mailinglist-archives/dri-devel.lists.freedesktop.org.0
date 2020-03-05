Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E399917A503
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 13:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA776E2EA;
	Thu,  5 Mar 2020 12:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C466E2E2;
 Thu,  5 Mar 2020 12:15:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 04:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; d="scan'208";a="352349957"
Received: from pktinlab.iind.intel.com ([10.66.253.121])
 by fmsmga001.fm.intel.com with ESMTP; 05 Mar 2020 04:15:50 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: jani.nikula@linux.intel.com, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v2 0/7] drm: drm_fb_helper cleanup.
Date: Thu,  5 Mar 2020 17:34:27 +0530
Message-Id: <20200305120434.111091-1-pankaj.laxminarayan.bharadiya@intel.com>
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
   - Accumulated all review tags into individual commits (Emil, Daniel) 
   - Squashed warning fixes into the patch that introduced the
     warnings (into 5/7) (Laurent, Emil, Lyude)
   - Remove entire drm_fb_helper tasks from todo list. Daniel's
     "64914da24ea9 drm/fbdev-helper: don't force restores" fixes first
     one (Daniel)

Pankaj Bharadiya (7):
  drm: Remove unused arg from drm_fb_helper_init
  drm/radeon: remove radeon_fb_{add,remove}_connector functions
  drm/amdgpu: Remove drm_fb_helper_{add,remove}_one_connector calls
  drm/i915/display: Remove drm_fb_helper_{add,remove}_one_connector calls
  drm: Remove drm_fb_helper add, add all and remove connector calls
  drm/fb-helper: Remove drm_fb_helper add, add_all and remove connector functions
  drm/todo: Update drm_fb_helper tasks

 Documentation/gpu/todo.rst                    | 17 ------------
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
 21 files changed, 15 insertions(+), 171 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
