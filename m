Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0AA21B05D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE906EB74;
	Fri, 10 Jul 2020 07:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFA16EB73;
 Fri, 10 Jul 2020 07:42:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 22so4957993wmg.1;
 Fri, 10 Jul 2020 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w+AOncTOyKiyuTn+z9vgFWVxiOOP/Vbkgsqc1OQWgTo=;
 b=DZvMaIi/1zqx4BTT1p4cA36/s8skYa2Q1fA9hpzlupCetFiGTB94N05SaGHW33NXv2
 EnthAbu/pUrvTxNuomR4EOezB60PjEHIY0bznzG6uddmDmobUVAW4IP4sF9YGNezQ3m/
 VkIuVF6yQb33usZ9WCz+rNZiSta9K5MBr69Awsi3AOSo4wTXhSiwx3v1ZakZ09px8hLC
 axqVR8dlEzSaz5KAqswUZesWNTujgN7PErjjeyqmP4Oy3XYCQpK4ikp2LdR6b9RY8DPQ
 JYIo/WWRUGlZzdafTpu+26JKDU4TrVc1Fh9niUzUqpEXU4u700TTwysRtwGWW9NZ8TCc
 xcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+AOncTOyKiyuTn+z9vgFWVxiOOP/Vbkgsqc1OQWgTo=;
 b=XRyxuYH54cMmb+8TzoVi7rPZMRGfGZ/SNdh2TD+j/WkZYBf28zkdjRHXqigxTtn9DJ
 eIXVWL/iINFvBEIV9s5rCkD6vm6U4N6CHt1Qbpf70tjYm+GlKfyDBvgxaBz23ux0n1tV
 exDZDuCPo8YKNKglye/BKPcXl0NRqnfm9ZJ4t8SINcCgxWSY7QsXnLIEErtgFVIE6kjD
 kp2PHlwnBaQstot9GejIzV+ymwSD/yfzG0BLFD6niJEU5F/mh/aDwhNPdGCLaFdrKMWl
 /WwS7QXc65aHY7CNSYQHDTfKsxwo6WC63gSVrh1v3PkZG9mdtQ5ST8unoBts1hYu9pmh
 nMdg==
X-Gm-Message-State: AOAM530USUk0OT0S8dQIDnhTRZ1rsc9/BDprU4sT+tfEFXXvemA2swd1
 N7oENpC5hYso8QWcQynWv8U=
X-Google-Smtp-Source: ABdhPJzges5pbexyT7tU6s1WoJWZQszHJ53HKcnVVAWTRDzbSkuC0R6MlLDQP9pBymxFWVhqYXuMaQ==
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr3800834wmh.130.1594366925820; 
 Fri, 10 Jul 2020 00:42:05 -0700 (PDT)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id p17sm7951375wma.47.2020.07.10.00.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 00:42:05 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/etnaviv: add simple moving average (SMA)
Date: Fri, 10 Jul 2020 09:41:24 +0200
Message-Id: <20200710074143.306787-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710074143.306787-1-christian.gmeiner@gmail.com>
References: <20200710074143.306787-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>,
 cphealy@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a SMA algorithm inspired by Exponentially weighted moving
average (EWMA) algorithm found in the kernel.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_sma.h | 53 +++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_sma.h

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sma.h b/drivers/gpu/drm/etnaviv/etnaviv_sma.h
new file mode 100644
index 000000000000..81564d5cbdc3
--- /dev/null
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sma.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Etnaviv Project
+ */
+
+#ifndef __ETNAVIV_SMA_H__
+#define __ETNAVIV_SMA_H__
+
+#include <linux/bug.h>
+#include <linux/compiler.h>
+
+/*
+ * Simple moving average (SMA)
+ *
+ * This implements a fixed-size SMA algorithm.
+ *
+ * The first argument to the macro is the name that will be used
+ * for the struct and helper functions.
+ *
+ * The second argument, the samples, expresses how many samples are
+ * used for the SMA algorithm.
+ */
+
+#define DECLARE_SMA(name, _samples) \
+    struct sma_##name { \
+        unsigned long pos; \
+        unsigned long sum; \
+        unsigned long samples[_samples]; \
+    }; \
+    static inline void sma_##name##_init(struct sma_##name *s) \
+    { \
+        BUILD_BUG_ON(!__builtin_constant_p(_samples));	\
+        memset(s, 0, sizeof(struct sma_##name)); \
+    } \
+    static inline unsigned long sma_##name##_read(struct sma_##name *s) \
+    { \
+        BUILD_BUG_ON(!__builtin_constant_p(_samples));	\
+        return s->sum / _samples; \
+    } \
+    static inline void sma_##name##_add(struct sma_##name *s, unsigned long val) \
+    { \
+        unsigned long pos = READ_ONCE(s->pos); \
+        unsigned long sum = READ_ONCE(s->sum); \
+        unsigned long sample = READ_ONCE(s->samples[pos]); \
+      \
+        BUILD_BUG_ON(!__builtin_constant_p(_samples));	\
+      \
+       WRITE_ONCE(s->sum, sum - sample + val); \
+       WRITE_ONCE(s->samples[pos], val); \
+       WRITE_ONCE(s->pos, pos + 1 == _samples ? 0 : pos + 1); \
+    }
+
+#endif /* __ETNAVIV_SMA_H__ */
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
