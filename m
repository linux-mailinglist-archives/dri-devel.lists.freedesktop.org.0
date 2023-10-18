Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7D57CE3A4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:06:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB3810E420;
	Wed, 18 Oct 2023 17:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D410E418;
 Wed, 18 Oct 2023 17:06:20 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7a269637b98so255560539f.3; 
 Wed, 18 Oct 2023 10:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648780; x=1698253580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hQ8DAFT4FsmbzhSx1IDeWkXEPOHVXkBPwwDIEI4NyY=;
 b=ZihT1YRDiMJsQZump0m7j8MNIs5cXAS13mDQR2FLptLU9CDAm/2HiVKleIC9AFU3/X
 xoKAcO4ZrXwRYYgcjNq0ngVyIwk6wyChQjP9NaGGf6oaDZucF6rTQPLemeCgUN0gB/sG
 zia5pFl/BUOpEJnwmgusGYu66B6xaxpVwKfI3gLXJgaVHTS6kPbIPxutvLvbxfPJjiXY
 S1iiRIL0n+r/czu9tY9yuiX15lci2kIiba1M7zR/s88Ce29IE9cJbCF0A+5rtFJww+Td
 OvIE1FHfE0/umXw1tDftw4ezYOdlvS7EFsiW5QEZTF4IeAAj1V0Wr5V/TodzbtHqo+6w
 rbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648780; x=1698253580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hQ8DAFT4FsmbzhSx1IDeWkXEPOHVXkBPwwDIEI4NyY=;
 b=vhzw3TWmUwQw8qdFjtwzXBIGI63Ow6Nj2apJ+gqpXaEeL+RCzzXLkEHcyiH65+A3Z0
 PEDZV/PxB0fJcuJ8axYZH+Rp6RzI7fsJp8oyZfccz+iH1hk61PUbYR8y7Hn2rAo7cwbK
 En0iSKjVXAPnMCT0MDDr1xLKBmVNdRsAaUq5mvr+PVmBk7iycJ3b4q2NrMfVW7Wmyvc6
 HNVSqUCw0Um2IIrMQoPJhbtLnCrogCuHAqJ9EgGQde+VVP/sIdut9b3FYDJceTRZ7YXX
 +vitw9PgeWIodcMMioKTRI60GYjHbMUBuY2P9uqPD8Zw0i0w885mNzouJmZbA7x6vh2D
 mUWQ==
X-Gm-Message-State: AOJu0YxYtbWz6vwJnpkCBlHhfoQ+Zcbi06r4hwK1dRIUYwPS7VI+yDk3
 YpnGI0BgNafuSQTpe7SD3B8=
X-Google-Smtp-Source: AGHT+IGIAZvPMDR+fx6OVWKmXyK6iJj0xVodIpeExPc/78Fe8uEKXZgGaoSFAe/fSgw/hj7OJdSkBw==
X-Received: by 2002:a05:6602:2e94:b0:786:2125:a034 with SMTP id
 m20-20020a0566022e9400b007862125a034mr6919099iow.18.1697648780262; 
 Wed, 18 Oct 2023 10:06:20 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 09/24] dyndbg: silence debugs with no-change updates
Date: Wed, 18 Oct 2023 11:05:49 -0600
Message-ID: <20231018170604.569042-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

check for actual changes before announcing them, declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b0e11f6bfaa2..b07aab422604 100644
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

