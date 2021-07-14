Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DF83C8A30
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BFD6E489;
	Wed, 14 Jul 2021 17:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32F26E47E;
 Wed, 14 Jul 2021 17:51:55 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id y6so2425537ilj.13;
 Wed, 14 Jul 2021 10:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m9OAXuNxJMui/zP7QESPga7N3Omxj1bpLUVNgTFlw9Y=;
 b=HZY/6TavueqA3Fwes5QMWRBiW4rv5BVP9HviYDe6l65oU3SfLJOluwLrCfAvJSulWZ
 GMETPE7RuG9XH6EVUCGBdEaFZ+VgzDKJgYa6ojKaT/K5xzVHt1GiAoDWrW10+/f3lAs/
 eJr/OOMtX37sSWyriNQtSmG30n+xPxGqvRiOSYegstyCXolxz8Z+qJa+6am/RqUW111n
 pkYTYXO1obd3a1178HE8mTb4cREgLWQ90EeW/nW22/wLcHEbketJKj4K/iyU7nP0rDtE
 6kUnIesgz58KYF/rLw1/zOOmCP6kbVMCl5T1wax0LVRBIDHtjguQFr/UsaX8PFP3Cr6V
 O0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m9OAXuNxJMui/zP7QESPga7N3Omxj1bpLUVNgTFlw9Y=;
 b=MSuvynGSvXli6/NE9zOJALOpEA+Nu7uyUdmuYsZrk/eZ6LP2axN7SdDASpQFSNbu3+
 J98fo9NihRsNYe1Pq6eaXhh6CVb56LcZGZb1C85I1sS/C1dfQXa3BOOUrDc9TPQn01ds
 boG2RyelQMVwQGSh3G+urZ5Q9PnMhTGprPRd4Wkk/ihI9ZePkIT+0gMMAWrOzq0a7xsS
 9Da9R9gvcuG7KkYfnv9lpWnwl/b3vG7P463pAWAbRkxpXOj7W1lMRP7QsK/Ed9Uznggj
 3h4phb7AvKbxp1E0foJ/V5wbj5tXdy0YKCIVrZxfaogzSNJVMrmRkMT+N6VCPG/MPuGm
 A84w==
X-Gm-Message-State: AOAM532ZzXlJeBjhs/GHZbEehwe2asLC1Z7KulhBs7ipY46d0V2+j/9X
 UcK+7+kQqI36Tow6ScdYHrs=
X-Google-Smtp-Source: ABdhPJw0ZZXwTis+s9iQiy0gKQ065aCuTpYvd/ghKU5cCYZYvQyrhSDUTI7migJzsQjl7Dd5QiiYiw==
X-Received: by 2002:a05:6e02:b4a:: with SMTP id
 f10mr7603460ilu.280.1626285115015; 
 Wed, 14 Jul 2021 10:51:55 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id b16sm706518ioh.5.2021.07.14.10.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:51:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 4/5] drm/print: move conditional deref into macro defn
Date: Wed, 14 Jul 2021 11:51:37 -0600
Message-Id: <20210714175138.319514-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714175138.319514-1-jim.cromie@gmail.com>
References: <20210714175138.319514-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 7911902129a8 ("drm/print: Handle potentially NULL drm_devices
in drm_dbg_*") added a maybe(deref) to 6 macro invocations of
drm_dev_dbg().

Commit 01ff672190bd("drm: RFC add choice to use dynamic debug in
drm-debug") then renamed that fn to _drm_dev_dbg(), and redefined
drm_dev_dbg() as a macro.

That new macro can do the maybe(deref), so the ~9 callers dont have to.

no functional changes. small word-count reduction.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 499fa0b35200..573b513e7836 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -326,8 +326,8 @@ enum drm_debug_category {
  */
 #define __drm_dbg(cls, fmt, ...)			\
 	___drm_dbg(cls, fmt, ##__VA_ARGS__)
-#define drm_dev_dbg(dev, cls, fmt, ...)			\
-	_drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(drm, cls, fmt, ...)			\
+	_drm_dev_dbg((drm) ? (drm)->dev : NULL, cls, fmt, ##__VA_ARGS__)
 
 #define cDRM_UT_CORE	DRM_UT_CORE
 #define cDRM_UT_DRIVER	DRM_UT_DRIVER
@@ -488,25 +488,25 @@ void _drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 
 #define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
 #define drm_dbg(drm, fmt, ...)						\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_VBL, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_STATE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DP, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_DP, fmt, ##__VA_ARGS__)
 #define drm_dbg_drmres(drm, fmt, ...)					\
-	drm_dev_dbg((drm) ? (drm)->dev : NULL, cDRM_UT_DRMRES, fmt, ##__VA_ARGS__)
+	drm_dev_dbg(drm, cDRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
 
 /*
@@ -578,8 +578,7 @@ void __drm_err(const char *format, ...);
 	const struct drm_device *drm_ = (drm);				\
 									\
 	if (drm_debug_enabled(DRM_UT) && __ratelimit(&rs_))		\
-		drm_dev_dbg((drm_) ? (drm_)->dev : NULL,		\
-			    cDRM_UT, fmt, ##__VA_ARGS__);		\
+		drm_dev_dbg(drm_, cDRM_UT, fmt, ##__VA_ARGS__);		\
 })
 
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
-- 
2.31.1

