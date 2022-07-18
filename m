Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E85A4577B70
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9DCA9CFD;
	Mon, 18 Jul 2022 06:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A19A9CC6;
 Mon, 18 Jul 2022 06:38:44 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l24so8517031ion.13;
 Sun, 17 Jul 2022 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZbYvD7pJXDxjfsN+JYVR2+qF0bIhodb6pVaemEpRTA=;
 b=DVfDSAp6lTbMSFPvkbjehOZ6LZJElB5FrtozBMZPeYQaehZ0jMu2pGyXPkCXBiYr/l
 KTYn1PWEufvvtIAWygJEiuei4vNm7urPTkmMdcjUeO1Dd3/bwKSp6Z5YBbjOaIcXIic4
 X6Gdt2D8zhap98SR9eWnyV3tLXRVCvoosICwDcykgTaPlTul5RaxJxm1yU2Izp+g8g0V
 ldLoHvqT8gYeUktw8FZ0XNjqCcGxDZGsSoVg9m71J8xUqfmaQDxMuebD+ssLyDKtRMN0
 YTjJLEhVPXaKfasM9eNxN88qzHy1iYuXoHKFyukkyq0ZQOj90Vbv/fSnb4aV8AYXE1qA
 Yp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZbYvD7pJXDxjfsN+JYVR2+qF0bIhodb6pVaemEpRTA=;
 b=yiyIa1H4dPMcJGyu/e4/SBmo32MN3UD/Y+J3347ERoN6AeIrS7LALd/3JKnHjSEPYR
 CLrRZwOmCdNHLonNMt7f1+bjhpg5PdK4YU1FBRMqe8c3HyvatQM/87j5iYU6mjIR5k8t
 3Bt4ZXudcC3I3LHqEcBQxbvp8e20tFbdtgZ51tZorDCs54G5iNPwqkjqLb0hf8bOrrXd
 ekWl/olBPW6Ou6XOTahDLskyuhj8c7UZbV65REkF90XXqqWI5KOn6f5NK8ZLkRZGf1Rg
 +SKr8by8gky+fVVewGWO33Khm/RrEnDouaH+rwVwQAGqZqSqIi0Uq+zibf6L4Zz9y0fD
 +lYQ==
X-Gm-Message-State: AJIora9aInreA3a3102xwL2+bS7j65u0CEDXM/RUjp+R57hCi0WrncYd
 BnsmW6CXLUl/apLEtbiZ4vx5FNPMDd4=
X-Google-Smtp-Source: AGRyM1ve3HEn0xSuO4XS/cO+T0gvt9rKJGOiZa15RwoYtQgDmzTVvFd1e2yJmy5rBcYAtyRJAWNfDA==
X-Received: by 2002:a05:6638:304a:b0:335:ba01:8be9 with SMTP id
 u10-20020a056638304a00b00335ba018be9mr13944818jak.273.1658126324219; 
 Sun, 17 Jul 2022 23:38:44 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 22/41] drm_print: interpose drm_*dbg with forwarding macros
Date: Mon, 18 Jul 2022 00:36:06 -0600
Message-Id: <20220718063641.9179-23-jim.cromie@gmail.com>
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

change drm_dev_dbg & drm_dbg to macros, which forward to the renamed
functions (with __ prefix added).

Those functions sit below the categorized layer of macros implementing
the DRM debug.category API, and implement most of it.  These are good
places to insert dynamic-debug jump-label mechanics, which will allow
DRM to avoid the runtime cost of drm_debug_enabled().

no functional changes.

memory cost baseline: (unchanged)
bash-5.1# drms_load
[    9.220389] dyndbg:   1 debug prints in module drm
[    9.224426] ACPI: bus type drm_connector registered
[    9.302192] dyndbg:   2 debug prints in module ttm
[    9.305033] dyndbg:   8 debug prints in module video
[    9.627563] dyndbg: 127 debug prints in module i915
[    9.721505] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
[   10.091345] dyndbg: 2196 debug prints in module amdgpu
[   10.106589] [drm] amdgpu kernel modesetting enabled.
[   10.107270] amdgpu: CRAT table not found
[   10.107926] amdgpu: Virtual CRAT table created for CPU
[   10.108398] amdgpu: Topology: Add CPU node
[   10.168507] dyndbg:   3 debug prints in module wmi
[   10.329587] dyndbg:   3 debug prints in module nouveau

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 10 +++++-----
 include/drm/drm_print.h     |  9 +++++++--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index 44be95fac164..21b416af0be2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -279,8 +279,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -301,9 +301,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -320,7 +320,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 
 	va_end(args);
 }
-EXPORT_SYMBOL(__drm_dbg);
+EXPORT_SYMBOL(___drm_dbg);
 
 void __drm_err(const char *format, ...)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 668273e36c2c..c429c258c957 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -335,7 +335,7 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		 const char *format, ...);
 
 /**
@@ -384,6 +384,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
+#define drm_dev_dbg(dev, cat, fmt, ...)				\
+	__drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__)
+
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
@@ -485,10 +488,12 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  */
 
 __printf(2, 3)
-void __drm_dbg(enum drm_debug_category category, const char *format, ...);
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
+#define __drm_dbg(fmt, ...)		___drm_dbg(fmt, ##__VA_ARGS__)
+
 /* Macros to make printk easier */
 
 #define _DRM_PRINTK(once, level, fmt, ...)				\
-- 
2.36.1

