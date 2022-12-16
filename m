Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873A64EE5D
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303310E5E9;
	Fri, 16 Dec 2022 16:00:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8417510E5E8;
 Fri, 16 Dec 2022 16:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206435; x=1702742435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m/QWgDVl1KeOUtNTIjYiFm5i7WKWcyi+lpVATnTR0yI=;
 b=N3M/vHPyXq93VzKClwNY3k/W9mqLBIxTPYQ/UEHnYcauWMqjIPTLS/sC
 m1TEm16aNIEGY/IkfHZ3I4RYxYoeRuJDHMsgJKUR/72jetmAcr9RB5zBV
 KgMASYishgEO+iG/M/vgecSg0ovhSQoBdqxk8V/HDvVdPHpZMyIANuTuC
 B+rX8PhLGjuSw73VDh/ITYqFWPjtuKZBnuAlxBcsdqddy2g4eM91t/6Tx
 jN8FMpS2OPlrbYpe/nZylwqTGEWehtAYjSJJjT7RvxTxgcbSmsLqrQ0eS
 5LYgQxvYYCp8CVpA14b1gsF/3ihHhJXncDCyjiOZXvzrNkPYYtrH9eY6Q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="381214801"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="381214801"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="895286445"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="895286445"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:00:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 00/12] drm/edid, drm/i915: further drm_edid work,
 finally switch i915 over
Date: Fri, 16 Dec 2022 18:00:14 +0200
Message-Id: <cover.1671206131.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_edid handling still needed some plumbing in drm_edid.c before we
could convert i915 over to use it. Specifically
drm_edid_connector_update() needed to be split to two, with separate
drm_edid_connector_add_modes(). This is better explained in patch 7
commit message.

With that in patches 1-8 along with some refactorings, we can finally
switch i915 over to use drm_edid. And with that, i915 starts supporting
the HF-EEODB extension.

I've dropped Ville's earlier R-b from some of the patches because
they've changed so much over the rebases and changes.


BR,
Jani.


Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Jani Nikula (12):
  drm/edid: store quirks in display info
  drm/edid: stop passing quirks around
  drm/edid: rename struct drm_display_info *display to *info
  drm/edid: merge ELD handling to update_display_info()
  drm/edid: move EDID BPC quirk application to update_display_info()
  drm/edid: refactor _drm_edid_connector_update() and rename
  drm/edid: add separate drm_edid_connector_add_modes()
  drm/edid: remove redundant _drm_connector_update_edid_property()
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/i915/bios: convert intel_bios_init_panel() to drm_edid
  drm/i915/opregion: convert intel_opregion_get_edid() to struct
    drm_edid
  drm/i915/panel: move panel fixed EDID to struct intel_panel

 drivers/gpu/drm/drm_edid.c                    | 187 +++++++++---------
 drivers/gpu/drm/drm_probe_helper.c            |   4 +-
 drivers/gpu/drm/i915/display/icl_dsi.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_bios.c     |  23 +--
 drivers/gpu/drm/i915/display/intel_bios.h     |   4 +-
 .../gpu/drm/i915/display/intel_connector.c    |   5 +-
 .../drm/i915/display/intel_display_types.h    |   8 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  91 +++++----
 drivers/gpu/drm/i915/display/intel_dvo.c      |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  28 +--
 drivers/gpu/drm/i915/display/intel_lvds.c     |  51 +++--
 drivers/gpu/drm/i915/display/intel_opregion.c |  29 ++-
 drivers/gpu/drm/i915/display/intel_opregion.h |   4 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  10 +-
 drivers/gpu/drm/i915/display/intel_panel.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   2 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |   2 +-
 include/drm/drm_connector.h                   |   5 +
 include/drm/drm_edid.h                        |   2 +
 19 files changed, 246 insertions(+), 217 deletions(-)

-- 
2.34.1

