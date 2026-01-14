Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A0DD1C00F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3A10E033;
	Wed, 14 Jan 2026 01:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHPMF5sX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EF510E304
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:58:52 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id
 46e09a7af769-7cfcb5b1e2fso92620a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355932; x=1768960732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
 b=lHPMF5sX5rsOQQPdirjNhh4Q1YcSS0/U0cUzukZFP6R4KHxzcGI3GYjKJW34DaesgE
 nUnNlfQo5xK0984cJIQi8PPAN6L04wJRnhaWG9RamiFVyAksa+17ZMxQEbLWlnGvJ4zl
 TtZIDjuSPHGnUtklXl7OHgsxOLE+desk6kABGohCzSQdNjHDt9C1sZx+FVDAC/cAjt5d
 ZSQBS9nPsnr9s377YB7nYW/isroRV5mFrIVu6cZXPn4SDK6GxaDcL5Nswp/Z0Rcyjv35
 1mFRpEgIWhzneVD7UymJqzW3hJKDGYj6N7TJTxM79JLZSRXFpHqie/Vz/vP63I3cPYsP
 Ykcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355932; x=1768960732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8i2B8ufAHD9sSahBAZkEx2yO1Ly/YjHLa83EmimubvQ=;
 b=kwEDZLOVJr4OulEnuSSx5H+A/nusiTmhGBkvxJJRame4tuoKBKifUbDtekpKAlnvDr
 ygurBWLdDkgrEgUjZjFqVhoKmO699ScmEpQhYMtVblV3PCXV9yTAgBpq8cXbJbnlT4hj
 E33UXVd9Xfh+D3V9aUwaSCPjlAgprWXwOPRypB9yAezd4xuDGbOlmITwtRhiSpVywBRV
 nZZqdiElcgdwG4ZFrZjUzYfwKSAKM9nE2LTt0knOOxzPXGjXVlqtyv5uF2lIlZtgp2bo
 yVBZVjl96LOtvQ4rz8g+hy45XLdrLMZjaIojgXzD/LHGPhhti9SQQo/QwN/cCfZOmQDf
 u6Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbWLeibyTYCPCOunUQYFJduCbRL70Nib88hQO5LY+2nEH/vgw2iIy+AHmXedkleGHdAdO4u/xEa/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx++e2LelwD2OZY2XOdnZThDLy30ZuU93Hr1Dxq63eUMzUj0ooi
 1RYHFI+ptiXQWbHFKXLBnNVgEIWK/RqkDA79nYNxDZ4tMHWiue8GX14P1cbJ/SujABRjfA==
X-Gm-Gg: AY/fxX6/4O0hqDClaf+miujkMkjf05+65EJ6znSb3OnGR/jmq1mSmyQpQjw+n98qZEq
 zGdEZ/yQUETMjUEFwduWiIdcj/d3UQuHrzysIRvSs1xJfCqvGHJmPSf7v0yMHf390fKBr2zqbJe
 ++kOfYnHRAuRRRFRXLV2b/MOpz7ssueTqNvHoR0t23hmTEw673DvtNLIzIv2DyJHYadviPDcJh+
 kb663H+WmiN9IjPac3jZzil2QNUfboIlHcZCofO7bDeiwoxRSKM2StMZwjtI/cuIR0boj6ZXZ+7
 kioiCrBDxYddZQdk9em1+0cmpMwZiICIUJ6KtLjATSyak8lNyS00AmrJDryuiP0H+5jRZVwAnPn
 jtZGZY6l1pRq9GeqRyTO4IOGr0xQ0As03Cz9K1h91DSm2q0fsC6ohIy2cR88oc38w5vnVvZ3Maw
 JBdQlespmtP4BEBITTvBWzV5V29Jd8SuQQ2rYx
X-Received: by 2002:a05:6830:3148:b0:7c6:cf19:1dec with SMTP id
 46e09a7af769-7cfc8b73711mr1019391a34.33.1768355931685; 
 Tue, 13 Jan 2026 17:58:51 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce478d9c17sm17120860a34.22.2026.01.13.17.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:58:51 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 02/31] dyndbg: add stub macro for DECLARE_DYNDBG_CLASSMAP
Date: Tue, 13 Jan 2026 18:57:18 -0700
Message-ID: <20260114015815.1565725-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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
2.52.0

