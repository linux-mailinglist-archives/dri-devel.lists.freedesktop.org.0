Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86A48728A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 06:31:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1308D113267;
	Fri,  7 Jan 2022 05:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEB111324D;
 Fri,  7 Jan 2022 05:30:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e128so5859460iof.1;
 Thu, 06 Jan 2022 21:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qYyJ2gcl34AtG+ZwzeuT+zalv5tvCFacm4aJJ3L+PFU=;
 b=n5cDKpY/cS3ddfduU75FLd0mm/XG5Pm3C7omvy4wXv3FY5Ljt7Dn096WxhuV01V/uR
 agjlDHLToD0Cg8Tc+m/rD0aVxrP3mLxB2DCAHY6VKw3DlGhz6uOzIMJCFLkFg/Fk6fQa
 m9kieutSbD75E/lHgv7lCWlrz7p9i+Jqkz2sxDfcRXkdx83cO+prvc5LWdXNmJWfjeCK
 QnPA+yX6Y8dW0FOO1MGgT6XRj2b6FzA56X4/L1wM8wzyddIVlrUX8cICTROh6Xc5PHCS
 2OhKsU+un9BbaB5LdDVwo5pAfJIOYGuGyHfic5lyoWk6pCAn/UGOkjfDYClncsTWpPd2
 VZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qYyJ2gcl34AtG+ZwzeuT+zalv5tvCFacm4aJJ3L+PFU=;
 b=6mqX1yvQpxl0tOf0PjnTQVdye7D+Yz+PxpCBCsnHTV9YEIIJTBPY9BFmqWKFrVgElB
 dc2FVXtVHnUHa2wCPk1OO5zvScaLH9bcqRRqiG+jpEnI/NH3icJujyyH864rT8l2OPj6
 nEUhrbPTVZ1lN/T8OCGQWyRzQe/Xxu+cc90Y6Ih22E75vyS949Jr7ygjvNRNoldfPEWA
 3j9XD2Z7s1SR9pANwiVa2INqF+1ios0vwoVV0pShLi1h7Zwaco7tfvtfIUz1330CNatL
 hj0LodrDq/5V3dZA0EhpWMOFfHKIa75+DxYLmf0omimsLSV631v68mcek3czTXz/9TKb
 904Q==
X-Gm-Message-State: AOAM530qBmRBfSl2ze5OUInWfMnaZn4l9cSUlpjolR6elxijYhgYgsf7
 fL/7/1vjgbexUXiJ7NfbU4E=
X-Google-Smtp-Source: ABdhPJyZ2DQ/f+275CIjKbX91nJCLDE4hjHieIEqtncwcYdaOvFghGTgMmBnVGaYwBuweKjCTTGK8A==
X-Received: by 2002:a5d:8543:: with SMTP id b3mr29143476ios.11.1641533409455; 
 Thu, 06 Jan 2022 21:30:09 -0800 (PST)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id c18sm1843446iod.18.2022.01.06.21.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 21:30:09 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v11 16/19] drm_print: add struct _ddebug desc to drm_*dbg
Date: Thu,  6 Jan 2022 22:29:39 -0700
Message-Id: <20220107052942.1349447-17-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107052942.1349447-1-jim.cromie@gmail.com>
References: <20220107052942.1349447-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, arnd@arndb.de, jim.cromie@gmail.com,
 catalin.marinas@arm.com, linux-arm-msm@vger.kernel.org, mingo@redhat.com,
 quic_psodagud@quicinc.com, maz@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A recent commit adding trace-events to drm noted:

   trace_*() additions are strictly redundant with printks to syslog,
   not properly placed to reduce overall work.

That was because it didn't have the struct _ddebug *descriptor, whose
.flags specify TRACE and PRINTK actions on a controlled callsite.  So
it could only duplicate the stream (from the enabled callsites).

To issue TRACE, PRINTK selectively:

- add struct _ddebug * param to prototypes and functions:
  ___drm_dbg(), __drm_dev_dbg()
  add "struct _ddebug;" to name the ptr-type, to silence warning.

