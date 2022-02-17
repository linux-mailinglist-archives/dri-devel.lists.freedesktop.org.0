Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD19D4B96F4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 04:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C2CB10E768;
	Thu, 17 Feb 2022 03:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C72310E74E;
 Thu, 17 Feb 2022 03:48:39 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h5so2215010ioj.3;
 Wed, 16 Feb 2022 19:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WgWVdTddSK1VIvJpihEOxrT4Mi3SIzAJw8C0VgfJ1+E=;
 b=PFLx2BNFItOcSBVBzOes2CcfuiOg9MZFNk4GMlp3FEWB8qTgBL5FbKnZoRAKYReNL/
 ReDNJ2jxVfhXYWmadIOhteBp5jp1Sev1vNmsZeyjXjVlSxi4P2CC/txIQX7x9no42fno
 35b9yd+0zjb90kjD0RTZWE4ze/Nt2mO0Dv2OBbNMV0VvkEHUdLIB1FJ8RryJH/Fwzuky
 RLM4b4LiDs6AJEA/W6MVIubgvSU1zPeT1bXXrH157OyjpS7EBS2G9qdbF4skflStaHXi
 nfMGkMcVbjqWYUHs2Td7/xiydiYvo50td+/vQ/lbFICW72LMNHR+7cwzpp61v9C8G6jN
 5c0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WgWVdTddSK1VIvJpihEOxrT4Mi3SIzAJw8C0VgfJ1+E=;
 b=TsEB5AWS/sQjbxn8TWNanJMxHTzHdJoINh7URuPpyIBSHyJNBBFnr3A3RoJBLlp95L
 BESvFiI4ZQKKVx8IHgmGLeMfaFVWlC4/6w6TL5g8BIziEIqdmoYowLVkHiNbt3wWtnhi
 D3SZwiYYEay1dkhNTBy2Ly/4gO4jJ6Y22djm5qndZ2gP+tFyQUEtSkHA13Hs06SFg0am
 pB5o3QL+qzVjjHWD4sK3ODHdo1cZ++0yzFiImhCW0rXgTZovkZedsjOrV1w8rRQ+V+La
 MohqXbXFtKPI3Ei5JAvIE2O4fOzYUuPif8ssE7c0nPwak95/hkDJX5gfzP6Ex/9LTpbo
 9AoA==
X-Gm-Message-State: AOAM5330d6wgbvdLqPdS1HTo0KgsSgDMNbJTcPjREKqHyHgN6VdwG6bM
 0HgiQ0tCpKvxlK0MgcP/t4mmeOg2nO4guw==
X-Google-Smtp-Source: ABdhPJw368F4fr7QiyGQIds6VCL1NhGqtcNQKtxpD3CT5e3gMbNyzA1gjwbx4VI1KL4OErxP7BRLbw==
X-Received: by 2002:a02:a808:0:b0:30e:e741:5457 with SMTP id
 f8-20020a02a808000000b0030ee7415457mr687157jaj.289.1645069718640; 
 Wed, 16 Feb 2022 19:48:38 -0800 (PST)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::1b19])
 by smtp.googlemail.com with ESMTPSA id l16sm1127874ilc.54.2022.02.16.19.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 19:48:38 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/13] dyndbg: fix static_branch manipulation
Date: Wed, 16 Feb 2022 20:48:17 -0700
Message-Id: <20220217034829.64395-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217034829.64395-1-jim.cromie@gmail.com>
References: <20220217034829.64395-1-jim.cromie@gmail.com>
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
 linux@rasmusvillemoes.dk, stable@vger.kernel.org, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In https://lore.kernel.org/lkml/20211209150910.GA23668@axis.com/

Vincent's patch commented on, and worked around, a bug toggling
static_branch's, when a 2nd PRINTK-ish flag was added.  The bug
results in a premature static_branch_disable when the 1st of 2 flags
was disabled.

The cited commit computed newflags, but then in the JUMP_LABEL block,
did not use that result, but used just one of the terms in it.  Using
newflags instead made the code work properly.

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
CC: stable@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
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

