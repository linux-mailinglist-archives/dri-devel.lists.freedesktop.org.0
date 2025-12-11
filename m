Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7B5CB7012
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 20:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C61410E822;
	Thu, 11 Dec 2025 19:31:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BqUEgWab";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E6210E862
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 19:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765481510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9fNQS7Ht+smYBEt8qQi15gMY9oRc7YfucqsNSafaVMY=;
 b=BqUEgWabxwUfyoNR4Ssc4w+RzJ3si6DqcjWpwT2ldhvaghsvvAe6IJLEsVtaK1ynw6GrSQ
 c/0Dky58d51S7UYh7gkTLCKTDkGulMjrQDbupgfZHufrH76DJxVs7gacLufY4S/N89w+iQ
 FCvGzQ+uMAATsQWVv+KMLVCmbEQzuQg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-CzlPbdIjNMKubdaxq_qscw-1; Thu, 11 Dec 2025 14:31:49 -0500
X-MC-Unique: CzlPbdIjNMKubdaxq_qscw-1
X-Mimecast-MFC-AGG-ID: CzlPbdIjNMKubdaxq_qscw_1765481509
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b22d590227so74976385a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 11:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765481509; x=1766086309;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9fNQS7Ht+smYBEt8qQi15gMY9oRc7YfucqsNSafaVMY=;
 b=tW+3m6NYqZiVCYN/RMH3AZW7lPpiW+XtwZhB0SPgirUk3l5oE/QqP4riZ7yF8J4kNB
 sLoKlJHnicv0Nf1GJf2aDIhXh31lUsVH2n213aM9OP5CRkRLvT0BioVRGW3wlEnZTJPU
 iFl1jq5o5wk+JQiZ72o0g1e7VCvto+cQV6dOOxzWXccTTLZoKuqAmzR70mbHrDVWNbTW
 gVMs71nwsJlBlCT9wv2b2hBYmO/vTerikUkrD1sflc7G53u7CkAgmfNbIl5WGz140yfY
 myz34xald39DEDwPbfXNq9W5oEbjaz92rbUIDXZ/0trKut9JkrKuwnPp+ji8H7y2G2os
 EHQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZJQXasYmfu6XI5o3ECv1wB6e4tQxqaZfa8Goj+rFnihhob+LWHx06N+6YkRdajK/aZbU0873d4+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1WEyEvJlIR/VRrlWH/UnQPta+487LUDorh2tc5onkj3mJo5ai
 FG34IYL6RB9YoVHfqeBBdZfJBMADtpChDp434x4NffkHYC0253jVzk2l/BXjbWF1gULetZ3eX3q
 s6fxTfI7wwCoxiFy6Z9sS1gszBfEbU/idUKdJ/4joZz4AIQO3pYZ5fYn+YUtrOa7hoYAtkg==
X-Gm-Gg: AY/fxX4DsVXAQ/xZt5wRD5/OOgK3fS97H+KgrBvPAuSJzcVCz8jQs0qgrVToaUDwMp0
 t1RfXWfV0YhW0hKmiPHdvW9Ev6ibzMXF4WQF2JX4T64nDyEg5AIp9vw0C7dHQF1cobElgTVN+KE
 SsjuqBiUZkcr8HtYzrg8fZiIYqPOvShJtqocpiPbRTMOKdCTDGRMLopFqcaxtqgL7CdsnTuz6qE
 EilkkoDJ/m/EfLjt1Oc2MF4czjwaXxrgp+BuIzbkPYUsgA4CecmdW+qDeda1GaRzeZSHElMWRqk
 vanDesj21N83VYDpbJFbhsK2Wn61EtSA34W9ruTCvdmRKLVnGRyR9kXhPCHLXIdnN64Svi2V491
 Yka6XmpOZRZ2DouKsX5RYvMfxGS/hj9NnZBjBQK9qPpRl2wLTBsJs+g==
X-Received: by 2002:a05:620a:190d:b0:8b2:2607:83d5 with SMTP id
 af79cd13be357-8ba3b20cc7amr1086241285a.75.1765481508574; 
 Thu, 11 Dec 2025 11:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjxv4hC6ptOgdZUS2F0ohaHHF/DSOrKZqK5mzPaPV5p8p12y+Xs+J8IIFSF5PnIj57uqbRqw==
X-Received: by 2002:a05:620a:190d:b0:8b2:2607:83d5 with SMTP id
 af79cd13be357-8ba3b20cc7amr1086234585a.75.1765481507972; 
 Thu, 11 Dec 2025 11:31:47 -0800 (PST)
Received: from localhost (pool-100-17-22-234.bstnma.fios.verizon.net.
 [100.17.22.234]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8bab5452ec6sm292782685a.1.2025.12.11.11.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Dec 2025 11:31:47 -0800 (PST)
From: Eric Chanudet <echanude@redhat.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Maxime Ripard <mripard@redhat.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Eric Chanudet <echanude@redhat.com>
Subject: [PATCH] dma-buf: system_heap: account for system heap allocation in
 memcg
Date: Thu, 11 Dec 2025 14:31:07 -0500
Message-ID: <20251211193106.755485-2-echanude@redhat.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LUosLUOoomkSl9W8X_57ljxuN559QDjytOqzNOkw7FI_1765481509
X-Mimecast-Originator: redhat.com
Content-type: text/plain
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

The system dma-buf heap lets userspace allocate buffers from the page
allocator. However, these allocations are not accounted for in memcg,
allowing processes to escape limits that may be configured.

Pass the __GFP_ACCOUNT for our allocations to account them into memcg.

Userspace components using the system heap can be constrained with, e.g:
  systemd-run --user --scope -p MemoryMax=10M ...

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
 drivers/dma-buf/heaps/system_heap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
index 4c782fe33fd4..c91fcdff4b77 100644
--- a/drivers/dma-buf/heaps/system_heap.c
+++ b/drivers/dma-buf/heaps/system_heap.c
@@ -38,10 +38,10 @@ struct dma_heap_attachment {
 	bool mapped;
 };
 
-#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
+#define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO | __GFP_ACCOUNT)
 #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
 				| __GFP_NORETRY) & ~__GFP_RECLAIM) \
-				| __GFP_COMP)
+				| __GFP_COMP | __GFP_ACCOUNT)
 static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
 /*
  * The selection of the orders used for allocation (1MB, 64K, 4K) is designed
-- 
2.52.0

