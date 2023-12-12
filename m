Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5D80EE26
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 14:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C2C10E600;
	Tue, 12 Dec 2023 13:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE4210E5C2;
 Tue, 12 Dec 2023 13:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702389265; x=1733925265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tSqPSorFmXo+w01WoQeLqUBWdzdqBRyMP4YT34m1xKw=;
 b=e0t7xQbdOqkUevawndWp1PjcmTfnCNN1gcuy2TEoFpKFJbXteMyrG4Hx
 3nu3OUk1l3s2FWHl+NPibyCA1I+L5M/7QzwAcf7e0LwJBV64+aZlbHZAT
 HD16NfQorT7gTOCStltdIYN89qCBLwZDgxbFE/KfJfPyj+BLMbFSgAeJR
 2LXZ5TSdVSJTcfZMEmoQRzC51s9ra3lQLSv2nGQNt9ANlns8ICxF1/cK0
 THxa0zU3atIJ2VQhTDcykvEgA/LytzBnug7Fzh48JuMrQiqOwTqL8f7DF
 HiVSwbV7N8mNK/65gIJr7fjAAmh8qiR8I5RwxdC9vEaIY+7N8soJsaaLZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="397595312"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="397595312"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:54:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749737461"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="749737461"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 05:54:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: include drm/drm_edid.h only where needed
Date: Tue, 12 Dec 2023 15:54:18 +0200
Message-Id: <20231212135418.3816792-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
files when drm_edid.h is modified, while there are only a few files that
actually need to include drm_edid.h.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 1 +
 drivers/gpu/drm/nouveau/nouveau_connector.h | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 5f490fbf1877..83355dbc15ee 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -32,6 +32,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
 #include <drm/drm_vblank.h>
 #include "nouveau_connector.h"
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index a2df4918340c..0608cabed058 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -35,7 +35,6 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_util.h>
 
@@ -44,6 +43,7 @@
 
 struct nvkm_i2c_port;
 struct dcb_output;
+struct edid;
 
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 struct nouveau_backlight {
-- 
2.39.2

