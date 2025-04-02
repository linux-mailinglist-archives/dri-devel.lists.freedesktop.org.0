Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F51A79432
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3630B10E893;
	Wed,  2 Apr 2025 17:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CkpZ1p+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F29C510E89F;
 Wed,  2 Apr 2025 17:42:43 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d6d162e516so931245ab.1; 
 Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615763; x=1744220563; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBFFM339JxjzZFE9F9mUGqskJ1T7S9VuqFHMSYzFpwo=;
 b=CkpZ1p+59xukBbO/wv3y8hW21H0p3+ocVt3Wx77r2Et6ISzVou4JK0FqRlNWg14qK2
 YU/M0zMXfRLDYOJ7/DFIDAna3ced4amAUN32QoAm3Fig30qRfZFFBe7k504ghFkR3+jh
 kU/3zGP/aftZzjMCtue8QXKWwE4hYXCou6y+lZPotrC0m6YXn4Tx1uBvF15J3WgR75UW
 uCZ+rhvobqautBxpv8x5KBXej74XVvsiIGZ20ZluSBIQzyJ1mBeuK7RKMNNjONz6tqHL
 qFYMe8zOtUmCyo3ACKVwF9F/phoNj2HgzLbWnMVmGIVPmB0fxyVGxJlFzcdWfAz3crHv
 8o2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615763; x=1744220563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBFFM339JxjzZFE9F9mUGqskJ1T7S9VuqFHMSYzFpwo=;
 b=LyVpTIfYELVEGZN403VRgxIm3kNd1l3obukfT+2xa1J/6/DUrCjb6Jf2X1GH6G8nJp
 9rBVI7TFcDliA2lS/LIQFPGk9BhgZSQxdpE3CmGBIn5rItV1UB9AQh+6PUds0zVR9PER
 o0B89SJwflSUSs0nnATUsPJloXUXkPXGEa5O+udFrcDF9K/YhR47Tdikspas2n75UXBQ
 wKNqRjpXuexYD5KZqGYXATt33ORXxEnxKsZlnNXqFZCKcCLfFds9y6UuqfVtqBg6gx6e
 gSDMTAeFc4Vy22EeL8amzmmrGvkmC8CdX/c86Tr8LX0sRW4Zn0iG68A4Bcp6sddmzpok
 hOWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVy+pu+2ZYUt4L4XcKK+HC5YpWj8JUf7Y4VUceCnyJB8iAznMK0+gJNWDjzAL115JAi1dR0RDXdFfjMN1OQg==@lists.freedesktop.org,
 AJvYcCVXqYByUax9PzYW7nKL9qJgB9HD5GVh40uIQKHhs2cUdhHH27kG+RL4srU+bFhjhbBoY/jIkJcT@lists.freedesktop.org,
 AJvYcCVyS4Cx7P6T4JwxJZxShheHIrIvUfSne4vTZNBQUGQrGPGtybWmk09l2wFtIXZGRc437GvMIjlMsC+/@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3DobbNV4tucvZAi7iD8XZT1hyGjP4ac/mvY9LzfAEJuLxTx/g
 likXoIX6/lVuBn9V7O72EbR5DME2fI6JgKg93hOQJ1yklhvbHleR
X-Gm-Gg: ASbGncvUCXqR4nsoWdSAkjrZ/Xc3BRFcoXjt3imzTzOO/X4XXjdbC4URB4FTTmzK/g5
 aHvParimlLi0MjzdUJ+xFp34yrtOJzIwucbSu8eQIC6HPabOQfUNy7p39BoRfkbjLKt9IcsG9Ik
 6TWiCbHZOTQsM84UVjzVMUbRt0V0ir/dMIwtfXaN2WOKMo5sLBtD2s+l1mIjVp4MTY7w2vsjDHi
 YIpNcb3X9C51MAIVSBQ1ywdyWT+g760R7bHgPN+AAzUpXxwlmYLqQyjpb0qP2VLNhnA6HFsOgGE
 WQ6WfUgZzX95FqSHnAKgqTkFXRpsVQEjDtV9Vf6ZjZLn1HfacknGEA7uiqLayu3aw8NdfQHcCGq
 4Jw==
X-Google-Smtp-Source: AGHT+IFhLqkbJE0UpVSJmNkM4dkx1ppVBJoKSeZT343o5h63VoCAKbsDpePVjKMaUIz6jLi9wx0olw==
X-Received: by 2002:a05:6e02:1563:b0:3d6:cbc5:a102 with SMTP id
 e9e14a558f8ab-3d6d54ceea3mr34975145ab.13.1743615763162; 
 Wed, 02 Apr 2025 10:42:43 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:42 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>, linux-doc@vger.kernel.org
Subject: [PATCH v3 29/54] docs/dyndbg: add classmap info to howto
Date: Wed,  2 Apr 2025 11:41:31 -0600
Message-ID: <20250402174156.1246171-30-jim.cromie@gmail.com>
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

Describe the 3 API macros providing dynamic_debug's classmaps

DYNDBG_CLASSMAP_DEFINE - create & export a classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

TBD: some of this might be over-specification, or just over-talked.

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
 .../admin-guide/dynamic-debug-howto.rst       | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 1ceadf4f28f9..5eb4ae3b2f27 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -394,3 +394,96 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+This protection is needed in order to honor the ABI, settings done
+there must be respected:
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
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
+underneath and reimplement it.
+
+However, since the param is the ABI, if a classmap DEFINEr doesn't
+also add a _CLASSMAP_PARAM, there is no ABI, and no protection is
+needed.  In that case, class'd prdbgs would be enabled/disabled by
+legacy (class-less) queries.
+
+
+Dynamic Debug Classmap API
+==========================
+
+DRM.debug is built upon:
+  ABI in /sys/module/drm/parameters/debug
+      the bits set all DRM_UT_* together
+  ~23 categorized api macros: drm_dbg_<T>()
+      all calling drm_{,dev}dbg(DRM_UT_*, ....)
+  ~5000 calls to the api macros across drivers/gpu/drm/*
+
+The const short ints are good for optimizing compilers; a primary
+classmaps design goal was to preserve those opporunities for
+optimization.  So basically .classid === category.
+
+Then we use the drm_categories DRM_UT_* enum for both the classnames
+(stringified enum symbols) and their numeric values.
+
+Its expected that future users will also use an enum-defined
+categorization scheme like DRM's, and dyndbg can be adapted under them
+similarly.
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
+var _DEFINEd elsewhere (and exported).
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself; there is no implied meaning in names like "V4".
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.  If a module
+encounters a conflict between 2 classmaps its USEing, we can extend
+the _USE macro with an offset to allow avoiding the conflicting range.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.49.0

