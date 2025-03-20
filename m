Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DA6A6AD8A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F73B10E698;
	Thu, 20 Mar 2025 18:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NUK7dTy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2DE10E68C;
 Thu, 20 Mar 2025 18:53:24 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-85b43b60b6bso41394339f.0; 
 Thu, 20 Mar 2025 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496803; x=1743101603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1nVDSOdSTk0fqBsskB5sY/F3HN+d83fKtpTqplT46k=;
 b=NUK7dTy8KHmVK7L/+haCp9mCktG4q16bGFmrsJ8bwZ2sojadNgRINM5o5HinaQ14BS
 59KP3lY5xCqWN/jggqX7mVjkLexrEmbElO1TPlMfccJt5xWrr8ife6upaH6KC7AZAbci
 8Qb0eteBVxTSv9R9ApR3yPvNuKnhUVRDIjjhmRiyntZuyAe0rd8sDe4vJjpFmiAy8/1z
 TJkS47+gvhiuosC0Zi7oEwKTC3L2YAdWWMuI9XQcYlOOxRdjYCFU5Cj7FUrrGoTkXZoS
 4q12a2InjZuapwdxpoZw2L+NN8cJZMOwnLntckCPbR6uQ9+w8dYM48wZSM2UWQL6HUYj
 ixxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496803; x=1743101603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1nVDSOdSTk0fqBsskB5sY/F3HN+d83fKtpTqplT46k=;
 b=TUZ4+Sg8nWP53ooS0kAOBLjRww8w5IU0tdKngPs/GaBwA4Oz5yqxxCTk4bZy1ytcCQ
 zYJMvWwh2uJV/bgfuBWGNq6UGTM0Il/IWLMvf2NyabVJoWI7FvmSEP7l+NtA0zoeNhRf
 Yz4mU8fDf+Z5HPhu7UjTex5hnd2V1k31I8EAx+iialpszSrn43YpaENrUNTY9o5l6kZq
 PJX/pmrszcd79KCiNsD9HOB5fTsOTEZWbhemwAXhy0fuSp8SfWkxExZkqO+DVHviYN7o
 ONmerNn4jipIX2viS0+u35GvYKMbIkixSmMWpPFJ5h1bNFUMRv8B379v4EInqV/sR/64
 hTqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhWtxohixetWGtK5g5MTrWWKnTZVcK7KK/Kw3mlEiUtLEafFgr0pg3J9bHKerd8HJvP2n0/dyjKFHd@lists.freedesktop.org,
 AJvYcCUvSIKxDD5kGmAHu13OEDUEyDZwkUmGMlWKl9yqXvkOXgIq46pKbQD/tapptpdzaQ71bNzhX561DQtVvGjs8w==@lists.freedesktop.org,
 AJvYcCV4SBZmGO+pk0tXihL1P5g7jl9CL+Yoz2VCZ4k7cxXY8ZE7qRAjGAKhyVbsjheX19U+V+4S+MpdQzJ7a0lGyp14Bw==@lists.freedesktop.org,
 AJvYcCXlt9W2Z046fl0CvXYDRNtjLNOCAoCng9sWOWTMAVmGEu8DHxvGNk9I70+bft7S/PFdkSjVqtADmuMM@lists.freedesktop.org,
 AJvYcCXrb3Iyef7sDFHc2sape4dFe0v7uZp7/GV6I6IoNrF3TdNvD7IwinWCz2FwarTMXOt8ibhLDDAI@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5H1OoBnHzy3sHrc6scqhGVzHQE8dOlwaKAEPjP50YchcC0Tii
 j42h/0Vw5/Z6Rg056YaVpsUKtIkVXb/f5gePG57kufDqgKo49KuU
X-Gm-Gg: ASbGncvO81INNDSUeJWGD42rKH4u4GZKe9+obD4GfEOgfFosJm8cHEVtteQdkZLB7Xe
 MsUuITKj/KzmOvGzHnYu2V8ck+ElNzCGZTtDFZGhHWl6kEmywx7E6xPqqpwYUPxUQteD4k7xN2b
 ahgWYy13vcCwLthfpSkcxsmU8dJpDT3HWPwOGRlCeZAlZvrsRK7XOjLYksfwSsbmgFit09MbnQS
 LH64A8j4dsSkZtQWx5zD23VgIp2OCeqDhCMtrp0ARf6Ed34o2rDQ2g996sJADHnbnGidO5LjfJS
 NTdpnNgwegePmIhMXMASe2O7QHEaYaZO3FCUWTGUOYBADrI7+WaHR1aItcmPrVduGAIl1Y7RyGT
 ocg==
X-Google-Smtp-Source: AGHT+IExFGU9ljWjx6Aj4b9tqQMNQW9GgQqOuAm24OEnh+Sl1LU78XnDIKRwIvCClszHTNZH6s9Ukw==
X-Received: by 2002:a05:6602:3791:b0:85b:36cc:201b with SMTP id
 ca18e2360f4ac-85e2be17260mr111956239f.2.1742496803503; 
 Thu, 20 Mar 2025 11:53:23 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 19/59] dyndbg: detect class_id reservation conflicts
Date: Thu, 20 Mar 2025 12:51:57 -0600
Message-ID: <20250320185238.447458-20-jim.cromie@gmail.com>
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

If a module _DEFINEs + _USEs 2 or more classmaps, it must devise them
to share the per-module 0..62 class-id space; ie their respective
base,+length reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules get 2 bad
DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
conflict with one of the good ones in the parent (D2_CORE..etc),
causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c      | 33 +++++++++++++++++++++++++++++++--
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index aebafa1be06a..e84b6677e94d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1225,7 +1225,7 @@ static void ddebug_apply_params(const struct _ddebug_class_map *cm, const char *
 	}
 }
 
-static void ddebug_apply_class_maps(struct ddebug_table *dt)
+static void ddebug_apply_class_maps(const struct ddebug_table *dt)
 {
 	struct _ddebug_class_map *cm;
 	int i;
@@ -1236,7 +1236,7 @@ static void ddebug_apply_class_maps(struct ddebug_table *dt)
 	vpr_dt_info(dt, "attached %d classmaps to module: %s ", i, cm->mod_name);
 }
 
-static void ddebug_apply_class_users(struct ddebug_table *dt)
+static void ddebug_apply_class_users(const struct ddebug_table *dt)
 {
 	struct _ddebug_class_user *cli;
 	int i;
@@ -1272,6 +1272,22 @@ static void ddebug_apply_class_users(struct ddebug_table *dt)
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
@@ -1281,6 +1297,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1312,6 +1329,13 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+	for_subvec(i, cli, &dt->info, users)
+		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
+			goto cleanup;
+
 	if (dt->info.maps.len)
 		ddebug_apply_class_maps(dt);
 
@@ -1324,6 +1348,11 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", modname);
+	kfree(dt);
+	return -EINVAL;
+
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1070107f74f1..e42916b08fd4 100644
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
2.49.0

