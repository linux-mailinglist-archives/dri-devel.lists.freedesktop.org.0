Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E2C12886D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E106E43B;
	Sat, 21 Dec 2019 09:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E00D46E433
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:15 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id m26so10038578ljc.13
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GqRix+uR2dI/9Zd4Du8z4kKyTdDG/QeI0JIJQu8vYug=;
 b=NG68w9mcEI4TvejvuPrh98RFuth6Ru5zW3H3+d3cTAsvU1U2j4EZr2rGV2gCiA7HJu
 Wb1YWM03riQt0/oPyPDYhsYr7wX5Dj1X1hqdPz4YvXal+kvfUlVK28nStc5oH9l99jjQ
 XjJiZ+yGygX3IPhXm+x+fZf1kp0Z5ojWxAguxPRkS1buaf3ZI7+466Ps/vx9xB/fITMH
 fojLu2Fk6y8EzUtJrPMnNjGsNrC+2ekaZqbXos12+TlYnp7XpSYng36m1ClEdOKmIbmu
 GXAVvEO6pX9ZhKFwPnKF/opFlv0PRA2YlQg/7b5Zg3Es94rcTnUxWSUFEHHITBWLVSA7
 u/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GqRix+uR2dI/9Zd4Du8z4kKyTdDG/QeI0JIJQu8vYug=;
 b=kJp3LHIdizaGQ6lxcASfEs3Sr9PA0PXNWT+zlk/LR6C5yGd4h+mny0AMfX3tBy1FAE
 CdHM3vJHehVarGCtyogR5tPSXj9ccUX3zMSbFy/bWxJPp6CALuJhOmCFP7FCNfyhKQNo
 ZdUyrCr/G/a97dNFdb6HRd9FWEgN+ZhcakYoKZu3lGeT0jJ6ZhBbdhPgvIOX9jWePOU/
 yN2cMk0tQJSA6zCaL4mfVOQOWuLZ+7W/DySP0YgUVit/IXnCNwa/PVe2C8vjAytDcKLX
 JEHXCy+t35qswZkZxbdQWl7sNirPvyMeLscOPkuVNSFeqdZ7Sszp9x6BfNe8Sr4ay08N
 fHUw==
X-Gm-Message-State: APjAAAXlH1Zg/8O8QD94OxvNuL70bZNXi2AxRPQeAGhWdCM1ZBA19qw9
 K6c/+wy8LH2vZcknI9lGDA0xk1YpvAA=
X-Google-Smtp-Source: APXvYqzXuNrfnFAAFMtImWbjFkPtQP69dGrbAkTevPSoCrDa/qsME3Fd8Dd8ncnp/BtUZI1HpKvzQg==
X-Received: by 2002:a2e:9592:: with SMTP id w18mr12404088ljh.98.1576922174057; 
 Sat, 21 Dec 2019 01:56:14 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:13 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 6/8] drm/print: add drm_dev_* logging functions
Date: Sat, 21 Dec 2019 10:55:51 +0100
Message-Id: <20191221095553.13332-7-sam@ravnborg.org>
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

There are a lot of cases where we have a device * but no drm_device *.
Add drm_dev_* variants of the logging functions to cover these cases.

