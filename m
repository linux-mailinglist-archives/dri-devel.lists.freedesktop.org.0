Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927603D7FF8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 23:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A769E6E9EB;
	Tue, 27 Jul 2021 21:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FADA6E111
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 20:59:06 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so6658569pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iuUva0FySkNQOcUDbwdlW2WIxXp65/YwLJggvLs0d2Q=;
 b=SDf9ocitfb5Rs0PPIYeCT0/fXFDoOwuSmJ71BqMp8qK67TG51IYhnkPZYy/Q3tNO21
 Gnrpr40E1hlQTmSfDar2EtSdufgNM0qMB+9w03gQuMGr7mQ5uzF4Kn4bygKa0DXqbzlv
 VufURF9CT4nl7hDYdR1ieA2X/jXjjsUujEGMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iuUva0FySkNQOcUDbwdlW2WIxXp65/YwLJggvLs0d2Q=;
 b=tty1XeaDc1nlH1nD0+iqdhrmaX1adBEajRiYqlAG63l5wrFb0hlmkHXyko+yRqdLZR
 ZbnXFFiNpf1bil1OZgFBgj72tsLP6HYBLMLtRXOGFcjkAN61Y27IIVDi+oNuQxGCCPxl
 oBOuJ1mWQX374Ie/wawHHEX6UX/tQzNWm4xf1W9MxiGKeHzolPGkDS25MtF7WrnERJWH
 aqLQAnQxGyFWfo88rZRgHGNDd4+pBPT3py8jqMgAxLYihvaNSUVPwU+6X1O094vqVk7Z
 /89b0Rk5ssemVUoh3hVBVCDWyQS0hv5ED8xLQeBokxrewWMOCoVKAyzDeGu5vKu1LAJ4
 qX/w==
X-Gm-Message-State: AOAM533IVTubR8aBknL3n5nyfUAxNBsByJV6MBuKeNNpxkZhaAiQn9zb
 9WBUVv+Zr4lvKJ+SbUPAOrp/DQ==
X-Google-Smtp-Source: ABdhPJxd9cckzW204bnJlLeGWRw8HsEr60nmuyps9sZC+nCmiB8MQlX0YoxOoNf+wmuMOuPBFQp8bg==
X-Received: by 2002:a63:44a:: with SMTP id 71mr25103040pge.259.1627419545742; 
 Tue, 27 Jul 2021 13:59:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b10sm4629437pfi.122.2021.07.27.13.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 13:59:05 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Subject: [PATCH 05/64] skbuff: Switch structure bounds to struct_group()
Date: Tue, 27 Jul 2021 13:57:56 -0700
Message-Id: <20210727205855.411487-6-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727205855.411487-1-keescook@chromium.org>
References: <20210727205855.411487-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3898; h=from:subject;
 bh=zDRFvFHICr3CPhHUYpPjYfgsT3sRvZztC648O8M/Z+4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhAHOBpvR1C53LhaWwxonGRaK5/85L2Hs7G8ZVB/N6
 FPHA+JWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYQBzgQAKCRCJcvTf3G3AJq8YEA
 Cme+/3zGc1ol3V7MYHOv02AJS8eYSYvP56YPTN+IWhbG/R9iao0T79B3njP05AdYDQ/YzSVZFyf/nM
 dA48kevzTJQ5BH6U98ciGMAoiY4MhSCxDjxpggkoOLHCkKWSmCLxIFysdAaSpZoavbJiYSBCDvceLN
 RiDHeuN7xznxcDnJd55tsJ+s4n3qET0tTBt0l2kGnVjwvTSyzmILuKrvcWemv1D0RVYiX+E2jt99TI
 xBdZECNgLTvRPfaECNOE/oYadRe/oj4m0V1SGwAAc25mY74Wuw87dVvp6r6XamWTMVynN4sRe1Au0l
 ZqV6k+AJMT52RN/mXQfd19TzgH+9eLex0ywIpeVu7Wc7KOxzgkA7tN9HjgNuY4CRUVFKbPReaMQdus
 vwUmDgDCcu9Dx0l4QzTYz361oipSEVY20vjIwEsR6yog6nyRGOYLp1uAmwh9xz2Kp3fv2XoaAzZXR2
 I0ceyOT34//v3kbI8cZDJ0fHg0ntu/bSopVzECOxn6N5NUgkRQDKgdk28qyMDnLCU3wodi4dVaFQGS
 knqS45LxCRnyHOiKsBXLi2kVHORjmVCZ5fuyRrq1JDcWHgY3T3Fb/Pf8qql4TTPlb51tmVciwA7mKN
 nveG2L2Sw3sIt442QEpUEQ42yM7ri+HBQuuh4OsJ/a9P5DszIHRUcnJVBWcQ==
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
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Replace the existing empty member position markers "headers_start" and
"headers_end" with a struct_group(). This will allow memcpy() and sizeof()
to more easily reason about sizes, and improve readability.

