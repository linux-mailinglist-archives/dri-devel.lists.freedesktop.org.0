Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8169CA75FE
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:28:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F418010EACE;
	Fri,  5 Dec 2025 11:28:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ld4VoTPF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C61410EACE;
 Fri,  5 Dec 2025 11:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934092; x=1796470092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EdRJ/XgmWxVakw0kHUwh8VHZUh10J37p/jbxHAq9W8=;
 b=ld4VoTPFFIk+xLo/06kKEwLR3/iVdyukQhXP22xvr6xv3CbZ30TzMNPJ
 5MqtYFRcKy/RyrywHezM5jMPF2KFpgzPe01ze2GXbF6nLs7Rt871vNyT4
 mqwBS20LQ6T0VIZ5jwClAsMiSmCDwwLtqE4e70DOhwnGLcje4FEg/LPsS
 1enZXnTF+QNEIeuK2LRFz0ZzPN1pGCCsONoNwbn5rSV1ZqPoppfHQUEXD
 jxMjnaO0mljhUWS4cCyi9ZmEKj+Z19jwyL/+Pa6d2hNzvTgwecfK+Rrjp
 hN7qiP2qmXyYiGr57dJQDhI5Mj85XvJ4ndUWALYbO0NWl21OAAIKFNrJM Q==;
X-CSE-ConnectionGUID: 5KY4fWNZTWeRf1Q8xyzOuA==
X-CSE-MsgGUID: MkhG2ILUTrmBcdYKw8OKiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65968453"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="65968453"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:11 -0800
X-CSE-ConnectionGUID: 7meDTWAaR6e+GSPoUFG+CQ==
X-CSE-MsgGUID: 2umq585YSD+jAVTjVNNdwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="232650347"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:28:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 04/25] drm/vblank: add return value to
 drm_crtc_wait_one_vblank()
Date: Fri,  5 Dec 2025 13:27:20 +0200
Message-ID: <b0cf87735c21d63cf9eab59bb2942d3c90fcaa53.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Let drivers deal with the vblank wait failures if they so desire. If the
current warning backtrace gets toned down to a simple warning message,
the drivers may wish to add the backtrace themselves.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 8 ++++++--
 include/drm/drm_vblank.h     | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index f4d1fe182a4d..503eb23d38d2 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1293,8 +1293,10 @@ EXPORT_SYMBOL(drm_crtc_vblank_put);
  * This waits for one vblank to pass on @crtc, using the irq driver interfaces.
  * It is a failure to call this when the vblank irq for @crtc is disabled, e.g.
  * due to lack of driver support or because the crtc is off.
+ *
+ * Returns: 0 on success, negative error on failures.
  */
-void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
+int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
 	int pipe = drm_crtc_index(crtc);
@@ -1305,7 +1307,7 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
-		return;
+		return ret;
 
 	last = drm_vblank_count(dev, pipe);
 
@@ -1316,6 +1318,8 @@ void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
 
 	drm_vblank_put(dev, pipe);
+
+	return ret ? 0 : -ETIMEDOUT;
 }
 EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
 
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 94ee09b48895..2fcef9c0f5b1 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -302,7 +302,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
-void drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
+int drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
 void drm_crtc_vblank_reset(struct drm_crtc *crtc);
 void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
-- 
2.47.3

