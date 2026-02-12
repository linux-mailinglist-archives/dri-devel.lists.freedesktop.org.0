Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ap2CVsbjWmkzAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B312874F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 01:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F275010E672;
	Thu, 12 Feb 2026 00:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i92vzxhG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E1710E66E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 00:14:12 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-4094b31a037so4224584fac.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 16:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770855251; x=1771460051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1llWeupqUYTfIckxMQvqgcJ2LKvqlIwtq2+/rBPIDE=;
 b=i92vzxhGNqGurY/J7gvcop0NuYD1KJom54d3sz2BRlY1l5pe81VlYdlzDLDW4BUh1Q
 2OUmkGoQ1opaI5HVFLDqQ1d49x+L6tP4Vaf6Elb8Mc/x0CmS3zE4MDNO0sqriYELCLqd
 cC5VWaHW28rAaEydhQezGkBoqPT9Cd95Qclrib41OMqbsv50ic1fJSsS7iNpDZeONiGc
 OJ2xPqsSP2wIXcIdpSJ8eXN9QKA/IfJZYdSvX8r0heFUhpjffXrmwLtQyTaskV4OB7OO
 60eMpORmUNqpsOiVHInpU6zXmQX+NFnAt3e9zDHMgYLTnO5Cb8cwwWVeIYDpq0p+bm6N
 CRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770855251; x=1771460051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w1llWeupqUYTfIckxMQvqgcJ2LKvqlIwtq2+/rBPIDE=;
 b=IM1EgravggzvVANSh7mKpnbOy6Ai9VYjeePxSWYsMDYLobH8HBlkHjtMBG1448HLba
 FXoVhgjTBhGo9SLIDUisinyZScsOjmGIiMGMA6RKsWCBlmF16EF61JkA4ZblTfmnN5MH
 YFN4BxFQE3a1Ryxt+HYJVRaghWxAaBWx7omOz08wKCoxqCg1DCyaQpscf8LYroYY5DHp
 z3NqsT7m6rJAnlX2OzJHrT0UxdZOBwMj5k0vN/3PKgkAYmQ71rcWg+osQCqEKf8MC3Vs
 B/5cj/1Hjicf/K2OguWE9Uyje6KcNLC7REh0SxzDcUyuqMv8SKXaYhbAjyBxeJLcGTgF
 9dEQ==
X-Gm-Message-State: AOJu0Yzr5qP59Z9C3wxIfnjU58gorJtUyhQmYKz5oZZbvrK7bk0GBXeD
 z4+rle/PFT3WeBcsHZqwXG9oXCBbzjL5jz2/ve16rNylMvYN1LdRDrhKp4q9Uw==
X-Gm-Gg: AZuq6aKyaHtRniQvrkMPModai9OtIpC4zPCtIOCcke7B36CaeQjj96VmhuF/KLbOD0N
 g6LZ+v2mk7SiFQtrb6cFb0HSHhQB9AOXOl79fgX1oqMuwdTdO+w6Fwt1Qi7LLTwhTd0pHBLWx7w
 Yheqvf7Lux98W4KrEQyXjNQ/erlws0MOSuB8pzi+THpolfCavRM9yrnT+hupdzS5auuYcnI0nPs
 7TsFWcNPVRNEJTy90jzQS00PX3Vn1tVfOneuv/5o/sMFtvQAo/ucxNhwBLeh0QZ9yfo/mQrjZWg
 drJ/OPpI9/lEgmCpd5SynqsqTB4Bcj/QvRP7wuCng2E8oYJ5jE6UI3VqX0xzKa2nTAnwDBAFwdX
 Hmg+R5h7h/BFTyxzOrt+ZlEcAstrcrocHVAUIkRACxhNNlPy6P+YFFynSN2h52HRy4vCaasLbQI
 dmp0uQcz2Uig1HWI21lryT9jUfJPQpwalGRfK5UbiDpTFcEi6KzccG
