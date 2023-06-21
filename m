Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA89738C06
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F349D10E32B;
	Wed, 21 Jun 2023 16:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1723810E32D
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=KFMiCla2naG7Z7vKPwGKVD4TrVn4emFE0PLxxevs+7o=; b=OU4HmcXWzyUGQD65hDOdwkgu0o
 u74l9DMZxcBXT5V4Z5qLLe5pROXO6krjW5ruc1DT0SkscC1GAv6CUiRHqoT/xZNB+FTYdY7HTZcSC
 1nPv6XnNmEo7hrUJxM01iosMG8Y0Ym2VcY6jvvzCBkvQC7lZJfWEJjt8YGSGMlqEn7izRDRm51hz1
 GMTsyqcMH1J1dyYFMGFeU3Saag7AZyuOX2CkLBm+3ksa29C3VbudjYZzIgY5yxIiJcoHDGi0dytI4
 BSi9r/ik6bNx2dBlS0BKcqh1/yQ1YIwWVl75bC6VUoMpy4h0Khgb2dDFrfbmsM3CyCJYXba2lPTTt
 z9KQ53Ag==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y1-00EjDi-Cc; Wed, 21 Jun 2023 16:46:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 02/13] mm: Add __folio_batch_release()
Date: Wed, 21 Jun 2023 17:45:46 +0100
Message-Id: <20230621164557.3510324-3-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230621164557.3510324-1-willy@infradead.org>
References: <20230621164557.3510324-1-willy@infradead.org>
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
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This performs the same role as __pagevec_release(), ie skipping the
check for batch length of 0.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagevec.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index f582f7213ea5..42aad53e382e 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -127,9 +127,15 @@ static inline unsigned folio_batch_add(struct folio_batch *fbatch,
 	return fbatch_space(fbatch);
 }
 
+static inline void __folio_batch_release(struct folio_batch *fbatch)
+{
+	__pagevec_release((struct pagevec *)fbatch);
+}
+
 static inline void folio_batch_release(struct folio_batch *fbatch)
 {
-	pagevec_release((struct pagevec *)fbatch);
+	if (folio_batch_count(fbatch))
+		__folio_batch_release(fbatch);
 }
 
 void folio_batch_remove_exceptionals(struct folio_batch *fbatch);
-- 
2.39.2

