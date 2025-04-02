Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCEDA79408
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810A010E87A;
	Wed,  2 Apr 2025 17:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c/4WyQr5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F96410E886;
 Wed,  2 Apr 2025 17:42:24 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-85de3e8d0adso680539f.1; 
 Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615743; x=1744220543; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvjbELtWnV/6RRAeJjKQ44+/OjVwNVd4yFNXgDDBNwA=;
 b=c/4WyQr5kJUvUgEoeicmhl7UNPjQ/jZNff/dBeGbOwuTRjl+vtvYlK1uvLQ2rJaT9a
 MLlkpxERFO6nwbLGjFEMcJNnu8svsDYDUdLRSx++Jj7eCAdSU2SLdiYrM9GgFGm8lqs2
 E/U/S7Cd1ei/1EsY4uz3O7cHscvWTolua9Z59jS8fb+SrxonMMKD2Ra/+9tCwbpxeE4k
 0/FSmtSN3I+YKLIT9k410QSjcB+SGj0eDP1YOScqpzckmq7oIEgCv2G3gYZLpQ5O2VZK
 PgKXa0LACW5D2v9aACMJ527rTiBQ6n18i1WTd305R0WrRBow+Vjq/sjcqHjGlgSiztTO
 TlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615743; x=1744220543;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TvjbELtWnV/6RRAeJjKQ44+/OjVwNVd4yFNXgDDBNwA=;
 b=tTUTKjxk6dlAQcPxCQoqfhTovDuummNpUzeflr4P3IJZIuqIHGtESiIWnCHPQLzbSY
 ybrW9+ItsgWa9t7UUvTegWy6X2gwfGLY2f0nRJR5Y/k7eZspGoK3N2MrdYhf5+MfcSJu
 Yj4TCQgCy2H64Qvn6Jy6vTjmGEdccKjBb+xmTX4sPror56d6OTEnZGV/xGe9gTyO1uXj
 jLaAKh91FcPFpmWS+ouWDpe9aJQAKbLctnUkGjg09XVsP22USZbtXdT7vvGejjjfXv8S
 L5SvVknRwVj5dei/nfrHOXkqtmRfscZNzrgAZkHeVFKXAcJB92mc1N5o+muCKKjpeoM4
 JrMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI97ckknC2cg5PqFbiQ+MLkZ2NSplaBFcZwo7MhrBj4i07UC7fEY04wXuLubMzuNdgyzHFmbnujOHm@lists.freedesktop.org,
 AJvYcCWTtoHITdrBTDBQe3v7/IEbm/ETjJklImpOKzvJrJS3Aw/+06/lUyYJmwkq2HKyyGsoiwF92pHtGgw5qz/6og==@lists.freedesktop.org,
 AJvYcCXcYeq1fcZisEaM78sduTFSkJ7yQwXrGSz7mzwzdstREEBM/fX/QFp54fkAvT/zFHrX693pxECB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaAKeB5gdtD6QFHvE+bbe3ODebZKe96msNi4iPd1Er4WPnG3pP
 tOXqoawpJqKkc08KW0PmsXdyoBImLV8L3Wf5s0AiVAxC0CkBerCj
X-Gm-Gg: ASbGncvX4ZMsqyvMfFoZAiAtP2RYcTg99g/rU8MrGpI2PI911prPmj1mWIdKBbe+ZXf
 2tL0aQndTiaJPjh+0DtNLZWf0V4BRhksg29l69dJBE1t1gcUw9Mj+4zjtmEgkMtuumgKH14CkH/
 3sXsHcTlM7CVWJdoesSPdU/a63IBSqtgo2i1xCkC0cwlHwAg84x4uzkdlYwqilkFrzNWnVWXIbt
 rW0j2sZi1XC5H10Q0ni6lkpLKsXVEF5frVpe/UTdqF8xbgwbD4nmhOJQZoABqCm+Sr0I3CC6J/i
 dmg9FTPesxV2Bs8+8pOyWNmPV1EUt6/ZbUrhKxCy5akgwWcjXIqVAaKTgAGugw7GTTuJxcu2ddc
 qLA==
X-Google-Smtp-Source: AGHT+IGs85dZsLuENhKJMhd+4RgG2Mp0KjLcFlPdCM0oKKyQhvn0ta0pOjzD/VWsfZGf5qORX7r3hg==
X-Received: by 2002:a05:6e02:1b0c:b0:3d6:d3f7:8826 with SMTP id
 e9e14a558f8ab-3d6d3f7c548mr56059025ab.20.1743615743459; 
 Wed, 02 Apr 2025 10:42:23 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 10/54] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Wed,  2 Apr 2025 11:41:12 -0600
Message-ID: <20250402174156.1246171-11-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 3ad2e38c9ae2..621e04b1f28c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -604,12 +605,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -621,9 +622,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -679,7 +680,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -689,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -743,7 +744,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -756,7 +757,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.49.0

