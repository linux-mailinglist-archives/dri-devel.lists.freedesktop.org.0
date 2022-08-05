Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF74758B1AA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EA99B7C0;
	Fri,  5 Aug 2022 21:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1364112A6BA;
 Fri,  5 Aug 2022 21:54:27 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id q124so2869707iod.3;
 Fri, 05 Aug 2022 14:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=8oKEUq0EPzmllL1JKxsnzcEjeLeYCN2EOuzsBk4Lakg=;
 b=Z7Y4gNIuk1bd9NXInzS3xECyNbs5yvKfMdNd5uDzQIsLhCynYm5Ml3+Sjl1BQce/pZ
 whGmKTeAEsMdzkvbdlOjpR5DZryQKK4T8BqruPO+aM6DxWQmY9nH3xMnR5StQzeyTz/M
 PUKTD3o/51KTbaw1xEXio290b6Zi3mtfpvQtfvwPntT7s9hixz1XTbbvf1jkmjD2fSLS
 Na3MZDoiawvqnfr1m8sQVoTnzdn7abqs/LnQ1K5BVaF94OQgZi/IJcF6A/YJ6xp7oEVm
 qhfOV8ABrOupE32VP9UD0HuGKXuDbgOdmQIcA9ZBwORPZ6VQP3FbpDBGPUnYdXZHJFc7
 nMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=8oKEUq0EPzmllL1JKxsnzcEjeLeYCN2EOuzsBk4Lakg=;
 b=6XoIWe6gYYZ5EpadCMLbBZquT6Dj9FAEDRF8srgJDUXpK5ie4HIkwqGdhNC/V9AxTC
 GFtGSaEKOBJdQnf+zuxtQrSjcQh/UaScKxAIhMIzaOtjQZBjH9Ff+LaeoypgB27A+JCU
 fiPl8bcul9wHngDxL07YvpS/4AVX4uIFFSNw5kE0Rb+qrZOpfvPJcqaDJYSkpVmS5sE4
 eJMYYnkSVkPs3EPIQ/TGqXYL88qMJlIIERZ6VvaSIbfHwu7fGqxEmKXaUmdNi9mro30K
 yBVUsZvCLaZGlPUq68xVeTDATmZm/QJp1Stv9m6BRlGaieLxW12jBx2Mdrup2qHCoQk1
 9MCg==
X-Gm-Message-State: ACgBeo1I/zOjDrdAh4hmENC0O7kwl2P0VFXIv2LUpomwELQ5+tjdJGkT
 i2AyssGH67zvkK7ZVMEk+0Y=
X-Google-Smtp-Source: AA6agR7UeYnK8xvl0wwhLHfYV68Yb0uAXZRnCcFJ+O9Xr14Frnao6jEA5Wnu7EbuD1TO+KC8WXNI1w==
X-Received: by 2002:a05:6638:22cd:b0:341:6180:c86f with SMTP id
 j13-20020a05663822cd00b003416180c86fmr3991488jat.57.1659736466315; 
 Fri, 05 Aug 2022 14:54:26 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 05/33] dyndbg: reverse module.callsite walk in cat control
Date: Fri,  5 Aug 2022 15:53:27 -0600
Message-Id: <20220805215355.3509287-6-jim.cromie@gmail.com>
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

Walk the module's vector of callsites backwards; ie N..0.  This
"corrects" the backwards appearance of a module's prdbg vector when
walked 0..N.  I think this is due to linker mechanics, which I'm
inclined to treat as immutable, and the order is fixable in display.

No functional changes.

Combined with previous commit, which reversed tables-list, we get:

  :#> head -n7 /proc/dynamic_debug/control
  # filename:lineno [module]function flags format
  init/main.c:1179 [main]initcall_blacklist =_ "blacklisting initcall %s\012"
  init/main.c:1218 [main]initcall_blacklisted =_ "initcall %s blacklisted\012"
  init/main.c:1424 [main]run_init_process =_ "  with arguments:\012"
  init/main.c:1426 [main]run_init_process =_ "    %s\012"
  init/main.c:1427 [main]run_init_process =_ "  with environment:\012"
  init/main.c:1429 [main]run_init_process =_ "    %s\012"

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Acked-by: Jason Baron <jbaron@akamai.com>
---
 lib/dynamic_debug.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7fb99492c16f..8ff11977b8bd 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -59,7 +59,7 @@ struct ddebug_query {
 
 struct ddebug_iter {
 	struct ddebug_table *table;
-	unsigned int idx;
+	int idx;
 };
 
 struct flag_settings {
@@ -805,13 +805,12 @@ static struct _ddebug *ddebug_iter_first(struct ddebug_iter *iter)
 {
 	if (list_empty(&ddebug_tables)) {
 		iter->table = NULL;
-		iter->idx = 0;
 		return NULL;
 	}
 	iter->table = list_entry(ddebug_tables.next,
 				 struct ddebug_table, link);
-	iter->idx = 0;
-	return &iter->table->ddebugs[iter->idx];
+	iter->idx = iter->table->num_ddebugs;
+	return &iter->table->ddebugs[--iter->idx];
 }
 
 /*
@@ -824,15 +823,16 @@ static struct _ddebug *ddebug_iter_next(struct ddebug_iter *iter)
 {
 	if (iter->table == NULL)
 		return NULL;
-	if (++iter->idx == iter->table->num_ddebugs) {
+	if (--iter->idx < 0) {
 		/* iterate to next table */
-		iter->idx = 0;
 		if (list_is_last(&iter->table->link, &ddebug_tables)) {
 			iter->table = NULL;
 			return NULL;
 		}
 		iter->table = list_entry(iter->table->link.next,
 					 struct ddebug_table, link);
+		iter->idx = iter->table->num_ddebugs;
+		--iter->idx;
 	}
 	return &iter->table->ddebugs[iter->idx];
 }
-- 
2.37.1

