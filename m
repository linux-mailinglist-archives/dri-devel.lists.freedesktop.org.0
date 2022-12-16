Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6AA64EE64
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92CDC10E5F7;
	Fri, 16 Dec 2022 16:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1015B10E5F0;
 Fri, 16 Dec 2022 16:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671206486; x=1702742486;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=840+c9wg4WWV+yrNbR2stuoJO+WcGVDyxP8K+zuTk+w=;
 b=RYnaAQV9auHd1UFBsspiNaJqC0qdOJ7khjOFvp3AH2kusZAHjMF1ZbFb
 ZOHuH0+Bdgh5jG79+v6j2LEkHYzGmUj5cYvtAPnHXlMq8xKO7AJa6bxtu
 DUjj5P8JmeSHZ85YK457nD46349aDABOf/xViy4SIXT+dj4EgXsw1TpvB
 X8/Z3XAaCTQdUx/egWnQ4RAKnA8Zi6JbSz4FdaJ856tHDvhMxC942TGqt
 9CIzZvf1pjr6u17GbuT0StjTU5q2FJfDy8MhyfSd6J1EBX/HwahqNE1Q1
 hIBZNB+Se+wv36K6r69DeSWeFTX04zJ7f0KZ7tsaPz2rmBX6FAg3ifPDq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="346076512"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="346076512"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="713301075"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; d="scan'208";a="713301075"
Received: from fbielich-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.62.38])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2022 08:01:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/12] drm/edid: remove redundant
 _drm_connector_update_edid_property()
Date: Fri, 16 Dec 2022 18:00:22 +0200
Message-Id: <5139a511cde3662baf6943d2945d842569175332.1671206131.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671206131.git.jani.nikula@intel.com>
References: <cover.1671206131.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Realize that drm_edid_connector_update() and
_drm_connector_update_edid_property() are now the same thing. Drop the
latter.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8bbd4662468e..fc276f377c2e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6722,24 +6722,6 @@ int drm_edid_connector_add_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_edid_connector_add_modes);
 
-static int _drm_connector_update_edid_property(struct drm_connector *connector,
-					       const struct drm_edid *drm_edid)
-{
-	/*
-	 * Set the display info, using edid if available, otherwise resetting
-	 * the values to defaults. This duplicates the work done in
-	 * drm_add_edid_modes, but that function is not consistently called
-	 * before this one in all drivers and the computation is cheap enough
-	 * that it seems better to duplicate it rather than attempt to ensure
-	 * some arbitrary ordering of calls.
-	 */
-	update_display_info(connector, drm_edid);
-
-	_drm_update_tile_info(connector, drm_edid);
-
-	return _drm_edid_connector_property_update(connector, drm_edid);
-}
-
 /**
  * drm_connector_update_edid_property - update the edid property of a connector
  * @connector: drm connector
@@ -6761,8 +6743,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 {
 	struct drm_edid drm_edid;
 
-	return _drm_connector_update_edid_property(connector,
-						   drm_edid_legacy_init(&drm_edid, edid));
+	return drm_edid_connector_update(connector, drm_edid_legacy_init(&drm_edid, edid));
 }
 EXPORT_SYMBOL(drm_connector_update_edid_property);
 
-- 
2.34.1

