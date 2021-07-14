Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612943C8A27
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE756E461;
	Wed, 14 Jul 2021 17:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC816E45D;
 Wed, 14 Jul 2021 17:51:51 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id z9so3130128iob.8;
 Wed, 14 Jul 2021 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ea4AsRRmL97027kS3p/+NyUy1F1jMnaKQcqYl22WuEE=;
 b=ue40kFvKMJttvJ2rXiUJPQJNNFnMCW0Wu6rvpZkazuGGTfM8fegU8CC/kqb27Z/W/P
 2FcmrAvUoIZT5bISeVBbbYAWQg0v3ZWa5Qm9vDkJSXazSb1VY+v0Zh/+KBfmnmp1Fou2
 fv5MOmua7i6IIwO4ho/tMdtVHBHUAEHn1hKNqO8V9F/aRIuPsSbtK3pCMDO2NHrWlxfw
 bnj/BL2nuwERnZnHy9hmpSKdIDKzHAgqVc2i14A7NEiSSQKo0vyqQ5ErWaVRu712j2AH
 tLmM1YTs74TSSiNlBCOLK0ADeKIHo11OGqM8BzlKxTVnqQ2jLG16CCn2gqE/GLahcbQX
 pwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ea4AsRRmL97027kS3p/+NyUy1F1jMnaKQcqYl22WuEE=;
 b=e9Ih7hIZBOcWMGdjA+9nYeJtKfE+doZNH0tvaLT7ieJHknI61PBoOUpH4WEdvnz17/
 BUQMxL4pN10ZTEpYv5wkiBvA8GgtUHuH180wTTAJ5XVYOm2MA3Ur2qTxd2RLNO8KhMeD
 qWQc2HWmZ40e1HD+I5fUQfdusnTJC0HmElACDimZHyQunIyDseYgCeyAGlIPmBYdpUha
 ZEvKzCBuDssaZ4lYKErfUdKejC75Ys8YOR7iI7JUbqkbAIagWy1OVkKYnNf9sTWAHwAt
 imkk5X8INWTVUqQ4ZrXnuagJc+YM22wXfpdfjPq2kWwTDyxswyXyC1dvOuBdQCzhuaq6
 HiFQ==
X-Gm-Message-State: AOAM531VYUH2GuO3XekFf06pEl1x11ypP4QYkqSVlSX52CukTpoMNVfI
 R4S4M/l9LFm9DbPClBY59Y0=
X-Google-Smtp-Source: ABdhPJx2//ItOIAkrM4FJzs9OWu5rNOCwIUDOKO7EVTDAvqcwckhanULzcVS1fd2VxPEn1u+swEpLw==
X-Received: by 2002:a5d:8198:: with SMTP id u24mr7949208ion.81.1626285111058; 
 Wed, 14 Jul 2021 10:51:51 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id b16sm706518ioh.5.2021.07.14.10.51.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:51:50 -0700 (PDT)
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
Subject: [PATCH v3 2/5] drm_print.h: rewrap __DRM_DEFINE_DBG_RATELIMITED macro
Date: Wed, 14 Jul 2021 11:51:35 -0600
Message-Id: <20210714175138.319514-3-jim.cromie@gmail.com>
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

whitespace only, to minimize the diff of a later commit.
no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 15a089a87c22..ff5ac0e88321 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -524,19 +524,23 @@ void __drm_err(const char *format, ...);
 #define DRM_DEBUG_DP(fmt, ...)						\
 	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
 
-#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)					\
-({												\
-	static DEFINE_RATELIMIT_STATE(rs_, DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);\
-	const struct drm_device *drm_ = (drm);							\
-												\
-	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))			\
-		drm_dev_printk(drm_ ? drm_->dev : NULL, KERN_DEBUG, fmt, ## __VA_ARGS__);	\
+#define __DRM_DEFINE_DBG_RATELIMITED(category, drm, fmt, ...)		\
+({									\
+	static DEFINE_RATELIMIT_STATE(rs_,				\
+				      DEFAULT_RATELIMIT_INTERVAL,	\
+				      DEFAULT_RATELIMIT_BURST);		\
+	const struct drm_device *drm_ = (drm);				\
+									\
+	if (drm_debug_enabled(DRM_UT_ ## category) && __ratelimit(&rs_))\
+		drm_dev_printk(drm_ ? drm_->dev : NULL,			\
+			       KERN_DEBUG, fmt, ## __VA_ARGS__);	\
 })
 
 #define drm_dbg_kms_ratelimited(drm, fmt, ...) \
 	__DRM_DEFINE_DBG_RATELIMITED(KMS, drm, fmt, ## __VA_ARGS__)
 
-#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
+#define DRM_DEBUG_KMS_RATELIMITED(fmt, ...) \
+	drm_dbg_kms_ratelimited(NULL, fmt, ## __VA_ARGS__)
 
 /*
  * struct drm_device based WARNs
-- 
2.31.1

