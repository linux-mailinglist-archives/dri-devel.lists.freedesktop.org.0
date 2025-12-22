Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBCFCD4FDB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 09:23:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C4E10E578;
	Mon, 22 Dec 2025 08:23:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eCkkRrnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B2010E580
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 08:23:33 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id
 d2e1a72fcca58-7bb710d1d1dso5330875b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 00:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766391812; x=1766996612; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
 b=eCkkRrnM77hBrvg/jXlfsrq998rhSJMdw1R9mpGSQqtZohs5+LzNCu6q4AGwSPK2rD
 P+7FoOAJo9csMm9vqskk5bhu7UPqPZfbLfVp1YTBj7FFYmxr0z9Qk7NdeNKbTUWZrlY2
 Wa8qKZ6aIZHT6cXHJp0YBY2xncJLT4j+8n3Nl84JaTV5etGwSiJtb2EZ7t7D/cPWv0Zt
 0XOAZ0TW5pLqj4QCCffQWBJ8nnyFeCTDZjQh4IM5RCH2h44c0VDlSD9elrxc90IvUjy4
 C6/b3xJLIo6dOhqCZjI2hTbxtF7vqz0hEr5vtqQLBwAH9N9WiuFRPhohUUayb2EFhDl8
 fVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766391813; x=1766996613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
 b=HvrNWrLyEorlNdIfdE/fiypFJtNlSD1iSerg6+c5D3SXhl5EurnxMkdBvxqfFid6V3
 M1ct2KZuAfZyf/LANnV93ZEJRkr4wIvswix3oqT351ocIT3BWTG+GZ/CU6VCXGCaZJml
 T4s0+7BJ7VskRF3nYTDoajN7aPBtpBF39u655IGgD/4qiGZAo6fHLaHb7k+bEOblU8N+
 bthDty+x7t1+/T1+G1Ua3T5aALY6ApfnyJVREZPXi7kv1lxnaflmvGbMSYohhx3o3ddz
 CxNeOqEUz+/sRZIpTIzJG/N3dqpUUZp2MllcRUzpEJ+LS6ChcgB9nLVuQRX1gVxlUC1O
 yE3g==
X-Gm-Message-State: AOJu0YwkgoZG6jpnJotdK/GKsi66EBt9q2gwoXB8pjo7X85v66A9JuKk
 Jc44e1jW+AmxGoZKG59Xt4ilzCkBQML66DGdcgPNLo9bZi0o/Acbi1Vb
X-Gm-Gg: AY/fxX6DySHltYoEtMGqtHGM1LaIF6vunURsCz81jJVo/jRCfxt6j/ni/outGfCn4P9
 9SC1aUN/BPA5DN78bivPT6Cw4hkDV9yt+wnATnGdZt4WchV7vs2CPE7cM8UGp4I0SMp1DGn31vp
 Aii8gBblN3xQNamkYhaO5WZ9UM+GY2uz1BNaKeK0SxQDFOKs/0tOtBX8cTb27kuTdkbXmEMtFcn
 P3oTRI/GSEBy3i/LXLG54Tuw3Pdyd8B9zsPoyDRp+B60FNOAJQtkAzMgsqlTZyWydN85A2H2xLW
 RvUUQKEqzGFQuej0KuPo+IUFZYHFXFlj2qaGHESqUrn85CtmXYuteMLrfTH68r4Vstm2dJH5Xrf
 DMtUO063WtX9yo8q0Rcar0YfyHsjF+QGSZTqwtb9V2+d/IUs46/r8q/YMeUetHzzXUfH4kKVOlD
 xKYNc8vhtt
X-Google-Smtp-Source: AGHT+IEAZMs9QfUDe2we6n2g+FitaNoCAtMAvZyB3nOYDQz1xn8UTnE5egrQpYntQN6837WRTsLoLQ==
X-Received: by 2002:a05:6a00:3309:b0:7f0:665d:efd8 with SMTP id
 d2e1a72fcca58-7ff6705d34cmr9495645b3a.67.1766391812599; 
 Mon, 22 Dec 2025 00:23:32 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 00:23:32 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v7 12/31] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Mon, 22 Dec 2025 21:20:29 +1300
Message-ID: <20251222082049.1782440-13-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
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

