Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 866B4ACFEC0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C7010E9D3;
	Fri,  6 Jun 2025 09:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MpYhs8kK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7109F10E9D3;
 Fri,  6 Jun 2025 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749200780; x=1780736780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mGcWq4AHM9vSKx1HsHn7pZ4bzsJm8LKCTeOTqtjCmKE=;
 b=MpYhs8kKAsqQ6UOstmc3vL7srbaZs5rgWLFGUqeYiSQPLhR5FL5wB3zL
 Xb4masPBerrLvd9Snz1SMtLdLi2xHja7Dgtkv92xwPmGdzvl6vt4Iz6qT
 yj4bBzMiHFDV9jsGwlbI1QgJj4s9iMZB/ARfSYyQGfxVgvv6wKokUtxiq
 k9OrqmWIYdS3N80U7hiN5VQJAVz8Cyf1+Yq7BaMvaTBXR/6yifzFfpXOK
 qblDAlVuKy1qqwbhbgBa3v7chHIfcPNzsq9Q7BXAC32AAFJMT6vOJQdf0
 5wi2jWQbQuv1ZjxgxIsqCxHVnQSXVCrVX6EPttWJ2lnBGGmfr5fEfr6d3 Q==;
X-CSE-ConnectionGUID: HvgoMmK+Qh2NPgSzkviSsQ==
X-CSE-MsgGUID: oW93TBhhSlycQXkuN6gYNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68785043"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="68785043"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:18 -0700
X-CSE-ConnectionGUID: hTtImtKfT2qjEdKB5As6pA==
X-CSE-MsgGUID: 8dSymWCKTDqZ8zcco/Wmug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146289390"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, simon1.yang@intel.com,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 0/4] drm/panel, drm/i915: ACPI support for panel follower
Date: Fri,  6 Jun 2025 12:05:08 +0300
Message-Id: <cover.1749199013.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all -

This series expands panel follower to ACPI, and enables drm_panel on
i915.

Patch 1 makes panel follower matching independent of DT, making it also
work with ACPI. Similar to DT, you can use a _DSD "panel" property to
describe the dependency.

Patches 2-4 add drm_panel support to i915 DSI, making it possible to
have followers be notified of panel states.

It's not a whole lot of code, but I simply could not have done it
alone. Thanks to Heikki and Rafael for ACPI insights, Shawn for testing
and feedback, Simon for providing ASL, Doug and Maxime for drm_panel
insights. Much appreciated!

Alas that's not all. While this has been tested to work on an ACPI
system, it has not been tested to not regress on DT systems. I wouldn't
dream of merging this before that, but we don't have such systems
handy. Could anyone provide their Tested-by on a DT system with panel
followers, please?


BR,
Jani.


Jani Nikula (4):
  drm/panel: use fwnode based lookups for panel followers
  drm/i915/panel: add panel register/unregister
  drm/i915/panel: register drm_panel and call prepare/unprepare for ICL+
    DSI
  drm/i915/panel: sync panel prepared state at register

 drivers/gpu/drm/drm_panel.c                   |  39 ++++--
 drivers/gpu/drm/i915/display/icl_dsi.c        |   4 +
 .../gpu/drm/i915/display/intel_connector.c    |  23 ++-
 .../drm/i915/display/intel_display_types.h    |   4 +
 drivers/gpu/drm/i915/display/intel_panel.c    | 131 ++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_panel.h    |   6 +
 6 files changed, 187 insertions(+), 20 deletions(-)

-- 
2.39.5

