Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2A2988CD0
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 01:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D9610ED35;
	Fri, 27 Sep 2024 23:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="reQVAeWC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A2510ED35;
 Fri, 27 Sep 2024 23:06:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 271F85C00AF;
 Fri, 27 Sep 2024 23:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 858A6C4CEC4;
 Fri, 27 Sep 2024 23:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727478372;
 bh=wLpZMddhjK5T7Flz7xQVEdXPFZODspH2u083iySZuUk=;
 h=From:To:Cc:Subject:Date:From;
 b=reQVAeWCy0g0neHfwoVR63JzbKlV7o64HLiGzZYs69bGBIZ+oY4lMwWYN20Hww1Fu
 JLIJ3eRSoTiHwfsUQE9A+nnn0vt7TqCR2/TvI1nKOfkF9XrhY9p+ubwiQ9wrnAn0Mu
 VBfyVp0B00lieaInLa6a7kj9pj+hz6OK04tw4TC8oGh7SUvfrMs2Mtp2zUH25rxbNG
 01OVag7A/WM02mF7NAv8Zq4+j37m+CozqDoIE4YqDEuhrDrTgVBo4ewWjnohKLJzPT
 ON6fHSF5OkOjmCWgG6r9+dCsU9enUyjihcmekMf6jSGQCwAPjOaf/N8n7qE7vmPnrE
 1KNBjw3Q58UVg==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v8 0/5] drm/amd/display: Use drm_edid for more code
Date: Fri, 27 Sep 2024 18:05:55 -0500
Message-ID: <20240927230600.2619844-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
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

From: Mario Limonciello <mario.limonciello@amd.com>

This is the successor of Melissa's v5 series that was posted [1] as well
as my series that was posted [2].

Melissa's patches are mostly unmodified from v5, but the series has been
rebase on the new 6.10 based amd-staging-drm-next.

As were both touching similar code for fetching the EDID, I've merged the
pertinent parts of my series into this one in allowing the connector to
fetch the EDID from _DDC if available for eDP as well.

There are still some remaining uses of drm_edid_raw() but they touch pure
DC code, so a wrapper or macro will probably be needed to convert them.
This can be for follow ups later on.

Link: https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/ [1]
Link: https://lore.kernel.org/dri-devel/20240214215756.6530-1-mario.limonciello@amd.com/ [2]

v8:
 * Drop patches 5-9 as they cause regressions and will be future followups
 * Rebase patch 10 on patches 1-4

Mario Limonciello (1):
  drm/amd/display: Fetch the EDID from _DDC if available for eDP

Melissa Wen (4):
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
  drm/amd/display: switch to setting physical address directly
  drm/amd/display: always call connector_update when parsing
    freesync_caps
  drm/amd/display: remove redundant freesync parser for DP

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 195 ++++++------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  76 ++++++-
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
 drivers/gpu/drm/amd/include/amd_shared.h      |   5 +
 5 files changed, 153 insertions(+), 161 deletions(-)

-- 
2.43.0

