Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CCB4C90C0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 17:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC06710E6F2;
	Tue,  1 Mar 2022 16:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A486610E6E9;
 Tue,  1 Mar 2022 16:46:56 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id d3so12992515ilr.10;
 Tue, 01 Mar 2022 08:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yubkIm83qdloKERgFDUIX083yqNPWzHEzjvX+hTfJ+Y=;
 b=ISLm3V/IeiSDg5+vhkENxW8YE87dpmigL0ocrTSt3CRgNZkAy1Rz6YjEeVshUsSI9o
 cV/iEN5PW5UM7azuw3NI4Y36/pPbzowJnMAv9WrteAVy5ODETIp7a3oAQGx0Ts0kBLsX
 nLwB8485WMmCEirVOC5OQ5s1gSSXNTWcK9Oo0cDBO1SUWbbPtWYkO/7WA2Ek5C3F+Ic0
 pYlNubvK0/z/A17e5ALxwEI5yukvuizRefuVJcUjefpF0/A/HlSREXoQXhU6D/pGK6mr
 7zkLvPozhR95fGHbY3Q69TRIqPzApRIjqSoxQRtHDhAKlwnxzwqNoV4S3Q6JP2X6qtqM
 HB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yubkIm83qdloKERgFDUIX083yqNPWzHEzjvX+hTfJ+Y=;
 b=HK+JuKTq2uyRETlt5Nn+8Kpfk27Bk/JiZp+YE9Nj6GVWT6nn0lr5ONs/xuYF7lZPGo
 EAEzBxTS93yBBhUsOeRvVqkq6qET0k7OCYcuhDXx3QPFWEk+wI02r1854QorTDJ1ddak
 CgJS/SZEjO1NECuyei+/6AjCP7A0LCUmZfN1gp8BKyaXZ3JVQ5EOx1x+PjvMzpkP+0Kv
 ZI17NBU0ugWtQpvvZ4Ic/ToAB0Nxgnn2gwdXaw9xYpmWHrjesdT63UOP1BHQ1LvpVpEd
 GrE0wNjHLjvxAyHM7fgO+bdBue3k9mBIxA29LqPSZcaq4pW1DmAQsAtZAxSa9NcIaxmf
 m3HA==
X-Gm-Message-State: AOAM5328yBQwiHbixwG71XAHxR5lJCYjCzFHl32+XbSFeB+SmMAOm9N/
 rvf1V1t5B9qpUJPgV9ENuqo=
X-Google-Smtp-Source: ABdhPJxJxOoHiU5RuG9v29v8mzh4AH6zyJup46I/ZGT8FLfyyHklpIIpJBYuJj3VKTdtc8iQV4y46A==
X-Received: by 2002:a05:6e02:1b8e:b0:2c2:2750:1178 with SMTP id
 h14-20020a056e021b8e00b002c227501178mr23158574ili.126.1646153215928; 
 Tue, 01 Mar 2022 08:46:55 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 o3-20020a6b5a03000000b00640a33c5b0dsm7272411iob.17.2022.03.01.08.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 08:46:55 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/13] drm_print: interpose drm_*dbg with forwarding macros
Date: Tue,  1 Mar 2022 09:46:24 -0700
Message-Id: <20220301164629.3814634-9-jim.cromie@gmail.com>
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

drm_dev_dbg() & drm_dbg() sit below the categorized layer of the DRM
debug API, and implement most of it.  These are good places to insert
dynamic-debug jump-label mechanics, allowing DRM to avoid the runtime
cost of drm_debug_enabled().

Set up for this by changing the func names by adding '__' prefixes,
and define forwarding macros to the new names.

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
index f783d4963d4b..e45ba224e57c 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -256,8 +256,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -278,9 +278,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -297,7 +297,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 
 	va_end(args);
 }
-EXPORT_SYMBOL(__drm_dbg);
+EXPORT_SYMBOL(___drm_dbg);
 
 void __drm_err(const char *format, ...)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index b3b470440e46..4bed99326631 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -334,7 +334,7 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		 const char *format, ...);
 
 /**
@@ -383,6 +383,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
+#define drm_dev_dbg(dev, cat, fmt, ...)				\
+	__drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__)
+
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
@@ -484,10 +487,12 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
2.35.1

