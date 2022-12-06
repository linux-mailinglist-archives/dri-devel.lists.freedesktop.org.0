Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E850643A52
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 01:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E15310E319;
	Tue,  6 Dec 2022 00:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE27010E2D4;
 Tue,  6 Dec 2022 00:35:15 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id q190so3649521iod.10;
 Mon, 05 Dec 2022 16:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c37Q/3APLWW6xBx5+RAUFPKVzvBaq0UZM8cuJI12nq8=;
 b=fInW/fz/NZURKWbXeJO4WygWi9zc+v8xHEsZjvIP1SGX514xYTeqgtjqqpSlVAHLCH
 TOJXYAtWtI2082hr0ma2lLIzcf379a/JYBgzu6B/lJ+wjBSlxer8yArYF3H/dozIyzfg
 qb96XdJM85Jt+Glc0bZ198ysyMkjql93sgM5zeQ3GypV2tMs2TtEuMe0FNGMp8xE5yew
 X4cAxpspZo3X33yCXvP1Vfz3AM3xs26WltlDY4EWn9LIfCJMSJ0klz8PD8RRiq3HRaa4
 zTzB4eiK8GX9BsqTZx5/Ko70VK4Kekcjsa/rorQNZsmPQmEvgk9MRPloodr0SqHexgHB
 gDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c37Q/3APLWW6xBx5+RAUFPKVzvBaq0UZM8cuJI12nq8=;
 b=ucU6X736sYboMFUzdwyRWC+WjpC0K0A2gzMrBDrip1eoYnQEREXOBvrL0gTG1t16jP
 Tkc7fgmvFamwIHZ8r8OSzTVQqQmNO3MrfxbQSC5/2r8ppCwHHpxP0hyGG+3Ar0W36Mhz
 T5OWEzcuYkhCRbp1jd9WrSYY5zw705UpUu0yD6NPuYkCPyPiaMa8TES/f3qnfk3fItLU
 NOUNAVh9xDAyJNEa0WyQA/kuGWqtMUQVDyHhkUincb9UafVe4lsbfyraonmkAzazsNxQ
 YzW3qpUZu850PyfQOvUqv1AsqzbIm6o9C/Hi5eUb2b8gwrOOzU65enY+e9IJsw5GjGX/
 IaEQ==
X-Gm-Message-State: ANoB5pkPjTtn14KbalkXdhOQVABefGhuVZ6e+o1y998Pqd9QPRifhfO5
 OfXvij9rl9yh5f32VO51hZQ=
X-Google-Smtp-Source: AA0mqf7oyQ/Ut5DBcMYLlfxOUOfqpUsnujlkz7rGYAqP0T3E8L8IvpBEe5J4iFJB/BCF5L0cIJsM/g==
X-Received: by 2002:a02:84c3:0:b0:38a:1e93:c32f with SMTP id
 f61-20020a0284c3000000b0038a1e93c32fmr6858176jai.212.1670286915005; 
 Mon, 05 Dec 2022 16:35:15 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 x3-20020a056602160300b006bba42f7822sm6408213iow.52.2022.12.05.16.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 16:35:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 15/17] dyndbg: ddebug_sanity()
Date: Mon,  5 Dec 2022 17:34:22 -0700
Message-Id: <20221206003424.592078-16-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221206003424.592078-1-jim.cromie@gmail.com>
References: <20221206003424.592078-1-jim.cromie@gmail.com>
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

It appears that, at least for builtin drm,i915 loadable amdgpu, data
in the class_refs section is not properly linked, this works partway
towards isolating the problem.

The "NO CLI" name test is failing.
 This version of the report fails with a non-canonical address:
 // v2pr_info("NO CLI name on: %s\n", cli->map->mod_name);

[    0.109299] dyndbg: add-module: main 6 sites 1.3
[    0.109595] general protection fault, probably for non-canonical address 0x7265766972640000: 0000

fwiw:
  $ perl -e ' $a = pack "H8", "7265766972640000"; print "a:<$a>\n"'
  a:<revi>

These records are added to __dyndbg_class_refs section by
DYNDBG_CLASSMAP_USE

This patch adds ddebug_sanity(), and calls it 3 times to characterize
what goes wrong and when.  It turns out that its contents are wrong
immediately, in 1st step of dynamic_debug_init().

