Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE02312886C
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC536E1BB;
	Sat, 21 Dec 2019 09:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205576E438
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:18 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 9so8888581lfq.10
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qyR8wy1tx62FF4l+ENQewsFn6aI0y0YU/g+Vd/atmkY=;
 b=EEyxs3GGhV2sathVuz8DjOiqj5tURUb4S8Mv/DHx5abYq4mtbqGWKfwS0Af/26B9U1
 hFo10qrAqVxMPyuRejoT/BG5lhXhl1QLd53lpzuoo27ogbm7dxxte+PPMj4N2UDvVAFf
 FFN7ssFNFLvMN0S+vDmj7nxVl1wS20aerp1KDyBDHepgYo/48kY9P4MD8sqFHcMAFpUx
 7dLEHvQz8GW+k7+xwx92afus0rtcEsviv3wCvXTuZqpFTVjy6VMaZEDg01NCkDul2kkQ
 Sdgd+D/nmUpEiBLLmaOSDUiQPUWE13wZtlW6DQabWWNAiOXPK0rFalyTPOmVuk6z9533
 htoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qyR8wy1tx62FF4l+ENQewsFn6aI0y0YU/g+Vd/atmkY=;
 b=FhHtdWs51tfqMO1DbJDCzZGu52BEGugyJRlpOtpHO39C7OoUFvCSUBaHgW5yDl4XDu
 eLBypy+xGa5Dzm6aeW40A73RVo2V/NdtxCQncDYRutCI7D5BmZXWZYvrhDi+U0kv2F/S
 8VR45oxM/GGUX/cRhDzBfo96A9TtvpuJDkU7qgeAgDxbi3DgbOY+LSOHriz3yhzRukC8
 p8klz5F4Vh4eJwN4xU47WdSqupHjZdj9j2vv554AueeXmPCTxJc2oVbvBRuUggiBGDfQ
 uY9I8d8eyFwMIAfotD8IK6+GC+9+bS5+lOB82HBeboVpx7jQ3G0XTyA1wjEhImuR+ITD
 yyyA==
X-Gm-Message-State: APjAAAVQ6y5Xm1S25M092D9NIqvW2y21+/nrtemcH6s+aOgk1ABai4/l
 hK50EWwL3EuXjgnpZu3rH0cPeEa+ydU=
X-Google-Smtp-Source: APXvYqxB8cPUGYGdW2TeNZWYCu7aldi3Fks5mZbY2vxYeehJMNMd/Ag5HlgBtccqkxsPnbERi82RDA==
X-Received: by 2002:a19:e30b:: with SMTP id a11mr11881961lfh.48.1576922176154; 
 Sat, 21 Dec 2019 01:56:16 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:15 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 8/8] drm/print: let legacy logging use new style functions
Date: Sat, 21 Dec 2019 10:55:53 +0100
Message-Id: <20191221095553.13332-9-sam@ravnborg.org>
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

Update the legacy logging functions to use the new style logging
functions.
This will help people when transition to the new style as they can just
go and see what new style logging function to use.

This also makes logging look a bit more consistent as the same base is
now used for logging.

While converting, drop the unused ratelimited variants.

Delete the now unused logging support functions in drm_print.c

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/drm_print.c |  80 ----------------
 include/drm/drm_print.h     | 184 ++++++------------------------------
 2 files changed, 31 insertions(+), 233 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index fd70205f8c5c..e5a3d2576d6f 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -235,86 +235,6 @@ void drm_print_bits(struct drm_printer *p, unsigned long value,
 }
 EXPORT_SYMBOL(drm_print_bits);
 
-void drm_dev_printk(const struct device *dev, const char *level,
-		    const char *format, ...)
-{
-	struct va_format vaf;
-	va_list args;
-
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
-
-	if (dev)
-		dev_printk(level, dev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
-	else
-		printk("%s" "[" DRM_NAME ":%ps] %pV",
-		       level, __builtin_return_address(0), &vaf);
-
-	va_end(args);
-}
-EXPORT_SYMBOL(drm_dev_printk);
-
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...)
-{
-	struct va_format vaf;
-	va_list args;
-
-	if (!drm_debug_enabled(category))
-		return;
-
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
-
-	if (dev)
-		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
-	else
-		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-		       __builtin_return_address(0), &vaf);
-
-	va_end(args);
-}
-EXPORT_SYMBOL(__drm_dev_dbg);
-
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
-{
-	struct va_format vaf;
-	va_list args;
-
-	if (!drm_debug_enabled(category))
-		return;
-
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
-
-	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-	       __builtin_return_address(0), &vaf);
-
-	va_end(args);
-}
-EXPORT_SYMBOL(__drm_dbg);
-
-void __drm_err(const char *format, ...)
-{
-	struct va_format vaf;
-	va_list args;
-
-	va_start(args, format);
-	vaf.fmt = format;
-	vaf.va = &args;
-
-	printk(KERN_ERR "[" DRM_NAME ":%ps] *ERROR* %pV",
-	       __builtin_return_address(0), &vaf);
-
-	va_end(args);
-}
-EXPORT_SYMBOL(__drm_err);
-
 /**
  * drm_print_regset32 - print the contents of registers to a
  * &drm_printer stream.
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 0b0468340573..f305454544ee 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -655,176 +655,54 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
  * LEGACY logging support - do not use in new code
  */
 
