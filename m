Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B67130380F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:38:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0119F6E434;
	Tue, 26 Jan 2021 08:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ECA6E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 14:48:44 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id v1so12925299ott.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 06:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B1CQ1T5/DXTFMGz2r2R9Xl9cZI2jR/kU15qdn7iRlfI=;
 b=tbztFNVXEB+zi5mf31Ydy0UIOrHtW0RwEon12Dk97oDLdZPLg02zW5ZHP7ZIw0CATI
 f86jwI97YYUzxElawOW3crAkkRwBBiMSheJPNRU8Ok3wduzBqzMpypSL5E8vP/rMt+Ai
 3NVEdvUuo0mjZUz7whDPeyrlNnYWuJZJjxB1gpLw6+4jVqX8+fMfvgXuFDJ5BTPNo8as
 hRmmvhXWzddH87dIEcu+XKtynl8M//X2orCXjUi1tqMKVvMRPvM1KCBjBW6rz3TQjyUF
 +V0mNqPSSQP7MXmydibVHNcIZHSaeNn+IlL4JGIMzndcFpytiHG+QMUSvsIQRUnrmsqR
 Z3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B1CQ1T5/DXTFMGz2r2R9Xl9cZI2jR/kU15qdn7iRlfI=;
 b=Wp1wL8VtYJyMpcS3GodWbYEY43kj7leZ72ACMqTM4ijo0S8ZHRwmWBDdxlnio1QF6j
 Gkp2K13rkBp6/8b/YhoxpII6tBwfnA5h3KyDGRGUc7LMQxjPFPzE5jgSKW4DAMl5ZgxG
 09EKM0bxgLNtjAbz9OlgR4BfGLdR1rDn6AYsp0p+UFVbe6OWcYtIOsrw+RMIR9dB4Svf
 nAQDPDHptsKFBavhw31pfaSdV56dBpnWu0AH3GZPw6maJML663sNAxz13zHHfSssuWGE
 AQM4TVhT1sUZYaoiQlJHf+zKyb9BDAoHNKki2IUsXlqMafNN6RMbIM/DXNE3S52+dqM7
 KZEQ==
X-Gm-Message-State: AOAM530kaEUncPmfD2C+F1piD24APImmXc/LG5YRmAihn2XoC1FfrXNx
 3SfiR8uJwMn2kPTgef+Cgg==
X-Google-Smtp-Source: ABdhPJwyI3+FD5hW9PFm83t8SsZmOqDmhktVSdIsgmi5n8OZF5dZc7x/KXTatTw9VcgHDkLuc8tNaw==
X-Received: by 2002:a05:6830:1e2a:: with SMTP id
 t10mr710057otr.90.1611586123491; 
 Mon, 25 Jan 2021 06:48:43 -0800 (PST)
Received: from vali.hitronhub.home (64-251-141-144.fidnet.com.
 [64.251.141.144])
 by smtp.gmail.com with ESMTPSA id m133sm3516928oig.44.2021.01.25.06.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:48:42 -0800 (PST)
From: Joseph Schulte <joeschulte.js@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm: replace drm_modeset_lock_all() in
 drm_client_modeset_dpms_legacy()
Date: Mon, 25 Jan 2021 08:48:15 -0600
Message-Id: <20210125144815.8389-1-joeschulte.js@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
Cc: Joseph Schulte <joeschulte.js@gmail.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch helps complete Use  DRM_MODESET_LOCK_ALL* helpers instead of
boilerplate todo in Documentation/gpu/todo.rst

Signed-off-by: Joseph Schulte <joeschulte.js@gmail.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b7e9e1c2564c..ced09c7c06f9 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -7,6 +7,7 @@
  * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
  */
 
+#include "drm/drm_modeset_lock.h"
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
@@ -1181,9 +1182,11 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
 	struct drm_device *dev = client->dev;
 	struct drm_connector *connector;
 	struct drm_mode_set *modeset;
+	struct drm_modeset_acquire_ctx ctx;
 	int j;
+	int ret;
 
-	drm_modeset_lock_all(dev);
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
 	drm_client_for_each_modeset(modeset, client) {
 		if (!modeset->crtc->enabled)
 			continue;
@@ -1195,7 +1198,7 @@ static void drm_client_modeset_dpms_legacy(struct drm_client_dev *client, int dp
 				dev->mode_config.dpms_property, dpms_mode);
 		}
 	}
-	drm_modeset_unlock_all(dev);
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 }
 
 /**
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
