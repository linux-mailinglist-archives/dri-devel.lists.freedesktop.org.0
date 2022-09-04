Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC675AC779
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790E510E2C3;
	Sun,  4 Sep 2022 21:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4610E299;
 Sun,  4 Sep 2022 21:43:00 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e195so5690947iof.1;
 Sun, 04 Sep 2022 14:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=HlXlcsu2RqT6fAUiV6NVhuDn1t0xR93nZ+jChKYhqUw=;
 b=aHV/k9J2PuitBnlhA4br73E9JnLl2gCBHHBTGdkL9KmqcRS5bomgzwR0OaqXBlVyql
 Mf+7Y+KsEOXcIs+D0+rNcc1xfUx+tf11ZEtL7jgmdcXn3KKcYRtVgMKv2QivMhgwGB6p
 qhysutFwua8FbpIFvlVp/S3j8MzU+FtQko8iiKsgLlooadXPLQQ21I6Q1NTrYJTip/4D
 0VC0OYdPKhw0V3Mzu3DZ0R5yhcn852KcFxvjVL4Bi2PKi8TFHfnlMTt0MfuMqEB1W0cT
 r3SV72vbw59OuMsz2HCPNecCDPTzT4EzG4nBHs7LsaOq7fTjOvTkLYW8hBG4OuYPJt9E
 DnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HlXlcsu2RqT6fAUiV6NVhuDn1t0xR93nZ+jChKYhqUw=;
 b=EDxselT83jQL0qvrXntF5Ga9xS5B4MhrHTX41w+0Z0egLvLhpKVKQjtJI6j4RUmEN6
 zm7m1Q/nRAu1qS2NVs6igBWslUjt2cf19vXQlSWNeeivxbeMeaLesWtJytOMreqR+OB0
 gmKrkcVhYhoNW3nmBUI+hZ7hiPa1k7TtG8hKUG0RIi5l0hCH0RCnADHKfxZI0l5pPGaz
 CPaVjzhl97RocA1Q/ET3pdDFlWQF2L/qa+SI5nzt4450P7KU+zrFvT4u84KGuEgTDilL
 aBiA0ue17F/dumpHTW1fqPSAPesSpmDfAFGGxGQ7XxML20O6xIC4/V20jMEosvxSolIW
 XSrQ==
X-Gm-Message-State: ACgBeo2p0MHYh1TZAD6TsF1ZLTeM5M00TYpZy16CL0WhD5jZD9L8uCN5
 YXEQY4RbCxvQeMs8HP3tnkk=
X-Google-Smtp-Source: AA6agR7vlI7R7BZjvt5nOZUe1nHbAjNSYfJLtX8tg1fOrQTMkIvWzLEFddRnIK11jzK+Lp9kCqNOZQ==
X-Received: by 2002:a05:6638:22d1:b0:34f:5d31:5fe with SMTP id
 j17-20020a05663822d100b0034f5d3105femr6114929jat.185.1662327780173; 
 Sun, 04 Sep 2022 14:43:00 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 52/57] dyndbg: add DEFINE_DYNAMIC_DEBUG_TABLE,
 use it tacitly RFC
Date: Sun,  4 Sep 2022 15:41:29 -0600
Message-Id: <20220904214134.408619-53-jim.cromie@gmail.com>
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

This defines a new macro (tbd: tweak name) which is a special version
of DEFINE_DYNAMIC_DEBUG_METADATA_CLS().  Unlike that macro, which
declares callsites in pairs of desc/site recs.

This macro declares a pair of header records, which the linker script
then places once (.gnu.linkonce.) into the front of the respective
sections.  For builtins, the .linkonce gives us a single header
preceding all ~3-5k callsites.

It uses __unused, __weak, .gnu.linkonce to avoid trouble with multiple
inclusions, and should not consume space when not linked to by a
callsite in a loadable module.

Atypically, this macro is also tacitly invoked in the header, which is
indirectly included by printk.h.  This means 2 things: it mostly
insures that source files will declare it at least once, and that
multiple decls resolve to the identical storage address.

I did this with the expectation that I could let the linker compute
the offset and initialize ._index accordingly, but that resulted in
some "linker cant compute" error.  Ive initialized it in
__ddebug_add_module() instead.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index f23608c38a79..23d3d2882882 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -220,6 +220,32 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
 
+/*
+ * DEFINE_DYNAMIC_DEBUG_TABLE(): This is a special version of
+ * DEFINE_DYNAMIC_DEBUG_METADATA().  It creates a single pair of
+ * header records, which the linker scripts place in front of their
+ * respective sections.
+ *
+ * To allow for a robust runtime test in dynamic_debug_init(), the
+ * pair of records is hardwired into a self-reference loop which can
+ * be validated before the field is altered to support _ddebug_map_site()
+ */
+#define DEFINE_DYNAMIC_DEBUG_TABLE()					\
+	/* forward decl, allowing loopback pointer */			\
+	struct _ddebug_hdr __used __aligned(8)				\
+		__section(".gnu.linkonce.dyndbg")			\
+		_LINKONCE_dyndbg_header;				\
+	struct _ddebug_site_hdr __used __aligned(8)			\
+		__section(".gnu.linkonce.dyndbg_site")			\
+		_LINKONCE_dyndbg_site_header = {			\
+		._uplink = (void *) &_LINKONCE_dyndbg_header		\
+	};								\
+	struct _ddebug_hdr __used __aligned(8)				\
+		__section(".gnu.linkonce.dyndbg")			\
+		_LINKONCE_dyndbg_header = {				\
+		._uplink = (void *) &_LINKONCE_dyndbg_site_header	\
+	}
+
 #ifdef CONFIG_JUMP_LABEL
 
 #ifdef DEBUG
@@ -390,4 +416,12 @@ static inline int param_get_dyndbg_classes(char *buffer, const struct kernel_par
 
 extern const struct kernel_param_ops param_ops_dyndbg_classes;
 
+#if ((defined(CONFIG_DYNAMIC_DEBUG) ||					\
+      (defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))) \
+     && defined(KBUILD_MODNAME) && !defined(NO_DYNAMIC_DEBUG_TABLE))
+
+/* transparently invoked, except when -DNO_DYNAMIC_DEBUG_TABLE */
+DEFINE_DYNAMIC_DEBUG_TABLE();
+#endif
+
 #endif
-- 
2.37.2

