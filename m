Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E65BBCA7AA
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636A910EAFC;
	Thu,  9 Oct 2025 17:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IHKCmk0X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB3410EAE0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:12 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-42f7a4bf805so13347125ab.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032751; x=1760637551; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W0XzNWaGxbCntgrurWhYrm4iEPkiXeipxXgUvuzvBHw=;
 b=IHKCmk0XoZYmHYEtADyXvdDY7i5YTwMY1PjmOlnFZRQZUphGJXoL94APQF4CpP1TeK
 vhT5DPCpmtR3n2hgRHB+/NsWmARDqc856Poe1fivSdpslcXuKXS5qhicwN5y3WtYXYbj
 qd1gnosUf8ojjl6OP+Yk4orV3ADBTF+bF7a3u2mbOUSo99FDLHMO6/YKD62w6G9M/Mr8
 xf4DF1PFVO9zLKDvifYvgcHEE1PAU8cqddxTBssgi7Z7QEQV1kpBHTLRYdtVsHtTu5QC
 RCqTQEWckQ2Y8AtcCKaQG24y25F74m5DKQBA/eitebuvKO8IGINpTLBseV8V/Q2RHQEZ
 KY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032751; x=1760637551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W0XzNWaGxbCntgrurWhYrm4iEPkiXeipxXgUvuzvBHw=;
 b=snANI5fFhBt7YKH3S2PcVUyDPdbR/xIgbps57QN9t3ibvCOqEGKPBhjx6H9Pl2O+y1
 NWF7OX0na12WRXHLV0R+C6A/begWZEnjCz3/uGGNKjqmGppY4UbPNqK/r0NjDQPG4Dwv
 Su8sAEq4S7Vf5Z2L5b2V+eJo17Biz6aKjKWGIPPrEFlKolNefayK47o6Yvd1jdYxFnjQ
 hZOXCMCKPpviX1AD5Ea++CC1/tm/q8JmGbVKq7908mGftzcV5X6PWPfllStvMriO9fAQ
 5qGZmeY9hEFFJWe1tymt5ma9VkpvGft3bNo5mz871U3viC6toND+OvLwYOcfmUV8a3yL
 rB5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHLfcTQ63YkiwmyIM7YUMcFsc7Lg+0B9sILe9P84R3PCWg8N8n1JI3O0cIOgh6C4eueEs+MeIcrow=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbVlSlEv7tv8mlSlHn+wM7UKyj9Obp/OnEqlbifUE4piLX4zYE
 Q3FRyRd8+eI++YPOaFDpLiEEepBWvhRuCY/PKabAQIuwv4Kzh7tqxjXb
X-Gm-Gg: ASbGncs3sTCcaTEAWTQGCOuhyXrhXquhuRmvz3i+CLOPll32Zfe8a3W3T/6FwB0O40t
 eu7hTxosD8AO6+pYl1JN9QaxTnfz9t/xgnMLp1jwAGNLwS4PBp2/yCLf88AcSO+501BRA7F8tAp
 BskBxH6PbnMOL1khnlDFgG0mFrocnyUQIcoMTOpsW/CSTaQeb+C81bY5qy2uoz1sSVLeYmCLGTq
 vTlCxkiVKPvbvN8ONApK9vgOA3p2i6UBmfoB7RU2VmUUm+sdC4pYD2BKFqghLKZpBuaib47zZc8
 86g4ME1qIGtJGK2EFJGdx91kzxyhTP+57cB8pwM/GQQmQxjHo2r/Rex6TaZJcxOx0y1WpMxEj5m
 uatQvxwCJozP+lURaDK3EzpEQsMbaJc1ULHnO4SKSLsTdvZy+st7relhSnL3TEE6ZK9OulOk3ae
 XKPAPpfKEKy8E+ywetE3Gog0KCmSE=
X-Google-Smtp-Source: AGHT+IEYsyaeLyf8EZpNw3F9lCq0tpNVoC1uSjvB+6nwdk9sRQjO0dbdJ/WpD+G+dOz+8SbQ7siORg==
X-Received: by 2002:a05:6e02:378c:b0:42e:2c30:285d with SMTP id
 e9e14a558f8ab-42f8735201emr80190015ab.6.1760032751102; 
 Thu, 09 Oct 2025 10:59:11 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 22/30] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at
 compile-time
Date: Thu,  9 Oct 2025 11:58:26 -0600
Message-ID: <20251009175834.1024308-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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
index 2c64f2401e51..b96f069290bd 100644
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
2.51.0

