Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67D271596B
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E339E10E2FE;
	Tue, 30 May 2023 09:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2760710E2FE;
 Tue, 30 May 2023 09:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437712; x=1716973712;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PMz9QZMhk7/x29PazqA98NhugSjTFeotTyyduRsGsTw=;
 b=bLYizi3aGywkyZ9kRLhzXVGszva8+jAgQr/QnspEBtRWum4rNkIdE6GB
 mQTX7fNA+p/fO8tXb3LwWvKdAHBdZ9h4rmukNXMmH3MfkKxpwtJhTmIFy
 9EsOgwN81Vn6UnDQH3enOyeMIjM8nTsQH6VXhwcnDgTt2A2NBnS+ZAJvp
 tAiinOAoTRAcUTTIHTSiGWNfw7Xxp2JuZhLd5XcPrNsi8b2HanA5Xv/aU
 vgKdBH8/4zqVI5OA/K383L/rVVpEZfJXWf0qQPDt76WxQkxw4vAzR8uQi
 MlhSoHGQ6redm4ck70gN1AlQy1xNR8Oc5cuejcXg7CyXyNgL9y/EqqRSn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="335208722"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="335208722"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:08:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="850684426"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="850684426"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga001-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:08:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/13] drm/display & drm/i915: more struct drm_edid
 conversions
Date: Tue, 30 May 2023 12:08:12 +0300
Message-Id: <cover.1685437500.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rebase of https://patchwork.freedesktop.org/series/116813/

Move struct drm_edid conversions forward.

There are still some drm_edid_raw() stragglers, but this nudges things
forward nicely.

Jani Nikula (13):
  drm/edid: parse display info has_audio similar to is_hdmi
  drm/display/dp_mst: drop has_audio from struct drm_dp_mst_port
  drm/i915/dp: stop caching has_audio in struct intel_dp
  drm/i915/dp: stop caching has_hdmi_sink in struct intel_dp
  drm/i915/hdmi: stop caching has_audio in struct intel_hdmi
  drm/i915/hdmi: stop caching has_hdmi_sink in struct intel_hdmi
  drm/i915/sdvo: stop caching has_hdmi_monitor in struct intel_sdvo
  drm/i915/sdvo: stop caching has_hdmi_audio in struct intel_sdvo
  drm/edid: add drm_edid_read_switcheroo()
  drm/i915/lvds: switch to drm_edid_read_switcheroo()
  drm/edid: make drm_edid_duplicate() safe to call with NULL parameter
  drm/display/dp_mst: convert to struct drm_edid
  drm/i915/display: switch the rest of the connectors to struct drm_edid

 drivers/gpu/drm/display/drm_dp_mst_topology.c |  55 +++++++--
 drivers/gpu/drm/drm_edid.c                    |  38 +++++++
 .../gpu/drm/i915/display/intel_connector.c    |  18 +--
 .../gpu/drm/i915/display/intel_connector.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  34 +++---
 drivers/gpu/drm/i915/display/intel_ddi.c      |   6 +-
 .../drm/i915/display/intel_display_debugfs.c  |  14 +--
 .../drm/i915/display/intel_display_types.h    |   4 -
 drivers/gpu/drm/i915/display/intel_dp.c       |  26 ++---
 drivers/gpu/drm/i915/display/intel_dp.h       |   1 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  12 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  14 +--
 drivers/gpu/drm/i915/display/intel_lvds.c     |  13 +--
 drivers/gpu/drm/i915/display/intel_sdvo.c     | 107 +++++++++---------
 include/drm/display/drm_dp_mst_helper.h       |  14 +--
 include/drm/drm_connector.h                   |   8 ++
 include/drm/drm_edid.h                        |   2 +
 17 files changed, 217 insertions(+), 153 deletions(-)

-- 
2.39.2

