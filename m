Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AC167BCD6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 21:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4372A10E866;
	Wed, 25 Jan 2023 20:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893110E39D;
 Wed, 25 Jan 2023 20:38:03 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id a9so33252ilb.0;
 Wed, 25 Jan 2023 12:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9HRoCN0BIE/LRokbtsolRSKTKnukq0u/TXUOu2z2LhM=;
 b=c2nSWGPCIw0GlohJLWjbaOV/JLwwC3BuyMQoCDhCjopL0mcSu9XOQZcA9ZWW41iOdU
 m2dBXF4DObtB2eyBxWdBs11v+r1ooffrjDwLGx+TxDRKD13nfsLmuUsQX5vvVa4VlvJf
 kC1VsITwfSrzfgAK/qsHBI6TOpJciSPHKLW1Fl7IVPjsx1ntJvutGhqVLG5tfH/aMw3g
 TB41eUq0d6cJ/TuOpyMZCld9gN/sTXfSlJfJlaKv0+KtbD/dP75+bfD+twHrICnIqOyb
 6oUKeAhi0MWGNsDtvP0SsulnvzNup0Y56eJQvYhY2VRMvXWRbSpglUtNz5kRM0Hp6vYs
 cKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HRoCN0BIE/LRokbtsolRSKTKnukq0u/TXUOu2z2LhM=;
 b=I8IZQ/c4YtI/9T5ZDf+WZDjQ25iqp/VFbd17m0BZiFR5IoToNhu9cfPDoMhakhNpHZ
 WuzyRgrzZV7vdmM3Ql1GKCYhAI9PfvzGpJUkHp0mCK3e6xVhf8V0jCdlS4gQNszZh5A+
 BoOCLDZ5si3nqLm7qfF8zWjtmiuXw4aMhbmnLH4lamkrNSXQIGfcP/6gdRah4BF7aGAc
 Gn+wVyaB3IBUhaVCDOq8whL907LdKjqaMB4SThjlggNqjR/n4Bc6a3YwK7vLvK/9EF2m
 Zx4a2j4C+BPdiHCfTT7zrTHPUsCa0+w25xLvkeJ3RwIwulxQ64hVvtGm2RNMzqQ5uhTe
 9/ow==
X-Gm-Message-State: AO0yUKWXOyEVvFP6XWZZahFu1BWyrUBPYW9jAx859wf3nlJ9mIJL3IfJ
 iTtDMC1uzMhfSIycnNKnU8U=
X-Google-Smtp-Source: AK7set8Zkk8thpQ24RIvB5bW/uJjdwoj2cwGGMNg3TF6cP86ahbLUErdIOkJ7NQNgefPGAZ1bvWiyQ==
X-Received: by 2002:a92:c266:0:b0:310:9c6d:e7dd with SMTP id
 h6-20020a92c266000000b003109c6de7ddmr4482113ild.28.1674679082783; 
 Wed, 25 Jan 2023 12:38:02 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y11-20020a056e02128b00b00310a599fd43sm665104ilq.46.2023.01.25.12.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:38:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/19] dyndbg: split param_set_dyndbg_classes to
 inner/outer fns
Date: Wed, 25 Jan 2023 13:37:29 -0700
Message-Id: <20230125203743.564009-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125203743.564009-1-jim.cromie@gmail.com>
References: <20230125203743.564009-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inner fn adds mod_name param, allowing caller to guarantee that only
one module is affected by a prdbgs update.  Outer fn preserves
kernel_param interface, passing NULL to inner fn.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 943e0597ecd4..0a5efc735b36 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -707,18 +707,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *modnm)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -755,8 +746,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, NULL);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, modnm ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, modnm);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -769,7 +760,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -778,6 +769,21 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+/**
+ * param_set_dyndbg_classes - class FOO >control
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * Enable/disable prdbgs by their class, as given in the arguments to
+ * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
+ * levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
-- 
2.39.1

