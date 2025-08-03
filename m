Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317DDB191E9
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 05:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833F310E4B1;
	Sun,  3 Aug 2025 03:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QfAri/Fd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6068910E4B1;
 Sun,  3 Aug 2025 03:59:07 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id
 e9e14a558f8ab-3e3d94aa969so14696185ab.1; 
 Sat, 02 Aug 2025 20:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754193546; x=1754798346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=;
 b=QfAri/FdI8u5Ah26oU6vEyKNi5Y8FV8C7LIWJ/1+iJGnceUMjLko+X5UqDrbKP3jHJ
 8YnXvDMHJWPNqGz3O/76Yk6coCc8FG8eQb5eF3MM/ikQkUaBohb6WwIYk0fGIUGoiR1Y
 tlpQZXtWVwhlueSQUACNxl0LQpa1l1AkrncgnaDKCcdNFQ+5ai7L5/B7TRvo++mu6cIr
 yAubBE0E9yIld30oiWDIpKfmhLbvo+WZ9GewS6XxanCmqa2qtcg2EQ69JUOJ4APPMUCi
 ag26rhh48HrtDtrPb05Ux2EweQucac4LK0FIj7f86xYUlv3Hm49WDEmDmzs63kSE82z8
 Umbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754193546; x=1754798346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81bWgn76neJvQmIetnUY9QrXJo1xKmDBqiRUkV9XO/8=;
 b=R7mWWS0CoG662tVxoEiWBopJ7Hgv8rUd9Tu1cvHepWNjLVT0XiT7TBXjx4v1IXaeQ2
 QZ3i7hsLYovIqE9cPdH8F+na4rwTJctofEkHXHCqrMl62y5KrPXpYw1BzuB/Url6xsr2
 QSRWgIPGBCPW2HP2eogMilvbbcO+Hto6/VedshkPLQTbOq6rAXt6fbaVpB7D9stDKOEA
 4S7URzbyEQ6ynDUSg6YQogrqnitUkiTc1rq2MKcD7L/uATjjRodwqxZuCF1xHsNmPLHI
 ExxHlnu9Z5zmhMztcZzROJ8pvB8NIxLjcYVdQnDma7tNf4UaMgIQ62vBIjha1c6EGLpw
 yz2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUL4ZaL9AMRZS8Oz6+ty8hqS2QNE5AmVFF+e/CAtMwtJOvk93E8MDiLHjqaglEtwKaCdmrzpvo@lists.freedesktop.org,
 AJvYcCWg+HhjCrziMb6b5U9XLW2IyaawUL3pY8ctB7WUoAIrMITsDYv/D93sJY9sAt3DYJFjF3Uyh4Rsxgo+@lists.freedesktop.org,
 AJvYcCWxxhp0Hg6k2NDp92Ce3eaQKUYtjgALpimuzOQ5hvKu9k/tao5w+I9FvuLvPXMdM4yl5dX9DvohB2ROKaRqrw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzufF8TFhC4E9KWGp6r7cPmUqGYG9qQWUSyw1vRxbLdUPp+j6Mj
 DmmTI6SCbYip6XZIb8KUa9m+zCbwhJLizczKvxj6+Nx+lsYiXVw5fEgW
X-Gm-Gg: ASbGncu3tmRHrrS/k5R5E86V/S8fCXPTSdsnojuXp5JzKpjQv250uaHtw3a/rWtRsDU
 WclxK9N14n1nWWkPwc73ISENVyqxd3rqRpQMtDUuOXim9uLOIE8NEDY9Gikl4fWw5f9gBHVnSqo
 dHbF4eL+KRBvwpP8rS0DBOvJvoy3p74bLFpYkHFtu6OEha4kl7Xt8YPW1xMuofxHq5b1IA5XoPw
 XI9dI2OYUetqPGfbGZ0XP4Hn1yTqlkS3N7s+AOwx3ioCG0py3yz5CQy8bdkS4Xxd/R2FPtoc6ib
 VZHZQJrrSpfcwWaA/rNAXdpwT1T+pGyCL+8eooUGMrYpz6k/dvUqzpnc74btwxWgYLxk24RZVpz
 GToWtIYQsUyBLv39lvF88tYFHiTo5YnSp/w9KumKjDY5EL7Q62dUPjVrscv/Qcy9UibCCMEI/51
 lgBg==
X-Google-Smtp-Source: AGHT+IFoAVWLiheF2E67Np6scTtkKmbEoqDI0XN5GZeGYOfVbOkwBUJIixlaV+eykRMBCUEIeZ8d9A==
X-Received: by 2002:a05:6602:487:b0:87c:5a38:45e9 with SMTP id
 ca18e2360f4ac-8816832a528mr807300339f.3.1754193546523; 
 Sat, 02 Aug 2025 20:59:06 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net.
 [67.165.245.5]) by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-50a55df0940sm2268319173.106.2025.08.02.20.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 20:59:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org, louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 seanpaul@chromium.org, robdclark@gmail.com, groeck@google.com,
 yanivt@google.com, bleung@google.com, quic_saipraka@quicinc.com,
 will@kernel.org, catalin.marinas@arm.com, quic_psodagud@quicinc.com,
 maz@kernel.org, arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, mingo@redhat.com, jim.cromie@gmail.com
Subject: [PATCH v4 22/58] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Sat,  2 Aug 2025 21:57:40 -0600
Message-ID: <20250803035816.603405-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803035816.603405-1-jim.cromie@gmail.com>
References: <20250803035816.603405-1-jim.cromie@gmail.com>
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

NB: the count is clamped to 10000, chosen to be notice able, but not
annoying, and not enough to accidentally flood the logs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/test_dynamic_debug.c | 37 ++++++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index e83b34b6d6b95..8713537363713 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -29,18 +29,30 @@
 
 #include <linux/module.h>
 
-/* re-gen output by reading or writing sysfs node: do_prints */
-
-static void do_prints(void); /* device under test */
+/* re-trigger debug output by reading or writing sysfs node: do_prints */
+#define PRINT_CLAMP 10000
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
+	if (ct > PRINT_CLAMP) {
+		ct = PRINT_CLAMP;
+		pr_info("clamping print-count to %d\n", ct);
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
@@ -191,17 +203,20 @@ static void do_levels(void)
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
2.50.1