[    0.107327] dyndbg: classes
[    0.107537] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    0.107592] dyndbg: class-refs
[    0.107823] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e35e nm:0000000000000000 nm:(null)
[    0.108554] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe86 nm:ffffffff834fc4c8 nm:
[    0.108590] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785aa nm:ffffffff834fc4c8 nm:

Those maps are wrong:

class-refs should all ref the same map, ie class[0]: module:drm.
the nm:s should also show module names of 3 builtin clients of drm.
So things must end poorly.

modprobing the loadable module does better:

bash-5.2# modprobe amdgpu
[ 6645.212706] AMD-Vi: AMD IOMMUv2 functionality not available on this system - This is not a bug.
[ 6645.653124] dyndbg: add-module: amdgpu 4425 sites 0.1
[ 6645.653582] dyndbg: classes
[ 6645.653830] dyndbg: class-refs
[ 6645.654124] dyndbg: class-ref[0]: cli:ffffffffc0a31b90 map:ffffffff834fc4c8 nm:ffffffffc08bc176 nm:amdgpu
[ 6645.654936] dyndbg: classes
[ 6645.655188] dyndbg: class-refs
[ 6645.655450] dyndbg: class-ref[0]: cli:ffffffffc0a31b90 map:ffffffff834fc4c8 nm:ffffffffc08bc176 nm:amdgpu
[ 6645.656246] dyndbg: class_ref[0] amdgpu -> drm
[ 6645.656613] dyndbg: amdgpu needs drm, 0x0
[ 6645.656953] dyndbg: apply bitmap: 0x0 to: 0x0
[ 6645.657322] dyndbg: break on 0/1
[ 6645.657592] dyndbg: 4425 debug prints in module amdgpu

Here, the maps are correct; they ref the class[0] module:drm above.
That said, apply bitmap is wrong.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

---

