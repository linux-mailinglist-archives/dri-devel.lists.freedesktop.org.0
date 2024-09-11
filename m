Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CFB975C7F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 23:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9F910E0D1;
	Wed, 11 Sep 2024 21:35:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="d/FXt0OW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50510E0D1;
 Wed, 11 Sep 2024 21:35:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E756BA4011B;
 Wed, 11 Sep 2024 21:35:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9BF1C4CEC6;
 Wed, 11 Sep 2024 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726090552;
 bh=W1WbbVUMPt9TR5vu4oa796VQg9w8H3WcxMnRFwNHkvY=;
 h=From:To:Cc:Subject:Date:From;
 b=d/FXt0OWSJlHjhgEdtjS530+NpzyuFkPYDkUtl0/6HRkGh06gHWfuiWIEFMJvqgUC
 +IMUMOHniPdhRyb8r5qMQZOepuSB16IwCclyXCQBBBa857pOLH4x7SLG2wr/rkMGDd
 0MsaVTNN1jZgOaNqYN8cqfy2zHKxWBdMA22WKpNsuGu57Ftte8QiYE74iXq6L945aM
 GYeyHLxXcy0Q6lEhC/DeDZiMYN6HDOitCSebo0TmqWmJ8iN23JQS4rTQhECp6Q38d2
 IAWc24R186PkJ/QcG7efruiv6hF+lSJsnc+6AdOjrhoyxcFn49s17r3nRPx//0HeFN
 Huhkf0eHROrhw==
From: Mario Limonciello <superm1@kernel.org>
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [PATCH v6 00/10] drm/amd/display: Use drm_edid for more code
Date: Wed, 11 Sep 2024 16:35:26 -0500
Message-ID: <20240911213537.2338164-1-superm1@kernel.org>
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

Melissa's patches are mostly unmodified from v5, but modified to apply on
top of v6.11-rc7 instead.
The same limitations she called out with amd-staging-drm-next missing
symbols from the development release still apply. So applying this series
will probably need to wait for that to be rebased.

As were both touching similar code for fetching the EDID, I've merged the
pertinent parts of my series into this one in allowing the connector to
fetch the EDID from _DDC if available for eDP as well.

There are still some remaining uses of drm_edid_raw() but they touch pure
DC code, so a wrapper or macro will probably be needed to convert them.
This can be for follow ups later on.

Link: https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/ [1] 
Link: https://lore.kernel.org/dri-devel/20240214215756.6530-1-mario.limonciello@amd.com/ [2]
Mario Limonciello (1):
  drm/amd: Fetch the EDID from _DDC if available for eDP

Melissa Wen (9):
  drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
  drm/amd/display: switch to setting physical address directly
  drm/amd/display: always call connector_update when parsing
    freesync_caps
  drm/amd/display: remove redundant freesync parser for DP
  drm/amd/display: use drm_edid_product_id for parsing EDID product info
  drm/amd/display: parse display name from drm_eld
  drm/amd/display: get SAD from drm_eld when parsing EDID caps
  drm/amd/display: get SADB from drm_eld when parsing EDID caps
  drm/amd/display: remove dc_edid handler from
    dm_helpers_parse_edid_caps

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 215 +++++-------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 173 +++++++++-----
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
 drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
 .../drm/amd/display/dc/link/link_detection.c  |   6 +-
 drivers/gpu/drm/amd/include/amd_shared.h      |   1 +
 7 files changed, 196 insertions(+), 238 deletions(-)

-- 
2.43.0

