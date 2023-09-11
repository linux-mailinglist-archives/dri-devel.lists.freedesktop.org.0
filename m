Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1079AC55
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 01:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF6510E376;
	Mon, 11 Sep 2023 23:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCA210E1F9;
 Mon, 11 Sep 2023 23:08:52 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-34f6d035acaso6622825ab.3; 
 Mon, 11 Sep 2023 16:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694473732; x=1695078532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OT6IFguW/4DLumHawSixfP36EK45t059NQqpOGGT6yM=;
 b=aU6L0BzdoKUrRXBVYFiBhL1ShbFzKccKH0fRLsi1kdgUuLukaIpeP41sB/NAuMXmiO
 t62KLMoh3aFbxuMEnV9YW4qkxrSaR4Vslcf8Zgx5vX/9ajtohuSAEsMmD9x2DdY/+uPg
 HAbvQmsojFz8QWY/WZZgCJSx84XRgLVRE0TjkrctE/d7XebEWZ9E0XsAbZW7viS+Tm+4
 rHv+GIqEiBp8C8A96tcU+6S241a73PLpCvf0Ypy/nhbFplPK9PXqC4uecVrNbBefYJ1m
 alreE/yh68Mn/BK0Yr3nVbsDlqovafywyAuPtbrezvF+D8yqNFfpbMKQeomrSpcbV1wV
 bLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694473732; x=1695078532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OT6IFguW/4DLumHawSixfP36EK45t059NQqpOGGT6yM=;
 b=UO2ASsUYYk9b+5UY/6eQYvim1IdltdvBcz7lwYe4quNkW7hRWePtITpnRSpIh7aQN8
 4tK5jgCdDMVbArrLjBDKuW2awWG/G67ULeky5M3SAXs8CwU8aWBaEwj86W3kjxVZmJVI
 rGvY0ySFnv1vTV7p4G2fMtnhoVBbSdJcE4iJrfJBig8Scvxd9VRfZosNamM4JWaxwN3F
 omCkITEmvYojgpbon3pruYly+zvVXpcoRxE6VBR9Gl1G0wNLWfb5H67/+L64EmLAxCgs
 spe8PEVnk6QGDVh/yP+NFBn2EudAH1kJsWMwxJFnmU1irfdy46jfiWjZloeNSRAMAeAA
 bOYQ==
X-Gm-Message-State: AOJu0Yx1LKEDaJGNkInVZ6lrj4MKx02cfDvaptb9eqVShxoxPnffdTE7
 Ek0Nch665KP9iaqgkzbE6qo=
X-Google-Smtp-Source: AGHT+IGXcqZsyEpWo/sj2dkS8Od7PevZHZxGLE+VJj9Aw0UXdcHekh90w4d4NlXrlxpXOlQNiZOmkA==
X-Received: by 2002:a05:6e02:961:b0:34c:dd54:10c5 with SMTP id
 q1-20020a056e02096100b0034cdd5410c5mr11705350ilt.10.1694473731983; 
 Mon, 11 Sep 2023 16:08:51 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 z4-20020a029f04000000b00423240c7296sm2512607jal.69.2023.09.11.16.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 16:08:51 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, mcgrof@kernel.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH v6 08/22] dyndbg: silence debugs with no-change updates
Date: Mon, 11 Sep 2023 17:08:24 -0600
Message-ID: <20230911230838.14461-9-jim.cromie@gmail.com>
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

check for actual changes before announcing them, declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f64d55d191ad..05c777dedf27 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -591,7 +591,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -602,8 +602,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -618,8 +619,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
-- 
2.41.0

