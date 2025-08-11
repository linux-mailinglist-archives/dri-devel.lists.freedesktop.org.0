Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB811B20357
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 11:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B3310E3B1;
	Mon, 11 Aug 2025 09:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bHc26wku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EAD10E3A9;
 Mon, 11 Aug 2025 09:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754904458; x=1786440458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z1SyJgR0AtiZ9X/pQ4mumLbUzdXK/ttulk6jcc2Jf54=;
 b=bHc26wkuaXxVGsUBrp8xioom0YaHs1ghxo+PI3FpyH5j0r61sk+b1P2g
 CX6bCnuIHBQGAWZaeaygjjc20w6ZJZyXz8JMvdYJ5bKbdwmzoTSdEJazu
 gEc5S0bmhN0hFI984+zFVbtumoaxUeL6lCtbxo13FpE8SY8IN6+sOZDO6
 EXJkX9hHPHMM2RB7E7MoSLhoSJjlMw2cTgnh5ixD8sFhtowawUbFiFtwI
 C+blAd0BZUKCqJlc38PJps+K+eAqf1iDdCbHTIoizrOx+1lahL0Mv6Iaq
 egnUu2aNlw788nifp/vqKWM0JCKdUnnxDErFQ0dNqsY0Xu76+UdzOphz0 A==;
X-CSE-ConnectionGUID: n50nG1MxQfy4KU/0G9JCRQ==
X-CSE-MsgGUID: VOmByqoCSWOMKWlQTIJs4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57217874"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="57217874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 02:27:37 -0700
X-CSE-ConnectionGUID: TAeCBx1TT56ATbcgaIbc3w==
X-CSE-MsgGUID: zYc+WjGwQ3yJQu9skQVhTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165860258"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa007.jf.intel.com with ESMTP; 11 Aug 2025 02:27:28 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 jani.nikula@intel.com, dmitry.baryshkov@oss.qualcomm.com,
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
Subject: [RFC PATCH 0/8] Refactor drm_writeback_connector structure
Date: Mon, 11 Aug 2025 14:56:59 +0530
Message-Id: <20250811092707.3986802-1-suraj.kandpal@intel.com>
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
This series intends to solve it by moving the drm_writeback_connector
within the drm_connector and remove the drm_connector base which was in
drm_writeback_connector. A Proposal suggested by Dmitry.
We want to get an Ack from all drivers whom are affected by these
changes.
 We do all other required modifications that come with these changes
along with addition of new function which returns the drm_connector when
drm_writeback_connector is present.
All drivers will be expected to allocate the drm_connector.
This discussion was tiggered from [1] and sits on top of Dmitry's series
see [2].

[1] https://patchwork.freedesktop.org/series/152106/
[2] https://patchwork.freedesktop.org/series/152420/

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (8):
  drm: writeback: Refactor drm_writeback_connector structure
  drm/amd/display: Adapt amd writeback to new drm_writeback_connector
  drm/arm/komeda: Adapt komeda writeback to new drm_writeback_connector
  drm/arm/mali: Adapt mali writeback to new drm_writeback_connector
  drm/vc4: Adapt vc4 writeback to new drm_writeback_connector
  drm/vkms: Adapt vkms writeback to new drm_writeback_connector
  drm/rcar_du: Adapt vkms writeback to new drm_writeback_connector
  drm/msm/dpu: Adapt dpu writeback to new drm_writeback_connector

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
 .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
 .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
 drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  6 +-
 drivers/gpu/drm/drm_writeback.c               | 33 ++++++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 16 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h |  4 +-
 .../gpu/drm/renesas/rcar-du/rcar_du_crtc.h    |  4 +-
 .../drm/renesas/rcar-du/rcar_du_writeback.c   | 22 +++---
 drivers/gpu/drm/vc4/vc4_txp.c                 | 14 ++--
 drivers/gpu/drm/vkms/vkms_composer.c          |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c         | 15 ++--
 include/drm/drm_connector.h                   | 60 ++++++++++++++++
 include/drm/drm_writeback.h                   | 68 ++-----------------
 20 files changed, 155 insertions(+), 130 deletions(-)

-- 
2.34.1

