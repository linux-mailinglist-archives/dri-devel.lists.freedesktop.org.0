Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0B576C10D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 01:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304D810E45F;
	Tue,  1 Aug 2023 23:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C1110E453
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 23:35:35 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-34914684b62so13595265ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 16:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690932934; x=1691537734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h3lzqTuNVYxni/W/ypVH9Xudq/BD23WdYULzdeze8/U=;
 b=hJkNilHZVeDw9UEK5X9dlwVNTHbfhrDwXT4kKJ3+DN6/f1w8jrvjKk3qNLAfMOZpYY
 SKCiEQNclg/NjupfA21f7rSeTVHbQXQb+r9yOYHkYzUnQfZeiJxMAmNdG3PPO9W/n30X
 Q1ox3KcpuI7jx7xF2g1XEx95NF3CPOt9jit7TZZFZzjCEeKBV2Z5Y5bkS6lYeyslDl91
 Zo9dGq/8YtHWEMKKmf/dmu7xOnBR3GBd0Wr3hPSzXoPqf3fJtEZdrRzDmFRBzpbxNvRq
 M1ZlYW7Kj5v2XAznvBPdtcmL7PXRazN2iwhmQeV7dNOFLPvgeAyS2q7DlQ2wptkJQ13P
 cP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690932934; x=1691537734;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h3lzqTuNVYxni/W/ypVH9Xudq/BD23WdYULzdeze8/U=;
 b=jlG7n/JLRho+r+se4+i34onNFgQUefT2/uevxAPevzZddAAHAbOhqHFgWv+fJ/KiM1
 F1jvQ1BytwlwXSADcKppw7ELzIH3i64zAZcRZw9uQlo4C1zDFvqXuruPxc2+fF7Qr63B
 ixxXFjSYOPHR8+ct8wDX0o7+Vgd7TOCjfW3LBIl55NqMqVxeHhHJEtNGtC4yeX34mu8u
 Ta+On623zonC9TvONnvYYErHp3e/gSQOgRWflq/bxmdayQ2gfqCowrgXE98i65mJgexF
 i6zOXuwwaUoPI/0LfORW7y8KEy9FDMi7VKdMWMtzrpurw4S0rft6nLPOpHwqAhgddRiZ
 mwWQ==
X-Gm-Message-State: ABy/qLblglJAMpp/Ro2l+IGCGoKgs1FD709/7eCHi78rZJLdcWb01O16
 Ej6mewwGkE6pwT89jEBA9EI=
X-Google-Smtp-Source: APBJJlHi37cZY/cNGKIxWz1npBM5eL5uEOooqySy4fATQSJugW7NOZ2HAGEYAKjgwOhlzEywx2BQyw==
X-Received: by 2002:a05:6e02:1d94:b0:348:f6cb:e585 with SMTP id
 h20-20020a056e021d9400b00348f6cbe585mr14904337ila.30.1690932934495; 
 Tue, 01 Aug 2023 16:35:34 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a92ca8d000000b00348d652a6b4sm4157967ilo.48.2023.08.01.16.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 16:35:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/23] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Tue,  1 Aug 2023 17:34:57 -0600
Message-ID: <20230801233515.166971-12-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5139c8d45d12..1bc25dc2cb51 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -592,7 +592,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -601,12 +602,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -618,9 +619,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -677,7 +678,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -687,7 +688,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -741,7 +742,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -754,7 +755,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.41.0

