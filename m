Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0435F52E9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 12:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC8D10E46C;
	Wed,  5 Oct 2022 10:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D8910E0BB;
 Wed,  5 Oct 2022 10:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664967116; x=1696503116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pLHDWkvab6hfcOSp1Zqa4G44jjkF9mDxkZroGNIaDC8=;
 b=G1YDPZeZR1ZKeXvMl28gcp9d/Hp3YSPnyT8/+mSBLvkd/zx0OQNY/bSK
 G56wJw7RxF10vU8VpzcaPqH+WS+tguOJUmOZYXYlD+6MSLkicUcmdKpTE
 Q1QoquKA/0pDvYHLbWY/BX788bNxI++c05X0Xsh5+yK3x/vps1dA7BeP+
 CEE+bet7IXbwB/xuJFnMrAZT6dcE1F+yzNmymZidvdjteZoU4XjNt5FdL
 pIIj2PFJBN5lgkh+y/LmVgebCpDZjIZrN5qEkMlFbIsIJI3b8bFQBwOdN
 jWKMUSlZrFm0fbbh1aIHiKo/xCfh9GEF/sa4pStCYDroa1KrqUMY/gC9y Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="367247800"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="367247800"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 03:51:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="766691436"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="766691436"
Received: from gionescu-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.39.173])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 03:51:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 1/2] drm/connector: add connector list iteration with filtering
Date: Wed,  5 Oct 2022 13:51:43 +0300
Message-Id: <8d92019b6ae730d6dc019e03fbc103645a2cf203.1664966047.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1664966047.git.jani.nikula@intel.com>
References: <cover.1664966047.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new function drm_connector_list_iter_filter_begin() to initialize
connector list iterator with a filter function. Subsequent iteration on
the list will only return connectors on which the filter function
returns true.

Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 57 ++++++++++++++++++++++++++-------
 include/drm/drm_connector.h     |  9 ++++++
 2 files changed, 54 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3142c8142b3..d54b4b54cecb 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -762,6 +762,29 @@ static struct lockdep_map connector_list_iter_dep_map = {
 };
 #endif
 
+/**
+ * drm_connector_list_iter_filter_begin - initialize a connector_list iterator with filter
+ * @dev: DRM device
+ * @iter: connector_list iterator
+ * @filter: connector filter function
+ * @filter_context: context to be passed to the filter function
+ *
+ * Same as drm_connector_list_iter_begin(), but sets up the iterator to only
+ * return connectors where filter(connector) returns true.
+ */
+void drm_connector_list_iter_filter_begin(struct drm_device *dev,
+					  struct drm_connector_list_iter *iter,
+					  drm_connector_list_iter_filter_fn filter,
+					  void *filter_context)
+{
+	iter->dev = dev;
+	iter->conn = NULL;
+	iter->filter = filter;
+	iter->filter_context = filter_context;
+	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL, _RET_IP_);
+}
+EXPORT_SYMBOL(drm_connector_list_iter_filter_begin);
+
 /**
  * drm_connector_list_iter_begin - initialize a connector_list iterator
  * @dev: DRM device
@@ -775,9 +798,7 @@ static struct lockdep_map connector_list_iter_dep_map = {
 void drm_connector_list_iter_begin(struct drm_device *dev,
 				   struct drm_connector_list_iter *iter)
 {
-	iter->dev = dev;
-	iter->conn = NULL;
-	lock_acquire_shared_recursive(&connector_list_iter_dep_map, 0, 1, NULL, _RET_IP_);
+	drm_connector_list_iter_filter_begin(dev, iter, NULL, NULL);
 }
 EXPORT_SYMBOL(drm_connector_list_iter_begin);
 
@@ -800,15 +821,8 @@ __drm_connector_put_safe(struct drm_connector *conn)
 	schedule_work(&config->connector_free_work);
 }
 
-/**
- * drm_connector_list_iter_next - return next connector
- * @iter: connector_list iterator
- *
- * Returns: the next connector for @iter, or NULL when the list walk has
- * completed.
- */
-struct drm_connector *
-drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
+static struct drm_connector *
+__drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
 {
 	struct drm_connector *old_conn = iter->conn;
 	struct drm_mode_config *config = &iter->dev->mode_config;
@@ -836,6 +850,25 @@ drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
 
 	return iter->conn;
 }
+
+/**
+ * drm_connector_list_iter_next - return next connector
+ * @iter: connector_list iterator
+ *
+ * Returns: the next connector for @iter, or NULL when the list walk has
+ * completed.
+ */
+struct drm_connector *
+drm_connector_list_iter_next(struct drm_connector_list_iter *iter)
+{
+	struct drm_connector *connector;
+
+	while ((connector = __drm_connector_list_iter_next(iter)) &&
+	       iter->filter && !iter->filter(connector, iter->filter_context))
+		;
+
+	return connector;
+}
 EXPORT_SYMBOL(drm_connector_list_iter_next);
 
 /**
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 56aee949c6fa..497b98197d3a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1868,6 +1868,9 @@ struct drm_tile_group *drm_mode_get_tile_group(struct drm_device *dev,
 void drm_mode_put_tile_group(struct drm_device *dev,
 			     struct drm_tile_group *tg);
 
+typedef bool (*drm_connector_list_iter_filter_fn)(const struct drm_connector *connector,
+						  void *filter_context);
+
 /**
  * struct drm_connector_list_iter - connector_list iterator
  *
@@ -1886,10 +1889,16 @@ struct drm_connector_list_iter {
 /* private: */
 	struct drm_device *dev;
 	struct drm_connector *conn;
+	drm_connector_list_iter_filter_fn filter;
+	void *filter_context;
 };
 
 void drm_connector_list_iter_begin(struct drm_device *dev,
 				   struct drm_connector_list_iter *iter);
+void drm_connector_list_iter_filter_begin(struct drm_device *dev,
+					  struct drm_connector_list_iter *iter,
+					  drm_connector_list_iter_filter_fn filter,
+					  void *filter_context);
 struct drm_connector *
 drm_connector_list_iter_next(struct drm_connector_list_iter *iter);
 void drm_connector_list_iter_end(struct drm_connector_list_iter *iter);
-- 
2.34.1

