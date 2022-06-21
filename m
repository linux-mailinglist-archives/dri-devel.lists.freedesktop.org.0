Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31754552BAF
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABAE112434;
	Tue, 21 Jun 2022 07:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D582112434;
 Tue, 21 Jun 2022 07:21:16 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ay16so6155013ejb.6;
 Tue, 21 Jun 2022 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/EcOWoOuIse/hvQ+oqlKU0lIbd1LkUUo/9oXAhtRbA=;
 b=LbqdqeXvHaDpcKkgE/5jv+iHaxhFG8nHt/LObC0/wQM2dlGqKWQOjxpybNl5ITV3iq
 x1Q21GlBZTG7ZRClnkl/fwWPfdFoVI6CEVRgLoOZIWpXmF/dC9slhtFk8kouyhUVDAsM
 afEUozQ9hP7y5yXYOx0YTjKr9uRDE2mvy1J7CGdIqPHY0ohi53Qny8COHRDq3l0ARJdG
 12/Gs94gSu6Ku1rAh3V7dWRL4xuk+UGyqh2hJqu0lAdXrQHwiWI/UOt+j4KM4w5jUg4Y
 DIAeoPToqPDmBke/w9hrwvmD3qn6L2zggRtq+yt646Z1mOnLwW3AZUD37Qk113pKiMsk
 bmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/EcOWoOuIse/hvQ+oqlKU0lIbd1LkUUo/9oXAhtRbA=;
 b=yaTFKw+6sPdXS9iTFkEw/Gka1pCDVyTz7Zo0MY4HkPwpTMTgP1V6QauZNFhXYinF5/
 lQGuv8sDq34LWZrP35NaUS3v+WX3avK+0qjlvsMT6YZyTYHSVD6AYV0vK6efuI5sGn5s
 yaHc7w9XPEHpBINN6x62ac6wZn0rI7Vj//ESBiU9hJ5k2npVpNPvRPpzO3QXbcC8/Hz0
 ydUZECDFN+D34tNgLzDKQpSS5cdjd4hXIlUxOwnR9zLqpcefIC982PlbewuPvjVTXTPN
 Y7AX3w9qxOoRqkSVbJpFYnqaUyOQL7D07LJepYzwpuc7MfyahXQxsz9/y2aBVJAv6iTX
 DUBQ==
X-Gm-Message-State: AJIora9lUzwTtcBCdFeKy06EwGcDJ5MmiKibLh+t2qgqWI/J1B+uUpQH
 IElNA6xzNCr7+5l+wO0V7zI=
X-Google-Smtp-Source: AGRyM1vmykp6H3Y7haeFNYSTgDp2SeGPwB5hGbzrZ2Avqa/HZIDol+cs2KIbjm2MU5/hGGmzXs8DNQ==
X-Received: by 2002:a17:906:51d6:b0:712:c9:8a1b with SMTP id
 v22-20020a17090651d600b0071200c98a1bmr25086132ejk.656.1655796074886; 
 Tue, 21 Jun 2022 00:21:14 -0700 (PDT)
Received: from localhost.localdomain.info
 (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a17090653c100b00722e771007fsm50711ejo.37.2022.06.21.00.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jun 2022 00:21:14 -0700 (PDT)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/etnaviv: add simple moving average (SMA)
Date: Tue, 21 Jun 2022 09:20:47 +0200
Message-Id: <20220621072050.76229-2-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621072050.76229-1-christian.gmeiner@gmail.com>
References: <20220621072050.76229-1-christian.gmeiner@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
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
2.36.1

