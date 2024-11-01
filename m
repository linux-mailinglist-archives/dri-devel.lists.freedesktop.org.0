Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BE29B95C0
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 17:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47BA10E9D9;
	Fri,  1 Nov 2024 16:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WFYfnakS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8E10E9D9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 16:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o9wsenaQ3AcpIiJeQpHBb8YYNhX0DwDwcM2h4qRlEQY=; b=WFYfnakSNgP4L62dn4dpHzoQTp
 oTIAJ63pkIHMWhmJYgJvWLh9xLVz9HOXa4LBuzpP5XBmceLm6cvI5r7dVkU5EcQRmOY5IeTHuaYm/
 4TNKjWRHBuyfiDAu8/kQPp6V+t9nEuWFAQ+8z4K9MZ3cP7oKuomzIPHQFyfPKqGXeXWSB36dhiVfD
 THzf0TuFA1d70IFdifNe98fhpGbMcC0vFpxwNMd0tlr/4YM458fGi8ADVhIyt10qbG7yTum3C7VzQ
 zhYhR5aW1QoslBer7qF6dqt6CES3vKwY2ofV0wgYt5C8yn0sJgx7C/kk5t8x+CKEYcaxKivnPAO6b
 yflGv1+Q==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1t6uks-000V38-7H; Fri, 01 Nov 2024 17:44:10 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>,
 Barry Song <baohua@kernel.org>, David Hildenbrand <david@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Lance Yang <ioworker0@gmail.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Subject: [PATCH v4 3/5] mm: move ``get_order_from_str()`` to internal.h
Date: Fri,  1 Nov 2024 13:38:44 -0300
Message-ID: <20241101164313.1073238-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101164313.1073238-2-mcanal@igalia.com>
References: <20241101164313.1073238-2-mcanal@igalia.com>
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

From: Maíra Canal <mairacanal@riseup.net>

In order to implement a kernel parameter similar to ``thp_anon=`` for
shmem, we'll need the function ``get_order_from_str()``.

Instead of duplicating the function, move the function to a shared
header, in which both mm/shmem.c and mm/huge_memory.c will be able to
use it.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 mm/huge_memory.c | 38 +++++++++++++++-----------------------
 mm/internal.h    | 22 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index f92068864469..a6edbd8c4f49 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -958,26 +958,6 @@ static int __init setup_transparent_hugepage(char *str)
 }
 __setup("transparent_hugepage=", setup_transparent_hugepage);
 
-static inline int get_order_from_str(const char *size_str)
-{
-	unsigned long size;
-	char *endptr;
-	int order;
-
-	size = memparse(size_str, &endptr);
-
-	if (!is_power_of_2(size))
-		goto err;
-	order = get_order(size);
-	if (BIT(order) & ~THP_ORDERS_ALL_ANON)
-		goto err;
-
-	return order;
-err:
-	pr_err("invalid size %s in thp_anon boot parameter\n", size_str);
-	return -EINVAL;
-}
-
 static char str_dup[PAGE_SIZE] __initdata;
 static int __init setup_thp_anon(char *str)
 {
@@ -1007,10 +987,22 @@ static int __init setup_thp_anon(char *str)
 				start_size = strsep(&subtoken, "-");
 				end_size = subtoken;
 
-				start = get_order_from_str(start_size);
-				end = get_order_from_str(end_size);
+				start = get_order_from_str(start_size, THP_ORDERS_ALL_ANON);
+				end = get_order_from_str(end_size, THP_ORDERS_ALL_ANON);
 			} else {
-				start = end = get_order_from_str(subtoken);
+				start_size = end_size = subtoken;
+				start = end = get_order_from_str(subtoken,
+								 THP_ORDERS_ALL_ANON);
+			}
+
+			if (start == -EINVAL) {
+				pr_err("invalid size %s in thp_anon boot parameter\n", start_size);
+				goto err;
+			}
+
+			if (end == -EINVAL) {
+				pr_err("invalid size %s in thp_anon boot parameter\n", end_size);
+				goto err;
 			}
 
 			if (start < 0 || end < 0 || start > end)
diff --git a/mm/internal.h b/mm/internal.h
index d5b93c5b6364..5a7302baeed7 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1291,6 +1291,28 @@ static inline bool alloc_zeroed(void)
 			&init_on_alloc);
 }
 
+/*
+ * Parses a string with mem suffixes into its order. Useful to parse kernel
+ * parameters.
+ */
+static inline int get_order_from_str(const char *size_str,
+				     unsigned long valid_orders)
+{
+	unsigned long size;
+	char *endptr;
+	int order;
+
+	size = memparse(size_str, &endptr);
+
+	if (!is_power_of_2(size))
+		return -EINVAL;
+	order = get_order(size);
+	if (BIT(order) & ~valid_orders)
+		return -EINVAL;
+
+	return order;
+}
+
 enum {
 	/* mark page accessed */
 	FOLL_TOUCH = 1 << 16,
-- 
2.46.2

