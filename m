Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9339D6E538D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 23:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C3510E5EB;
	Mon, 17 Apr 2023 21:03:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D43710E5EB;
 Mon, 17 Apr 2023 21:03:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B746B62A2E;
 Mon, 17 Apr 2023 21:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8945AC433D2;
 Mon, 17 Apr 2023 21:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681765415;
 bh=gogdJk9IwdJmU/4O0CfzvIr5faBCNTXnnyqgTDbDnEQ=;
 h=From:To:Cc:Subject:Date:From;
 b=L9k78zW6bp/+0gKaf+zI2V7sM8f5vbcCdNMSIaG/vw1yKpclaAd+swwvkijbpGXii
 kMWNDQpqC2yeyoNdzrhwiNufp/TJf27oWWk/GJCqC877ocah9+oPqRS2bHY4ePf4UC
 r/dNyfPcNreSohJYevJwIGjl6VqyMsKF9GeGriPZ7tHrguHk9WXRM0WPhchY6LYEPK
 a3gf2KBQ+Qhn9t3hjNNF2+im/rx0X4IfXIXzn+Ze1Sw6/NUxPU2Wo7WXLooCujjjJ6
 1uoGRqF+Cai/AxwIvgULiCfJiCPFt4EcEzFjgGXvvJWHG07l3KZCORSYKAmnO7CCie
 7SLuaedzsZ5Lg==
From: Arnd Bergmann <arnd@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/nouveau: dispnv50: fix missing-prototypes warning
Date: Mon, 17 Apr 2023 23:03:23 +0200
Message-Id: <20230417210329.2469722-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

nv50_display_create() is declared in another header, along with
a couple of declarations that are now outdated:

drivers/gpu/drm/nouveau/dispnv50/disp.c:2517:1: error: no previous prototype for 'nv50_display_create'

Fixes: ba801ef068c1 ("drm/nouveau/kms: display destroy/init/fini hooks can be static")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 1 +
 drivers/gpu/drm/nouveau/nv50_display.h  | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 5bb777ff1313..9b6824f6b9e4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -64,6 +64,7 @@
 #include "nouveau_connector.h"
 #include "nouveau_encoder.h"
 #include "nouveau_fence.h"
+#include "nv50_display.h"
 
 #include <subdev/bios/dp.h>
 
diff --git a/drivers/gpu/drm/nouveau/nv50_display.h b/drivers/gpu/drm/nouveau/nv50_display.h
index fbd3b15583bc..60f77766766e 100644
--- a/drivers/gpu/drm/nouveau/nv50_display.h
+++ b/drivers/gpu/drm/nouveau/nv50_display.h
@@ -31,7 +31,5 @@
 #include "nouveau_reg.h"
 
 int  nv50_display_create(struct drm_device *);
-void nv50_display_destroy(struct drm_device *);
-int  nv50_display_init(struct drm_device *);
-void nv50_display_fini(struct drm_device *);
+
 #endif /* __NV50_DISPLAY_H__ */
-- 
2.39.2

