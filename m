Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141C66A317
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61C910EAC2;
	Fri, 13 Jan 2023 19:30:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD62C10EABB;
 Fri, 13 Jan 2023 19:30:47 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id i70so1693989ioa.12;
 Fri, 13 Jan 2023 11:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b1msYVUUhOCrgXIGS/m89vDjYGfxG+qEJJ3Hk8KO2zg=;
 b=KMw/tlFPTBHdInpIFLjRMZaiddkQY5a+/CbxIS2oi+kfOmEihj4OKBTcepbxae3ORx
 jrQPfAGGD/qtlGle2AlTxVymo8j5Tj9egXJJA2wwTGmuaE2cFDBEnLm6O8Q1s8g+wHaP
 D2YV/njh7TS3O9+teDgB0lSBXX2IxtbwgeQSNIv2c8sbN6nPbCVyYXtBOzbdO+llyPtY
 QOOXaN0pQcYIJZJVg2eInvxuG7vXckbJHv1b8lTurqmAU4GscrgWjUdbRJ9HfdG5Hn0q
 O72Yfm0m13FIWlB+IUZb5roJrM6Ns4vPvKsd+WvGOzXOINCfi3jm810dC8a+wNHtMe45
 +kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b1msYVUUhOCrgXIGS/m89vDjYGfxG+qEJJ3Hk8KO2zg=;
 b=MuRkWwxt9OAQLefWJO4Yy139bP+NtZQj6Tt6mzqUYzewd9mxKuUtaJW1+JTKE0FMYE
 rerOugccv1UgP8fhNd+xkGsXrDT1Re+9QVIYs9HEJkNDMt6JYQm6zV3qTw06QTJ2hK+4
 j/Ot0jSf6GGqEt59Mma9XGUkZQCZOgsup6DtI9+2z8kKxdzAXQV6ULtnKJhLaTgsNcAS
 5eWbikltHH422Fls3gB9jVPEiir3+ivLS8SRRGabN/t3aaFnq2NSuoGlKMlg7oUTkmKq
 ln0r3jY/2sCAgXtXOAtjzCqN91wRHjNE59lOjyDIDeKe+Rnl76kDqaeA0+mc/VKTP7eM
 E5Sw==
X-Gm-Message-State: AFqh2kppn+SODuMgueV0K/YRksZw8nztZjobK2yfyEgGlsbz8cLY3r48
 zxd/708XjmiZG3Fb/3ABQNA=
X-Google-Smtp-Source: AMrXdXvd5+gnFoRo7DTIG73NVKzJH6g39k9wx8szV07JN9FrbMq1D3p1ItLxarz/3rS1aOAPhbde8Q==
X-Received: by 2002:a05:6602:5ce:b0:704:8629:8400 with SMTP id
 w14-20020a05660205ce00b0070486298400mr2834590iox.8.1673638247075; 
 Fri, 13 Jan 2023 11:30:47 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:46 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 05/20] dyndbg: split param_set_dyndbg_classes to inner/outer
Date: Fri, 13 Jan 2023 12:30:01 -0700
Message-Id: <20230113193016.749791-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113193016.749791-1-jim.cromie@gmail.com>
References: <20230113193016.749791-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, gregkh@linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Split param_set_dyndbg_classes() to interface-preserving wrapper &
inner function with an additional param: mod_name, which is passed
into ddebug_apply_class_bitmap() to allow adjusting a single module's
prdbgs.  Wrapper passes NULL, preserving current behavior for now.

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
2.39.0