"pahole" shows no size nor member offset changes to struct sk_buff.
"objdump -d" shows no no meaningful object code changes (i.e. only source
line number induced differences and optimizations.)

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireguard/queueing.h |  4 +---
 include/linux/skbuff.h           |  9 ++++-----
 net/core/skbuff.c                | 14 +++++---------
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 4ef2944a68bc..52da5e963003 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -79,9 +79,7 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
 	u8 sw_hash = skb->sw_hash;
 	u32 hash = skb->hash;
 	skb_scrub_packet(skb, true);
-	memset(&skb->headers_start, 0,
-	       offsetof(struct sk_buff, headers_end) -
-		       offsetof(struct sk_buff, headers_start));
+	memset(&skb->headers, 0, sizeof(skb->headers));
 	if (encapsulating) {
 		skb->l4_hash = l4_hash;
 		skb->sw_hash = sw_hash;
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index f19190820e63..b4032e9b130e 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -800,11 +800,10 @@ struct sk_buff {
 	__u8			active_extensions;
 #endif
 
-	/* fields enclosed in headers_start/headers_end are copied
+	/* Fields enclosed in headers group are copied
 	 * using a single memcpy() in __copy_skb_header()
 	 */
-	/* private: */
-	__u32			headers_start[0];
+	struct_group(headers,
 	/* public: */
 
 /* if you move pkt_type around you also must adapt those constants */
@@ -920,8 +919,8 @@ struct sk_buff {
 	u64			kcov_handle;
 #endif
 
-	/* private: */
-	__u32			headers_end[0];
+	); /* end headers group */
+
 	/* public: */
 
 	/* These elements must be at the end, see alloc_skb() for details.  */
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index fc7942c0dddc..5f29c65507e0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -987,12 +987,10 @@ void napi_consume_skb(struct sk_buff *skb, int budget)
 }
 EXPORT_SYMBOL(napi_consume_skb);
 
-/* Make sure a field is enclosed inside headers_start/headers_end section */
+/* Make sure a field is contained by headers group */
 #define CHECK_SKB_FIELD(field) \
-	BUILD_BUG_ON(offsetof(struct sk_buff, field) <		\
-		     offsetof(struct sk_buff, headers_start));	\
-	BUILD_BUG_ON(offsetof(struct sk_buff, field) >		\
-		     offsetof(struct sk_buff, headers_end));	\
+	BUILD_BUG_ON(offsetof(struct sk_buff, field) !=		\
+		     offsetof(struct sk_buff, headers.field));	\
 
 static void __copy_skb_header(struct sk_buff *new, const struct sk_buff *old)
 {
@@ -1004,14 +1002,12 @@ static void __copy_skb_header(struct sk_buff *new, const struct sk_buff *old)
 	__skb_ext_copy(new, old);
 	__nf_copy(new, old, false);
 
-	/* Note : this field could be in headers_start/headers_end section
+	/* Note : this field could be in the headers group.
 	 * It is not yet because we do not want to have a 16 bit hole
 	 */
 	new->queue_mapping = old->queue_mapping;
 
-	memcpy(&new->headers_start, &old->headers_start,
-	       offsetof(struct sk_buff, headers_end) -
-	       offsetof(struct sk_buff, headers_start));
+	memcpy(&new->headers, &old->headers, sizeof(new->headers));
 	CHECK_SKB_FIELD(protocol);
 	CHECK_SKB_FIELD(csum);
 	CHECK_SKB_FIELD(hash);
-- 
2.30.2

