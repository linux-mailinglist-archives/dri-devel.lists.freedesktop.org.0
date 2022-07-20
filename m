Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F106D57B9C8
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 17:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD148D7D9;
	Wed, 20 Jul 2022 15:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC2EC8E528;
 Wed, 20 Jul 2022 15:32:53 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id c16so8207717ils.7;
 Wed, 20 Jul 2022 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cXOS454We3xvQC3yPmBTyPjVfKFZCejZgeG5/lQTXdI=;
 b=ekRplxKPr9YMoEYmRApNweeeIhQcC5MrlQVJ+KUu9kXfgcRGQkNO0g3NQRHfWMXlQ3
 wpWrdRez9eh4/cXJNFXY0fLta1afilrRPohGqDkDJNNibrMHIdFBdhRW2b2lPXBWduRU
 Cg7/TxQRM/1tFV1xzXgd0EITsQkfMO3u/zfu/d6QV2KjrN1agnD6xPVxlznTyMb4YMjm
 nk+z/64bL3hmEjCBgarh/O4D/KLsyHDi8fAawl4KXog/86G43/kLwPMM3L/f2xM1pJhk
 atj4QcSWG7P6+q1de9YI2jPPXf0arqmBdotDiOYtWEiMLKBMjkcZ9RZy9JsUHuC37Xca
 TwTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cXOS454We3xvQC3yPmBTyPjVfKFZCejZgeG5/lQTXdI=;
 b=XbZNoQyN5dnY4L6+U1lLa0HfMYjc+3PLGqXYnkywMi7Wl7VjA416rkTjft2KlsVBoi
 m8KDdgQr/GL0DkPpPNrbUE00uu2kw0EpNODWOzQDJga3ILRgJUqUcxcyJhOxw6p+HO9c
 IpPp2yeGPcIH5sJzMqB47eq0eF/cdDBTuEuQclLkRUpDVfK4a9Ra4jxr4rnqcsk4kX9f
 O91zxgv8E66goa40MkvmTC3ADu6AO3IWSJdIwhlm9nS4aSM/U6UGDtABW9PZ9mkn00k6
 CfzU97/+csOgRBe+ait5K943PBdfX3vdnoVZIA0tFC81r+hg7fFQB+UKhwb248ZzQHY/
 RMNw==
X-Gm-Message-State: AJIora9ngnaZ3RR61NseNIc5WiIAzpM1NjAIvzhAgMeu348kKd0YrldS
 u6EAMTopiyg6r+X+3hJFfds4RMXq4J78Lw==
X-Google-Smtp-Source: AGRyM1tzmv8Ho8cjvNe9dpzvMOP92hZhwFSd86MmMHSUnRMbDcPpjIz/D7jRxfbzpFF+iNmQt5PqPg==
X-Received: by 2002:a05:6e02:1bcb:b0:2dc:ec0e:9e7 with SMTP id
 x11-20020a056e021bcb00b002dcec0e09e7mr7731678ilv.213.1658331172773; 
 Wed, 20 Jul 2022 08:32:52 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020a92d401000000b002dcdb4bbe87sm4579581ilm.22.2022.07.20.08.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 08:32:52 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jbaron@akamai.com, gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 seanpaul@chromium.org, robdclark@gmail.com
Subject: [PATCH v4 01/41] dyndbg: fix static_branch manipulation
Date: Wed, 20 Jul 2022 09:31:53 -0600
Message-Id: <20220720153233.144129-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720153233.144129-1-jim.cromie@gmail.com>
References: <20220720153233.144129-1-jim.cromie@gmail.com>
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
Cc: vincent.whitchurch@axis.com
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

