Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A9BBCA7D4
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 19:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF09E10EAF2;
	Thu,  9 Oct 2025 17:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EilnKP5/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C6610EAE3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 17:59:11 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-912d4135379so51216639f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760032750; x=1760637550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BkrhZds/ll2Xl8Nzf4vLphQpqfGvsMLkRQg1rNtfyx0=;
 b=EilnKP5/bguJwDbH7skyWsqmXyM05iAaHIT2iIVH5lzM6U+dpCjwpEXucq3d/DeCS1
 Ixy/Xxq0zg1gmEDn0Z3VojcDNq6oXWLgWRuH9M+19Z6K0H5hTPINVOnmqoslttR5DYcT
 o5gaO70Q6F+Ski2MW+pagPdwB+tq09LphHvFIBu/p3tHr2Vrt3woqGG/evRpBOUdns6M
 iglzOgCNTwf6YhSTmqDOLwph2mPfrbEhJHvOTMGTCtBINpD9HtjgEjoGJxRf97pixT8c
 em05maBcLYL7ZA+XLvFL3A1A5h1VCsTakIh3QHd6jrjnOkgV0Di10HXnPzLtKfa/fdSd
 pvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760032750; x=1760637550;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BkrhZds/ll2Xl8Nzf4vLphQpqfGvsMLkRQg1rNtfyx0=;
 b=w9trGxtS3+K2SpHq443+5nkItcpDiFdCgD/1nO7Synt6xEKHJcYmBL0DRwRPEaQBV3
 G6B4ye3wsfRuXcUjxMPYVY1K+fLjIxM8OYmNIpxteMt5/w5SGMKahCNZK3j8cpeb6qf8
 de/XRG+2xQY/Jkp7XS/P2YYivkc3EDFkGDwMNH1TB6IvMuUCRi3FrMIpOtuSKVHvLBXv
 hGRdTHRfYklJX4Cbd0t1YFNZVsRjjWaVv3kDPFRNOTBsqgHHAxNEY1Y/hefgXqkwCf9z
 v+EyCcC8i27n3C4aceGCzDyk3YcbGe6IobUzTrBx78S/8cmIv1vOjZEeYR/q/Im9jjx/
 +D4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBJ1ZttpB5kku8Uxj/3Ep6tvzxf4JdCOhH9CXKq4g7JLXvXqH5VY2utSYWpC1qEf1+FCBCNykIaao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtAjfpzg3mXsl81dA12sN61aCaU8jMiJrE/gf4a2CJjWpYnORo
 xvVxCN9dDA63UGsNLrn1pD3lbbVSH04fAG8gANLCIEsivglDLllVinTm
X-Gm-Gg: ASbGncvfXX2gjjp7lGnxA2HAHpn3vQIswOd0VZsb5EwYPbiTM2OgIvc11ulfyQuC3VL
 bpzTxiSVHmJpQfYwJo3zsJHPGEUvUk5naWjqQbQMhNxuaUk8Dh6a8Mri3FGGC7RWvVrFpWapcTv
 H4QM2lzOWOuNGGQHo9REVeXZtr34cKwVtCKRElVCw+DYS8bzp1dyrfnW3mgYJbXQ7kJsUGIIsDd
 Kb181kHwZeqh2Hlv68/5rye34YBoAFmKjoswcM+kbJLNIhUFFqsJWMB9Jbx+l7QV80y5rx3VBi1
 /8P3wDe87I/Xjj7YgOZivoAnhSP93amxwE/3b3vPyheYN57/AmNB+e6O88JFNxjrTLLhRlfwpTg
 eJV8uXxH7kxXQlpTf/uZ2aicZK6QFXR4xKIqfc4Ce4i7sbaPe2q3sv1QFOis/lii9vqBXKZNwN+
 3q9jtFeva6zexq2Zb+ombYS+bVZT7PdzAGBhhuIw==
X-Google-Smtp-Source: AGHT+IFUtIEt4hZGGPIJzsczKNqnueKXhXvFJxzwNM//vyW6z4t8ra586gGXxFd/BYpLugooChengg==
X-Received: by 2002:a05:6602:492:b0:900:1fa2:5919 with SMTP id
 ca18e2360f4ac-93bd19882e8mr959644239f.9.1760032749970; 
 Thu, 09 Oct 2025 10:59:09 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 10:59:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v5 21/30] dyndbg: detect class_id reservation conflicts
Date: Thu,  9 Oct 2025 11:58:25 -0600
Message-ID: <20251009175834.1024308-22-jim.cromie@gmail.com>
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

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
- USE doesnt need conflict test against DEFINE
  infact its wrong-headed - of course theyd overlap.
---
 lib/dynamic_debug.c      | 40 +++++++++++++++++++++++++++++++++-------
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 54f93d1d0ff2..f94ee518ed62 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1267,6 +1267,22 @@ static void ddebug_apply_class_users(const struct _ddebug_info *di)
 	(_dst)->info._vec.len = nc;					\
 })
 
+static int __maybe_unused
+ddebug_class_range_overlap(struct _ddebug_class_map *cm,
+			   u64 *reserved_ids)
+{
+	u64 range = (((1ULL << cm->length) - 1) << cm->base);
+
+	if (range & *reserved_ids) {
+		pr_err("[%d..%d] on %s conflicts with %llx\n", cm->base,
+		       cm->base + cm->length - 1, cm->class_names[0],
+		       *reserved_ids);
+		return -EINVAL;
+	}
+	*reserved_ids |= range;
+	return 0;
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1276,6 +1292,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1290,15 +1307,20 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	}
 	INIT_LIST_HEAD(&dt->link);
 	/*
-	 * For built-in modules, di-> referents live in .rodata and is
-	 * are immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, di-> referents live in .*data and are
+	 * immortal. For loaded modules, di points at the dyndbg_info
+	 * member of its struct module, which lives at least as
+	 * long as this struct ddebug_table.
 	 */
 	dt->info = *di;
-	dd_mark_vector_subrange(i, dt, cm, di, maps);
-	dd_mark_vector_subrange(i, dt, cli, di, users);
-	/* now di may be stale */
+	dd_mark_vector_subrange(i, dt, cm, &dt->info, maps);
+	dd_mark_vector_subrange(i, dt, cli, &dt->info, users);
+	/* now di is stale */
+
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1312,6 +1334,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.51.0

