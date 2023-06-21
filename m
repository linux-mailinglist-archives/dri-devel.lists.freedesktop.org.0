Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9016738BEA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FAF10E319;
	Wed, 21 Jun 2023 16:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A7B10E326
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5w9pZnjuH0cui0+bbF2YOmmpAFWEgjcRmo7ue1AvTtQ=; b=jUfm5Cn2cwJWNOM2prgSqprGkR
 LmBwKRhuxKAUtr8BE0MWy123wKScLJoAtBpp0gWtFk3qBzdvXx83AHH41KrVC1zrHidgkWPuXbrUN
 WfjD0ZrDlse8jhsHm3mVGDt2m2kicLbSXaIYsdsLwQGBh+zoXbupr5MgiE7h5bsNCA2miJz2l/Fzn
 JGs/PkNFCac9dJLJDLKFksQrmKWOn8+imY/f0PkCnuqNBHAGKE/4jhmFP0h25e/UcAXoK54snBzmr
 ASDFZdUINRldKxUu0XLKMVMG+6bqx2IQgdu4zsWwH2B//OzYxwHJGhCgXv+2qTr4vXqFF+Ng3qqub
 1asVHOzQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y1-00EjE6-T3; Wed, 21 Jun 2023 16:46:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 07/13] pagevec: Rename fbatch_count()
Date: Wed, 21 Jun 2023 17:45:51 +0100
Message-Id: <20230621164557.3510324-8-willy@infradead.org>
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

This should always have been called folio_batch_count().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagevec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pagevec.h b/include/linux/pagevec.h
index 42aad53e382e..3a9d29dd28a3 100644
--- a/include/linux/pagevec.h
+++ b/include/linux/pagevec.h
@@ -105,7 +105,7 @@ static inline unsigned int folio_batch_count(struct folio_batch *fbatch)
 	return fbatch->nr;
 }
 
-static inline unsigned int fbatch_space(struct folio_batch *fbatch)
+static inline unsigned int folio_batch_space(struct folio_batch *fbatch)
 {
 	return PAGEVEC_SIZE - fbatch->nr;
 }
@@ -124,7 +124,7 @@ static inline unsigned folio_batch_add(struct folio_batch *fbatch,
 		struct folio *folio)
 {
 	fbatch->folios[fbatch->nr++] = folio;
-	return fbatch_space(fbatch);
+	return folio_batch_space(fbatch);
 }
 
 static inline void __folio_batch_release(struct folio_batch *fbatch)
-- 
2.39.2

