Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F91C6B918
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A778B10E528;
	Tue, 18 Nov 2025 20:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ORSfscwq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24EC910E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:36 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-431d65ad973so21902195ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497175; x=1764101975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6vnJl9LV7HlaaUH7ZnHOrsbcFGdoDkm0Y0taUKZPwI=;
 b=ORSfscwqJxsMsE+CSXjvkvFo5iLuppi+OZSqoggL261VYBBuMK99TDMpGDGlqJUNGV
 j5FGFTI2goPsrcF90GqqQGzPLKOlDYtRJFRovavA+tVdln+yRj73HGcLb6cMbOn0G07x
 Sb9Qvo7CeNLH2RTUp4M32sOAm5oWLe7QRGgUNPWe7NW47ebXGYeB6xPRyO9N1FuPH1p6
 rJq2rvz/2sFuys0VXWl5wJiOTZGISp/lNUK0RZjXfV9VrMvAtDuCotcx/fMfS5JCK+ft
 3voN8ZZVOigCvkK5sLO7/i71nRWsljckowd0Z2spDnWwNyLhmWhbS8Ycu6WZ8A8WEgBw
 vgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497175; x=1764101975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f6vnJl9LV7HlaaUH7ZnHOrsbcFGdoDkm0Y0taUKZPwI=;
 b=wv/YQkOsU4mfXVIlcRsXmZRe3+TfR5Jl408LzG9aAYtIqiRyK1cUMUtVwS2ESssbzM
 vJAs6kAI9V0N8X342zMRpqW18RXeFXssY1Qp4sIf1uPRPNCdJkBU2+T4Ud2Bc5tszI5b
 IKqlSJpaSx/cuQpxgAYB+Z2ZCj8ozFaw4Uch67nYKfLuy8h/17zdgCRfTWabgsqgufi9
 mmbTB9IPyb5UN7O1A8vJ1FIU6XMaaO/zThdWTTqxE4YxS1xqRmm06zOX7ztD9MbQTO+U
 cHeZdpVztB/EE93rw1MXvP1HnXGOM6IGCferwE5AtUF7rnBbWpQAmM7JzIhyVwDdc9Xq
 EYUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKl/iRQ8f99jMofp7f+0VpmRNTQShyctvtFcsntrJmQg+Vl1nssmyL8TvS0sZRsN4zGZ7hfa27eKM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTXzaTAp3Ni726dFungJ0HWbrKz8rJbRj90uuhc20jYn3q4UN9
 DgBHcX3plL4A/yiLP1ngjb7eIGbOzqjlXzQ906Ze/VFcLhBLbw/iam6R
X-Gm-Gg: ASbGncvDDL2DqSMxrmatD4rFtwLq1zrFEOJ3XqaNH9xgEXU7RdLOvLjJtsvpdSVH0XR
 x8X0/UFvu9Ov3p+lz/2HYYXvqKFQIX9esc+w2RGJX/lHhYBoH1ZjWM4eZanZO+4d5904WGTbat1
 QrJhMtGhlp5dk4h4J5VqI8GU58rV4v5zFT31CZNa7BM7y/to+TSLGQW4dlTuoq2QHxIc7o+U5Vi
 BbtLeXb0VJdEDMBazcc8p6dJSu22aBkq8YwrA3G525KRVVyGhzy8C/HKoN3EcO+V1oxuTCKDO9C
 pYeXzkogq02MpSgwI/DvchktD4gtbko+GNg0BFTSpJ0Dv5OZPMSysumwJZ12ANoaCZDZSi6c66d
 Pl0V51jCs0kk1+WoxBSc0jdqCiFDtSpGCvypwwMCIXAEqJ2eF1i3BMyfBHfnrwEDeCew+bEX6V1
 Spa0pAdRQT2OiTtWyAm0Sa4VqAeB24uU0N5xjc4adKxAiLJIO1DOSdxEzJ3+ct0KFnqmi4nO3gP
 OCjNA==
