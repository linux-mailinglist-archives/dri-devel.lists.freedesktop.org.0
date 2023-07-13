Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D627528B2
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD61E10E747;
	Thu, 13 Jul 2023 16:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FB310E730;
 Thu, 13 Jul 2023 16:36:56 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-346129c9512so1948595ab.1; 
 Thu, 13 Jul 2023 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266216; x=1691858216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fCryleot7DYJMVCUstKegVHZxdFt0UcbYK1dV/Zx9Y=;
 b=j84zOzS2UdE9+xPQXLUCHUex2P5pCyffe4WuGd1a5TD9mNcJ3dfkxSd0JWEcrmKK3p
 FsN52We9fV2omZa9UTDcqgaDUazFxwF3PhwXq8kuFKlLKAHU8jlF2UG+nitlQWarAtRB
 SQAswSd2N5CMlwNXtfBIlzg51uROWTE+9wIKl/pY7nwagOoH9+NNZukDTeBKk3uSXd1g
 BsCCFDamozGg3oBsY5uQqVrGjGa7pwxon538wE1rQzY9doyU5eJNfIaDSFJbKbTlna5n
 MwlLLEDDfw01PI6/2ba8Zs3D75BG21Bn6VZr9c7GmAaC5gTfgadse9rfrAlHWoi7eX8u
 YpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266216; x=1691858216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9fCryleot7DYJMVCUstKegVHZxdFt0UcbYK1dV/Zx9Y=;
 b=QKbwurqF/GkVqA7n6h3jth7MAaCQ2AC7tL17th6JYqcXCNfIH0t/+rAYpVDV4meuW2
 rRnHNrMje0e9vEV+VV2xsPx2HxfiPxeM6Bn7SZgNyovA+i/tYSmH7wcvXHc8B62IAFPJ
 RUH94HD3yZCKmEspwqvmITGuJbyk5ElOtERsfCy8HANEYNVLh1eWMIOhIizOl4Z16ZkD
 LjAapHE88RTXI7up8SAK0zbu284nTs+OkUplNPOW3iN4MHH/dmjSLjddY+wv3tUzmgGY
 yf4EWRdtAhgAVPA79HpPIM8DC6SfENls0VuRcNZT4o7Acls7OpWmHJkVkOjsCyWagNTJ
 3V1g==
X-Gm-Message-State: ABy/qLYSd6O/pW4BkZgFzHaowrguJ1bCYVme8ZXd8K01EqbMxlSeoIq9
 elJDu9ZM8XzqiwY0K/LnLNU=
X-Google-Smtp-Source: APBJJlGFst7/NrXtwCSYzDr7Fr8pT9UUNTPwR86Us+eEz2G7l30W0AuGerUvYYRag5Vb6AlTWP67WA==
X-Received: by 2002:a05:6e02:66f:b0:341:24f1:3f74 with SMTP id
 l15-20020a056e02066f00b0034124f13f74mr132294ilt.14.1689266215917; 
 Thu, 13 Jul 2023 09:36:55 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 10/21] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Thu, 13 Jul 2023 10:36:15 -0600
Message-ID: <20230713163626.31338-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
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
index a8973d1a6896..f392f692b452 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1112,12 +1112,12 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
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
 
@@ -1151,7 +1151,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 	seq_puts(m, "\"");
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter, dp);
+		class = ddebug_class_name(iter->table, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
-- 
2.41.0

