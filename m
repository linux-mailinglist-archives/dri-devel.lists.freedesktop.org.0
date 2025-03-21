Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02584A6B9CE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 12:25:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32CD10E7A9;
	Fri, 21 Mar 2025 11:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VW6ow3+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286CA10E7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742556313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ULjzTuWq4KWWMz5FWBM7gDBkyDsf2B5DDVUjmTkqks=;
 b=VW6ow3+bJS8wJN4OPfvkTvSydmBnJ7bwEZmQPYoOURqv5Wkc7E4CTmVPs5iJdSetO4jd+s
 3ZXI992sFehgpxjQtBZDM9pMQ+FY9c0J2ZBdG0ciN8zkh2T3/yaIQwgIac827NwoZcQOYl
 FOj1QXavvQRAz1UP98+0QcgIqf3P/hs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-203-sWdaQcbIMZuU33p4OBIaMQ-1; Fri,
 21 Mar 2025 07:25:09 -0400
X-MC-Unique: sWdaQcbIMZuU33p4OBIaMQ-1
X-Mimecast-MFC-AGG-ID: sWdaQcbIMZuU33p4OBIaMQ_1742556307
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2CD581945103; Fri, 21 Mar 2025 11:25:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.44.34.21])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A5F87180175B; Fri, 21 Mar 2025 11:25:01 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ryosuke Yasuoka <ryasuoka@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 John Ogness <john.ogness@linutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: [PATCH v2 1/2] mm/kmap: Add kmap_local_page_try_from_panic()
Date: Fri, 21 Mar 2025 12:16:55 +0100
Message-ID: <20250321112436.1739876-2-jfalempe@redhat.com>
In-Reply-To: <20250321112436.1739876-1-jfalempe@redhat.com>
References: <20250321112436.1739876-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

kmap_local_page() can be unsafe to call from a panic handler, if
CONFIG_HIGHMEM is set, and the page is in the highmem zone.
So add kmap_local_page_try_from_panic() to handle this case.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 include/linux/highmem-internal.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/highmem-internal.h b/include/linux/highmem-internal.h
index dd100e849f5e0..5d089b0ca56de 100644
--- a/include/linux/highmem-internal.h
+++ b/include/linux/highmem-internal.h
@@ -73,6 +73,13 @@ static inline void *kmap_local_page(struct page *page)
 	return __kmap_local_page_prot(page, kmap_prot);
 }
 
+static inline void *kmap_local_page_try_from_panic(struct page *page)
+{
+	if (!PageHighMem(page))
+		return page_address(page);
+	return NULL;
+}
+
 static inline void *kmap_local_folio(struct folio *folio, size_t offset)
 {
 	struct page *page = folio_page(folio, offset / PAGE_SIZE);
@@ -180,6 +187,11 @@ static inline void *kmap_local_page(struct page *page)
 	return page_address(page);
 }
 
+static inline void *kmap_local_page_try_from_panic(struct page *page)
+{
+	return page_address(page);
+}
+
 static inline void *kmap_local_folio(struct folio *folio, size_t offset)
 {
 	return page_address(&folio->page) + offset;
-- 
2.47.1

