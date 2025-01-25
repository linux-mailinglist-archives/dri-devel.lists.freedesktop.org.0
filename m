Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128A4A1C156
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D5D10E2CA;
	Sat, 25 Jan 2025 06:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G9TPH228";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05E310E2B7;
 Sat, 25 Jan 2025 06:47:00 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id
 ca18e2360f4ac-844ce6d0716so215097339f.1; 
 Fri, 24 Jan 2025 22:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787620; x=1738392420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ytfh/zV61l1ce+ov8of55te3rHqgM7GRb4D7c2dE0nI=;
 b=G9TPH228vaXdnfNIIEdXeYEog6UmsHREX4HYtxdjbOEEJwS1nIBvQz+mCKMPPi0jov
 uCrkzQ7KkROYAtufVT6QvyyO14Z0sJtYCkJeP+Xo0vEN9eeQ0TdK78mln5RO5GnZ7vlm
 SZWXCXlXBBTNqBAEvfGPLa5uC952jWldB+jaexzruZVRAIIHaoaB7PSFhP8reWmOV1/u
 AqItrUTsRxIPUzLs3Jfts4dyovdPR4Po9lmo/QCo7lAJTa5dMKPzOeUvgsgmWn16k7xO
 jPTMCbnHu91y7hoLE91tLymixpXK/8WuU2Onh0GtHV/VQ3IQQ42lkFJBC5KiwzZ8Drkq
 h/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787620; x=1738392420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ytfh/zV61l1ce+ov8of55te3rHqgM7GRb4D7c2dE0nI=;
 b=VXzCwQ8A2jirv6MA8NgSW5QQn6cmdjS//LOqf6I7+BD5f4QujBDvfiENrltLRkOSt4
 j5H2mY2dVi12eWbbWP79aJuIqWY2rPKco91GOEuopqGlvEELtWw9I2KvWEqmVfKs+LoV
 /UPw2zUsULd6Y4Bi5GEap7ICK6sJb0c0qnxWtg7M/ceOWHihqrRS+jzNl2LEf990Yvxt
 BW7Ub7IjBTYYgp+bSAVZGkWAgs3/nslgp0Dtok9llwU3PIcAlYJ/0ZT+PuoXZ+JntfJi
 /TTDjKh8CALU/47ljh7JJuEy40DMjuFGNMU2uEYmdZue0TGnsHRkJBv+xCvIjqq6TfgO
 9FKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQA5wn/SmnA7+FhtBjDyBd3MWXLyBJCHLWTK+Ntexr2qx8VFsSJX96zv/162MI1NUxSFjRbBdVYScv@lists.freedesktop.org,
 AJvYcCUjgdqzG/ijvXQ6RNa6w+OqGZ72LTpNC1+90iEj5NraLGTRlwOhofvPupBcgLaHbvIKToOp967i@lists.freedesktop.org,
 AJvYcCVCcyp6hnKEVntBfXFpcM9xPnIuLRNNLOayBGEQmWWh+u/f7/5FKfWegACno1bQ25/Tiw5K1PVd9UxeWrxJHQ==@lists.freedesktop.org,
 AJvYcCVYgRwcjCKv8NQZi9odkKvLSXX6PYWDlrfcIJyG5YeyT1goJionK8JDsWnAL4iFg/rKmuR5E9LCNWHD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdEO/zAuQawljketVMSW3B7WSa2fGzKrjSVCr417HxPjJIhSGt
 hajxWsOD4IpLWVHrNgvAQSdQnEd9K21Mb7Ax4dXcAX1lFgP9Mx76
X-Gm-Gg: ASbGnctzM4Ab5noB6w/jxcEJCOIkka8sDfhLABEQQYNz1y3uhCAXL54GuTfS170/oCi
 NwXg2YR1OuH1f6lVmj/kmPfj1He3GX+i2v/Nc97sw5Gv1p/bfc3rKrz2n1U4YNPAx6DbFhMf10I
 l8H0xVwzWYbB3lCGTi1UKi1LXlq85aKZo1NAQd+QvHeq+SzEOp8UkSNIvkALYyFj4wAa/ySWY+/
 RiFMMopbR8w/uInfz2Q1Q23pDFYIIxIJGScvUxydNnTyEMYOb7hEGU2exZbHGcDOLoWRJ2gNyUE
 ccUj9WJrRDvemVHifAK0WOjjWqZgz5dN1dxhYw==
