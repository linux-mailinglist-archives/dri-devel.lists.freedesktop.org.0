Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956A195BD90
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1578C10EBAF;
	Thu, 22 Aug 2024 17:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOQZdHr3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3551B10EBAF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 17:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348620; x=1755884620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zrx9ryuQ8NQaWrO1GMMki92G16n39eDhGDq+n7JgY2U=;
 b=mOQZdHr3SqOJC0sO+S7HDIXtm2IjSUMG5MYUmHbiYsO2vwBgW6TxbujT
 lBCVfXQLZMfERpS/stGE8eoWmyFztoFuxnjHuqz0PEheNX6nL7aVkuCEv
 1dX4sovl2HOq+30kod3X6s3+F1Q/Cz1z5rB4X+4XKsNO/h3d/wdxsBEdY
 Ue3TGF9Q+uEB9TfUdeTEDLeRWExzwveFDder1zF7jctOdBYUj6fOAY+OH
 mpxYopaq79ItSIMZ3HduYZ5ZidsQaicLtEyg2YlZDOkdX2TgosQG7WHe3
 vRhwl8oSeRbTwOPqWGm7xMTrVyuPQjLzvi+yMJP08QxSNv3dFVUO7/rX4 w==;
X-CSE-ConnectionGUID: k341QiutTFmM6VvjsvTNzQ==
X-CSE-MsgGUID: FlyUKcakToaJgsQiexeRxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22754436"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="22754436"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:40 -0700
X-CSE-ConnectionGUID: GRt7N+NmS5OqRSn7XsdLzw==
X-CSE-MsgGUID: FSYNb8oSQXK4LgGsPUZ/OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="66362984"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.121])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:43:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/6] drm/tiny/gm12u320: convert to struct drm_edid
Date: Thu, 22 Aug 2024 20:42:52 +0300
Message-Id: <c31c3afa883a3321345608c480c26161b638a83e.1724348429.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1724348429.git.jani.nikula@intel.com>
References: <cover.1724348429.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the struct drm_edid based functions for allocating the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tiny/gm12u320.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index e0defb1d134f..0bd7707c053e 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -464,7 +464,7 @@ static int gm12u320_set_ecomode(struct gm12u320_device *gm12u320)
  * Note this assumes this driver is only ever used with the Acer C120, if we
  * add support for other devices the vendor and model should be parameterized.
  */
-static struct edid gm12u320_edid = {
+static const struct edid gm12u320_edid = {
 	.header		= { 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 },
 	.mfg_id		= { 0x04, 0x72 },	/* "ACR" */
 	.prod_code	= { 0x20, 0xc1 },	/* C120h */
@@ -523,8 +523,15 @@ static struct edid gm12u320_edid = {
 
 static int gm12u320_conn_get_modes(struct drm_connector *connector)
 {
-	drm_connector_update_edid_property(connector, &gm12u320_edid);
-	return drm_add_edid_modes(connector, &gm12u320_edid);
+	const struct drm_edid *drm_edid;
+	int count;
+
+	drm_edid = drm_edid_alloc(&gm12u320_edid, sizeof(gm12u320_edid));
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
+
+	return count;
 }
 
 static const struct drm_connector_helper_funcs gm12u320_conn_helper_funcs = {
-- 
2.39.2

