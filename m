Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3649D1C06C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 03:00:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3994910E5BF;
	Wed, 14 Jan 2026 02:00:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U2Ar6hKp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D1010E5AD
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 02:00:12 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id
 46e09a7af769-7c6cc366884so4256145a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 18:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768356012; x=1768960812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
 b=U2Ar6hKpHGdu+k6t0Z2zuuBHnc+AULly46OOHTiA+4Ehe9XpexJCwqyWEutKBuK/A3
 XWm0a2LosXAXijiKnaUKsIX+NAQvjciqrD/dOjeBStNzriHrpTO8BgrVym355OM//csK
 wdUKEjL4qDdxx5PdxWOY02OLToH6oCFPp2lfaLf0miooynQA2iedL2gtnl4qWsJO3GT5
 Ban8G8OFbPDUTmDJJ2A8Zz8aXDfP6lbFSVQrNqet6vqFwR9Eb575J0zy+Rzkqkv1gLji
 hg/IYKvyX5/5ZVAmVhuThk8WkmR8FNIijJZn6LCOO6sQ8k6lbLJ220GJTzWZ1uDZlvG4
 kmYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768356012; x=1768960812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=m6OB9Pa9Gle2V+EOSWrg2iFtsBZdBFQQ3jPBPibwDk8=;
 b=aYOtboKJFCNISEBzOoP8W1w9235U8nSAQYc2DNsz//pD31ranohsvTzHADfsLN+aJd
 v3xUvBDHwMv0whrUxm2uv13Ph4sOn/fBR6xqDUXI99yqbHOoI50uck2+tkQ0uByyT0nd
 /h7+5fjzGDmFNzxb7ZL5qI72539Dd316PmaseRKHsCvRUZ9lpojXTpCQKm37lsABcq1+
 THwNj/Sxpn3PRfd8BN8GCA9cwVn/Xzm3pmmG1bN8Cjr05lIbb/ylbHntIQnCGQ+TeKH2
 76Pv77VYdeY94DOzWeaaH3nWhMmEFdadB2iSVkuDHSZYhiSrpI2kdBs6F2ysigmzhnNe
 cCIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLzYfq/BC8/XdBGP5rR7VBYRLiizSEYZYPj76zAKLbv4qFttCffr2/qEro+wowgNLkUS+7cFXexaw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym9a2YHmGcQligeqWA22wAGfLVLyatssnkIr+Gyq6M+LU4Yy9F
 99GsKujbFQVJUnj+H1ouykmeQ1HCj3Pdyim06Akdi5TPUgrHRyCOUGz6
X-Gm-Gg: AY/fxX7nqJmCVZ8TrxefwbGYucliRp+cBjhOWBywbK+AsGB1lvVf0wFuuVQHheZ5yf7
 ZBuPgERaZKyn/eINROMIc4bNuZXiqF6I5wGBPJjAD2L78uQjQJs83jJwQv3AO8TwM0KNqoJop+p
 8B9Yk1qpLoUjhX0KFfknbG79SaJ7NTNZNwirTQMb2c3A8QlBHKkB2OoqHy1KBZOu8FpNBUlPG39
 YboCN//0CZ7cSINTI8xevkLQkfuC+pTpYGjTNnqvDTk5SRZkpUVSRcM2Ur+gYjti4UrnsyU+2al
 F7NmxckwZ6pfFOIuOFw6MSw5LMLVxVcfNEEt8ehwJz9mL4CnAcjzTmJJXXvcOMpsWBCB1u968yd
 nSIMfNPXuNku7d6IOoJzUYWXJXDvqz3NbLZsb8fsTYQEDvRbbZ0rE7X3kecFKqfVC4AHG2wJhQu
 bKXuDAh8tnT++BSVFkF+KaJAaofav7zjpagiWcQazHEvl6JbA=
X-Received: by 2002:a05:6830:4393:b0:7ca:e8bf:8c4a with SMTP id
 46e09a7af769-7cfc8a7b27emr879644a34.12.1768356011430; 
 Tue, 13 Jan 2026 18:00:11 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce478af813sm17036674a34.19.2026.01.13.18.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 18:00:11 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 22/31] dyndbg: detect class_id reservation conflicts
Date: Tue, 13 Jan 2026 18:57:38 -0700
Message-ID: <20260114015815.1565725-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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
 lib/dynamic_debug.c      | 10 ++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c60c2142f8ac..e5a18a7d3780 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1317,6 +1317,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1341,6 +1342,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
 	/* now di is stale */
 
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1353,6 +1359,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
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
2.52.0

