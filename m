Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5E0A1C166
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9E10EA59;
	Sat, 25 Jan 2025 06:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UnkrnP1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073C210E2BC;
 Sat, 25 Jan 2025 06:47:03 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-844de072603so202525239f.0; 
 Fri, 24 Jan 2025 22:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787622; x=1738392422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ay4skInVUyOhJHhfCYrUYPj/jftvwF5qPOXpqm+4U44=;
 b=UnkrnP1lJp2nAAiIHreR9adR6M0UeOwJCGCsl2dIG8hhgDxcAfh04od5OHOQ6mPwfE
 oo6xbxkSnxnm5f19HVMMWL7HKXJRf9HTF9RG1f1D2P1Af38vqNn3hgbzhKKGgUsR7AYI
 uC/raS0kuFx5C9zzJYszi/e3MlLBGeLDP10BZcVB+7ieMq7jS+s9M59FLUQ/WJYk5MIS
 /fFEov8vfZoGUiIjUmpFYM2jHZR6g2QH7Tw8zZ7VRVeQAo6gURZiOBszVSIq5mN96Evb
 oENBmDkClIWkSMB9ChC09G7bb850tVMAOk8UZyMvrX7d3mgmlpZI7EAcjkrN+a0XvCvG
 lWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787622; x=1738392422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ay4skInVUyOhJHhfCYrUYPj/jftvwF5qPOXpqm+4U44=;
 b=C+O0FobwxqWLR28zHLr1Bnt5QIR69VURSzFsyvIZ4TBzwK66SRnpAfsJ/IDa5N55rC
 baa0I3lkxFD4rAJQXQ10j7plmnSLs/bwDzMiPBZ1dzfdfdMTA01O49rLtY0MggrOyhCs
 PlWHlgpadnMPw01D4qZ3eShuQQ8JAlBPLn9s8vY8wooBwKuUNMsRfqsQ/ivFVTDEDnxX
 //FZwx42hu/qY0GbUbDHrCgg1ohp0hlGzasYBI0JX/6Kiz5+zDakryxN+p0pLeBvbFN6
 eYX3ACKHRIPdj1lccD/XL5kywO8gKdB1O3ur5/sFK4w+zIYeqrGrNHZMIAwOXJfGqEeZ
 30rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUG2N15sI/RKKAql43zJbPIzzIXHazj0JGlHpFb6bmqOvDb2Jv9AbLXgPh7t/bkNM0zChk8izbj7A1L@lists.freedesktop.org,
 AJvYcCUGNA10zStiNVxZjJ6lubUahKljxnmuGa2boWDeUftUHDp9xIMYRQ2jKqepmoaM6inEqWBda9Ns@lists.freedesktop.org,
 AJvYcCUtspcqqVnOqz/47+DvDlc64bjpBET1MPMEH+YfhVKGDRhxp/M8AXSWbIFVIzsSoxbLPOVYJIh12CuP@lists.freedesktop.org,
 AJvYcCX1hnICQMmVRn6QSP98vkPqqMhjJK4cxeUUeAfYdzY01UIhQOO8t3MaS1RPGQzgD7SALczkY9Y7hQbnzW1keg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1D6cmdfw73LqVqhBsLCxtxu59O6Qi1hpcNTdkfoYSKOxjm3ir
 9/vZxfW/uPpu2RQTM6HrtJvFmzcAnLFzpw/d3RgqfcoEFB6Xi5+X
X-Gm-Gg: ASbGncsWFG0HQPg6QvuCMrG7D0DMliA+T5yoYM/iZoKiEV3fP0uaRIbcJIYXe7SpooK
 zdYixQdz2+uRKhr4TjRKekL6B/QfrdF/BcIZUiAZaAW0c4kOjU23LDvloMMlhrfImLFSywu/ZFO
 xWM1od5t9/zODekCFba+uWwdwj2p5Q/EpNMwSO3QVvPRF4BsQ4ogSQ6WIAD9tqKV4VfvUqOC873
 mov12KpfGl5bpJUz5TVxsIksyR8sbAUe7QhcEAHFW5cCLq4R/vepWfooLr9qXz9bfiE3AzkoU7K
 D3hNXhOR2YP4TBogYyV7PFrtLmfEPmg8ITSvcg==
