Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F160E75289B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5DC210E729;
	Thu, 13 Jul 2023 16:36:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DE510E71D;
 Thu, 13 Jul 2023 16:36:52 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3460aee1d57so3899885ab.0; 
 Thu, 13 Jul 2023 09:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266211; x=1691858211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Ad3KO712dvatMNJgTE1b1pUBswB4LDwoWCb3mLq7M4=;
 b=IQppnCc2bwhNhpaNx3A2BOCtrbsFFAIpVgycUeA6zfnK0gMfAv56EGJDl5oKzWYbhT
 RTRtt1e+jLzqrTBDJNbNfPxNVsxQvS5mow14GA4KwquwEj9OR9PoR6nzGgrU/81gWcC3
 x4Yr9BtEKACgJQTamjxKieDvlPv8zHkUD1VTB0+x8CeJBJiiJ6EEasJhUsa6JLVMET6L
 wYOrDIuhRsKkLd5GyynPrgHvM7aiBp6FMmw/LPjpCiurfFcmItdKcgTAahtUKNfAZBLU
 ukImJRZfQNOmymJyEE15Vztic1U9dPXCNbhySxtfXyKpYssHo+GpMpbBXlNItaY9uxyr
 Q2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266211; x=1691858211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1Ad3KO712dvatMNJgTE1b1pUBswB4LDwoWCb3mLq7M4=;
 b=dlhbUN4LCy5sEmOXWGLAb6M2lOpt/bSt139ocaz4QIoa6Zk+Y9cs5NqB2MVhQ1uD7P
 yOUdtRCRLEQ6xhOKc/LfOtMxHQVtgcGNYG8UMe+x8QAmwOxNcDF+1WyVauiNYyn/je61
 3gpKSdjxkn0sTH9gMbvCDpftDttMDEuX6Py37bUbUVWRVzosSgNpMf2J8usJr1S4QQ4Q
 Gio5dIBckqMZZ4jap6TgPp4onvPzn3TSaCvACZhQL9sZhjcyGq8GmwKI6YZd77kGogyF
 /BD8lssbdq7LldoX9St3J+Wdn9zoE2UE/zB9HlevqKjMUxb4ftlLFbo7d+fCjiQ/c7Uz
 WrGA==
X-Gm-Message-State: ABy/qLZG+7GWpUYfNpc4IwhIOVqJRT9uVxWrjYSwuH/oUmJmFKe7rmNi
 7lSQxZGpE9LwW01+euUGn6Y=
X-Google-Smtp-Source: APBJJlHRSQR9FO9yUWCkUfFFTYkkfq9RnKX4cdxxZUrwZxZmhfX+TqX4gLWOFGva4RghlOijpIuJhA==
X-Received: by 2002:a92:6b09:0:b0:347:714c:aeb4 with SMTP id
 g9-20020a926b09000000b00347714caeb4mr1689488ilc.11.1689266211673; 
 Thu, 13 Jul 2023 09:36:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 06/21] dyndbg: split param_set_dyndbg_classes to
 module/wrapper fns
Date: Thu, 13 Jul 2023 10:36:11 -0600
Message-ID: <20230713163626.31338-7-jim.cromie@gmail.com>
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

rename param_set_dyndbg_classes: add _module_ name & arg, old name is
wrapper to new.  New arg allows caller to specify that only one module
is affected by a prdbgs update.

Outer fn preserves kernel_param interface, passing NULL to inner fn.
This selectivity will be used later to narrow the scope of changes
made.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d875c4fa5335..6070d37c24ac 100644
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
2.41.0

