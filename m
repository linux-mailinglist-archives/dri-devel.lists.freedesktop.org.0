Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A55095293EE
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE1410E72F;
	Mon, 16 May 2022 22:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1627610E6CE;
 Mon, 16 May 2022 22:56:57 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id 3so11549376ily.2;
 Mon, 16 May 2022 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cpRV3Wk55836kFETyr3P+oiMpdiGkRAymJ30pnxlc/A=;
 b=QWDky+6aYSWTOwbaXHfQ0qh88ZnwyW0nlRYt7AFIGi+pr/O7HtcDIZJoUwY2uQliu9
 5DAnS8pAk7ltR19hsFx8xD11J2e9C34b2EjKu7G6GZifsv++3x/PCoYhmSfc/jI82CXO
 JUEUoEtDBZ7pN9W2qjVFdRQisajSDDRF9gBcGxncCVHpLUX9MVMMQrf7oBR96vEAgw3v
 G1Vvu/OQQjiiWdQZCJFaUgvE5rJQOlDtXzKaHx5ANWL3e16JKqk/EXa4Id3glwwNsY4o
 WuevVJX9Rtx87k0vFCNdiF7BW2MjYUmONfgUNWzT6G14Gl158geu3MfQqxnhhv8rS5mn
 OMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cpRV3Wk55836kFETyr3P+oiMpdiGkRAymJ30pnxlc/A=;
 b=GHNL8TSaBpAH5GA7+Rmk6HXN/Boxj9cjh+3vjoLPaXEQfb/148H64Rwq1JJqkCaWJ3
 iEz7DNWzU6F6n06xcOrYMJAgAwz6s4f7+F9QOss/ZCZ0yNm0AlzPZWHsmgVojKp1vJ9y
 ZurTnTLpo+viiVrJXBk7IdnMcap6Sqhz/IyJJ1RjPVvZ6b6SyV/s2O0RoHvrjk/OcP1Q
 8cEvSGKwhKaGwfL6+3lpnKoN4vna0mqfV/VKn9F/kCr1uZGSyHT5OHCycyQgh+T+hQA8
 n21/gD030qmjX8Rbmc5xdOUUdLDArWWLyiAOyWQ0pYhZ9bjPdKI4ESm2UJtNSqmBKNwS
 H1RQ==
X-Gm-Message-State: AOAM532EiUUf9X+8TFCtC8cwMLcdqXPkvIw5rdO2i5/BPuOB3RnDF0+U
 IqFP6nn6FJ9q93A20CTLggWW+IsO+Hs=
X-Google-Smtp-Source: ABdhPJxZQnf4PMb/pE6aahB0jrFIkVLr5qLnxheVKq6wugGMIzNly4UwftUMV/XycUHdiBmfQ/0yIQ==
X-Received: by 2002:a05:6e02:190c:b0:2cf:31b2:b0f7 with SMTP id
 w12-20020a056e02190c00b002cf31b2b0f7mr10351042ilu.46.1652741816349; 
 Mon, 16 May 2022 15:56:56 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:56:55 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/27] dyndbg: fix static_branch manipulation
Date: Mon, 16 May 2022 16:56:14 -0600
Message-Id: <20220516225640.3102269-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516225640.3102269-1-jim.cromie@gmail.com>
References: <20220516225640.3102269-1-jim.cromie@gmail.com>
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
Cc: maz@kernel.org, quic_saipraka@quicinc.com, catalin.marinas@arm.com,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
 vincent.whitchurch@axis.com, rostedt@goodmis.org, mingo@redhat.com,
 mathieu.desnoyers@efficios.com, quic_psodagud@quicinc.com,
 daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 Jason Baron <jbaaron@akamai.com>, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
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
Acked-by: Jason Baron <jbaaron@akamai.com>
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
2.35.3

