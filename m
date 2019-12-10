Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE2118807
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95636E8CA;
	Tue, 10 Dec 2019 12:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4498A6E8C8;
 Tue, 10 Dec 2019 12:31:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,299,1571727600"; d="scan'208";a="207266106"
Received: from orilivne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.68])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 04:31:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/client: convert to drm device based logging
Date: Tue, 10 Dec 2019 14:30:44 +0200
Message-Id: <20191210123050.8799-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer drm_dbg_kms() and drm_err() over DRM_DEV_DEBUG_KMS() and
DRM_DEV_ERROR().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_client.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index d9a2e3695525..b031b45aa8ef 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -150,7 +150,7 @@ void drm_client_release(struct drm_client_dev *client)
 {
 	struct drm_device *dev = client->dev;
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "%s\n", client->name);
+	drm_dbg_kms(dev, "%s\n", client->name);
 
 	drm_client_modeset_free(client);
 	drm_client_close(client);
@@ -203,7 +203,7 @@ void drm_client_dev_hotplug(struct drm_device *dev)
 			continue;
 
 		ret = client->funcs->hotplug(client);
-		DRM_DEV_DEBUG_KMS(dev->dev, "%s: ret=%d\n", client->name, ret);
+		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
 	}
 	mutex_unlock(&dev->clientlist_mutex);
 }
@@ -223,7 +223,7 @@ void drm_client_dev_restore(struct drm_device *dev)
 			continue;
 
 		ret = client->funcs->restore(client);
-		DRM_DEV_DEBUG_KMS(dev->dev, "%s: ret=%d\n", client->name, ret);
+		drm_dbg_kms(dev, "%s: ret=%d\n", client->name, ret);
 		if (!ret) /* The first one to return zero gets the privilege to restore */
 			break;
 	}
@@ -351,8 +351,8 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
 
 	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
 	if (ret)
-		DRM_DEV_ERROR(buffer->client->dev->dev,
-			      "Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
+		drm_err(buffer->client->dev,
+			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
 
 	buffer->fb = NULL;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
