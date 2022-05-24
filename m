Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BCD5327E9
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3AB10F172;
	Tue, 24 May 2022 10:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB3210F065;
 Tue, 24 May 2022 10:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388796; x=1684924796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xu8FmKMr9TBT/1V60fCmMGsVqc8y1LIUAzbZM/oURTk=;
 b=ZNu3+IWIEAO2PPfnAMUiCbiLb5v/YvBsTDAIVRLFkKsbqDhaMx7jgHX4
 YgeznpyhsRjwGn/fMfWdYDGXlmLqEqR8uhMmyyvmpvZsWHnKHfg5t5A1x
 vataNqlCKNG28qhR0Vzurqpp1/sJVK2DQxoMXSlq7EgQzDp1tSQ5k/EjG
 lRtIkeEMBNR3ZuWtczDgL54iHv91UkNyhQkOXmh9Ic2A5zisPScksikNi
 BwDEUzrsuWE/sMvkj/htdePd4mpBmmAG7GS1AxsONBo48JlgOyzIQtg7D
 iFCaBFi5t5xm6ByvDAPUug0D6DH86ckJsC01k+puYzPAOj2Ewe0zepkKb Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="261101116"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="261101116"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:39:55 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="601163833"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:39:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 00/13] drm/edid: expand on struct drm_edid usage
Date: Tue, 24 May 2022 13:39:22 +0300
Message-Id: <cover.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
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
Cc: amd-gfx@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <narmstrong@baylibre.com>, jani.nikula@intel.com,
 Robert Foss <robert.foss@linaro.org>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 nouveau@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey all, I'm adding a bunch of people to the cover letter, sorry for the
noise.

I've been putting a lot of effort lately into cleaning up our EDID
parsing. It's been long overdue. Here, we finally leverage all that prep
work to implement the HDMI Forum HF-EEODB extension. In short, HF-EEODB
lets an EDID extension override the number of extensions indicated in
the base block. That has a lot of implications when it comes to EDID
parsing and memory allocation that is currently spread around the
subsystem.

I've added the opaque struct drm_edid in commit e4ccf9a777d3 ("drm/edid:
add struct drm_edid container"). The commit message is worth a
read. Here, I'm expanding struct drm_edid to the interfaces for EDID
reading and parsing. They all get an overhaul, along with the probe
helper .get_modes() hook.

In my mind, there is really no alternative to centralizing the EDID
parsing, and hiding the details in drm_edid.c.

I'm also adding a TODO entry; there's still a bunch of work to be done
across the subsystem.


BR,
Jani.


Cc: Adam Jackson <ajax@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org

Jani Nikula (13):
  drm/edid: add block count and data helper functions for drm_edid
  drm/edid: keep track of alloc size in drm_do_get_edid()
  drm/edid: add new interfaces around struct drm_edid
  drm/edid: add drm_edid_connector_update()
  drm/probe-helper: abstract .get_modes() connector helper call
  drm/probe-helper: make .get_modes() optional, add default action
  drm/probe-helper: add .get_edid() callback
  drm/edid: add drm_edid_raw() to access the raw EDID data
  drm/i915/edid: convert DP, HDMI and LVDS to drm_edid
  drm/edid: do invalid block filtering in-place
  drm/edid: add HF-EEODB support to EDID read and allocation
  drm/edid: take HF-EEODB extension count into account
  drm/todo: add entry for converting the subsystem to struct drm_edid

 Documentation/gpu/todo.rst                    |  25 +
 drivers/gpu/drm/drm_connector.c               |   2 +
 drivers/gpu/drm/drm_edid.c                    | 538 ++++++++++++++++--
 drivers/gpu/drm/drm_probe_helper.c            |  48 +-
 .../gpu/drm/i915/display/intel_connector.c    |   4 +-
 .../drm/i915/display/intel_display_types.h    |   4 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  72 +--
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  26 +-
 drivers/gpu/drm/i915/display/intel_lvds.c     |  35 +-
 include/drm/drm_edid.h                        |  12 +
 include/drm/drm_modeset_helper_vtables.h      |  19 +
 11 files changed, 650 insertions(+), 135 deletions(-)

-- 
2.30.2

