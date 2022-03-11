Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677E4D59DD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 05:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91C110E734;
	Fri, 11 Mar 2022 04:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D310E53E;
 Fri, 11 Mar 2022 04:48:20 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id l13so5212995iln.13;
 Thu, 10 Mar 2022 20:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBRXqLWuyBojQser+FbveA33IOgP8H/VueHlz3pP7BU=;
 b=Dyxrf9L35Hr+o6Rm/FEKjC+JQ97HPxYkwKzea8dMbY2oborFn0jItr+z4C7tIGKC97
 8CTghaUFfyVolu/8SQcbgXHPRbOQmxXT2ukp7wit0PME42zZ0LDpu5Y6PvMe6BtiPWp2
 3cEDeZCu8FaaXKll6oe67z4fOGMc7dx1mDtWbpssZseAEqblBKdkJfMuaQ6AyVYbdjcL
 +ZVZHqKsDL4/ypd8F/RCAVTmLiZ8m493W9XdltdXs4JDb6MH+YOg5OjHhSaZK9kQahIm
 bIvpqdAjCHCEwQfHGz4fLPTwo0UfpgOUXu6y0+tbuz5pW4PXETXeTy7a/bk0DayQSzFo
 7Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBRXqLWuyBojQser+FbveA33IOgP8H/VueHlz3pP7BU=;
 b=ZzN2CPptW74OZOP49HQVhpDtRXEb0gqHvLr1XDsfN43TazU/z7M30/KaS0mm60RIw9
 0X1p4yG7ktDG9+59rD0g/AxcFxOObZM11tvloCi7J9edhax+OxbZsV3UFEB31gFzNAw4
 zbBReYSPQp1j5WOHd4CW7TOKjcBZIfsQlF5BpyqiAyCqYH6QmnnKe2gmSARnqwwlGC0k
 OjitHO0MPAxl+QXU9nLUKurcWfFRiTa1i8jJcIWu19f68r+OOfCD3QFPgRLpb3a/jTb3
 +4X2oQ9PlM5qglbC3SWgiXgyc4ouR9KAsuiHQiI73neK50zw50dgN4MiYljQzqwSWN6b
 6t5g==
X-Gm-Message-State: AOAM531gHSXhaRnLy8p1S+UrzIAg0hS5YWGnwyic6NrRVHobmdYDE+bd
 RZEPnSNyiMa/5l0t4Z3UlB8=
X-Google-Smtp-Source: ABdhPJwJ5EfN6gJUuWZfyYHiS3993axqKmOQimf6tP1CjpSIoyz16zSG/Fwey29yVYI3Ip9G+rcrEQ==
X-Received: by 2002:a05:6e02:11a4:b0:2c6:40dc:d30 with SMTP id
 4-20020a056e0211a400b002c640dc0d30mr6420886ilj.283.1646974099505; 
 Thu, 10 Mar 2022 20:48:19 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm3529834iop.20.2022.03.10.20.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] dyndbg: show both old and new in change-info
Date: Thu, 10 Mar 2022 21:47:56 -0700
Message-Id: <20220311044756.425777-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311044756.425777-1-jim.cromie@gmail.com>
References: <20220311044756.425777-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org, amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

print old -> new flag values in the info("change") message.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b15a9c715e5b..cceac8ebbacd 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -158,7 +158,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	struct ddebug_table *dt;
 	unsigned int newflags;
 	unsigned int nfound = 0;
-	struct flagsbuf fbuf;
+	struct flagsbuf fbuf, nbuf;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -223,11 +223,12 @@ static int ddebug_change(const struct ddebug_query *query,
 				static_branch_enable(&dp->key.dd_key_true);
 			}
 #endif
+			v4pr_info("changed %s:%d [%s]%s %s -> %s\n",
+				  trim_prefix(dp->filename), dp->lineno,
+				  dt->mod_name, dp->function,
+				  ddebug_describe_flags(dp->flags, &fbuf),
+				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
-			v4pr_info("changed %s:%d [%s]%s =%s\n",
-				 trim_prefix(dp->filename), dp->lineno,
-				 dt->mod_name, dp->function,
-				 ddebug_describe_flags(dp->flags, &fbuf));
 		}
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.35.1

