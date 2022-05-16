Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EA55293F2
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 00:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6262B10E6E4;
	Mon, 16 May 2022 22:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5E310E8FC;
 Mon, 16 May 2022 22:57:01 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id b11so7612973ilr.4;
 Mon, 16 May 2022 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0q2zph1ZCXFs7WKRxPFWrSWi15W02opZe3T7QJQ5ap4=;
 b=D+2Nl0pQxEGTDTo5NEF/KAytSKaLe4sJXJOvqpnRcVc/IZnyy0W1wMyiITHglFfU+S
 pmgMHonBN1r0D+h6EVslkidi/tGcgNxCrfkplfoHiLHtENqxSaHXpEOV0hmlGsFAL1gy
 WMxhbfMRHDPmJQ/ima0D6KrMxyMEU/NPxcGgdV7u6BIi/1NfRuMaCWvgJ8b98Hsi8aaP
 1/xNeEJKp2IotfVLQl30vHtClfiO0oBvomhf8Ch3ixkoss6Uu0JBJpVSpnl0gqlMhNEp
 cIX+I7Q981LaG/iyCIs3c9iLX+tz40fiurace8CRPhis2aLMQuPPHB3Us22EtfY/w7TJ
 OiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0q2zph1ZCXFs7WKRxPFWrSWi15W02opZe3T7QJQ5ap4=;
 b=22gZVdCSMx2/B8NA7AqBdTbYCh0Ei55OO9tsRbNlxfsPYyqprztVBQBwylksQMkKt/
 kmHzRyUSASfNcyIS12SGSZHp894UfmL1rfJ8ugJvIYXD2mQfxXyrbhmJnsXN6jCHtD/H
 sNQbReHdl6kYFcSm8irhMSVLcjZVrXPfcCFmJ8GawWDGg8wSr6ls7R6vGSUCsG/3UjJg
 eZKqZY7UqHi1rEgqKmx/0F2R7XMeYQbXNHm7C1EMoc00/FajQOO6n285PfEyFcwUvdI3
 8bcBTZfeX/C06z60NxjEzJjo9FOQ59zc56f9YcvocQH3q43wL7GCrglDxZPPtUNET1hn
 Roow==
X-Gm-Message-State: AOAM533eZ3kwWoVx1eexN7KcDZC3qlLhIM7Y4sS+VztpGZ1sCbikNdh7
 YeTVWui29VOBSMSV/PKcXk8=
X-Google-Smtp-Source: ABdhPJxzuDtDs3r2+Nl0gh2+cAwejD1t+Ts8LpHwPq/tWghODbyudseUdSlIKZM7WeMOEenc8xf2qA==
X-Received: by 2002:a05:6e02:1a2f:b0:2d1:2399:dc36 with SMTP id
 g15-20020a056e021a2f00b002d12399dc36mr3231577ile.12.1652741820481; 
 Mon, 16 May 2022 15:57:00 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:2010::dd9f])
 by smtp.googlemail.com with ESMTPSA id
 k26-20020a02661a000000b0032b74686763sm3133949jac.76.2022.05.16.15.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 15:57:00 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 02/27] dyndbg: show both old and new in change-info
Date: Mon, 16 May 2022 16:56:15 -0600
Message-Id: <20220516225640.3102269-3-jim.cromie@gmail.com>
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
 rostedt@goodmis.org, mingo@redhat.com, mathieu.desnoyers@efficios.com,
 quic_psodagud@quicinc.com, daniel.vetter@ffwll.ch, seanpaul@chromium.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

print "old -> new" flag values in the info("change") message.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a56c1286ffa4..ca2a28f1d51c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -156,7 +156,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	struct ddebug_table *dt;
 	unsigned int newflags;
 	unsigned int nfound = 0;
-	struct flagsbuf fbuf;
+	struct flagsbuf fbuf, nbuf;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -217,11 +217,12 @@ static int ddebug_change(const struct ddebug_query *query,
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
2.35.3