X-Google-Smtp-Source: AGHT+IHwnJ59B7v8sJsE0jjHjZyiOHK16NDE06hCK0yvg1ng9VyLIvAL9ptQW3TlC08SLLFiwpxM3g==
X-Received: by 2002:a05:6602:36cc:b0:844:c76a:354d with SMTP id
 ca18e2360f4ac-851b6162856mr2762621339f.2.1737787622215; 
 Fri, 24 Jan 2025 22:47:02 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:01 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 23/63] dyndbg: fail modprobe on ddebug_class_range_overlap()
Date: Fri, 24 Jan 2025 23:45:37 -0700
Message-ID: <20250125064619.8305-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

1. All classes used by a module (declared DYNDBG_CLASSMAP_{DEFINE,USE}
by module code) must share 0..62 class-id space; ie their respective
base,+length reservations shouldn't overlap.  Overlaps would lead to
unintended changes in ddebug enablements.

Detecting these class-id range overlaps at compile-time would be ideal
but is not obvious how; failing at modprobe at least insures that the
developer sees and fixes the conflict.

ddebug_class_range_overlap() implements the range check, accumulating
the reserved-ids as it examines each class.  It probably should use
bitmaps.

A previous commit reworked the modprobe callchain to allow failure,
now call ddebug_class_range_overlap() to check when classid conflicts
happen, and signal that failure.

NB: this can only happen when a module defines+uses several classmaps,

TBD: failing modprobe is kinda harsh, maybe warn and proceed ?

test_dynamic_debug*.ko:

If built with -DFORCE_CLASSID_CONFLICT_MODPROBE, the modules get 2 bad
DYNDBG_CLASS_DEFINE declarations, into parent and the _submod.  These
conflict with one of the good ones in the parent (D2_CORE..etc),
causing the modprobe(s) to fail.  TODO: do in submod only, since fail
of parent prevents submod from ever trying.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
---
 lib/dynamic_debug.c      | 30 ++++++++++++++++++++++++------
 lib/test_dynamic_debug.c | 11 ++++++++++-
 2 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8afcd4111531..8e1e087e07c3 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1211,6 +1211,21 @@ static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *m
 	}
 }
 
+static int ddebug_class_range_overlap(struct ddebug_class_map *cm,
+				      u64 *reserved_ids)
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
  * scan the named array: @_vec, ref'd from inside @_box, for the
  * start,len of the sub-array of elements matching on ->mod_name;
@@ -1242,9 +1257,11 @@ static int ddebug_module_apply_class_maps(struct ddebug_table *dt,
 	struct ddebug_class_map *cm;
 	int i;
 
-	for_subvec(i, cm, &dt->info, maps)
+	for_subvec(i, cm, &dt->info, maps) {
+		if (ddebug_class_range_overlap(cm, reserved_ids))
+			return -EINVAL;
 		ddebug_apply_params(cm, cm->mod_name);
-
+	}
 	vpr_info("module:%s attached %d classmaps\n", dt->mod_name, dt->info.maps.len);
 	return 0;
 }
@@ -1255,10 +1272,11 @@ static int ddebug_module_apply_class_users(struct ddebug_table *dt,
 	struct ddebug_class_user *cli;
 	int i;
 
-	/* now iterate dt */
-	for_subvec(i, cli, &dt->info, users)
+	for_subvec(i, cli, &dt->info, users) {
+		if (ddebug_class_range_overlap(cli->map, reserved_ids))
+			return -EINVAL;
 		ddebug_apply_params(cli->map, cli->mod_name);
-
+	}
 	vpr_info("module:%s attached %d classmap uses\n", dt->mod_name, dt->info.users.len);
 	return 0;
 }
@@ -1311,11 +1329,11 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 			return rc;
 		}
 	}
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-
 	if (dt->info.users.len) {
 		rc = ddebug_module_apply_class_users(dt, &reserved_ids);
 		if (rc)
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b1555b0a2bb1..74b98adc4ed0 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -81,7 +81,7 @@ enum cat_disjoint_bits {
 	D2_DRMRES };
 
 /* numeric verbosity, V2 > V1 related */
-enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
+enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
 
 /* recapitulate DRM's parent(drm.ko) <-- _submod(drivers,helpers) */
 #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
@@ -90,6 +90,7 @@ enum cat_level_num { V0 = 14, V1, V2, V3, V4, V5, V6, V7 };
  * classmaps on the client enums above, and then declares the PARAMS
  * ref'g the classmaps.  Each is exported.
  */
+
 DYNDBG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 		       D2_CORE,
 		       "D2_CORE",
@@ -113,6 +114,14 @@ DYNDBG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNDBG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNDBG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT_MODPROBE
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should break on modprobe.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.48.1

