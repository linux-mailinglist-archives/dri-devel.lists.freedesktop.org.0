Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D8B119EB1
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 23:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A446E9D4;
	Tue, 10 Dec 2019 22:58:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5586E9D4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 22:58:06 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B23D112C;
 Tue, 10 Dec 2019 23:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576018684;
 bh=Z1nI/IrV5TKbGx58SP87pUwBGgcS9gTbbCIdxIBZ4C8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TRyaNTxARXgKa4zYVPn7FfzFTaE4Db32NOZIEyCitM9XCSoKDxovPu8ydE/Dj7540
 srVrAWrs+cSrgXYWxb2Uaap06dosXN2OYl5ULHGVYSi91burn26pLz0auEw8x7l94U
 hQFrRIfsaUn/STDpWbPGKeusCTy7HZb9jfOihoZQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 02/50] drm/connector: Add helper to get a connector type
 name
Date: Wed, 11 Dec 2019 00:57:02 +0200
Message-Id: <20191210225750.15709-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>
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
---
 drivers/gpu/drm/drm_connector.c | 15 +++++++++++++++
 include/drm/drm_connector.h     |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 2166000ed057..a21ee56c424e 100644
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
index 5f8c3389d46f..3deeba1f8163 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1504,6 +1504,7 @@ drm_connector_is_unregistered(struct drm_connector *connector)
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
