Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0A58B20C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B37A92A2;
	Fri,  5 Aug 2022 21:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD4812A6C6;
 Fri,  5 Aug 2022 21:54:48 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id i84so2859211ioa.6;
 Fri, 05 Aug 2022 14:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=FP6JoOpcsPiu1BPTclm5wHedSoKs2JtHZ6xsyHOlop8=;
 b=N1R/s7ivLp2/sPuzJIiO6Ks8HehwdRFJkr6Ix3xbni0a4RyJKladqIy4RI8srW9uLk
 v4KvtBuxNNylYoh2PtZuFOgg4f4Pekwan09tnlfSzSYfh1XRXqNPFmr10gJ4zsCcSJ6J
 LkLEoiNQmZ22iMR4yqw+rvCVwPxf2QbNL13GPea2bhYURNf3ALZ4uoDkh9qEKi+Cy/r6
 Bqeua0HX7Fci9T3OnCo8Z17BcUlJVtrvRMnEuyfdqh5QeTORmdGWNDQrXknPUIYQ+bMc
 Cn+Mv0NjSC5763lvRbvr8YyYbNUt045OmK9+vY9oGIlb/+Aqe1JVyZFrjokzVYbFBzPP
 eH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=FP6JoOpcsPiu1BPTclm5wHedSoKs2JtHZ6xsyHOlop8=;
 b=cU70reOD7utQRonXKUvsIlx5T9UbpWXqGoTcObB2cQVoWtQExZBWLue2FJrbTm34e1
 esWIMtbQWCosU0kxz51BH5ivXpRB7Nx+qu/JvPSKKoXZ/SFzu0LNkVx9AMK0qRPJrZZj
 +v5cfF1fujtzhFoq6qnFySVNefJKQ6iqbdkCwT/AHsOH8pOfaUVNfagePEuxghA6iVdj
 DLx8OoTL4ARhAzE1ffQFQY5CE3HQOfllWV3f91jtXQgsPm6roKgjSBFBOrKNP+t6SxoB
 9kZ64qqkSgh8+yRnSfyJCxYkQxBp0cDl+z2HmyRCqEOSgArmbML2HlqlVIpAhWQl3dbO
 ilOg==
X-Gm-Message-State: ACgBeo2eDh1HrByaA0wyZKQg9U6oY2lq2Fk/nClHY27V7+t+JvXRCUST
 S9ZhFb/U7b3pJuiMxO9YvSQ=
X-Google-Smtp-Source: AA6agR5c6sa3U4liyEUp27w1FLX//O1mPzIN5ouIQsElkrkNBQ9yLhyTyifLFyGhFGt6wUDWEt6vTA==
X-Received: by 2002:a05:6638:2642:b0:33f:5172:e77 with SMTP id
 n2-20020a056638264200b0033f51720e77mr3882670jat.85.1659736487238; 
 Fri, 05 Aug 2022 14:54:47 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:46 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 24/33] drm_print: interpose drm_*dbg with forwarding macros
Date: Fri,  5 Aug 2022 15:53:46 -0600
Message-Id: <20220805215355.3509287-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
index ec32df35a3e3..29a29949ad0b 100644
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
2.37.1

