Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD1CA79417
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1149F10E891;
	Wed,  2 Apr 2025 17:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQgdNu3I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFB5810E88D;
 Wed,  2 Apr 2025 17:42:33 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-3cda56e1dffso521415ab.1; 
 Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615753; x=1744220553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeKTBGUd8WybmXrxvv7lQQBEsMgzjZkVTc12353wK+U=;
 b=MQgdNu3Ih5ntRcVdvtnXrLsZ44Wwv/Meiyyf2pfPZdsqvELar3LttChlt71sprduWf
 iY2mfgWz+c9vxmCoePbre+7MPb5djgmsHv1jvLcJRKfji0LMh5rac65vGeWL3vEJOdrY
 Q/CirkqGvxN/oTiOQ8EvB24qAP6oRZ9t+0t4f/TXyiwkiEJCVNFR7yOpklCdjdCcjNV6
 8qoqEUx+sn6dxndl3oCGRLRvJuORCPoaV0F7O3COxwmhQ8OoabrCN8zIUGxXum8Yvpr7
 3B9RWtefnX/K3OPNysjlRYxNE2lPzvWoSF2bqhnk2R471oKDCGyaTLMNsewLOBbgs8wh
 YKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615753; x=1744220553;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KeKTBGUd8WybmXrxvv7lQQBEsMgzjZkVTc12353wK+U=;
 b=Edz/szfVm9l3CHv8lKRkkWTQxMb+ZXVwYdj5G0dhIhhPlwRxXIMNfYxA9NBD0FO3TU
 jLzttqqmv9BtuPgahrPIei8yKtg415kF9z7T5m2tuiVs28rWHH8KvdRXVzOEcidpL6bB
 Q4B5JtUJ60NVUbWQxRMmEfuI++fB6cinddMN3Uao7bbA5FvZHXEGQrggcxVySlu+YSK2
 e6+gxVFvY2xr4gbu0XRx7PReNisKSx3s2Xf/jDCHmx+JmjTBz4cO0tnbuobBrQsccfUN
 LW57yngOzwysvoPT6oqZkJ1SZhgmoC8kAO51zjcIJ5yL7x2xyEuNE69XChE2KA6+vNA3
 Wnhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd/cGyxxn8TpxkuEydjMz8Th2nxo81RLbweQtDQPN7cKMLZn9Ww+WoockvbLbxZsf4h2Dtf0AK@lists.freedesktop.org,
 AJvYcCWlgA6xbL98wTTpsAC4YfsAIoVX0vOkc5dBCOeMfb/ExzLl1ECa1L4QbeM4xXhQOIMiMKmuYUZ6LtFmmwt7Pg==@lists.freedesktop.org,
 AJvYcCXkSDVFFAcl3RyFbyvybrwRaARelt30rnTIR1hi+rzzTayaMPLo0tTn5JSKpZ7D6DlOB51byLsnGVwI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsKeTZIxltIZMuy2rQYjruYspsdvDBewnoI5eWKBIb3CHmPWu3
 16u+Z53Y9RFxaE7mK3N5HrgUV4Kp4WkSOmBw6rkB2rZCfI0X9iVs
X-Gm-Gg: ASbGnctfMomIpqk+/XXUbb9Zzkefq/QBFpWyE2vp5yX83J5R/yxb9OY7qY5TiflDMuf
 bguleI+auwfMUsBOTmNpzRO8VuYJROWpJFzBjxBjUQYa8pK7eDYPGA5YZBETqxajfjRTfibq7Ct
 DyD8H7K+h2TJD+yFXFsAZ8ubq6wAtmecawXP1tkbqPhfE16nFZ/KzohF3Q/ERCq6HXqIw6796UJ
 MUz/iTvwSL2LcL7VA47Y81G6UnJliBSWeOQTDy7lSe5S8oPmV6wAMNZ+OdFd/QAjCRZ0F5ZSv7M
 0BrqpKYqMkMXqXJc8I+odbvHZfoa1JAGilxZnoq6u+SU0RilIfB2VShxKJv9sp19gc6T9fniRA2
 6GQ==
X-Google-Smtp-Source: AGHT+IFaC1YYyq2aq/rDOr7nftMb5mtnPTvXusfBx4cINuze69wt5nZYDtolFZPQAPv6upZ4KaK1zw==
X-Received: by 2002:a05:6e02:3c82:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d5e0a09a11mr204507425ab.21.1743615753003; 
 Wed, 02 Apr 2025 10:42:33 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:32 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 19/54] dyndbg: detect class_id reservation conflicts
Date: Wed,  2 Apr 2025 11:41:21 -0600
Message-ID: <20250402174156.1246171-20-jim.cromie@gmail.com>
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
 lib/dynamic_debug.c      | 29 +++++++++++++++++++++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 37 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 53e261dbf81e..56b503af0b31 100644
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
@@ -1301,6 +1318,13 @@ static int ddebug_add_module(struct _ddebug_info *di)
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
 		ddebug_apply_class_maps(&dt->info);
 
@@ -1313,6 +1337,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE("dyndbg multi-classmap conflict in %s\n", di->mod_name);
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

