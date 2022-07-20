Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBEF57BA75
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90458F587;
	Wed, 20 Jul 2022 15:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA8E8F49A;
 Wed, 20 Jul 2022 15:33:37 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id p81so14580948iod.2;
 Wed, 20 Jul 2022 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HN3qot2GrUhrFIok0Aix4opho8tmQ6OyHPXteIcerns=;
 b=Mgn450JZAE1TLgyGrg0lj5BHLXdnbdkR55Et6vt2QZmZXI3m815ZxaI7GYNCfkuuo+
 60DNpzJ0rBeXpVEbUWkozOzSrFptAZU9+sBxHreCg9qVA0XtruwkwcOncrllkUZMet46
 qOeiOsDQNyAHx5mGvl0IC20lza3jcAbn2AhLNpAJPFDT+rpbuAyKqzOM4eqcG1dDmLib
 ZVR30eSlU6GIsGNbS/FoHjoIs9Hj7IKznzNC/9XstMMWngRB3X5J6GYXIgoKpRZXLH7g
 QogZx5bu3a2662Rw/kBMZsy641i2DcPCJNhjNrmm71Pq7QuqhQNpQdU6UJVWtcQZRC4h
 s+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HN3qot2GrUhrFIok0Aix4opho8tmQ6OyHPXteIcerns=;
 b=PjNRWMCGmFpXA8bcAhMRgPiuhz/6LvwxxMUmhpAY58rqnQGr0tMOvc+BSLZVpSZZMa
 hchL9CXYtBafbCa+5+BjSrLBDlTRip9SooN+nCq3fc5lz+0F01ejc1zG24jfNCnf2GCK
 O807E/7DV2WmIoDG0Jg3pnJAGXF3or8xjxCsCmfORoKIQg4+TsXxGeGU+ZwQOXOgfh6z
 bk9saWpbrDYvEpCzUkRyMsGed3KQhbeykNHe03z5augUZOsNuvSvSO+PQ3hLz+UzVxir
 QcNyJVZWOcwuE5vojmwuxjfuTE3ZYOaEpXY+GbxZ5EGQ30Q7ERCq2SuZy3xoR/DvkgUg
 FFzQ==
X-Gm-Message-State: AJIora+hjRk+1VzCoq6Xq+uCnncfQThC3p3P5/6hH5iYG3fUC/9HhI1o
 bYh4Ggczt+xr11etED99OFZSYirwaxOvWw==
X-Google-Smtp-Source: AGRyM1stV7A9LhYYFN6S9kAE9tJI/kM9QrG0d533zOjUcL9QWmgGLRV71wwwZG9rU4km1iRJ/AQsZg==
X-Received: by 2002:a05:6638:130e:b0:341:5e5d:8b95 with SMTP id
 r14-20020a056638130e00b003415e5d8b95mr11027048jad.141.1658331216646; 
 Wed, 20 Jul 2022 08:33:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 37/41] nouveau: adapt NV_DEBUG, NV_ATOMIC to use DRM.debug
Date: Wed, 20 Jul 2022 09:32:29 -0600
Message-Id: <20220720153233.144129-38-jim.cromie@gmail.com>
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

These 2 macros used drm_debug_enabled() on DRM_UT_{DRIVER,ATOMIC}
respectively, replace those with drm_dbg_##cat invocations.

this results in new class'd prdbg callsites:

:#> grep nouveau /proc/dynamic_debug/control | grep class | wc
    116    1130   15584
:#> grep nouveau /proc/dynamic_debug/control | grep class | grep DRIVER | wc
     74     704    9709
:#> grep nouveau /proc/dynamic_debug/control | grep class | grep ATOMIC | wc
     31     307    4237
:#> grep nouveau /proc/dynamic_debug/control | grep class | grep KMS | wc
     11     119    1638

the KMS entries are due to existing uses of drm_dbg_kms().

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b2a970aa9bf4..f266cd6b0405 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -39,6 +39,7 @@
  */
 
 #include <linux/notifier.h>
+#include <linux/dynamic_debug.h>
 
 #include <nvif/client.h>
 #include <nvif/device.h>
@@ -264,13 +265,16 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 #define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
 #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
 
-#define NV_DEBUG(drm,f,a...) do {                                              \
-	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+#define NV_DRMDBG(cat,c,f,a...) do {				\
+	struct nouveau_cli *_cli = (c);				\
+	drm_dbg_##cat(_cli->drm->dev, "%s: "f, _cli->name, ##a); \
 } while(0)
-#define NV_ATOMIC(drm,f,a...) do {                                             \
-	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+
+#define NV_DEBUG(drm,f,a...) do {					\
+	NV_DRMDBG(driver, &(drm)->client, f, ##a);			\
+} while(0)
+#define NV_ATOMIC(drm,f,a...) do {					\
+	NV_DRMDBG(atomic, &(drm)->client, f, ##a);			\
 } while(0)
 
 #define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
-- 
2.36.1

