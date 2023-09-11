Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D673879AC5D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4203C10E361;
	Mon, 11 Sep 2023 23:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF7B10E1F9;
 Mon, 11 Sep 2023 23:08:53 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-792707f78b5so171457039f.1; 
 Mon, 11 Sep 2023 16:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473733; x=1695078533; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jIIYUwBsaiu36WnKQykm9kj4fLnG9Ddt/hz9ZLesgf0=;
 b=qV+yQK5ygGon+pG4fiy37XZO6U6r8proKKyq+W90Rq79ipBaYnlR5UjqT9tl8cZXgf
 YVAJNKXB2myDkc+5dIXwyS/FInWPnbcoAJQY3Bpy2XHro/hTPXaSw/Jw/MvYO+geDNlE
 2O0D+HU7Mb7CCPFi0rUxv1psaMK/Q2b6tbaQ+tKNj1EDYLVsJIFVhtRIO62acOCC/5J+
 m8lAl0kJy9WAL9HJrGpXdQtgAMYm77AtbC6x66DyWwz4WrD7lUmE6SSTVUsK7N1zlHk8
 PA+a+KFojHyY9SRzyvOuvOlhqwYDf/IB6pjVwWR+J6YwgN5sb/XBMtDPJ3yr/GqPLI33
 On9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473733; x=1695078533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jIIYUwBsaiu36WnKQykm9kj4fLnG9Ddt/hz9ZLesgf0=;
 b=jBM5PqwPEjWVZH3r4pzE5i2BirYTeFjw1BMjY5KYhQ5KO0HNBZdgZW64/+x+95EGbI
 LfFISre1WkT6nCvgcKZERDDGloLXEQy51vJb786Y82/FdOi5+HB4rni8xVcgTNtPjtbi
 uERidE4eUAczZw0bXRfXM3LnwR7SHZlDWxumsaMfl7Ky9VCPj2bGMXndfv6Z7+qFLua0
 4OYBR7fV2Q9eluJruL1cfOJ1PzatxYjPJM1ipHi0RC4VaTvfReJBeUWNZD1krxBlCMF2
 CXiG51XoJ8YVT0SyFvqtV+U4wcuKE16xmEFsO9g0Z0AMQZ/xy9VIARakY/8k1g1djqTD
 x2kA==
X-Gm-Message-State: AOJu0Yz7tolDFCPTK/X6iO0ICg1+DAkXpCBuGSPAUkWTDnzoFnnFKaXH
 WYVUVpCF1fx8yQPNEDIVRYU=
X-Google-Smtp-Source: AGHT+IH4lvM9n3Sq9J/JyIhbgS3K6eNigqCkdj6RF5icXfyb3Ss3T/pl8jMa+w92YftWgv11YJIzZQ==
X-Received: by 2002:a6b:fe07:0:b0:795:12b0:c2a1 with SMTP id
 x7-20020a6bfe07000000b0079512b0c2a1mr13897349ioh.10.1694473732975; 
 Mon, 11 Sep 2023 16:08:52 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:08:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 09/22] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Mon, 11 Sep 2023 17:08:25 -0600
Message-ID: <20230911230838.14461-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911230838.14461-1-jim.cromie@gmail.com>
References: <20230911230838.14461-1-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org
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
index 05c777dedf27..e8bade6c6c06 100644
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

