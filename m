Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4C057BA2D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10C88F4E8;
	Wed, 20 Jul 2022 15:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C2F68F24F;
 Wed, 20 Jul 2022 15:33:23 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y2so14536084ior.12;
 Wed, 20 Jul 2022 08:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJtOb8MGNrfDuJNUjp5ciUTwfOiM98w6evAABfdr9NA=;
 b=CV6XhardL4XPy8yoKHeUOcBs43y9CCO3TftN3TwLU9lgP56a23QSLP1s9jX/Cjp39b
 D9Us8JUW//+XHfJ4f1FJVNKeojeG7POBPcF/DNFeErHWaz4FA2dBwTVH2xWJjekm7IAK
 msMG0LnlCYU4/ah+94TDTg4jXalcfXcTJutsUnbY11ruQfgjbXJWdXpPGlyGbnLthrwH
 /w6L30kYWyWfVMazQME+GrLHscbP9bUzsLN/NfseTFICWFbWsXvdhEF336mYo/MiaAmF
 KqScKdjYcR6n4Xsjpc9rKEW6PF1AadQdUz92xWXd8Rs1ef8hnHvivo+JZToyYzdARNC7
 rRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJtOb8MGNrfDuJNUjp5ciUTwfOiM98w6evAABfdr9NA=;
 b=YUBM161OSoTc+P6bogk4Jsf5sxnFY8smDMdSwvBW7Eyt9hF9a2LjjUliR2RZtU2ctz
 XyooF3yGLA//x6+A681uxSyZ2sr5dzo5zTsgTom54jy3VGx7lJv3auCrvoMErgxTzKFZ
 EpKPdYQNUDeg3q8KWx7ErbFESUWPmIwo5hOjjO1jLQiWqf7xCficvzMEK6KFa5H2kDGU
 f3s4qCtDAD5JiDnymDyCtcI1qPABwzFfYGYQt78YqOXmnTBEKVztsZtfIInR+wkJFJce
 bDjceriWV3ZZ6BgYuYiifHcR8zmhBF1V2x7kYOIjBxWzK3BAArzbmJeuBZ645xPFFyRl
 m2mg==
X-Gm-Message-State: AJIora+rjEnGGwV0yCw//9sjNo7ecF46V1gN7W5ZxmO6mPuYO6wDcM9W
 20Gw3hYt7T+04ohRtp8SFSmaRoFlMYmBNg==
X-Google-Smtp-Source: AGRyM1tuOpp3gxs9OmiC4WcpSMt9xxBIrl+T/ZLE+cjqr5PZdYOdeY3sZnxdGKRe1WvgraTKTcgcSA==
X-Received: by 2002:a05:6602:490:b0:678:d781:446d with SMTP id
 y16-20020a056602049000b00678d781446dmr18666295iov.115.1658331202340; 
 Wed, 20 Jul 2022 08:33:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:33:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 23/41] drm_print: wrap drm_*_dbg in dyndbg descriptor
 factory macro
Date: Wed, 20 Jul 2022 09:32:15 -0600
Message-Id: <20220720153233.144129-24-jim.cromie@gmail.com>
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

For CONFIG_DRM_USE_DYNAMIC_DEBUG=y, wrap __drm_dbg() & __drm_dev_dbg()
in one of dyndbg's Factory macros: _dynamic_func_call_no_desc().

This adds the callsite descriptor into the code, and an entry for each
into /proc/dynamic_debug/control.

  #> echo class DRM_UT_ATOMIC +p > /proc/dynamic_debug/control

CONFIG_DRM_USE_DYNAMIC_DEBUG=y/n is configurable because of the .data
footprint cost of per-callsite control; 56 bytes/site * ~2k for i915,
~4k callsites for amdgpu.  This is large enough that a kernel builder
might not want it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig  | 12 ++++++++++++
 drivers/gpu/drm/Makefile |  2 ++
 include/drm/drm_print.h  | 12 ++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index e88c497fa010..bb1fa20a8eb2 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -50,6 +50,18 @@ config DRM_DEBUG_MM
 
 	  If in doubt, say "N".
 
+config DRM_USE_DYNAMIC_DEBUG
+	bool "use dynamic debug to implement drm.debug"
+	default y
+	depends on DRM
+	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
+	depends on JUMP_LABEL
+	help
+	  Use dynamic-debug to avoid drm_debug_enabled() runtime overheads.
+	  Due to callsite counts in DRM drivers (~4k in amdgpu) and 56
+	  bytes per callsite, the .data costs can be substantial, and
+	  are therefore configurable.
+
 config DRM_DEBUG_SELFTEST
 	tristate "kselftests for DRM"
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 15fe3163f822..272de137d207 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,6 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
+CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+
 drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_file.o drm_gem.o drm_ioctl.o \
 		drm_drv.o \
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index c429c258c957..2d2cef76b5c1 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -384,8 +384,14 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 #define drm_dev_dbg(dev, cat, fmt, ...)				\
 	__drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__)
+#else
+#define drm_dev_dbg(dev, cat, fmt, ...)				\
+	_dynamic_func_call_no_desc(fmt, __drm_dev_dbg,			\
+				   dev, cat, fmt, ##__VA_ARGS__)
+#endif
 
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
@@ -492,7 +498,13 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 #define __drm_dbg(fmt, ...)		___drm_dbg(fmt, ##__VA_ARGS__)
+#else
+#define __drm_dbg(cat, fmt, ...)					\
+	_dynamic_func_call_no_desc(fmt, ___drm_dbg,			\
+				   cat, fmt, ##__VA_ARGS__)
+#endif
 
 /* Macros to make printk easier */
 
-- 
2.36.1

