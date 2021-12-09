Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7553446F668
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760F510E396;
	Thu,  9 Dec 2021 22:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82F310E396
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 22:03:06 +0000 (UTC)
Received: from ubuntu-CJ.sitez.s.ibrowse.com ([146.0.31.27])
 by smtp.orange.fr with ESMTPA
 id vRVGmeNDKMNzvvRVHmHIOZ; Thu, 09 Dec 2021 23:03:04 +0100
X-ME-Helo: ubuntu-CJ.sitez.s.ibrowse.com
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 09 Dec 2021 23:03:04 +0100
X-ME-IP: 146.0.31.27
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Remove some useless memset
Date: Thu,  9 Dec 2021 23:03:00 +0100
Message-Id: <bdde4a5fd5337deb84b7d9e530e7bc83ef17ebec.1639087275.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'bufs' is an array embedded in an structure (struct drm_device_dma) which
is kzalloc just a few lines above.
So there is no need to explicitly memset each element on the array. It is
already cleared.

Remove the useless memset.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/drm_dma.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
index eb6b741a6f99..df4837dc5030 100644
--- a/drivers/gpu/drm/drm_dma.c
+++ b/drivers/gpu/drm/drm_dma.c
@@ -51,8 +51,6 @@
  */
 int drm_legacy_dma_setup(struct drm_device *dev)
 {
-	int i;
-
 	if (!drm_core_check_feature(dev, DRIVER_HAVE_DMA) ||
 	    !drm_core_check_feature(dev, DRIVER_LEGACY))
 		return 0;
@@ -64,9 +62,6 @@ int drm_legacy_dma_setup(struct drm_device *dev)
 	if (!dev->dma)
 		return -ENOMEM;
 
-	for (i = 0; i <= DRM_MAX_ORDER; i++)
-		memset(&dev->dma->bufs[i], 0, sizeof(dev->dma->bufs[0]));
-
 	return 0;
 }
 
-- 
2.32.0

