Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386D28A6C29
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643E5112C83;
	Tue, 16 Apr 2024 13:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxW0+zY5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FC0112C83
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273812; x=1744809812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RZB0tOlpCYjyljswPyZbVq66p3GCBqf824wF8Y+BCjw=;
 b=IxW0+zY5y61bPeFgrWzTu4mJrrus64IT6q6cB1wRh7iUgRuWNSLf7ziq
 nFtCGDzK7vlzr7MLIY801Hpz00ejHfNQgOGvo+Adqwy4Vw/CLEM0PszWX
 V6KS1berquOHsvBSCIVPXK1d/GJwlH0Uq70EdHM/30DqESDd5ssiu4kqP
 g1rHumBKTmZfEt99UMKyR5+t4mgXFpC3233ann5MSAZhnoZFIDgtlRP/o
 TEgiSc7zCUxxdhpx6fSSFsmMWbLNXXuanYxEDAwjLF+MtLXz5l26KnBVO
 kOuG/WaaTy0A8DUq+ascmqIPMMPvazl4Y5M96f0Uh+ROnkYCQa1De6JWm Q==;
X-CSE-ConnectionGUID: eDITMoL4RKWCnjJPRbG7ZQ==
X-CSE-MsgGUID: 4h6X3fDSR2u6M8RxE3+RHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20131366"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="20131366"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:31 -0700
X-CSE-ConnectionGUID: V9TmDB/kREKuWnmuqOaqCg==
X-CSE-MsgGUID: zpQgh7s7Q8WnmcsUAz4Dow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27055414"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 virtualization@lists.linux.dev
Subject: [PATCH 11/15] drm/bochs: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:25 +0300
Message-Id: <281496d257f8efa830d1facaa260684001aa7158.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux.dev
---
 drivers/gpu/drm/tiny/bochs.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index c23c9f0cf49c..1ea3c4de07af 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -85,7 +85,7 @@ struct bochs_device {
 	u16 yres_virtual;
 	u32 stride;
 	u32 bpp;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	/* drm */
 	struct drm_device *dev;
@@ -199,10 +199,10 @@ static int bochs_hw_load_edid(struct bochs_device *bochs)
 	if (drm_edid_header_is_valid(header) != 8)
 		return -1;
 
-	kfree(bochs->edid);
-	bochs->edid = drm_do_get_edid(&bochs->connector,
-				      bochs_get_edid_block, bochs);
-	if (bochs->edid == NULL)
+	drm_edid_free(bochs->drm_edid);
+	bochs->drm_edid = drm_edid_read_custom(&bochs->connector,
+					       bochs_get_edid_block, bochs);
+	if (bochs->drm_edid == NULL)
 		return -1;
 
 	return 0;
@@ -303,7 +303,7 @@ static void bochs_hw_fini(struct drm_device *dev)
 	if (bochs->fb_map)
 		iounmap(bochs->fb_map);
 	pci_release_regions(to_pci_dev(dev->dev));
-	kfree(bochs->edid);
+	drm_edid_free(bochs->drm_edid);
 }
 
 static void bochs_hw_blank(struct bochs_device *bochs, bool blank)
@@ -471,12 +471,9 @@ static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
 
 static int bochs_connector_get_modes(struct drm_connector *connector)
 {
-	struct bochs_device *bochs =
-		container_of(connector, struct bochs_device, connector);
-	int count = 0;
+	int count;
 
-	if (bochs->edid)
-		count = drm_add_edid_modes(connector, bochs->edid);
+	count = drm_edid_connector_add_modes(connector);
 
 	if (!count) {
 		count = drm_add_modes_noedid(connector, 8192, 8192);
@@ -507,10 +504,10 @@ static void bochs_connector_init(struct drm_device *dev)
 	drm_connector_helper_add(connector, &bochs_connector_connector_helper_funcs);
 
 	bochs_hw_load_edid(bochs);
-	if (bochs->edid) {
+	if (bochs->drm_edid) {
 		DRM_INFO("Found EDID data blob.\n");
 		drm_connector_attach_edid_property(connector);
-		drm_connector_update_edid_property(connector, bochs->edid);
+		drm_edid_connector_update(&bochs->connector, bochs->drm_edid);
 	}
 }
 
-- 
2.39.2

