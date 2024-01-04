Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0DB824977
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 21:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD8110E52A;
	Thu,  4 Jan 2024 20:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F6710E528;
 Thu,  4 Jan 2024 20:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704399402; x=1735935402;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iCiR11dc21Je8OO+gWFpIf72HFFFNP8Kiuq0KCAT0DQ=;
 b=CvgdOpATAqH3QuWTNXRVqp8SRbKmAPxrU7L+Cf4ncU0olgiUTtP11jM/
 zl7WPafZnqeXFnSyYFQ2++k4C5BNYG5/n15FEn2mVNyxMrKJcH3iKi111
 P/ZOHPGDn4IhWuofcVzxuHU79XLZ6NH6QEhEOaBkDx8Kk2fCKCl8Y70A9
 igrZSMZwWekxGzmXtVXrrPg5ZlTpq5y15FN6F+jjineBW6lfDaaKmaKYS
 wDBqxNROx1qogysAXluMIFw5RrseZrUt9B399ys0duCBAV5nDnxetq2/j
 BnFPIowRSpLb2rCR+aZvmV5WKxBmdDY5kx0gFJL5QB3PgI6LuB2RHW2kY A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="15976672"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="15976672"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 12:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871037866"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="871037866"
Received: from pdelarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 12:16:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/nouveau: include drm/drm_edid.h only where needed
Date: Thu,  4 Jan 2024 22:16:30 +0200
Message-Id: <20240104201632.1100753-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Danilo Krummrich <dakr@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Including drm_edid.h from nouveau_connector.h causes the rebuild of 15
files when drm_edid.h is modified, while there are only a few files that
actually need to include drm_edid.h.

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
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

