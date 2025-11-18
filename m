Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD137C6B8EB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2224610E51A;
	Tue, 18 Nov 2025 20:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FwNomx1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9AE10E51C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:14 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-948f9b5987dso118436039f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497154; x=1764101954; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SOP7OLuL6Rs+m1spO13O+MWJO5WNRZEJe8z7hAFLE38=;
 b=FwNomx1/e/wo7mpW3XjuJHvaZCRxxCeh8Ni3+UQu9KxxT8AyyDP73EMV+HZOIR+APK
 LFo/dbnuf+4jHrdZJJv2K5BUW2B7jhg2uxwM7rri3BwJ0cyPU5378fRmgiiCkP3Akidd
 xB1dxH3NmX9Rv2aZlA3kgCXcKltQPI1O5Nt02fXprTXhS5Yj4wWBV8BrVbCWlwsd12Jo
 bQ3raXXwj7aCML0dcvhSdkkpPvywiO8PaU3DRutP7I7K9iIloXA7wi0AoGVPEjKAcIpQ
 mklI9lRyrQ42OUpsPcu093eXvG2/FDB27GZ+mtIUj4nBJTUiNOTy0yOPJq9bQxNO8den
 BI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497154; x=1764101954;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SOP7OLuL6Rs+m1spO13O+MWJO5WNRZEJe8z7hAFLE38=;
 b=QhffCvU19Bx8MdQTSSvr/gtml0qJ/OqMw5Guj9rMnIbdPsuKzLHZb6Cx5bpHNgqOSw
 wx7+ZmuHH950MPlK4zrQ6yDhiad7vtLV/MY8n4ZseSwh+sL0B/hL9PEFznCfBWU70FQZ
 JuhdP8JZXmvSWp3CZernPf4tRU0OaTgYGcIhY3sl6Xw4crmk3OBMvTWXPJfq8bET87nh
 iYHPVUfJu018xdveT7zqqX5jqHe/uze4vQQpk4tpn2NUZonGub8f7P8gLEd+Ywlz2Cp1
 fTqGG+NgvOICtixp6YOK3D+zy5MBqGIkfPvNVX0qEZyWRb4C/Sy0sY3u4tUgTzm7jTBd
 XERQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF/LimDHA+HdvlcsSwlusM3syUZyLzvUvYlpQc+mWC0KiNx3OidZXQSURtKqRo4KCvaXmjAx9bqpA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlHBsxAVv/9q3SRgWtdAndkHgWQMzKM7JusJtbnUq0NzikRglt
 7RpYz6mstc3NRrTcvP6Jifkhu7Au/l2TxxLlddQokWlI6eB/5uzqpqVt
X-Gm-Gg: ASbGncvyvx5PXHmI2mEvSMR9H7EODtA6XKwrVeFgkQLJVnPycBX/Pn2iwmrXiLxFa1a
 toh0O9xVD25MNw3rBtDkQHFpUe2KFJcwFQvrFLRfNw1Q77bjtiemOTbIKIK1SpeUFD/Bzf8u8aT
 ufgEEyXafVNQxuer30lsxsfhxK2mKCK7J3kv26D0fbKIRSI5IzWKRperTl6nVBEL4DrR4D6YA6X
 Dw8M8KTC4KLjr8oCDo04haugl83ogr6cGasr7BAysLZPcVH/YDWGL2WK3HPaOn0xk46NSz+VCuF
 YSpdIhDECx4Jxekev/g3TNFRNMr/5TK/CmuyOa62sINAaIHytJzfhRbhtuA8uRasNjTlkaE4Ok2
 jsgC6Jg1SvlbE6STZojBgDztGituHvh1S3SlX3fE84i/3XcCOvN24Sb2PppZMRq1T1tMv+g4lj7
 ainABBqP7MqEWJK5ZnDbBrW0J1VFvKkawdreAV/qilTxz04aKAxhs4JcKGK6CjY1Wr+xU6IOFNB
 5eLxQ==
X-Google-Smtp-Source: AGHT+IEJ6iPTY53CeotOpkSdm3SjFRuFfAtmkE5eXc2Bbumw5jt44yQqagO0uBDeBTwAt0IceTrVsA==
X-Received: by 2002:a05:6602:1249:b0:948:701c:86da with SMTP id
 ca18e2360f4ac-948e0db338bmr1851494239f.13.1763497153807; 
 Tue, 18 Nov 2025 12:19:13 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:13 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 12/31] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Tue, 18 Nov 2025 13:18:22 -0700
Message-ID: <20251118201842.1447666-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
2.51.1