Include brief documentation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_print.h | 99 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 7c0b93e6cb80..b2e5d0209010 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -337,7 +337,50 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  * Logging when a &device * is available, but no &drm_device *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- * TODO
+ *
+ * Adding a device pointer (if no &drm_device * is available) is always a good
+ * idea as it add more information in the logging message thus making it easier
+ * to determine the source of the logging.
+ *
+ * All logging functions in this block share the same prototype:
+ *
+ * .. code-block:: c
+ *
+ *   void drm_dev_xxx(struct device *, char * fmt, ...)
+ *
+ * The following functions are available:
+ *
+ * .. code-block:: none
+ *
+ *   # Plain logging
+ *   drm_dev_dbg()
+ *   drm_dev_info()
+ *   drm_dev_notice()
+ *   drm_dev_warn()
+ *   drm_dev_err()
+ *
+ *   # Log only once
+ *   drm_dev_info_once()
+ *   drm_dev_notice_once()
+ *   drm_dev_warn_once()
+ *   drm_dev_err_once()
+ *
+ *   # Ratelimited - do not flood the logs
+ *   drm_dev_err_ratelimited()
+ *   drm_dev_dbg_ratelimited()
+ *   drm_dev_dbg_kms_ratelimited()
+ *
+ *   # Logging with a specific category
+ *   drm_dev_dbg_core()
+ *   drm_dev_dbg()		# Uses the DRIVER category
+ *   drm_dev_dbg_kms()
+ *   drm_dev_dbg_prime()
+ *   drm_dev_dbg_atomic()
+ *   drm_dev_dbg_vbl()
+ *   drm_dev_dbg_state()
+ *   drm_dev_dbg_lease()
+ *   drm_dev_dbg_dp()
+ *
  *
  * Logging when no &device * nor &drm_device * is available
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -468,6 +511,60 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 #define drm_dbg_dp(drm, fmt, ...)					\
 	__drm_cat_printk((drm), DRM_UT_DP, fmt, ##__VA_ARGS__)
 
+/* struct device based logging. */
+#define __drm_dev_printk(dev, level, type, fmt, ...)			\
+	dev_##level##type(dev, "[drm] " fmt, ##__VA_ARGS__)
+
+#define __drm_dev_cat_printk(dev, cat, type, fmt, ...)			\
+({									\
+	if (drm_debug_enabled(cat))					\
+		dev_dbg##type((dev), "[drm] " fmt, ##__VA_ARGS__);	\
+})
+
+#define drm_dev_info(dev, fmt, ...)					\
+	__drm_dev_printk((dev), info,, fmt, ##__VA_ARGS__)
+#define drm_dev_notice(dev, fmt, ...)					\
+	__drm_dev_printk((dev), notice,, fmt, ##__VA_ARGS__)
+#define drm_dev_warn(dev, fmt, ...)					\
+	__drm_dev_printk((dev), warn,, fmt, ##__VA_ARGS__)
+#define drm_dev_err(dev, fmt, ...)					\
+	__drm_dev_printk((dev), err,, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_dev_info_once(dev, fmt, ...)				\
+	__drm_dev_printk((dev), info, _once, fmt, ##__VA_ARGS__)
+#define drm_dev_notice_once(dev, fmt, ...)				\
+	__drm_dev_printk((dev), notice, _once, fmt, ##__VA_ARGS__)
+#define drm_dev_warn_once(dev, fmt, ...)				\
+	__drm_dev_printk((dev), warn, _once, fmt, ##__VA_ARGS__)
+#define drm_dev_err_once(dev, fmt, ...)					\
+	__drm_dev_printk((dev), err, _once, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_dev_err_ratelimited(dev, fmt, ...)				\
+	__drm_dev_printk((dev), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_ratelimited(dev, fmt, ...)				\
+	__drm_dev_cat_printk((dev), DRM_UT_DRIVER,_ratelimited, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_kms_ratelimited(dev, fmt, ...)			\
+	__drm_dev_cat_printk((dev), DRM_UT_KMS,_ratelimited, fmt, ##__VA_ARGS__)
+
+#define drm_dev_dbg_core(dev, fmt, ...)					\
+	__drm_dev_cat_printk((dev), DRM_UT_CORE,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg(dev, fmt, ...)					\
+	__drm_dev_cat_printk((dev), DRM_UT_DRIVER,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_kms(dev, fmt, ...)					\
+	__drm_dev_cat_printk((dev), DRM_UT_KMS,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_prime(dev, fmt, ...)				\
+	__drm_dev_cat_printk((dev), DRM_UT_PRIME,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_atomic(dev, fmt, ...)				\
+	__drm_dev_cat_printk((dev), DRM_UT_ATOMIC,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_vbl(dev, fmt, ...)					\
+	__drm_dev_cat_printk((dev), DRM_UT_VBL,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_state(dev, fmt, ...)				\
+	__drm_dev_cat_printk((dev), DRM_UT_STATE,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_lease(dev, fmt, ...)				\
+	__drm_dev_cat_printk((dev), DRM_UT_LEASE,, fmt, ##__VA_ARGS__)
+#define drm_dev_dbg_dp(dev, fmt, ...)					\
+	__drm_dev_cat_printk((dev), DRM_UT_DP,, fmt, ##__VA_ARGS__)
+
 /*
  * LEGACY logging support - do not use in new code
  */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
