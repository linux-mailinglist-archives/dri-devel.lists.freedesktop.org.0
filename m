Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A39A529459
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B89110EBD8;
	Mon, 16 May 2022 22:57:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF2310F1D1;
 Mon, 16 May 2022 22:57:25 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r27so17636471iot.1;
 Mon, 16 May 2022 15:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Yg0hfvp+BmxcSgu8fytrAqr0N0fDhKY5AcGJ541Vt4=;
 b=dWGN52/uMGZPLCm9DAsNSwPc8WDoRa3MYIYpBLVuktftVDHdPBMXzNT7bw2NK0d4QS
 tlhq8uqKcYP0mA6rGrTCTtTBiRhSsZjmBR2XPxSitUdzeTvpDCY20jEdPMFkf4Mgzq6I
 kAbXN0hkZ4gyh2r/JibCVdwOUb0/AVVYsgy6sM6Ft1mYm+TlpAzL4/gWLcDorVFGbpsy
 lQhpLGDETkmyJEwojdA6Oh8QbWss1EXi6Q56FFGC5NtiuISvtwH9211qeYOYIlGot7PW
 WnOCxK8TL5nmKm2N6HncMik7pqaTmbF+vILYMXfnFs/cP/LzybB7fg0TW2u+XHA6Ib70
 USSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Yg0hfvp+BmxcSgu8fytrAqr0N0fDhKY5AcGJ541Vt4=;
 b=6Lg4xvkbUBFXBVRKFkwEzvRSLQCJV7nvCZjKcrd/LsAscIyrsVpIUs59FkahYrfUrc
 Ju9HLdA2lnpfmP65WWAOGyZ+cdljfd+2Qcrn9KuDcMwVtz16+Qi0bL9oCOtwu4k23wyp
 JD2oJ6YgU5clzt/jKknR+NRABAVC3TzDpAKxbKjjQT5rMFe2407tYKEJhCu/5DeIlpYw
 N6nuVmTnIXF5AbJuhGc3NNAh7RRqzF797PI17I6CfxxGIHmL0h9EB7PM+QgwLdpaqbMI
 +UGzfMwTPxNl4KnJayGMmTQOcq2fMozHRkmcWMd6SCXNcJuT1d42pwXzUjnAv2MMHa0K
 oBGg==
X-Gm-Message-State: AOAM531fTnjqBOffY6FQGsxH4hS600FrN6cJKat3cbp/Y/Q5V/4yXx2i
 PwZsBGwazXRqH9JV0dGllkI=
X-Google-Smtp-Source: ABdhPJyCiUxiMjcIl4lKkntDnVrLc+KJKSwf9tOnaQ9S/++Hg+2TbTnp5ybSIf+mrEvURBO/J3FHSQ==
X-Received: by 2002:a05:6638:24d6:b0:32b:e72d:1a33 with SMTP id
 y22-20020a05663824d600b0032be72d1a33mr10309855jat.226.1652741844567; 
 Mon, 16 May 2022 15:57:24 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 19/27] drm_print: wrap drm_*_dbg in dyndbg descriptor
 factory macro
Date: Mon, 16 May 2022 16:56:32 -0600
Message-Id: <20220516225640.3102269-20-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For CONFIG_DRM_USE_DYNAMIC_DEBUG=y, wrap __drm_dbg() & __drm_dev_dbg()
in one of dyndbg's Factory macros: _dynamic_func_call_no_desc().

Next, those functions are adapted to accept a descriptor arg, and we
drop the _no_desc suffix, then the (~4000) drm.debug callsites will be
controllable by their class-names:

  #> echo class DRM_UT_ATOMIC +p > /proc/dynamic_debug/control

CONFIG_DRM_USE_DYNAMIC_DEBUG=y/n is configurable because of the .data
footprint cost of per-callsite control; 56 bytes/site * ~2k for i915,
~4k callsites for amdgpu.  This is large enough that a kernel builder
might not want it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig     | 12 ++++++++++++
 drivers/gpu/drm/Makefile    |  2 ++
 drivers/gpu/drm/drm_print.c |  2 +-
 include/drm/drm_print.h     | 12 ++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..5ab31753c25d 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -63,6 +63,18 @@ config DRM_DEBUG_MM
 
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
index c2ef5f9fce54..e93b7902994a 100644
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
diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index e77b49c7725b..5192533794a2 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -53,7 +53,7 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
 
-#if !defined(CONFIG_DYNAMIC_DEBUG_CORE)
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 module_param_named(debug, __drm_debug, ulong, 0600);
 #else
 static struct ddebug_classes_bitmap_param drm_debug_bitmap = {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 383feb0d34fe..5c39bacac2b3 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -388,8 +388,14 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
@@ -496,7 +502,13 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
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
2.35.3