-/*
- * struct device based logging
- *
- * Prefer drm_device based logging over device or prink based logging.
- */
-
-__printf(3, 4)
-void drm_dev_printk(const struct device *dev, const char *level,
-		    const char *format, ...);
-__printf(3, 4)
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...);
+#define DRM_DEV_ERROR(dev, fmt, ...)		\
+	drm_dev_err((dev), fmt, ##__VA_ARGS__)
+#define DRM_DEV_INFO(dev, fmt, ...)		\
+	drm_dev_info((dev), fmt, ##__VA_ARGS__)
+#define DRM_DEV_INFO_ONCE(dev, fmt, ...)	\
+	drm_dev_info_once((dev), fmt, ##__VA_ARGS__)
 
-/**
- * Error output.
- *
- * @dev: device pointer
- * @fmt: printf() like format string.
- */
-#define DRM_DEV_ERROR(dev, fmt, ...)					\
-	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
-
-/**
- * Rate limited error output.  Like DRM_ERROR() but won't flood the log.
- *
- * @dev: device pointer
- * @fmt: printf() like format string.
- */
-#define DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)			\
-({									\
-	static DEFINE_RATELIMIT_STATE(_rs,				\
-				      DEFAULT_RATELIMIT_INTERVAL,	\
-				      DEFAULT_RATELIMIT_BURST);		\
-									\
-	if (__ratelimit(&_rs))						\
-		DRM_DEV_ERROR(dev, fmt, ##__VA_ARGS__);			\
-})
-
-#define DRM_DEV_INFO(dev, fmt, ...)				\
-	drm_dev_printk(dev, KERN_INFO, fmt, ##__VA_ARGS__)
-
-#define DRM_DEV_INFO_ONCE(dev, fmt, ...)				\
-({									\
-	static bool __print_once __read_mostly;				\
-	if (!__print_once) {						\
-		__print_once = true;					\
-		DRM_DEV_INFO(dev, fmt, ##__VA_ARGS__);			\
-	}								\
-})
-
-/**
- * Debug output.
- *
- * @dev: device pointer
- * @fmt: printf() like format string.
- */
 #define DRM_DEV_DEBUG(dev, fmt, ...)					\
-	__drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+	drm_dev_dbg_core((dev), fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
-	__drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
+	drm_dev_dbg((dev), fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_KMS(dev, fmt, ...)				\
-	__drm_dev_dbg(dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+	drm_dev_dbg_kms((dev), fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_PRIME(dev, fmt, ...)				\
-	__drm_dev_dbg(dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+	drm_dev_dbg_prime((dev), fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_ATOMIC(dev, fmt, ...)				\
-	__drm_dev_dbg(dev, DRM_UT_ATOMIC,	fmt, ##__VA_ARGS__)
+	drm_dev_dbg_atomic((dev), fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_VBL(dev, fmt, ...)				\
-	__drm_dev_dbg(dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+	drm_dev_dbg_vbl((dev), fmt, ##__VA_ARGS__)
 #define	DRM_DEV_DEBUG_DP(dev, fmt, ...)					\
-	__drm_dev_dbg(dev, DRM_UT_DP, fmt, ## __VA_ARGS__)
-
-#define _DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, category, fmt, ...)	\
-({									\
-	static DEFINE_RATELIMIT_STATE(_rs,				\
-				      DEFAULT_RATELIMIT_INTERVAL,	\
-				      DEFAULT_RATELIMIT_BURST);		\
-	if (__ratelimit(&_rs))						\
-		__drm_dev_dbg(dev, category, fmt, ##__VA_ARGS__);		\
-})
+	drm_dev_dbg_dp((dev), fmt, ## __VA_ARGS__)
 
-/**
- * Rate limited debug output. Like DRM_DEBUG() but won't flood the log.
- *
- * @dev: device pointer
- * @fmt: printf() like format string.
- */
-#define DRM_DEV_DEBUG_RATELIMITED(dev, fmt, ...)			\
-	_DEV_DRM_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_CORE,		\
-					  fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_DRIVER_RATELIMITED(dev, fmt, ...)			\
-	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_DRIVER,		\
-					  fmt, ##__VA_ARGS__)
+#define DRM_DEV_ERROR_RATELIMITED(dev, fmt, ...)			\
+	drm_dev_err_ratelimited((dev), fmt, ##__VA_ARGS__)
 #define DRM_DEV_DEBUG_KMS_RATELIMITED(dev, fmt, ...)			\
-	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_KMS,		\
-					  fmt, ##__VA_ARGS__)
-#define DRM_DEV_DEBUG_PRIME_RATELIMITED(dev, fmt, ...)			\
-	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_PRIME,		\
-					  fmt, ##__VA_ARGS__)
-
-/*
- * printk based logging
- *
- * Prefer drm_device based logging over device or prink based logging.
- */
-
-__printf(2, 3)
-void __drm_dbg(enum drm_debug_category category, const char *format, ...);
-__printf(1, 2)
-void __drm_err(const char *format, ...);
-
-/* Macros to make printk easier */
-
-#define _DRM_PRINTK(once, level, fmt, ...)				\
-	printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
-
-#define DRM_INFO(fmt, ...)						\
-	_DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
-#define DRM_NOTE(fmt, ...)						\
-	_DRM_PRINTK(, NOTICE, fmt, ##__VA_ARGS__)
-#define DRM_WARN(fmt, ...)						\
-	_DRM_PRINTK(, WARNING, fmt, ##__VA_ARGS__)
+	drm_dev_dbg_kms_ratelimited((dev), fmt, ##__VA_ARGS__)
 
-#define DRM_INFO_ONCE(fmt, ...)						\
-	_DRM_PRINTK(_once, INFO, fmt, ##__VA_ARGS__)
-#define DRM_NOTE_ONCE(fmt, ...)						\
-	_DRM_PRINTK(_once, NOTICE, fmt, ##__VA_ARGS__)
-#define DRM_WARN_ONCE(fmt, ...)						\
-	_DRM_PRINTK(_once, WARNING, fmt, ##__VA_ARGS__)
+#define DRM_INFO(fmt, ...) drm_pr_info(fmt, ##__VA_ARGS__)
+#define DRM_NOTE(fmt, ...) drm_pr_notice(fmt, ##__VA_ARGS__)
+#define DRM_WARN(fmt, ...) drm_pr_warn(fmt, ##__VA_ARGS__)
 
-#define DRM_ERROR(fmt, ...)						\
-	__drm_err(fmt, ##__VA_ARGS__)
+#define DRM_INFO_ONCE(fmt, ...) drm_pr_info_once(fmt, ##__VA_ARGS__)
+#define DRM_NOTE_ONCE(fmt, ...) drm_pr_notice_once(fmt, ##__VA_ARGS__)
+#define DRM_WARN_ONCE(fmt, ...) drm_pr_warn_once(fmt, ##__VA_ARGS__)
+#define DRM_ERROR(fmt, ...)     drm_pr_err(fmt, ##__VA_ARGS__)
 
 #define DRM_ERROR_RATELIMITED(fmt, ...)					\
 	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG(fmt, ...)						\
-	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_DRIVER(fmt, ...)					\
-	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_KMS(fmt, ...)						\
-	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_PRIME(fmt, ...)					\
-	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_ATOMIC(fmt, ...)					\
-	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_VBL(fmt, ...)						\
-	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_LEASE(fmt, ...)					\
-	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_DP(fmt, ...)						\
-	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
-
-
-#define DRM_DEBUG_RATELIMITED(fmt, ...)					\
-	DRM_DEV_DEBUG_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
-
-#define DRM_DEBUG_DRIVER_RATELIMITED(fmt, ...)				\
-	DRM_DEV_DEBUG_DRIVER_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
-
 #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
 	DRM_DEV_DEBUG_KMS_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
 
-#define DRM_DEBUG_PRIME_RATELIMITED(fmt, ...)				\
-	DRM_DEV_DEBUG_PRIME_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
+#define DRM_DEBUG(fmt, ...)        drm_pr_dbg_core(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_DRIVER(fmt, ...) drm_pr_dbg(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_KMS(fmt, ...)    drm_pr_dbg_kms(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_PRIME(fmt, ...)  drm_pr_dbg_prime(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_ATOMIC(fmt, ...) drm_pr_dbg_atomic(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_VBL(fmt, ...)    drm_pr_dbg_vbl(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_LEASE(fmt, ...)  drm_pr_dbg_lease(fmt, ##__VA_ARGS__)
+#define DRM_DEBUG_DP(fmt, ...)     drm_pr_dbg_dp(fmt, ##__VA_ARGS__)
 
 #endif /* DRM_PRINT_H_ */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