[    1.210094] dyndbg: add-module: drm 302 sites 1.3
[    1.210496] dyndbg: classes
[    1.210674] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.211290] dyndbg: class-refs
[    1.211548] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.211674] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.212464] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.212675] dyndbg: classes start: class[0]: module:drm base:0 len:10 ty:0
[    1.213257] dyndbg: builtin class: module:drm base:0 len:10 ty:0
[    1.213675] dyndbg: controlling kp: drm.drm.debug
[    1.214087] dyndbg: module:drm attached 1 classes
[    1.214490] dyndbg: classes
[    1.214674] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.215291] dyndbg: class-refs
[    1.215552] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.215674] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.216430] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.216674] dyndbg: NO CLI ffffffff8293e376 7265766972640000
[    1.217149] dyndbg: 302 debug prints in module drm
[    1.217549] dyndbg: add-module: drm_kms_helper 95 sites 1.3
[    1.217674] dyndbg: classes
[    1.217913] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.218525] dyndbg: class-refs
[    1.218674] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.219486] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.219674] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.220469] dyndbg: classes
[    1.220674] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.221324] dyndbg: class-refs
[    1.221606] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.221674] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.222472] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.222674] dyndbg: NO CLI ffffffff8293e376 7265766972640000
[    1.223173] dyndbg:  95 debug prints in module drm_kms_helper
[    1.223675] dyndbg: add-module: drm_display_helper 150 sites 1.3
[    1.224223] dyndbg: classes
[    1.224484] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.224676] dyndbg: class-refs
[    1.224954] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.225674] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.226498] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.226674] dyndbg: classes
[    1.226931] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.227577] dyndbg: class-refs
[    1.227674] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.228501] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.228674] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.229443] dyndbg: NO CLI ffffffff8293e376 7265766972640000
[    1.229674] dyndbg: 150 debug prints in module drm_display_helper
[    1.230195] dyndbg: add-module: ttm 2 sites 1.3
[    1.230581] dyndbg: classes
[    1.230674] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.231291] dyndbg: class-refs
[    1.231559] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.231674] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.232439] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.232674] dyndbg: classes
[    1.232915] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.233535] dyndbg: class-refs
[    1.233674] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.234470] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.234674] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.235427] dyndbg: NO CLI ffffffff8293e376 7265766972640000
[    1.235674] dyndbg:   2 debug prints in module ttm
[    1.236079] dyndbg: add-module: i915 1657 sites 1.3
[    1.236490] dyndbg: classes
[    1.236674] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.237283] dyndbg: class-refs
[    1.237545] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.237674] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.238431] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.238674] dyndbg: classes
[    1.238911] dyndbg: class[0]: module:drm base:0 len:10 ty:0 cm:ffffffff834fc4c8
[    1.239519] dyndbg: class-refs
[    1.239674] dyndbg: class-ref[0]: cli:ffffffff834fc508 map:ffffffff8293e376 nm:0000000000000000 nm:(null)
[    1.240467] dyndbg: class-ref[1]: cli:ffffffff834fc518 map:ffffffff8293fe9e nm:ffffffff834fc4c8 nm:
[    1.240674] dyndbg: class-ref[2]: cli:ffffffff834fc528 map:ffffffff829785c2 nm:ffffffff834fc4c8 nm:
[    1.241478] dyndbg: NO CLI ffffffff8293e376 7265766972640000
[    1.241674] dyndbg: 1657 debug prints in module i915
---
 include/linux/dynamic_debug.h |  4 ++--
 lib/dynamic_debug.c           | 32 +++++++++++++++++++++++++++++++-
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 6f53a687cb32..2a1199aadab6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -115,8 +115,8 @@ struct ddebug_class_map {
 	EXPORT_SYMBOL(_var)
 
 struct ddebug_class_user {
-	char *user_mod_name;
-	struct ddebug_class_map *map;
+	const char *user_mod_name;
+	const struct ddebug_class_map *map;
 };
 /**
  * DYNDBG_CLASSMAP_USE - refer to a classmap, DEFINEd elsewhere.
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 02f36c553835..46684aa7284d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1301,7 +1301,8 @@ static void ddebug_attach_client_module_classes(struct ddebug_table *dt, struct
 			continue;
 		}
 		if (!cli->user_mod_name) {
-			v2pr_info("NO CLI name\n");
+			v2pr_info("NO CLI name %px %px\n", cli->map, cli->map->mod_name);
+			// v2pr_info("NO CLI name on: %s\n", cli->map->mod_name);
 			continue;
 		}
 
@@ -1325,6 +1326,29 @@ static void ddebug_attach_client_module_classes(struct ddebug_table *dt, struct
 	}
 }
 
+static void ddebug_sanity(struct _ddebug_info *di)
+{
+	struct ddebug_class_map *cm;
+	struct ddebug_class_user *cli;
+	int i;
+
+	if (di->num_classes)
+		v2pr_info("classes\n");
+
+	for (i = 0, cm = di->classes; i < di->num_classes; i++, cm++) {
+		v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d cm:%px\n",
+			  i, cm->mod_name, cm->base, cm->length, cm->map_type, cm);
+	}
+	if (di->num_class_refs)
+		v2pr_info("class-refs\n");
+
+	for (i = 0, cli = di->class_refs; i < di->num_class_refs; i++, cli++) {
+		// cli->map->mod_name will segv
+		v2pr_info("class-ref[%d]: cli:%px map:%px nm:%px nm:%s\n", i, cli,
+			  cli->map, cli->user_mod_name, cli->user_mod_name);
+	}
+}
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1357,6 +1381,8 @@ int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	ddebug_sanity(di);
+
 	if (di->num_classes)
 		ddebug_attach_module_classes(dt, di);
 
@@ -1364,6 +1390,8 @@ int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
+	ddebug_sanity(di);
+
 	if (di->num_class_refs)
 		ddebug_attach_client_module_classes(dt, di);
 
@@ -1493,6 +1521,8 @@ static int __init dynamic_debug_init(void)
 		.num_class_refs = __stop___dyndbg_class_refs - __start___dyndbg_class_refs,
 	};
 
+	ddebug_sanity(&di);
+
 	if (&__start___dyndbg == &__stop___dyndbg) {
 		if (IS_ENABLED(CONFIG_DYNAMIC_DEBUG)) {
 			pr_warn("_ddebug table is empty in a CONFIG_DYNAMIC_DEBUG build\n");
-- 
2.38.1

