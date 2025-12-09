Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9901ACB0422
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 15:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912DA10E60C;
	Tue,  9 Dec 2025 14:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf214RaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF6210E617;
 Tue,  9 Dec 2025 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765290225; x=1796826225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3EdRJ/XgmWxVakw0kHUwh8VHZUh10J37p/jbxHAq9W8=;
 b=Hf214RaHLN1Us2S6HypR+hZ0kTYVlsZrnRQ+G8z/jdmSg4e6In42xmf/
 i/2TQx4ujLXMv4XluV4ljBhn81CfjqaKoQPifaq95rWR43I07bLju6GYn
 xET3M8wlNT/ksDbmTY+6/5AoYZEhdTqBcOs622lh2zYA4Y0l4l3yvy6a0
 zuiAQCCaXijEwpaPskhd0d5FpgYP6RJ/fQadxwebB9hf94vxR27z7CaTt
 WmqWJFGrzmF5pculZjc2yyodawHhD8U9xvyuXHf3TyPfFlrDPOPnpcUj5
 cAPnTbDIh06QMrFkmWomjjwCpS6mSFYeQpnMY3Z9eKt2UYtI2Eh4H/GN5 w==;
X-CSE-ConnectionGUID: In6hI+wYQa69mCpIN3bdlQ==
X-CSE-MsgGUID: 0Wp/n+SRTPiqlCc0y+a23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="78363121"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="78363121"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:44 -0800
X-CSE-ConnectionGUID: vD34hsCvRiOvJDkYUKpxCw==
X-CSE-MsgGUID: iwoAXzNiQ5SLoJbXXrfsBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="201160770"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.154])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 06:23:41 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH 4/7] drm/vblank: add return value to drm_crtc_wait_one_vblank()
Date: Tue,  9 Dec 2025 16:23:12 +0200
Message-ID: <7f2de4dd170771991756073f037c7ca043c3e746.1765290097.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1765290097.git.jani.nikula@intel.com>
References: <cover.1765290097.git.jani.nikula@intel.com>
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

