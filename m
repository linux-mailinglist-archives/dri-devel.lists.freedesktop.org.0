Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8DAA21CAD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C02510E7D6;
	Wed, 29 Jan 2025 11:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hIpLnsqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BC310E7CF
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8FdUGdC2w/N5TeOcJ3tL/h1ogRWBFVvHy4t3b3m6isA=;
 b=hIpLnsqD5RbDU8gw0WGmPPyfiIak/MxLjmueg0GlNudyinRIKdeyXdoeBzP8T/S5FY8jRP
 bsk7YaIEj60jfF+hUeWx/lHDtFZjuc030VsLFF4s3IzrLB28o660Wgey2nxtDQrMJEcZYN
 SbDZWpLXGxYPz/D491Io2+TH7dvuSfc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-EQM04Qk_MwiBLo4Yv2BHCg-1; Wed, 29 Jan 2025 06:54:50 -0500
X-MC-Unique: EQM04Qk_MwiBLo4Yv2BHCg-1
X-Mimecast-MFC-AGG-ID: EQM04Qk_MwiBLo4Yv2BHCg
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385e49efd59so2588089f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151689; x=1738756489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FdUGdC2w/N5TeOcJ3tL/h1ogRWBFVvHy4t3b3m6isA=;
 b=wU83P2fiGpEP6WgkZ3KIBcbWW1DXTJ95C8eCzN3RrFV2CMII/Z0Z2MuKuYn+A+Se53
 ic7awSP57DwSMlY2cWh1UELPATiCqT3xECvcyJjSzqplvWXHNeh1tnm+84TiEsIPg4i+
 cvbfG6tqDdUw4/pI5mDyhsc/i8N93oqWn4i0QarDP0PWcArCeQIYi8RpIHeLIwHF+YoS
 ZRjbWhpnrXL3vcafuVGFLZjP1b3unIM2MJZIv95mv+augmdQ75iXxTq3V4eSAGVuqWpM
 IQluQxA7ixyCP+hk1vlJ2OH3wQSxYcnt8YU0qHG+fsxTBvi4gVjI+KYzWYcwlCFK/T0H
 5l2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo2Qt1NwDGtu+cdTLOGVYZS0UBuMmPwYeUyLx6UWXFQtbWg+T/KTdYwyjaOY9sFGXBgr61haN/T8U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4GqKG1X+h580hsKkExdAQzVlYQD5eRAh2jBWcrmT8bMf9d+1p
 BE3YUGe3RXJsPa7M+Gh5tuMaYMlxqz/FJ6Hxmlz5xQXxLtcLXxp7qy9cvUxQmr2OaF1XjczMIO6
 kfw9/lIR1FXJygvRPLVdohlIlNIkjkRKXHlVNL0XF38+Y6dhdZ30/6A3KAoKkhFS5mQ==
X-Gm-Gg: ASbGncvA63WzEO40jDtQiY9H4UZGEq8H2HkMm7nVO2kOo5sAbPMyudQW58KXixv0TBr
 CCHNE70iXxvnLl7C3xIV1AypRVG/+9lFFpe0jBZGVbyYCmCEHndnHSN9bizL7fgx5SfZR0u+vJz
 nGpF15Q9C7YoU0makTIn9YIIOMv66yGacA9kTvQGPU3OTu/qf1pJFc4JOVGZkwxypxwKSrX+HwP
 Cpy4WlO4p/LFZSOGQh/hdYAj927OHFwBok+yXpVZlqG3ZX69yz/gt2zcwoZkGSt3BTPFrGxPbYe
 B2DJpkhL8ReERrPKrYvtRZpJUsw7cveUUmSnwUjhztiwBNoyvecaw0/TWupoVmmiwQ==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38c520bdb45mr1846662f8f.46.1738151688840; 
 Wed, 29 Jan 2025 03:54:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQObdLJ4S/sxdMO/dY9vI6fd5p4fQOJgmwgX26yitgXbCNTkIYH7aPDZgCkfY36quLJ2o2xA==
X-Received: by 2002:a5d:5384:0:b0:38a:8ed1:c5c7 with SMTP id
 ffacd0b85a97d-38c520bdb45mr1846636f8f.46.1738151688502; 
 Wed, 29 Jan 2025 03:54:48 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1c4006sm17020800f8f.94.2025.01.29.03.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:47 -0800 (PST)
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
Subject: [PATCH v1 12/12] mm/rmap: keep mapcount untouched for
 device-exclusive entries
Date: Wed, 29 Jan 2025 12:54:10 +0100
Message-ID: <20250129115411.2077152-13-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GHvMRhgyFMedG79_pPXAvmP-UjBv0ZKad4hyNU2pgBY_1738151689
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

Now that conversion to device-exclusive does no longer perform an
rmap walk and the main page_vma_mapped_walk() users were taught to
properly handle nonswap entries, let's treat device-exclusive entries just
as if they would be present, similar to how we handle device-private
entries already.

This fixes swapout/migration of folios with device-exclusive entries.

Likely there are still some page_vma_mapped_walk() callers that are not
fully prepared for these entries, and where we simply want to refuse
!pte_present() entries. They have to be fixed independently; the ones in
mm/rmap.c are prepared.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 17 +----------------
 mm/rmap.c   |  7 -------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index db38d6ae4e74..cd689cd8a7c8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -743,20 +743,6 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-
-	/*
-	 * No need to take a page reference as one was already
-	 * created when the swap entry was made.
-	 */
-	if (folio_test_anon(folio))
-		folio_add_anon_rmap_pte(folio, page, vma, address, RMAP_NONE);
-	else
-		/*
-		 * Currently device exclusive access only supports anonymous
-		 * memory so the entry shouldn't point to a filebacked page.
-		 */
-		WARN_ON_ONCE(1);
-
 	set_pte_at(vma->vm_mm, address, ptep, pte);
 
 	/*
@@ -1628,8 +1614,7 @@ static inline int zap_nonpresent_ptes(struct mmu_gather *tlb,
 		 */
 		WARN_ON_ONCE(!vma_is_anonymous(vma));
 		rss[mm_counter(folio)]--;
-		if (is_device_private_entry(entry))
-			folio_remove_rmap_pte(folio, page, vma);
+		folio_remove_rmap_pte(folio, page, vma);
 		folio_put(folio);
 	} else if (!non_swap_entry(entry)) {
 		/* Genuine swap entries, hence a private anon pages */
diff --git a/mm/rmap.c b/mm/rmap.c
index 9e2002d97d6f..4acc9f6d743a 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2495,13 +2495,6 @@ struct page *make_device_exclusive(struct mm_struct *mm, unsigned long addr,
 	/* The pte is writable, uffd-wp does not apply. */
 	set_pte_at(mm, addr, fw.ptep, swp_pte);
 
-	/*
-	 * TODO: The device-exclusive non-swap PTE holds a folio reference but
-	 * does not count as a mapping (mapcount), which is wrong and must be
-	 * fixed, otherwise RMAP walks don't behave as expected.
-	 */
-	folio_remove_rmap_pte(folio, page, vma);
-
 	folio_walk_end(&fw, vma);
 	*foliop = folio;
 	return page;
-- 
2.48.1

