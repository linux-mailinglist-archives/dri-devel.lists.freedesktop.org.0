Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDB955BA5
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 08:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FC610E165;
	Sun, 18 Aug 2024 06:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="erBoN4tt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7C610E164;
 Sun, 18 Aug 2024 06:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723964282;
 bh=kNCKiT1FN6YahGLa2oSLHTz2Alz/wRPZwTWTFClaIjg=;
 h=From:Subject:Date:To:Cc:From;
 b=erBoN4tte68H/WaTM29ouoFi4ZXbyhZy7DBczgz69veu7xLn86PfuNWYd6o4o6fLT
 QfI3dTyUN8vQneXBazl73Dkyd1/DsyCQwooVNHP4yyj6atLrpxz2Q/V+F1PxnecHqm
 j/8xWVYdfuTTv0lbAsKxu9omL/rk9MAC85RdoSGI=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v5 0/4] drm: Minimum backlight overrides and implementation
 for amdgpu
Date: Sun, 18 Aug 2024 08:56:36 +0200
Message-Id: <20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACSbwWYC/43NS07DMBSF4a1UHmNkX787Yh+IgZ+xVZoWOwmgK
 nvH7aRIVBHD/wy+c0Et1hIb2u8uqMaltHIae4inHfLZjkPEJfRGQIATSQm2xzCcZ3wsI3bWH97
 LkCf8MZd6wJoTSEFHxaRFHTjXmMrXDX99651Lm071+/a10Ov6L3ahmHZbGG2EFQ7sy2csrTWf5
 /w8xgld7QV+ecA2PcAE++iTStwEa9xDj909xeimx7rHZeDEOaBWwkOP3z1NYdPj3RPSSpaSNsq
 pP966rj82dFsSuQEAAA==
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723964281; l=2448;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=kNCKiT1FN6YahGLa2oSLHTz2Alz/wRPZwTWTFClaIjg=;
 b=7h3BBPZuOZAF4p/CtlZ3V4u4Xa1fmy2PSEC1mrAH6U6xvkgEpJ6UXtejd5lgu/N1MNmYHeGKw
 lStgNTZuvpbB4NpvCMvpv1JFeR6JPVL3gADixG75tjuLlEjvd7Lpld6
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

The value of "min_input_signal" returned from ATIF on a Framework AMD 13
is "12". This leads to a fairly bright minimum display backlight.

Introduce a quirk to override "min_input_signal" to "0" which leads to a
much lower minimum brightness, which is still readable even in daylight.

Tested on a Framework AMD 13 BIOS 3.05 and Framework AMD 16.

One solution would be a fixed firmware version, which was announced but
has no timeline.

---
Changes in v5:
- Forward-declare struct drm_edid
- Reorder patches, quirk entries are last
- Add patch from Dustin for additional quirk entries
- Link to v4: https://lore.kernel.org/r/20240812-amdgpu-min-backlight-quirk-v4-0-56a63ff897b7@weissschuh.net

Changes in v4:
- Switch back to v2 implementation
- Add MODULE_DESCRIPTION()
- Simplify quirk infrastructure to only handle min backlight quirks.
  It can be extended if necessary.
- Expand documentation.
- Link to v3: https://lore.kernel.org/r/20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net

Changes in v3:
- Switch to cmdline override parameter
- Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net

Changes in v2:
- Introduce proper drm backlight quirk infrastructure
- Quirk by EDID and DMI instead of only DMI
- Limit quirk to only single Framework 13 matte panel
- Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net

---
Dustin L. Howett (1):
      drm: panel-backlight-quirks: Add Framework 13 glossy and 2.8k panels

Thomas Weißschuh (3):
      drm: Add panel backlight quirks
      drm/amd/display: Add support for minimum backlight quirk
      drm: panel-backlight-quirks: Add Framework 13 matte panel

 Documentation/gpu/drm-kms-helpers.rst             |  3 +
 drivers/gpu/drm/Kconfig                           |  4 +
 drivers/gpu/drm/Makefile                          |  1 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 +++
 drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 +++++++++++++++++++++++
 include/drm/drm_utils.h                           |  4 +
 7 files changed, 117 insertions(+)
---
base-commit: c3f2d783a459980eafd24c5af94ccd56a615961f
change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

