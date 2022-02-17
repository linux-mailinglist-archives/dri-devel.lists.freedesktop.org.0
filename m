Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 897404B971A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0450910E7EE;
	Thu, 17 Feb 2022 03:48:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A51E10E79A;
 Thu, 17 Feb 2022 03:48:50 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e79so2179649iof.13;
 Wed, 16 Feb 2022 19:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yubkIm83qdloKERgFDUIX083yqNPWzHEzjvX+hTfJ+Y=;
 b=N1IkzBPBU/xJbo1PKkybMqkfWAIZsR6V2YWUlr/wuluFy+5Vw2QTXHgRMKh/jowF/E
 msSbyBi6jCA1HO6o6ohcDrXTynt5+/ZQHCR250mlg1SHvuEi5qzQiFVAFcybPHmVyxf3
 JbOXGcwIDGtcwP4dBWPHdoopigc9FdHTcapQoe0xaeUneF5xxv2xRXDAQp7RrU8d/Pl9
 s9hiQ6wp7rqx43o8gAXfpv6A2NreoiXaEIRU/6ixQvnF3VmN0sfIBRBCd6dAQMPRDMsM
 oj2Oj7n7u6hZbbSyPjfwfj6fDlPRYPJlvHtnyeL4qF3vmtl8ot230CgMELVbfzKhjFhw
 g9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yubkIm83qdloKERgFDUIX083yqNPWzHEzjvX+hTfJ+Y=;
 b=Jj2dKuz91qzjMJqdqvKVBlS+/P7+oqBwmZWy8GFGMsWbcPDakz6LRyPHWgq9EF0DOY
 XEATBznZsZUZHVWjle19olRoyOXFqQITXnJkeOsTWPTo/jJESjsM1qUs0wqL6OMbMW+T
 CtnJEiagpSw2xD4R+0DHQUcqQExXvv3AmgBEkY4sz5McFslklf6YdOq6tU9FWzb0ddAi
 T9/xPWlixhzyi7n0KpJX/HLeh21IVrazTTVEA6ak1ZOBhRaKQXd9OmBLTZK4vbYClkoe
 0NFAZ3RnxNW8Vq4Csp47UD4Lfbn2tpVAC3hwbnQ8oPlslRHJwuU3ER39Yufkd/GbSwMA
 dvig==
X-Gm-Message-State: AOAM533yCSYS73mkEhuxHpFeqJS3Cl1+dKbmoJN4/73Q2ZiQGWGDXTZu
 9rpRawDr8k7r6+sqhpq5HJc=
X-Google-Smtp-Source: ABdhPJyXKQlyPhg9qrLLs3CjhrhOjCktwIEw8sMQ+X+99JL80wUnSMgiJ4m7gTwWkHGlQBBJ2w7oAw==
X-Received: by 2002:a05:6638:389e:b0:313:f3ea:b18f with SMTP id
 b30-20020a056638389e00b00313f3eab18fmr764155jav.206.1645069729327; 
 Wed, 16 Feb 2022 19:48:49 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/13] drm_print: interpose drm_*dbg with forwarding macros
Date: Wed, 16 Feb 2022 20:48:24 -0700
Message-Id: <20220217034829.64395-9-jim.cromie@gmail.com>
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

