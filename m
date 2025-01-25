Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D999EA1C145
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:46:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BD510E27A;
	Sat, 25 Jan 2025 06:46:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LNW2IsSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC63510E29F;
 Sat, 25 Jan 2025 06:46:44 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-844e9b83aaaso218487739f.3; 
 Fri, 24 Jan 2025 22:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787604; x=1738392404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfV6PeTEsI0VgSdAZwuy1u+rsYeivbmD+1moBtyYi7s=;
 b=LNW2IsSka163NZ/dipNHU9RqzXkeoRaWgBwPaOjWbCxnQQkHnYgLxOy/jQUQFDGaRN
 ExZ5ywF6ZHQTe1SZqh1fK80suSXrIe3dL9CymjRbYmIjnOJ6QNH0e06KySAKB6EUqUv2
 WzDUfJwWzVB/ZI49UMzQn24jyA6NC1slBlySQ65RpQlnOi+bLbkay8iJlIKsxvVFHrTf
 ROP3OmkqL/1VNgXjl+NJcJ5afhg2p8a5EtTYIg5b/eiedBSFc8dP/uzvzR4PH7z9lXw9
 JwipoMTCW1Rp8VLkD45sueS4HJUAvqtBM9ac/RiFe7kTq+xYFqFQylBbtaKswayHs1gj
 J37g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787604; x=1738392404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gfV6PeTEsI0VgSdAZwuy1u+rsYeivbmD+1moBtyYi7s=;
 b=RhFS1p4d43vgiGfkTO5Hjzybw8rGTu59bFRSvEc2KArij2RWtu2h3GHFqomWRmOaXk
 m8wO7VXr6SPVTQX/ZBaQQ0zcYzIZOc17hvfJwtulrx7SJmiFNN0+NrXswrpSrcsCkVav
 pQ+suVQLVQoUJQhb35NpkzCBbocHx1GuU0r8xf9UuibrGV7pPvZIyBXUSsuiG3W+vLaz
 i1U7Mq2wO881uGw8URlbnY/nZjiSDTcMAQF5BM0FIMt52NQCNoJ+/ysRX1+NQGkwP7kO
 jf1gK+NSVP32ZeqDR2aWvyPsGH3qiC98atqjTCurMTyRpGqQnzOZIfOG7fRJwMfG8JxY
 Vn1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD9Zcs7c/WPEr2GgxsKYzaZa891QT6yK3nS7hgeqroT36+k7+6HOhhjwCorlWqFlsOLHwZDRZQ@lists.freedesktop.org,
 AJvYcCUgS2xbQtWBzoQBSF6r8dWtCpAJjrFoE5ODFyrBmKCd/90bw5WnpaTsfGR4r3ztr2PSVob/TzFNW+xYBx6ajw==@lists.freedesktop.org,
 AJvYcCUohtrzYKqN0IYEiODzWiJhK30ptwFIwVt0T5gBZrvC9lxta6jYymfauZEtMxuHd4V8p8eoJj8I9tMH@lists.freedesktop.org,
 AJvYcCXtF2pyuyTaeTgyneeA5QplVq0Bb/8FSZkNYFfRdgONPIye9VWMf1Wu6wDzfAsZUJY105zFsaiaovzx@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj4fSoz7qkGkO+m8uJghSTOnLlSU5Elwlh9ikYJOwOVeki/if6
 CBLa3TRcvR0RWr8Niqn4AlsYuI3ZekksPHpmXuF05UMsqEfVZSnv
X-Gm-Gg: ASbGncvJFft2WefHdvw3fuw5kqN8+PJ0v+TwmZ/VuBM6TKxzHqky3ZyuM/eRFcaomi4
 CiWCOwDpttH8pAT+f1NMh+OX35Y/Sb3tJAFGB8saQY8YgWMcbkDyXMHIZqrKsOEs9rORrqDuioZ
 Zccti+8Usvbju1vrlZe23sOSZwvdAM/taC/e+7/wVHn59sEBg+AvYIU1Lajuizfvb+VndJUW78H
 mtK52Cv9KEHNh0PKhw5oXF+vSvYhUY/L+uru0/6MrYplIFWEub7UmJQ6bkcLT736NUCmTQ045NC
 QHvktBtB5yOJ2rR1yc6gLA5BV9n10DnC3ppj9T+kAhvgk2cu
X-Google-Smtp-Source: AGHT+IGNmawZ5H7p5nSdLzECedgsD/gX3TGGq70Fq+Pnwp8P7+wi2jDLWawGYzx5t0CkZCBiLMpQ1g==
X-Received: by 2002:a05:6602:6c06:b0:84f:5634:8a1b with SMTP id
 ca18e2360f4ac-851b619f8f4mr2827044139f.2.1737787603950; 
 Fri, 24 Jan 2025 22:46:43 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:43 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 07/63] dyndbg: split param_set_dyndbg_classes to _module &
 wrapper fns
Date: Fri, 24 Jan 2025 23:45:21 -0700
Message-ID: <20250125064619.8305-8-jim.cromie@gmail.com>
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

Split api-fn: param_set_dyndbg_classes(), adding modname param and
passing NULL in from api-fn.

The new arg allows caller to specify that only one module is affected
by a prdbgs update.  This selectivity will be used later to narrow the
scope of changes made.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8adb81e75a16..9adcb9fa7110 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -711,18 +711,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
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
@@ -759,8 +750,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
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
@@ -773,7 +764,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, NULL);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, modnm);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -782,6 +773,22 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
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
2.48.1

