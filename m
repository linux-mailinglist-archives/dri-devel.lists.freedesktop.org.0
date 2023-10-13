Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BAC7C90C1
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 00:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993B510E66A;
	Fri, 13 Oct 2023 22:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1363610E656;
 Fri, 13 Oct 2023 22:48:42 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-351208d0d6cso9740445ab.1; 
 Fri, 13 Oct 2023 15:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697237321; x=1697842121; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=QmHE+5Q4w/GYCZ2YVYMgeRtiITq+1fE5RAgjAyzL5YavccUiLkr1XxW42bkMeEl0lG
 EtQH3QQ4ptDmyPanjNy8rPcE99TMeSZ7onvvHKVNTQOqagMKln1QNjRrVPUjwxKXF6cm
 LsmygJBk+kZ6hNHlXaT9nH3CkbN0TWp752xGm/ysAAcMmigh9VhwecAxxCuLUSrmKy3g
 9ubqF5KAnm451lWubyc7+xHJF6GQmroRpuMyFXxxZLk6tTBNUSxLc3z1LkFJvoHX7+jA
 gyi97b14DlOjS+lf4tzo26hBL5MSXHgGbVP2vaKR7eQOvoJYe6daX42A519CiPp3zSvr
 ac+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697237321; x=1697842121;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O4Nv87Lg2zXFTsrsMPJe4o1KQfKM5CR/Su7zfjGsbi8=;
 b=V046RG1MAhtWY8NIJEQ8nOO87a+bw8xQCRxSbhFV5O96U4EcWBQ06ySX3rwj0KemfJ
 aayJCVgjdjFYDwgBh2lXsYrMA2gBGLuphiF903ia9XOZr8X5b+djOe+eSr94raidEPXU
 SqJ4fVOWYESafQhDkDEgL4bsSWa/AW9qEheBOHL5CHvkpA0JDr9O2cKsktw6HvxPLJKs
 AQesaXBE1v6ikzOqwnUpZ8G5Hsd4w3CBYmoEpjXIaq7L/ZPVm4upw0Byhg97b0aD5ED6
 HK6SNL0GU/Jl7/hDHPEUOM8q6IOEDY1sd7y+4d39LQv0OlHakp/zriFafPv9Wi2FnEDX
 K/Aw==
X-Gm-Message-State: AOJu0YykV1cGkdiShWW2+ctUbzJM5A7/GYO47zeAmyukH3B73h6arOpo
 eKlmr5WAvyZcj0A7Y3ytxOU=
X-Google-Smtp-Source: AGHT+IFi2WfSSyAbjqCpWaNlxupVxRqtj0XluiJVnf5vbLg35Uz1MLSFKUJlsjNrq6Dz1o+F9+CISA==
X-Received: by 2002:a05:6e02:1e02:b0:350:f0bb:6a42 with SMTP id
 g2-20020a056e021e0200b00350f0bb6a42mr39141991ila.29.1697237321292; 
 Fri, 13 Oct 2023 15:48:41 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 t10-20020a92dc0a000000b003512c3e8809sm1683071iln.71.2023.10.13.15.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 15:48:40 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7b 10/25] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Fri, 13 Oct 2023 16:48:02 -0600
Message-ID: <20231013224818.3456409-11-jim.cromie@gmail.com>
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b07aab422604..8158943b350d 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1117,12 +1117,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 #define class_in_range(class_id, map)					\
 	(class_id >= map->base && class_id < map->base + map->length)
 
-static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
+static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map = iter->table->classes;
-	int i, nc = iter->table->num_classes;
+	struct ddebug_class_map *map = dt->classes;
+	int i;
 
-	for (i = 0; i < nc; i++, map++)
+	for (i = 0; i < dt->num_classes; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1156,7 +1156,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.41.0

