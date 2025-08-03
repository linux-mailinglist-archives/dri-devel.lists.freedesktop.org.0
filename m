Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B7AB191E5
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA9210E4B8;
	Sun,  3 Aug 2025 03:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhZCc52J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BFF10E4B6;
 Sun,  3 Aug 2025 03:59:05 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3e3d0cba6a7so12045795ab.0; 
 Sat, 02 Aug 2025 20:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193545; x=1754798345; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=;
 b=DhZCc52J8mo1ol/1MYcVcR9sHgFch1sYjgWRHmuWH4Tz9kDUTjg2mPxLSsC2A5D9MA
 wrSWiHRgLUDs2+BYdjPJl7uZURiROjF0vivpDGZ52H6qQqSd54SveopNvPrwKqksyyZe
 Hl0r3M7MskyCZhmvA+BcRJp8pLJ1/Ev6+5ryl+qyrmBpVYDrxuH6UcY4QEgEVbcnh4vX
 JRH4zTB31CYPT+u0qRVH+NnMOzvgGeT/WQNSUJoK80aPWUCtWKkfiMqvhGzJY4wOUIuz
 GDtmrv7E2IIsjSasPT0nevqdKB4rk7nreorR1m17u+U4VaQC7NyVYjjtdZkyQsaoQ1Xk
 tFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193545; x=1754798345;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ARFL6N/7u0yBvj65+SeUK5cuQkDEObUSqpQweZqDyQ8=;
 b=xAq730rB+S8kdUP2v7lf4u60GgtGn5fK72qsNR44WhejdJPe2V/fbOhKpxZ0hehT+B
 OyXNbw6X7WC6yVbf28sSIor9yCwePyfgJiRplm1BHoWNPBWmObTAHRnZb08lBIDIL9PW
 1IzATN7jFkzKHgyXASRJVjO2VmVIIln74LR8e418JhWrn/SWES4fapRl2EKJknNlCr5U
 sYhZIMvfTBjLw82BBL2DKqqVpYewSBYqJw8GcYW0sPKV+7Q0Sfe9gUPrMPfFAOGunCqZ
 1So9LjeLyi2XsrsdB7LaBjKYUk/2PS8m8xlsxPIaBWZDAMS6y4G1pmd8sQ04fN3w6YgL
 ZURA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOIfKt3BQ/s2Grknf9dA22zQ/0yGl2OSmBO9gkuMQkr2RhfYNh8G11BYfEExEjTnZIwEX/fz06HN9iE3Eagg==@lists.freedesktop.org,
 AJvYcCWuwORfWWGQ0exTUUk64pKmhvYFxd9faMgYk2QoHeZMkv6fst90+aM/OPPYcXXgyjluiu6jCbUG/3uB@lists.freedesktop.org,
 AJvYcCXHhgnMyaXBVnzaiclBY2jiDy0Xr7BtVGNNzjgXZ40CIPqPX+leUZng2rqGNrZHtkFAQ2UAPVbz@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVdO0L86Wp2OJ8TngaI/JtE0yCG7CanbPPT/RT7I3wTgGEU6u2
 BZ4IbeNCnZfPq9AZphMIfPiGXRJl3GklgAqQoljSkeKBjo5khIMZutsu
X-Gm-Gg: ASbGncud6vxMpohkkG1A9e33RairSwfSEHO4buvSOA+qvu9FldPiT6F5EB7jC5U5hJq
 BIjUm6u/cPKwX+PuETLc0gnVHo10QjdLZYRu2qPrEJcJEWmyI9dSt66odfIa3KH0BWVCjH31WYC
 drpZZDSamrRpnwwutxipPXc+gB7AeCD4YSCi5K0X1qh/yia8NLT4j4eNVOrDeJnZJr7zG61uwYT
 eIiDlLSYdGBvOPOYF2s7lmm7lfsRhWKMKSEjZgZoFN6F2AQUDqbgmBOiCXVZKaGRSQeqOBmsbCS
 fQbHkSleli3o8y/s8kh/o+H5Xo2aZU8QiijvcvQ3b1haPp4hGOsKHrZz1yoJc4mM3JJa10dH0uy
 fHfzvZve6Q4ujDhFulmNuRmmqHUu6M1PiKepTmsOzhD+6FkIU0I0LChaWoOVYtLFEZmm6AlGvzS
 IDbw==
X-Google-Smtp-Source: AGHT+IEBzXwTpz+6kufpgt0kt/EVEpquD0XeO5VyPFcOTsTn6fzv2h6s3BTW+bB/H1codZT3P8zPWQ==
X-Received: by 2002:a05:6e02:2208:b0:3e2:9aea:8049 with SMTP id
 e9e14a558f8ab-3e41615d13emr88848645ab.13.1754193544756; 
 Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 21/58] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at
 compile-time
Date: Sat,  2 Aug 2025 21:57:39 -0600
Message-ID: <20250803035816.603405-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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
index c45f5b76763cc..9bcada421e88e 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -110,6 +110,14 @@ struct _ddebug_class_map {
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
@@ -123,6 +131,7 @@ struct _ddebug_class_map {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403ae..e83b34b6d6b95 100644
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
2.50.1

