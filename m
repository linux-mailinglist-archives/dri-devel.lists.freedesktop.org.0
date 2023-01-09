Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4B366229F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 11:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8587B10E3A6;
	Mon,  9 Jan 2023 10:12:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899F610E3A7;
 Mon,  9 Jan 2023 10:12:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBB04202E6;
 Mon,  9 Jan 2023 10:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673259164; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+nPCQAj1zcgU1AbzIF46JGpfEheuec7RdjM6Yy+AWvM=;
 b=xZpY5tOMDtFOZj0hLYrl0XXC2tY1ldpktqHkGFh/Qy6I6phoBJJIHRhnjHxSYi0NfRmPiV
 6z1skNyGTYEcPDH9YxDcs/ePn4bNmBazlZjDb1JiD4WuHxrzlsvLMFRqVGk3W/XMv/Onej
 tTmmtra7ujOyDcJfSrwKb3fWgW84S6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673259164;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+nPCQAj1zcgU1AbzIF46JGpfEheuec7RdjM6Yy+AWvM=;
 b=mqyHl6EGEJ6xYP2j0I/EOOgKdAkVs9/WCcVVXlQI/tOctmGm+tRFs9mGRwImMr5q25M0su
 MDdEl3yvJAyBlSAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0A5B13583;
 Mon,  9 Jan 2023 10:12:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WvhEJpzou2O3EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Jan 2023 10:12:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com
Subject: [PATCH 0/5] drm: Do not include <linux/fb.h> unnecessarily
Date: Mon,  9 Jan 2023 11:12:38 +0100
Message-Id: <20230109101243.26995-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements for <linux/fb.h>. I recently
changed this header and had to rebuild a good part of DRM. So avoid
this by removing the dependency.

Some source files require the OF or backlight headers. Include those
instead.

Thomas Zimmermann (5):
  drm: Include <linux/backlight.h> where needed
  drm: Don't include linux/fb.h in drm_crtc_helper.h
  drm/amdgpu: Do not include <linux/fb.h>
  drm/panel: Do not include <linux/fb.h>
  drm: Include <linux/of.h> in drm_modes.c

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c                     | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                      | 1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c            | 1 +
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c          | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c        | 1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c  | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c        | 1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c  | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c        | 1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c  | 1 -
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c          | 1 -
 drivers/gpu/drm/drm_modes.c                                  | 5 +++--
 drivers/gpu/drm/gma500/backlight.c                           | 2 ++
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c                | 1 -
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c        | 1 -
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c                 | 2 +-
 drivers/gpu/drm/radeon/radeon_acpi.c                         | 2 +-
 include/drm/drm_crtc_helper.h                                | 2 --
 18 files changed, 9 insertions(+), 18 deletions(-)


base-commit: ac04152253dccfb02dcedfa0c57443122cf79314
-- 
2.39.0

