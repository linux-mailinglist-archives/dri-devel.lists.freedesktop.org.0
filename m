Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A869128867
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309F96E431;
	Sat, 21 Dec 2019 09:56:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014D16E432
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:11 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id k8so12471585ljh.5
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IkjYykOxo9qxEFU02ctTPlXXkHxlR5KUocag0pQ+sSQ=;
 b=TpKU3QB90IpiPg45PzEmXr+2yUsA7g/BVOHrz9QPNxRP2n1SHFgwVGpdNDNvmrPNQI
 yNlaO5sV/Agb5jH3ZusfKgIevNkhMzW67ZXVZ4O615fyLQzrVDJ3m0Opl6QI0S8lm6o0
 VeIpNSBFUmqxtA29xeo+PEQ5ICD4WD5Xbpw2XvRabfeza/eXwTTk2VZmX20PWE403kTk
 TvPF8t2LhoLWJZ/OI20xUaLF7/W0upT2Gm77ci5v8r+1FTqBQZ6E9cSt/rjyflQIkWlf
 S1aSiHu/gSwpfQgrN4zOZNtniEQaVxnWrhubxSQ6cVYUgQ4mxwKgiRY35GwgrZ2MnUez
 DosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IkjYykOxo9qxEFU02ctTPlXXkHxlR5KUocag0pQ+sSQ=;
 b=RVHqqLsvk8AsmoGlOm2Ln7GgxiWQTQi0S2OsRXSiVyrCrQC6SpPh3yd4NmuQEEbYT9
 OcTFa1ICxLp0CZD8lmsTJRZO409Tz3LmKA8s7Q2dhsaVQjY/fwklpIk0kpekwY8Vd0FD
 0EAnLSWTp3mVO3yAXhREvYxaTCFPyIFCXXr7pJ1gA3c2UiVqPp5RBUTWzo2FDOQyVh8T
 +5Izv5tHGmDgzKajwRadslb6ZD8BQDv2dBjaqy+3spWW3+ozEniwWeQXRD+wHtuVijpJ
 IU7vBsv9/YkW9T88AeNaj9Cf46RTlZGAcFTQlZMDss59RxUyj+gpEqnOa7rClQNZ026i
 v9tQ==
X-Gm-Message-State: APjAAAVk2x2/wPPR/rmRhtSgSDsnLqbsNQok5oDYaI3lEwetkdAFOY+D
 XRZph4y2BTQtVjiFqm60HYUmOj8eYXM=
X-Google-Smtp-Source: APXvYqyaYuIKg0mmUtvb1C44ze05hSP4nye4i8tCL0dnfViCV2wn+W5CMpOtb+K7jLwZY/u1wvC/5A==
X-Received: by 2002:a2e:2d11:: with SMTP id t17mr12243175ljt.177.1576922169994; 
 Sat, 21 Dec 2019 01:56:09 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:09 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 2/8] drm/print: move new style logging functions
Date: Sat, 21 Dec 2019 10:55:47 +0100
Message-Id: <20191221095553.13332-3-sam@ravnborg.org>
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

Move the new style logging function up right after the documentation of
their usage.
And note that remaining logging functions are legacy.

While moving, drop some extra lines.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_print.h | 117 +++++++++++++++++++---------------------
 1 file changed, 56 insertions(+), 61 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index e9e31ace0afa..d2b9ac6a6e18 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -397,6 +397,62 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 	return unlikely(__drm_debug & category);
 }
 
+/*
+ * struct drm_device based logging
+ *
+ * Prefer drm_device based logging over device or printk based logging.
+ */
+
+/* Helper for struct drm_device based logging. */
+#define __drm_printk(drm, level, type, fmt, ...)			\
+	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
+
+
+#define drm_info(drm, fmt, ...)						\
+	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
+#define drm_notice(drm, fmt, ...)					\
+	__drm_printk((drm), notice,, fmt, ##__VA_ARGS__)
+#define drm_warn(drm, fmt, ...)						\
+	__drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
+#define drm_err(drm, fmt, ...)						\
+	__drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_info_once(drm, fmt, ...)					\
+	__drm_printk((drm), info, _once, fmt, ##__VA_ARGS__)
+#define drm_notice_once(drm, fmt, ...)					\
+	__drm_printk((drm), notice, _once, fmt, ##__VA_ARGS__)
+#define drm_warn_once(drm, fmt, ...)					\
+	__drm_printk((drm), warn, _once, fmt, ##__VA_ARGS__)
+#define drm_err_once(drm, fmt, ...)					\
+	__drm_printk((drm), err, _once, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_err_ratelimited(drm, fmt, ...)				\
+	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_dbg_core(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
+#define drm_dbg(drm, fmt, ...)						\
+	drm_dev_dbg((drm)->dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
+#define drm_dbg_kms(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
+#define drm_dbg_prime(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
+#define drm_dbg_atomic(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
+#define drm_dbg_vbl(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
+#define drm_dbg_state(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_STATE, fmt, ##__VA_ARGS__)
+#define drm_dbg_lease(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
+#define drm_dbg_dp(drm, fmt, ...)					\
+	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
+
+
+/*
+ * LEGACY logging support - do not use in new code
+ */
+
 /*
  * struct device based logging
  *
@@ -496,67 +552,6 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_PRIME,		\
 					  fmt, ##__VA_ARGS__)
 
-/*
- * struct drm_device based logging
- *
- * Prefer drm_device based logging over device or prink based logging.
- */
-
-/* Helper for struct drm_device based logging. */
-#define __drm_printk(drm, level, type, fmt, ...)			\
-	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
-
-
-#define drm_info(drm, fmt, ...)					\
-	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
-
-#define drm_notice(drm, fmt, ...)				\
-	__drm_printk((drm), notice,, fmt, ##__VA_ARGS__)
-
-#define drm_warn(drm, fmt, ...)					\
-	__drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
-
-#define drm_err(drm, fmt, ...)					\
-	__drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
-
-
-#define drm_info_once(drm, fmt, ...)				\
-	__drm_printk((drm), info, _once, fmt, ##__VA_ARGS__)
-
-#define drm_notice_once(drm, fmt, ...)				\
-	__drm_printk((drm), notice, _once, fmt, ##__VA_ARGS__)
-
-#define drm_warn_once(drm, fmt, ...)				\
-	__drm_printk((drm), warn, _once, fmt, ##__VA_ARGS__)
-
-#define drm_err_once(drm, fmt, ...)				\
-	__drm_printk((drm), err, _once, "*ERROR* " fmt, ##__VA_ARGS__)
-
-
-#define drm_err_ratelimited(drm, fmt, ...)				\
-	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
-
-
-#define drm_dbg_core(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg(drm, fmt, ...)						\
-	drm_dev_dbg((drm)->dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
-#define drm_dbg_kms(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
-#define drm_dbg_prime(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
-#define drm_dbg_atomic(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
-#define drm_dbg_vbl(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
-#define drm_dbg_state(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_STATE, fmt, ##__VA_ARGS__)
-#define drm_dbg_lease(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
-#define drm_dbg_dp(drm, fmt, ...)					\
-	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
-
-
 /*
  * printk based logging
  *
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
