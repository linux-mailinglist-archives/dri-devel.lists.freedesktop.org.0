Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C52176729
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9FB6E89A;
	Mon,  2 Mar 2020 22:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705906E8B1
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:17 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z12so830409wmi.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFWwNHY06HIh3/2F4EjGwC1qZKZjqhtmDIH/OUZClsU=;
 b=GCeUZ5tHiyTWxzPto+F6j8OgHFchBvXvuD8a9USO+Z/Nli08O7ZLmAk0PsHbio0W5Y
 7e1SPxDXSsgp4GzlYdl7w/dSI2U9TfwsGXVuWImg5zObbpxGX0RzVarCdLo/2j680PU6
 mXY2941rg+KQnFoYbS3nEVkPK/CSKQ66wWQMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFWwNHY06HIh3/2F4EjGwC1qZKZjqhtmDIH/OUZClsU=;
 b=pLK8qSLUjtnaI7X7yQVXn2EnEai+ae0NKUaNljlr+S6mtU/IK541YGbBqeHdgrpmzU
 M8sJt2Qy4daWfV0QQ2V1wWQavTKQB7mCwoYXeJZkqTzM4tOAT8h28OLrEXOuelD7aW4m
 0PKQIUqlSCcMATSnftU4tmZU//EobcEP3g8Fe2DrB4Os8g2XngvIo7QjkTgOuPwSns5M
 oWIBwth6DJSpeV2glJcB8kxu0WFD0QXRJwLPjNs5ri1g8FvnQnPY8Whaafzvx90KiRLM
 +A3jkfU4kNrJ6BEErqq2Ne3gS5MjetrcJZV9v3tUqWRvMfOk4LCef8b034wUa5RFFwzz
 hh8w==
X-Gm-Message-State: ANhLgQ3WKQhTzZ0BnRF+CXzSs72u+TuLMB4XoIYvGrba1QNhtO11aaIW
 ex6SkETQzXhqhmApPIs+ifM7djXvJpw=
X-Google-Smtp-Source: ADFU+vvdgyGm8e9DyEgS1OLPAo5J1Joe2bykZrTzguWKRfFyOILYrO1Ns0BDB9Zob2YyLKurNCb9gg==
X-Received: by 2002:a7b:ca58:: with SMTP id m24mr532395wml.129.1583188035712; 
 Mon, 02 Mar 2020 14:27:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:14 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/51] drm/bochs: Drop explicit drm_mode_config_cleanup
Date: Mon,  2 Mar 2020 23:26:08 +0100
Message-Id: <20200302222631.3861340-29-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead rely on the automatic clean, for which we just need to check
that drm_mode_config_init succeeded. To avoid an inversion in the
cleanup we also have to move the dev_private allocation over to
drmm_kzalloc.

This is made possible by a preceeding patch which added a drmm_
cleanup action to drm_mode_config_init(), hence all we need to do to
ensure that drm_mode_config_cleanup() is run on final drm_device
cleanup is check the new error code for _init().

v2: Explain why this cleanup is possible (Laurent).

v3: Use drmm_mode_config_init() for more clarity (Sam, Thomas)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/gpu/drm/bochs/bochs.h     |  1 -
 drivers/gpu/drm/bochs/bochs_drv.c |  6 ++----
 drivers/gpu/drm/bochs/bochs_kms.c | 14 +++++---------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bochs/bochs.h b/drivers/gpu/drm/bochs/bochs.h
index 917767173ee6..e5bd1d517a18 100644
--- a/drivers/gpu/drm/bochs/bochs.h
+++ b/drivers/gpu/drm/bochs/bochs.h
@@ -92,7 +92,6 @@ void bochs_mm_fini(struct bochs_device *bochs);
 
 /* bochs_kms.c */
 int bochs_kms_init(struct bochs_device *bochs);
-void bochs_kms_fini(struct bochs_device *bochs);
 
 /* bochs_fbdev.c */
 extern const struct drm_mode_config_funcs bochs_mode_funcs;
diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index addb0568c1af..e18c51de1196 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_drv.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_managed.h>
 
 #include "bochs.h"
 
@@ -21,10 +22,7 @@ static void bochs_unload(struct drm_device *dev)
 {
 	struct bochs_device *bochs = dev->dev_private;
 
-	bochs_kms_fini(bochs);
 	bochs_mm_fini(bochs);
-	kfree(bochs);
-	dev->dev_private = NULL;
 }
 
 static int bochs_load(struct drm_device *dev)
@@ -32,7 +30,7 @@ static int bochs_load(struct drm_device *dev)
 	struct bochs_device *bochs;
 	int ret;
 
-	bochs = kzalloc(sizeof(*bochs), GFP_KERNEL);
+	bochs = drmm_kzalloc(dev, sizeof(*bochs), GFP_KERNEL);
 	if (bochs == NULL)
 		return -ENOMEM;
 	dev->dev_private = bochs;
diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index e8cc8156d773..7f4bcfad87e9 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -134,7 +134,11 @@ const struct drm_mode_config_funcs bochs_mode_funcs = {
 
 int bochs_kms_init(struct bochs_device *bochs)
 {
-	drm_mode_config_init(bochs->dev);
+	int ret;
+
+	ret = drmm_mode_config_init(bochs->dev);
+	if (ret)
+		return ret;
 
 	bochs->dev->mode_config.max_width = 8192;
 	bochs->dev->mode_config.max_height = 8192;
@@ -160,11 +164,3 @@ int bochs_kms_init(struct bochs_device *bochs)
 
 	return 0;
 }
-
-void bochs_kms_fini(struct bochs_device *bochs)
-{
-	if (!bochs->dev->mode_config.num_connector)
-		return;
-
-	drm_mode_config_cleanup(bochs->dev);
-}
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
