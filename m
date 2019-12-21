Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAC512886E
	for <lists+dri-devel@lfdr.de>; Sat, 21 Dec 2019 10:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CC66E438;
	Sat, 21 Dec 2019 09:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091EA6E438
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 09:56:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id i23so8891480lfo.7
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Dec 2019 01:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tdWgzBmBhFIY0yV6azzdb6ioleZW2L9QwhOviQaYTGM=;
 b=Npzi8axXY6xt7zYHFLUy12HZkVqCzENo9BMGhrVekavfWuuwIwpIITU/Bu5TXoF+dH
 hNQZv3Lm/9wLeFGp23jT6d4dYCdSFVQmOt2+hiBuqblyq+cfkVNx/SJwpZCK975sFH/r
 M0Ut/7P/2b7maYmMt9T8er0NjY6pQB32pr/sEgZgviuzTxr69NgeplJQAZ2TKTX5UEWu
 J4MOOE2r58nhaaTD+MTSYXwZJ7bBv3m/6iOlHcKyC/dPlzS/QEyeU/LiuxCBRZb4iLK0
 nHuupZPcNCi4lOqhwTmtl+m2g51iSFhU5GlJcL0M506VrQ6fp3bbiHyywL2BCsVPWa7Y
 fZ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tdWgzBmBhFIY0yV6azzdb6ioleZW2L9QwhOviQaYTGM=;
 b=HI+VUbwPMVcpjhnC0XFcHa0s8lAVJIkKbNYm/OaGTWKXNLt2Ol8yr659L80H5fXhDX
 IxlSmagfaz2md2v8Wk1D3i7MzXmGSeYMC8dNcbe/a3UYBFT1gRh7e/K0wog1+IYOIWEF
 WlJffOlYkGhkfVQC0oCeYwR45ezP/3cSjnNWxRrc2Mfc89gka82GD5mFmptjuMwO3SLu
 W0uP9nq4W7HEL0Z4lSA00ENBJMno8qi3Hnt26FU6EyJ//B6EzvNKN72wqt1ERUmDwYP9
 l8/pZZYZTW1vNIOb+I1Wc9+JialNWaKuCY80Y27J3yB5oqCSFqL8VbR+hGTuwt4L6orJ
 AQSA==
X-Gm-Message-State: APjAAAUXW8rcPVVC8ExA6PN8vAM5RrKhKGmUm33OpBo6SuqzAknuC+SD
 my3kpDYefQZcgZm8ekh+AD2lW2D5B3M=
X-Google-Smtp-Source: APXvYqyo11ktOp3oYKgdfoPZi7W5MGdt3PhroKks+SZp+GRfIpvUdlzAZrWs6HuowKEiXQTACtPQ3Q==
X-Received: by 2002:a19:ec14:: with SMTP id b20mr12009198lfa.63.1576922175165; 
 Sat, 21 Dec 2019 01:56:15 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 n23sm5187263lfa.41.2019.12.21.01.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 01:56:14 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 7/8] drm/print: add drm_pr_ logging
Date: Sat, 21 Dec 2019 10:55:52 +0100
Message-Id: <20191221095553.13332-8-sam@ravnborg.org>
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

Add standard logging functions that can be used when
no struct device *, nor struct drm_device * is available.

Include brief documentation.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_print.h | 88 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index b2e5d0209010..0b0468340573 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -384,7 +384,46 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  * Logging when no &device * nor &drm_device * is available
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
- * TODO
+ *
+ * When there is neither a struct &drm_device *, nor a struct device * use
+ * the logging variants that does not take a pointer.
+ * It is important to note that the logging core cannot provide much extra
+ * info but as the logging has a fixed *[drm]* prefix then the logging continue
+ * to be easy to spot.
+ *
+ * All logging functions in this block share the same prototype:
+ *
+ * .. code-block:: c
+ *
+ *   void drm_pr_xxx(char * fmt, ...)
+ *
+ * The following functions are available:
+ *
+ * .. code-block:: none
+ *
+ *   # Plain logging
+ *   drm_pr_dbg()
+ *   drm_pr_info()
+ *   drm_pr_notice()
+ *   drm_pr_warn()
+ *   drm_pr_err()
+ *
+ *   # Log only once
+ *   drm_pr_info_once()
+ *   drm_pr_notice_once()
+ *   drm_pr_warn_once()
+ *   drm_pr_err_once()
+ *
+ *   # Logging with a specific category
+ *   drm_pr_dbg_core()
+ *   drm_pr_dbg()		# Uses the DRIVER category
+ *   drm_pr_dbg_kms()
+ *   drm_pr_dbg_prime()
+ *   drm_pr_dbg_atomic()
+ *   drm_pr_dbg_vbl()
+ *   drm_pr_dbg_state()
+ *   drm_pr_dbg_lease()
+ *   drm_pr_dbg_dp()
  *
  * Obsoleted logging functions
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~
@@ -565,6 +604,53 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 #define drm_dev_dbg_dp(dev, fmt, ...)					\
 	__drm_dev_cat_printk((dev), DRM_UT_DP,, fmt, ##__VA_ARGS__)
 
+/* logging with no struct device * and no struct drm_device * */
+#define __drm_pr_printk(level, type, fmt, ...)				\
+	pr_##level##type("[drm] " fmt, ##__VA_ARGS__)
+
+#define __drm_pr_cat_printk(cat, type, fmt, ...)			\
+({									\
+	if (drm_debug_enabled(cat))					\
+		pr_debug##type("[drm] " fmt, ##__VA_ARGS__);		\
+})
+
+#define drm_pr_info(fmt, ...)						\
+	__drm_pr_printk(info,, fmt, ##__VA_ARGS__)
+#define drm_pr_notice(fmt, ...)						\
+	__drm_pr_printk(notice,, fmt, ##__VA_ARGS__)
+#define drm_pr_warn(fmt, ...)						\
+	__drm_pr_printk(warn,, fmt, ##__VA_ARGS__)
+#define drm_pr_err(fmt, ...)						\
+	__drm_pr_printk(err,, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_pr_info_once(fmt, ...)					\
+	__drm_pr_printk(info, _once, fmt, ##__VA_ARGS__)
+#define drm_pr_notice_once(fmt, ...)					\
+	__drm_pr_printk(notice, _once, fmt, ##__VA_ARGS__)
+#define drm_pr_warn_once(fmt, ...)					\
+	__drm_pr_printk(warn, _once, fmt, ##__VA_ARGS__)
+#define drm_pr_err_once(fmt, ...)					\
+	__drm_pr_printk(err, _once, "*ERROR* " fmt, ##__VA_ARGS__)
+
+#define drm_pr_dbg_core(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_CORE,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg(fmt, ...)						\
+	__drm_pr_cat_printk(DRM_UT_DRIVER,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_kms(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_KMS,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_prime(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_PRIME,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_atomic(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_ATOMIC,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_vbl(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_VBL,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_state(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_STATE,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_lease(fmt, ...)					\
+	__drm_pr_cat_printk(DRM_UT_LEASE,, fmt, ##__VA_ARGS__)
+#define drm_pr_dbg_dp(fmt, ...)						\
+	__drm_pr_cat_printk(DRM_UT_DP,, fmt, ##__VA_ARGS__)
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
