Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799C0577B74
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBE8A9D47;
	Mon, 18 Jul 2022 06:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D00A9CD9;
 Mon, 18 Jul 2022 06:38:46 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id c16so4317225ils.7;
 Sun, 17 Jul 2022 23:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iJtOb8MGNrfDuJNUjp5ciUTwfOiM98w6evAABfdr9NA=;
 b=WYIhANiX/rnwdl1wGs8g9tolshMpjMJENKvfZ4nu+8Df+KAtVWK+gOVeMtkqVNFuxM
 xgGLFN5Nt6Vbh0bT92b0sDnEb4w6AnzbAXmZmxUX0ar1Non8iFaVUPE+pnw72UAgOhwp
 XZAs5mni6rl0mxXF2AK411mi9tegBInJ2ldLYdtmC4FC3QuSiWT/5JBm7gEbptZJtUBf
 rNCDKqZeRrS9ZAzfabRqyV0riSczrmrZG+LgrikZQTyHe0jhB4yX/MulB9yfWbq/DzUe
 QupWyJANJo3U3zrND0KlN/sOUNYNijRrJJaqUnCZmJQvluQg6FkUp68UQMMVl59WDRTR
 dv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iJtOb8MGNrfDuJNUjp5ciUTwfOiM98w6evAABfdr9NA=;
 b=RnhAiXwWR87Hi1iHpTZGfy0rf+aCNEC+yvGGE1zuXnw6MDuVx/Ayd9B9NcVfGFq3wl
 3taqyVhwTd18yeJ1i9AOVZawPs7GSedtuvWhGPh6+hcnYAEymzKsDbftsPux5Za/QEkb
 v0o9+tq/UUx9y+lx1wmzR5rTSrguJfT73Y+wWJ8kVJXyJyiixjuMfMw/PsNTJh0cY68w
 WguSb9vBAWyy8dTbLC4D0MGdChCXWhVUAMYR+jjKrSN+FtFTSrpWjB05C5AB+/RyBZn5
 /PdQWuKGPukUul0UlCT/ATU+TFaQAMtJkmbPsSoXGS1mLvBhXCPXgEOtauQEoVpgDJ9q
 JdLQ==
X-Gm-Message-State: AJIora8Itb5XaANMwZNDxZEKAQiHzpA4PQii23Ap7JbIKpckRVMjFM1G
 aEPNNALfV+d0Ryd2PV0viNij/3XcMSE=
X-Google-Smtp-Source: AGRyM1vgNV0Aih9Ut/mUoy7UDugZ2ZlpeWghK1hcW1/ieZ1xjM0F8ouC8yLzdpCK5zNz55sG34Vk2A==
X-Received: by 2002:a05:6e02:20e2:b0:2dc:88c6:f03d with SMTP id
 q2-20020a056e0220e200b002dc88c6f03dmr13341989ilv.35.1658126325991; 
 Sun, 17 Jul 2022 23:38:45 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:45 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 23/41] drm_print: wrap drm_*_dbg in dyndbg descriptor
 factory macro
Date: Mon, 18 Jul 2022 00:36:07 -0600
Message-Id: <20220718063641.9179-24-jim.cromie@gmail.com>
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

