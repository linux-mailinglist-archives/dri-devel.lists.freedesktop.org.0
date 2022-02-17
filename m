Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D764B9724
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE94A10E75C;
	Thu, 17 Feb 2022 03:48:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7BE10E75F;
 Thu, 17 Feb 2022 03:48:51 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id n5so1348965ilk.12;
 Wed, 16 Feb 2022 19:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+vGdwnLXxq+vC4sl8UqWBm6MtHqZ6WUpG5Xunn2VjE=;
 b=aWO7UUGoKdXAsOZ3ARe2QJZJsrpeOf90ACB+ee6E79imlC7MDWWeD+AJr3qahesHxu
 nJovj3uldI2xz69oSyxx+syBvSgbjfhTqygbS8A0KPRXtBpX0LMFKLZ6CB+56OaSzBqb
 hfTdtez1ED7QAtIvGY62HlNG2fIjyr7ow9Skk12dszA/e817Qatb3b1lQgFjQQZ0JiZj
 WWc36Ta/bs/CspzWamVlOMcvgjtO94zzf8D8v9NxDy0gmnlhRwmPysV4iMJOn928huyw
 /tizg//HbxArKb+EFHMAnLKG/J1xmrK4YIYMjh//d11ltRHZXwWiLDMFTkhaeV9fDWZs
 a1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+vGdwnLXxq+vC4sl8UqWBm6MtHqZ6WUpG5Xunn2VjE=;
 b=YunTNwfndcDpRdNFswAi1e/dxJRtihvYTsypcmRCa5eQMBjDlH0irg1v9IjfHcs6kp
 GotVQkcxpTUtG+mwrFWQsRTEbPw2xw73tKFaNT4YlddkggO84G5KSWhkumamj57y4XX9
 5BRTdF9pmeLj8xF7BY5R9CDEwSC1HyDVMWqybdVttEPp6a6Ub2bh5G0TZEwF5bWTZCUs
 GAMjCBQVzwE96tpqLCIyGmI6PgLGgf8TveTV3mB0+mxmu4zjWZEpbwfEdsJfsBr+Doy8
 YbnOnoR+VekhqGwMFbWCL21XkbVqNczOnT+AWe90OgOu0Bf2ffXFVmLICP6oFl5SsvqP
 B00w==
X-Gm-Message-State: AOAM530oNs09zC/aVhfgRpzRYoUrSnZg1QsS3E94ur8KgILNuzG6Oauc
 QfI0ps18ASJeXQNO+DKMWWY=
X-Google-Smtp-Source: ABdhPJz3VeOj8gAqU2/ZIke90ZJ3eMraSlFGZ9r9Aru1QvXJbSIWXwhnlF3/c5ShXmdBBtEfbc0lQA==
X-Received: by 2002:a05:6e02:1a41:b0:2be:6abe:103d with SMTP id
 u1-20020a056e021a4100b002be6abe103dmr765171ilv.204.1645069730202; 
 Wed, 16 Feb 2022 19:48:50 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/13] drm_print: wrap drm_*_dbg in dyndbg jumplabel
Date: Wed, 16 Feb 2022 20:48:25 -0700
Message-Id: <20220217034829.64395-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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

For CONFIG_DRM_USE_DYNAMIC_DEBUG=y, wrap drm_dbg() & drm_dev_dbg() in
one of dyndbg's Factory macros: _dynamic_func_call_no_desc().
This makes the (~4000) callsites controllable, typically by class:

  # 0 is DRM_UT_CORE
  #> echo module drm class 0 +p > /proc/dynamic_debug/control

 =N: keeps direct forwarding: drm_*_dbg -> __drm_*_dbg()

I added the CONFIG_DRM_USE_DYNAMIC_DEBUG item because of the .data
footprint cost of per-callsite control; 56 bytes/site * ~2k,4k
callsites (for i915, amdgpu), which is significant enough that a user
might not want it.  Using CONFIG_DYNAMIC_DEBUG_CORE only eliminates
the builtin portion, leaving only drm modules, but still 200k of
module data is a lot.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig  | 12 ++++++++++++
 drivers/gpu/drm/Makefile |  2 ++
 include/drm/drm_print.h  | 12 ++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b1f22e457fd0..ec14a1cd4449 100644
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
index 301a44dc18e3..24e6410d6c0e 100644
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
index 4bed99326631..06f0ee06be1f 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -383,8 +383,14 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
@@ -491,7 +497,13 @@ void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
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
2.35.1

