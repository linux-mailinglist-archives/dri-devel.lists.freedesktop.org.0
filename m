Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5D5A21CA7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3619C10E7C1;
	Wed, 29 Jan 2025 11:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G19dnS3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92B110E7C1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mNM6Zw+nv5CKX0FXtzXMADzAxRUJZ/HteqC2IEBjnh8=;
 b=G19dnS3xM+nwKpkK7PrXw7fw8ozO6UVA78CVfLg74SxJnMkuJDjdruT3p5cGjvr2pdVmNH
 si+ru0wFVZukY15nb4bs0XWLUoSw1xXrGMSGuE6LoSYQpwNknllwdcpMO7V6JWB2Ffh+my
 Xj+Z7pBabURNY2OPUXQ0eCBw54UAPVQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-GM6I1SJMPhC4FtBg7iuz4g-1; Wed, 29 Jan 2025 06:54:43 -0500
X-MC-Unique: GM6I1SJMPhC4FtBg7iuz4g-1
X-Mimecast-MFC-AGG-ID: GM6I1SJMPhC4FtBg7iuz4g
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-385e2579507so2852891f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151682; x=1738756482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mNM6Zw+nv5CKX0FXtzXMADzAxRUJZ/HteqC2IEBjnh8=;
 b=vtSzJ3MmmjV+5zvDzw8ukS+/N4XYtcmokK/2fF8GdocpLErboQ1fpAyovTBN8x+fuY
 Twqufq1gDFlwRQ+pnVTpeDe/sA7DAqe/bnf8UkksFBdFvkO8ecsnbtILG2lbIKAz3jG1
 qku5GKbwxmEy8P2eh5hZZZO9hcoZltXwEvALDajXSgzoEIEeTIJiopCgSxqkzzPyxGnh
 sVDt4Yik0D6D+EmhhZuI+kGXa3KcKr6CcrsdKHGBvGYwzq7KBmwOi4OBPFxS3TDf0HLF
 KRTg2TfZVC4bic9lOJdwNFhIG7497a7xZtpQhbJJi0MZvZv7bsVovK1TiaZwCZ2TItgQ
 Us+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeM67Fl5BZH8BtseFeRwV8Z78kIkkaudWTbGtmOJWChM02ReB6Yn3XsJvto23XhjwyaI7HdUSW+NI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRUmXzCrCW3wiRzjKVFnT2dTNWHUO3BJFljNrSFmLbMCePDwYE
 3pVX7zshEimOttF0QYGnCFtxQCzeVcbaQ8b+V7rC/Eaad5w+xlvDi4cIYWH5Mn3m9HFsYHgPYYE
 qvjSjKej4+YjP3ZCWvmYw/NpXAVw9j4nBslG2Z1DZpx9kKGq/hpVZnHMQzmjIvDcmOA==
X-Gm-Gg: ASbGncsmxJIOioRKr6VHUg1NMPu2M++SK2ziEIRJPt/DHnOcabulsPQWIk2zZplcB0o
 sbD6/xpzbj11ULZm4JgQYWJlj3/hY0NnD/fsqdfMwT0f3f6NSStJ7qYJbnv+Wi//Jn5C/OYyBf8
 N4zkC2zBvrZrn+XxyNHGO3vDC8HiUSUk6SqswI42b0cDyYmpPAHm/72S7OYR+Mbo0vQ9aWQoO8e
 Ig8gn2WktmZDEN13ptgQwiZqIVX1t1w+k6C78x2sDDSRtYFA7Wr3jD2AJm8qKqQ0YCGgddt0huS
 VnRWkF/hVLE2dgch3083uaNHnIYWEhOy+PqlXIPhQjFrDScdg32yX9RKWD03KMT7VA==
X-Received: by 2002:a05:6000:4013:b0:385:f631:612 with SMTP id
 ffacd0b85a97d-38c5195f2e5mr2414991f8f.17.1738151682132; 
 Wed, 29 Jan 2025 03:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfVb9Gb5/TQQdvQH0d8Y86brLumLHRijGlRqbPqwAUyE2LkrZ873cAyk0+z1AQr8yjahg13A==
X-Received: by 2002:a05:6000:4013:b0:385:f631:612 with SMTP id
 ffacd0b85a97d-38c5195f2e5mr2414952f8f.17.1738151681703; 
 Wed, 29 Jan 2025 03:54:41 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1c4212sm16316119f8f.87.2025.01.29.03.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:41 -0800 (PST)
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
Subject: [PATCH v1 10/12] mm/rmap: handle device-exclusive entries correctly
 in folio_referenced_one()
Date: Wed, 29 Jan 2025 12:54:08 +0100
Message-ID: <20250129115411.2077152-11-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W9yZSyFwJ2EcBKkWBPvQU0tkNfXjGub1Cm1mQhE3k7k_1738151682
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

folio_referenced_one() is not prepared for that, so teach it about these
non-present nonswap PTEs.

We'll likely never hit that path with device-private entries, but we
could with device-exclusive ones.

It's not really clear what to do: the device could be accessing this
PTE, but we don't have that information in the PTE. Likely MMU notifiers
should be taking care of that, and we can just assume "not referenced by
the CPU".

Note that we could currently only run into this case with
device-exclusive entries on THPs. For order-0 folios, we still adjust
the mapcount on conversion to device-exclusive, making the rmap walk
abort early (folio_mapcount() == 0). We'll fix that next, now that
folio_referenced_one() can handle it.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/rmap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 903a78e60781..77b063e9aec4 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -899,8 +899,14 @@ static bool folio_referenced_one(struct folio *folio,
 			if (lru_gen_look_around(&pvmw))
 				referenced++;
 		} else if (pvmw.pte) {
-			if (ptep_clear_flush_young_notify(vma, address,
-						pvmw.pte))
+			/*
+			 * We can end up here with selected non-swap entries
+			 * that actually map pages similar to PROT_NONE; see
+			 * page_vma_mapped_walk()->check_pte(). From a CPU
+			 * perspective, these PTEs are old.
+			 */
+			if (pte_present(ptep_get(pvmw.pte)) &&
+			    ptep_clear_flush_young_notify(vma, address, pvmw.pte))
 				referenced++;
 		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
 			if (pmdp_clear_flush_young_notify(vma, address,
-- 
2.48.1

