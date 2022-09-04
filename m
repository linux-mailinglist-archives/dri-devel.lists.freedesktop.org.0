Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568F5AC756
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC79A10E27E;
	Sun,  4 Sep 2022 21:43:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0757610E1CE;
 Sun,  4 Sep 2022 21:42:37 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id e7so3873185ilc.5;
 Sun, 04 Sep 2022 14:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U1e/PDiTaqhNlqhWklmksFO85pXyEBvT7LYXXx9lRsc=;
 b=Dx9MBKpykNOjC760F4pFLwFUkOoBmF/4z7wBX2mc5AIweU/3t3yi4wF+532OcszVdM
 fJS+kbBgoRInPWQA6RJ24UEiO6RyYqvxzwnizY/OXlGjDTiAte5Jy7Wgkyh+ej2dw7mp
 8ah+0F5F3ut30swO8Jl6e2dH2RtgR7VodKDNux7pE967WR0SeE/u428cUqvwN8xe2OmV
 ay3wjVmLVzY5WIqtJ/VBzchbZ+9NV5ny/h5+U6aR4pyOmNjuCxZNrwhA78HFQY997wef
 fNMxXUBdIylIsoA4g3Yk7C70N55L4Qb/lJbN8V6hoNbx4nWhOh8w8GsOeIFiw0QPvj7b
 zvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U1e/PDiTaqhNlqhWklmksFO85pXyEBvT7LYXXx9lRsc=;
 b=f3e8FERhe0+9GnSoG90tTP2QrQUYs9LIE24BQLiqs2Ry16vQ+I65AuEDeHSIdMoH38
 99bWXM3tDxrwKEol7jlA9oxLWukrezdCQ5MgmDYrPvGcZezwmvYoA0jA+9LbySqU/9pX
 h2zEisnbY3Gje+VbngT7Vf86Gf/r/mQcVmvNXtE0J98tWGkQb5VZa425bJ5xm6nOPRwd
 Q0JVNkaxyDXpcf0lq91Kts7Ry8nk20FyZZBaMXQFK+HeEyLM9USFfTpd+PK/uz0HHaKc
 SlqpRz+EsEFgjwDwcsNZ9cc0IgcoTtg6UwSLzSfpuph/GgxRyus479wvs9mT9XuRmrVH
 Jm4Q==
X-Gm-Message-State: ACgBeo09REmJRf4q48ZnQKV3jhXROLGc6PbuZqHClGw+vgrIGreEs16X
 jFJDXoRFjKnxZW1MpChPD8k=
X-Google-Smtp-Source: AA6agR4QIlOxxpmNgt7Mmv0IK9vaV2J3UNUt+wMqkJN9PXiw35wmcxQf7MVn0gpUR78DsbgyvTivGg==
X-Received: by 2002:a05:6e02:1d07:b0:2eb:1792:5468 with SMTP id
 i7-20020a056e021d0700b002eb17925468mr15883450ila.60.1662327753969; 
 Sun, 04 Sep 2022 14:42:33 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 25/57] drm_print: wrap drm_*_dbg in dyndbg descriptor
 factory macro
Date: Sun,  4 Sep 2022 15:41:02 -0600
Message-Id: <20220904214134.408619-26-jim.cromie@gmail.com>
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
index 2f52e8941074..3b75c286f14f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -51,6 +51,18 @@ config DRM_DEBUG_MM
 
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
 config DRM_KUNIT_TEST
 	tristate "KUnit tests for DRM" if !KUNIT_ALL_TESTS
 	depends on DRM && KUNIT
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 25d0ba310509..0b283e46f28b 100644
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
2.37.2

