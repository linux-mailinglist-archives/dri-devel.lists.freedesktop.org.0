Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ElbFOBQq2nZcAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 23:10:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2518E228350
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 23:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643B710E408;
	Fri,  6 Mar 2026 22:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="RxRa5ZLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E677890EB;
 Fri,  6 Mar 2026 22:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IY6amIQzvvXdfqN8dUCxafj8BNXVCSxt3+ZxyduQ72M=; b=RxRa5ZLorg/wNxC0eVkLcfkwfW
 arzR11LHcg6cua03crk8AbyAeJfqAVOTYBmTGMsyD1FcONV3APZhxl6gKWs3kLbXm0U7cfwdHn6tW
 a3liHLVCdelwjqIUavAbQvCU4n+vrcOWRZZpGSgc6KdAHxuo3VMCiDRYod6gITdMpiTjJllXaou8n
 b8pPw6SSyozZGGUDzKmRNJKa57LBFN7N36aHOBhGVGfrr1fEBoV7I/fNNqx8paMYnf3dlYiZiYMib
 HpRXVCwj3gXEJJf/I9rSkt5jW7TAd+9Op71ZtkDJyhaSCGa47Wv0bNvfk4gIbqQjkwJcEvN/oSRpB
 ZQKT/YCQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vydNT-00000004ZHT-0Lkk; Fri, 06 Mar 2026 22:10:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] iopoll: fix function parameter names in
 read_poll_timeout_atomic()
Date: Fri,  6 Mar 2026 14:10:32 -0800
Message-ID: <20260306221033.2357305-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Rspamd-Queue-Id: 2518E228350
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.49 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[infradead.org:-];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.721];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,lists.freedesktop.org:email,infradead.org:mid,infradead.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Correct the function parameter names to avoid kernel-doc warnings
and to emphasize this function is atomic (non-sleeping).

Warning: include/linux/iopoll.h:169 function parameter 'sleep_us' not
 described in 'read_poll_timeout_atomic'
Warning: ../include/linux/iopoll.h:169 function parameter
 'sleep_before_read' not described in 'read_poll_timeout_atomic'

Fixes: 9df8043a546d ("iopoll: Generalize read_poll_timeout() into poll_timeout_us()")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: change the function parameter names, not the kernel-doc comments (Jani)

 include/linux/iopoll.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20260304.orig/include/linux/iopoll.h
+++ linux-next-20260304/include/linux/iopoll.h
@@ -159,7 +159,7 @@
  *
  * This macro does not rely on timekeeping.  Hence it is safe to call even when
  * timekeeping is suspended, at the expense of an underestimation of wall clock
- * time, which is rather minimal with a non-zero delay_us.
+ * time, which is rather minimal with a non-zero @delay_us.
  *
  * When available, you'll probably want to use one of the specialized
  * macros defined below rather than this macro directly.
@@ -167,9 +167,9 @@
  * Returns: 0 on success and -ETIMEDOUT upon a timeout. In either
  * case, the last read value at @args is stored in @val.
  */
-#define read_poll_timeout_atomic(op, val, cond, sleep_us, timeout_us, \
-				 sleep_before_read, args...) \
-	poll_timeout_us_atomic((val) = op(args), cond, sleep_us, timeout_us, sleep_before_read)
+#define read_poll_timeout_atomic(op, val, cond, delay_us, timeout_us, \
+				 delay_before_read, args...) \
+	poll_timeout_us_atomic((val) = op(args), cond, delay_us, timeout_us, delay_before_read)
 
 /**
  * readx_poll_timeout - Periodically poll an address until a condition is met or a timeout occurs


---
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
