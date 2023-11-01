Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DAE7DD9DE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 01:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06F710E604;
	Wed,  1 Nov 2023 00:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EB210E5F1;
 Wed,  1 Nov 2023 00:26:25 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-3592fadbd7eso5999265ab.0; 
 Tue, 31 Oct 2023 17:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698798385; x=1699403185; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X+YoaYP9Btr77N0brD8AfqI/lJY3W3ao1Z4fzgsncX4=;
 b=I4BNVd5THuE3y5qEmfFZJH/j16pyOxTgX0OexqVrpHYWcTJJP+bAPN8ug74hsDSCBC
 suVAP0swnhqU7yACv1wcwYgSbxgTpd1hVsssQS3BaitX1Cf4HCElkkV/9NNCAjAVyS0K
 7EnrpPbsFrALvCsfwc9i08P2VxaKuGFBEkgkEFTwTEBHDADofKlmFSGMEahoQuxarklW
 f491wzaNHVgoDVuXKysIaIM/PibxbEV3NRuELn6QDpHd6vBqeajMaAxnhBo5aRCAG3Eh
 z9ns+GBVinSbcqFWtCW7IEs6rPgbNpsBOaMabT2AnARCFsITGsckYa7qubpsj6do4wE+
 4GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698798385; x=1699403185;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X+YoaYP9Btr77N0brD8AfqI/lJY3W3ao1Z4fzgsncX4=;
 b=VcF/0VL5zaJdqbo4Zfrt4fKTIq/sNrAYUD0qzid0UsCpxFk6x0dPAfLKy6Ljb2LMbB
 TPjGQ3DNtmW7Vtj3PHj0Ow26SouF3SRwU83x4iLK3M7+sUK3xAyKLFu/APtt0CybMhK6
 VYeu3ciasr1khqkXwfFdRQiRnsNERhuOrZntIj/WtfdAX8tCkwUFcUIy5WNXMVfPUQdQ
 bnYghwI9sUOLrnD9auzjMRRII58mC3flNoFTNxdu4fomESY7m1zO+GBLCigX4Ok+wNLz
 +Z2Y3xAvv0AAuwq8/LtFUVSCtu/jGJsvz9+aIoB8uiN5Qnb0frDaBNgeM7z+q/gAvGz0
 tdVw==
X-Gm-Message-State: AOJu0Yw8CqrAMwblmPuHnteAwmdi4R2UMsqh3aH7u+WpPz+lMrPPFJSg
 P+7aiGsafZMlCXR5N+AA+AA=
X-Google-Smtp-Source: AGHT+IHFCe2bEfwNiGqjn9xcNuK0WJbUzvMAzVY5SQXMQ86DRyZUDjpBsVnnRJtNMNOhfxSk8+K5PQ==
X-Received: by 2002:a05:6e02:1b05:b0:357:47a3:adb8 with SMTP id
 i5-20020a056e021b0500b0035747a3adb8mr18275462ilv.29.1698798385252; 
 Tue, 31 Oct 2023 17:26:25 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t1-20020a92c901000000b00357cc8df1d5sm141701ilp.68.2023.10.31.17.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 17:26:24 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7d 06/23] dyndbg: split param_set_dyndbg_classes to
 module/wrapper fns
Date: Tue, 31 Oct 2023 18:25:52 -0600
Message-ID: <20231101002609.3533731-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101002609.3533731-1-jim.cromie@gmail.com>
References: <20231101002609.3533731-1-jim.cromie@gmail.com>
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
Cc: quic_saipraka@quicinc.com, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, will@kernel.org,
 groeck@google.com, maz@kernel.org, mcgrof@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, arnd@arndb.de, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, seanpaul@chromium.org,
 linux-arm-kernel@lists.infradead.org, lb@semihalf.com, yanivt@google.com,
 quic_psodagud@quicinc.com, joe@perches.com, bleung@google.com
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

