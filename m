Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887985544A8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 10:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8EF10F58D;
	Wed, 22 Jun 2022 08:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A39610EF49
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 08:34:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D881F1FAFD;
 Wed, 22 Jun 2022 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655886854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=O1EOyoPBau9TPG/tVZpTYxGahQsskO0hXdQhQeaV5ZI=;
 b=1kKI8CIouoYNcAsmKhFEPHTiHTc35Pgsbv2AwOxKjg2kYZxS3dqdHBIqk05LAqEqqxMNzV
 fAz9GtRquUOjc4/HpiZ3BObBLPqdQCWMF/sLaA7tZp6Egw1p9sfeLm41zknuJl5rx7HJvP
 MN8zfd6PNdyGYOV6ZF2a34FO3BlhGkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655886854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=O1EOyoPBau9TPG/tVZpTYxGahQsskO0hXdQhQeaV5ZI=;
 b=F9hRTr2toRP77B+V7zp51+ilujZVnD4qUBoSIEyoLokkg8Z35pgLer5jFa3VUDZBALY0Ye
 JrYKpI/kDjAgFUDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A05C6134A9;
 Wed, 22 Jun 2022 08:34:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dCEvJgbUsmIPDAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Jun 2022 08:34:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: drawat.floss@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/hyperv-drm: Include framebuffer and EDID headers
Date: Wed, 22 Jun 2022 10:34:13 +0200
Message-Id: <20220622083413.12573-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a number of compile errors by including the correct header
files. Examples are shown below.

  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vram_rect':
  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of undefined type 'struct drm_framebuffer'
   25 |         struct hyperv_drm_device *hv = to_hv(fb->dev);
      |                                                ^~

  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_connector_get_modes':
  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:59:17: error: implicit declaration of function 'drm_add_modes_noedid' [-Werror=implicit-function-declaration]
   59 |         count = drm_add_modes_noedid(connector,
      |                 ^~~~~~~~~~~~~~~~~~~~

  ../drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:62:9: error: implicit declaration of function 'drm_set_preferred_mode'; did you mean 'drm_mm_reserve_node'? [-Werror=implicit-function-declaration]
   62 |         drm_set_preferred_mode(connector, hv->preferred_width,
      |         ^~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic video device")
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: linux-hyperv@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
---
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 27f4fcb058f9..b8e64dd8d3a6 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -7,9 +7,11 @@
 
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_gem_shmem_helper.h>
-- 
2.36.1

