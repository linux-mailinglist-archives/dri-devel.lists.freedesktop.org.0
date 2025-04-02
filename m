Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8981CA7941F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918EA10E88D;
	Wed,  2 Apr 2025 17:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XLQhbPEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127AB10E886;
 Wed,  2 Apr 2025 17:42:35 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-85dac9729c3so992139f.2; 
 Wed, 02 Apr 2025 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615754; x=1744220554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hYc+j5mBJIrHD3rqV3hAaVU76cL8/yuTOYYx1NhhgTg=;
 b=XLQhbPEjdZ0Q0DpRpQ7guXRYhAp12moS5Nha8jm6XQCdt6l2tvb91Xg/7PtNJsUBe6
 z8DFLmc0WPN6RU04FHQSd9Qjuk1PlSz/xp2SB3WVQW1XQMEA0gRn4VyJtw6pUVO6wJ/h
 K23R/lUn3fjOx6VZwJpKG4qE+LM993uyHSKN968nntbEBU5R8lt/2hw4rTzMTX0d00oc
 MVvXwBZsxnJlK+8Zu8ZDEuKIYqn/3h5Sa99rODKF3bJ8d7fwkIYoCUFK9aQBFw+yNxuD
 TA794REWU7Npppk156tL/H2GU95p2aC2RemUQzbM51sWnURGidTRHbzINISe2gUX7mYv
 +HGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615754; x=1744220554;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hYc+j5mBJIrHD3rqV3hAaVU76cL8/yuTOYYx1NhhgTg=;
 b=lZhfz2mJ4Lqa5JChCW1gqSuu0Sey5JR/TnUK0ajYI1Kn291gLGm9U+xlJZaiwzeSjm
 QcTfpA4kBRTLiwwU0RYka2xJhLr5xKmWkc05Ua+HN09d+R9Mj5V0UvlNXD895cERYlGl
 iJmnwyaBANHqk4Dwwynthn/0crpbTzV/VqrzPJ3f0r8LyO6ZNSz+ZXZ1CvRkdplteZ8O
 xPC/zlDIt5Kvgfr/Zoc+pNVic0oDfk/cyQFoj2keNOMfX/nTOHN45H/KHb1smuRAC2M5
 J7WNET/3aiw0rheWT59MF87HysZlP96OvaQA6NkhIKXLsSouXsBwtLpobVSZG4qlwx/U
 MDqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2mPKBP8aY0xZVzsSG3AkAt7xBxKP2UVLcXXT18hPespNxq+Rqc4+vC3+LsCcGvDa+gXSBqW6P+XGXV/v0xA==@lists.freedesktop.org,
 AJvYcCWBToh3YmVpNXhHIJWJ+r6bY7yumUnIvnNVPEx1YKvXpAvNInntFYR+J4/EdCTNB2IPGJ02NAVj8cM2@lists.freedesktop.org,
 AJvYcCXPOzF1ht3SYP+36OpPA3B5jlsUN63aUR81BzJCkFwG5MoS0slEsJnxKmSzD851cR553wwMuGbO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjhdMiijpEeWaXHvWTlCSkvcn6m1M+0KXgro9qPlzykhye/Vcc
 NPC9dgBLH2u4wCNhlrLuDo7C393l6Mfe7TUEHvf0LdxOL4Gf1n6C
X-Gm-Gg: ASbGnculPL9FJ9XT5pkUVGOoDYbynZDN/s+XVHebo/BIv1MBwyvPHs3aiKNXsSY5YFP
 4m3AAq+zvxhhWm52WlsM41s2KpdVtZarMeI8laiGEGBtQkH8/wOAe3wDMrsJ/67ah27W0JryYQ5
 eUw1Qvo/LQ3CFlixLzhkg4wutnX98rj+qJXHHCsB1VQFyVrMMC6DhYK1XaAiQgG500DvDl2eezw
 oRpGwStHgRraFqaNK2vroXCmzSGJadY4DSAxQGMerCRwWC+SPkpAls+4x10ODvUABtKolh3gK+K
 XHs+3dkQOVGhAg/BjxhwHzP/GsRAA+UlM4llYQuiaE9xHcv/gePs8gX/TOITtAh/fozHVazhk0E
 PMf3/ng3T16Zs
X-Google-Smtp-Source: AGHT+IEVAbHMnIO9dfNIpvtNs8ZLp2t2qagN4qTEja9BzZoYvl4a7Bc0A3a/xIEdjKgwP/E1I/zqhA==
X-Received: by 2002:a05:6e02:2606:b0:3d4:6e2f:b493 with SMTP id
 e9e14a558f8ab-3d6d54cde77mr38291795ab.11.1743615753974; 
 Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 20/54] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at
 compile-time
Date: Wed,  2 Apr 2025 11:41:22 -0600
Message-ID: <20250402174156.1246171-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

These compile-time checks will prevent several misuses; 4 such
examples are added to test_dynamic_debug_submod.ko, and will fail
compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This wouldn't
be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- $macro_name =~ s/DYNDBG/DYNAMIC_DEBUG/

prev-
- split static-asserts to __DYNDBG_CLASSMAP_CHECK
- move __DYNDBG_CLASSMAP_CHECK above kdoc for DYNDBG_CLASSMAP_DEFINE
  silences kernel-doc warnings
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 11 +++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 9af825c84e70..4941ef2adb46 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -99,6 +99,14 @@ struct _ddebug_class_map {
 	enum ddebug_class_map_type map_type;
 };
 
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
@@ -112,6 +120,7 @@ struct _ddebug_class_map {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
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

