Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B5A866D2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 22:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE0B10EC84;
	Fri, 11 Apr 2025 20:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="o3ZMo7/n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC9910E166;
 Fri, 11 Apr 2025 20:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Hl1pwW25iIvylt/CGJ3Ah62lrWBwskAnUCeqVJHrxT0=; b=o3ZMo7/n9dTSTZfO72zL8wWBOe
 6jCaB5TMHARilJu9o/07Gxeg6PiMlinzp7vwm2p8EqmRT+539GXD/4S8/htz60G11/QZX2G7KPLML
 T4+XSHhmjfH6HhH+HBXw7my6/trbKlokkGxjKN7JUahRVX7+m5Q0g6NFejiv0WDYxA395/vrTAhzw
 OVk+rF0OQnef2Py1Tv77vqAjPY0+wpz/loaTEMtVI6yBX8cJ8kBLIN8o7rZsYmMolHwDIIv8eOft6
 3fJUjnu/GoZhX9ico0hVJ4ZBx9uR3In7n2lBEOgv3XmT14T1i/Wceyv8iC9gYAzgFDtoI7+RnaMPO
 ZtU6wneA==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3Kkv-00FIP5-Ug; Fri, 11 Apr 2025 22:13:42 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, simona@ffwll.ch, sunpeng.li@amd.com,
 tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH 00/13] drm/amd/display: more drm_edid to AMD display driver
Date: Fri, 11 Apr 2025 17:08:30 -0300
Message-ID: <20250411201333.151335-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Siqueira and I worked on a solution to reduce the usage of drm_edid_raw
in the AMD display driver, since the current guideline in the DRM
subsystem is to stop handling raw edid data in driver-specific
implementation and use opaque `drm_edid` object with common-code
helpers.

In short, this series approaches the issue of maintaining DC as an
OS-agnostic component by creating a mid layer to isolate `drm_edid`
helpers that need to be called in the DC code, while allowing other OSes
to implement their specific implementation. This is an extension of [1].

- Patch 1 addresses a possible leak added by previous migration to
  drm_edid.
- Patches 2-6 use common-code, drm_edid helpers to parse edid
  capabilities instead of driver-specific solutions.
- Patches 7-8 are groundwork to reduce the noise of Linux/DRM specific
  code in the DC shared code
- Patch 9 creates a mid layer to make DC embraces different ways of
  handling EDID by platforms.
- Patch 10-11 move open-coded management of raw EDID data to the mid
  layer created before.
- Patch 12 adds drm_edid to dc_sink struct and a mid-layer helper to
  free `drm_edid`.
- Patch 13 switch dc_edid to drm_edid across the driver in a way that
  the DC shared code is little affected by Linux specific stuff.

There are three specific points where we still use drm_edid_raw() in the
driver:
1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
   drm_dp_dpcd_write(), that AFAIK there is no common code solution yet;
2. open-coded connectivity log for dc link detection, that maybe can be
   moved to drm (?);
3. open-coded parser that I suspect is a lot of duplicated code, but
   needs careful examining.

I suggest to address those points in a next phase for regression control.

[1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1-mwen@igalia.com/

Let me know yours thoughts!

Melissa

Melissa Wen (11):
  drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: parse display name from drm_eld
  drm/amd/display: get panel id with drm_edid helper
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps
  drm/amd/display: simplify dm_helpers_parse_edid_caps signature
  drm/amd/display: change DC functions to accept private types for edid
  drm/edid: introduce a helper that compares edid data from two drm_edid
  drm/amd/display: add drm_edid to dc_sink
  drm/amd/display: move dc_sink from dc_edid to drm_edid

Rodrigo Siqueira (2):
  drm/amd/display: add a mid-layer file to handle EDID in DC
  drm/amd/display: create a function to fill dc_sink with edid data

 .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 104 ++++++++----------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  34 ++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
 .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  12 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
 .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
 .../drm/amd/display/dc/link/link_detection.h  |   9 +-
 drivers/gpu/drm/drm_edid.c                    |  18 +++
 include/drm/drm_edid.h                        |   2 +
 15 files changed, 165 insertions(+), 142 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h

-- 
2.47.2

