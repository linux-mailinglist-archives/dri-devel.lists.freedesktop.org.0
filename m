Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910C665BFE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB6A10E730;
	Wed, 11 Jan 2023 13:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B305710E722;
 Wed, 11 Jan 2023 13:02:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE23533CF9;
 Wed, 11 Jan 2023 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673442129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9oONkZEyJ8J1igj9qEL4QXWADQTc/UpGLwdCjKydhiI=;
 b=SxbwuRLAwQP/DDVJ73sd4y+muqp0PPVq2BWxYvwvQEhuJ4TuvMicxDI7Iqbjg6aLROy6i1
 Wt/WB5pRB/Oco6106z1hl//ciMmnDaJZHCVjiYyiXnkGrvh1VR1Cz+x4ZI2SV0QC0F2sc4
 vmNUunaVOU+rWl8fbmaKeM/IdRBch2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673442129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9oONkZEyJ8J1igj9qEL4QXWADQTc/UpGLwdCjKydhiI=;
 b=7bhxGerCDupCwiCadeIWtrzhmusamjozhJJGD2w0eb+ilfqwITpr2ALUPZJn4iGTSgjola
 oRKoTsNtaRQneDAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C4CA13591;
 Wed, 11 Jan 2023 13:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gDw/JVGzvmMaXAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:02:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Subject: [PATCH v2 00/10] drm: Do not include <linux/fb.h> unnecessarily
Date: Wed, 11 Jan 2023 14:01:56 +0100
Message-Id: <20230111130206.29974-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unnecessary include statements for <linux/fb.h>. I recently
changed this header and had to rebuild a good part of DRM. So avoid
this by removing the dependency.

Several files include <linux/fb.h> via drm_fb_helper.h. So in v2 I
added additional patches that remove some of those include statements
as well.

Some source files require the OF or backlight headers. Include those
instead.

v2:
	* add more patches to handle drm_fb_helper.h includes
	* fix komeda build (kernel test robot)

Thomas Zimmermann (10):
  drm: Include <linux/backlight.h> where needed
  drm: Include <linux/of.h> where needed
  drm: Don't include <linux/fb.h> in drm_crtc_helper.h
  drm/amdgpu: Do not include <linux/fb.h>
  drm/panel: Do not include <linux/fb.h>
  drm: Define enum mode_set_atomic in drm_modeset_helper_tables.h
  drm/amdgpu: Do not include <drm/drm_fb_helper.h>
  drm/nouveau: Do not include <drm/drm_fb_helper.h>
  drm/radeon: Remove trailing whitespaces
  drm/radeon: Do not include <drm/drm_fb_helper.h>

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c                    | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                     | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c                      | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c                      | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c                       | 1 -
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c                       | 1 -
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 1 +
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu7_hwmgr.c         | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c       | 1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_processpptables.c | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_hwmgr.c       | 1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c | 1 -
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega20_hwmgr.c       | 1 -
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega20_processpptables.c | 1 -
 drivers/gpu/drm/amd/pm/powerplay/smumgr/ci_smumgr.c         | 1 -
 drivers/gpu/drm/arm/display/komeda/komeda_drv.c             | 1 +
 drivers/gpu/drm/drm_modes.c                                 | 5 +++--
 drivers/gpu/drm/gma500/backlight.c                          | 2 ++
 drivers/gpu/drm/nouveau/dispnv04/crtc.c                     | 1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c                       | 1 -
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c               | 1 -
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c       | 1 -
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c                | 2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c                      | 1 -
 drivers/gpu/drm/radeon/radeon_acpi.c                        | 2 +-
 drivers/gpu/drm/radeon/radeon_connectors.c                  | 1 -
 drivers/gpu/drm/radeon/radeon_drv.c                         | 1 -
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c                 | 3 +--
 include/drm/drm_crtc_helper.h                               | 2 --
 include/drm/drm_fb_helper.h                                 | 5 -----
 include/drm/drm_modeset_helper_vtables.h                    | 6 +++++-
 31 files changed, 16 insertions(+), 35 deletions(-)


base-commit: ac04152253dccfb02dcedfa0c57443122cf79314
-- 
2.39.0

