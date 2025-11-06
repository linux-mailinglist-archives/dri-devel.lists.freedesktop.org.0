Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC33C3C9D0
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B653910E967;
	Thu,  6 Nov 2025 16:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hH3REBYs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F5610E957;
 Thu,  6 Nov 2025 16:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pg+XQUx24B8aFQaX4qLBX7q3++tGhfoQ3ZmsIiTSmHg=; b=hH3REBYsdM/x5pbpjzYeWgWU8/
 AKJSHQxyRlEODu4So1WGvUV01BF6wsGDarDOi59MLCoLsUWIJFt1kiGRRjE29cXNVdXwPkqCyA3Pv
 /PkiVmMNsVFEgkIWoX6oF5jLMsdog0hdCQ8Zt7FmfNLURBwWVv3J1JJHD87jLQjINtLkIMbb8SsH2
 nm7hj3fprNxkgWEa6LZ62ldmky8/2v/gz42lTilIFu8fhWJXcMDz07YhZn5qlPG8rz/Cv3nug74Ih
 pzlloKnMh0qXmhEAbyKQ571JnbcvnUqTPZkS6eOmEf7Ko+UAzMx9ijiFlvF7gOcuxnDQeep1INjef
 tecpNW9w==;
Received: from [186.208.74.26] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vH3Gy-0035jh-IP; Thu, 06 Nov 2025 17:55:44 +0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, mwen@igalia.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v7 00/15] drm/amd/display: more drm_edid to AMD display driver
Date: Thu,  6 Nov 2025 13:49:03 -0300
Message-ID: <20251106165536.161662-1-mwen@igalia.com>
X-Mailer: git-send-email 2.51.0
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

Hi,

We have been working on a solution to reduce the usage of drm_edid_raw
in the AMD display driver, since the current guideline in the DRM
subsystem is to stop handling raw edid data in driver-specific
implementation and use opaque `drm_edid` object with common-code
helpers.

The main change of this version is that we are now adding DM helpers for
linux-specific code with drm_edid to keep DC OS-agnostic, instead of
creating a new file and new functions, as in previous versions.

This work is an extension of [1].

- Patch 1 addresses a possible leak added by previous migration to
  drm_edid.
- Patch 2 allocates a temporary drm_edid from raw edid for parsing.
- Patches 3-8 use common-code, drm_edid helpers to parse edid
  capabilities instead of driver-specific solutions. For this, patch 4
  introduces a new helper that gets monitor name from drm_edid.
- Patches 9-10 are groundwork to reduce the noise of Linux/DRM specific
  code in the DC shared code.
- Patch 11 moves open-coded management of raw EDID data to DM helpers
  with drm_edid 
- Patch 12 creates a DM helper that fills dc_sink with edid data 
- Patch 13 introduces a helper that compares EDIDs from two drm_edids.
- Patch 14 adds drm_edid to dc_sink struct and a DM helper to free
  `drm_edid`
- Patch 15 switch dc_edid to drm_edid across the driver in a way that
  the DC shared code is little affected by Linux specific stuff.

[v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1-mwen@igalia.com/
Changes:
- fix broken approach to get monitor name from eld (Jani)
  - I introduced a new helper that gets monitor name from drm_edid
- rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
- add NULL edid checks (Jani)
- fix mishandling of product_id.manufacturer_name (Michel)
  - I directly set it to manufacturer_id since sparse didn't complain.
- add Mario's r-b in the first fix patch and fix commit msg typo.

[v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1-mwen@igalia.com/
Changes:
- kernel-doc and commit msg fixes (Jani)
- use drm_edid_legacy_init instead of open coded (Jani)
- place drm_edid new func into the right section (Jani)
- paramenter names fix (Jani)
- add Jani's r-b to the patch 12
- remove unnecessary include (Jani)
- call dc_edid_sink_edid_free in link_detection, instead of drm_edid_free
- rebase on top of asdn

[v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1-mwen@igalia.com/
Changes:
- rebase to asdn
- some kernel-doc fixes
- move some changes to the right commit

[v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1-mwen@igalia.com/
Changes:
- fix comments and commit messages (Mario)
- remove unnecessary drm_edid dup and fix mem leak (Mario)
- add Mario's rb to patches 5-7

[v5] https://lore.kernel.org/amd-gfx/20250618152216.948406-1-mwen@igalia.com/
Changes:
- fix NULL pointer dereference (Alex H.) with the same approach proposed
  by 7c3be3ce3dfae

[v6] https://lore.kernel.org/amd-gfx/20250726003816.435227-1-mwen@igalia.com/
Changes:
- use AMD DM helpers instead of new file for edid-related helpers with Linux drm_edid (Harry)
- new patch (4/15) for AMD edid_caps parsing of analog displays with a drm_edid helper.
- rebase on top of asdn

---

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

Melissa Wen (15):
  drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
  drm/amd/display: start using drm_edid helpers to parse EDID caps
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: use drm_edid helper to set analog EDID caps
  drm/edid: introduce a helper that gets monitor name from drm_edid
  drm/amd/display: get panel id with drm_edid helper
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps
  drm/amd/display: simplify dm_helpers_parse_edid_caps signature
  drm/amd/display: change DC functions to accept private types for edid
  drm/amd/display: add DM helpers to handle EDID in DC via drm_edid
    helpers
  drm/amd/display: create a function to fill dc_sink with edid data
  drm/edid: introduce a helper that compares edid data from two drm_edid
  drm/amd/display: add drm_edid to dc_sink
  drm/amd/display: move dc_sink from dc_edid to drm_edid

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  32 ++--
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 145 ++++++++++--------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 +--
 .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   2 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  13 +-
 .../gpu/drm/amd/display/dc/inc/link_service.h |   2 +-
 .../drm/amd/display/dc/link/link_detection.c  |  28 +---
 .../drm/amd/display/dc/link/link_detection.h  |   9 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
 drivers/gpu/drm/drm_edid.c                    |  54 +++++--
 include/drm/drm_edid.h                        |   9 +-
 14 files changed, 179 insertions(+), 159 deletions(-)

-- 
2.51.0

