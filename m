Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757997C744F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 19:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EC010E548;
	Thu, 12 Oct 2023 17:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D658710E535;
 Thu, 12 Oct 2023 17:21:56 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-79fa7e33573so47576839f.0; 
 Thu, 12 Oct 2023 10:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697131316; x=1697736116; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/hQ8DAFT4FsmbzhSx1IDeWkXEPOHVXkBPwwDIEI4NyY=;
 b=dKuqbtGu5UuDNmzbDLSqLA1reYBS49nc+Z83nsdWsE1PWTmVIY1im4cJxde8Fs2sf8
 JGw/aTO9sS/oMgmo2zb7qey8PgbTc85/p4nID3Pf2t6q00sSqpjqoPeC2TyjteLT1N8A
 Rnkth+htnfXpriT5Pu5vXzYihO2szIb1el9HZ1xgAUdiqglSz8a8ob96dsu5D22MGdK3
 1+JFmn59/jeKWjIMQIjn0zqINB8soK5rkbWRxpukiVbrNKW7BMdTkQEnqzWmOVfNEpzB
 VHDEkcxSW6akRkD8mU8kbeJtJqaitHICuQmsj7yB7pSDF6KqX0faJU0lrasiSSe9ThR1
 iTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697131316; x=1697736116;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/hQ8DAFT4FsmbzhSx1IDeWkXEPOHVXkBPwwDIEI4NyY=;
 b=RQCxO04OFdeSLL6Xv/ZuvopcJa+pzA2bAyhtge66X/aX1TvoZJNI/8f0wPJjU0s/Ve
 zCjVsTbGxq6MBYZDx8xxjBbGBjwHqhZ2sIQ1otQ6VlilUH0uMMwiVfEfmrYYoewbOqaa
 L8IUf6vIUky/aOAW2TtjFz/wIClmY4lDeEj1dI0oQWWnmh28OJn7i0iOOodVwIOzr85l
 YwvyFDVXKw98PJXFkPKBcHWDaTW5uYHA7ReAqE1FoyNlmZ2wyz619RP+mM0PmSQFqVET
 abXIN2PNb1bbjrvk/8d8cDzZyOxaKF+5dNevp0YHAnTraqvttg/zqrWs0kF3d7jZ5Wjc
 WA7g==
X-Gm-Message-State: AOJu0Yxya+9LSw4UBp9jeRYWGZNHZYBkxfe1i2oeuw+ffL93mDo3de8e
 SwU0f6V2U+jPia71c12ciIk=
X-Google-Smtp-Source: AGHT+IEo1g2HTIBCaLMDhfsFFJ7LRrzynbNpLzKaWyP6ru97x2P+o/io0ObzBpjOhWBtJ4x5Hvl3VA==
X-Received: by 2002:a5e:8810:0:b0:799:2163:418a with SMTP id
 l16-20020a5e8810000000b007992163418amr27533828ioj.13.1697131316146; 
 Thu, 12 Oct 2023 10:21:56 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 r25-20020a028819000000b0043cef0711c1sm3992211jai.158.2023.10.12.10.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 10:21:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 09/25] dyndbg: silence debugs with no-change updates
Date: Thu, 12 Oct 2023 11:21:20 -0600
Message-ID: <20231012172137.3286566-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012172137.3286566-1-jim.cromie@gmail.com>
References: <20231012172137.3286566-1-jim.cromie@gmail.com>
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
Cc: groeck@google.com, linux-doc@vger.kernel.org, jani.nikula@intel.com,
 daniel.vetter@ffwll.ch, yanivt@google.com, seanpaul@chromium.org,
 bleung@google.com
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

