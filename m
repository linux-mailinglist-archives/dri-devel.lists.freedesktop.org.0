Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BDEA1C151
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51FB10E2C8;
	Sat, 25 Jan 2025 06:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PyBPJcNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF6510EA5B;
 Sat, 25 Jan 2025 06:46:50 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3ce6b289e43so25367955ab.3; 
 Fri, 24 Jan 2025 22:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787609; x=1738392409; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urmnkuLrh5iZivbcnepwjXmHK5mBTPl4o7K5sFAjLFQ=;
 b=PyBPJcNkk3kvLQSxigGVujzHtP9ImhbfmTvIDhTzWOUaaN2wvZboVxaTr48YLMJM5o
 FAPsID4cy09zC8YhliiOzlKkbIcSsTLkunjlj2c5l84zLFAKMJlXg2ecQnmJKCx9CNmw
 HlUwq7ZHgHweFIfGX25W7f7sVsJRxcJwugV/KlVYZP9zhAL0V8pY4k2JGMqM2L8BjQrO
 iuudlQDr15KpkhNUB9Yu9A+rq1wynwm0prbYf6QzuZtydEIzttdeDUDb0XF5eu5LG7KT
 XrYSqcxddsEw+Dar6aqrb7eosS3FllsOliV6v/kM7MvpPFNtwrvTMPcaPdza6wKEZJhb
 pDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787609; x=1738392409;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urmnkuLrh5iZivbcnepwjXmHK5mBTPl4o7K5sFAjLFQ=;
 b=iwh0PDuUL/+q2p3piXVYWqj0F3OdQvMMtK3e9cVRFzGvmpX1etyfukgKDa6ctZPBgR
 Ul6ilzU69sTWoFycwfV+40GRinryidbzI/t39YRW6QdKW9H7XdoImaOeTzAEIflduJbv
 bGHChpTOYdZckPr073d/u7X5Abqt+1WOYHBR5b+d3CwPT2bj4jKeBEIhCLUISqvU4khr
 e0lYgXtNV0OZpg8DOZYcBd179Qz4VpfyfP54aOQQMv+YP4GuE7Pji4teNiMGBOz37zki
 fS7T65RbGJ93w8ciGGzmYldEYLHYyoglx5m29okztIXewljeXJnPJQyLVrbbsijcmhtD
 9NOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZqFfwdDXLZvRZsKQJSZa8WoL4ZSo2C7DkHfbtp8FSDW09Hiu/QsZWvr8n4cxUOpWULFwMf0IY@lists.freedesktop.org,
 AJvYcCWiSH3/LX5wHJkZ3+gTIPSSB8gStCp+HI64c4Z3Z6qZTn2yxSk4b67cuXxeiwiwsUQ4yfgC6r//Rfq7HlVTsg==@lists.freedesktop.org,
 AJvYcCXDnwVsSlPoNbazAaJn5qVRFbR6Cp9x9uyUxsdGruP+uxYb88eEUYrR8lJjH+BEWjZHc0La+M+ERxOn@lists.freedesktop.org,
 AJvYcCXt43xOXbvsnO3q9Ol4at1KqH+59YKpb+iMzFmulmUa33/8/HsZF7CssVhBnHNRntitcnVK9MC75rjs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMUkuHXhKr+PFuFLxI/TLslXyY/xdA015vlG2Q+fNxDrtkddoF
 mVMr9Ynm1X6Ug22pI0YsfNfLL4bQIBhntfl2HwQNzhaF6GFkU9oMj3GL8A==
X-Gm-Gg: ASbGncvairIWR89uRYQSsPxCdeIOdjMPJuFA/+SXMwTcG0ABfdgTXsDMQhtJnXuflli
 Lxwt/lkXqkgYkh3C/WBg1fOh2f4PlOS8T6/cYs4fZmdk4Wq8JbE7axIAvSxMJi2ywS06Gr9oDo8
 SRFybpF/3qu4vuJYLZwsRt/FteOMjrrmwqtCsMNIcGpTJEFzeObrV3MhWrrxko36nMW0OZkI+rr
 1n38a2WHcnp/mi3BAO/VCbJS0r/DbV15/GTBSlYqGe0oaUWijntMWy63joYlUEILL9NrztPKdMM
 M6DbdykkESphXGpstxT2rWZEnt/0NlFQjt8qug==
X-Google-Smtp-Source: AGHT+IEvmisYZlf1TfhlUiVyjFpSDJwdao+1WM75v1n/+Qb4/O1LfWsp2czciBXM069u/2UjUxgPMQ==
X-Received: by 2002:a05:6e02:1f84:b0:3cf:b26f:ff7c with SMTP id
 e9e14a558f8ab-3cfb2700234mr145910675ab.5.1737787609593; 
 Fri, 24 Jan 2025 22:46:49 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 12/63] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Fri, 24 Jan 2025 23:45:26 -0700
Message-ID: <20250125064619.8305-13-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a3849ac3be23..fc9bf5d80aa9 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -597,7 +597,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -606,12 +607,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -623,9 +624,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -681,7 +682,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -691,7 +692,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -745,7 +746,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -758,7 +759,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.48.1

