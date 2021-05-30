Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE03955FB
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 09:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486D06E871;
	Mon, 31 May 2021 07:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994AA6E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 19:21:58 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 36-20020a9d0ba70000b02902e0a0a8fe36so9051524oth.8
 for <dri-devel@lists.freedesktop.org>; Sun, 30 May 2021 12:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1DEGNnoQ7HdGQuJ6aNB2wcm63jtvEU/JwOki3n4nkc=;
 b=GL2Dd0PEH7HDc7+MzXc/tcgKLcOqfa+g548c/BZSNfMthbMiM9S1lFeyYcsVHYu5Up
 9qF10Wk901JJ7AdOePi0fAxpys9cFs2L+ZM+yybCkPev1U8lF8diti03chjsKgYnSp2S
 Sj8wgYX6TuY7bB48ldG2cNe/niMxikhzTjiVN6N6YAEjapP01gdqe72thI6EDnnlQxtx
 E0BNCsdOXmFRHNysQ8oMesSdkEXu4/btpnxH/zZG4VlA0d2ifctU046WjdauvG1KjZtR
 X5NI1yRY7ibKKwijsgaG5K2IDjy48jVryxH677jJTJJSdUM/7KpeNJZnAHWs2S92n/WN
 jreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O1DEGNnoQ7HdGQuJ6aNB2wcm63jtvEU/JwOki3n4nkc=;
 b=YrwNPC7ekGJx8y0FJ4hXw2b4FALd9s8tE+fZfntjdi53i23dApkPuXqor4jw1ja/CW
 DvsC13zv0v6kbsO0MoqM9dJ/OL4+3guD04oBJV/y+d1B3oNbEQPRdZ5qS4DQIcEsKplo
 0sMPtJ+dBX8vR/y3V7QvT+EPnLxDWO1OIJUbuRmUgFVc+iFApAA0hcLExJepKJ3hCqJb
 ryjnWyoHI/DDh8qM8vMnHD2wcR3fMmgdemwwRhDBnIoFiAgXmM2bJ+/fIkLs7CZ8a0m2
 fNNbiU1QEoG97wVmPTOYmVngGME00UnmXNTWaFdma/wzd8NGYIlIYrvT2bB8O28TEFIO
 WVfA==
X-Gm-Message-State: AOAM532Gflw2OEhM0NW1hL+LBgEUKlwwdCYWJAeh9Q9qqXDT5QTH31kn
 asg40gtXqBiOSqLzOqvP88XugNfJvOLhMg==
X-Google-Smtp-Source: ABdhPJy33IEZ6RE5dVlsKHQGqjVDs0O089ZCxO+XdwsnX/2qBu8kNbJozWQb2rGO+RQAonrDsXs7vg==
X-Received: by 2002:a05:6830:108a:: with SMTP id
 y10mr14561645oto.187.1622402517725; 
 Sun, 30 May 2021 12:21:57 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a18sm2418076oiy.24.2021.05.30.12.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 12:21:57 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/4] drm: fixup DRM_DEBUG_KMS_RATELIMITED merge punt
Date: Sun, 30 May 2021 13:21:45 -0600
Message-Id: <20210530192146.393761-4-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530192146.393761-1-jim.cromie@gmail.com>
References: <20210530192146.393761-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 May 2021 07:23:08 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HEAD~2 punted on merging DRM_DEBUG_KMS_RATELIMITED; clean that up now,
removing the extra macro indirections which support !KMS cases, since
only _KMS_RATELIMITED is used.  They can be re-added once needed.

conflict was here:
c5261e93758a drm/print: Fixup DRM_DEBUG_KMS_RATELIMITED()

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 616fe5e83b50..9812bf11c1e9 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -571,20 +571,15 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG_DP(fmt, ...)						\
 	__drm_dbg(cDRM_UT_DP, fmt, ## __VA_ARGS__)
 
-#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
-({												\
-	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
-	const struct drm_device *drm_ = (drm);							\
-												\
-	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_dbg(NULL, cDRM_UT_KMS, fmt, ##__VA_ARGS__);	\
+#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
+({									\
+	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL,	\
+				      DEFAULT_RATELIMIT_BURST);		\
+									\
+	if (drm_debug_enabled(DRM_UT_KMS) && __ratelimit(&rs_))		\
+		__drm_dbg(cDRM_UT_KMS, fmt, ##__VA_ARGS__);		\
 })
 
-#define drm_dbg_kms_ratelimited(drm, fmt, ...) \
-	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
-
-#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
-
 /*
  * struct drm_device based WARNs
  *
-- 
2.31.1

