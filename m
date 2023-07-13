Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B99B67528BB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D627910E752;
	Thu, 13 Jul 2023 16:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1FD10E731;
 Thu, 13 Jul 2023 16:37:00 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-345f3e28082so3674635ab.1; 
 Thu, 13 Jul 2023 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266220; x=1691858220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=er10hRf8jzqmY/TOv8apCdhuiXnH4dQdxbq4v1bZDkk=;
 b=nUtZHBh03mIOJN4TWeLHRJ7jlkXD96Xyn30/rBF0dI6hQoIWMFxjppRngSnY1uXBml
 tiwPgfApv3SHpplOUnVzmGvrNcF0FA3keXhzN9fI3HUXnMPEZnsNdETwn9lLaDc0vDM2
 oFx2VZf8C8IMnrht7WmcehhH6e/oQ5e6/jlwzALoEuqshmQd6KDJWaHx2a1OldzEbiU8
 xaRXYa6xQINeBZUyiOtmcihHw/k+g7qBeSykmV7xieHlMRfmqIBBU8cpH0Eo19uBt1aa
 SyVbYMxHCIlQZPQ6q9k048SMN2a4TFnmi+AGvmIiVS660FSyRzceY4AmMaG85bRF9XgS
 iaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266220; x=1691858220;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=er10hRf8jzqmY/TOv8apCdhuiXnH4dQdxbq4v1bZDkk=;
 b=TmGYro3F/VBRIyEh3t841hlcYwPbdxR2oDxXRL67r9KydX6ee1q8syDMNl7kkbj/4+
 3ZCEImvjv5+tdiHu5roKY2eT7VEkKJs9JrRdlsr5o3R59Z7WRmTbsy63pnc9/44nO+bw
 EUE3xy5nT118y25ZXaFG+iBWP3DloBPUcMLLSghccW9lyovbc8RWpW0LrdEWnN8S6cI9
 SqzNj6cd3mR3JaDYXqaq3zaAkmnW9O8oi2hvmd9ka8uW5tUeEdMQcEjlhFAYHf/y8+kv
 KMo8MlL+g9E1UUDKdQJMQhhYhbFtthq5D6dp38cz3COhCy2KdqL08KJx4kcc7QgtWVgy
 5UgA==
X-Gm-Message-State: ABy/qLYbykSp6Fk13hU3UyeIHEQYS/VpumvIlFZa/y+iiyqmiEm9+/DZ
 9zkkTHXXlajFwZbPYBl4VLY=
X-Google-Smtp-Source: APBJJlG4Qzj7mKPAp8slrzRbfT1zmTByraCrPdJm0WqrcsUQ9RXcjiMSJVuxBqZcKEywaJiPbLLFWQ==
X-Received: by 2002:a92:ce04:0:b0:345:d2fe:da92 with SMTP id
 b4-20020a92ce04000000b00345d2feda92mr2149751ilo.10.1689266219846; 
 Thu, 13 Jul 2023 09:36:59 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 14/21] dyndbg: refactor ddebug_classparam_clamp_input
Date: Thu, 13 Jul 2023 10:36:19 -0600
Message-ID: <20230713163626.31338-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extract input validation code, from param_set_dyndbg_module_classes()
(the sys-node >handler) to new: ddebug_classparam_clamp_input(kp),
call it from former.  It takes kernel-param arg, so it can complain
about "foo: bad input".

Reuse ddparam_clamp_input(kp) in ddebug_sync_classbits(),
to validate inputs from parent's params, just like our own.
To support that reuse, alter ddebug_sync_classbits() and caller to
pass kp instead of kp->arg.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 66 ++++++++++++++++++++++++++++++---------------
 1 file changed, 45 insertions(+), 21 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8e7bf5e9388b..4743ac2972b1 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -649,6 +649,30 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
+static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
+{
+	const struct ddebug_class_param *dcp = kp->arg;
+	const struct ddebug_class_map *map = dcp->map;
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		/* expect bits. mask and warn if too many */
+		if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map->length));
+			*inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* input is bitpos, of highest verbosity to be enabled */
+		if (*inrep > map->length) {
+			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
+				KP_NAME(kp), *inrep, map->length);
+			*inrep = map->length;
+		}
+		break;
+	}
+}
 static int param_set_dyndbg_module_classes(const char *instr,
 					   const struct kernel_param *kp,
 					   const char *modnm)
@@ -668,26 +692,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 		return -EINVAL;
 	}
+	ddebug_class_param_clamp_input(&inrep, kp);
 
 	switch (map->map_type) {
 	case DD_CLASS_TYPE_DISJOINT_BITS:
-		/* expect bits. mask and warn if too many */
-		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
-			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
-				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
-			inrep &= CLASSMAP_BITMASK(map->length);
-		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
 		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		/* input is bitpos, of highest verbosity to be enabled */
-		if (inrep > map->length) {
-			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
-				KP_NAME(kp), inrep, map->length);
-			inrep = map->length;
-		}
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
@@ -1147,16 +1160,27 @@ static const char* ddebug_classmap_typenames[] = {
 	v2pr_info(_msg " module:%s base:%d len:%d type:%s\n", ##__VA_ARGS__, \
 		  cm->mod_name, cm->base, cm->length, ddebug_classmap_typenames[cm->map_type])
 
-static void ddebug_sync_classbits(const struct ddebug_class_param *dcp, const char *modname)
+static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
-	/* clamp initial bitvec, mask off hi-bits */
-	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
-		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
-		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	struct ddebug_class_param *dcp = kp->arg;
+	unsigned long new_bits;
+
+	ddebug_class_param_clamp_input(dcp->bits, kp);
+
+	switch (dcp->map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		v2pr_info("%s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->bits);
+		ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		new_bits = CLASSMAP_BITMASK(*dcp->lvl);
+		v2pr_info("%s: lvl:%ld bits:0x%lx \n", KP_NAME(kp), *dcp->lvl, new_bits);
+		ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
+		break;
+	default:
+		pr_err("bad map type %d\n", dcp->map->map_type);
+		return;
 	}
-	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
-	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
-	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
 }
 
 static void ddebug_match_apply_kparam(const struct kernel_param *kp, const struct ddebug_class_map *map, const char *modnm)
@@ -1171,7 +1195,7 @@ static void ddebug_match_apply_kparam(const struct kernel_param *kp, const struc
 	if (map == dcp->map) {
 		v2pr_info("found kp:%s =0x%lx", kp->name, *dcp->bits);
 		vpr_cm_info(map, "mapped to:");
-		ddebug_sync_classbits(dcp, modnm);
+		ddebug_sync_classbits(kp, modnm);
 	}
 }
 
-- 
2.41.0

