Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015A7C6B91E
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 21:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F079310E52C;
	Tue, 18 Nov 2025 20:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FMnk0MOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630A010E52B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 20:19:28 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-94822ad1baeso390563539f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 12:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763497167; x=1764101967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkJdwdOvuZtYon9oCXsSDFPk0lzlRWF/tYh6X0VG6iw=;
 b=FMnk0MOP6qjhPmdQXiMcT40iISrHhSpqSyMU7AJkxTCRGt0pZVnXlgCdqPY0p3QzQx
 6H3A/r5DxsAMaKZPUleXZGNZL2cAmAWIBdMrTIAvNkhVmEjdZ/DmRKi6g9M6pFlxWcfk
 2BlzjmuUwbqnuliWV5S8oqwOJSemdUYMbOY7kC4UopEdusJhGdcQq8PCGuQ0V3KIaL7w
 qmAHMFi8lp6E845VaeAwrFDiBnEZ1kXTl0CSgWSLPL66Aj/PN+D2En9/Ur1tzLWeWck8
 BrflNQBJb4fDpWdhup2UV48lSHsXbzLV9KD7MJCC3YXACP8/ofU2CBCPsc6DyZTHNPqG
 oQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763497167; x=1764101967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AkJdwdOvuZtYon9oCXsSDFPk0lzlRWF/tYh6X0VG6iw=;
 b=C9K+bYuzxgvhecdge8QafgdcojfiuX2B1w7yLOUJG5p0O1YC86B1icqD5zoDP0s+0Z
 6HfhLqG2TQSjhuedhJlbBFzO8HUfPg70gGQRNsMKWPu62aM4+DOa26I29yZE+CL4w8JI
 XPt16alc6dXnc/OTz/hbHdg02UsD0KqtAwaNke99DdFBZm94TN/YFNAMhatBuMqB3z2o
 Q9Zd3X7xPHjWxFQinnuzQcf9Rkd+gaYjRIxmt+rviv9TA1N+D2adVDaLOeIADePJ/xIp
 46hoKjxtCCohsBhqhq1SVN4Rc/NnMvCnuKrelrEPsw9fnXE3Fl4iEeMseFXaCBIL9bmx
 Xjrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqvxqHu97n9Acc5a6TdLfE1QqLFWHXUqXv5c8Jxn4jhHvOo29TcR6eGvmj1TQgpVSLFxvGdCQAWdQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNtjuyDRvZ8j2szsu7gugjdARTOyRN1ziHE/vdkpLONh8TshbS
 2T7j5Gw4fJEGPhSzHXr8GwfYiLGt+z50GDfDr64EMhDqsrDFSbJFb6r/
X-Gm-Gg: ASbGncsUGVeaLdndPZ0W9H410lEd4iGOyhS6JgkrAjsls6Nw0to/yyRyMDj04gb3dF6
 s1+Bxl36RAHF16c5Ruj4jl90uf6uNSMPoJ8cXvU9GAD0jYtDkkzxPjlw9U/lUrsqIZHTbwPf+5K
 mVIV4U80pyD5bTpEpuzqv64qmgKJGTCUmQ78rs8lnAv7SmHp1ddkQtqHFvRwXfotTvI3gfJLi1G
 AW8FXGQkqG71AhdCv532CSrjh/c8e6jqp+QJFgW26iHXFssJuH5sTWPAL7DB8YiNZMQg+4sCZ0A
 uSb/5tn7V0XRlUrfimMvHnUsVfaKo8Wr5+58+xjBbp9J4lxV70GOwXDfApIlHAHngI9R9cYvfj+
 +MHxDdbH8Ghu6AYMapuKfQdNvPAk0g2aZ1FJACSqO+FKUfe5wn98+Wn/958NAKOlF7kLOH9gAHf
 NVjYYOjp7tuDnbWpC1Vsa9Vh3Rm8EOV/YDH8bXnDGBcC8x2O7DNPve3u8/RpKXJYdEbfxd7ZfAv
 a5nTw==
X-Google-Smtp-Source: AGHT+IFZpGWUD4HzzmtOBoMpGi8hZWUuQiKNNXIL4zMB3fc5Gey6Cuo0En2AnLuow8yyRJnTGJ95fw==
X-Received: by 2002:a05:6602:3405:b0:949:dec:b914 with SMTP id
 ca18e2360f4ac-9490decba4cmr766766739f.10.1763497167604; 
 Tue, 18 Nov 2025 12:19:27 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net
 (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 12:19:26 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jbaron@akamai.com
Cc: ukaszb@chromium.org, louis.chauvet@bootlin.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v6 24/31] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Tue, 18 Nov 2025 13:18:34 -0700
Message-ID: <20251118201842.1447666-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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

echo 1000 > /sys/module/test_dynamic_debug/parameters/do_prints

This allows its use as a scriptable load generator, to generate
dynamic-prefix-emits for flag combinations vs undecorated messages.
This will make it easy to assess the cost of the prefixing.

Reading the ./do_prints node also prints messages (once) to the-log.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index b2bdfdfb6ba1..fa81177e8089 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,25 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+static void do_prints(unsigned int); /* device under test */
 static int param_set_do_prints(const char *instr, const struct kernel_param *kp)
 {
-	do_prints();
+	int rc;
+	unsigned int ct;
+
+	rc = kstrtouint(instr, 0, &ct);
+	if (rc) {
+		pr_err("expecting numeric input, using 1 instead\n");
+		ct = 1;
+	}
+	do_prints(ct);
 	return 0;
 }
 static int param_get_do_prints(char *buffer, const struct kernel_param *kp)
 {
-	do_prints();
-	return scnprintf(buffer, PAGE_SIZE, "did do_prints\n");
+	do_prints(1);
+	return scnprintf(buffer, PAGE_SIZE, "did 1 do_prints\n");
 }
 static const struct kernel_param_ops param_ops_do_prints = {
 	.set = param_set_do_prints,
@@ -191,17 +198,20 @@ static void do_levels(void)
 	prdbg(V7);
 }
 
-static void do_prints(void)
+static void do_prints(unsigned int ct)
 {
-	pr_debug("do_prints:\n");
-	do_cats();
-	do_levels();
+	/* maybe clamp this */
+	pr_debug("do-prints %d times:\n", ct);
+	for (; ct; ct--) {
+		do_cats();
+		do_levels();
+	}
 }
 
 static int __init test_dynamic_debug_init(void)
 {
 	pr_debug("init start\n");
-	do_prints();
+	do_prints(1);
 	pr_debug("init done\n");
 	return 0;
 }
-- 
2.51.1

