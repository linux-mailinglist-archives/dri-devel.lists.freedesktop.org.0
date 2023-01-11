Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FDF666210
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 18:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B82610E7B5;
	Wed, 11 Jan 2023 17:38:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A32B10E7B8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xYU4RuMxy/JRRAMpNzK6ZStei0ZYM210L9gN90jx4GE=; b=DXG7+tXyJCL5uuTX2Zt7r6LSks
 KZHfak+Uzi/rNvyR/+1nY6UC3H+70S84ni6fpboxKr6fW5y+EYVXv6f+wFJ4n8noQrNlVeU/fTYtK
 7ToAgvTTsLQjEYx8TH8OxS85Up5KuhMEtUb8GY+QEZ8DxUIlNItZw298Z08C5U6VGEKBM+/JpfIBo
 2jTWAsWHQcka5w8vezjWxkDLfypDsdX3aEOdxPPSpVwRxNOawnQJj+Ra9VuH74XeWQgxjMTbb4d2g
 9SrmHiLwjHECrN77dhhCgFmJGySR44Z4Xrl5iJZAeRGogYmdv7qeYJx0OeqfIC3aNY3ptKmPMgYHk
 OxRX8WFw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pFf3P-005Sku-E1; Wed, 11 Jan 2023 18:38:24 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 00/13] drm/debugfs: Create a debugfs infrastructure for kms
 objects
Date: Wed, 11 Jan 2023 14:37:35 -0300
Message-Id: <20230111173748.752659-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces the initial structure to improve the support of kms
objects by the DRM debugfs [1].

Currently, we can create debugfs files at late-register hooks with the function
drm_debugfs_add_file() through the functionality implemented by the function
drm_debugfs_late_register(), which creates the debugfs files after the
registration of the kms objects. But, this was a stop-gap 
while we didn't have proper debugfs infrastructure for the kms objects.

Therefore, this series will add a debugfs infrastructure to the connector,
crtc, and encoder objects similar to the device-centered debugfs helpers [2].

Patches 1 and 2 will create macros to avoid copypasting the core management of
the linked list. Patches 3 through 5 will introduce the structure for the
connector, encoder, and crtc respectively. Patches 6 through 11 will convert
the old structure to the new structure for 2 drivers: vc4 and sti. Finally,
patch 12 will delete the unnecessary drm_debugfs_late_register() function.

[1] https://cgit.freedesktop.org/drm/drm/tree/Documentation/gpu/todo.rst#n506/
[2] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1c9cacbea880513a896aee65a5c58007bcb55653

Best Regards,
- Maíra Canal

Maíra Canal (13):
  drm/debugfs: Create helper to add debugfs files to device's list
  drm/debugfs: Create helper to create debugfs files from list
  drm/debugfs: Create a debugfs infrastructure for connectors
  drm/debugfs: Create a debugfs infrastructure for encoders
  drm/debugfs: Create a debugfs infrastructure for CRTC
  drm/vc4: Split variable instantiation of vc4_debugfs_regset32()
  drm/vc4: Use the encoders' debugfs infrastructure
  drm/vc4: Use the crtc's debugfs infrastructure
  drm/sti: Use the crtc's debugfs infrastructure
  drm/sti: Use the connectors' debugfs infrastructure
  drm/sti: Use the encoders' debugfs infrastructure
  drm/debugfs: Remove the debugfs late register function
  drm/todo: Update the debugfs clean up task

 Documentation/gpu/todo.rst           |  14 ++-
 drivers/gpu/drm/drm_connector.c      |   5 +
 drivers/gpu/drm/drm_crtc.c           |   5 +
 drivers/gpu/drm/drm_debugfs.c        | 141 +++++++++++++++++++++++----
 drivers/gpu/drm/drm_encoder.c        |   6 ++
 drivers/gpu/drm/drm_internal.h       |  16 ++-
 drivers/gpu/drm/drm_mode_config.c    |   2 -
 drivers/gpu/drm/sti/sti_compositor.c |   6 +-
 drivers/gpu/drm/sti/sti_compositor.h |   2 +-
 drivers/gpu/drm/sti/sti_crtc.c       |   2 +-
 drivers/gpu/drm/sti/sti_dvo.c        |  21 +---
 drivers/gpu/drm/sti/sti_hda.c        |  21 +---
 drivers/gpu/drm/sti/sti_hdmi.c       |  21 +---
 drivers/gpu/drm/sti/sti_mixer.c      |  31 +-----
 drivers/gpu/drm/sti/sti_mixer.h      |   2 +-
 drivers/gpu/drm/sti/sti_tvout.c      |  21 +---
 drivers/gpu/drm/sti/sti_vid.c        |  19 +---
 drivers/gpu/drm/sti/sti_vid.h        |   2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c       |   5 +-
 drivers/gpu/drm/vc4/vc4_debugfs.c    |  55 +++++++++--
 drivers/gpu/drm/vc4/vc4_dpi.c        |   3 +-
 drivers/gpu/drm/vc4/vc4_drv.h        |  16 +++
 drivers/gpu/drm/vc4/vc4_dsi.c        |   3 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c       |   5 +-
 drivers/gpu/drm/vc4/vc4_vec.c        |   3 +-
 include/drm/drm_connector.h          |  15 +++
 include/drm/drm_crtc.h               |  15 +++
 include/drm/drm_debugfs.h            |  77 +++++++++++++++
 include/drm/drm_encoder.h            |  15 +++
 29 files changed, 384 insertions(+), 165 deletions(-)

-- 
2.39.0

