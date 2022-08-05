Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0558458B18A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167212AC07;
	Fri,  5 Aug 2022 21:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838589BD7C;
 Fri,  5 Aug 2022 21:54:19 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id p10so1981497ile.5;
 Fri, 05 Aug 2022 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=66tB9GURiJGDaXzm2IfI1R+C6P9N6jM87DtEYp8w9s8=;
 b=dgd+LLVPNiPJaSKBVWtT4Zbrhte0+5f0xGVwua9lB+amp0r06ne081BVPeuysGQfVy
 B29SsUeBngUq34NP88kyqho6gSyjz34xlIC/USckZDng+OQZv8goMxRKQA03ABRzcBd0
 aAZ+CBBWePvCN3kUwH4EYfOSISYXjUPP8ZXfH0oPGfcMexyLS6Vxz16Fch/fYRc43CcD
 h6G6O8nkZbmHpzetqnntDg5Zib/pD4u+1z3iJ8z6TOATqewv5E6xnluDu/IaExNjLqWm
 0D3Jd0LJlJOcVmbDYGtHyerwGVhcxoMT874pS287WwzN3ne6cWGax4fucNDz+Iei8SEj
 /sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=66tB9GURiJGDaXzm2IfI1R+C6P9N6jM87DtEYp8w9s8=;
 b=ldwkmoe3q3XS/AADkSYZLoBsl4BzZC2wRbqBQepv1MJgpJMpCYIg5PTcD1Q9xGz8np
 6oFDjH8neynuwBCVM+C8hMnwSWHidhfcGz2jwruQn7uFa4n9J4CwP7LX4q41r8PL7D2J
 tcYL404lSYZ6BZgahh9HDjbJTXytJzJjPMpbxiHJ0B6JTH4GtjGypAIWo7ap4OMZpg8T
 33SdX3xa7ApPjaOXbpsh/wwtVRnKMQLhyAZWkScuyQGo7QdOYPTO4LJDm60k0zVZvbTA
 T7C+HNeQXDGau1KKAGpSErn6edl6YuypLVoZU3/Atte8D5OU2eg6AohPmIy7pq+OrydG
 nX3Q==
X-Gm-Message-State: ACgBeo1nz773oFUlmhMLyB1SAgZ76siIm2YZCDyek/aE1T37P8obHCG+
 3XZL5BNGnSDU82A3iY6FrxE=
X-Google-Smtp-Source: AA6agR5KFUx/S28wJBHf8esIf0A1i4foONGppbKZtYzDKa5yseZsXVQGDnoxzq0dnljYp9wy7F7U6A==
X-Received: by 2002:a92:d606:0:b0:2dc:e2d1:b75b with SMTP id
 w6-20020a92d606000000b002dce2d1b75bmr4023671ilm.91.1659736458782; 
 Fri, 05 Aug 2022 14:54:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 03/33] dyndbg: show both old and new in change-info
Date: Fri,  5 Aug 2022 15:53:25 -0600
Message-Id: <20220805215355.3509287-4-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

print "old => new" flag values to the info("change") message.

no functional change.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Acked-by: Jason Baron <jbaron@akamai.com>
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
2.37.1

