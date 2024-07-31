Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF2794349C
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 19:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECFF10E168;
	Wed, 31 Jul 2024 17:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="KGP9OARd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2836510E062;
 Wed, 31 Jul 2024 17:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1722445249;
 bh=5eAvQKO7fvKZZLTwGN3TIF2AiW9AcA9+zhEoKtfkcEo=;
 h=From:Subject:Date:To:Cc:From;
 b=KGP9OARdbzLPR8WMWHLj7Djgx5TdYDtABrhtSENICW8znlx5gr/1xY4uVlxXC8XDP
 dkuCavPtHrJla2qSQtdtChdAT0B3fsYprbXZN3+793zVW5cacN1YPtb4mXNW7wCupu
 i1i2pSxQT52QeJolqaaFaFiidxC+mOB3FA4jNEyk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/2] drm: minimum backlight overrides and implementation
 for amdgpu
Date: Wed, 31 Jul 2024 19:00:45 +0200
Message-Id: <20240731-amdgpu-min-backlight-quirk-v3-0-46d40bb21a62@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAL1tqmYC/43NSw6CMBSF4a2Qjr2mlLcj92EclHKhN0jBFlBD2
 LuFkYmJcfifwXcW5tASOnYKFmZxJke98REdAqa0NA0CVb6Z4CLmachBdlUzTNCRgVKq9kaNHuE
 +kW0hj7moqxyzKJXMA4PFmp47frn61uTG3r72rznc1r/YOYTQ20mRF4lMSiHPDyTnnNKTPhoc2
 WbP4sMT0U9PAAeFqs7quKhkUX5567q+ARgwZLIZAQAA
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, Xinhui Pan <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722445249; l=1653;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5eAvQKO7fvKZZLTwGN3TIF2AiW9AcA9+zhEoKtfkcEo=;
 b=iUggWOXzwHOug9or31VOC62hvfZvFZVJEOaD0p6T55t7hK0c2XQya+a/rnhD10jZj9beut0c4
 dEuDVIlip2PCB/hOo9LYaEQVWGwlijT7Fsvy/R8j+ms8PsukW39WmZ+
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

Add a generic override helper for the user to override the settings
provided by the firmware through the kernel cmdline.
Also add amdgpu as a user of that helper.

One solution would be a fixed firmware version, which was announced but
has no timeline.

This helper does conflict with the mode override via the cmdline.
Only one can be specified.
IMO the mode override can be extended to also handle "min-brightness"
when that becomes necessary.

---
Changes in v3:
- Switch to cmdline override parameter
- Link to v2: https://lore.kernel.org/r/20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net

Changes in v2:
- Introduce proper drm backlight quirk infrastructure
- Quirk by EDID and DMI instead of only DMI
- Limit quirk to only single Framework 13 matte panel
- Link to v1: https://lore.kernel.org/r/20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net

---
Thomas Weißschuh (2):
      drm/connector: add drm_connector_get_cmdline_min_brightness_override()
      drm/amd/display: implement minimum brightness override

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 ++++
 drivers/gpu/drm/drm_connector.c                   | 34 +++++++++++++++++++++++
 include/drm/drm_connector.h                       |  2 ++
 3 files changed, 42 insertions(+)
---
base-commit: 36821612eb3091a21f7f4a907b497064725080c3
change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

