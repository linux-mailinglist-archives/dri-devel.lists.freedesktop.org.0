Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD21A1C14D
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB20110E2A0;
	Sat, 25 Jan 2025 06:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KdyBJdRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B15A10E29C;
 Sat, 25 Jan 2025 06:46:51 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3a8146a8ddaso7563635ab.1; 
 Fri, 24 Jan 2025 22:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787610; x=1738392410; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhnbP0DWcHpdehvzPtVKNEphMptFcEvIUAWn1R09L9s=;
 b=KdyBJdRxMcLAhi1jtTKe+kehlFDyMSlKFiFpbeHp4aFtfltuiiVp6U1XLROJWF65Ps
 AfRuaopmadtUv2ZZlEkWMYJ5aHzgFTzkrhtpQQj9lae/Sw8O/Qb3xXb3F7Fy4JgwBLkc
 Z8yo+918eoJDf8Tihb2KOO3S0rCUYVNOq2n2svAOmy7me+AHwc3J1uPZdeYjCILY1uqo
 2zkxyJ+d/KfehusYrOpA7Tf9ZEMEJ8XIVmz9YYnfQtdQdPEjMLiII9kk3PU7rMbN2qoN
 1Sn0j8B5Mv44RjpiBpYIBY2OonoBuzno5yZhIFtmXAQ2+brPHthNyPZ9TQA47vtN5Niw
 fepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787610; x=1738392410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhnbP0DWcHpdehvzPtVKNEphMptFcEvIUAWn1R09L9s=;
 b=JOV7hBDqkZEdBWgGUV8AfZEQPWZqN3HUv0CnOzG/5gOJmfyAfKptU3xPLa62b6a/7+
 bFSivPNuM+Hk9uRHmU54oUJ6RmwS5lRIrTgbiPA8UQ9Qal3hpEFtDtEJIpF4eYvHPBxR
 C56iL1/NXE848Tcfh9AcLXUF0WdvJHKwijBzw0e95e0s7bliOy8RoSwVgtD0gbNdWyGx
 Kbwl7y53+CQzsJVqzY5WCSmdLYyTjxqbLtNqWYEPYyKlkrI9QSJnX921GfX1is2NPKuq
 JNU7j3GxdPdew3B1ThWXO4qYf4jwQHdwFJMX+urpi3n+cZ83lOldR0l0odKsWV+m85is
 TU4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU00K4YNh4f/4HovadOznaPmHb5nHewuDbDOvqNneGpzzp3jPeqyAV+tTUVTUu81i+GEA4XagyvIu2u@lists.freedesktop.org,
 AJvYcCWRi4FWYiAPYWcuYe52oi+Ya2QDkkYOjEx4AWN6L9DB6r1jokHIpOURdDFaeULZzZN5s1V65wFx@lists.freedesktop.org,
 AJvYcCWhe0t7mD0bpUE7AgseUFuxk7PDiVeWHgNN1K+0PQIp+OzBKvBIUZiVkP/uqdUaPbq0zwfBZPYPawPLUqBRQQ==@lists.freedesktop.org,
 AJvYcCWuYjVw26nCDsVT+Q9h2VKoCOLo9oAk1qulrenE4g+Ec9+JJUAWtXgru/H9hzUJ5cCxYG3JaqdoJRK6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWQCrRWHXIEj5lY50kGwzucnx2Ak0R/QJlZ8MAIY2sMuT3ULO6
 r0Sd0d7XQPjqBQEQi6MetxyytztKI9GqQY2aQVWvvGhRvuZo6F7B
X-Gm-Gg: ASbGncsocf8Yi8QS7O4bphjKCsaZNgi1OU3D3NWP08rFkK3Ma0H+8LGtTT0f7bb/xSE
 viWUw/9/bwRsPMH4lrsa+D2xmDnh+w8FEFwjZViTy5kG4nvDGKgJZVEd6segz/3lFGYR9huyAcm
 CgaciEKTMhVmCEZrtf8uon8wNcxEZQSkP9a8VF+/w3m8MH9/DckbbCCmhtdf1ma+JfhmwYAgXtL
 +Wp84jeBafiKaftCf7raCiKumSbD1BVxN9TIlBahmn3fPPtt2AnyTO1sN4ZEaXou11eArod0CZI
 ZN+ge5Dj7i34z4mFtLswfpBAjfJBilfRTEP5BjYwBCgvPl/u
X-Google-Smtp-Source: AGHT+IEjwcFP/08iV5u7smlEOAHtcy4vLQNSUwAcIBZCKkDwG3GOx0o4FLASRAUuvVLtd3Cgpon0RA==
X-Received: by 2002:a05:6e02:170e:b0:3cf:bbd4:8aef with SMTP id
 e9e14a558f8ab-3cfbbd48bc6mr91708935ab.19.1737787610590; 
 Fri, 24 Jan 2025 22:46:50 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:50 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 13/63] dyndbg: reduce verbose=3 messages in ddebug_add_module
Date: Fri, 24 Jan 2025 23:45:27 -0700
Message-ID: <20250125064619.8305-14-jim.cromie@gmail.com>
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

When modprobing a module, dyndbg currently logs/says "add-module", and
then "skipping" if the module has no prdbgs.  Instead just check 1st
and return quietly.

no functional change

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index fc9bf5d80aa9..6bac5703dd41 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1245,11 +1245,10 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
 
-	v3pr_info("add-module: %s.%d sites\n", modname, di->num_descs);
-	if (!di->num_descs) {
-		v3pr_info(" skip %s\n", modname);
+	if (!di->num_descs)
 		return 0;
-	}
+
+	v3pr_info("add-module: %s %d sites\n", modname, di->num_descs);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-- 
2.48.1

