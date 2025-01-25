Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C3A1C161
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26F2210E29F;
	Sat, 25 Jan 2025 06:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BY1o/VFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1296C10E2F1;
 Sat, 25 Jan 2025 06:47:04 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-844e7bc6d84so90831439f.0; 
 Fri, 24 Jan 2025 22:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787623; x=1738392423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=93jbq4Mgsj9Dng6wtNKkyeLZVZqBaH1mnVoaGdt6ywk=;
 b=BY1o/VFLELXiFqop10cuo1JxIk0lv9FH/za5kTyMlPgZlRY0XWdnmKALHXmFxiOslW
 AX/1jpJDwgo7pFHYajChwUCSgW9BBGbbcYB9G7JV5ZVKpDn3GTW0lq26GcDY+FOo+C6e
 YqjTGsOqf+QCiEZa6it/gSlwje5QTbqWAmXW1wK6VI0JPrZOVX3nC8HvIC8J7R6XMetX
 fL3IRccowd1EdvIdr6kh2FUtvZ3vvKkTwx52b0ISSEiod3iIhtHmOKldN3lcX5SWejuI
 NjCWImsJ1d112uxX3CzFw5THTQ7603JN2ZTm92j8K3NmVZ4qh4O2U48ClXDP3YnEUKYo
 ByZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787623; x=1738392423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=93jbq4Mgsj9Dng6wtNKkyeLZVZqBaH1mnVoaGdt6ywk=;
 b=tZt+6jCws3suTcp+J5lU4yRxAZtma289ll1ic4LzvXiF6wwR/nISsRR5aQ6E8A+5Xj
 qiu1/IKzhNtJUhbm+KP40tOhvjW1UFpH5XwyhdXCVNSywCh9nG9vWhicKf42fx/hW1dH
 E3GZT8WJHX16QpqXBcNObqDX2Bi36ASE1A8yZoaXuyBij970UV4hfZBAy12HdpeIhmP7
 RTbtLfVZ38rlg/1yq6Is8jhnAjVETrmfDEQxX8BrDOykFJrRXCEKcjQunnvIZ6+iz2fR
 OhJ5VHOHaxPWQryGZJplXw2YV7ekOePKQ5pNBAWmvMuwf2iZhruT4JnlThhRnt+vREoL
 DAAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdpgzfEG4ZLfXns0GpwVYHVPqI4I4Zyzp65SSwDvoDs3OrW5oIo3Zxt8ha9mBPrSTH3KCMsMETGkuK@lists.freedesktop.org,
 AJvYcCX9S9S9Gh8AmlnhI+2UNaFJJnoVzStg+Ulx6t77+bAjeOqBSaORCBA6NiaCdRsHe40D+75VsMTi@lists.freedesktop.org,
 AJvYcCXpB3UXT4nInK4Svf6j8sVS75NyhlKu5i6ASXnsl+sMd9GepkVGn7/GtZrrSOez/R3uC7zDA1lzvYl2@lists.freedesktop.org,
 AJvYcCXuTPR4jEehdFQP7py5MhXopD/5wSwvODJQHlFGhjVCMi5+AdqCD+7S/IvA5r5tyf00jp9W5y0wVrJwpGvgMw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLSTLQiFPy1H8Jw2tosSpYpd9V3gnFu+L21pYdyqhkAXoF25Fn
 S5RLvdI/r0RauPHnnBca04IYXmW7ZqpKrTKnaqV1EktcosSQhaCY
X-Gm-Gg: ASbGncucIv3a1HfCIbQI5HNJwjveB+IEffFZBwgjhIXSNfqOxr9xI6Qc1X/PEIATlEy
 TRR1CTqFcNrUDJNaTanR9UGneyrd7hPrNfSYSItVXpjdKTgfAk3+USfqV8ZWF7nrifEvjao984H
 k9/3HvG6H3MefxHFP/x7ZfMddO7DLISCqqhVZjGO2fbQJLGrIvRDQB9JAPQijuVfaf+1AQ1TM/j
 NbSGuVyNPfYTrqb0ZLOkYWS+20qVWHCqwOmB+Cjhu3gbWOdsSjAFglA3i/+Hd6cKAXSBZBqhS3P
 3I9QssiSWAipyz66xS1p+TUCiu1gUkPQyfD7Og==
X-Google-Smtp-Source: AGHT+IEzK3tgR4ZqscbrvwKIW94h8D8rsgISbYsYpT/OLj+GuVfcmbYBQtPSq2z1B//b7y/JBkE8aQ==
X-Received: by 2002:a5e:d804:0:b0:82c:ec0f:a081 with SMTP id
 ca18e2360f4ac-8521e32b142mr475805639f.4.1737787623209; 
 Fri, 24 Jan 2025 22:47:03 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 24/63] dyndbg: hoist the range-overlap checks
Date: Fri, 24 Jan 2025 23:45:38 -0700
Message-ID: <20250125064619.8305-25-jim.cromie@gmail.com>
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

hoist the classmaps range-check up to ddebug_add_module() from
ddebug_module_apply_class*().  THis puts both copies of the task
together, with the other semi-init work.

this allows ddebug_module_apply_class*() to revert back to void
return, but doesn't do that yet.

this is a candidate for squashing back.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 8e1e087e07c3..e57c05c9fb0a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1257,11 +1257,9 @@ static int ddebug_module_apply_class_maps(struct ddebug_table *dt,
 	struct ddebug_class_map *cm;
 	int i;
 
-	for_subvec(i, cm, &dt->info, maps) {
-		if (ddebug_class_range_overlap(cm, reserved_ids))
-			return -EINVAL;
+	for_subvec(i, cm, &dt->info, maps)
 		ddebug_apply_params(cm, cm->mod_name);
-	}
+
 	vpr_info("module:%s attached %d classmaps\n", dt->mod_name, dt->info.maps.len);
 	return 0;
 }
@@ -1272,11 +1270,9 @@ static int ddebug_module_apply_class_users(struct ddebug_table *dt,
 	struct ddebug_class_user *cli;
 	int i;
 
-	for_subvec(i, cli, &dt->info, users) {
-		if (ddebug_class_range_overlap(cli->map, reserved_ids))
-			return -EINVAL;
+	for_subvec(i, cli, &dt->info, users)
 		ddebug_apply_params(cli->map, cli->mod_name);
-	}
+
 	vpr_info("module:%s attached %d classmap uses\n", dt->mod_name, dt->info.users.len);
 	return 0;
 }
@@ -1322,6 +1318,13 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dd_mark_vector_subrange(i, dt, cm, di, maps);
 	dd_mark_vector_subrange(i, dt, cli, di, users);
 
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			return -EINVAL;
+	for_subvec(i, cli, &dt->info, users)
+		if (ddebug_class_range_overlap(cli->map, &reserved_ids))
+			return -EINVAL;
+
 	if (dt->info.maps.len) {
 		rc = ddebug_module_apply_class_maps(dt, &reserved_ids);
 		if (rc) {
-- 
2.48.1

