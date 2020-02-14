Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D565115D9D9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 15:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F9D6F958;
	Fri, 14 Feb 2020 14:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B123F6F958
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 14:54:54 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 50BD680472;
 Fri, 14 Feb 2020 15:54:50 +0100 (CET)
Date: Fri, 14 Feb 2020 15:54:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/print: Delete a few unused shouting macros
Message-ID: <20200214145449.GA25310@ravnborg.org>
References: <20200214090428.2929833-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214090428.2929833-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=7gkXJVJtAAAA:8 a=sqZNHU-3SF4bKGkxWHMA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Fri, Feb 14, 2020 at 10:04:28AM +0100, Daniel Vetter wrote:
> We want to go over to the new lowercase ones, encourage that a bit
> more.
Thanks for doing this, one item less on my TODO list now.

> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 21 +++++++++++++++++++++
Ups...

>  include/drm/drm_print.h       | 26 --------------------------
This part is:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


Could you squash in this patch too?
Is simplifies the RATELIMITED stuff and limit it to what is used.

I can send a separate patch for this if you prefer.

	Sam


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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
