Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169539EDAB8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AF810EA9E;
	Wed, 11 Dec 2024 23:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VIaxrChW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C274410E63B;
 Wed, 11 Dec 2024 23:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733958171; x=1765494171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4+nA5Rh8hzzv8LHyim6bvM4pWRsTzuW7hqwwM3rqahY=;
 b=VIaxrChWukDWaJ8xyJyghIfK6vuM80ROhpwE9XSi39O4g2RupHpQM/2e
 Ft8bMZqghDgAEM6hK5wXmTiz5t/UhGJKEabD2H63aNDa2hJ+YSu+dSjWa
 yMHMhfg1lJ/KLE1vzvukMd/VHsr1Y3Lc/4j3SLN8BmZepNt0tMui1eVWf
 3GcRI57aKq2kTAIbsDOa5AuN2bZYI3laJoCzXGWf/+aG/yX7h6fqMtLdO
 N28jyNUXv4xF93mVwJcB+hp2v//x58KSVN94xYBNbAvzLpxq0/MhVQfto
 Dr73gdcKObUXdYlPsF/EhyXFUle1L1dvmbgIKkOX83h+g0zjBC8zm9oX6 Q==;
X-CSE-ConnectionGUID: MslBg8DDTYmsQtebp/vF8A==
X-CSE-MsgGUID: A/rYCNE1TmCISwzEY4eXVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34401453"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34401453"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:51 -0800
X-CSE-ConnectionGUID: UNGChJG5RRqOun6veJe+/w==
X-CSE-MsgGUID: g8zLQkbVTZ26u4EZgFmqUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126962328"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:02:47 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/7] drm/connector: Expose only a properly inited connector
Date: Thu, 12 Dec 2024 01:03:17 +0200
Message-ID: <20241211230328.4012496-1-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
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

This is v3 of [1], with the following changes:

- Instead of the drm_connector_init_core()/drm_connector_add() add
  a drm_connector_dynamic_init()/drm_connector_dynamic_register()
  interface. Adding the connector to the connector list is now part of
  the registration step done by the latter function. (Sima)
- Add kunit tests for the above functions. (Maxime)
- Add a FIXME note for a related issue in the GETRESOURCES ioctl call.
  (Sima)
- Add a note to depricate the use of
  drm_connector_register()/drm_connector_unregister() by drivers for
  static connectors.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Wayne Lin <wayne.lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>

[1] https://lore.kernel.org/all/20241126161859.1858058-1-imre.deak@intel.com

Imre Deak (11):
  drm/connector: Add a way to init/add a connector in separate steps
  drm/connector: Add FIXME for GETRESOURCES ioctl wrt. uninited
    connectors
  drm/connector: Add deprication notes for
    drm_connector_register/unregister
  drm/dp_mst: Register connectors via drm_connector_dynamic_register()
  drm/i915/dp_mst: Expose a connector to kernel users after it's
    properly initialized
  drm/amd/dp_mst: Expose a connector to kernel users after it's properly
    initialized
  drm/nouveau/dp_mst: Expose a connector to kernel users after it's
    properly initialized
  drm/connector: Warn if a connector is registered/added incorrectly
  drm/tests: Add tests for drm_connector_dynamic_init()/register()
  drm/i915/dp_mst: Fix error handling while adding a connector
  drm/i915/dp_mst: Use intel_connector vs. drm_connector pointer in
    intel_dp_mst.c

 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |   5 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
 drivers/gpu/drm/drm_connector.c               | 168 ++++++-
 drivers/gpu/drm/drm_mode_config.c             |   9 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 206 ++++----
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   4 +-
 drivers/gpu/drm/tests/drm_connector_test.c    | 463 ++++++++++++++++++
 include/drm/drm_connector.h                   |   6 +
 8 files changed, 722 insertions(+), 141 deletions(-)

-- 
2.44.2

