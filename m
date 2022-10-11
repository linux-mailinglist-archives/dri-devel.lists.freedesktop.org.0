Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120A15FB3D8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C0A10E81B;
	Tue, 11 Oct 2022 13:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7011D10E817;
 Tue, 11 Oct 2022 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496260; x=1697032260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PvXW9jIs7EEZ+quW1RHf2OUBExDrAfv7DjyWk3Zatjs=;
 b=ivwyQ7MrQzz6nWsOtFljeQNMBi9n05/+vABiCiov8j+YdyLCYo38enm5
 RTbrBriObV+7UuWAb2Wwfmep+AQ4ZAuJwBZUxpKQYSpia8nwsbrxfxbRB
 X9f/yQrwgCTvkGAjGzBoOLUFY/lfuPFfPk89BKQ0jbC3ldsOeUl3E/2y/
 M26RAQLV33BoqQZI2ouCmbx+CfrqPrd0UGWgNYrPgs0pzpVLirlcNAr0j
 NQJb6qUZqtwTdxvPDnvC8RNvFSE9EDq8iLtmfIvsonsAXXUPKEfs501Tr
 00NxNRPYqxgqWwr5Z3/GIxuFasmJHRIx9/Orj72gewcx/mokeH+PcpdCy w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="306130301"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="306130301"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="626364092"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="626364092"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/15] drm/edid/firmware: convert to drm device specific
 logging
Date: Tue, 11 Oct 2022 16:49:48 +0300
Message-Id: <2305a76e064f6ffc0794406472a5ebd0630e5702.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Conform to device specific logging.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid_load.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index 882caaa6e663..dd472c66cb3c 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -177,16 +177,18 @@ static const struct drm_edid *edid_load(struct drm_connector *connector, const c
 
 		pdev = platform_device_register_simple(connector->name, -1, NULL, 0);
 		if (IS_ERR(pdev)) {
-			DRM_ERROR("Failed to register EDID firmware platform device "
-				  "for connector \"%s\"\n", connector->name);
+			drm_err(connector->dev,
+				"Failed to register EDID firmware platform device for connector \"%s\"\n",
+				connector->name);
 			return ERR_CAST(pdev);
 		}
 
 		err = request_firmware(&fw, name, &pdev->dev);
 		platform_device_unregister(pdev);
 		if (err) {
-			DRM_ERROR("Requesting EDID firmware \"%s\" failed (err=%d)\n",
-				  name, err);
+			drm_err(connector->dev,
+				"Requesting EDID firmware \"%s\" failed (err=%d)\n",
+				name, err);
 			return ERR_PTR(err);
 		}
 
-- 
2.34.1

