Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA84C7C90B7
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0A910E668;
	Fri, 13 Oct 2023 22:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFB110E654;
 Fri, 13 Oct 2023 22:48:37 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3574f99d260so9970595ab.3; 
 Fri, 13 Oct 2023 15:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237317; x=1697842117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+YoaYP9Btr77N0brD8AfqI/lJY3W3ao1Z4fzgsncX4=;
 b=aa/ISgVdLkJcnEE6cmRcB2UwhCTWT62k4ShsY1R4klcZenFHPwGg8G0U4yGX14yKsC
 t5O4yNgla6xicveBirUHKRHc6/FPAjEqy7/TLSIiwvajy8aIYvJkzlaBDuT4148of1l0
 nlNh+MC3JrwIiFZdpprQD/iw4mOb6sQ8WjOHLxxZnDJbS0r59DVZb35N1vjlpYPSfZKd
 yF96PPv3ZKfgLofmU+Xi3xeIR5NwScictz7UTo/QHqUxsg+6vqquGTVJQH+gcV8ZQ7ni
 GqsVc/rCG7g3lqicgPLkSY+R5m7xQH8MrzMvjanY7a4XN2aMKHuQ0y/lSlavkOLlu9c+
 aDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237317; x=1697842117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+YoaYP9Btr77N0brD8AfqI/lJY3W3ao1Z4fzgsncX4=;
 b=ZWgINElcogzJKj0BE6IaEAK/jZYi3CWAMdaaFAXJjanmXwOYZ755oakqy6dSKsLQmd
 fgbRyVw4exqos8r7Vf7FRgJq0FfUCx9I4MgT2aZRGykKdqp93iDZ0f01J+X2e/DD1BHU
 nglNA77p1Fh12rZfMnV+ypBxVjR33L/nXvx+eR4VAsQWRrh5j0l7ZF0iNoWKKin0+o+1
 dTzNE1tHF1DjbpmYYrfBBWVV8DnxaIedQ1uNCsuuWkfDHPLuv2bNrvDQ2yUWI/y6T3qN
 4TnWjikwzbXklmR4dfbpn+bFkaXZCUJSrEMxItpt3W6s5y4z6ZrC9TdQKr0d07UgUnCQ
 0b3A==
X-Gm-Message-State: AOJu0Yxg+6DMMNo0RsI4fNCD+sG2NDsd9wvh8pP1sC3eKmKBcpo/3uN+
 FuOdfaxBTMfJvBiEy0f4FjkUs4kn1PoNLg==
X-Google-Smtp-Source: AGHT+IHwailVRlZkUbGYom5kFyqAItD1e1tOiOSBrxx42FM/r/kE7Kk109A0EUSZNIcZwaLqfWt5wA==
X-Received: by 2002:a92:d482:0:b0:357:5751:7aa9 with SMTP id
 p2-20020a92d482000000b0035757517aa9mr6317829ilg.2.1697237316825; 
 Fri, 13 Oct 2023 15:48:36 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 06/25] dyndbg: split param_set_dyndbg_classes to
 module/wrapper fns
Date: Fri, 13 Oct 2023 16:47:58 -0600
Message-ID: <20231013224818.3456409-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013224818.3456409-1-jim.cromie@gmail.com>
References: <20231013224818.3456409-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com, bleung@google.com,
 yanivt@google.com
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
 lib/dynamic_debug.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index ba41fdeaaf98..b67c9b137447 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -708,18 +708,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
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
@@ -756,8 +747,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
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
@@ -770,7 +761,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -779,6 +770,22 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
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

