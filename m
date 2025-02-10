Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB5A2F8E0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E1A10E3C5;
	Mon, 10 Feb 2025 19:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WDw8D0Gg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C14210E600
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b7jLfJ9vH0eUU1vYEXZ3dUW5UEIvFQqjIYltl+lFPPU=;
 b=WDw8D0GgGNKMZT0mBqbsJGqDgZ1bopJ6Wn8XeBgE2JfTPy/bXAIs9x7Icx+dU9j2gwqsH7
 jNsRRx84/y3XfBK/gbSYVm6ut4C2//TEmmPA6N0oEjLTBJ09j5fk5qlU3sV7olL4mmVpB9
 mHzpSMXwHM0FyOzUlGzTbGCVrtAXu2I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-yxIHVUvMM4mgy5JApvSitg-1; Mon, 10 Feb 2025 14:38:39 -0500
X-MC-Unique: yxIHVUvMM4mgy5JApvSitg-1
X-Mimecast-MFC-AGG-ID: yxIHVUvMM4mgy5JApvSitg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4392fc6bceaso13134305e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216318; x=1739821118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7jLfJ9vH0eUU1vYEXZ3dUW5UEIvFQqjIYltl+lFPPU=;
 b=wPAnjwVyKu938POOiZdJ0bfa6EHX67Mwje90AnmnGAOT6JbKRkZ2n5RpWK3TToFt2h
 63GCyMGRLGiwywWMNiXE/E5a2WsllDNJ6cJlgGCNaFU40Y4hnKIojRmos9tKUI0XwXLN
 aSFe/dFDUzMGO+tThicI8ljyYBe3fXX19NECpHpBoD91vA2PKlv0rUWomFTeVm29p5vH
 XWoN7qFl+JX2oNlCHhin1yFt8Mb8AC0zOXoMn6zP8hIIN3hvcir9qlTKGKSJ1pXjkAJ4
 h77DOA1UbMJU4guvuZxJkJYvIXH1h57fsV+Lu1eeK4OI98Pc2k5hwd5aEuxr2H1GE+eu
 hsSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQC6GALJ1p96FvzeuovL/qzZ/3pFXo1yNvlMZBhtQCndt974wuIX6+CyLvYVKOeEUL6CLhwPClSOw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx27KLNVsJ7l8jXczypiUAujFkCQCmAQTyPi2Ffo63pWcG5VHS8
 bLwTlMfw1B15Ep5HlEt2fC3I7l+j0Lolzg5RmWCHFUg4AqOyGzEGk2VBnCv8hjc4BWDwxZecHmu
 co9UMyzrdP1BzZludmvWcxoXy9IzOvHL0YqZdiQcyOjYe8CdwDTJ046Bfy35/RxdOZA==
X-Gm-Gg: ASbGncuWbQjeLto5oxqlXD7jthBdea5Anb5UTsvX35BZh7vlEFXo8Hi+0pDxTsiuFS9
 f1x6drnf9808qTQ0oCuIDcaT3sGo31AM4QHC3ctsXU5o//j+52ddvQWYsWkORQqejTHuma2YuXI
 A8qw+gtePgUpvlXQsPBmbdVw1nwbL5KJtqISmf+/UYVTvpIc7wiBZWwiSfaqB3eU/NufYpR08QU
 h/tnlbc4viFUAmzWXOVM8vg99aedcGrUr5FGF+tDt+hJJbnqh8xfOn9C4xO2t0hDOM/GLmR1HZr
 S6YxCWzc7PpfOGb0wxpe1TeGXkkJ1y0TpGEo73t7pBls0t5WbdVB7JikvrH+NSecaQ==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id
 5b1f17b1804b1-439249b04f8mr116077555e9.20.1739216318629; 
 Mon, 10 Feb 2025 11:38:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdlczuWpIJN55C/ZdLw7mis7jMK/FKd714PEZJ/2b6DQtULEf1bpuI2yab2McnQRseLHdLgg==
X-Received: by 2002:a05:600c:4f90:b0:434:a7e7:a1ca with SMTP id
 5b1f17b1804b1-439249b04f8mr116077285e9.20.1739216318299; 
 Mon, 10 Feb 2025 11:38:38 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4391da96502sm158809495e9.1.2025.02.10.11.38.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:37 -0800 (PST)
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
Subject: [PATCH v2 09/17] mm/ksm: handle device-exclusive entries correctly in
 write_protect_page()
Date: Mon, 10 Feb 2025 20:37:51 +0100
Message-ID: <20250210193801.781278-10-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nf_NqP2pMPZRivLyOH7-55YU2p5glQJczF1G78pyDm8_1739216319
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

write_protect_page() is not prepared for that, so teach it about these
PFN swap PTEs. Note that device-private entries are so far not
applicable on that path, because GUP would never have returned such
folios (conversion to device-private happens by page migration, not
in-place conversion of the PTE).

There is a race between performing the folio_walk (which fails on
non-present PTEs) and locking the folio to look it up using
page_vma_mapped_walk() again, so this is likely a fix (unless something
else could prevent that race, but it doesn't look like). In the
future it could be handled if ever required, for now just give up and
ignore them like folio_walk would.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/ksm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 8be2b144fefd6..8583fb91ef136 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1270,8 +1270,15 @@ static int write_protect_page(struct vm_area_struct *vma, struct folio *folio,
 	if (WARN_ONCE(!pvmw.pte, "Unexpected PMD mapping?"))
 		goto out_unlock;
 
-	anon_exclusive = PageAnonExclusive(&folio->page);
 	entry = ptep_get(pvmw.pte);
+	/*
+	 * Handle PFN swap PTEs, such as device-exclusive ones, that actually
+	 * map pages: give up just like the next folio_walk would.
+	 */
+	if (unlikely(!pte_present(entry)))
+		goto out_unlock;
+
+	anon_exclusive = PageAnonExclusive(&folio->page);
 	if (pte_write(entry) || pte_dirty(entry) ||
 	    anon_exclusive || mm_tlb_flush_pending(mm)) {
 		swapped = folio_test_swapcache(folio);
-- 
2.48.1

