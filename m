Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F889C4498
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:10:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E41C410E4FA;
	Mon, 11 Nov 2024 18:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZEc/M4XZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0040B10E4FA;
 Mon, 11 Nov 2024 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731348626;
 bh=0fcvhlGDwQjs39aD+J+QDRM4SeIBKZg07OzIxurnNCE=;
 h=From:Subject:Date:To:Cc:From;
 b=ZEc/M4XZ8yOwd7ahUu/EXreUc6S9fTj2aLz8Dk5y8wxieSXUITdAbqC/p6DSG0IXk
 VHhzaSeaCNCGM9tdvQRpjwg1hliakvTpBREgxG+LM6gGfjWJ5J/WEocCjLW5f8MJwH
 AZfglvDxsEtv/A163I0dP2qgdLTsU6vqfY2hn5z4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v7 0/4] drm: Minimum backlight overrides and implementation
 for amdgpu
Date: Mon, 11 Nov 2024 19:09:34 +0100
Message-Id: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF5IMmcC/43NS07DMBSF4a1UHmPktx1G7AMxuLavE6s0LXESQ
 FX2jttJIxFFDP8z+M6VFBwyFvJyuJIB51zyua9hnw4kdNC3SHOsTQQTihnOKJxie5noKffUQzh
 +5LYb6eeUhyN1iokUHVppgFTgMmDK33f87b12l8t4Hn7uXzO/rf9iZ055tXXjGg3aC3j9wlxKC
 d3UPfc4kps9i5Un5K4nKKMBQ7JJNREav+nJh2cl3/Vk9ZSJinkvOBix6amH57jY9VT1tAEjU3K
 N9XbT02vP7Xq6et4EhhBZsDJuemblCbXrmepxjNYa4DZ5+cdbluUXlg1dJFkCAAA=
X-Change-ID: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731348626; l=2864;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0fcvhlGDwQjs39aD+J+QDRM4SeIBKZg07OzIxurnNCE=;
 b=8s8m4HLB0qmD8Rb7rvfcrOFluNqdx1cDU6eJsavU3i9D2J2ifoCqE6rLQfvPk2WJyi+k0Nrt4
 q3pw3JsYmwBDbgTzLtfGyKk/lq7n1bOPspAfIgnp0BdJRIv7CMFWNgg
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

One solution would be a fixed firmware version, which was announced but
has no timeline.

---
Changes in v7:
- Rebase on drm-next
- Drop now unnecessary hacky allocation of struct drm_edid
- Link to v6: https://lore.kernel.org/r/20240824-amdgpu-min-backlight-quirk-v6-0-1ed776a17fb3@weissschuh.net

Changes in v6:
- Clean up cover letter and commit messages
- Add my S-o-b to patch from Dustin
- Mention testing in combination with "panel_power_savings"
- Link to v5: https://lore.kernel.org/r/20240818-amdgpu-min-backlight-quirk-v5-0-b6c0ead0c73d@weissschuh.net

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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++
 drivers/gpu/drm/drm_panel_backlight_quirks.c      | 94 +++++++++++++++++++++++
 include/drm/drm_utils.h                           |  4 +
 7 files changed, 113 insertions(+)
---
base-commit: 377dda2cff59825079aee3906aa4904779747b0b
change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

