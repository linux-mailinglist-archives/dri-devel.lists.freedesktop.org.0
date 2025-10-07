Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55EBC037F
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 07:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A40910E506;
	Tue,  7 Oct 2025 05:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGMf02Dz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7721E10E08C;
 Tue,  7 Oct 2025 05:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759815951; x=1791351951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aRM3qd+6F6N7GpoYtfIBeQSbvfWgtoGFVl5Adw4VJro=;
 b=JGMf02DzGMSOeno+Ub/QUkKAXwM9RTbpncd+q1dsAieXtXqsvYvL68/Q
 RWodZ9NdH3HdagXEiMRGIBkVmQBp5Fr0q9Mus3CLxiuq1iySWl/Nhvkjo
 +lTemLxX9SmlrLjU/YS0BEGd/hRQBlijCqMddzITGSEKzV3r1/he/w3vU
 lnokvGQXkdJDUBcrbEbKWonLL7XDhqKhlJ+WykF+kybttKo5lyI3xg2cQ
 atWr4xEPoj9Sq8v882wyGms0mFD/+RqnDAfxOZdNjB6AqdrtsRgMUG3FD
 4+nXKv2CXr/No6w66RlwZCQ9EX4vS8AJoMksAC0gTHbuzmzd5pvJk1EIW A==;
X-CSE-ConnectionGUID: X6ajwoohQOWvJbQOXmEaXg==
X-CSE-MsgGUID: 77amCyd1R+qDXZhLjXbtTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="61027899"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="61027899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 22:45:50 -0700
X-CSE-ConnectionGUID: yVoRrmGNR8Sx0wUO6LVKnw==
X-CSE-MsgGUID: /dgv+ZRHR/COnS6B1I5Jsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="180479325"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2025 22:45:41 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernel-list@raspberrypi.com,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev, tzimmermann@suse.de,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 mcanal@igalia.com, dave.stevenson@raspberrypi.com,
 tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, louis.chauvet@bootlin.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH v2 0/7] Refactor drm_writeback_connector structure
Date: Tue,  7 Oct 2025 11:15:22 +0530
Message-Id: <20251007054528.2900905-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers cannot work with the current design where the connector
is embedded within the drm_writeback_connector such as intel and
some drivers that can get it working end up adding a lot of checks
all around the code to check if it's a writeback conenctor or not.
This is due to the inheritance limitation in C.
This series intends to solve it by moving the drm_writeback_connector
within the drm_connector and remove the drm_connector base which was in
drm_writeback_connector. This is done in union with hdmi connector
within drm_connector to save memory and since drm_connector cannot be
both hdmi and writeback it serves is well.
A RFC version was floated and discussion had taken place at [1] which
kicked of this more cleaner series. 
We do all other required modifications that come with these changes
along with addition of new function which returns the drm_connector when
drm_writeback_connector is present.
This series also contains some writeback API cleanups as a consequence
of writeback connector moving into drm_connector
All drivers will be expected to allocate the drm_connector.
This discussion was tiggered from [2] and sits on top of Dmitry's series
see [3].

[1] https://patchwork.freedesktop.org/series/152758/
[2] https://patchwork.freedesktop.org/series/152106/
[3] https://patchwork.freedesktop.org/series/152420/

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (7):
  drm: writeback: Refactor drm_writeback_connector structure
  drm: writeback: Modify writeback init helpers
  drm: writeback: Modify drm_writeback_queue_job params
  drm: writeback: Modify drm_writeback_signal_completion param
  drm: writeback: Modify params for drm_writeback_get_out_fence
  drm/connector: Modify prepare_writeback_job helper
  drm/connector: Modify cleanup_writeback_job helper

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  | 12 +--
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
 .../arm/display/komeda/komeda_wb_connector.c  | 11 +--
 drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
 drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  7 +-
 drivers/gpu/drm/drm_atomic_uapi.c             |  4 +-
 drivers/gpu/drm/drm_writeback.c               | 51 ++++++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  9 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 12 ++-
 drivers/gpu/drm/vc4/vc4_txp.c                 |  8 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         | 15 ++--
 include/drm/drm_connector.h                   | 69 ++++++++++++++++-
 include/drm/drm_modeset_helper_vtables.h      |  4 +-
 include/drm/drm_writeback.h                   | 76 ++-----------------
 22 files changed, 162 insertions(+), 160 deletions(-)

-- 
2.34.1

