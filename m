Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C1F57BA46
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCF7C8F596;
	Wed, 20 Jul 2022 15:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1E08F431;
 Wed, 20 Jul 2022 15:33:23 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id n7so14537718ioo.7;
 Wed, 20 Jul 2022 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smzB/k68xh/FUqryWbOBUBLDbn4KcKzhEOP/Gwd4FZo=;
 b=aZG+LppnTtEfZOHOCugvT1fTXRcM9p5nvLq6XaYgYE83fZj0pD2tYU06U/w0tDf4/o
 EfIizBlA7yy56JPdBWQ74SsjlRhAhjYRkkrGkeVAyYXZEbCp9kKs5y967k6j/mB3VQQU
 AwDlAwSr8wpDIGYgl6lnYsK12crBANTdjkHfVNwB493AKPcPT1vOE6cBgaRg8dvTAx2r
 augmXewk73mzQWpEqBL1VvXZOmMt3P+icjywxv/uQSionmTD/Ip5twLoGxQvGeoM0MAh
 2pU7MVE6+/mTIpn7gWXCqQcobiLdECAxul/d/42kDvuoe1SFKdon4AJXS8dKoMfnFoHc
 fohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smzB/k68xh/FUqryWbOBUBLDbn4KcKzhEOP/Gwd4FZo=;
 b=xo2XeIFD2PHWcfKiWfoxoh1b/ydszMKhN2yxGUIzBjs07HL8osqSt4WW0DLObBE9tx
 o40BvZK372Hv2Jetb0nQ9w9mUxDYQJhFHzMJeGU9A1t25f7P3Su3OYs24fdplJotydfD
 bZn0prX0dOXk5tDlW9D5o/agMzlc3Wifw0IvYoSwF4BU0ZRyWgv3sBg3Agq3kzDwmg4J
 ATEhFwRb1rIYURX+hA4BVU4V2qYVp7eiI418X7PmWHCPl4FUxAUhnIGFsGebQDJQgDTM
 yiFwjAbnvVcJhI36fFLBFqMSFPgvtSzQlTkC6Ygi846L3HjVW5ZiCX4Kfa/Ofhbx0FtH
 JXGg==
X-Gm-Message-State: AJIora8LmeTNOUCMZGwMVNo0aYcQmxYa+lyeQ269PPQ+k7o135D92Kh2
 RRQ65YmjOeqNEk1NL4ccYZahmucW88mHkQ==
X-Google-Smtp-Source: AGRyM1tqCzcrvVNj9cuQQcLztd19zjQ/j+wPEt4Itl5+LEf5DhcYKr7N3o3bhfuL7knWBF1GbOGhWw==
X-Received: by 2002:a05:6638:344d:b0:33f:1ce0:a87d with SMTP id
 q13-20020a056638344d00b0033f1ce0a87dmr19933876jav.21.1658331203292; 
 Wed, 20 Jul 2022 08:33:23 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 24/41] drm-print: add drm_dbg_driver to improve namespace
 symmetry
Date: Wed, 20 Jul 2022 09:32:16 -0600
Message-Id: <20220720153233.144129-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_print defines all of these:
    drm_dbg_{core,kms,prime,atomic,vbl,lease,_dp,_drmres}

but not drm_dbg_driver itself, since it was the original drm_dbg.

To improve namespace symmetry, change the drm_dbg defn to
drm_dbg_driver, and redef grandfathered name to symmetric one.

This will help with nouveau, which uses its own stack of macros to
construct calls to dev_info, dev_dbg, etc, for which adaptation means
drm_dbg_##driver constructs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 2d2cef76b5c1..3aa5e9ea26f4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -467,7 +467,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #define drm_dbg_core(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_CORE, fmt, ##__VA_ARGS__)
-#define drm_dbg(drm, fmt, ...)						\
+#define drm_dbg_driver(drm, fmt, ...)						\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
 #define drm_dbg_kms(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__)
@@ -486,6 +486,7 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 #define drm_dbg_drmres(drm, fmt, ...)					\
 	drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
 
+#define drm_dbg(drm, fmt, ...)	drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
 
 /*
  * printk based logging
-- 
2.36.1

