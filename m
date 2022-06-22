Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A3554579
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506E510E2D3;
	Wed, 22 Jun 2022 10:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF8010E28A;
 Wed, 22 Jun 2022 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895572; x=1687431572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SzYN+kAE+DsZmW9JOYI+WVexHRndxk6sDVBSaOXCziE=;
 b=ekSdaSHAoRn6U6KmHnaPB/x3z7pm2ygR04pNsuZEErSX/SW8BnEjfLK1
 t9/Z3ojukgIPIcpZru2YjSMIPklKb8QCWG9wa/jgX1yqISGAfWLNvNFAX
 t1B6tSQzznRqf9kHvpZ0oe6z58Rm9oy0c7Fdks4Fgp5OeOZF/CnJOZeff
 2L9u28bCWiyBZDuQNb3j6MsQwzo1MDAmjIBJQPwerWEW1t01yXeMYLGvP
 jJ+XW3vFC0wG25UWbuyQI32v9JApNOcEqOss8OremUDZABHebrmkZeCr3
 bg6bfGC+CLFSCXLu8cSs4NAsS3vDT34TpQqcUEOo+Ew7hpjvOeR2AMzaa g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="260816616"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="260816616"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="644144101"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 03:59:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/13] drm/edid: expand on struct drm_edid usage
Date: Wed, 22 Jun 2022 13:59:14 +0300
Message-Id: <cover.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
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

v3 of [1], addressing review comments. I'm adding some code movement and
refactoring in the beginning to reuse code between
drm_connector_update_edid_property() and drm_edid_connector_update()
which was a concern Ville raised [2].

BR,
Jani.


[1] https://patchwork.freedesktop.org/series/104309/
[2] https://lore.kernel.org/r/YqOYOjtsboqHOgvv@intel.com

Jani Nikula (13):
  drm/edid: move drm_connector_update_edid_property() to drm_edid.c
  drm/edid: convert drm_connector_update_edid_property() to struct
    drm_edid
  drm/edid: clean up connector update error handling and debug logging
  drm/edid: abstract debugfs override EDID set/reset
  drm/edid: add drm_edid_connector_update()
  drm/probe-helper: add drm_connector_helper_get_modes()
  drm/edid: add drm_edid_raw() to access the raw EDID data
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid
  drm/edid: do invalid block filtering in-place
  drm/edid: add HF-EEODB support to EDID read and allocation
  drm/edid: take HF-EEODB extension count into account
  drm/todo: add entry for converting the subsystem to struct drm_edid

 Documentation/gpu/todo.rst                    |  25 ++
 drivers/gpu/drm/drm_connector.c               |  74 ----
 drivers/gpu/drm/drm_crtc_internal.h           |   5 +-
 drivers/gpu/drm/drm_debugfs.c                 |  21 +-
 drivers/gpu/drm/drm_edid.c                    | 376 +++++++++++++++---
 drivers/gpu/drm/drm_probe_helper.c            |  34 ++
 drivers/gpu/drm/i915/display/intel_bios.c     |  19 +-
 drivers/gpu/drm/i915/display/intel_bios.h     |   4 +-
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 .../drm/i915/display/intel_display_types.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  77 ++--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  26 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  37 +-
 include/drm/drm_connector.h                   |   6 +-
 include/drm/drm_edid.h                        |   3 +
 include/drm/drm_probe_helper.h                |   1 +
 16 files changed, 499 insertions(+), 217 deletions(-)

-- 
2.30.2

