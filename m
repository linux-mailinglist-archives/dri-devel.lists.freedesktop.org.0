Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8125FB3BC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C322610E542;
	Tue, 11 Oct 2022 13:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5BE10E3E9;
 Tue, 11 Oct 2022 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496195; x=1697032195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EpRk0KKuhbH8+AAd/K+4lEe7mH4SRJwoyNP06bjqrn0=;
 b=Dfg7+aiOQyNR4AvWzNZmoexjfNKJjCiLcHrfh6r8DPnkIkAepK6k3GOY
 GVW49JMTxD++FuWPlveMF0XYP+j8wiMEYXOg5qqr0gnGLZFqqLudFuo7e
 0/i51EcuJMvPoSc0pr/GTlWqHtO5NI8W6o/rEgV4R/RyZxR1PGvOD6mFF
 dQalW5O+kYjLAFFCLXfmfUQILC6F97GuJNHC/gFu0s7Cs6i9pEFXsmes4
 AL8ago137NsXNsLgsKsvROb/6YNqHFjN5A0gV4QYyDj8jGO63S+6kDQvK
 w7sEUGRba6Ug1jlBimjSS4sgoGS7/MuvFq/WkrDL/F7tyHZu6G3ATwYj2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="366497654"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="366497654"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:49:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="871509939"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="871509939"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:49:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/15] drm/edid: EDID override refactoring and fixes
Date: Tue, 11 Oct 2022 16:49:34 +0300
Message-Id: <cover.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I set out to fix some issues in switching i915 over to use drm_edid more
widely, and stumbled onto issues with edid override usage. Here's some
resulting fixes, refactoring and cleanup.

BR,
Jani.

Jani Nikula (15):
  drm/i915/hdmi: do dual mode detect only if connected
  drm/i915/hdmi: stop using connector->override_edid
  drm/amd/display: stop using connector->override_edid
  drm/edid: debug log EDID override set/reset
  drm/edid: abstract debugfs override EDID show better
  drm/edid: rename drm_add_override_edid_modes() to
    drm_edid_override_connector_update()
  drm/edid: split drm_edid block count helper
  drm/edid: add function for checking drm_edid validity
  drm/edid: detach debugfs EDID override from EDID property update
  drm/edid/firmware: drop redundant connector_name variable/parameter
  drm/edid/firmware: rename drm_load_edid_firmware() to
    drm_edid_load_firmware()
  drm/edid: use struct drm_edid for override/firmware EDID
  drm/edid: move edid load declarations to internal header
  drm/edid/firmware: convert to drm device specific logging
  drm/edid: convert to device specific logging

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   3 -
 drivers/gpu/drm/drm_crtc_internal.h           |  15 +-
 drivers/gpu/drm/drm_debugfs.c                 |   8 +-
 drivers/gpu/drm/drm_edid.c                    | 259 ++++++++++--------
 drivers/gpu/drm/drm_edid_load.c               | 107 ++------
 drivers/gpu/drm/drm_probe_helper.c            |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  21 +-
 include/drm/drm_connector.h                   |  11 +-
 include/drm/drm_edid.h                        |  10 +-
 9 files changed, 206 insertions(+), 230 deletions(-)

-- 
2.34.1

