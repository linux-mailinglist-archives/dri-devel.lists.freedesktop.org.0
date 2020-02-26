Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A31E16FD74
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 12:25:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E9E6E4FB;
	Wed, 26 Feb 2020 11:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13D6E4C9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 11:25:43 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C8F9DD53;
 Wed, 26 Feb 2020 12:25:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582716342;
 bh=TfSC1Q2+MZsj5WCyMVBGp+VxlKd0JJWFC53lEpvt4Gc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UqVFU1LfKQdQkTc9RUTRqYel8Z7M5o0qxEN/8hjVcdMttib2bMtvKkobzaf7JeZN0
 greEnndiyV28tIpUifQZkK7BNc/9KH2Ul1fDdtFaT6Numy2giihHT1VDqbxk1YE6hJ
 9cQZqxWWKGUNfml3eZJwm4j3M7j49OCpK9gepTIc=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 02/54] drm/connector: Add helper to get a connector type
 name
Date: Wed, 26 Feb 2020 13:24:22 +0200
Message-Id: <20200226112514.12455-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
References: <20200226112514.12455-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_connector.c contains a map of connector types (DRM_MODE_CONNECTOR_*)
to name strings, but doesn't expose it. This leads to drivers having to
store a similar map.

Add a new drm_get_connector_type_name() helper function that return a
name string for a connector type.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
 include/drm/drm_connector.h     |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index f632ca05960e..644f0ad10671 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -111,6 +111,21 @@ void drm_connector_ida_destroy(void)
 		ida_destroy(&drm_connector_enum_list[i].ida);
 }
 
+/**
+ * drm_get_connector_type_name - return a string for connector type
+ * @type: The connector type (DRM_MODE_CONNECTOR_*)
+ *
+ * Returns: the name of the connector type, or NULL if the type is not valid.
+ */
+const char *drm_get_connector_type_name(unsigned int type)
+{
+	if (type < ARRAY_SIZE(drm_connector_enum_list))
+		return drm_connector_enum_list[type].name;
+
+	return NULL;
+}
+EXPORT_SYMBOL(drm_get_connector_type_name);
+
 /**
  * drm_connector_get_cmdline_mode - reads the user's cmdline mode
  * @connector: connector to quwery
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b3815371c271..c3bd5262db9c 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1518,6 +1518,7 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
+const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
 const char *drm_get_dpms_name(int val);
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
