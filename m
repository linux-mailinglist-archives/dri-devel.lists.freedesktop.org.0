Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA73147742
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4DB6FED0;
	Fri, 24 Jan 2020 03:55:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5194B6FECB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:09 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F410B60;
 Fri, 24 Jan 2020 04:55:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838106;
 bh=Of8a7VMXLFqDd2WilRYxs4zOQjiLl7bHOU8EZCEEBcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XmYQI29Zt+NGmjE3PldodxwsIWtagSlpWjAO5ME6dGisUOjmEMHe50b7WUmu60k2R
 kAICtSj/N7o77iHsC8j5HiMgAiNiYdx+ITw+sqz/NsRhHiWNSxagRAOx1Qv4FoCAbA
 ov72LyaR7muYC+RgoUmJwFbl+HILK6tuqBQx1hR4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 02/52] drm/connector: Add helper to get a connector type
 name
Date: Fri, 24 Jan 2020 05:53:55 +0200
Message-Id: <20200124035445.1830-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
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
index 221910948b37..fd8099c22682 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1512,6 +1512,7 @@ drm_connector_is_unregistered(struct drm_connector *connector)
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
