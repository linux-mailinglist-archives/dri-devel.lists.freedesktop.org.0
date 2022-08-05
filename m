Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B858B190
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099F212AA00;
	Fri,  5 Aug 2022 21:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C029BDD3;
 Fri,  5 Aug 2022 21:54:11 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id i84so2858392ioa.6;
 Fri, 05 Aug 2022 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8o46kS926x+QNuy5c4uBrvlsDlM/ABLoibmgwB6shD8=;
 b=lCM46axrhDjSPX2DcnzhMibG89Bub0Ejuetk3i4ZBIR4SKCTxg15/vbM+20ToloihC
 5jJiPEBFpAYYsXVKLemc1F/6Fml/cnNqToitEQ7LP7jGmZGwrFUe80YvURLB4CE8UFmL
 0T6/KfGyyq2L+pxXcJk/NFZVoOy4bAeINZaSVm+k6eQyztxe6FxW6QSllYUcNAHv8hoU
 O9yQgZtxinxHzbgXYMwmvu/KTIro5W39ChI58qjUIfAeJtBrt69zS23Cb+HdPV1ZWhnc
 JaZbhuEPr4rm39f9bibgDkng3eX1JX7n13q9Zu9wfECZ4hf7vy6yT71yq+UNFpTwV50w
 JpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8o46kS926x+QNuy5c4uBrvlsDlM/ABLoibmgwB6shD8=;
 b=fdl82cfbeNiNhKlsxjKwqOZsETIjGLyivvT0f9BNyau/HPvr7G4CLYj84N9vOUM8Iu
 /G5DXNYRBsb2JnSmQ9shGNf6+Wp6CauxnkbkrdVuL7SfRGpYY5/ctW1OG/bpKpcKQl4A
 mukrXf26RpZu36pLRC6MYWb6YwlgFRLDjJvTr2sYjKCKlPB9ZVXbUtw6Db1jG9yA6dp+
 xHhAGMxF+LeaFiX7UKrSv5ryYjkPnnAXwLfvzrot6bcYiGtJQtZbhvNWpM0kwN38mfZd
 CzCawn/sonpRIk/O2NxduD17MPHHYwq1UPMrppFpk77Qg8qjsjuSDsyKgvPP1GAGXtPb
 N0hQ==
X-Gm-Message-State: ACgBeo2qvAW1tsx11n49zfGTO4x26Eh+eKCsrRjAzPrR1W/1kDgFzQIH
 CjzsJE+DPAEv9DsQKAgs5zI=
X-Google-Smtp-Source: AA6agR6i3ziM+LCX9b0EWHuhKQUsORqHbRROxpskVgxuS7LNqXf+MhlHawIxN9ifY+85v7VA3rL23g==
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id
 h7-20020a056638338700b0033c9f9e5a17mr3896561jav.12.1659736450608; 
 Fri, 05 Aug 2022 14:54:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:10 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 01/33] dyndbg: fix static_branch manipulation
Date: Fri,  5 Aug 2022 15:53:23 -0600
Message-Id: <20220805215355.3509287-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, vincent.whitchurch@axis.com, seanpaul@chromium.org
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
2.37.1

