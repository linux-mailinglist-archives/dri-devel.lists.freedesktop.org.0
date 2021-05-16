Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BADF381E9D
	for <lists+dri-devel@lfdr.de>; Sun, 16 May 2021 14:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A4789B01;
	Sun, 16 May 2021 12:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC9789C48;
 Sun, 16 May 2021 12:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82FECB127;
 Sun, 16 May 2021 12:13:17 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, alexander.deucher@amd.com, christian.koenig@amd.com,
 sakari.ailus@linux.intel.com
Subject: [PATCH 2/4] drm/simpledrm: Use %p4cc to print 4CC format
Date: Sun, 16 May 2021 14:13:13 +0200
Message-Id: <20210516121315.30321-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210516121315.30321-1-tzimmermann@suse.de>
References: <20210516121315.30321-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace use of struct drm_format_name_buf with %p4cc for printing
4CC formats.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index ed40dde4d218..2defd5cc6c99 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -466,7 +466,6 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 {
 	int width, height, stride;
 	const struct drm_format_info *format;
-	struct drm_format_name_buf buf;
 	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
 	const struct simplefb_platform_data *pd = dev_get_platdata(&pdev->dev);
@@ -510,9 +509,8 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
 	drm_dbg_kms(dev, "display mode={" DRM_MODE_FMT "}\n",
 		    DRM_MODE_ARG(&sdev->mode));
 	drm_dbg_kms(dev,
-		    "framebuffer format=\"%s\", size=%dx%d, stride=%d byte\n",
-		    drm_get_format_name(format->format, &buf), width,
-		    height, stride);
+		    "framebuffer format=%p4cc, size=%dx%d, stride=%d byte\n",
+		    &format->format, width, height, stride);
 
 	return 0;
 }
-- 
2.31.1

