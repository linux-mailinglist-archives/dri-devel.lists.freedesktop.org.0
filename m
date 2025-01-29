Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B1A21CD1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F0F10E7F1;
	Wed, 29 Jan 2025 11:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i4V+ikB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02BC10E7D9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IvULs1yE7EOmGau/Ggivq4i0htACtoQXWVK4/nOi/M8=;
 b=i4V+ikB2Gk5mBT1ntGNVcNrB8GGm/iQdKYp3hzkcgqOAZoBvTu2NU4E7txnmdd1a5wJikT
 npgDh1aaT+RnJVMxs48IAG3iTGUqKhLf0ebcrJCMa+JksyRR/4TaW/0HCsiKoa4pgTTlkm
 1s9BVr5u6oxTsLASo8Vsa++UtvJYUvw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-mBQMddaePdSfIF50QVjJgw-1; Wed, 29 Jan 2025 06:58:11 -0500
X-MC-Unique: mBQMddaePdSfIF50QVjJgw-1
X-Mimecast-MFC-AGG-ID: mBQMddaePdSfIF50QVjJgw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361a8fc3bdso32545265e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:58:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151890; x=1738756690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IvULs1yE7EOmGau/Ggivq4i0htACtoQXWVK4/nOi/M8=;
 b=AuQ/khZW56kIgG343AefVxTDiDLkWy+fYg4ffw9tH6golD0sabQXIMNT2qsyUdGL7J
 HIj02xJgCLzzSI8GkfB/Xxpf1lNy05KFHOfF8ric2qNGo/muC2T9aGX7w9U4CEicr7cu
 DcMnuMffXiXuqAygWy9UMx/53IwZAbwxBkNRnYhOQkF+S84C0K6vGDUUApqD2BhoE8Ie
 Unmzjn9q6kOgBHuk9TWSSHXeUikGCBTVvnGayXGLWAZRXgOQQ/K8gDKkoXVg5QbntFBm
 Bt9FD8MgMz/o+78uUwbTjltr3fa1mzc37PrYQnYzKNDAtBzBfpzrE/GV9jsj5FmXLK7R
 9Abg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMZlSRK0XFepgKLnMMtnGU+IFs4u+pd8Yf1WoIRpf4CIbkCOt/HsoLdw43weY24aCLu5P/tr3rUA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy+wal2ntNblRbrNhJaQ9mr/ehtQMkmjI8YXwXDj7FhoSAVYruq
 520yMt482bHjdwxnLKDgNebJMdAFhHsySOPC0lHVL6Ht/o/t1NxVU9cPxpUdHS2PFQotkSfroXR
 dSjZ3tGGlzEWtvHGC+Eu/ERU1Rz9YQmQ/FRIEJTI2LofOwROM/qpYJOvPNwlWYnZA4g==
X-Gm-Gg: ASbGncvE1aOHOB7ShyNt25EL26bwa8UFHiEeyHwCKOOznWb+7o/PCxzsbtdHMVAEm1F
 ZgskhGDq5uGTfSioWxsrZiNT2KKbFQjJZiZK/8hcUVn0C3y19LDrQw9WvX54eZvAjrfQ+teKStw
 MGfkuz/PgMXqE7sNsT0abaf/3Tw1gLCrm9q9tv4z5dG3I/CSt5kwZws4JNKUSYKcDm4tDW221vn
 l8CdzLWqkRm1wP4NFXcTQkqRYti811lMmuxrSJOxOE3I7fHWf+KtSn6yMXk1xBho50FO47goyb3
 dWT6L7qdYvuegk35s+dYf/DbpG4pJynuYT9mk8JWSE9hFT35tCqzStKl+5clXKVZCw==
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id
 5b1f17b1804b1-438dc3ca802mr23864075e9.13.1738151890432; 
 Wed, 29 Jan 2025 03:58:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqM74m4ZV9IsBXW9SIKcsLoOPVNY/fxsU8Okkl94/EsEQHDya1iNUyBhUuUArF4/LgH5tlYg==
X-Received: by 2002:a05:600c:5252:b0:431:6153:a258 with SMTP id
 5b1f17b1804b1-438dc3ca802mr23863905e9.13.1738151890101; 
 Wed, 29 Jan 2025 03:58:10 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-438dcc12f88sm20420515e9.2.2025.01.29.03.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:58:08 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v1 1/4] lib/test_hmm: make dmirror_atomic_map() consume a
 single page
Date: Wed, 29 Jan 2025 12:57:59 +0100
Message-ID: <20250129115803.2084769-2-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115803.2084769-1-david@redhat.com>
References: <20250129115803.2084769-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hpmg-MlxmI1SfPJxbScNi_YpjVRbCF3ZNCkChkCI9Sg_1738151890
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The caller now always passes a single page; let's simplify, and return
"0" on success.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 lib/test_hmm.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9e1b07a227a3..1c0a58279db9 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -706,34 +706,23 @@ static int dmirror_check_atomic(struct dmirror *dmirror, unsigned long start,
 	return 0;
 }
 
-static int dmirror_atomic_map(unsigned long start, unsigned long end,
-			      struct page **pages, struct dmirror *dmirror)
+static int dmirror_atomic_map(unsigned long addr, struct page *page,
+		struct dmirror *dmirror)
 {
-	unsigned long pfn, mapped = 0;
-	int i;
+	void *entry;
 
 	/* Map the migrated pages into the device's page tables. */
 	mutex_lock(&dmirror->mutex);
 
-	for (i = 0, pfn = start >> PAGE_SHIFT; pfn < (end >> PAGE_SHIFT); pfn++, i++) {
-		void *entry;
-
-		if (!pages[i])
-			continue;
-
-		entry = pages[i];
-		entry = xa_tag_pointer(entry, DPT_XA_TAG_ATOMIC);
-		entry = xa_store(&dmirror->pt, pfn, entry, GFP_ATOMIC);
-		if (xa_is_err(entry)) {
-			mutex_unlock(&dmirror->mutex);
-			return xa_err(entry);
-		}
-
-		mapped++;
+	entry = xa_tag_pointer(page, DPT_XA_TAG_ATOMIC);
+	entry = xa_store(&dmirror->pt, addr >> PAGE_SHIFT, entry, GFP_ATOMIC);
+	if (xa_is_err(entry)) {
+		mutex_unlock(&dmirror->mutex);
+		return xa_err(entry);
 	}
 
 	mutex_unlock(&dmirror->mutex);
-	return mapped;
+	return 0;
 }
 
 static int dmirror_migrate_finalize_and_map(struct migrate_vma *args,
@@ -803,9 +792,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
 			break;
 		}
 
-		ret = dmirror_atomic_map(addr, addr + PAGE_SIZE, &page, dmirror);
-		if (!ret)
-			ret = -EBUSY;
+		ret = dmirror_atomic_map(addr, page, dmirror);
 		folio_unlock(folio);
 		folio_put(folio);
 
-- 
2.48.1