- adjust the forwarding macros: drm_dbg, drm_dev_dbg
  to provide a descriptor, or NULL.
  basically this is dropping the _no_desc_,
  ie using _dynamic_func_call_cls(), since the callee can now accept it.

- add if (desc->flags ...) TRACE / PRINTK actions.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 25 ++++++++++++++++---------
 include/drm/drm_print.h     | 20 ++++++++++----------
 2 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index b911f949af5b..8c33302212fc 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -258,8 +258,8 @@ void drm_dev_printk(const struct device *dev, const char *level,
 }
 EXPORT_SYMBOL(drm_dev_printk);
 
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		   const char *format, ...)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
@@ -267,24 +267,31 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 	if (!__drm_debug_enabled(category))
 		return;
 
+	/* we know we are printing for either syslog, tracefs, or both */
 	va_start(args, format);
 	vaf.fmt = format;
 	vaf.va = &args;
 
 	if (dev) {
-		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
-			   __builtin_return_address(0), &vaf);
-		trace_drm_devdbg(dev, category, &vaf);
+		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
+			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
+				   __builtin_return_address(0), &vaf);
+
+		if (desc->flags & _DPRINTK_FLAGS_TRACE)
+			trace_drm_devdbg(dev, category, &vaf);
 	} else {
-		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
-		       __builtin_return_address(0), &vaf);
-		trace_drm_debug(category, &vaf);
+		if (desc->flags & _DPRINTK_FLAGS_PRINTK)
+			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
+			       __builtin_return_address(0), &vaf);
+
+		if (desc->flags & _DPRINTK_FLAGS_TRACE)
+			trace_drm_debug(category, &vaf);
 	}
 	va_end(args);
 }
 EXPORT_SYMBOL(__drm_dev_dbg);
 
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...)
 {
 	struct va_format vaf;
 	va_list args;
diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 0c704610c770..6d43b81a0ee4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -360,9 +360,9 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 __printf(3, 4)
 void drm_dev_printk(const struct device *dev, const char *level,
 		    const char *format, ...);
-__printf(3, 4)
-void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
-		 const char *format, ...);
+__printf(4, 5)
+void __drm_dev_dbg(struct _ddebug *desc, const struct device *dev,
+		   enum drm_debug_category category, const char *format, ...);
 
 /**
  * DRM_DEV_ERROR() - Error output.
@@ -412,11 +412,11 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
 
 #if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
 #define drm_dev_dbg(dev, eCat, fmt, ...)				\
-	__drm_dev_dbg(dev, eCat, fmt, ##__VA_ARGS__)
+	__drm_dev_dbg(NULL, dev, eCat, fmt, ##__VA_ARGS__)
 #else
 #define drm_dev_dbg(dev, eCat, fmt, ...)				\
-	_dynamic_func_call_no_desc_cls(fmt, eCat, __drm_dev_dbg,	\
-				       dev, eCat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(eCat, fmt, __drm_dev_dbg,		\
+			       dev, eCat, fmt, ##__VA_ARGS__)
 #endif
 
 /**
@@ -519,8 +519,8 @@ void __drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
  * Prefer drm_device based logging over device or prink based logging.
  */
 
-__printf(2, 3)
-void ___drm_dbg(enum drm_debug_category category, const char *format, ...);
+__printf(3, 4)
+void ___drm_dbg(struct _ddebug *desc, enum drm_debug_category category, const char *format, ...);
 __printf(1, 2)
 void __drm_err(const char *format, ...);
 
@@ -528,8 +528,8 @@ void __drm_err(const char *format, ...);
 #define __drm_dbg(fmt, ...)		___drm_dbg(NULL, fmt, ##__VA_ARGS__)
 #else
 #define __drm_dbg(eCat, fmt, ...)					\
-	_dynamic_func_call_no_desc_cls(fmt, eCat, ___drm_dbg,		\
-				       eCat, fmt, ##__VA_ARGS__)
+	_dynamic_func_call_cls(eCat, fmt, ___drm_dbg,			\
+			       eCat, fmt, ##__VA_ARGS__)
 #endif
 
 /* Macros to make printk easier */
-- 
2.33.1

