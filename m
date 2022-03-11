Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C03B04D59D9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 05:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D631D10E630;
	Fri, 11 Mar 2022 04:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BB410E29C;
 Fri, 11 Mar 2022 04:48:16 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id b14so5242932ilf.6;
 Thu, 10 Mar 2022 20:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oAf0LosuiaLpXGtYs0EMjapukN/Wz4GaZEg3vD6y6ak=;
 b=FGomt3SpUqyItDxQTS6QatofCRhiZIi82c83FcZW5lAA7Hia4dUP0QS/5UI8s6V1iG
 p9ewH/E8qTORsPj4+OnlwfDOXUVrf8HA+fTwEUNyHVWnEW32jyMqS0HEMeua00mED9fG
 Jt5WhOje3GPSyOyvOMadpj6kIzq9ffhFw1is+8tPx5sOzNgcO1DanXFs7auqvAQR2OBg
 O5UhHrzIh8D2tX1MtSnEyQ5Xl0wYsAOwDwWqf53yNtM1nYFJb6c8e8muyyQDgIBl6Ddw
 xd1IC+TTQp3rkOr7C1IvU2aLj6DFtJpHblfIL1P1+F7+iR/oDHQO/VvQ8mZgMhLKEvdi
 yJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oAf0LosuiaLpXGtYs0EMjapukN/Wz4GaZEg3vD6y6ak=;
 b=bOhRfXS92SYcm0rjfiwngIGaGvoFnJwDbM8ag3Kv/YDXcgFHiQwcCKl7t6BjO62aXF
 0z/+rE48Hxs780OdDPWfRdNP2EZrN5+d/HtMXmhxmaxki8xsWw/iTe1KIjXAZZcc32i9
 KsGHR1XFzic/t/8+4T5Bz3B6UNy/KOMtwkW0Vh1Awv5z+9+G+hBY2oL+ro0oRlinjUwy
 dvy4a7Kds8hqjrsSGg1DW9YbArqFgJqdcpY9p4PgBCgHl58xj0ctD+F/69oXUxwLO2oM
 XjVglbT7nhMB1WAwUL/WndqbjY56ElR4N5+jb3sWEPy73jupQ6u4kvLyBgKcO5kVQYEY
 MOcw==
X-Gm-Message-State: AOAM532Sc4oC+LauYGULIKx44/2cnt0GFRS5rqg/ylk3fDlK1cprf+gQ
 gpGbzM/6CLgLTkmH6Em50kwZKVZ+Dd2Ltw==
X-Google-Smtp-Source: ABdhPJwFZHg/BgFkwfNAHNLyEDOYNqmvUk/C+4ceSxeoTbqDRVietvJzifHbTMNcdfYqz0MT1Xo4PA==
X-Received: by 2002:a05:6e02:1946:b0:2c7:730d:3e35 with SMTP id
 x6-20020a056e02194600b002c7730d3e35mr2075171ilu.179.1646974096273; 
 Thu, 10 Mar 2022 20:48:16 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::f10e])
 by smtp.googlemail.com with ESMTPSA id
 q9-20020a5edb09000000b00645c7a00cbbsm3529834iop.20.2022.03.10.20.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 20:48:15 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dyndbg: fix static_branch manipulation
Date: Thu, 10 Mar 2022 21:47:52 -0700
Message-Id: <20220311044756.425777-2-jim.cromie@gmail.com>
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
 vincent.whitchurch@axis.com, linux@rasmusvillemoes.dk,
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 amd-gfx@lists.freedesktop.org, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In https://lore.kernel.org/lkml/20211209150910.GA23668@axis.com/

Vincent's patch commented on, and worked around, a bug toggling
static_branch's, when a 2nd PRINTK-ish flag was added.  The bug
results in a premature static_branch_disable when the 1st of 2 flags
was disabled.

The cited commit computed newflags, but then in the JUMP_LABEL block,
failed to use that result, instead using just one of the terms in it.
Using newflags instead made the code work properly.

This is Vincents test-case, reduced.  It needs the 2nd flag to work
properly, but it's explanatory here.

pt_test() {
    echo 5 > /sys/module/dynamic_debug/verbose

    site="module tcp" # just one callsite
    echo " $site =_ " > /proc/dynamic_debug/control # clear it

    # A B ~A ~B
    for flg in +T +p "-T #broke here" -p; do
	echo " $site $flg " > /proc/dynamic_debug/control
    done;

    # A B ~B ~A
    for flg in +T +p "-p #broke here" -T; do
	echo " $site $flg " > /proc/dynamic_debug/control
    done
}
pt_test

Fixes: 84da83a6ffc0 dyndbg: combine flags & mask into a struct, simplify with it
CC: vincent.whitchurch@axis.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

--
.drop @stable, no exposed bug.
---
 lib/dynamic_debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index dd7f56af9aed..a56c1286ffa4 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -211,10 +211,11 @@ static int ddebug_change(const struct ddebug_query *query,
 				continue;
 #ifdef CONFIG_JUMP_LABEL
 			if (dp->flags & _DPRINTK_FLAGS_PRINT) {
-				if (!(modifiers->flags & _DPRINTK_FLAGS_PRINT))
+				if (!(newflags & _DPRINTK_FLAGS_PRINT))
 					static_branch_disable(&dp->key.dd_key_true);
-			} else if (modifiers->flags & _DPRINTK_FLAGS_PRINT)
+			} else if (newflags & _DPRINTK_FLAGS_PRINT) {
 				static_branch_enable(&dp->key.dd_key_true);
+			}
 #endif
 			dp->flags = newflags;
 			v4pr_info("changed %s:%d [%s]%s =%s\n",
-- 
2.35.1

