Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6990B1FF323
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 15:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599C86E443;
	Thu, 18 Jun 2020 13:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5C6E443
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 13:34:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E1204AFF7;
 Thu, 18 Jun 2020 13:34:41 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org, kraxel@redhat.com,
 emil.velikov@collabora.com
Subject: [PATCH] drm/mgag200: Enable caching for SHMEM pages
Date: Thu, 18 Jun 2020 15:34:35 +0200
Message-Id: <20200618133435.25425-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: John Donnelly <john.p.donnelly@Oracle.com>,
 Rong Chen <rong.a.chen@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We've had reports about performance regressions after switching
mgag200 from VRAM helpers to SHMEM helpers. SHMEM pages use
writecombine caching by default, but can also use the platform's
default page caching. Doing so improves the performance of I/O
on the framebuffer.

Mgag200's hardware does not access framebuffer pages directly (i.e.,
via DMA), so enabling caching does not have an effect on consistency
of the framebuffer memory or the displayed data.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 913ec479bb5c ("drm/mgag200: Replace VRAM helpers with SHMEM helpers")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Rong Chen <rong.a.chen@intel.com>
Cc: John Donnelly <john.p.donnelly@Oracle.com>
Link: https://lore.kernel.org/dri-devel/20200617092252.GA5279@shao2-debian/
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index e19660f4a637..7189c7745baf 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -36,6 +36,7 @@ static struct drm_driver mgag200_driver = {
 	.major = DRIVER_MAJOR,
 	.minor = DRIVER_MINOR,
 	.patchlevel = DRIVER_PATCHLEVEL,
+	.gem_create_object = drm_gem_shmem_create_object_cached,
 	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