X-Received: by 2002:a05:6870:7205:b0:3ec:7649:f843 with SMTP id
 586e51a60fabf-40ec717a7f0mr516526fac.38.1770855251244; 
 Wed, 11 Feb 2026 16:14:11 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 586e51a60fabf-40eaf1062ffsm2331939fac.13.2026.02.11.16.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 16:14:10 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
 kernel test robot <oliver.sang@intel.com>
Subject: [PATCH 01/61] dyndbg: fix NULL ptr on i386 due to section alignment
Date: Wed, 11 Feb 2026 17:12:56 -0700
Message-ID: <20260212001359.97296-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212001359.97296-1-jim.cromie@gmail.com>
References: <20260212001359.97296-1-jim.cromie@gmail.com>
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jimcromie@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 916B312874F
X-Rspamd-Action: no action

When dyndbg classmaps get used (later in this series), the
__dyndbg_classes section (which has 28 byte structs on i386), causes
mis-alignment of the following __dyndbg section, resulting in a NULL
pointer deref in dynamic_debug_init().

To fix this, employ belt + suspenders:

1. move __dyndbg section above __dyndbg_classes.  This restores it to
its original position directly after the ALIGN(8), and fixes the
immediate problem.

2. add ALIGN(8) to the BOUNDED_SECTION* macros.  This aligns all
existing sections using the macro, and also fixes a future
dyndbg_class_* addition which would suffer the same misalignment on
i386.  Many of the existing macro uses already have a preceding ALIGN,
these are now redundant, but are harmless, so are left to avoid churn.

3. remove BOUNDED_SECTION* uses in ORC_UNWINDER sections.  These have
smaller alignments, *and* scripts/sorttable.c does not tolerate the
added ALIGN(8) padding.

Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202601211325.7e1f336-lkp@intel.com
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/asm-generic/vmlinux.lds.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 8ca130af301f..4b4d2773aa22 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -212,11 +212,13 @@
 #endif
 
 #define BOUNDED_SECTION_PRE_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	. = ALIGN(8);							\
 	_BEGIN_##_label_ = .;						\
 	KEEP(*(_sec_))							\
 	_END_##_label_ = .;
 
 #define BOUNDED_SECTION_POST_LABEL(_sec_, _label_, _BEGIN_, _END_)	\
+	. = ALIGN(8);							\
 	_label_##_BEGIN_ = .;						\
 	KEEP(*(_sec_))							\
 	_label_##_END_ = .;
@@ -383,8 +385,8 @@
 	*(__tracepoints)						\
 	/* implement dynamic printk debug */				\
 	. = ALIGN(8);							\
-	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
 	BOUNDED_SECTION_BY(__dyndbg, ___dyndbg)				\
+	BOUNDED_SECTION_BY(__dyndbg_classes, ___dyndbg_classes)		\
 	CODETAG_SECTIONS()						\
 	LIKELY_PROFILE()		       				\
 	BRANCH_PROFILE()						\
@@ -867,15 +869,21 @@
 #ifdef CONFIG_UNWINDER_ORC
 #define ORC_UNWIND_TABLE						\
 	.orc_header : AT(ADDR(.orc_header) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_header, _orc_header)		\
+		__start_orc_header = .;					\
+		KEEP(*(.orc_header))					\
+		__stop_orc_header = .;					\
 	}								\
 	. = ALIGN(4);							\
 	.orc_unwind_ip : AT(ADDR(.orc_unwind_ip) - LOAD_OFFSET) {	\
-		BOUNDED_SECTION_BY(.orc_unwind_ip, _orc_unwind_ip)	\
+		__start_orc_unwind_ip = .;				\
+		KEEP(*(.orc_unwind_ip))					\
+		__stop_orc_unwind_ip = .;				\
 	}								\
 	. = ALIGN(2);							\
 	.orc_unwind : AT(ADDR(.orc_unwind) - LOAD_OFFSET) {		\
-		BOUNDED_SECTION_BY(.orc_unwind, _orc_unwind)		\
+		__start_orc_unwind = .;					\
+		KEEP(*(.orc_unwind))					\
+		__stop_orc_unwind = .;					\
 	}								\
 	text_size = _etext - _stext;					\
 	. = ALIGN(4);							\
-- 
2.53.0

