Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4003FA1C144
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498F510E2B4;
	Sat, 25 Jan 2025 06:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b1XvCA5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF8210E2A2;
 Sat, 25 Jan 2025 06:46:43 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-844bff5ba1dso225477739f.1; 
 Fri, 24 Jan 2025 22:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787603; x=1738392403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CqVpFbHHatr/2ING85ieH4d9rnOXpZNWBvi8gxx8k90=;
 b=b1XvCA5J82zK00BZjapHvKYqTdfzW9N1pVvaHf/KbaC1ZDKRCWsne9GEI7d3TsWuaK
 kUPKsaoyHHmKdx11y+rxwG3JpAOOqI/H7bmeDUlVFKzT6pagdfxej4F5n33mzYOPI0w1
 qN/gjB4jjkj4+llCHXU1XghqPOea7QCV4JMZzf+Byh0RLxar0HVTFT81OsqEO5NWUYRr
 3y4oikDdVU1kVtthuE5MKaUrlHx5lHul28hrNHos/TukyQDu0ESeNQNJ9wL4UvwQEe8v
 QIipiR8BA5ETTA+fPHnrRTEFscZxefAy/0d6ptYBD7luXlMwpp3QMEQ+KHqkl3HnJlfG
 HWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787603; x=1738392403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqVpFbHHatr/2ING85ieH4d9rnOXpZNWBvi8gxx8k90=;
 b=tUzAeUwoCfj652qkduf54I5dcSf5XJbajWKnhMYu4xFNhcTwM95nGVwTYtHrAP9op6
 nYjcdYAfIjkMwqtPcQvSi8J53XKEp7qZ0yLVPIcqjd161oqiuoQF7YcJMH+1nqDOhCNu
 U2iMdlmjXj88KdWn8VcYiEtbFmFdlr4OpxATleYGaQzXPLPLAiHwx6Rh3p9m9joummJ0
 dsJq4y/a1gW9EWMFr0y3mtFDXfRTQOlGR4x6LZxwZTPNs9NP4IqoyUKMRPA19JaxZNfB
 MU/TYk71aaOU5ubAzke3fjtmgEBD7f6SzKm1CEXqj27b9v36n7mYRUqdAPH6l0VS/0fk
 6zww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsLiILOUtJ70JHu4Gfh9Lgo3O20Erk7L7ALJaOia5mCygG+mRSBEo6/yxFCVbADxYjZI003r1NXhtl@lists.freedesktop.org,
 AJvYcCXOoISiCegIoLh6RdFMvXYgaQoIFqQPHnWyrt8aVqTYJq9L6//bEOZAUsM5dQE0Lu9VNR4SvTxw@lists.freedesktop.org,
 AJvYcCXTqVbaUawRGZXf+AktMUROuD07PbN7SjekO79Zx83fkIw2Rp3WZUhIYl6C8+2MZBHOKv/UlUTJQiXFICcg6A==@lists.freedesktop.org,
 AJvYcCXbv0rwMWJgvGBF89vk0NY4W3qW0U2LgXrDc1Y39zRaUNgsyWO1XXo9at1lvN3q3do5wq5aMGP4NBv2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG5eb6iLCpDaNbCPv/SPZhGK3ftKSG6Am8lBjBEbRw5q3D8/eC
 CUINmmTQtiZGfjzZN+ARbw/XJsmm/p67WqvdtP4yXQ3gw/kYRwiI
X-Gm-Gg: ASbGnctr5lyL4uBUMY2mXJ4JVVntmHHhKkqZPkkEEXrtTOKDKJXRJGzcUz9oGyM+kqi
 4is3ZaqlpxO1rFYBtZKimzUKC39TlCLehOMllXEk4/2pboqe4dtwa9/2zO5zOcCkMZweKAG88yc
 FEV5qyELtA4iZuF754JsJzetjwzn2WEdN3c060Y7ZXq3DXvAMrb/2JJnUtkK/uHmY+IDEji5eGA
 N5MgJRVts9nlaKMAYgZzPrlrsJ2x5XbI54m5+rre5WBRUgjgA2odmayKnWGiEUlG1lE7XjheYOB
 eoVcLgEQaaR3/3s7sxkeX1FR69KvJh7hVX+zgA==
X-Google-Smtp-Source: AGHT+IEG9pcmO7ys8hwr6eegaGLDGSEioGdLb+KAZBSau8bqMWNW5dSAy4HzShNFq1TzGgbki4fQoQ==
X-Received: by 2002:a05:6602:4006:b0:847:560c:e7b7 with SMTP id
 ca18e2360f4ac-851b61f053bmr3495732039f.4.1737787602874; 
 Fri, 24 Jan 2025 22:46:42 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:42 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 06/63] dyndbg: ddebug_apply_class_bitmap - add module arg,
 select on it
Date: Fri, 24 Jan 2025 23:45:20 -0700
Message-ID: <20250125064619.8305-7-jim.cromie@gmail.com>
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

Add param: query_module to ddebug_apply_class_bitmap(), and pass it
thru to _ddebug_queries(), replacing NULL with query_module.  This
allows its caller to update just one module, or all (as currently).

We'll use this later to propagate drm.debug to each USEr as they're
modprobed.

No functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---

after `modprobe i915`, heres the module dependencies,
though not all on drm.debug.

bash-5.2# lsmod
Module                  Size  Used by
i915                 3133440  0
drm_buddy              20480  1 i915
ttm                    90112  1 i915
i2c_algo_bit           16384  1 i915
video                  61440  1 i915
wmi                    32768  1 video
drm_display_helper    200704  1 i915
drm_kms_helper        208896  2 drm_display_helper,i915
drm                   606208  5 drm_kms_helper,drm_display_helper,drm_buddy,i915,ttm
cec                    57344  2 drm_display_helper,i915
---
 lib/dynamic_debug.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 41cbaa96f83d..8adb81e75a16 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -605,7 +605,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new bitmap to the sys-knob's current bit-state */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -613,7 +614,8 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
+		  query_modname ?: "");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -622,12 +624,15 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
+		  query_modname ?: "");
+
 	return matches;
 }
 
@@ -682,7 +687,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -692,7 +697,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -755,7 +760,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, NULL);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -768,7 +773,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.48.1

