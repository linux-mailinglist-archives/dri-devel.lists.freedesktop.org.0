Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275F17DCA87
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 11:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D59E10E453;
	Tue, 31 Oct 2023 10:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89510E44F;
 Tue, 31 Oct 2023 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698747409; x=1730283409;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uyCZQKhdBT35QNDQWEWaxGEf+yskMcV0Gt0TBZNHom8=;
 b=ERSXiO+semlJzSmdm/koz76A65EdFDm92fofzM9311fioaiKlCYF3mOo
 DDsW/kph8YdQRFaCBGP2p+D75/wD4EYJWXGWyXElFRqsRX/TT9DlAoNEi
 FxNsSsDJDdlDaEK8CScb6yxcqdQl0Tr78azMvtW7TQkKdw1M18pb8/ROB
 Jq50u2xd9oGDM9TSLccD4AVF8Dkz9BqzAT6LVZhLz3KBI3kl5SGPjxCQY
 Vc/ug/PU4TTJ5lhaiyoyqd+FPfBQWccTgX0CVnxPjeIAzUHBlEVLwIAEF
 abvwL5jq7NceAh/Jdd0cr/7BgznozNsAz0lvzKlHe1NpljlK9+uNZ93fm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="454724792"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="454724792"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="789747715"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="789747715"
Received: from moelschl-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.45])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 03:16:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/edid: split out drm_eld.[ch], add some SAD helpers
Date: Tue, 31 Oct 2023 12:16:37 +0200
Message-Id: <cover.1698747331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 of https://patchwork.freedesktop.org/series/123384/

Jani Nikula (6):
  drm/edid: split out drm_eld.h from drm_edid.h
  drm/eld: replace uint8_t with u8
  drm/edid: include drm_eld.h only where required
  drm/edid: use a temp variable for sads to drop one level of
    dereferences
  drm/edid: add helpers to get/set struct cea_sad from/to 3-byte sad
  drm/eld: add helpers to modify the SADs of an ELD

 Documentation/gpu/drm-kms-helpers.rst         |   6 +
 drivers/gpu/drm/Makefile                      |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 drivers/gpu/drm/drm_edid.c                    |  43 +++--
 drivers/gpu/drm/drm_eld.c                     |  55 ++++++
 drivers/gpu/drm/drm_internal.h                |   6 +
 drivers/gpu/drm/i915/display/intel_audio.c    |   1 +
 .../drm/i915/display/intel_crtc_state_dump.c  |   1 +
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   1 +
 drivers/gpu/drm/radeon/radeon_audio.c         |   1 +
 drivers/gpu/drm/tegra/hdmi.c                  |   1 +
 drivers/gpu/drm/tegra/sor.c                   |   1 +
 include/drm/drm_edid.h                        | 148 ----------------
 include/drm/drm_eld.h                         | 164 ++++++++++++++++++
 sound/core/pcm_drm_eld.c                      |   1 +
 sound/soc/codecs/hdac_hdmi.c                  |   1 +
 sound/soc/codecs/hdmi-codec.c                 |   1 +
 sound/x86/intel_hdmi_audio.c                  |   1 +
 19 files changed, 275 insertions(+), 160 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_eld.c
 create mode 100644 include/drm/drm_eld.h

-- 
2.39.2

