Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F08913912
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 10:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141E610E1C0;
	Sun, 23 Jun 2024 08:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="EPVuytmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AB710E1DE;
 Sun, 23 Jun 2024 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1719132689;
 bh=zB2lHe/cxmaq3sEJTX39vzQps5Xljraxg3sewiB+Xv4=;
 h=From:Subject:Date:To:Cc:From;
 b=EPVuytmQawb4QbbtMpIwLUtd1BUdP0idrchVzD9gAehNsFqyCWCq8p6jeuAIf5LtI
 Oszh/kVYFO031J5jQHlU7hRtfepvzrlfcyYKeAjIHSmyH5XmMEaP13KcN6EFyA7g3/
 BeKkxckBNBpat78/zwLluNhRRrzCP9bRB2OsX34g=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] drm: backlight quirk infrastructure and lower
 minimum for Framework AMD 13
Date: Sun, 23 Jun 2024 10:51:26 +0200
Message-Id: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA7id2YC/43NQQ6CMBCF4auQrh3TVkBg5T0MiwIDnSAFO4Aaw
 t2tnMDl/xbf2wSjJ2RRRJvwuBLT6ELoUyRqa1yHQE1ooaWOZaokmKHppgUGclCZun9QZ2d4LuR
 7yGKp2ybD6yU1IgCTx5beB34vQ1viefSf42tVv/UvdlWggp3kWZ6YpNLm9kJi5tou9uxwFuW+7
 184PZHbyQAAAA==
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719132688; l=2496;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zB2lHe/cxmaq3sEJTX39vzQps5Xljraxg3sewiB+Xv4=;
 b=0x05OrASCwGcIIhqmTXoV+ChUICWHrXM8Z9UIIYNcCruuieBg6vTjCBfs6mo2eNPXUpI5W4k5
 Oemc98k/a8gCFqs5lAvZneIj1AHRCPlDTahSWgqSjSbzKCuwz0HJqaY
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

Add a generic quirk infrastructure for backlight configuration to
override the settings provided by the firmware.
Also add amdgpu as a user of that infrastructure and a quirk for the
Framework 13 matte panel.
Most likely this will also work for the glossy panel, but I can't test
that.

One solution would be a fixed firmware version, but given that the
problem exists since the release of the hardware, it has been known for
a month that the hardware can go lower and there was no acknowledgment
from Framework in any way, I'd like to explore this alternative
way forward.

Notes:

* Should the quirk infrastructure be part of drm_edid.c?
* The current allocation of struct drm_edid in amdgpu is bad.
  But it is done the same way in other parts of amdgpu.
  I do have patches migrating amdgpu to proper usage of struct drm_edid [0]

Mario:

I intentionally left out the consideration of the firmware version.
The quirk will stay correct even if the firmware starts reporting
correct values.
If there are strong opinions it would be easy to add, though.

Based on amdgpu/drm-next.

[0] https://lore.kernel.org/lkml/20240616-amdgpu-edid-bios-v1-1-2874f212b365@weissschuh.net/

---
Changes in v2:
- Introduce proper drm backlight quirk infrastructure
- Quirk by EDID and DMI instead of only DMI
- Limit quirk to only single Framework 13 matte panel
- Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net

---
Thomas Weißschuh (3):
      drm: Add panel backlight quirks
      drm: panel-backlight-quirks: Add Framework 13 matte panel
      drm/amd/display: Add support backlight quirks

 Documentation/gpu/drm-kms-helpers.rst             |  3 +
 drivers/gpu/drm/Kconfig                           |  4 ++
 drivers/gpu/drm/Makefile                          |  1 +
 drivers/gpu/drm/amd/amdgpu/Kconfig                |  1 +
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 28 +++++++++
 drivers/gpu/drm/drm_panel_backlight_quirks.c      | 76 +++++++++++++++++++++++
 include/drm/drm_utils.h                           | 11 ++++
 7 files changed, 124 insertions(+)
---
base-commit: 1ecef5589320fd56af599b624d59c355d162ac7b
change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

