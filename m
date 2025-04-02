Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62CA7941D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DBD010E88B;
	Wed,  2 Apr 2025 17:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mdGUy1ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC27610E891;
 Wed,  2 Apr 2025 17:42:35 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-3d59c8f0979so3699155ab.0; 
 Wed, 02 Apr 2025 10:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615755; x=1744220555; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9crVnbk3XjpJrHsY0dIqQRNI8E7oyjJ17chOf0dhmBE=;
 b=mdGUy1ip1oNTrQl82mWfnAxzjQw2EyDhm0tsnS5Aj2CgXsRFAo1nHA7A8OWeAP6QvK
 Fjazu6NBE5+vu7vQygBw5+MS0sBr/fbXLANjUSw+Y7MId39OZFRTE+iB/h5Xko8kxqNF
 soD1TQ+mWJ03uZ+IlvEMA6e7YOULeUxGz68b6i0O0vft6dx8R4QC+6BWYtVvgk2RxnUr
 nFNU1En1XxCnfcTc61A3i9087fEZjKo6sU0vQvjUunLSXsG8xmqmWD96bX4weMYj8Wt5
 Ccn4kFHLTCsibRFfE0E3PymOePQqz3SmKKBoFTtArXAHV5Pvo8aTsAcReMKCSQDCCHrq
 XI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615755; x=1744220555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9crVnbk3XjpJrHsY0dIqQRNI8E7oyjJ17chOf0dhmBE=;
 b=pDOYVwcUCqMnmT3a2/nbC92I56X9rUZ4q+tRhhXmdOVkyUujzesGJdwnTYlXGgJ8zC
 wTZaVAXoC/I1oLaNHTWaNqTG8cQUYhEN4YoXpHiTi+p9AqmFAIOI6Ez13UMxwop/blZL
 l64QzIVtmh8e1CjAr5QZz/IYxiT9IyvuSLZqFkT7iGmDkLQJGg9/mONvoBvDeGTA6mmb
 gRsK0yr50ha2yqDG4uzNgfygqHeuefCl2vdcdJggjnpuMmFrz59AEXPdvrcKvNtIvGI4
 wLMJQHa1U609xoPbiU6zvc2g9+Xt06tmfWq/HojaKfcKLtche6O2bkl96VI2EsvZ0oeK
 s1fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxg29/yfSBAa4kWa3KS6tvQme1ClVxjmsuvdPUDWc8XDbnpX3me4MogBsMRHCrkfPdxN7Z+QkHwz0c9JW06w==@lists.freedesktop.org,
 AJvYcCVbYGpHTlUpSZeCE1c0KvRzUn6aA4Ex/VlCkpa0QOWF5kjze89dxrGyf01bpnO9pSxgTh3GgEPYpHM3@lists.freedesktop.org,
 AJvYcCX+N8uYhT1jzUeEjFZ+MUuxpqAWtnKjZuGUp6VRbsAZWwZXFQkbwafYqtegz+7wJpKaGxEDjY9D@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD/ZimlTuGARbyJftll0f5TZ1hIaI757vQgIK4BcrHp4pwQo80
 v0IxV1gxkRb2HkeIMz559K8uKDNogJOd/52awzB6ggsJu2EMzkWx
X-Gm-Gg: ASbGncuN0B7TNG3FG5LMiuXx2mN4O2fAf1wFwzHyhNsee4py0tlqM+ZDxIC4nRDgKB5
 As9VYBE8iooioONKfjcCTqzPmZSpSpdV/AkpMrgY9pgqDAGyR8wZyQUt4r/PtX6MVb92GkKGd9N
 R+RADglkhcr6rpNaqTBkJlweXTpzrzPPR6bfrZXSl3LZRkptCzMZbNmj8o+UemakLyH7JXZuYbk
 J5Eyum1tUmI7IECZnQjLpkfcz95nQfxRGYv6NORVolU9F0iWnJ6Ux+1SjJ4NpAQK4TsYKgluG54
 H9uSxjSVwayb5kvUU2jTw8AnfzUQrEnv7ALAoSaZiEt/Y3EKvyX43GNL2IkJrC8b+deroKq2cKo
 bdQ==
X-Google-Smtp-Source: AGHT+IExGVMuJtN5hKLJ003ECDmgVw47CrV9YfzVs9KN7730OBh4HexWxFYIN3TSQJH5oTzEZWr1LA==
X-Received: by 2002:a05:6e02:4406:10b0:3d3:de5f:af25 with SMTP id
 e9e14a558f8ab-3d6dca86dfemr5222605ab.0.1743615755159; 
 Wed, 02 Apr 2025 10:42:35 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:34 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 21/54] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Wed,  2 Apr 2025 11:41:23 -0600
Message-ID: <20250402174156.1246171-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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
index 9f9e3fddd7e6..4a3d2612ef60 100644
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
2.49.0