X-Google-Smtp-Source: AGHT+IFhMgxL8xO7QXjyxKhciV5i56lPkCw/9yrS08t5Daw42RmTXFSJThazbTqGeULpmbYf4wiCjA==
X-Received: by 2002:a05:6e02:96f:b0:434:a7ce:da4a with SMTP id
 e9e14a558f8ab-434a7de20damr88076485ab.30.1763497175351; 
 Tue, 18 Nov 2025 12:19:35 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:34 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v6 31/31] docs/dyndbg: add classmap info to howto
Date: Tue, 18 Nov 2025 13:18:41 -0700
Message-ID: <20251118201842.1447666-32-jim.cromie@gmail.com>
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

Describe the 3 API macros providing dynamic_debug's classmaps

DYNAMIC_DEBUG_CLASSMAP_DEFINE - create & export a classmap
DYNAMIC_DEBUG_CLASSMAP_USE    - refer to exported map
DYNAMIC_DEBUG_CLASSMAP_PARAM  - bind control param to the classmap
DYNAMIC_DEBUG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v3- rework protection around PARAM

v0.5 adjustments per Randy Dunlap
v0.7 checkpatch fixes
v0.8 more
v0.9 rewords

fixup-howto
---
 .../admin-guide/dynamic-debug-howto.rst       | 129 ++++++++++++++++--
 1 file changed, 116 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 1ceadf4f28f9..adac32a5cd23 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,7 +146,9 @@ keywords are:::
   "1-30" is valid range but "1 - 30" is not.
 
 
-The meanings of each keyword are:
+Keywords:::
+
+The meanings of each keyword are::
 
 func
     The given string is compared against the function name
@@ -194,16 +196,6 @@ format
 	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
 	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
 
-class
-    The given class_name is validated against each module, which may
-    have declared a list of known class_names.  If the class_name is
-    found for a module, callsite & class matching and adjustment
-    proceeds.  Examples::
-
-	class DRM_UT_KMS	# a DRM.debug category
-	class JUNK		# silent non-match
-	// class TLD_*		# NOTICE: no wildcard in class names
-
 line
     The given line number or range of line numbers is compared
     against the line number of each ``pr_debug()`` callsite.  A single
@@ -218,6 +210,24 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+
+    The given class_name is validated against each module, which may
+    have declared a list of class_names it accepts.  If the class_name
+    accepted by a module, callsite & class matching and adjustment
+    proceeds.  Examples::
+
+	class DRM_UT_KMS	# a drm.debug category
+	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
+
+.. note ::
+
+    Unlike other keywords, classes are "name-to-change", not
+    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+
+Flags:::
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -238,11 +248,15 @@ The flags are::
   s    Include the source file name
   l    Include line number
 
+Notes:
+
+To query without changing	``+_`` or ``-_``.
+To clear all flags		``=_`` or ``-fslmpt``.
+
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
 
-Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
-To clear all flags at once, use ``=_`` or ``-fslmpt``.
+The regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 
 
 Debug messages during Boot Process
@@ -394,3 +408,92 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug Classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from unintended overwrite:
+
+  # IOW this cannot undo any drm.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
+is an implementation detail, and must not behave erratically, just
+because another admin fed >control something unrelated.
+
+So each class must be enabled individually (no wildcards):
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement the guaranteed behavior.  So DRM would keep
+using the convenient way, and be able to trust it.
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+That said, since the sysfs/kparam is the ABI, if the author omits the
+CLASSMAP_PARAM, theres no ABI to guard, and he probably wants a less
+pedantic >control interface.  In this case, protection is dropped.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
+call this to refer to the var _DEFINEd elsewhere (and exported).
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
+maps/exposes bits 0..N as class-names.
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+NB: It is an inherent API limitation (due to int class_id defn) that
+the following are possible:
+
+  // these errors should be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself.  There is no implied meaning in names like "V4"
+or "PL_ERROR" vs "PL_WARNING".
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps its _USEing or
+_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
+de-conflict the respective ranges.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.51.1

