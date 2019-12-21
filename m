Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A174512886B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632946E1E0;
	Sat, 21 Dec 2019 09:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B976E431
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j26so12470492ljc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OVQ/28tbLBbbJHmoAL63ZaoS8Vr4XCpJtvfNALNn8PU=;
 b=ADqvu1rDwix9tI+1hiviZOWAJP7jCjpZlwVhARzkoWSjvdy3Ki+AG3+cNcPIJd8Oym
 AFXj+YuF85C48rpWLH8IKp0QcuPBf/34laDlz9TPXUfR0GdDkIdoe0Vf6HUxi9hqgpO4
 nGnIuIhrUD0431g1NMt5P3WB71lks3EhXFgVhAp4/kWL+U9KIQNJx9ZAZmoCfw/XdHHB
 +LaBuKCe/UHztZIEhOe57P7AAhVQPZBm1qrB8J2k17pvIrl+7g9747sbJOUihOnOim5d
 QlPUOP94dd3DdM3p2o9Dy0SjaM82MTc4Tx7gEsuMHZw0UsOJ91weYJdLUmTU8G3pu9fT
 Hkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OVQ/28tbLBbbJHmoAL63ZaoS8Vr4XCpJtvfNALNn8PU=;
 b=aIvM+RV+9oE5VmCGvoPBbwnJtoP5ziQ/B3JKQSK2XkqI8z8RR8mzwS4IbxJqhdRH+I
 ofSQdAriYDmNkhxe7TG4OcxUqQjDl3r7Kapn1Or2FQmGImQsNZ+ik08EF0+16GZq+5LF
 q/1I9NSV1L3Djo2teRJXi9oYg+cSHEsoJfQnOpJUUopQMMSUaY0kLkLcLfagNF7PFvxv
 MrcgB92tmg4ZCu9uEmyir8eUk9d7KdXkjdSnD2OPluDLoGxvs8zUQhT5+mGtSXyDBqjZ
 RdbrkWM+jnZ4+q3IMpo/TVbp9s5JY+646XUzMC8kfi6X1ycHlmnJ48yoy8Cmljzq37hE
 DJsw==
X-Gm-Message-State: APjAAAUE9A/2Ohak43oqxKUbEQte/oIk+dPUFb7LPXiaL1D3ddo8009v
 iZVEaQ1k4HsD4ELMjeKn2zt0jzRnsE4=
X-Google-Smtp-Source: APXvYqzno63LqFts2rXrMVDu+Rp80iYLjiAJUYHcxyxKIaUIKTuJHT6rbGZwdGnzc17I9DgpBEqlBg==
X-Received: by 2002:a2e:b010:: with SMTP id y16mr12822379ljk.238.1576922171075; 
 Sat, 21 Dec 2019 01:56:11 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:10 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 3/8] drm/print: add new logging helper for drm logging
Date: Sat, 21 Dec 2019 10:55:48 +0100
Message-Id: <20191221095553.13332-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221095553.13332-1-sam@ravnborg.org>
References: <20191221095553.13332-1-sam@ravnborg.org>
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
Cc: Joe Perches <joe@perches.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new helper so logging can use the standard logging
functions without an extra helper function.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_print.h | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index d2b9ac6a6e18..c1d333bb7534 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -403,10 +403,15 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
  * Prefer drm_device based logging over device or printk based logging.
  */
 
-/* Helper for struct drm_device based logging. */
+/* Helpers for struct drm_device based logging. */
 #define __drm_printk(drm, level, type, fmt, ...)			\
 	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
 
+#define __drm_cat_printk(drm, cat, fmt, ...)				\
+({									\
+	if (drm_debug_enabled(cat))					\
+		dev_dbg((drm)->dev, "[drm] " fmt, ##__VA_ARGS__);	\
+})
 
 #define drm_info(drm, fmt, ...)						\
 	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
@@ -430,24 +435,23 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
 
 #define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_CORE, fmt, ##__VA_ARGS__)
 #define drm_dbg(drm, fmt, ...)						\
-	drm_dev_dbg((drm)->dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_KMS, fmt, ##__VA_ARGS__)
 #define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_PRIME, fmt, ##__VA_ARGS__)
 #define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
 #define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_VBL, fmt, ##__VA_ARGS__)
 #define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_STATE, fmt, ##__VA_ARGS__)
 #define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+	__drm_cat_printk((drm), DRM_UT_LEASE, fmt, ##__VA_ARGS__)
 #define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
-
+	__drm_cat_printk((drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
 
 /*
  * LEGACY logging support - do not use in new code
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
