Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC0876C109
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0014A10E45A;
	Tue,  1 Aug 2023 23:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDD210E45B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:31 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-34911a634edso14503925ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932930; x=1691537730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnBFwGVXb4M2QmKQRaNU5p30+szeEeb7Ty6ZcTbSu9M=;
 b=ZGyv5/vWuF5o/RbTsB7b3v1eg28fUmgxHRFAB5AqTd3J0ur7mLgkWckHzepng0H3tA
 WprjMW9G6ZkiMePhMDL8JuQCh8Hv+N6ReKTQYNXq8Q/yq6gfRbJHVcnjXQ74owoKHPmS
 Tse5GAqDP3KWp6VqdQ7Q5mO8TgSnS/aTqT5/Bl1V7nHy/xMMrNwihkUln6N8CyuZWn3o
 yXIq67TPmPkoAQiVSngJPZ8BuHFk3MTKHMWK4iH/nn1HlJnAssNMA4xgFrs1e+St7emJ
 C5+XvKgJ0SbE/DxqvmKAROjCxYVnPV+Zwz9yxNKBdvfj+BVK6bY/MxuK8X8BuSQO70Bj
 Jtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932930; x=1691537730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnBFwGVXb4M2QmKQRaNU5p30+szeEeb7Ty6ZcTbSu9M=;
 b=Aq/PtcxWNvv8sIhlkrNDtlL4FxOdu3Sm5/FXocLAWi1Ol3WwTdD0GT8rA1gGt71MCD
 gPvBGoaVaXNDXY4tJp9QwAN8QSQrUGJj4eB6RpIKL0IZz6Sa5oMdhfVAbh+E2K8lhPsR
 oVp1OwoFADNgsyNgYqmxc7QBlgkPY943FJS6KYQQzbZC7H9qJdTu62OQ/OfYcy19Rzic
 9EigFKykYEH9Ez7KuwpzndxCaODA5jAXYaqJN16kkIO2yzRPLfzS8q6uKnXH/GQTdlmF
 1p9aSNEdUx2zkui1vrmey0iT3TCmfUyBJ1srqOrBjPPqZx1pPxspIaRrVydHi7hVC/3p
 nlrg==
X-Gm-Message-State: ABy/qLbw1PLNk9G2d8/FVyfJhZ8nxe8cK3GXVO7aIz91cXUFdxL9SlsM
 OrHT1NwYMv5qdU0WJb0QFBs=
X-Google-Smtp-Source: APBJJlHchPsgsfbhdiuDIrmzCE0GQslC3MdNEu251AC2sETJiAxIc3LN/6s4Cir3Mv8WONGXhbnV2w==
X-Received: by 2002:a92:c7c1:0:b0:345:ad81:ecaf with SMTP id
 g1-20020a92c7c1000000b00345ad81ecafmr11209013ilk.3.1690932930642; 
 Tue, 01 Aug 2023 16:35:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 09/23] dyndbg: silence debugs with no-change updates
Date: Tue,  1 Aug 2023 17:34:55 -0600
Message-ID: <20230801233515.166971-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801233515.166971-1-jim.cromie@gmail.com>
References: <20230801233515.166971-1-jim.cromie@gmail.com>
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

check for actual changes before announcing them, declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 4200c72fed09..7430add36423 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -590,7 +590,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -601,8 +601,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -617,8 +618,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
-- 
2.41.0

