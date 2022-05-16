Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C0F529457
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB11410F401;
	Mon, 16 May 2022 22:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017A710EF03;
 Mon, 16 May 2022 22:57:24 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id q203so1805263iod.0;
 Mon, 16 May 2022 15:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0whoQsHeXptrD3TNBMDfcpTVQVx7yqX9gABSaE73ckE=;
 b=AjOW5QKHWAhuW8wlCA8uuv2ZQT1FNjJDoVWdRAg9V4oMd1YtwLUqQZVDxiv/rbW71G
 tDRTWR9Job2tMXwm4Qd8Ii/ebOOvCikKkxjmZrBLO7ISvABeNVw6gvCLoASZz5A5pXkO
 2bN2fkk04CX99rIuougRR1DDpjTLdlW3z+ihfirjoo2HTNidV3pvGzBWVYgh96HuwnW0
 UCf9qP6aDTPW1iDEu1RvSp4uR1BITAHIy69wuCgUtAna9woMD6giGXzerTkJfuxaz0uw
 XDXaoC2eMmQa4b1Be17Zhmfqngw3hKXPfmYkxXSju1ug26b57seHZvjLaJAjhjRR7K+E
 cBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0whoQsHeXptrD3TNBMDfcpTVQVx7yqX9gABSaE73ckE=;
 b=xihOfLDnb8M409ZL6wutaOOqKqtGzv5oCUlsdc2JwAxgsg9YRleYUiBKldMmNh4ewS
 OAS78w2+NWXZOsdFjMgkGhPqyjJDg7VKiN77vfq27TF986zH/RR3JY/3YlRbY3pDCk1R
 lnSe0VNvW8ywitiW4gDXwOstnUFim9iKNAALIEfti3PScfK6wRyuIBMtob1R5fiAr3gu
 EZqonN78KWPOX23pSPtjDIM/iyiYPqEUpOYS9AZkukx/f7MnACjNjtnurslktN1jBJEH
 AxCja0WtVIxl5ckHJ04lJeR9ADLpwoELtyG2OLKTUIt3pA8Yk7XRFyG4ibe9upyaKeDn
 CrHQ==
X-Gm-Message-State: AOAM532wDjWbyt47Sv4Nc3ZGGZHQQuGJRssh+m/I97hvj6aPNDsjjt7T
 RFxX2QC0FYTfbL68XLCBHfk=
X-Google-Smtp-Source: ABdhPJxJyh+nGZnbHrXoqOEA6GXq4pUukckz/GPygz5+sl0Mlr8SK0ojc44qkJAMzCz0Rf5asl73WQ==
X-Received: by 2002:a05:6638:2416:b0:32d:be90:ecae with SMTP id
 z22-20020a056638241600b0032dbe90ecaemr10896364jat.156.1652741843354; 
 Mon, 16 May 2022 15:57:23 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:22 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 18/27] drm_print: interpose drm_*dbg with forwarding macros
Date: Mon, 16 May 2022 16:56:31 -0600
Message-Id: <20220516225640.3102269-19-jim.cromie@gmail.com>
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
index e49ffda0a47e..e77b49c7725b 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -266,8 +266,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...)
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+		   const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -288,9 +288,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 	va_end(args);
 }
-EXPORT_SYMBOL(drm_dev_dbg);
+EXPORT_SYMBOL(__drm_dev_dbg);
 
-void __drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -307,7 +307,7 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
 
 	va_end(args);
 }
-EXPORT_SYMBOL(__drm_dbg);
+EXPORT_SYMBOL(___drm_dbg);
 
 void __drm_err(const char *format, ...)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a157485bf573..383feb0d34fe 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -339,7 +339,7 @@ __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
 __printf(3, 4)
-void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
+void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 		 const char *format, ...);
 
 /**
@@ -388,6 +388,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	}								\
 })
 
+#define drm_dev_dbg(dev, cat, fmt, ...)				\
+	__drm_dev_dbg(dev, cat, fmt, ##__VA_ARGS__)
+
 /**
  * DRM_DEV_DEBUG() - Debug output for generic drm code
  *
@@ -489,10 +492,12 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
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
2.35.3

