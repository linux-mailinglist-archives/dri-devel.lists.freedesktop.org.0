Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675440CAB1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963686E9A1;
	Wed, 15 Sep 2021 16:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B5F6E989;
 Wed, 15 Sep 2021 16:40:36 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id a15so4272606iot.2;
 Wed, 15 Sep 2021 09:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/16IPATfLgdmiX/J8L+UemcIsELjpW//BCTY5UOTDZc=;
 b=F4lYbdy1XsW0VGz/Rzh+Aj72ATUvnLbalD6Ptxz76xKFknccKr4/wNjNNRxA3f+rOO
 cAhMSwo4XDdnHamdzMuLRquJ1avmiwtnTl55cs8KGZY/swZQDWzGHa6rRlvBdAcpjlXf
 XCTpPYWxBvGK0pq9hFa6/TFkehZJ2DMble4ADj5SNb9YE4pVsN9XG3KDDlmp1wSlZM/j
 VZ6qfhPUzGjNacIUClrpXGhFIfwsDaWu9KcP+CoxSEH+bXnFwf3YrbETpDHh0fmpCNQR
 1guofFqzln+fFtLDfrs/2gq9fwfOlsst+Ka0U+X5CcDx82LeMKryhPO7j3x8Kc+p9VB1
 20ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/16IPATfLgdmiX/J8L+UemcIsELjpW//BCTY5UOTDZc=;
 b=ZdlQWfNmR39U8dvAFr68fjI7/v9imXyWTWc4AERIBVcIB2Y+sGc36SV7VLLfHb/so1
 tXyCR1Nm9VBp07Zx0YakfrMBub/lSJ8qzwUxrHYBIQOCt68GAr9VRtfv4ZRdjYCX2ihc
 tRLzQeQm2pncu801l0S/t2XeGwnu+YwrXgous0pOpYuh0vZt5DwEtE9/79UMDJACpVSF
 e6apjDiMzM67SYsgeK1b7QuU3zr/Z9/zlqcxZmPjlbCZiwRydMcGKqfC9gM/NB7Ft3id
 RTx8qip6zY4NNbOIt8t2NWeVY9sHrAdivekHYbrq1KQF1hDkSBj3EwNVL0ljg+fy8Fp1
 1+GQ==
X-Gm-Message-State: AOAM532yK9K0I2mB9PzhriwYaUFyMfDSVmNXSFxLqxzd/biS8aTsYH0l
 J3Y9KyLbqegsWZHqK33/PG5ySoBTHP8=
X-Google-Smtp-Source: ABdhPJzarxX1asWC2Hsxhbo5NFnL6GctWrBgWA+45Dvv3G1LUT0QkB+r4NenYOzwUgzCOEmqwSXLsg==
X-Received: by 2002:a5d:935a:: with SMTP id i26mr767362ioo.79.1631724035933;
 Wed, 15 Sep 2021 09:40:35 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 06/16] dyndbg: no vpr-info on empty queries
Date: Wed, 15 Sep 2021 10:39:47 -0600
Message-Id: <20210915163957.2949166-7-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

when `echo $cmd > control` contains multiple queries, extra query
separators (;\n) can parse as empty statements.  This is normal, and
pr-info on empty command is just noise.  Also change varname.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index abc04bf4f765..356c8231175f 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -520,9 +520,9 @@ static int ddebug_exec_query(char *query_string, const char *modname)
 static int ddebug_exec_queries(char *query, const char *modname)
 {
 	char *split;
-	int i, errs = 0, exitcode = 0, rc, nfound = 0;
+	int qct, errs = 0, exitcode = 0, rc, nfound = 0;
 
-	for (i = 0; query; query = split) {
+	for (qct = 0; query; query = split) {
 		split = strpbrk(query, ";\n");
 		if (split)
 			*split++ = '\0';
@@ -531,7 +531,7 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		if (!query || !*query || *query == '#')
 			continue;
 
-		v2pr_info("query %d: <%s> mod:<%s>\n", i, query, modname ?: "*");
+		v2pr_info("query %d: <%s> mod:<%s>\n", qct, query, modname ?: "*");
 
 		rc = ddebug_exec_query(query, modname);
 		if (rc < 0) {
@@ -540,10 +540,11 @@ static int ddebug_exec_queries(char *query, const char *modname)
 		} else {
 			nfound += rc;
 		}
-		i++;
+		qct++;
 	}
-	v2pr_info("processed %d queries, with %d matches, %d errs\n",
-		 i, nfound, errs);
+	if (qct)
+		v2pr_info("processed %d queries, with %d matches, %d errs\n",
+			  qct, nfound, errs);
 
 	if (exitcode)
 		return exitcode;
-- 
2.31.1

