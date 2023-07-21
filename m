Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A189075E0B0
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 11:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2710E004;
	Sun, 23 Jul 2023 09:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 414 seconds by postgrey-1.36 at gabe;
 Fri, 21 Jul 2023 10:23:43 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB11410E64E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 10:23:43 +0000 (UTC)
Received: from localhost.ispras.ru (unknown [10.10.165.9])
 by mail.ispras.ru (Postfix) with ESMTPSA id 1128940AE010;
 Fri, 21 Jul 2023 10:16:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1128940AE010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
 s=default; t=1689934605;
 bh=PHPNcQA/mlieAatBPZHyKEUg1u7Tlcm1+az9zlQDbY8=;
 h=From:To:Cc:Subject:Date:From;
 b=Z3wdixjAMd9W826oQ5ZAmSGo/4lDkslYNWkikcAg4mZdLItvN5NLoUWTxiBZFfvy1
 nhb/vpNqWUKZAAgrz+3p0pAObAE8DrE37IN7H+zaDDkBlc6ZNGX5pXop2AUPeQo3ZX
 9BvqC+gyILNsZn2iinXHztB9mHVFPBjGzqNUee8Q=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Subject: [PATCH] drm/crtc: do not release uninitialized connector reference
Date: Fri, 21 Jul 2023 13:15:59 +0300
Message-ID: <20230721101600.4392-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 23 Jul 2023 09:22:16 +0000
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
Cc: Daniel Stone <daniels@collabora.com>, Fedor Pchelkin <pchelkin@ispras.ru>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>, lvc-project@linuxtesting.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inside drm_mode_setcrtc() connector_set is allocated using kmalloc_array()
so its values are uninitialized. When filling this array with actual
pointers to drm connector objects, an error caused with invalid ioctl
request data may occur leading us to put references to already taken
objects. However, the last elements of the array are left uninitialized
which makes drm_connector_put() to be called with an invalid argument.

We can obviously just initialize the array with kcalloc() but the current
fix chose a slightly different way.

The index of failing array element is known so just put references to the
array members with lower indices.

The temporary 'connector' pointer seems to be redundant as we can directly
fill the connector_set elements and thus avoid unnecessary NULL
assignments and checks.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Fixes: b164d31f50b2 ("drm/modes: add connector reference counting. (v2)")
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---
 drivers/gpu/drm/drm_crtc.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..2a29c3cf12de 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -709,7 +709,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	struct drm_mode_crtc *crtc_req = data;
 	struct drm_crtc *crtc;
 	struct drm_plane *plane;
-	struct drm_connector **connector_set = NULL, *connector;
+	struct drm_connector **connector_set = NULL;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_display_mode *mode = NULL;
 	struct drm_mode_set set;
@@ -852,25 +852,22 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		}
 
 		for (i = 0; i < crtc_req->count_connectors; i++) {
-			connector_set[i] = NULL;
 			set_connectors_ptr = (uint32_t __user *)(unsigned long)crtc_req->set_connectors_ptr;
 			if (get_user(out_id, &set_connectors_ptr[i])) {
 				ret = -EFAULT;
 				goto out;
 			}
 
-			connector = drm_connector_lookup(dev, file_priv, out_id);
-			if (!connector) {
+			connector_set[i] = drm_connector_lookup(dev, file_priv, out_id);
+			if (!connector_set[i]) {
 				DRM_DEBUG_KMS("Connector id %d unknown\n",
 						out_id);
 				ret = -ENOENT;
 				goto out;
 			}
 			DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-					connector->base.id,
-					connector->name);
-
-			connector_set[i] = connector;
+					connector_set[i]->base.id,
+					connector_set[i]->name);
 		}
 	}
 
@@ -891,12 +888,9 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	if (fb)
 		drm_framebuffer_put(fb);
 
-	if (connector_set) {
-		for (i = 0; i < crtc_req->count_connectors; i++) {
-			if (connector_set[i])
-				drm_connector_put(connector_set[i]);
-		}
-	}
+	if (connector_set)
+		while (--i >= 0)
+			drm_connector_put(connector_set[i]);
 	kfree(connector_set);
 	drm_mode_destroy(dev, mode);
 
-- 
2.41.0

