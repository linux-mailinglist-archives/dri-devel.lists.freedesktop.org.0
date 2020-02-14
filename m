Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54D15F0C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 18:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24AA6E853;
	Fri, 14 Feb 2020 17:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14D556E853
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 17:59:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0040780477;
 Fri, 14 Feb 2020 18:59:20 +0100 (CET)
Date: Fri, 14 Feb 2020 18:59:19 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: drm/print: clean up RATELIMITED macros
Message-ID: <20200214175919.GA14492@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8
 a=sqZNHU-3SF4bKGkxWHMA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From 6fdc9c030ba88e6d0d8abc319f3dfe83751d5900 Mon Sep 17 00:00:00 2001
From: Sam Ravnborg <sam@ravnborg.org>
Date: Fri, 14 Feb 2020 18:54:42 +0100
Subject: [PATCH v1 1/1] drm/print: clean up RATELIMITED macros

Drop a few indirections, making the code simpler.
This also drops a RATELIMITED variant that is not in use.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
---
 include/drm/drm_print.h | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index fd6ba2532f50..ca7cee8e728a 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -383,25 +383,6 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
 	drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
 
-#define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
-({									\
-	static DEFINE_RATELIMIT_STATE(_rs,				\
-				      DEFAULT_RATELIMIT_INTERVAL,	\
-				      DEFAULT_RATELIMIT_BURST);		\
-	if (__ratelimit(&_rs))						\
-		drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
-})
-
-/**
- * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
- *
- * @dev: device pointer
- * @fmt: printf() like format string.
- */
-#define DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)			\
-	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_KMS,		\
-					  fmt, ##__VA_ARGS__)
-
 /*
  * struct drm_device based logging
  *
@@ -525,7 +506,13 @@ void __drm_err(const char *format, ...);
 
 
 #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
-	DRM_DEV_DEBUG_KMS_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
+({									\
+	static DEFINE_RATELIMIT_STATE(_rs,				\
+				      DEFAULT_RATELIMIT_INTERVAL,       \
+				      DEFAULT_RATELIMIT_BURST);         \
+	if (__ratelimit(&_rs))						\
+		drm_dev_dbg(NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__);	\
+})
 
 /*
  * struct drm_device based WARNs
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
