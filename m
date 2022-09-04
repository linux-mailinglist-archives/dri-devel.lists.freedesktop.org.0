Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9E95AC797
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED5B10E38A;
	Sun,  4 Sep 2022 21:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDA610E1BE;
 Sun,  4 Sep 2022 21:42:41 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id b142so5642372iof.10;
 Sun, 04 Sep 2022 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=8gwyhoydIHSfwTTFYi0xd/UEVRo5zT1WMZJS4KZ9ukE=;
 b=Oj7Ixl6oj9kg3JhT5hX2YNpqFWBWrRAemLR9ZyRiH8YKxlEL1JbyYUePKaIrZAL5jf
 1WolreEcW4UQ85oE8rIFcQKM9Y8DgXov3VdkOuxIChkt3b8QQ86vavL7yfZdfnG1GXrG
 DieSrzFFZkksP5SG7xHoU2NUtwtLwxXiHtZdjYdGp0A0SfFIYvtv5K3SHQproh7ZaK9g
 fFJF5WVYv4z4A9NBf1N+h/WwX6chGYIEj2Ni0q0zS2lPBsAWNrYRKNiDRgERv8ZCLA+5
 CocXeZEZ1Rn3EM+S6VnFtLemc62uByDMdXXT71Ilig4RAz83otTF0UG6qgEF5wkzDQpI
 548g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=8gwyhoydIHSfwTTFYi0xd/UEVRo5zT1WMZJS4KZ9ukE=;
 b=lrv9lbQfZIm95JGLjvFVRIlUvKmMlxbADfT8f0t62rBx+GRBIPMh3SAyNZzgVoKYNr
 NWH6camU1Qfvf44nQOaougVEs7ncZdISqwNoTbDg5UrzBD1xo/FY131nUawf7ZqBajGu
 VXkleJnMl5LYq4TqWY8TsTf55Hfwtr4VZOo0DvpyhlnCrVRbEIAAuR1vZgxiO3T1YLDo
 eztw+ZbPrQoXsavyzZBcgm4xCACiI9YMAYcqiB3WMkSJMXKdqZNJizY2jhtZoAmHIzWs
 JHQQIyVLQNexPMjwRcV4E7NkzL2fhbjk8XcjTNCoPoIezRWwSOiAXDvltUwU8thbWk0x
 UjzQ==
X-Gm-Message-State: ACgBeo0Kxp+i8r74aO10F9kLwXU6yv79IhECPEcTwG5FGryCbNngj9SC
 fBdUe3KsVMG8ZSI6jb+UDoY=
X-Google-Smtp-Source: AA6agR7YcRBN9eLsdX3bzp79/kQqCn5Cue7Lw5y+W0FC6PDyqlsmvwF4ziOCRLDCU+BO8di3xE1W6A==
X-Received: by 2002:a05:6638:d06:b0:350:a613:f7ec with SMTP id
 q6-20020a0566380d0600b00350a613f7ecmr3859829jaj.169.1662327760724; 
 Sun, 04 Sep 2022 14:42:40 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 32/57] nouveau: adapt NV_DEBUG, NV_ATOMIC to use DRM.debug
Date: Sun,  4 Sep 2022 15:41:09 -0600
Message-Id: <20220904214134.408619-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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
index 84df5ddae4d0..3b8a76004b57 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -39,6 +39,7 @@
  */
 
 #include <linux/notifier.h>
+#include <linux/dynamic_debug.h>
 
 #include <nvif/client.h>
 #include <nvif/device.h>
@@ -263,13 +264,16 @@ void nouveau_drm_device_remove(struct drm_device *dev);
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
2.37.2

