Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A05F52E8
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 12:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F98110E0BB;
	Wed,  5 Oct 2022 10:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A543710E4B2;
 Wed,  5 Oct 2022 10:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664967112; x=1696503112;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tzLz/h1cx3l0UqC+pOnjEYwI7zKEMRB48aEchfspRlE=;
 b=Rve5qgoRzpF2tPneBQYdIhW51rDn5ndHoe2P0pgPQRCqpxlq0WOUUg8g
 VK8g+lByKKgb+/PZLqLn9kmdTA28UV/tvSWhf1+kuZO+ICb9X0ANWy9yx
 5cz+oGRu1/h5FngUCdJgui1C9vkwkfarSM5WSK0OGVSUt5/9U9H5m+lyN
 5Nk/+o+JKx/I0i5tlupULuSkDdcqhfKMQ9rPDW9e9NUctvOQ7t08lN6bK
 WPMH4zaSABqmEo/mzCS3Av8FI40R/fjB+bvi8Jw1tTAc42CXsPdGAkspD
 qYQqyexeuOxgERmHs1IDpNrshU0750+fVwKxTbfBoy9xJOEsKDdQeGi6R A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="286343559"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="286343559"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 03:51:51 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="655131149"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="655131149"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.173])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 03:51:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 0/2] drm/connector: connector iterator with filtering
Date: Wed,  5 Oct 2022 13:51:42 +0300
Message-Id: <cover.1664966047.git.jani.nikula@intel.com>
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
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, jani.nikula@intel.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently i915 assumes all drm_connectors it encounters are embedded in
intel_connectors that i915 allocated. The drm_writeback_connector forces
a design where this is not the case; we can't provide our own connector,
and writeback embeds the drm_connector it initializes itself.

To use drm writeback, none of the i915 connector iteration could assume
the drm connector is embedded in intel_connector. Checking this is
tedious, and would require an intermediate step with
drm_connector. Here's an idea I came up with; filtering at the drm
connector iterator level with a caller supplied function. Not too much
code, and could be used for other things as well.

Mind you, we'd still much rather modify drm writeback to allow passing
the connector i915 allocated, instead of the current midlayer design
that forces drivers to a certain model. Working around this is a bunch
of error prone and tedious code that we really could do without.


BR,
Jani.


Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>

Jani Nikula (2):
  drm/connector: add connector list iteration with filtering
  drm/i915: iterate intel_connectors only

 drivers/gpu/drm/drm_connector.c               | 57 +++++++++++++++----
 drivers/gpu/drm/i915/display/intel_display.c  |  3 +-
 .../drm/i915/display/intel_display_types.h    |  7 +++
 drivers/gpu/drm/i915/display/intel_dp.c       |  6 +-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  3 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  3 +-
 drivers/gpu/drm/i915/display/intel_hotplug.c  | 12 ++--
 .../drm/i915/display/intel_modeset_setup.c    |  6 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |  9 ++-
 include/drm/drm_connector.h                   |  9 +++
 10 files changed, 89 insertions(+), 26 deletions(-)

-- 
2.34.1

