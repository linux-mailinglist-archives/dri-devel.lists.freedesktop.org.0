Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 567BBC6B925
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3DC10E52D;
	Tue, 18 Nov 2025 20:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ldHnxaWh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1850D10E528
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:27 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-9490a482b7bso108356939f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497166; x=1764101966; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jMXBzIIRyoXzNJBSl4ah2NOKF+5LtDRbEmDzwpRMTZI=;
 b=ldHnxaWhio3l6UECBNyHVzHt0AX0C0i7Uv3+v6eAirUwbrxhSvlbqNwZ+0m9uSaYfM
 LQclfrIbMnLbtdeRGrPLdIx8HoYKv+rkDjNvZnDA4sRivCexn608Fwp9z3jkM290r9p8
 Owf4dOjTnWPL/KpNcVr7UgF6FPMlti3RPNWPvXal/5VGFk6jz+7TiB58ujf3shIuHCq/
 Wx7/qA6MsRocBT0Y13vMArjt8dozSxN7Q93E1ZR4LkAqZ+2UGmcDyEEf9EVv7ByfjsQP
 ieUug9c07wf6k0WuKub+ZvU0ToqZdZ5iWoBvr++5vcC9/5/JLAadlaXRGjYvpo+bXw2q
 R4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497166; x=1764101966;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jMXBzIIRyoXzNJBSl4ah2NOKF+5LtDRbEmDzwpRMTZI=;
 b=lhVe0YxBQMBADMa8doQZPdE0gB5Wp1zzVo437nzKofuTsglNm4U7cg370anFk4TU8Y
 tGpmlsiemfvEZIqfGrruI62THcHitQA1MvuxEiWjSAX4ipR0OS/sxN7ToRD/3rYvRUdx
 YpBVdume+IzY9FCMcrHwKOfJDrBb3J6QH2mGGf+B53PBJvpLBrE52uL8U2jM9xSnVOS0
 uXiG447TcMTQxvuRppcDmCfCWa9WCm9pun9r7VRxY1FtFXFUHqHe0UDq8caMDGIVfEeP
 fbfXISFVR0bu79kb50IPA6Swk5ojnmwBJbheVl8VEjnWu7s6YrOGa4em9shfu0Z3Zl3s
 RtIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMBnzOW8nk4/CZdMU2HifaMg9RE3Mk+D63V9tRPrgTuecKNG6ATv2YAQcnb1EbaXlyFiwglrTRgq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRdzZxWSkHtHud0Jm9la7Pk+43+blX1Je6dRXGZ0sxbYw60D47
 nOSmOm6cbVF/+8/TlDLLhHWrJcCXnjDSbRYNfWOXEJO411oouPpuYRmQ
X-Gm-Gg: ASbGncs9Htgy5AhItamxdIOaMTEeRzmuYMERn3QUuo/9urRa41klri8fUSWl+MbijOo
 /ISxvOlUlQ5oVaxE0ketgRAOOKVrhAl3QjKbJacX36OFv7145wwKKwV8U7DI2hpetQCrmZkfkzG
 nuWQHG2eOerI4VqDSeuZE16Qn9DwSK3MHcsSXF+hR607AlxsphtJFCZv5ych2J22scFZmRkmhuE
 eQcVVja7Pblfzu6/eKsHBF/nDaVgTFz9mtQsXQ8zfIjU4Rx7euzq5Vo8DYfkzFm77GAdYYT76vU
 xKWnh5apa4Xg5koktMUpzLTCR+m7/yv09rm1+AZQuTmjMZQPynEGDzMcLbJmDavbierBcFDBYdq
 l+mqchIqY4YVU66tJlH577s1vhR39dUwIfhu/G/spTg3iIUJ5JPdsqB6V2AQ1+TNu1wtjpxsmSy
 K/6LQvd1HoCY7SFjUvrAGRrWxZn/3taPgwP/ayh2WiaQYaSU0fiFtaqPVEAPTsm4sJQVo=
X-Google-Smtp-Source: AGHT+IFOUykA39ngbL/gi4rSkDM2Dh8wgirVlMpJOQAuJ/4iYCBDDhEoAW+I/UmChihR1kpRWQW33g==
X-Received: by 2002:a05:6602:2c06:b0:948:cbd2:3b84 with SMTP id
 ca18e2360f4ac-948e0d87a37mr1874742539f.11.1763497166224; 
 Tue, 18 Nov 2025 12:19:26 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:25 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 23/31] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at
 compile-time
Date: Tue, 18 Nov 2025 13:18:33 -0700
Message-ID: <20251118201842.1447666-24-jim.cromie@gmail.com>
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

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several simple misuses, and
will issue obvious errors if violated.

4 such examples are added to test_dynamic_debug_submod.ko, and will
fail compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This
wouldn't be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
these checkpatch "reuse" issues are on lvalues, irrelevant.
CHECK: Macro argument reuse '_clnames' - possible side-effects?
CHECK: Macro argument reuse '_base' - possible side-effects?

v4- deconflict after pulling macro-stubs forward
v3- $macro_name =~ s/DYNDBG/DYNAMIC_DEBUG/

prev-
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 905db0b49104..b19c9b1d53b6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,14 @@ struct _ddebug_class_param {
  * __pr_debug_cls(22, "no such class"); compiles but is not reachable
  */
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -193,6 +201,7 @@ struct _ddebug_class_param {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403a..b2bdfdfb6ba1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -133,7 +133,7 @@ DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
  * Enable with -Dflag on compile to test overlapping class-id range
  * detection.  This should warn on modprobes.
  */
-DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.51.1

