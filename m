Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E2ACAFA8
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2A010E2BA;
	Mon,  2 Jun 2025 13:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="hYHBiRgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DFC10E2BA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 13:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=nQnA2hQbzP8WZin9HMjdUuwpEMqqWDeL9smiJWMLtKA=; b=hYHBiRgMJWxNARrE
 4ZgnanHme8vG8gWXREVCKBrNOb/oWR8qwOzrow8d81Kx9wiDd9lVeBROGobDrj7I8KK88bbRi6SDQ
 GUZP8maM2kcVxQEPOZh4pbIi59/SxioyLbecHGGTNblwvQHPopooWrZC2fXyqtMMKIn5JSQRsCavH
 xfnV11hGGRL8qVjgGcq6zx8MF8tepFesdAPyNihtoHoHRanPhHbjg8id2qrBNFW3TFUUmInHBJ4PN
 lX9Lo7x7omBmUCdHkyCb7Gsz5a91JwqhXTC84OgQtLQun0vmYPahdxWbna5BWVhHQcGgeY6KEX+qv
 ESvG3cC5d+9ZBDW9sg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1uM5aB-007CLX-20;
 Mon, 02 Jun 2025 13:52:07 +0000
From: linux@treblig.org
To: dmitry.baryshkov@oss.qualcomm.com, lumag@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 3/3] Revert "drm/client: Add drm_client_modeset_check()"
Date: Mon,  2 Jun 2025 14:52:01 +0100
Message-ID: <20250602135201.207466-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602135201.207466-1-linux@treblig.org>
References: <20250602135201.207466-1-linux@treblig.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

This reverts commit 64593f2a6fc933bb9a410bc3f8c261f3e57a9601.

drm_client_modeset_check() was explicitly added in 2020 by
commit 64593f2a6fc9 ("drm/client: Add drm_client_modeset_check()")
but has never been used.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 35 ++++------------------------
 include/drm/drm_client.h             |  1 -
 2 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0f9d5ba36c81..b62f8f4553e5 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1028,7 +1028,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 }
 EXPORT_SYMBOL(drm_client_rotation);
 
-static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
+static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
 {
 	struct drm_device *dev = client->dev;
 	struct drm_plane *plane;
@@ -1095,10 +1095,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
 		}
 	}
 
-	if (check)
-		ret = drm_atomic_check_only(state);
-	else
-		ret = drm_atomic_commit(state);
+	ret = drm_atomic_commit(state);
 
 out_state:
 	if (ret == -EDEADLK)
@@ -1159,30 +1156,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
 	return ret;
 }
 
-/**
- * drm_client_modeset_check() - Check modeset configuration
- * @client: DRM client
- *
- * Check modeset configuration.
- *
- * Returns:
- * Zero on success or negative error code on failure.
- */
-int drm_client_modeset_check(struct drm_client_dev *client)
-{
-	int ret;
-
-	if (!drm_drv_uses_atomic_modeset(client->dev))
-		return 0;
-
-	mutex_lock(&client->modeset_mutex);
-	ret = drm_client_modeset_commit_atomic(client, true, true);
-	mutex_unlock(&client->modeset_mutex);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_client_modeset_check);
-
 /**
  * drm_client_modeset_commit_locked() - Force commit CRTC configuration
  * @client: DRM client
@@ -1201,7 +1174,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
 
 	mutex_lock(&client->modeset_mutex);
 	if (drm_drv_uses_atomic_modeset(dev))
-		ret = drm_client_modeset_commit_atomic(client, true, false);
+		ret = drm_client_modeset_commit_atomic(client, true);
 	else
 		ret = drm_client_modeset_commit_legacy(client);
 	mutex_unlock(&client->modeset_mutex);
@@ -1280,7 +1253,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 
 	mutex_lock(&client->modeset_mutex);
 	if (drm_drv_uses_atomic_modeset(dev))
-		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
+		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
 	else
 		drm_client_modeset_dpms_legacy(client, mode);
 	mutex_unlock(&client->modeset_mutex);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 146ca80e35db..4e3aa3c7f00b 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -216,7 +216,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
 void drm_client_modeset_free(struct drm_client_dev *client);
 int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
 bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
-int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
-- 
2.49.0

