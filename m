Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2896F4C90CE
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD88F10E72B;
	Tue,  1 Mar 2022 16:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C8610E6B3;
 Tue,  1 Mar 2022 16:46:57 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id t11so19077815ioi.7;
 Tue, 01 Mar 2022 08:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0+vGdwnLXxq+vC4sl8UqWBm6MtHqZ6WUpG5Xunn2VjE=;
 b=Y9vdKRiy1LVLPdctywLbN6QCrXRx56Gx5lTtDCh5IN2ywIY+43Wc1189effJMOtnpH
 SPRVnu+rQdFrY4nbsr/X0Tl59+MXTBKCrjx0FQPX07k41vSsNLVrkakYlc0QmVVK+h2q
 092CeG3jSjdrFlI9/Y4HAjNV9Id+QXscMqyuF/Ze6zkSXqyW1Jx1JEIraIfhwnv6Tht0
 07uM3ams1hj07arG6XGES1AZCVndh7T1RLIStRWqSUg3Vd5BUtOeAtDjuRKYiB5p3e2K
 px6AahJKa6FpRx1/RuVlfPzLEaJMrSd6i6z4tu102bysfwTkJGqIZrUzTOZcQw7V+hvq
 ZeAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0+vGdwnLXxq+vC4sl8UqWBm6MtHqZ6WUpG5Xunn2VjE=;
 b=DVBNB8Q3YoZnjCsmFV1FnrONITbN5vUiLX15wHmhKOBVUabb9rH4VWyLhzEh9GXNIL
 t1zxaJdazkganhPeqOqNMfZpRUbodjgoBnBB8wHZTcuo3QAvyd8z+wDXzhqucBihBkmD
 gbIJ1d7KRFCqpQ0wWxh4WCYC4VQKS4ujAuGq9GEY5OIeFfFvD4Gm7qEYpg3HznbYvm92
 nN+MKI8cZSFl1xO4f9J7r1iCYyoctytWohg1FWypI5rbdZ8oyw3uDitD0NmQftU2IBEE
 oq0NROuFawvkpGJ3B9LJuSRXFoycHchiDXY7qrWN2LXvv3IYYiAHUKn8S8lvSxxRi9Wh
 X7+Q==
X-Gm-Message-State: AOAM531EN9yntL11VpfX+CORiNy5a992KcXiDdQHk8APubqEc3aeoaCH
 ff+eKrdsLXTcpzDCJt0OjEAQbeA9OTuMmw==
X-Google-Smtp-Source: ABdhPJy0tPH4U6OUwXrRch++hJX0lrV1A1jXL0sL4KTY9VhC8iDBQ0QHS39oNPc66nlJCmpTF11DlA==
X-Received: by 2002:a02:9999:0:b0:314:4a83:ac2e with SMTP id
 a25-20020a029999000000b003144a83ac2emr20751025jal.37.1646153216698; 
 Tue, 01 Mar 2022 08:46:56 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:56 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/13] drm_print: wrap drm_*_dbg in dyndbg jumplabel
Date: Tue,  1 Mar 2022 09:46:25 -0700
Message-Id: <20220301164629.3814634-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301164629.3814634-1-jim.cromie@gmail.com>
References: <20220301164629.3814634-1-jim.cromie@gmail.com>
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

