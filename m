Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F43FCE79
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 22:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10B8899EA;
	Tue, 31 Aug 2021 20:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E366E0F0;
 Tue, 31 Aug 2021 20:21:48 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id b7so588912iob.4;
 Tue, 31 Aug 2021 13:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L+08hq9MDL1yzT8HxFNaQNtrlEM6Xv6fhZuNRn1F1mc=;
 b=kkg/vsJwa/PC9gwR6TjotF0CzvHRDa/wuXMq9HtcCwPhn1g2Qx8JJRgXcybbEg67Jh
 pVs6K3PIw1uNZjI8XQTu7Gtu2rAgJyLE3S5fqrjQn/gMx+Y+ZO5dzNZ0DPUeD6YISBEy
 TG2cM2xh57GL/+uZmpfJRK2sRGyI0rb9Bs14sl0GkLes6WrhB4wj4vZvj6dOBBEzdlaG
 5tejIMovQXK8GpOcVIzJi8bR0T/1clUcGK/JHxg+3kfVG8T5AUOiTcBh0wzfwmTQICTb
 50e4FgMlhKbkfsSHYjgKlmdQFZwHO4m0OmtQizYHYx42HivYCa029Jn1NkPAE/Dw4/qN
 cn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L+08hq9MDL1yzT8HxFNaQNtrlEM6Xv6fhZuNRn1F1mc=;
 b=iCVUuxoSVswEYo6HssFsAmV2+tZING2Ea6RRmX/lmtSxHaWlBT3+GJhU5Q+kaFsWSS
 2//cWwJTH1xkPLD+y6UA2oktOXxoo2/I5UytwWLHp1QEr6zC0rmvFIYus+XGsVhOF148
 Ye5QDJyW/PdShG6CqP2Nh4Smw9Tiyc4iwPuTp/4TFaUygeJ8B2AGPQDgzipVjRuVcQQh
 Y/vIfgTPGdYUdJSsQbLprr6KlHGh2bXHdwpuxe/AH7utGZG/WuQ/GGCJdkO7dtoDxeTX
 EMKU8aqhQv/NqURdqONJYIlArHbB/Ws/8S+b07r1swzGWyAz7/+PhhKBCFLNwYZwH/G8
 Gdag==
X-Gm-Message-State: AOAM5313Z0zzmf71ORyFCliIOyDgE7jWXv+067oUqY40Mt28fPGPKvmZ
 L2OcuS8G/GXe5Fi/5ybl6YYoBICD0hc=
X-Google-Smtp-Source: ABdhPJzGE5W/brNtojRAI3ODL+k+VqSv5/EuvNY5lJztWnokfQOk0zya7SQYN7UHGJl6it18QB3GDQ==
X-Received: by 2002:a05:6638:1613:: with SMTP id
 x19mr4431178jas.77.1630441308243; 
 Tue, 31 Aug 2021 13:21:48 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id u15sm10597384ilk.53.2021.08.31.13.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Aug 2021 13:21:47 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v7 8/8] nouveau: fold multiple DRM_DEBUG_DRIVERs together
Date: Tue, 31 Aug 2021 14:21:33 -0600
Message-Id: <20210831202133.2165222-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210831202133.2165222-1-jim.cromie@gmail.com>
References: <20210831202133.2165222-1-jim.cromie@gmail.com>
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

With DRM_USE_DYNAMIC_DEBUG, each callsite record requires 56 bytes.
We can combine 12 into one here and save ~620 bytes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 36 +++++++++++++++++----------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ba4cd5f83725..0f45399535bf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1245,19 +1245,29 @@ nouveau_drm_pci_table[] = {
 
 static void nouveau_display_options(void)
 {
-	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n");
-
-	DRM_DEBUG_DRIVER("... tv_disable   : %d\n", nouveau_tv_disable);
-	DRM_DEBUG_DRIVER("... ignorelid    : %d\n", nouveau_ignorelid);
-	DRM_DEBUG_DRIVER("... duallink     : %d\n", nouveau_duallink);
-	DRM_DEBUG_DRIVER("... nofbaccel    : %d\n", nouveau_nofbaccel);
-	DRM_DEBUG_DRIVER("... config       : %s\n", nouveau_config);
-	DRM_DEBUG_DRIVER("... debug        : %s\n", nouveau_debug);
-	DRM_DEBUG_DRIVER("... noaccel      : %d\n", nouveau_noaccel);
-	DRM_DEBUG_DRIVER("... modeset      : %d\n", nouveau_modeset);
-	DRM_DEBUG_DRIVER("... runpm        : %d\n", nouveau_runtime_pm);
-	DRM_DEBUG_DRIVER("... vram_pushbuf : %d\n", nouveau_vram_pushbuf);
-	DRM_DEBUG_DRIVER("... hdmimhz      : %d\n", nouveau_hdmimhz);
+	DRM_DEBUG_DRIVER("Loading Nouveau with parameters:\n"
+			 "... tv_disable   : %d\n"
+			 "... ignorelid    : %d\n"
+			 "... duallink     : %d\n"
+			 "... nofbaccel    : %d\n"
+			 "... config       : %s\n"
+			 "... debug        : %s\n"
+			 "... noaccel      : %d\n"
+			 "... modeset      : %d\n"
+			 "... runpm        : %d\n"
+			 "... vram_pushbuf : %d\n"
+			 "... hdmimhz      : %d\n"
+			 , nouveau_tv_disable
+			 , nouveau_ignorelid
+			 , nouveau_duallink
+			 , nouveau_nofbaccel
+			 , nouveau_config
+			 , nouveau_debug
+			 , nouveau_noaccel
+			 , nouveau_modeset
+			 , nouveau_runtime_pm
+			 , nouveau_vram_pushbuf
+			 , nouveau_hdmimhz);
 }
 
 static const struct dev_pm_ops nouveau_pm_ops = {
-- 
2.31.1

