Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGuzHs0Me2k6AwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:31:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E24CACAD8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F7310E7F4;
	Thu, 29 Jan 2026 07:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mNjYiraa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8E210E7F1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jan 2026 07:31:22 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-404254ffe8aso493999fac.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 23:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769671881; x=1770276681; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
 b=mNjYiraanZnpGZg7BU8nAz8v/ApHDpftkYcQEzp0TNYmpLOwUs/3rzNckorK6dp2gq
 R57yJi2gb6eK5NWFilr1Np8te9zoitTMFKPgSxxmEjaZjyiCdaj3bIfCFHUFRg4tv/NU
 P42ULCT8DK3ri3pBjxgRKHjxdNC3C3ToWQZ30X8yj6Z2xmDNJ2IkT/TbMP9biqs5+eNl
 Y3WOyonactQRnWyc2wvrPm9fStuCwVV29DTBUW/fnNAzL07B5eT00Ja58zEYhrA32bzl
 8nEaM/MzhEmH14/CAgBVUT18y9+VkjMR/cI+mp+yZqPdA36M9RrtR1t/0UUrz+TpZpww
 Lsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769671881; x=1770276681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FrG1isq17Lyb0bJFCu5jKcbVF320nGGDAVNnMWnzxZY=;
 b=hmEp+9VNSqeKKrjlT34pqoTlgJWswp7Bk89HelO04AYZ58ZS5Hu7fpSA6o47kgk8yY
 Fr9IdKRtVNOL7dKrm5M2p0A45FZGyy5/sSZHo2DL/PjiSnlqrEnfPxUrzFh1PXoJxMGI
 48ZGsWyfcspq1/mMbCWOLAfK9fDJ91QYQog6wWjiQD7iYnNcOkg3q4fZvisOG+jxW1ue
 3ofEv6gCmS10840vrfDqaOtnpmJI+mF2PQSBnaXvbAKYu0nKzp+43lldWxs53uNZirA9
 SMsUr4nQtv/dKDwC1V4rQEXCao2vCFFRvNLiMLEdj0Y11AXrDt1/PozpdDj5s9z2b1/O
 JVZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCfculGoQjdg2K36n09f8gvNzSM7lWiLr/eEdJ6GqlA9C7hzaHInA5im2UeIChXfTxOwHD37bapk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNJ4ige1abIaoqRyo0ft+vU+RXlPJu0sGJ2vQVVvdKOeHbM6gr
 p/wx1u8ItCxHptU+aFBkCk93Zg/17xgOsXfcxkcz1cU8y5CpCgyOF/T5
X-Gm-Gg: AZuq6aIrhSByMTvABfaAYJhXbk/TN6Vx9Hc21+sXCA4LrNhZ/BrJ19DHEg/tCC6Ms2Z
 Qe5Yl0l/ERpwGJz58FxjhhOGYudyOeOhY6Slr7WNodLyZvgVR7C4Sv5YIZXRLfbv/P4S7oJR2wO
 uBJn59DQ3KyPxYud9lgcd3Zf78Ht5NsWUCIkYF+H8LG9J3vD8dVP74iudnSVOST8mqKyQ3eWmUn
 TJWDlhxB1mMe5pPeZrtFp9jOPnIkNyniQNg/1CKG7klxL1wRXsoTtGEiQekxeaNeyvXeov7VEa2
 RCOQ10t/K/vYAKxowDVWO2QueXWAFvrobeOgtpkWoICDQqlMy/SQmxZmmw4xyyuYyZGTxjmC4G5
 ZRq5aPu9aGK5qZtpgHr8pTbjU4KC3eOcsbRs7+b87mJlcjg4DZsvNWTVV58oOPuCRMZntO7aFvs
 sVShz77/m8HMfY8fcKv18nn+FIj2cp7TFPPZ7M7VIg
X-Received: by 2002:a05:6870:6489:b0:3e8:97ab:d06e with SMTP id
 586e51a60fabf-4097fbae87amr1172996fac.9.1769671879913; 
 Wed, 28 Jan 2026 23:31:19 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-4095749f332sm3240441fac.11.2026.01.28.23.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jan 2026 23:31:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 25/32] dyndbg-test: change do_prints testpoint to accept a
 loopct
Date: Thu, 29 Jan 2026 00:29:11 -0700
Message-ID: <20260129072932.2190803-26-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:gregkh@linuxfoundation.org,m:jim.cromie@gmail.com,m:jbaron@akamai.com,m:ukaszb@chromium.org,m:louis.chauvet@bootlin.com,m:bagasdotme@gmail.com,m:airlied@gmail.com,m:daniel@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:pmladek@suse.com,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:akpm@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:jimcromie@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,akamai.com,chromium.org,bootlin.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,suse.com,linuxfoundation.org,vger.kernel.org,linux-foundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2E24CACAD8
X-Rspamd-Action: no action

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
2.52.0

