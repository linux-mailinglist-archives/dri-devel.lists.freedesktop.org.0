Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7B85AC6C0
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:43:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E8510E13B;
	Sun,  4 Sep 2022 21:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4611210E010;
 Sun,  4 Sep 2022 21:42:07 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id e195so5690239iof.1;
 Sun, 04 Sep 2022 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=wU3a+NtnQXjoNN7rXOqrGTxjDahMgVmGQsWn0PV1P8M=;
 b=oqkgy1Lfx8/69RwJIe3zmzWJ5fKHCCfMExZbNN1eCUrtrvQvfE+1n1ok/9I/8qxcYJ
 V2Y5ovP3OXd3K2CAgS1BbVBtTfJUEdG+6tO5gfR37M2/5p6wJ7VN6X0nrZdJxzrfPg/O
 GkZXIIfX5vDFQr6/LJp0ofI0n6FCf/1AN3tsFeNZ25fi7xHd9VYOST2OyHqYWaGYzSlw
 QAv9HoibN19LRrRCQG9pGNe24p8W2DNmEf8nLDndfGLmEJnHDeMsDoQW6Zdu2pC0wkcY
 XlK7itax1DrgPu8UOaURRS4O0KdAKHHKQZ5pij8wgvGjblMAY0dpNFeQ9Bgy/4Pt7tCN
 CpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=wU3a+NtnQXjoNN7rXOqrGTxjDahMgVmGQsWn0PV1P8M=;
 b=qIjPKNmMiM1efCvMSoPENmlmUlyL/GU9xShsysq8mRtwfhcjn0ctD/oe/ysmQ7+NOu
 Os0yCeXjjTCQjcACPiKoLGsX5rtEpovFdPwqUDEjPdT7j1dM3pNTm7KtC2B4fEWbg2Df
 Ou1yzC97kH8YtpSxFQJ8hCz/y+v67VcF8+gbmjP1K9otxafKi4A6EBAyvHpM9y6K/wyE
 kV9Cpi10sko7d5O7SS+5EXK48067i4AUt8e5+k9pCp50a56G4YfUdhQqVZRZ8eYp+CF0
 LOxwDAl+OSyBwQlDB4NsO9bobxKSy7CZBRwliIqmObwjBgTqhvjsUA/BFnZ7eo1wUaP9
 yExQ==
X-Gm-Message-State: ACgBeo2gkjQEWpGNaa0ZO22xZPONhLBecJ5PVWp9RwdutKso2bj/ZWXm
 dRq5/5hXerTicru6AjE187Q=
X-Google-Smtp-Source: AA6agR6woh73WD6o0519OJbQFrJQIwWPKVm7AZf+Fo8tuX8h74mdDupZVosU1fX68Rvv18her7b2lQ==
X-Received: by 2002:a05:6638:25ca:b0:351:1a2a:763d with SMTP id
 u10-20020a05663825ca00b003511a2a763dmr3305728jat.251.1662327726407; 
 Sun, 04 Sep 2022 14:42:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/57] dyndbg: fix static_branch manipulation
Date: Sun,  4 Sep 2022 15:40:38 -0600
Message-Id: <20220904214134.408619-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220904214134.408619-1-jim.cromie@gmail.com>
References: <20220904214134.408619-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, vincent.whitchurch@axis.com,
 linux@rasmusvillemoes.dk, seanpaul@chromium.org, joe@perches.com
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
Acked-by: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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
2.37.2

