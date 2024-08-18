Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5EB955C2A
	for <lists+dri-devel@lfdr.de>; Sun, 18 Aug 2024 12:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9F10E030;
	Sun, 18 Aug 2024 10:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="ZMB10MJH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F82410E021;
 Sun, 18 Aug 2024 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1723977821;
 bh=LIhDXO/vt61k9fDXb4us5vdCDXJKik9UE+Gw+d4EsFY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZMB10MJHVTsbEAgJsPd/WoBVbaAt6cEqCBm1JInvuDej99GJMxLVZIq+HAwJIQDSG
 bfSzFtp9SanQU1/JdSebwMsjIJqmJhhZm7tCXNPvBj47xLO9QdXwAXWi13qttLKRfM
 4W/OShkMj2gPHkFvi+bxvsQ/iWpNgSyGVT+E5KN4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 18 Aug 2024 12:43:27 +0200
Subject: [PATCH 03/12] drm/edid: constify argument of drm_edid_is_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240818-amdgpu-drm_edid-v1-3-aea66c1f7cf4@weissschuh.net>
References: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
In-Reply-To: <20240818-amdgpu-drm_edid-v1-0-aea66c1f7cf4@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723977820; l=1353;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=LIhDXO/vt61k9fDXb4us5vdCDXJKik9UE+Gw+d4EsFY=;
 b=1rBJN1vkIMxT+m2KRWFgnD882q/vGNU3J9DzDazmvd0Q9rpLOmUAECU5yqqlfUgOvLr9zcegN
 39k1x2tRzx4CntHpKLI1NRy/DB3fB+PBg4H37POxzpYGpXHM5Kx48TM
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

drm_edid_is_valid() does not modify its argument, so mark it as const.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 include/drm/drm_edid.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f68a41eeb1fa..69fb11741abd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2034,7 +2034,7 @@ EXPORT_SYMBOL(drm_edid_block_valid);
  *
  * Return: True if the EDID data is valid, false otherwise.
  */
-bool drm_edid_is_valid(struct edid *edid)
+bool drm_edid_is_valid(const struct edid *edid)
 {
 	int i;
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 6bdfa254a1c1..a5b377c4a342 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -442,7 +442,7 @@ int drm_add_modes_noedid(struct drm_connector *connector,
 int drm_edid_header_is_valid(const void *edid);
 bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 			  bool *edid_corrupt);
-bool drm_edid_is_valid(struct edid *edid);
+bool drm_edid_is_valid(const struct edid *edid);
 void drm_edid_get_monitor_name(const struct edid *edid, char *name,
 			       int buflen);
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,

-- 
2.46.0

