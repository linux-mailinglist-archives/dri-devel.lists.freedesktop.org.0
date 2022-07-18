Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D965D577BCA
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D65A9DFB;
	Mon, 18 Jul 2022 06:40:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E800A9D7E;
 Mon, 18 Jul 2022 06:39:23 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id c17so4570798ilq.5;
 Sun, 17 Jul 2022 23:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HN3qot2GrUhrFIok0Aix4opho8tmQ6OyHPXteIcerns=;
 b=q6qd53l15atKlSnsom1w8BsHyKrz6ageai9NjegY9eRscqNA2AU4fKIP55xVg2TaGX
 ThKwEDin+rS2trYlxADPzQ19FokVXgeK/EebBplBUXhl2fu/PWmBW5gPdDCB403EIQEI
 NqoSFG03Z5//x7pJoj+i4+wonze4fLNMX9lb0EwkuO0t4C+fQMD4evOo7i06T8M86TPz
 PQfOZPFcViPcrRTQvh7HOV05uCVAAEd1QGUmw/pIy8IB+dvUdY48DlN9TN6fsGFu/D6e
 DADGIqxAoTKzt6CSr6LLB+RRmdEU19n0ZW3CYv1q61lITv8ozkU9Hp53E2ZOfn2iGAdy
 xoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HN3qot2GrUhrFIok0Aix4opho8tmQ6OyHPXteIcerns=;
 b=rw2iZWKQtBJuQXKcaDV9/538c8xqGFU6dMENsB3NTk60abz5owGZZ+3NNVQjdVqx6s
 jWvDRsWm1xLDSO4oJrRMrR+cjVALzDedXZptxh2/SEY7O6PBcCAGZhSUeLWLQ6HTuJsx
 HT9S3W2DQ01UoxThyPB+MZK85hbJlMgbpdyj8CEQo5Ijg9FL7KZeGBzhRX72Ut88RQXv
 8arcc/Ysx/WKnYitDRqr6Al33PVAOEPmURhxNAtidFrx7+mfImtUklZVDu4BXXJyN1Dr
 u5Zb3HLbxMplaYA45X8BEdFCfVtHR4yu1YE2OUYdwcYK8jzUA0k0kffkO2hBWOx+WKJf
 bIWQ==
X-Gm-Message-State: AJIora+W7NgXKWUAu6JchH0iRcpkB20FMjK+eDmejIWcDfe7OXsF3CKM
 Qo+Q9IRyE0T3saXQ+es/bkkaLhqqoK4=
X-Google-Smtp-Source: AGRyM1vdQx2MgfQwxdpvJvwLR9HSyGX1272Wpn8Kp6v8PryF+XNjS41cTaO19/JOyA6AUd+lsKJJuA==
X-Received: by 2002:a05:6e02:194d:b0:2dc:6c56:a522 with SMTP id
 x13-20020a056e02194d00b002dc6c56a522mr13171305ilu.203.1658126362656; 
 Sun, 17 Jul 2022 23:39:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:39:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 37/41] nouveau: adapt NV_DEBUG, NV_ATOMIC to use DRM.debug
Date: Mon, 18 Jul 2022 00:36:34 -0600
Message-Id: <20220718063641.9179-51-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

