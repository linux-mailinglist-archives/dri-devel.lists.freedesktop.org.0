Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23375AC6DD
	for <lists+dri-devel@lfdr.de>; Sun,  4 Sep 2022 23:44:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB4010E23D;
	Sun,  4 Sep 2022 21:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56D710E134;
 Sun,  4 Sep 2022 21:42:13 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id c4so5673061iof.3;
 Sun, 04 Sep 2022 14:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=PbqFdyxSi0Pp6DU3HKsSvwhQJYj8Q2VNhxZwCrpnF6M=;
 b=VsDvR0vs9q2FKCQfOJtjIj8FHz9/Z3bqLVP6coIdC18//1aR2LaIbaZwWf9Z6tEGfl
 5LATbVVqKiBlBcSVvzROupFX7UszhsGWDUy+bmPT1qGZcI1Zqa5qU39Qb2kqg4sRO0kw
 fgQxDQpiLWZ85LuT4smVr3O+O5zuSTuXZnwG3Rv/A16MfL6bVIcM4HNldOSP2KESU/gT
 V20+cxV8kGInvZOnWna6gEYV1K+GBUIItJpcmPhCpXQ4cyszHg26A0WRN3M3WtAN/wBm
 medsQTQakd/d2p87LqtCTlPg3npIOQkOQZQTqCeT1ibwK4SGN1YC/clvc4rCKuFX7YAD
 0pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=PbqFdyxSi0Pp6DU3HKsSvwhQJYj8Q2VNhxZwCrpnF6M=;
 b=HY40IgpXerJiE61XL2fafyrwIwJWYmmPJOcG+1SFuYYJ7lH5wf4HpRIiy4peQBqWJN
 4d/K13pOs21qaIqr3YPiQXFTZFkVCNE+yWVEDPevaGkGn8m2QqXNc4ZO2oUpXS1IxANh
 Dww1j/8aQkGqjCPdZWyFbKdpL0H5y6dDGy/l1Vw67FdCB5FCIgqUSG7zSB7WEx0IkQSL
 AbM+cUCUsqoBhbe9KTLOcyWHtnxEApQUYtOsAOW9O38/YAT+qxA8VuloRTVikHwVFz5u
 VY5o3CN/xODOI6DXaYRG5DzAqlEv4PGtGI9jGxa/gmszDB2CdOXje/1qBau9RZxUjtPt
 Sotg==
X-Gm-Message-State: ACgBeo0atqoXRP7cND5q6ZxogqgXDjnbXsRzQtzPajkkGHJheIHigEJG
 f3Javx6UoBF6QJy7192G6OM=
X-Google-Smtp-Source: AA6agR7fSTOVCWKQ249DqThxtdMK6mWi8uoaxMmg3jSWwtFYYJA/nulJNENKG3FHhy/TNLExju0ubQ==
X-Received: by 2002:a05:6638:3385:b0:339:ea59:a31f with SMTP id
 h5-20020a056638338500b00339ea59a31fmr23089435jav.55.1662327732789; 
 Sun, 04 Sep 2022 14:42:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b006889ea7be7bsm3727688iov.29.2022.09.04.14.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Sep 2022 14:42:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/57] dyndbg: show both old and new in change-info
Date: Sun,  4 Sep 2022 15:40:40 -0600
Message-Id: <20220904214134.408619-4-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

print "old => new" flag values to the info("change") message.

no functional change.

Acked-by: Jason Baron <jbaron@akamai.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a56c1286ffa4..8faf584f2f4b 100644
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
+			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
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
2.37.2

