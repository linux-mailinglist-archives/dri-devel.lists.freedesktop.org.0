Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488116D517C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 21:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD63F10E2E8;
	Mon,  3 Apr 2023 19:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16CF10E176
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 19:41:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id y14so30548657wrq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Apr 2023 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=froggi.es; s=google; t=1680550876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oU+L5nIaiDPDPyp7C6mhI8cKJn6SnKYd8OI0WaI/OCc=;
 b=hrkjpiLs2p89GoYvmMQvTNwCnAlkV+809xMgqK+qRerqH20me7sRj0tdKFBLmPa1Yt
 CwmwP5YjbavaNpn7EiMwwkj+8UN6tG7ns4x5a4Ghw/7oH7CrB5dTliV8uwhl1Sga1/1o
 0MF8J3DbDFjCFqsZNNIwS1ZDeRq9X41WtIr41rz0ZSMBK45EFJxiSdLMbMCZz64de/DB
 k+a1N8iuegfqqngvIH3tGZjEjP5TUkQ645/FCk9zpJgSny+DWikIY/wYdQZJTFwPGLY5
 TXfI5YTMxotKOdsZ67RVCD82zShFgosrpP0e7K9PF1uKnyNirBpZHmgRJvroyOBCPdU4
 TYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680550876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oU+L5nIaiDPDPyp7C6mhI8cKJn6SnKYd8OI0WaI/OCc=;
 b=e3vD3r27OwBaYi3ZKYlAopTJ9e2ZHWxX+4rk4skOM5DTBySz1bI+yUc7YeZkPps272
 fuZEGN9aSM0dOASGX5dwuFe1DJJ3PTm78HfDFuLnWw6bd2rOoOqxyuO+y+4vovXkcEb6
 7SL2/3kOOI3ZhECcyA5kGsTuGwZYppiEmUcawJ6AAuZtms++My8STkwv1qrn2Yi3CwxJ
 f09eUCQUnmiX8RkD5T0OitrSUPouuls2V6erXf7fHO3IQEzrcoMazczVyiHY4g7Q6SeV
 PA31xSwZBo1xIaNRscLrBaX1jf0AKeTyi9YEUS4rU9Lw06WpRV0Zw54a5z2ZbAVT+H4Z
 2TBw==
X-Gm-Message-State: AAQBX9cpRLjV6M0AWGkFNckYlOKXW/6nEXIUtdGR64pkF2ZkW1asczc8
 4qiXykmoX630DdokX8cwfdU2qvpPr/AnUQWLPxE=
X-Google-Smtp-Source: AKy350Y6QcVh3jMCJP1CeIEoEigMyHei8BCcc6GYjm2rfJ9DP96MlxtUrUdIv9DDl/8lZGk89hJDxQ==
X-Received: by 2002:a5d:458f:0:b0:2ce:a703:1937 with SMTP id
 p15-20020a5d458f000000b002cea7031937mr26791351wrq.50.1680550875792; 
 Mon, 03 Apr 2023 12:41:15 -0700 (PDT)
Received: from localhost.localdomain
 (darl-09-b2-v4wan-165404-cust288.vm5.cable.virginm.net. [86.17.61.33])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a7bcb11000000b003ef5db16176sm13036342wmj.32.2023.04.03.12.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 12:41:15 -0700 (PDT)
From: Joshua Ashton <joshua@froggi.es>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH 2/4] drm/scheduler: Split out drm_sched_priority to own
 file
Date: Mon,  3 Apr 2023 20:40:56 +0100
Message-Id: <20230403194058.25958-3-joshua@froggi.es>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403194058.25958-1-joshua@froggi.es>
References: <20230403194058.25958-1-joshua@froggi.es>
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
Cc: Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows it to be used by other parts of the codebase without fear
of a circular include dependency being introduced.

Signed-off-by: Joshua Ashton <joshua@froggi.es>
---
 include/drm/drm_sched_priority.h | 41 ++++++++++++++++++++++++++++++++
 include/drm/gpu_scheduler.h      | 15 +-----------
 2 files changed, 42 insertions(+), 14 deletions(-)
 create mode 100644 include/drm/drm_sched_priority.h

diff --git a/include/drm/drm_sched_priority.h b/include/drm/drm_sched_priority.h
new file mode 100644
index 000000000000..85a7bb011e27
--- /dev/null
+++ b/include/drm/drm_sched_priority.h
@@ -0,0 +1,41 @@
+/*
+ * Copyright 2015 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ */
+
+#ifndef _DRM_SCHED_PRIORITY_H_
+#define _DRM_SCHED_PRIORITY_H_
+
+/* These are often used as an (initial) index
+ * to an array, and as such should start at 0.
+ */
+enum drm_sched_priority {
+	DRM_SCHED_PRIORITY_MIN,
+	DRM_SCHED_PRIORITY_NORMAL,
+	DRM_SCHED_PRIORITY_HIGH,
+	DRM_SCHED_PRIORITY_VERY_HIGH,
+	DRM_SCHED_PRIORITY_KERNEL,
+
+	DRM_SCHED_PRIORITY_COUNT,
+	DRM_SCHED_PRIORITY_UNSET = -2
+};
+
+#endif
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index a62071660602..9228ff0d515e 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -29,6 +29,7 @@
 #include <linux/completion.h>
 #include <linux/xarray.h>
 #include <linux/workqueue.h>
+#include <drm/drm_sched_priority.h>
 
 #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
 
@@ -48,20 +49,6 @@ struct drm_gem_object;
 struct drm_gpu_scheduler;
 struct drm_sched_rq;
 
-/* These are often used as an (initial) index
- * to an array, and as such should start at 0.
- */
-enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_MIN,
-	DRM_SCHED_PRIORITY_NORMAL,
-	DRM_SCHED_PRIORITY_HIGH,
-	DRM_SCHED_PRIORITY_VERY_HIGH,
-	DRM_SCHED_PRIORITY_KERNEL,
-
-	DRM_SCHED_PRIORITY_COUNT,
-	DRM_SCHED_PRIORITY_UNSET = -2
-};
-
 /* Used to chose between FIFO and RR jobs scheduling */
 extern int drm_sched_policy;
 
-- 
2.40.0

