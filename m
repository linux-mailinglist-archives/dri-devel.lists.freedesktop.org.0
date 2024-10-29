Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F779B576A
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 00:47:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2092410E3CA;
	Tue, 29 Oct 2024 23:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="o8Sc7Anr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F89110E3D3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 23:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=l9Jf67sY6k0pV20eW1NfvPqXo0KO+KBOFwOnCVfaRwQ=; b=o8Sc7AnrwtH8h7zE
 G7FZD45i/SWuj4e1pGJ0VEJo1lcCJROSiXg7t9MLy1jLSVnq/cxAIcXbhd7TsBFGNJgOekQ5xO3tr
 XvV5TVvrQ51v0O+SiO52bh1THhy7JtiWf2aElhq58/JJjK4TvbBCHq7ZHNnh1dtXsLXwIpdOSZv/q
 4nBsvruKgBcjSP9GerIRDwbIdvdpUD+k7/aixtMSoKWGQsxJv4mqM7jLAOGyGXrOhGIC+9uh5KaSR
 oGkFx/RWbdixm9neswWpfQxg/Z53EW3X5tRuLE/f6TMKk7jY/frEePFfhcOafTFfCxSWoQzrjIbgQ
 0Dq/tGja2+BjU5jE2w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t5vvb-00EMNX-08;
 Tue, 29 Oct 2024 23:47:11 +0000
From: linux@treblig.org
To: dmitry.baryshkov@linaro.org, ville.syrjala@linux.intel.com,
 jfalempe@redhat.com, tomi.valkeinen@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 3/3] Revert "drm/client: Add drm_client_modeset_check()"
Date: Tue, 29 Oct 2024 23:47:05 +0000
Message-ID: <20241029234706.285087-4-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029234706.285087-1-linux@treblig.org>
References: <20241029234706.285087-1-linux@treblig.org>
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

drm_client_modeset_check() was explicitly added in 2020 by
commit 64593f2a6fc9 ("drm/client: Add drm_client_modeset_check()")
but has never been used.

This reverts commit 64593f2a6fc933bb9a410bc3f8c261f3e57a9601.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 35 ++++------------------------
 include/drm/drm_client.h             |  1 -
 2 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index cee5eafbfb81..39201c11eaac 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -995,7 +995,7 @@ bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation)
 }
 EXPORT_SYMBOL(drm_client_rotation);
 
-static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active, bool check)
+static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool active)
 {
 	struct drm_device *dev = client->dev;
 	struct drm_plane *plane;
@@ -1062,10 +1062,7 @@ static int drm_client_modeset_commit_atomic(struct drm_client_dev *client, bool
 		}
 	}
 
-	if (check)
-		ret = drm_atomic_check_only(state);
-	else
-		ret = drm_atomic_commit(state);
+	ret = drm_atomic_commit(state);
 
 out_state:
 	if (ret == -EDEADLK)
@@ -1126,30 +1123,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
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
@@ -1168,7 +1141,7 @@ int drm_client_modeset_commit_locked(struct drm_client_dev *client)
 
 	mutex_lock(&client->modeset_mutex);
 	if (drm_drv_uses_atomic_modeset(dev))
-		ret = drm_client_modeset_commit_atomic(client, true, false);
+		ret = drm_client_modeset_commit_atomic(client, true);
 	else
 		ret = drm_client_modeset_commit_legacy(client);
 	mutex_unlock(&client->modeset_mutex);
@@ -1246,7 +1219,7 @@ int drm_client_modeset_dpms(struct drm_client_dev *client, int mode)
 
 	mutex_lock(&client->modeset_mutex);
 	if (drm_drv_uses_atomic_modeset(dev))
-		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON, false);
+		ret = drm_client_modeset_commit_atomic(client, mode == DRM_MODE_DPMS_ON);
 	else
 		drm_client_modeset_dpms_legacy(client, mode);
 	mutex_unlock(&client->modeset_mutex);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index bc0e66f9c425..ead3c3526ee3 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -177,7 +177,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
 void drm_client_modeset_free(struct drm_client_dev *client);
 int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
 bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
-int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
-- 
2.47.0

