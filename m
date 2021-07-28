Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C83D84BB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 02:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402936EB5A;
	Wed, 28 Jul 2021 00:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D826EB4A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 00:32:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="209442028"
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="209442028"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,275,1620716400"; d="scan'208";a="634583478"
Received: from mamarti1-mobl.amr.corp.intel.com (HELO
 achrisan-desk3.intel.com) ([10.212.71.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:32:31 -0700
From: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
To: dri-devel@lists.freedesktop.org, anitha.chrisanthus@intel.com,
 edmund.j.dea@intel.com
Subject: [PATCH 11/14] drm/kmb: Prune display modes with CRTC vfp < 4
Date: Tue, 27 Jul 2021 17:31:23 -0700
Message-Id: <20210728003126.1425028-11-anitha.chrisanthus@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
References: <20210728003126.1425028-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
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

From: Edmund Dea <edmund.j.dea@intel.com>

Monitors with vfp < 4 are not supported in KMB display. This change
prunes display modes with vfp < 4.

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Edmund Dea <edmund.j.dea@intel.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 6 ++++++
 drivers/gpu/drm/kmb/kmb_drv.h  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index 42c8010ef2f6..0e42c40f0dce 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -191,6 +191,7 @@ static enum drm_mode_status
 {
 	int refresh;
 	struct drm_device *dev = crtc->dev;
+	int vfp = mode->vsync_start - mode->vdisplay;
 
 	if (mode->vdisplay < KMB_CRTC_MAX_HEIGHT) {
 		drm_dbg(dev, "height = %d less than %d",
@@ -209,6 +210,11 @@ static enum drm_mode_status
 		return MODE_BAD;
 	}
 
+	if (vfp < KMB_CRTC_MIN_VFP) {
+		drm_dbg(dev, "vfp = %d less than %d", vfp, KMB_CRTC_MIN_VFP);
+		return MODE_BAD;
+	}
+
 	return MODE_OK;
 }
 
diff --git a/drivers/gpu/drm/kmb/kmb_drv.h b/drivers/gpu/drm/kmb/kmb_drv.h
index dc0679a70cc5..c4af1d927e45 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.h
+++ b/drivers/gpu/drm/kmb/kmb_drv.h
@@ -21,6 +21,7 @@
 #define DRIVER_MINOR			2
 
 /* Platform definitions */
+#define KMB_CRTC_MIN_VFP		4
 #define KMB_CRTC_MAX_WIDTH		1920 /* max width in pixels */
 #define KMB_CRTC_MAX_HEIGHT		1080 /* max height in pixels */
 #define KMB_CRTC_MIN_WIDTH		1920
-- 
2.25.1

