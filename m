Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAF6A43221
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 01:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE3D10E0C4;
	Tue, 25 Feb 2025 00:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="hvTKWSPw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFFB10E0C4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 00:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=OAHHgv0L+tOtR4u+k11uGAQYtSpCSi3f0RqAKr/DkRI=; b=hvTKWSPwPE5q7AYa
 8bKYG5N1T65B2gD+f0QOTee104qZutU9BRaFM7vpYADmbRtKu9H8rq7V2eMnDJ5ziGNah1Xzz45jv
 opBt7YsreyCj+9OtPbUdbZ0xWhQrW7tf1vxGoONZXitK4xrN7giD8u13OhDsUMhSaWbRHvZoHp1h9
 ZMmVbzhKWHPmWE3J3qRntAUao+jq3CmEpJt76yKCxLxBxOARpGifJEAgKJAMbRKXHKrMpXjyENjFG
 Di+xjZt/HhD3v5O2izEwFHr1xOKviLf1oLVJvqu7MxQc8Ritx4aafxqMc63L90WRcOixvWaiM08Ou
 G8Lho/3TNp05TIDOQA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tmjFF-000YZX-13;
 Tue, 25 Feb 2025 00:56:21 +0000
From: linux@treblig.org
To: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/omap: Remove unused omapdss_find_device_by_node
Date: Tue, 25 Feb 2025 00:56:20 +0000
Message-ID: <20250225005620.88667-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

The last use of omapdss_find_device_by_node() was removed by 2020's
commit 811860ddceac ("drm/omap: drop unused DSS next pointer")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/omapdrm/dss/base.c    | 12 ------------
 drivers/gpu/drm/omapdrm/dss/omapdss.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/base.c b/drivers/gpu/drm/omapdrm/dss/base.c
index a4ac113e1690..f8be1399a79c 100644
--- a/drivers/gpu/drm/omapdrm/dss/base.c
+++ b/drivers/gpu/drm/omapdrm/dss/base.c
@@ -73,18 +73,6 @@ void omapdss_device_put(struct omap_dss_device *dssdev)
 	put_device(dssdev->dev);
 }
 
-struct omap_dss_device *omapdss_find_device_by_node(struct device_node *node)
-{
-	struct omap_dss_device *dssdev;
-
-	list_for_each_entry(dssdev, &omapdss_devices_list, list) {
-		if (dssdev->dev->of_node == node)
-			return omapdss_device_get(dssdev);
-	}
-
-	return NULL;
-}
-
 /*
  * Search for the next output device starting at @from. Release the reference to
  * the @from device, and acquire a reference to the returned device if found.
diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss.h b/drivers/gpu/drm/omapdrm/dss/omapdss.h
index 4c22c09c93d5..95897a1b711b 100644
--- a/drivers/gpu/drm/omapdrm/dss/omapdss.h
+++ b/drivers/gpu/drm/omapdrm/dss/omapdss.h
@@ -240,7 +240,6 @@ void omapdss_device_register(struct omap_dss_device *dssdev);
 void omapdss_device_unregister(struct omap_dss_device *dssdev);
 struct omap_dss_device *omapdss_device_get(struct omap_dss_device *dssdev);
 void omapdss_device_put(struct omap_dss_device *dssdev);
-struct omap_dss_device *omapdss_find_device_by_node(struct device_node *node);
 int omapdss_device_connect(struct dss_device *dss,
 			   struct omap_dss_device *dst);
 void omapdss_device_disconnect(struct dss_device *dss,
-- 
2.48.1

