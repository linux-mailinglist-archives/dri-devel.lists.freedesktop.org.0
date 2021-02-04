Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867130F257
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 12:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1B66E03D;
	Thu,  4 Feb 2021 11:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCF06E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 11:37:56 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id sa23so4830666ejb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 03:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DDb6Ld176HsxEp/NIJ6/4wTialpYbPckqUtodHtlMks=;
 b=leKWTs9YeL4kaMLRl170hdryZmQ3Ru6j0cQ8ZQ12SHUnDGmNZzVNHMFHGLdO2Nr5ko
 SxJeACiVKp97oD3zIaW8O6lB433ukZRH/jzoaIxY9YW70kUYvzTs2ohtdGe06AQLdgUM
 HzFP4AfsPz0URMVFAap7DVceOV6vcs/NF4jOyJ+DNYtShlfFTvH+0A3U6we7Y+UQRsah
 MXMfkn1wrhzfGRe+4DYEVi4Ci9dC/9O5gGjrukCMXlW0BbUf5y556jUE4PSMn/sx1Roj
 o6vPmRgdj+qS54OUgV4MNdiU2OTF85whcB6Ti+EXY5gNLWq5rbbZpxQMDhigk/3P0mFN
 cjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DDb6Ld176HsxEp/NIJ6/4wTialpYbPckqUtodHtlMks=;
 b=okAN29abX2BwEEqX1CSa1X/nDRlXrN4lmer0Zxu1+Qy3JN6DjsqODFcUF44wl7OOpc
 pmJL/GLbUeYgwwmTKgeBeDpGFT/6Bi+WyF+Kjiz6NsYZFrgJJDMI08MCFPpXeqtRRUnV
 3AwMMAUocfVKOyCru1+0Er/fu/XUKVRNG6DP7r+FFKGMQyb1pcE31Hm3UPFB/kKoE4i3
 zZ0iVLqWMvuhskFJI8F6PfTf0guc88Dt3eZzyFyV65j8FzMbywLOKXaGiJPfeNQ3eaCq
 7TelqKegxDqOieYtpSf+wKavUEwZRNFyIIelpsvidsq05z5hQQ7gLG7k5l+TyTEanpSr
 CeAQ==
X-Gm-Message-State: AOAM5319m5pV0+b42/Ia2o9F+u/qKKuqHZFcS3k6BzOCLf5qAx0QsGnu
 qRIhVRc3a9fe51KnIIpTEYHa29bi8vEimA==
X-Google-Smtp-Source: ABdhPJwFcmDrEaEfbPxDXv2Fy90vfzctJo2BH/yrwXMw/yY/h/onOzMBlakoIiWHFjNuo1QRlfYFew==
X-Received: by 2002:a17:906:4e0c:: with SMTP id
 z12mr7431402eju.370.1612438674670; 
 Thu, 04 Feb 2021 03:37:54 -0800 (PST)
Received: from arch-x1c3.. ([2a00:5f00:102:0:542a:42e9:ace2:c1d0])
 by smtp.gmail.com with ESMTPSA id f22sm2353088eje.34.2021.02.04.03.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:37:53 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/fourcc: introduce DRM_FOURCC_STANDALONE guard
Date: Thu,  4 Feb 2021 11:37:42 +0000
Message-Id: <20210204113742.1814456-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>, emil.l.velikov@gmail.com,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, the drm_fourcc.h header depends on drm.h for __u32 and __u64.
At the same time drm.h pulls a lot of unneeded symbols.

Add new guard DRM_FOURCC_STANDALONE, which when set will use local
declaration of said symbols.

When used on linux - we pull linux/types.h which is used either way.
On other platforms, BSDs et al, we need a couple of typedefs.

Since those can trigger a warning in some corner-cases*, add some GCC
magic to silence them. Note that incorrect type redefinitions will still
be flagged, and the GCC pragma is ignored by other compilers.

*Corner-case:
If one sets DRM_FOURCC_STANDALONE and compiles with C99 or earlier while
also using -pedantic _and_ the header lives outside of the standard
/usr/include (like BSDs normally do).

v2:
 - Add corner-case handling, based on popular demand.

Cc: James Park <james.park@lagfreegames.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 include/uapi/drm/drm.h        | 10 ++++++++++
 include/uapi/drm/drm_fourcc.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..cd78950e05ce 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -53,6 +53,15 @@ typedef unsigned int drm_handle_t;
 #include <stdint.h>
 #include <sys/ioccom.h>
 #include <sys/types.h>
+
+/*
+ * When using C99 -pedantic the typedefs will trigger a warning.
+ * If the header is considered a system one (-isystem) those will be
+ * ignored, yet on the target platforms BSDs, et al - the headers live
+ * in a non-system location.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wpedantic"
 typedef int8_t   __s8;
 typedef uint8_t  __u8;
 typedef int16_t  __s16;
@@ -63,6 +72,7 @@ typedef int64_t  __s64;
 typedef uint64_t __u64;
 typedef size_t   __kernel_size_t;
 typedef unsigned long drm_handle_t;
+#pragma GCC diagnostic pop
 
 #endif
 
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 6f0628eb13a6..84a1f96cc4ef 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -24,7 +24,36 @@
 #ifndef DRM_FOURCC_H
 #define DRM_FOURCC_H
 
+/*
+ * Define DRM_FOURCC_STANDALONE you're interested only FOURCC and do not want
+ * to pull drm.h into your application.
+ */
+#ifdef DRM_FOURCC_STANDALONE
+#if defined(__linux__)
+
+#include <linux/types.h>
+
+#else /* One of the BSDs */
+
+#include <stdint.h>
+
+/*
+ * When using C99 -pedantic the typedefs will trigger a warning.
+ * If the header is considered a system one (-isystem) those will be
+ * ignored, yet on the target platforms BSDs, et al - the headers live
+ * in a non-system location.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wpedantic"
+typedef uint32_t __u32;
+typedef uint64_t __u64;
+#pragma GCC diagnostic pop
+
+#endif /* __linux __ */
+
+#else
 #include "drm.h"
+#endif /* DRM_FOURCC_STANDALONE */
 
 #if defined(__cplusplus)
 extern "C" {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
