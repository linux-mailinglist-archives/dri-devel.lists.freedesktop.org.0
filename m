Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48777124154
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BA56E262;
	Wed, 18 Dec 2019 08:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136FC6E9EE
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:07:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 06:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="212583235"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2019 06:07:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 51FE112A; Tue, 17 Dec 2019 16:07:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of drm_panel_of_backlight()
 one more time
Date: Tue, 17 Dec 2019 16:07:21 +0200
Message-Id: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:03 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The initial commit followed by the fix didn't take into consideration the case

CONFIG_DRM_PANEL=y
CONFIG_BACKLIGHT_CLASS_DEVICE=m
CONFIG_DRM_I915=y

where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.

Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/drm_panel.c | 2 +-
 include/drm/drm_panel.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 79ff3fdf6f6e..8c7bac85a793 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -302,7 +302,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 EXPORT_SYMBOL(of_drm_find_panel);
 #endif
 
-#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
 /**
  * drm_panel_of_backlight - use backlight device node for backlight
  * @panel: DRM panel
diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
index 5f27b693e1a0..121f7aabccd1 100644
--- a/include/drm/drm_panel.h
+++ b/include/drm/drm_panel.h
@@ -198,7 +198,7 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
 }
 #endif
 
-#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
+#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
 int drm_panel_of_backlight(struct drm_panel *panel);
 #else
 static inline int drm_panel_of_backlight(struct drm_panel *panel)
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
