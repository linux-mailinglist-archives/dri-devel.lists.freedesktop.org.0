Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F391D1C03F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6874F10E5A5;
	Wed, 14 Jan 2026 01:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CkO8TmRA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com
 [209.85.160.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA36710E5A6
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:32 +0000 (UTC)
Received: by mail-oa1-f68.google.com with SMTP id
 586e51a60fabf-3e7f68df436so352948fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355972; x=1768960772; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
 b=CkO8TmRAzYv1pa83vqtiLR3lqvL7HE+QsqYoxs52N0FwWlaxG3wPoiueopXwhjp4QL
 RYiPSUCcUC+/yJw30OAJzkUrAX1I1Q4QCzkuO8C5oJ4XtcZzpIg0kYqa9CCR3XztqzfP
 hbQh9peM5jvBd09bGG6tUqdFsHPpnqagbSPKzPK2yohkUc1OIkGUCe71Gz0RyeRxNROD
 QXnkTzyMmIBMqoV18vNPrne8cfsz19Oqkb/5YSU+GW5G88olvaaroHPIQH2wZQ2VmT6Z
 UOV4XaOCMN6gXp3USCXH0ICioO5uCBcJW83DR+OciNMJte/PVDJ8GH61os0+z6iYCI1q
 jzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355972; x=1768960772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
 b=auaMwBS4KEtEjaawQ0sHke4mGekTss3d7q4xqmWEvOx4IhmLcf4aPKtnSXnUCf5Mcf
 cz5GzT74xpXClnjWwtxFC8E17/a9RMIZQc9Xj/0c6pc7UQompPb8VLCH8+dbks9ADCLA
 8+HWkZV5q6CFGYpSZhZwTEp0yuyG9NGLlk+7JHE3ZYhfJiz6KxwQf3ORpyNEtnnxrpB/
 5itcdPnuJLprjdRaOTNhNfzpup/1Zm7LVWz0ZhzVhyQ3kMD1709il1rd65r1sOnlFK6r
 DjlOne2KUZGWD4SymXGOCc1sRZ776e2wslUOxsq5XVFeu4rqqVyeHLHtui4lXDnjECEW
 cw0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIynfijAPiSwjqo6zyQONaQ38J4Id54eRkpUh7wryPv20A1K3M1nS9zreYC13WUlQxIk7GRi5K194=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykPCiakVu2w99m/puFKJUic2jHtuPTtNiGSvIt3xuYK3j+ZUXK
 kfim45ctIQj1SXteEnvaDiHVelfecquGa5kELFuxYSCYzDlxzK8FhUwi
X-Gm-Gg: AY/fxX5Xf0GABtx59W88H3FKOPTINeHHgKgHBJuuF8Htzf29fOLJLOqKjO0/azjZvv4
 Iqh0NAgbYFKqH/r0QbFlyMCaJCSdsX2MsPgNEhua1SzaMy34RwpzepLWUsaWfRRQO4X5ATW4md7
 4m3Gil355C5ErG0e1qmq9Blt1kVVATamwt/Ff4vVVOeyU6AoAlWrcAIOM1vjonnrH0hLYWK7Xwz
 +ru3OeXBhvbIgphC6kiP0EAO2On15F3ES6OiZH+RPUgliDOuRonHOtmjuPyjQYTH1R8T5IteuAZ
 jD0ryjZocX7D/ghF21X77NrBXlN1mitE8Nj+vo3l4Oj54zMGvUIeYp/FjA4hFz8NJ4p3nmVaO6R
 /kHxZLhgivL1hjSOlPVfIxqvnGt+Pp3WHYfgM4uaYkltjPLPSOd+SIksZP4jOAeCEgv00r+duEZ
 HyyKnZG3lFPwQsL1XqPJdMnH4SM7mtoBh206ywbTBw92lTApvmsdXdVsl7Jw==
X-Received: by 2002:a05:6871:2013:b0:3e8:9b72:5cda with SMTP id
 586e51a60fabf-4006e417334mr2886940fac.11.1768355971874; 
 Tue, 13 Jan 2026 17:59:31 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-4040cba2d2asm342105fac.5.2026.01.13.17.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:31 -0800 (PST)
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
Subject: [PATCH v8 12/31] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Tue, 13 Jan 2026 18:57:28 -0700
Message-ID: <20260114015815.1565725-13-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 64d69f5cba1b..db0559763e60 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -606,7 +606,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -615,12 +616,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -632,9 +633,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -690,7 +691,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -700,7 +701,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -754,7 +755,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -767,7 +768,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.52.0

