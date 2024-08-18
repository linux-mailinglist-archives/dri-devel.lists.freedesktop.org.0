Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE41D955C29
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A910010E021;
	Sun, 18 Aug 2024 10:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="LPchZ3G/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7163C10E01F;
 Sun, 18 Aug 2024 10:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=kl3heLQyW5KkENM8k3MDFGyGD2/NtXxvdiQoPH62gGw=;
 h=From:Subject:Date:To:Cc:From;
 b=LPchZ3G/S6/6yaqZOfFCPLl8NFWMl8S7flXdySaR1G5BGGV1rEPWfM+xUpxhQsS5p
 lV5rtVUOIhqqftBWg2UOVCn6z/NwZlYo9Fdjjkx/Yet1lkAKAkZKfbwvi5FVV4f/5X
 IjzIW3JJjKJuHehLYxDDDxeOwKoLT0SDtAiCguA4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 00/12] drm/amd: Switch over to struct drm_edid
Date: Sun, 18 Aug 2024 12:43:24 +0200
Message-Id: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEzQwWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDM0NT3cTclPSCUt2Uotz41JTMFF1joxRLM8uUtCQLS0sloK6CotS0zAq
 widGxtbUAVJufj2EAAAA=
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, jinzh <jinzh@github.amd.com>, 
 Aric Cyr <Aric.Cyr@amd.com>, Alan Liu <HaoPing.Liu@amd.com>, 
 Tony Cheng <Tony.Cheng@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Harry Wentland <Harry.Wentland@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=3177;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=kl3heLQyW5KkENM8k3MDFGyGD2/NtXxvdiQoPH62gGw=;
 b=qjrcDRrBX2fNmXdj8yZQ7/qhkGPCfljpa2CO2OGtjIjBgGPNVeF/2zYxvJBCp7O7WSXImcy+s
 ehXe7AgCeEXCluWo2tPGajQZ52Wq0TbmbkhCDYpCF2kaeIab1vEYZIg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

The AMD DRM drivers use 'struct edid', raw pointers and even custom
structs to represent EDID data.
Uniformly switch to the safe and recommended "struct drm_edid".

Some uses of "struct edid" are left because some ad-hoc parsing is still
being done inside the drivers.

The patch "drm/amd/display: Switch amdgpu_dm_connector to struct drm_edid"
will conflict with my backlight quirk series [0].
The conflict will result in an obvious and easy to fix build failure.

Patches 1 and 2 delete some dead code.
Patches 3 to 6 constify some arguments and shuffle around some code.
The remaining patches perform the actual conversion in steps.

[0] https://lore.kernel.org/lkml/20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (12):
      drm/amd/display: remove spurious definition for dm_helpers_get_sbios_edid()
      drm/amd/display: Remove EDID members of ddc_service
      drm/edid: constify argument of drm_edid_is_valid()
      drm/amd/display: Simplify raw_edid handling in dm_helpers_parse_edid_caps()
      drm/amd/display: Constify raw_edid handling in dm_helpers_parse_edid_caps()
      drm/amd/display: Constify 'struct edid' in parsing functions
      drm/amd/display: Use struct edid in dc_link_add_remote_sink()
      drm/amdgpu: Switch amdgpu_connector to struct drm_edid
      drm/amd/display: Switch amdgpu_dm_connector to struct drm_edid
      drm/edid: add a helper to compare two EDIDs
      drm/amd/display: Switch dc_sink to struct drm_edid
      drm/amd/display: Switch dc_link_add_remote_sink() to struct drm_edid

 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     | 56 ++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |  3 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  4 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  4 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 84 +++++++++++-----------
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h  |  5 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  | 34 +++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 28 ++++----
 .../gpu/drm/amd/display/dc/core/dc_link_exports.c  |  5 +-
 drivers/gpu/drm/amd/display/dc/dc.h                |  8 +--
 drivers/gpu/drm/amd/display/dc/dc_ddc_types.h      |  7 --
 drivers/gpu/drm/amd/display/dc/dc_types.h          |  5 --
 drivers/gpu/drm/amd/display/dc/dm_helpers.h        |  4 +-
 drivers/gpu/drm/amd/display/dc/inc/link.h          |  3 +-
 .../gpu/drm/amd/display/dc/link/link_detection.c   | 42 ++++-------
 .../gpu/drm/amd/display/dc/link/link_detection.h   |  3 +-
 drivers/gpu/drm/drm_edid.c                         | 20 +++++-
 include/drm/drm_edid.h                             |  3 +-
 20 files changed, 155 insertions(+), 171 deletions(-)
---
base-commit: 207565ee2594ac47261cdfc8a5048f4dc322c878
change-id: 20240615-amdgpu-drm_edid-32d969dfb899

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

