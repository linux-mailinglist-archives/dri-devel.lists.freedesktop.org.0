Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A40C6B8D6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908E110E517;
	Tue, 18 Nov 2025 20:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wui3Nk6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B772010E514
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:03 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-9491ba846b2so45926239f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497143; x=1764101943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTxYU8h026vco97neRjwIFFgL6q6uUevMqp7p18zgTA=;
 b=Wui3Nk6nNJogLxTvHnCcyjIF7n7YQFmTOJDM6UQGDqcHXZpGlAznyqL2VB/wBqOfES
 Z9MChpfyr3TTrnSKBRKdsMmA72098k9UVPIHeCRi3E4I1j2RWDiLRxXBBcRVIqujW8OD
 Qp4qKm8NRffpukGC+r6knINkH3palVcDrZzEEUoeuOXG4Itc/5wOLy/51D4sbsDVobS+
 rJc1jIqc4c/Dp5L/t9VA/apfomApEhTmg4qJkmSs5GExX+AqFEI3yaPa2dq6st+F/Pp7
 jDeAUABFM1HlR8gr9YC2Z1mgLuoy9DTAK7zAPNgHSM4jID+sTFgywOvhk0PXNlq/JbPo
 hBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497143; x=1764101943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gTxYU8h026vco97neRjwIFFgL6q6uUevMqp7p18zgTA=;
 b=BIt+2q/n/q+1zQv8+y519YHn8PU/wdXYsfGd2mVI+Y2p9xM7/L2GDzgoFYM/5HtS6W
 QLE3xlPORyYsY7IDicKvU8ZZRSWq+lyvxychd7SC/ErvAs7XRdj1/vEDtVCGMxRRCfWl
 /RrH6edLvYBVLDca6LaI8lp7xSA86VO2YNp3dSYTGPd8F8vASHJKhN03sIRr2RdcSXYv
 ohUQwBwVsAFZDwC4ktGYyeWq5yNfG88DlvKLM09MGAgD7Z2v80FSh2/vxgOg1DAN8HOi
 7MH3TPLBMSBbuEhE25TP7ZMLLGYb0VglLyiD155xEVHE8tqcAVms4RyAj3XLS4kK5HYX
 k51Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrk9mPkPPSz3QjL+Oyrw8xkGPSFRasbbu3IO3Q6r5oXh+iyJlZ1ib8YZR+eb+g8MvKFYk21uB0uho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4GqZ+DsMEexMAW55GdacETxOqPeFocGTA9rb11K2i3Lt9lCiv
 r9v97oZyrJTPXRKZE0tC8tTNTL4uMkSPkZBGO7ngoWki45J43cTHDhVT
X-Gm-Gg: ASbGncsMNt1PpvAeoHphIax309w1rkg5y2frB5G3870RtMt+FRBBuH7xGo5AYDZhXX8
 O1P5uKUxCnND4RIOFsF+PVcBmpFZkoUQODEIkjD6qq+9PKzTewAv8xqEDgh9sUEnjisoIto662R
 RNQp6xHUvQ/jsygSYRcBfStzacQ8nIF1UcYm2G8SOu4Xdikt7ug44i4GfxCgfKU7aER5GkBQf8f
 aADrNekcSXi93kvd2THBR3otmIgzthCPUW6vgRhjh1f0GvBd8lYp7L7QasUaUDVK4jX22q8mUn9
 oARDpu2xpDL+3HWY4ij/El9dbdBuZcWruOif6fZlSXzmBzRmpWHdPQCmm3B4f7HMQgAj+BqQVmb
 LWHhVqq2CwzVE4E/s/oeYKKGTaK/ULkdS+BCWu6QM2+HjFwvHY+IjV3OGnr2IrM0PjnogRtvZ3h
 u/+TFJX1ZtO13afu6hrA/aI4eZ2PHv2B50MD5M3P826SMfqcEGTt0jn4TO9bIZtvGfX+es+IMky
 WSq3w==
X-Google-Smtp-Source: AGHT+IFcrc3OLX2ZNqj1CE9FhAt/HqPB6Gasnh7zL31ocPGJeEjq5Y3rUTCiF6HLBv1+x43fWEAwEQ==
X-Received: by 2002:a05:6602:1547:b0:949:f8f:eb1d with SMTP id
 ca18e2360f4ac-9490f900d7cmr916184239f.7.1763497142850; 
 Tue, 18 Nov 2025 12:19:02 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 02/31] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Tue, 18 Nov 2025 13:18:12 -0700
Message-ID: <20251118201842.1447666-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

Add the stub macro for !DYNAMIC_DEBUG builds, after moving the
original macro-defn down under the big ifdef.  Do it now so future
changes have a cleaner starting point.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 43 ++++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index ff44ec346162..98a36e2f94b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -92,27 +92,6 @@ struct ddebug_class_map {
 	enum class_map_type map_type;
 };
 
-/**
- * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
- * @_var:   a struct ddebug_class_map, passed to module_param_cb
- * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
- * @_base:  offset of 1st class-name. splits .class_id space
- * @classes: class-names used to control class'd prdbgs
- */
-#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
-	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
-	static struct ddebug_class_map __aligned(8) __used		\
-		__section("__dyndbg_classes") _var = {			\
-		.mod = THIS_MODULE,					\
-		.mod_name = KBUILD_MODNAME,				\
-		.base = _base,						\
-		.map_type = _maptype,					\
-		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
-		.class_names = _var##_classnames,			\
-	}
-#define NUM_TYPE_ARGS(eltype, ...)				\
-        (sizeof((eltype[]){__VA_ARGS__}) / sizeof(eltype))
-
 /* encapsulate linker provided built-in (or module) dyndbg data */
 struct _ddebug_info {
 	struct _ddebug *descs;
@@ -137,6 +116,27 @@ struct ddebug_class_param {
 #if defined(CONFIG_DYNAMIC_DEBUG) || \
 	(defined(CONFIG_DYNAMIC_DEBUG_CORE) && defined(DYNAMIC_DEBUG_MODULE))
 
+/**
+ * DECLARE_DYNDBG_CLASSMAP - declare classnames known by a module
+ * @_var:   a struct ddebug_class_map, passed to module_param_cb
+ * @_type:  enum class_map_type, chooses bits/verbose, numeric/symbolic
+ * @_base:  offset of 1st class-name. splits .class_id space
+ * @classes: class-names used to control class'd prdbgs
+ */
+#define DECLARE_DYNDBG_CLASSMAP(_var, _maptype, _base, ...)		\
+	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	static struct ddebug_class_map __aligned(8) __used		\
+		__section("__dyndbg_classes") _var = {			\
+		.mod = THIS_MODULE,					\
+		.mod_name = KBUILD_MODNAME,				\
+		.base = _base,						\
+		.map_type = _maptype,					\
+		.length = NUM_TYPE_ARGS(char*, __VA_ARGS__),		\
+		.class_names = _var##_classnames,			\
+	}
+#define NUM_TYPE_ARGS(eltype, ...)				\
+	(sizeof((eltype[]) {__VA_ARGS__}) / sizeof(eltype))
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -303,6 +303,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
+#define DECLARE_DYNDBG_CLASSMAP(...)
 
 #define dynamic_pr_debug(fmt, ...)					\
 	no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
-- 
2.51.1

