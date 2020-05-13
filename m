Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344AC1D2157
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 23:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865626E0C2;
	Wed, 13 May 2020 21:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3626E0C2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 21:46:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l17so1338599wrr.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 14:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jW05YIYcf1GNolkjiyr0mICfCVmFkBpfqxOEcp+jfSE=;
 b=B6ufszp741BrL+8jST20P2NOnKbKE/LNB0r5wtKJFYTRDlckV/y9gXmjPYv7DSytm5
 N3AMbtHVrYFTCSwCiaDlyXrW9z+p7l1w7/eCeTbBxTMtWGRX/SMolhOP8VQuYczT9DkW
 CHxeTsCHlwc5lCyzBPRZ+M31ujfjBfGSgHqx/27EQC1XXYkWNnbps5HfIjw+hKDNFXxN
 vWzEDj7eVxbdYYTapTC0qlRtAKivLG64U/FR6pXzZpuchoBxHQ3c4SiBUSL+C8ypStQB
 5zCBc5kn2VvrXWVcZpwx3hfjvSfAo0EhObsX7ynqyraCai9yJALEmKdL3D464SExMah7
 6OvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jW05YIYcf1GNolkjiyr0mICfCVmFkBpfqxOEcp+jfSE=;
 b=FYy+hPeBMsExcjDCHZ0GcM9U60bkdBbLDqcDlDgOjA7V2yM4QwteyvKrPSUU1tTNFx
 hno+UW5XbrTLFT3NXr9IRBC5PfkA82jXgd33aIiRNel4xyq4cHbQ2lBvem22zf+iA+xw
 +VDqFvdo9HRbg12cqh2B5DJdLuj2EW7ph6Q7DSbxz6woLFzsrADkqGC0PPv8cB9SVtV5
 xQ0BEsmV9W+sLHifKT/SM4ac0b6j2dNcm5Ma3tg9PWnlOOWjQKoNuJvPUVH3rPSTYVgB
 As4t2zGRx6V7FZ3OZPotA4m/sbCehX0ccRMrwAqm+i5W4gbSYnTS+xf4WfFE06nk5xsb
 yg8g==
X-Gm-Message-State: AOAM530e1n4FaOTLrVJ8t12X9N4nCse3suE0dDuWKLx7Vt8lL2Lr8Wjn
 O/V5SfJ8eQdc+XmeGlGqUWzFiAkD
X-Google-Smtp-Source: ABdhPJw3w2J0RzaICCUDrZ+Ja4zE6bbo3lH35G0biusV3jmscCSLw1DMkpvIdJ8Bwau8RbnHiAwd8A==
X-Received: by 2002:adf:f605:: with SMTP id t5mr1519029wrp.354.1589406398407; 
 Wed, 13 May 2020 14:46:38 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id m23sm1699734wmg.45.2020.05.13.14.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 14:46:37 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/11] tty/sysrq: alpha: export and use __sysrq_get_key_op()
Date: Wed, 13 May 2020 22:43:41 +0100
Message-Id: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-alpha@vger.kernel.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export a pointer to the sysrq_get_key_op(). This way we can cleanly
unregister it, instead of the current solutions of modifuing it inplace.

Since __sysrq_get_key_op() is no longer used externally, let's make it
a static function.

This patch will allow us to limit access to each and every sysrq op and
constify the sysrq handling.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: linux-kernel@vger.kernel.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
Cc: linux-alpha@vger.kernel.org
Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
---
Please keep me in the CC list, as I'm not subscribed to the list.

IMHO it would be better if this gets merged this via the tty tree.
---
 arch/alpha/kernel/setup.c | 13 +++++++++++--
 drivers/tty/sysrq.c       |  4 +++-
 include/linux/sysrq.h     |  2 +-
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index f19aa577354b..dd7f770f23cf 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -430,6 +430,15 @@ register_cpus(void)
 
 arch_initcall(register_cpus);
 
+#ifdef CONFIG_MAGIC_SYSRQ
+static struct sysrq_key_op srm_sysrq_reboot_op = {
+	.handler	= machine_halt,
+	.help_msg       = "reboot(b)",
+	.action_msg     = "Resetting",
+	.enable_mask    = SYSRQ_ENABLE_BOOT,
+};
+#endif
+
 void __init
 setup_arch(char **cmdline_p)
 {
@@ -550,8 +559,8 @@ setup_arch(char **cmdline_p)
 	/* If we're using SRM, make sysrq-b halt back to the prom,
 	   not auto-reboot.  */
 	if (alpha_using_srm) {
-		struct sysrq_key_op *op = __sysrq_get_key_op('b');
-		op->handler = (void *) machine_halt;
+		unregister_sysrq_key('b', __sysrq_reboot_op);
+		register_sysrq_key('b', &srm_sysrq_reboot_op);
 	}
 #endif
 
diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 0dc3878794fd..1741134cabca 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -172,6 +172,8 @@ static struct sysrq_key_op sysrq_reboot_op = {
 	.enable_mask	= SYSRQ_ENABLE_BOOT,
 };
 
+struct sysrq_key_op *__sysrq_reboot_op = &sysrq_reboot_op;
+
 static void sysrq_handle_sync(int key)
 {
 	emergency_sync();
@@ -516,7 +518,7 @@ static int sysrq_key_table_key2index(int key)
 /*
  * get and put functions for the table, exposed to modules.
  */
-struct sysrq_key_op *__sysrq_get_key_op(int key)
+static struct sysrq_key_op *__sysrq_get_key_op(int key)
 {
         struct sysrq_key_op *op_p = NULL;
         int i;
diff --git a/include/linux/sysrq.h b/include/linux/sysrq.h
index 8e159e16850f..9b51f98e5f60 100644
--- a/include/linux/sysrq.h
+++ b/include/linux/sysrq.h
@@ -47,7 +47,7 @@ void handle_sysrq(int key);
 void __handle_sysrq(int key, bool check_mask);
 int register_sysrq_key(int key, struct sysrq_key_op *op);
 int unregister_sysrq_key(int key, struct sysrq_key_op *op);
-struct sysrq_key_op *__sysrq_get_key_op(int key);
+extern struct sysrq_key_op *__sysrq_reboot_op;
 
 int sysrq_toggle_support(int enable_mask);
 int sysrq_mask(void);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
