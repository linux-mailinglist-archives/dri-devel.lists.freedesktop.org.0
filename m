Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5463EADF12A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29A410E890;
	Wed, 18 Jun 2025 15:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="b/ROIEup";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A30310E891;
 Wed, 18 Jun 2025 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P34gDqPSDK73KppbsoUcDGWvvoaeMXnbw8wQv3IrFQ0=; b=b/ROIEup3zPxTN77iMoaDZemt3
 GW2vk7t0d1yyrA2jzWTKltRVZIh5mYTu9tYlvafZDkfPsyZ8y2io42OY/MsK5aH0L1udk+TCDo+CH
 1Bxd+McVDTOehaFln2IT528Bn7pkDyYIjC/oMiPQ6b5xOaiP27uBMpE2b0KUzFS8qlEVMB1zcPcC6
 x+9vUx4CLo9y2wDEPauwWeJ2yCE6pmhRZgI6saRjVNCep6SAa+jsxqVGvftfVQZh534HxYPK+1nP2
 500B6Y1ikLzCZZ8FtHMYREoVyXFZ/lL5D1HQzw6hsLFNxHlWX9FXem6eMRJAOJ8IdIA/9vHDAFvR0
 Z6TPerlA==;
Received: from [189.6.13.79] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRucN-0057e5-E0; Wed, 18 Jun 2025 17:22:28 +0200
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, mwen@igalia.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: [PATCH v5 00/14] drm/amd/display: more drm_edid to AMD display driver
Date: Wed, 18 Jun 2025 12:19:39 -0300
Message-ID: <20250618152216.948406-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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

Siqueira and I have been working on a solution to reduce the usage of
drm_edid_raw in the AMD display driver, since the current guideline in
the DRM subsystem is to stop handling raw edid data in driver-specific
implementation and use opaque `drm_edid` object with common-code
helpers.

In short, this series approaches the issue of maintaining DC as an
OS-agnostic component by creating a mid layer to isolate `drm_edid`
helpers that need to be called in the DC code, while allowing other OSes
to implement their specific implementation. This is an extension of [1].

- Patch 1 addresses a possible leak added by previous migration to
  drm_edid.
- Patch 2 allocates a temporary drm_edid from raw edid for parsing.
- Patches 3-7 use common-code, drm_edid helpers to parse edid
  capabilities instead of driver-specific solutions. For this, patch 4
  introduces a new helper that gets monitor name from drm_edid.
- Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
  code in the DC shared code
- Patch 10 creates a mid layer to make DC embraces different ways of
  handling EDID by platforms.
- Patch 11 move open-coded management of raw EDID data to the mid
  layer created before.
- Patch 12 introduces a helper that compares EDIDs from two drm_edids.
- Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
  free `drm_edid`.
- Patch 14 switch dc_edid to drm_edid across the driver in a way that
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

Finally, I'm not sure amdgpu_dm/dc_edid is the right place and file name
for the mid-layer. Suggestions?

[1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1-mwen@igalia.com/

Let me know yours thoughts!

Melissa

Melissa Wen (12):
  drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
  drm/amd/display: start using drm_edid helpers to parse EDID caps
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/edid: introduce a helper that gets monitor name from drm_edid
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
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 105 +++++++-----------
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  33 ++++++
 .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
 .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
 drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
 drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
 .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
 .../drm/amd/display/dc/link/link_detection.h  |   9 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
 drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
 include/drm/drm_edid.h                        |  10 +-
 17 files changed, 193 insertions(+), 160 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
 create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h

-- 
2.47.2

