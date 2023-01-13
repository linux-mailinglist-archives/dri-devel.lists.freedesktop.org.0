Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 986CF66A335
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 20:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D0610EAE6;
	Fri, 13 Jan 2023 19:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBD410EAC6;
 Fri, 13 Jan 2023 19:30:51 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id j1so2654437iob.6;
 Fri, 13 Jan 2023 11:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pKYcyxobqjkxw/cQW3qOcS+2FHDD+NQD5zTk5vyKT0=;
 b=kv1hHXeGS4Ae++h9FVHklLDkqQoIlKy2J/FnU2oFkPWRn5YRlU8UZcTs1RIDYWwwMO
 TBL4TmhQtrizT8dE0OVmt0zOTsf+k6Fva2BqdiHvacmnGEvy+iO06Q4Og8mLBeAe5QFl
 kuxpcjdby0PKyEBCSTTqCYgEPqqQgvUkZyytdXCsUgQIy6zX/aZ5G9Prr7L38uwY1Ijk
 20d022OjY5k6l8B8c9ZFZ1KDQzGPvYabn8hhO+JAdSSCH8O7HvIxPwHLDaI4Jb8qJRMg
 oh/Qq1f07LPCOL9D0gNAF5QNsdyexH02UUdxytsJvwBSGbhUC5rGGWWu+1G1uJGPwAaV
 NMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pKYcyxobqjkxw/cQW3qOcS+2FHDD+NQD5zTk5vyKT0=;
 b=32nl2e1MASlWr6ft3C3XSrCWlteoZQAFeTAOYm6FX3a7fWRaq+AonK5ozMTCeYo2R2
 lw8Rnfa7VpRVG3IZ+woyUJaRj6+/HUQ1xapK85wjkkUM/5sYsDqOXK541HcyntH8IQy+
 MT0BaFWlhI2D5cCM3uKtoSuh8eQz0GKz8BJs5UfxJj1VKQQKa+CaBNJpt/s1wV+IE4Yz
 9FW0vcRH1En0z0SJmKavOqi20Mbyi3dyb5dUaZiAPnudM19W5tZauOvYEDE7A/1esT+P
 fLtnAHmOdoPB6FirZaXAq+d6sJ37i5JwG0w9HhK4/aYFzjMPeqc4VS5TIWz7r7GmpvBd
 mhtA==
X-Gm-Message-State: AFqh2koXgH7CydgVmOhz07JcuY61k3R095sXK3LEt+JlNGAoFF02u6Q5
 TIso3UoHovOAUCjifS1jxOE=
X-Google-Smtp-Source: AMrXdXunTbUvqnk+KDACxZ3sT1a4zW0ivzpLR0SZLpWQKg8LPzuEA6wE5v95Q3wtvppI9IfGoav9Gw==
X-Received: by 2002:a05:6602:2083:b0:704:9ab4:ea1c with SMTP id
 a3-20020a056602208300b007049ab4ea1cmr507697ioa.6.1673638250500; 
 Fri, 13 Jan 2023 11:30:50 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e32-20020a026d60000000b0039e583abceasm6497289jaf.68.2023.01.13.11.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 11:30:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 08/20] dyndbg: tighten ddebug_class_name() 1st arg
Date: Fri, 13 Jan 2023 12:30:04 -0700
Message-Id: <20230113193016.749791-9-jim.cromie@gmail.com>
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

Change function's 1st arg-type, by derefing in the caller.
The fn doesnt need any other fields in the old type.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2d4640479e5b..10c29bc19901 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1110,12 +1110,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
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
 
@@ -1149,7 +1149,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.39.0

