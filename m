Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B5B76BA8B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 19:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1632310E444;
	Tue,  1 Aug 2023 17:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A9510E421;
 Tue,  1 Aug 2023 17:03:30 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56ca9a337caso1564446eaf.1; 
 Tue, 01 Aug 2023 10:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690909409; x=1691514209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fCryleot7DYJMVCUstKegVHZxdFt0UcbYK1dV/Zx9Y=;
 b=kROfNG8LDRCn7UgNyAgqsZx6rWtyVz4JtO0DqGP4BXmprbgnYl0ZfixoqPBvhGkHOU
 EU95RXDWQ9rUb+HVd3GNUq5Hhbfo+Jd63RduLoThfH63By1HGzM3fIIxH5EYZOA3fk1t
 xOSTQM1hGCm9bPNXS8l7jMFe1NzNjNFOXY+5SkbgAmGdOlrhPlkff3D8T+xCJJVVxMZj
 jSey6N4JABae7aNdBp+Z9ivpSWuvs286z11haAnSUP+OoJ14dm8baX2yH1+ViERfCHyf
 Pm6D9+hWoxJ40Q/bygWehp4Y0CPgMIZXI7WopcauzC6ikHCTgD5CIAQpne4kQVO0JQKY
 rXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690909409; x=1691514209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9fCryleot7DYJMVCUstKegVHZxdFt0UcbYK1dV/Zx9Y=;
 b=AmO7PdaDtBmyWCr9tEab1R7qXMuuyPBjR4SnBjOrFAoy0jAfhUL4D3OGNS9bLLiJHm
 hDIF45Ve7pVm2ONnFeGCHGJIpumyvsBoK+cJKqj0scV1FjqnRX656DEO9t2COzeygjmA
 srVAwZbn6kp137xO5NQtJfr5lKt34pBKMRRrO/Wgg9IaM4xfsPY29EMuTCmt2USY3mAi
 tJMyx+r7zdpR+mIQCUco0o6ExrvzcUGcrLpcOQbgaENkcez6MbvuG09W3VVsIVOSjOQM
 8Eyo4E2xaapbbJl+g+jDizPR7sEtgxH5E1UKRUYglXiOeMPmJTwKsdrBqNA0riTYz1O9
 LKCg==
X-Gm-Message-State: ABy/qLYOWRAd0Jq77Pc+sBcZaMk9A7rNweJ6Y3JBiPaNoIihs0AgYg+0
 IxDEWJHHGbDh/fSmT7vQpJY=
X-Google-Smtp-Source: APBJJlGGypX+v5MzycUzumx+CRUCdd0/RZ51+QF02i+R9Xx9KDzdU4X8EgAM+zTDxV9IMoWuyMcmsg==
X-Received: by 2002:a05:6870:82a4:b0:1be:d3a1:fd9 with SMTP id
 q36-20020a05687082a400b001bed3a10fd9mr7622319oae.9.1690909409285; 
 Tue, 01 Aug 2023 10:03:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o20-20020a02c6b4000000b0042b144abf71sm3768577jan.179.2023.08.01.10.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 10:03:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, daniel@ffwll.ch, jbaron@akamai.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 10/22] dyndbg: tighten ddebug_class_name() 1st arg type
Date: Tue,  1 Aug 2023 11:02:42 -0600
Message-ID: <20230801170255.163237-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801170255.163237-1-jim.cromie@gmail.com>
References: <20230801170255.163237-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
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

