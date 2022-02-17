Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 275154B972C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D5610E828;
	Thu, 17 Feb 2022 03:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A6A10E7D3;
 Thu, 17 Feb 2022 03:48:54 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id 9so658920ily.11;
 Wed, 16 Feb 2022 19:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Al57ZNKX5lnblKHtWXH/Bsh3z6Q/ha1M5NnWcexkJRI=;
 b=V0r7t+t0Kk8YqhDL5yttmCVdcakOAJfOvunaP5rUIXFehX50brE0txV/ZP/yfOIiJ0
 OZOMuTviWiLPhKj6tYIt+g1vii30xz4wooVCZaC1Sf0se7ci4nGLIYuNE2MHe+fqWJv6
 SUd9Gn7k9KBrlbJ51tAD6K8Rn9LOerLRVIIlqlxyQOioGqU8chuma2FAB0o2HF0mpXOs
 EabrXT7RY8/P2i99gy5Ft3xcRe1gpyfpDE9jfckgpO9vjSLMN83CqB2PQRC6rwXFly/M
 +lEeEu1AtjaTnaxUJFl7Ucop5hD5N/MkNhLu+FTKEb6ZI/OBs3rZe9v4rgSYKctmBxgf
 FeMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Al57ZNKX5lnblKHtWXH/Bsh3z6Q/ha1M5NnWcexkJRI=;
 b=RdzAP1Rf0qeLatHAJM6FLZK+1kSEHYkKI+mYFibvg5YTv4Ds2AutlVhImPfJMUJt9O
 fUnaXkvbKPacNjiaGxmT8XZg2WpIKWOfdNL7ZQCX/3ugEVhbjdS+sjhdAaaApTWu4Xab
 R3lm80mKrC0zEVgQ5mWMZCEdP30R2aytZqJGG/qJeBP92IIy1PCd3Vcusmna40pdL8V0
 dEaA5xzG5XyvDL8RL/cSAOegachyfO3IpL1nSN1pMg1bRFx0b8R2H5WCEeBTqs0ofl7Y
 xKR8fipr9nltjAsCE027pkA1y/n68pALued2HfngOlgBdSDuGWkSh//pZSGQWNHuMtZE
 cblg==
X-Gm-Message-State: AOAM533rxkYsHOd37p6MYvCByYzizkTXCfwRMwcRnP2u7oPGg+JCyBYY
 jrjf7WZEUJIMVrpi+DPH1jw=
X-Google-Smtp-Source: ABdhPJwpadjkqlwkn/peOpycjU/cPxWs8v84Mc4rTvbPvVHvXR0owgAgjr32VA6mTQgW+Q005SRNiQ==
X-Received: by 2002:a92:d242:0:b0:2b9:a33b:9068 with SMTP id
 v2-20020a92d242000000b002b9a33b9068mr786669ilg.144.1645069733685; 
 Wed, 16 Feb 2022 19:48:53 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:53 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 13/13] drm_print: use DEFINE_DYNAMIC_DEBUG_CLASSBITS for
 drm.debug
Date: Wed, 16 Feb 2022 20:48:29 -0700
Message-Id: <20220217034829.64395-14-jim.cromie@gmail.com>
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

if CONFIG_DRM_USE_DYNAMIC_DEBUG=y, use new macro to create the sysfs
bitmap to control drm.debug callsites.

DEFINE_DYNAMIC_DEBUG_CLASSBITS( debug, __drm_debug, "p",
	"drm.debug - control summary",
	/* inline vector of _ddebug.class_id's to be controlled, max 14 vals */
	DRM_UT_CORE,
	DRM_UT_DRIVER,
	DRM_UT_KMS,
	DRM_UT_PRIME,
	DRM_UT_ATOMIC,
	DRM_UT_VBL,
	DRM_UT_STATE,
	DRM_UT_LEASE,
	DRM_UT_DP,
	DRM_UT_DRMRES );

NOTES:

The @_flgs used here is "p", so this bitmap enables input to syslog
only, matching legacy behavior.

Also, no "fmlt" decorator flags are used here; that is discouraged, as
it then toggles those flags along with the "p".  This would undo any
customizations a user added once the sysfs-knob is used.  Still, there
may be cases/reasons.

_ddebug.class_id is uint:4, values 0-14 are valid. 15 is reserved for
non-classified callsites (regular pr_debugs).  Using it terminates the
scan, don't use it halfway through your list.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 20 ++++++++++++++++++--
 include/drm/drm_print.h     |  4 ++--
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index c9b2a2ab0d3d..d916daa384e5 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -38,7 +38,7 @@
  * __drm_debug: Enable debug output.
  * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
  */
-unsigned int __drm_debug;
+unsigned long __drm_debug;
 EXPORT_SYMBOL(__drm_debug);
 
 MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
@@ -50,7 +50,23 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
 "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
 "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
 "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
-module_param_named(debug, __drm_debug, int, 0600);
+
+#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
+module_param_named(debug, __drm_debug, ulong, 0600);
+#else
+DEFINE_DYNAMIC_DEBUG_CLASSBITS(debug, __drm_debug, "p",
+	"enable drm.debug categories - 1 bit per category",
+	DRM_UT_CORE,
+	DRM_UT_DRIVER,
+	DRM_UT_KMS,
+	DRM_UT_PRIME,
+	DRM_UT_ATOMIC,
+	DRM_UT_VBL,
+	DRM_UT_STATE,
+	DRM_UT_LEASE,
+	DRM_UT_DP,
+	DRM_UT_DRMRES);
+#endif
 
 void __drm_puts_coredump(struct drm_printer *p, const char *str)
 {
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 13d52b60f388..419140bf992d 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -36,7 +36,7 @@
 #include <drm/drm.h>
 
 /* Do *not* use outside of drm_print.[ch]! */
-extern unsigned int __drm_debug;
+extern unsigned long __drm_debug;
 
 /**
  * DOC: print
@@ -527,7 +527,7 @@ __printf(1, 2)
 void __drm_err(const char *format, ...);
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
-#define __drm_dbg(fmt, ...)		___drm_dbg(NULL, fmt, ##__VA_ARGS__)
+#define __drm_dbg(cat, fmt, ...)	___drm_dbg(NULL, cat, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(cat, fmt, ...)					\
 	_dynamic_func_call_cls(cat, fmt, ___drm_dbg,			\
-- 
2.35.1

