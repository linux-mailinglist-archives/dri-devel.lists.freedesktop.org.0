Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7386858B231
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4E8AD9C3;
	Fri,  5 Aug 2022 21:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4EFA1A61;
 Fri,  5 Aug 2022 21:54:56 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id d139so2864275iof.4;
 Fri, 05 Aug 2022 14:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=biCdDG3hgO3jLiBuVTkyAcrTfguva6XGgr+3k3kyQtA=;
 b=pHnMQq3haUq9GMLZ0ynr5l3syQtI6afCrVEI6lsWXN81GTRcVJy5Cn5+BSQeHOJ4o2
 9gZqTfnSpDehgvg/rGF5irUFyjyxfzLmZUR+Eha8hJBP9DuHTmPK6X+ndg4HKd15q1JS
 sCS+iaTIxAIBXM/d/yqQOcV2Wic1kg1qjTsLdnMCK4uUQ46j9b2c41zHAShKJKRC7/8Q
 0/bJav19LeFkkifQi2og+BnCOWIRgDfFEVmcyRgFXmKHggODr+d4k1vSrxLtT5YN9D9D
 8xTVooc+6ro8Kz6O+2CSLdhD+hk1I2lefgilIfI61+huZYmAOZXha4ZiAn5QO/KRv+fP
 Q9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=biCdDG3hgO3jLiBuVTkyAcrTfguva6XGgr+3k3kyQtA=;
 b=t4+AiNf2V8BtAzoga7bI41pzMVVfdz9D7jA1sX+k/3dZHdKVqP/9OQEPmLEuWfqmmO
 Kz1YwMDCkik6VyoKwLSGn2y0tIgRowkzESVJxUDeJx9p/SCoF9wZglWTA7Me74C119Q6
 fj8U99kawyLB5jRgp7L01QACiMHt1zN4XM/UEE8Ep0Yk+W1w7aBR0DbXsJ3CmaDUn8jq
 5ZGyIp6o8t/7G8cplsXnC6rQjZnofv5Chr/1RQMGM107Hc8G5IE9OBMX9wQbyGxg1pQ3
 GAjLzNo1aon87uGZjEwuzMfvwKSj8zIL3i775rrdxhYph2uihwbXn7dOfG9PhVw5XYOH
 iu3w==
X-Gm-Message-State: ACgBeo3v+JgqqM38c89X+8jCZ3tMBXnbA76IhglCC5uhPtrksxNydGm3
 BQJ4y0Q9wLvmtYr4w0Q/x6U=
X-Google-Smtp-Source: AA6agR7o9yyEcyXzO2ABPft0K9eQpztTLUpOdyg5+NkeVd4bjtaZXLFgtityexVYW5cT+1534AxQqQ==
X-Received: by 2002:a6b:5f03:0:b0:67b:ef4d:e3ed with SMTP id
 t3-20020a6b5f03000000b0067bef4de3edmr3759281iob.45.1659736496145; 
 Fri, 05 Aug 2022 14:54:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 32/33] nouveau: adapt NV_DEBUG, NV_ATOMIC to use DRM.debug
Date: Fri,  5 Aug 2022 15:53:54 -0600
Message-Id: <20220805215355.3509287-33-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
2.37.1

