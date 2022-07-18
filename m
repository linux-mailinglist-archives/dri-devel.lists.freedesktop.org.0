Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17CC577B2B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECCCA9C22;
	Mon, 18 Jul 2022 06:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E218A9C1F;
 Mon, 18 Jul 2022 06:37:59 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 125so8546622iou.6;
 Sun, 17 Jul 2022 23:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXOS454We3xvQC3yPmBTyPjVfKFZCejZgeG5/lQTXdI=;
 b=nh2D4yiWgmQKhgN1E674klHLZ86aG/U8w6p6fMV6zjWQ+g9QB/15hahoMQdJcP5YkM
 JPGSxE+fav1xVLASfHACS/SBiIp1Qbxqfsp87QM6NjVpBZs091eXALHhuynKlDFQu2tI
 /2btxjwmkJsGTzbONlQsvM3pWjDLSZhneBnwMwAZAoST++XJ7t4wNiH4G7RPPH6bQ+pR
 /Qnm05I/tBTIG0mjQjxJe4D0NBA1l0Mg8ZShBOZC01V1EOauyL76qMPADEHWQqnkA4WV
 Dguz/Ozffn8+uugpOOr6N3OD+HTuEd80LyJ+Pea5igo+UlS5EAYUtPJIP9zKsGtsQkas
 T1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXOS454We3xvQC3yPmBTyPjVfKFZCejZgeG5/lQTXdI=;
 b=YmgYQuDxz5NUz4S3/LOj9QwMUlpU9p/y880ZC3y1DY6MLr4/QlfC5lsKPxy/ZE5hoj
 Ed9n6FzolLYsUCD0t+ZR5Y9DrTqi9lyKU4jRqPEExZUCqyqmti9fY1NCiT+LrWwt+UcQ
 fy/dbWS/TsdCf9GcziYGlVDkXBCbT01sCdhtPhqLSqt4ekZX5wnJsO0Uaufhl4xqNg6r
 pTtciLo3sh/f8LxX0T79jPLZfXkZR7UuDdsW2P2XAuk48H6oj4BaiZ3MbV4mmtFaBzhq
 6mLIgdl1lTDVbZLKVPXB8+SnDxz7SIVMLf9w5wKIQ0niqcPMHf9RGlvZPQI/rN9E/X31
 LeNQ==
X-Gm-Message-State: AJIora9hB+xGwH9LoKVZT/1CX6u5MtNdMZYjJSJMuGGN5OIN82QsCxPY
 fbdEMoMvk2G7a+PT3/0Bf7I=
X-Google-Smtp-Source: AGRyM1uPdYgo1Db55gBMu5KywHcniCVhxiTm+2oOcj5N6zIZgvZwV4g6M2XKTZ3eR3X1ICiY9iXSOg==
X-Received: by 2002:a05:6638:50:b0:33f:17b9:be63 with SMTP id
 a16-20020a056638005000b0033f17b9be63mr14476634jap.92.1658126278578; 
 Sun, 17 Jul 2022 23:37:58 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:37:58 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 01/41] dyndbg: fix static_branch manipulation
Date: Mon, 18 Jul 2022 00:35:45 -0600
Message-Id: <20220718063641.9179-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 vincent.whitchurch@axis.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
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

This is Vincents test-case, reduced.  It needs the 2nd flag to
demonstrate the bug, but it's explanatory here.

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
Acked-by: Jason Baron <jbaron@akamai.com>
---
.drop @stable, no exposed bug.
.add jbaron ack
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
2.36.1

