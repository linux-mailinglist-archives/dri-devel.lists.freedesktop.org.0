Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A99B4A1C16F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F7110EA74;
	Sat, 25 Jan 2025 06:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dIhXxPfq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824E10EA68;
 Sat, 25 Jan 2025 06:47:07 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3cfc8a2415fso5390895ab.2; 
 Fri, 24 Jan 2025 22:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787627; x=1738392427; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K2adNnpQ1ndgxlrGpzojCmuFvxvCimDSyhOgF+7GluQ=;
 b=dIhXxPfq9SfId/0EsJML29fuwypruhtceooWrs0AWT2rNqw79K2BKiotngjj0DtXMk
 DqRE0z93WUfx6gJ6x5m9ACwwJi+PJCS6C4mSucjCJO3X8HVZiwvZV7pZfMPgQjXGfJiw
 REO5LMRkDuvcLiY9PI4+kJ7N4a/OkZXbcfvX2cmU0UOKpSVWNfEmNhFeGXtbN3+S4ph5
 LpJkLX58zQNe2g5N9IqQYc2jECpPJfoq3Q7FBOMPJD7Br2/PNyTJcuKZi1l8kL8pQFbH
 ZWARY9E60ACbkVcvHdmYbCtuUZmV1ZJ84jeW/nkzj2eWynf1IdE15H7R50jDKej3gSwa
 lNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787627; x=1738392427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K2adNnpQ1ndgxlrGpzojCmuFvxvCimDSyhOgF+7GluQ=;
 b=B58lBGb1ECVd1yuNs2y3JMnXrYK5iyift3EZdibMYR4MoED7YDMRPWNOGz3Coo4TG9
 1YqY0EpoLH7rpRsNX8NEU7WLVctOzfC0IelDxJfy/GjngSnlKJmLoW+R+FMMGJ8uesOz
 adVXBtK/o6KjGbnPDlhZlRuvMCQam8MObO+IsxWKTQIALtA6/vSLxyd+DSfEVGZygf55
 dNB/FeyUI8GGraCrMYNjHpZ6RjvZQiTWTTK1x7QX89g0jS0Nd6ufDbFx/sABYeYYZdcO
 uqbGWLgwWGS26gnQiu6VZVclDJFxONNjgqDZTl1h9hzDjA5knAw0Cg+fW/eS5OBOold8
 fuig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrcEw8927A+5hk+X9Ar41zZnv6FHuk25BH9bXvGnFXv+gfgnzJixM6nJ3XlnwctZH7vDLZ9nBh/y0C@lists.freedesktop.org,
 AJvYcCVJQVV1kiAhB1LkNIwHGALnIUjympkOyC/yanAjD+4BI4uXe37WoPlnuIPvdgGTtzMJCv2seI9i@lists.freedesktop.org,
 AJvYcCVvQTdHWJIYMkG6O/DGSfHQMNMhs7RxvqUmS4g0XnY3z853TvPMxt3VSlX5fh8VVHzIUMGfDxz73eXI0T1+xQ==@lists.freedesktop.org,
 AJvYcCWT7aeH+PtLPpxZ3U30zMeywo83f9rJ5mafocUdSBTcotHACaEdKitEVpov5+lHQec1mFegNNNQGjF1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNqTw1ptjW6CgZnyRfOMdp2od7tE79iBArbqwmeXRh0SYbeTQK
 b0JaijZeXxKERNhvGpyH4DthUXkIGK784HQuLKzNDdy4Od0J8JWC
X-Gm-Gg: ASbGnctTWiAOK/pef5xxcarQQHaRFK+t7cfXnkYAh/nvHoona7VCE+18J2i4V8f1SoH
 fdQp4dJ2JB5Cr0VabOlttYkJqeYKs1F9xs7Qpse+PXMLDT4AG+7dUKobJglwFOcg3tBWb7RWDrV
 GU/QPhrpEInAi7axpVV9+bEcChrUkntTp4UZg+3f2MeWA8a63DrN71w58rVs/2KVB7UOxPGVSxX
 BuaZaQZjqau6LC0SN/4ulIKhLyN89ajy4alFeXVgwbsqDBL1mrJajUm8Scg/o4faC+Zj/9ayh05
 tK4zPmFym0PrUDiR03/Mik9x2AnRBZHKsciKig==
X-Google-Smtp-Source: AGHT+IFvfnXx3vIA0IygucIVFMzusww6a1v559qwPHqvKV9Wy0ZpTiWPO7TpRRif5ApEBz6kamOW3Q==
X-Received: by 2002:a05:6e02:3cc2:b0:3ce:791d:7f6 with SMTP id
 e9e14a558f8ab-3cf74487b41mr262768565ab.16.1737787625414; 
 Fri, 24 Jan 2025 22:47:05 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:05 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 26/63] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Fri, 24 Jan 2025 23:45:40 -0700
Message-ID: <20250125064619.8305-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
dynamic-prefix-emits for flag combinations vs undecorated printks.
This will make it easy to assess the cost of the prefixing.

NB: the count is an unsigned int, and is *not* clamped currently, but
probably should be.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 74b98adc4ed0..5cfc156ca4bb 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -16,16 +16,24 @@
 
 /* re-gen output by reading or writing sysfs node: do_prints */
 
-static void do_prints(void); /* device under test */
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
@@ -177,17 +185,20 @@ static void do_levels(void)
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
2.48.1

