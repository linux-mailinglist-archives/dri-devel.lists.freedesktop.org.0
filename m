Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E763D80C7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36066EA97;
	Tue, 27 Jul 2021 21:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720AD6EA64
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 21:07:03 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e14so10942plh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9rtpQJfi9BLLOweU32TBsHXrBE4rsqDcc6NfaxawLSk=;
 b=RtzRv2Hcall8Q6XauG9EQPn8i+Z+6koyHdHqSdWr1lBpyDmTL2zq8f4/gYexNOgk1T
 WXmsT0CdeWzWqKO4r48fClVJNDtqn6UozibeVLNy9JNbVg75bxoYY9Ruld+9teuS9TwN
 pO5fWj3PBxdOW6auqhJTHSBpj70tfZtzUkWjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9rtpQJfi9BLLOweU32TBsHXrBE4rsqDcc6NfaxawLSk=;
 b=GZGBIswZq9NW9l6kDjaMBArLD9PLKTRt2zppkARfl5SiIWVqCl+/So7KQSJrZ8vDoM
 4BbmaBn27a0rySRMKJQTfYC0G76swgOiPkvgtbxQaiTilnzZ/cmJeZ5aGKHab+2RVp4T
 /eJM4Y63SCxlRUEwA1yZJhGVsCYlFviMicF9Pb13zPieQKIZhaXgUgy2MsjqBuDZLFnO
 9OucA7oNsjD1e1LtHaGRDf73lqGDpUNKXAzzTBchVewoctsMckoaCMoByVxMFwk/BGW8
 lsHoKPT0/jz0VLLb0ZGVddekv5K6KBtMffWVBUpgc+99nPRapHNZ5DkEXvxH0vB4mPpc
 Bllg==
X-Gm-Message-State: AOAM531abUmtozJ9XH3iQeYtO29AKbtGgOJgUEP/+oNNaPXPpETKvYMn
 viFGOPEm1pQZ7GBy6aV0EPuVCg==
X-Google-Smtp-Source: ABdhPJwtY/96GtTJvQKRxUE9f4XM5WO13IhPiZmvG1Gx9it1XsiDWBqLh+O5ytTK4J0lAw6QIUM9HA==
X-Received: by 2002:a62:3852:0:b029:32e:50d4:6ee5 with SMTP id
 f79-20020a6238520000b029032e50d46ee5mr24697953pfa.3.1627420023128; 
 Tue, 27 Jul 2021 14:07:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 19sm5414686pgg.36.2021.07.27.14.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 14:07:01 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 50/64] KVM: x86: Use struct_group() to zero decode cache
Date: Tue, 27 Jul 2021 13:58:41 -0700
Message-Id: <20210727205855.411487-51-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1896; h=from:subject;
 bh=Yy2yFM1urtqhL7n0r4aqd2cxgBZVMAyveJbcFvHLMlI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOLO3D9COdGLWOeR85zbaklAzObwkj15dNUWB7V
 d7VJAUWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBziwAKCRCJcvTf3G3AJlCqD/
 9cyHvgurMj0+H5UBZbi3PT0Pbs8SRpr/t0XADG40BpZ+yVAAnrqFDSkxMwCaBqoxRSLdmcDqy3b5SU
 c20S1Aw1siyqHiVEI4mnsKY6Jgrwx/SMBp2bYIVeZru9HNSXKKx57kdf2tIrViE9LYxYJFaHrBwPb9
 o5tiJQmaA6MIjjExAe20o1QhTaI/E8sNfmlXtKaS0+XA7Rm8s+Qw65FVDyLqzv2BWb50Hdr4cMYh1X
 MTXkpiMZrMaPEQ3Wa2TwW0eAlAoWXXUXCLZ9VWJ5QlWKljXrylcdoLAikqEE7v2J5Rlr6FXOAMs3tZ
 d2CLoMo36Px3zBdTlu90/UlVPgO3P/Uk2ZhkN4uzHd4n/DIvanRvGewXH4liErXPixMmOgnLGLl+5d
 dVxT4PdjmU6shd83BEuZ8GZH4T6M9tygTNcERhWYIFMPXxYO5sgBrAlOJPmGkJC7hJD/RcfcYrBrpN
 UanrlQrhn6AYQGnmxcAQjc9dQQiRJO+jcDS4dRElaZb2OkRAD8J6+dNCu3El0L2RSWF1CiAbnwjwZi
 vxQaozruf1DsPdfg+Bv8JNonOrCpc7rnWMUbZIM6n0KMZJB+puj15D3L2N22fwOUi7MkF9cUWlAzlk
 H8X7oTv0jAj5RR0KuG/re2JSTLAEqtF1EBsbI72rE8m6mO5OjrH8edIe/qDg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct x86_emulate_ctxt that should
be initialized to zero.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/kvm/emulate.c     |  3 +--
 arch/x86/kvm/kvm_emulate.h | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index 2837110e66ed..2608a047e769 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -5377,8 +5377,7 @@ static int fastop(struct x86_emulate_ctxt *ctxt, fastop_t fop)
 
 void init_decode_cache(struct x86_emulate_ctxt *ctxt)
 {
-	memset(&ctxt->rip_relative, 0,
-	       (void *)&ctxt->modrm - (void *)&ctxt->rip_relative);
+	memset(&ctxt->decode_cache, 0, sizeof(ctxt->decode_cache));
 
 	ctxt->io_read.pos = 0;
 	ctxt->io_read.end = 0;
diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 68b420289d7e..9b8afcb8ad39 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -341,14 +341,17 @@ struct x86_emulate_ctxt {
 	 * the rest are initialized unconditionally in x86_decode_insn
 	 * or elsewhere
 	 */
-	bool rip_relative;
-	u8 rex_prefix;
-	u8 lock_prefix;
-	u8 rep_prefix;
-	/* bitmaps of registers in _regs[] that can be read */
-	u32 regs_valid;
-	/* bitmaps of registers in _regs[] that have been written */
-	u32 regs_dirty;
+	struct_group(decode_cache,
+		bool rip_relative;
+		u8 rex_prefix;
+		u8 lock_prefix;
+		u8 rep_prefix;
+		/* bitmaps of registers in _regs[] that can be read */
+		u32 regs_valid;
+		/* bitmaps of registers in _regs[] that have been written */
+		u32 regs_dirty;
+	);
+
 	/* modrm */
 	u8 modrm;
 	u8 modrm_mod;
-- 
2.30.2

