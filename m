Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87117A1C158
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C2B10EA5C;
	Sat, 25 Jan 2025 06:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RUBp8N7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CDB10E2C4;
 Sat, 25 Jan 2025 06:46:49 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3ce7f6fdd2aso20863835ab.3; 
 Fri, 24 Jan 2025 22:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787608; x=1738392408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aL4TX0n3dq5vrpGI1F4EuJXOXo5OciZqJbKEL8rj1EY=;
 b=RUBp8N7hvgFpW9ZevEz7LJQLddEwNqqaJrnfZVWt5+13j/wJ1QOgyBaNyhWUuH6Xnr
 xrF05goBlVlerY1LN+O76VlNJI+zMVVcJ2KtB0RSG7LqP5fCXBpwbNMrX1/ruTW8bjQu
 XHfQoBdSJqa5nKIxNQLyV6Eo4YZS7R7G0o3N2EGhvoUZoDyON8ojS43NMnLPavIGrfa6
 P7QTmg9A8eRD0pSKnj4mko13OuF7AjB0kJ7fAUUQ3U1b26I6g92HnTkrOeFzqz58ajKs
 0UOB9A00Nxd+DQlC2PInGCZU0c/iF2oAb0LrzzYFo21huOWUskt9eqk5R8NtrC5sZagD
 HqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787608; x=1738392408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aL4TX0n3dq5vrpGI1F4EuJXOXo5OciZqJbKEL8rj1EY=;
 b=Jsujw8lPTXsjU5wXZv2qeuOUTxXc95OQ3+ls3TL4u0XIqFVW7OJ2W7FsO94/4mt/5/
 VANXIrhyLZOofgzc/LUb07/rNyaGpgBRKzpdOjIKzVVta0VnrRhsqnCZavQgp8hGARC5
 71AiI87h0bvh8Pw/VJYJ+MFsd0cUT7hT/kaqvTjQFfAM4N5fI1ya8s/3/86cj3cf0B6e
 QnNDU5XVXhQO2PtdN1poH2uzcy7UjgeCsDavPP1sU2+WwBT8z01DATWdbf9KVl8h1plv
 OoNhVWXIJOS6mb75/VhpIhwJ0P5ZwKC1IyfaAculWf5cAeHw12EQj7lF/jG2kJppH4UK
 Tlww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNv4tcMmuFos1RVgZ/YWTw73qsj1+dBcyB45hm8xBNHCwMuDntVkzrUYxCqxs10mJxTNf0OLQ6VXbP@lists.freedesktop.org,
 AJvYcCUtLUCXGurvvUUr6txTkJ2ORozBSiyxadjsGNgNXFthZyEO0UbhMGZA3XDZboueaVIqZaw4kDDl@lists.freedesktop.org,
 AJvYcCXSrFuuUvjOrTcfF+2Wnpsz1TFrSgfwBJkp3hfeQvpJofebuckQkMCosq4gPX50L63kfkPdhBesdW+1@lists.freedesktop.org,
 AJvYcCXsfF6cHlFmK47jz4VZ9bxr0b8f/TCnpreew2u3W0RvJbfEwy8Pt63OGgvito6xyCRMTIvOYdosVueD72jjGw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3bsptONOr9UvYbDOXtcxWzaA1/N7xW4/CV4r97zAU41VlfFlw
 oC/uNLJ+d2aR77ZaaHYcDRxYoz/yD6Km9jDBBmOhArpyrxKbJUk4
X-Gm-Gg: ASbGncum09keXZ7VMvfcHoOWITbohmH8ptsjAZmkrPdNdTSHGu+gEwM2w/t347hNMcR
 qvrqRLZ8YfgUYnrl3xpr5LIw0g1s8v9bZ9ciybrUkiGKBCRz+NU9ydV3FWV7FOJ6aiYmoMIAgIh
 gGwVCeuS5dAiCTZ60CJwzYrSsHXhWcoI2eUUjha80ig1nMBsgKlnrwD106fukYpQ/BR0uEb3vBf
 ioQi3yaNuq2fY9zw93YHoRAG34Eh7v3zppaOpRUtk4CdAvTPH0Mrunpx2aa9h8JRTipUwNW8Nvc
 YSHVGujNOvzbWo1P0amKK0rWlGAZIM/6qduIfA==
X-Google-Smtp-Source: AGHT+IHL/GoA7XbieWLMv6FyLDw1bl4z8/ZDdb9aS4OdzpNSQZXG/htmpeI7MxFcY4/KQhwkkuHohA==
X-Received: by 2002:a05:6e02:3f03:b0:3ce:87e3:c26c with SMTP id
 e9e14a558f8ab-3cf743df88amr329669815ab.5.1737787608464; 
 Fri, 24 Jan 2025 22:46:48 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:46:48 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 11/63] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Fri, 24 Jan 2025 23:45:25 -0700
Message-ID: <20250125064619.8305-12-jim.cromie@gmail.com>
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

Change function's 1st arg-type, and deref in the caller.
The fn doesn't need any other fields in the struct.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c27965180a49..a3849ac3be23 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1120,12 +1120,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
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
 
@@ -1159,7 +1159,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_putc(m, '"');
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.48.1

