Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143F2A2F8E8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BDA10E606;
	Mon, 10 Feb 2025 19:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CZkQNQrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F343910E60D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwHnciP+OvnJG9alUSG9/jEypyVF3ZPTXQLV9dVcfyg=;
 b=CZkQNQrRfqD+5YnQBoBIPYgyEVsYSEbck7n4/ustTgOVVyqS59yTP5+qY5RuvKkbRJz06x
 0crT+MLBWzzvyfQtc8kP29e8XMwUVKgdEOXde93lQEoeXHyCWmTNuw7FZ4R5RWskTIH8N1
 z2hRcLYthURePD6/jWXU2l7NXBd6FsQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-rJL80PNYP9eDAU1cWKl3mw-1; Mon, 10 Feb 2025 14:38:55 -0500
X-MC-Unique: rJL80PNYP9eDAU1cWKl3mw-1
X-Mimecast-MFC-AGG-ID: rJL80PNYP9eDAU1cWKl3mw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38dc6aad9f8so1835253f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216334; x=1739821134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mwHnciP+OvnJG9alUSG9/jEypyVF3ZPTXQLV9dVcfyg=;
 b=BPUDODngu3TqyjRwLGw9iRRhm/KPQvIZy4+Rqe/U4PFv1IIYDmwoh4e3LB6fxmRMq2
 /RR07AAFUDX8SXg2n1cupZi1M2noN5H7JXo3U38ajntu0FAx4eEN/AH1OhqZSLDp2mJH
 EEc4DcZKuIl07YCMt7kLgyMq1bGlSL7MsOTB+oMB8dNx/mT6MuVsPih1b3YMPtF8imfi
 x3x7ZSbi33YtpHWqe5N74xKcDHv5HtoPXlbqBNTd1FHL+VCG9Q3RiNq5esYKRenWb5+s
 yIImcYjQEPoNpmxkg8Bp49hX+G3Cf+7WILjN1G0DCySjuQ7iZY5mdCEIeLdFtUDgAq/1
 jo/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGkZTW7mFKYznfxBa14muDuz1hai0ocI2mGC7sDj+osPKx0YhAmJE3F8MQ7a1pmAJj1kuYYa05VB4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcUb4eyCLz9RryG1YxmfIPxABX6gy0GUISOaPbskSXyhbgg1lF
 4+sk88uWI+WdcZJGb7c6+miSIUTX1AHB43xjOQjUAaI7JKyKrVulmGozEeRPKKr9YfiwSQS7tPT
 IOM515ZL5MWoyOJDDHQJ7zJ40eICO1kAZVDsskMIoV8KyQKP56DFLHbtcPYHuwxOa8A==
X-Gm-Gg: ASbGncurx4m34vmq2mnhaTs3oOEjWu6NzTPsue9tNvdiCb/wBxrVPS+9HfHidSJIQa+
 B5XfLICUzvhkyzTIt2hC1uDE/OjJ15scXOopJPmW5s8O1SfjW+AR9Fwq9dLQM9B3UyCd1Ww8e/1
 lA8sf12q/KzDze3wqrgKDoCrf1KD+sXFKQpQrwsd4lv/NJqAPI1J4xuxkHHQUQBGDhIe+3Jbjxz
 Egy05+CN3VfSI3uJ9hkTURAPc1D2jOUiUYPdXq29bv1YY3Lyimm8o4rCX/waOnMYWx2hAxBiPjc
 K1sps7rGuR1wQFVMhzG04S0fONmPfsBSXyQyawQU3cAnxFcNsHeXFySa5WINA96w4A==
X-Received: by 2002:a5d:5f42:0:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-38de432d90fmr568613f8f.0.1739216333902; 
 Mon, 10 Feb 2025 11:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ8jI3Pr0PhgIrX5XFi88nBpwoaMc1TLFqexlyUt/iDFsCN9k6Hzlrlovdfu0/+3mYproMTQ==
X-Received: by 2002:a5d:5f42:0:b0:38d:df15:2770 with SMTP id
 ffacd0b85a97d-38de432d90fmr568579f8f.0.1739216333460; 
 Mon, 10 Feb 2025 11:38:53 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390db11200sm187831345e9.38.2025.02.10.11.38.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:52 -0800 (PST)
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
Subject: [PATCH v2 13/17] mm/page_idle: handle device-exclusive entries
 correctly in page_idle_clear_pte_refs_one()
Date: Mon, 10 Feb 2025 20:37:55 +0100
Message-ID: <20250210193801.781278-14-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Hx-dz81knxEPL-T54C6BCxzkXQ_Xn5zVzjZ64yycCk_1739216334
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

page_idle_clear_pte_refs_one() is not prepared for that, so let's
teach it what to do with these PFN swap PTEs. Note that device-private
entries are so far not applicable on that path, as page_idle_get_folio()
filters out non-lru folios.

Should we just skip PFN swap PTEs completely? Possible, but it seems
straight forward to just handle them correctly.

Note that we could currently only run into this case with
device-exclusive entries on THPs. We still adjust the mapcount on
conversion to device-exclusive; this makes the rmap walk
abort early for small folios, because we'll always have
!folio_mapped() with a single device-exclusive entry. We'll adjust the
mapcount logic once all page_vma_mapped_walk() users can properly
handle device-exclusive entries.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_idle.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/mm/page_idle.c b/mm/page_idle.c
index 947c7c7a37289..408aaf29a3ea6 100644
--- a/mm/page_idle.c
+++ b/mm/page_idle.c
@@ -62,9 +62,14 @@ static bool page_idle_clear_pte_refs_one(struct folio *folio,
 			/*
 			 * For PTE-mapped THP, one sub page is referenced,
 			 * the whole THP is referenced.
+			 *
+			 * PFN swap PTEs, such as device-exclusive ones, that
+			 * actually map pages are "old" from a CPU perspective.
+			 * The MMU notifier takes care of any device aspects.
 			 */
-			if (ptep_clear_young_notify(vma, addr, pvmw.pte))
-				referenced = true;
+			if (likely(pte_present(ptep_get(pvmw.pte))))
+				referenced |= ptep_test_and_clear_young(vma, addr, pvmw.pte);
+			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
 				referenced = true;
-- 
2.48.1

