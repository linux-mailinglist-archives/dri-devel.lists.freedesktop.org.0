Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65C2822AFA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0681910E2A0;
	Wed,  3 Jan 2024 10:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39A810E2A0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276630; x=1735812630;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0Q5yfJHvMZWQCnsiByOXKTr+qtbniF3CKdf+7QwVuuY=;
 b=NWPaxfwu/GS90XDohBSo/FCOnPt8oGJ18vOSv6mIeWibKhn/CQZhxLJA
 XMeTLg+mO11XHvHwfhu5gQk+66Q4r3Nsff+hhm5fxhuWNpc2glIf4tmYq
 HDHi6Rm0T4Mss1kq90QUT/TKmWSKLS/9046xVz2iwYC/1lYsmQ6CBA8Fz
 zdJPLrNMX5i4lwyz8HU6K77X54V8g01a9gErYXV7TTqmXFsGzGaPRi/3s
 9AjDjbBUSA5CNFvQPF5CffknFjBS+pRu12psFLb5zkCyvDWZpN+2SJZh2
 UvX7CoDFhDV9eUeU+dj+kbswwZ5CTI9KZzKw3OzR2n986VFsaohD/ZzCa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721085"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721085"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="903398455"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="903398455"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 13/39] drm/bridge: remove drm_bridge_get_edid() in favour
 of drm_bridge_edid_read()
Date: Wed,  3 Jan 2024 12:08:27 +0200
Message-Id: <b481f9e993367e6a7017e29a9e8912e2bb448fed.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All users of drm_bridge_get_edid() have been converted to use
drm_bridge_edid_read(). Remove drm_bridge_get_edid().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_bridge.c | 28 ++--------------------------
 include/drm/drm_bridge.h     |  2 --
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 4f6f8c662d3f..a3065d4aa3d6 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1217,7 +1217,7 @@ EXPORT_SYMBOL_GPL(drm_bridge_get_modes);
  * the EDID and return it. Otherwise return NULL.
  *
  * If &drm_bridge_funcs.edid_read is not set, fall back to using
- * drm_bridge_get_edid() and wrapping it in struct drm_edid.
+ * &drm_bridge_funcs.get_edid and wrapping it in struct drm_edid.
  *
  * RETURNS:
  * The retrieved EDID on success, or NULL otherwise.
@@ -1233,7 +1233,7 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 		const struct drm_edid *drm_edid;
 		struct edid *edid;
 
-		edid = drm_bridge_get_edid(bridge, connector);
+		edid = bridge->funcs->get_edid(bridge, connector);
 		if (!edid)
 			return NULL;
 
@@ -1248,30 +1248,6 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 }
 EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
 
-/**
- * drm_bridge_get_edid - get the EDID data of the connected display
- * @bridge: bridge control structure
- * @connector: the connector to read EDID for
- *
- * If the bridge supports output EDID retrieval, as reported by the
- * DRM_BRIDGE_OP_EDID bridge ops flag, call &drm_bridge_funcs.get_edid to
- * get the EDID and return it. Otherwise return NULL.
- *
- * Deprecated. Prefer using drm_bridge_edid_read().
- *
- * RETURNS:
- * The retrieved EDID on success, or NULL otherwise.
- */
-struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
-				 struct drm_connector *connector)
-{
-	if (!(bridge->ops & DRM_BRIDGE_OP_EDID))
-		return NULL;
-
-	return bridge->funcs->get_edid(bridge, connector);
-}
-EXPORT_SYMBOL_GPL(drm_bridge_get_edid);
-
 /**
  * drm_bridge_hpd_enable - enable hot plug detection for the bridge
  * @bridge: bridge control structure
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index b7aed3ead705..ee12f829aaf7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -921,8 +921,6 @@ int drm_bridge_get_modes(struct drm_bridge *bridge,
 			 struct drm_connector *connector);
 const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
-struct edid *drm_bridge_get_edid(struct drm_bridge *bridge,
-				 struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
 				      enum drm_connector_status status),
-- 
2.39.2