X-Google-Smtp-Source: AGHT+IHZ0rdC7Vd9cUI1tPpIx5JlT8FFJWJY2x9dHWb5lEPIqHartZYwqQohH5tAwYTKxuzcgozcpw==
X-Received: by 2002:a05:6602:26c5:b0:83b:5221:2a87 with SMTP id
 ca18e2360f4ac-851b616986dmr3118385239f.3.1737787619986; 
 Fri, 24 Jan 2025 22:46:59 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:59 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 21/63] dyndbg: allow ddebug_add_module to fail
Date: Fri, 24 Jan 2025 23:45:35 -0700
Message-ID: <20250125064619.8305-22-jim.cromie@gmail.com>
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

To prep for failing modprobe on classid conflicts, upgrade the
call-chain around ddebug_add_module(), in 2 ways:

1. in ddebug_add_module() add local reserved_ids to accumulate
reservations, pass it by ref to ddebug_attach_{,user_}module_classes()
so they can examine the reservations as they work.

2. return int from both ddebug_attach_{,user_}module_classes(), up to
ddebug_add_module(), then to ddebug_module_notify().

No conflicts are currently detected or returned.

TBD: This is updated further by hoisting the reservation-check, which
obsoletes part of 2, creating churn, maybe squash it away.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 40 +++++++++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 11 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 16c9b752822b..0ef243e30663 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1216,8 +1216,9 @@ static void ddebug_apply_params(const struct ddebug_class_map *cm, const char *m
  * modular classmap vector/section.  Save the start and length of the
  * subrange at its edges.
  */
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 const struct _ddebug_info *di)
+static int ddebug_attach_module_classes(struct ddebug_table *dt,
+					const struct _ddebug_info *di,
+					u64 *reserved_ids)
 {
 	struct ddebug_class_map *cm;
 	int i, nc = 0;
@@ -1230,13 +1231,14 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt,
 		}
 	}
 	if (!nc)
-		return;
+		return 0;
 
 	vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
 	dt->info.maps.len = nc;
 
 	for_subvec(i, cm, &dt->info, maps)
 		ddebug_apply_params(cm, cm->mod_name);
+	return 0;
 }
 
 /*
@@ -1244,8 +1246,9 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt,
  * means a query against the dt/module, which means it must be on the
  * list to be seen by ddebug_change.
  */
-static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
-					      const struct _ddebug_info *di)
+static int ddebug_attach_user_module_classes(struct ddebug_table *dt,
+					      const struct _ddebug_info *di,
+					      u64 *reserved_ids)
 {
 	struct ddebug_class_user *cli;
 	int i, nc = 0;
@@ -1266,7 +1269,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 		}
 	}
 	if (!nc)
-		return;
+		return 0;
 
 	dt->info.users.len = nc;
 
@@ -1275,6 +1278,7 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 		ddebug_apply_params(cli->map, cli->mod_name);
 
 	vpr_dt_info(dt, "attach-client-module: ");
+	return 0;
 }
 
 /*
@@ -1284,6 +1288,8 @@ static void ddebug_attach_user_module_classes(struct ddebug_table *dt,
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	u64 reserved_ids = 0;
+	int rc;
 
 	if (!di->descs.len)
 		return 0;
@@ -1306,16 +1312,23 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
-	if (di->maps.len)
-		ddebug_attach_module_classes(dt, di);
-
+	if (di->maps.len) {
+		rc = ddebug_attach_module_classes(dt, di, &reserved_ids);
+		if (rc) {
+			kfree(dt);
+			return rc;
+		}
+	}
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	if (di->users.len)
-		ddebug_attach_user_module_classes(dt, di);
 
+	if (di->users.len) {
+		rc = ddebug_attach_user_module_classes(dt, di, &reserved_ids);
+		if (rc)
+			return rc;
+	}
 	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
 	return 0;
 }
@@ -1400,6 +1413,11 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 	switch (val) {
 	case MODULE_STATE_COMING:
 		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		if (ret == -EINVAL) {
+			pr_err("conflicting dyndbg-classmap reservations\n");
+			ddebug_remove_module(mod->name);
+			break;
+		}
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
-- 
2.48.1

