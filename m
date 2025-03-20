Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA8BA6AD80
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAD610E6AD;
	Thu, 20 Mar 2025 18:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bh7qU2Pg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CA510E6B7;
 Thu, 20 Mar 2025 18:53:25 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-85b4170f1f5so31698539f.3; 
 Thu, 20 Mar 2025 11:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496805; x=1743101605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJ+ezC9PUeelEIyxHgbZMmX02NoHE8P8VEj6JEyG+nM=;
 b=Bh7qU2PgXKlzCsGkIgGSswnK5oavvzySC8qF2H+5R1vFnT/5cX5Q3uDDgKmARYZIbq
 GDKCJkD32W1xVtv3u+dFKAsCPT8Z9Gz6FQYBfZHH72b4kj6RBqmblCQoQrM0Cj2W1AoT
 UMbuMxZof3qgTgRtLmmHgFpjva0784puY+pNt0JO9gDNXOnNnrc3WZUjDzc//PIwYLte
 cgVBGfeyGDryR7Qzh+eVynfQCy6by46oQtkXBxBFXhmvvd+HM5nHCXweKxBaVZDpqm46
 xflGTbnc4teJ9C4+MKRzsVPnVCwYD9/UVntjQ1QhstKpDychBJ8IXiCGtMIXDpqRohWk
 NEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496805; x=1743101605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJ+ezC9PUeelEIyxHgbZMmX02NoHE8P8VEj6JEyG+nM=;
 b=hDQaXjYbDJe4jQes4/p1MogHknt3Ltd/5I1uT5z0YQLbNhdMft05lEjgCPJxp4b6wH
 YJ7BZShckda8rDybSem3uevWnhh1DVb8pEso7fkBCPXy7uzWRwo3saFyuEC1nBm4nAf0
 GN0uykiztXPnOilY3AVNBPKeHrfDMDRr47NiFZLjXn2tqqAy3F8Cx6g6Ais+SVj0tjBE
 uwEYBqtgRHSTstay8XPviVv9ttRjXs4dJOE9f6fL0Fo7W51gjdsuZj/fXlxgUDBbyRx3
 QQ1vjVO0CChM7DqQBDvAyhQgP9MoQNGMn6E6TzBY1z0vj4mkomC9WmMUkaWcepSR1fWY
 02Vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmZI4nvPlzBhQrYZTRLs9VLRsphkOzVtwJZh47RDaY+bTuZQEZJTvij5BeHKc5JhgHlc0m+Ekz4/p@lists.freedesktop.org,
 AJvYcCVa7kB+QSnda/cZFPaIcUeoICgrNHqi7HXknPtyYuluUGhv158D+a0yCEz/zz/ypP9daSA7KIZQmzqYP45fe1m9qw==@lists.freedesktop.org,
 AJvYcCW2SLrMKwwcoIgcUA1JbIm0WuaQUO4DLWVAoSuF1XUplKrfUHviGTO3toh3PlwqtlHhn4L/WK/FyPDz/4b4Fw==@lists.freedesktop.org,
 AJvYcCWBK5DoW8bbAQWtUP0EoK7W3/ysg+tc2UcEcI6ARUDTk4FGz04FUz/JTJd1GwVACfDsm2pyGK6vQ52T@lists.freedesktop.org,
 AJvYcCWkZ4NhVrAF/ShSceAp/ZBPdHCPEvG2KhX2tzJN83h2okyAH2NUmB7TWIQyRPKz/ZFUBRh5K5+H@lists.freedesktop.org
X-Gm-Message-State: AOJu0YylkE5uVFucIwpKLqs42E19QWe+9kfWr7ST2EBhkRtaXpqXLe1K
 Vrxu/ZXQWCvV0tdHGqaIEcErRA3RigVonX1V4oYZRyBo+S7RrzgK
X-Gm-Gg: ASbGncskeoGs/kaynpbWLhs12liV8m/JDZugcTzV40smu4LdE3TyodCRI8UgTQsJoik
 3evkhrH8bqStFLIUFX/cAmDYEpYeL1Ico+kpI7QnQGkGfGtvGtrAIXZq2IgDLMEcnFK5Pjy7654
 6bi4kM7/wPgR5QSL1jH2yUXpNhX4kOk3rNTVh1r3tPaCrCikXIZQU97D+83X3Qy1p2ZRc5I90eW
 A6aurCnmxrK3fOidaKWrucvgvuEOiIjbYXLGX5Ig6To1juxt1ys+wt6SCoUgoYHYJcXlyxbzCjt
 +LXTHa7vz+8atJepWexLDxggDv0fBVS+znYnS89p144kpctwbPCKMqnzdjiehXc5DrLC8I7Skl3
 6tQ==
X-Google-Smtp-Source: AGHT+IEy21UJZpH5HbjvbS8lr9b570j8LyVCYAhWgxnKz7fNXlLpp2iHEoci/m3GRK4/7vlcpxTMZQ==
X-Received: by 2002:a05:6602:b8b:b0:85b:3763:9551 with SMTP id
 ca18e2360f4ac-85e2ca756a0mr47745639f.7.1742496804887; 
 Thu, 20 Mar 2025 11:53:24 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 20/59] dyndbg: check DYNDBG_CLASSMAP_DEFINE args at
 compile-time
Date: Thu, 20 Mar 2025 12:51:58 -0600
Message-ID: <20250320185238.447458-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Add __DYNDBG_CLASSMAP_CHECK to implement these arg-checks at compile:
	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several misuses; 4 such
examples are added to test_dynamic_debug_submod.ko, and will fail
compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
be useful CONFIG_ item, since it breaks the build.

NB:

checkpatch complains incorrectly about do-while-0 here; its a strictly
file-scope macro, and do-whiles break there.

It should soften ERR to WARN and qualify advice wrt file-vs-fn scope,
& new-scope-declaratives exception (forex: _METADATA_)

The known exceptions by name/pattern works well (_METADATA_ is covered
by "struct"), this patch just wants static_assert added.  On my list,
with above.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 0e3e14ca4765..da2d677947ee 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -101,6 +101,14 @@ struct _ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
+#define __DYNDBG_CLASSMAP_CHECK(_clnames, _base)			\
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
@@ -114,6 +122,7 @@ struct _ddebug_class_map {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNDBG_CLASSMAP_CHECK(_var##_classnames, (_base));		\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index e42916b08fd4..9f9e3fddd7e6 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNDBG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNDBG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNDBG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNDBG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.49.0

