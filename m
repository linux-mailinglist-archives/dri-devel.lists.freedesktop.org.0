Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FC7528B5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7773010E732;
	Thu, 13 Jul 2023 16:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE3B10E728;
 Thu, 13 Jul 2023 16:36:55 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3461053677eso1987065ab.0; 
 Thu, 13 Jul 2023 09:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266214; x=1691858214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ge7HQUHFN0SdBhoqRDpb0JNuijpwX6fCYvOeNIH8KRc=;
 b=n3bBlGnlSg9QDxZ/zCAJpz7Pc8pBJRk+4xVFJ0sAQSSYAsQVsbLE4H2H37JSOHj8pd
 QcIGXwYWABv0GdR0B+Sf3oxpZejkcpfjzTPy5LC98Awji4CISg+TWEIH9ukXZw9+XP1j
 znzGIoD/xa0Ocx7fxHzrmKFn5W7poEyqzlvK1w6AP2rH8vOQ/ichOn8jfMEldAdAs0/s
 4HZRU9tjV2B3MAHWgy7UQ0/zI3upx6P18W9CInoOGDCs46viWZ4aJwfZqFHiLUwOSs8J
 W1L+gV6ZEJeBgq8W2J5rzeDgkXOtWAyIsIyVbLRNP+kuTCJ+ZEG/pmQFHByUl94Gf2Df
 j7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266214; x=1691858214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ge7HQUHFN0SdBhoqRDpb0JNuijpwX6fCYvOeNIH8KRc=;
 b=Gd0gmtLJhp4eBntbTCDWLzmo6ldumxJnjZSRT2XRiW6YyB7oMMZAMjgNYCGTwICKRU
 MMdG1mGc7uarjbKCuze0HA/NScoBrPlXNZtmfAZgR6Gp75qnIRKcWKLMxoAlTA8cekHy
 d9L77B3x89CcnFRrMWJwPsn0opur/IA+vDmTXRnOjqnpDJkAVpyW8JUcKEVDJQCSQbtu
 CGAWooPI1aQ5ZLsleWa+KczN8GFmzXDaCOei7csh58o++GK5ixyrBjS1fDRHEFkK/9hD
 PmJsvQIN7ygh5AYyBWSHVI6UHUeCIatC0J4l/xEuGGFvZpRRFGUb+BkDivsfskjOs7e5
 7KNg==
X-Gm-Message-State: ABy/qLYtOrbm/wWbo/8YKfWNw+I++Y1QeyGBTbZBVo8TSAgXQUApanIp
 23OaA3759cyYVx/5FD+kMpc=
X-Google-Smtp-Source: APBJJlHfOWf3WJSpEYYZ6XY2Auk+PJoHDIFO0/LhDEYYk+8EA7hUAIjPMbHMK/grzpHYfuZhFoxfuA==
X-Received: by 2002:a92:6c0f:0:b0:346:7fc:4fb8 with SMTP id
 h15-20020a926c0f000000b0034607fc4fb8mr122634ilc.1.1689266214495; 
 Thu, 13 Jul 2023 09:36:54 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:36:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 09/21] dyndbg: silence debugs with no-change updates
Date: Thu, 13 Jul 2023 10:36:14 -0600
Message-ID: <20230713163626.31338-10-jim.cromie@gmail.com>
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

check for actual changes before announcing them, declutter logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 2a5cbb68d88d..a8973d1a6896 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -590,7 +590,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 				     unsigned long *new_bits, unsigned long *old_bits,
 				     const char *query_modname)
@@ -601,8 +601,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits, *old_bits,
-		  query_modname ?: "");
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -617,8 +618,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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

