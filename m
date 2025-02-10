Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95AA2F8EB
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:39:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7410E610;
	Mon, 10 Feb 2025 19:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VmY90EVe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6554B10E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNpxFEEEyxoH6lwF3K+DQE9+aA/s7jzY02gjXCRiBPg=;
 b=VmY90EVeuasymwo09mvaugZJVMt9XXNThXA2SNv5uzXii4d/djlwCwTyODIE6ja4L8CGzV
 B+D9OxHu7vyGm82L0J4kvuIfpk0aytE67PZsfz52BD5QVE9H8hZr65iLSgf756ORxVDG7E
 rFsd+L6rOqyNZa96f8zY/JRVVADuOhM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-j_cJ3bUaNw6Pw3kDVQRNCg-1; Mon, 10 Feb 2025 14:39:03 -0500
X-MC-Unique: j_cJ3bUaNw6Pw3kDVQRNCg-1
X-Mimecast-MFC-AGG-ID: j_cJ3bUaNw6Pw3kDVQRNCg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-38de0201875so611359f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216342; x=1739821142;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNpxFEEEyxoH6lwF3K+DQE9+aA/s7jzY02gjXCRiBPg=;
 b=aWEE4zfS4gkNE5Q1fYDnXz2O0ZGcpyXWKVWJI+FSGaMVhzDh9FDel8U3hM7m7FxyCh
 5i661T8sMS3/U6ZZTq+Rz2r6yCgVe7V9+3KbgozS8ZaRgIvS1px2Xca2eAUl+UuUsdEx
 4Oqy+RkaBuiwuNbfy3U/gakFuH4qjQrfCuLAjTSigmtGe3sflOdGE/kpYnV9OE9I2L1D
 K5PnVrPzh0Ye4ZIIzcPL4Mpypkp2Etv+8mkQo5MbHazvJ8i/kkvjoZQuac95hak8FNfU
 N88geki5+W41r/Z83BumCL3a0m32n7RByamoQs+LP3M27s4NGCpfID1pVH6de8wsgKrU
 6szA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyQYhi0t2VerOxtEDjdzX26y/wYYrDTxchBmEo2pZzR3cE3ui3lvRAMkqDubayZ3GSSHQe+3CPTEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxsEWJAoNzaBCDpfPmXaLbPMxqZxdgfb3eX/CCgXc56Gb8jH+V
 4f2dJi50UH1l3q4pV4Ib/Kl4YmAjmR/MZloy8QhHQTxKZ0HrSN9lDoWe0cSQaPe5jXgCIauO/ek
 MT8OrNvljJMTHd/OAZleDpOLYwDEW4q0pN7Qiz+Nf29/Hfk7cEa5v4EiqwoPEqd5kxg==
X-Gm-Gg: ASbGncttUd9xWJLPf0JjAavPJv5HjUgy00PT3ut8rYsgUrTP7ZTazhIlF00+AQhnDkW
 ibVGHIL8yOICWgu96S/Je7jBPoHS7q6mTlJwqkzEOOdc+Qy6ugohpcbxWGs2527QgFNLMPPRJFn
 yNW3baOGNxwz3wvnDBivRwyB9x6wYYLCyyOKjTSr2U9c8sE9iH0wBVAPa1N60OLgr1AmXqqA5xZ
 y989yKH5Y8TKSAC2j7lDPuKjnKRpdaiZXs3zvK/anu+zLdjvhnUfMumaWSpviIhoyK60kO/Z7WA
 oI9hdN/y8rw9x6c11BmdEgt/zUMWR3g7F6ynjn77yGVbqn0G12Ihlwlb6Wk1IPo3AA==
X-Received: by 2002:a05:6000:1813:b0:38a:418e:21c7 with SMTP id
 ffacd0b85a97d-38dc935246fmr8277016f8f.53.1739216342060; 
 Mon, 10 Feb 2025 11:39:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTiiTPkwAyfuLx0qL+LO6PapdaXuVNjUwBeGg/Z0ah/0RffyIckymQJ3LkKa1NUzxInLX6yQ==
X-Received: by 2002:a05:6000:1813:b0:38a:418e:21c7 with SMTP id
 ffacd0b85a97d-38dc935246fmr8276996f8f.53.1739216341643; 
 Mon, 10 Feb 2025 11:39:01 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dc4d00645sm11916376f8f.66.2025.02.10.11.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:39:00 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 damon@lists.linux.dev, David Hildenbrand <david@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, SeongJae Park <sj@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Peter Xu <peterx@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 15/17] mm/damon: handle device-exclusive entries correctly
 in damon_folio_mkold_one()
Date: Mon, 10 Feb 2025 20:37:57 +0100
Message-ID: <20250210193801.781278-16-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -cMXjYWL6dlpxVmyIpOs4FPYbqnsOwB_moIA1_txc-4_1739216342
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

Ever since commit b756a3b5e7ea ("mm: device exclusive memory access")
we can return with a device-exclusive entry from page_vma_mapped_walk().

damon_folio_mkold_one() is not prepared for that and calls
damon_ptep_mkold() with PFN swap PTEs. Teach damon_ptep_mkold() to deal
with these PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, as damon_get_folio() filters out non-lru
folios.

Should we just skip PFN swap PTEs completely? Possible, but it seems
straight forward to just handle it correctly.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/damon/ops-common.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index d25d99cb5f2bb..86a50e8fbc806 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -9,6 +9,8 @@
 #include <linux/page_idle.h>
 #include <linux/pagemap.h>
 #include <linux/rmap.h>
+#include <linux/swap.h>
+#include <linux/swapops.h>
 
 #include "ops-common.h"
 
@@ -39,12 +41,29 @@ struct folio *damon_get_folio(unsigned long pfn)
 
 void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr)
 {
-	struct folio *folio = damon_get_folio(pte_pfn(ptep_get(pte)));
+	pte_t pteval = ptep_get(pte);
+	struct folio *folio;
+	bool young = false;
+	unsigned long pfn;
+
+	if (likely(pte_present(pteval)))
+		pfn = pte_pfn(pteval);
+	else
+		pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
 
+	folio = damon_get_folio(pfn);
 	if (!folio)
 		return;
 
-	if (ptep_clear_young_notify(vma, addr, pte))
+	/*
+	 * PFN swap PTEs, such as device-exclusive ones, that actually map pages
+	 * are "old" from a CPU perspective. The MMU notifier takes care of any
+	 * device aspects.
+	 */
+	if (likely(pte_present(pteval)))
+		young |= ptep_test_and_clear_young(vma, addr, pte);
+	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
+	if (young)
 		folio_set_young(folio);
 
 	folio_set_idle(folio);
-- 
2.48.1

