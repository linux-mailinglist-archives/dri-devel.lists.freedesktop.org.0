Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 171739ABA12
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 01:29:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DEA10E331;
	Tue, 22 Oct 2024 23:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="RfgC+caG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3720410E704
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 23:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=ysbfho3bNM6XX4PTBUAzuKwO5RGewbfKhzT2qUY5ztM=; b=RfgC+caGgGJpt6vy
 PkRfcfdL7k4tJ3Q3em7z+fNuMhMkhDz8MbHODCpF6ij85AVp9uw5ZggVi9fADHBok93X0vXwrVj41
 3S3Qqnc9wfbzmh/G/SCUy0agyIofFviTM5aTPSrcFxWjcJ07vexqr9bk1oMpySOQg38vswnjpOzpe
 KhVP7KaN2HTdGHYipY7/cVdbMeFb61BN+q8NufVECjWXovSsfR6j4gHKT7mlQquLZ9tBCMmdO0qig
 cY2nATh7MB6OQ7yDtP73uljUWOcGPuV/kM4rvcYLQ7Q3ezfjAPrGLsVCDTpYknCQAifZBEkFYZTkE
 Xu2C+pdhSEhsByloUA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1t3OJo-00CtGr-3C;
 Tue, 22 Oct 2024 23:29:41 +0000
From: linux@treblig.org
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/5] drm/client: Remove unused drm_client_modeset_check
Date: Wed, 23 Oct 2024 00:29:34 +0100
Message-ID: <20241022232934.238124-6-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022232934.238124-1-linux@treblig.org>
References: <20241022232934.238124-1-linux@treblig.org>
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

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/drm_client_modeset.c | 24 ------------------------
 include/drm/drm_client.h             |  1 -
 2 files changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index cee5eafbfb81..69e1ce4d18cd 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1126,30 +1126,6 @@ static int drm_client_modeset_commit_legacy(struct drm_client_dev *client)
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
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 560aae47e06d..e1fd32adb3e9 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -176,7 +176,6 @@ int drm_client_modeset_create(struct drm_client_dev *client);
 void drm_client_modeset_free(struct drm_client_dev *client);
 int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width, unsigned int height);
 bool drm_client_rotation(struct drm_mode_set *modeset, unsigned int *rotation);
-int drm_client_modeset_check(struct drm_client_dev *client);
 int drm_client_modeset_commit_locked(struct drm_client_dev *client);
 int drm_client_modeset_commit(struct drm_client_dev *client);
 int drm_client_modeset_dpms(struct drm_client_dev *client, int mode);
-- 
2.47.0

