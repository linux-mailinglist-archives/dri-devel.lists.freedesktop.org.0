Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCCA2F8D3
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B2810E394;
	Mon, 10 Feb 2025 19:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cwhFXlEj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64C510E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739216307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mARFTZKeX08fN9+zJg7ejGdzGLsE2rU+aFhmUgxRNAg=;
 b=cwhFXlEjllOF2xJhfGF7W0jq5wT/LSF2xCWGDQNt4BBtR6AFCRXjrrhYys849rNLn5H7eZ
 wa5Wrp83uecMJDSxDR1OZpW1bDS8p2XWFNp7I8XbMHM3ecBX4NmBTEHwwNqVDWl/NWMNbl
 WJwjY7x3CL80Q4/wazgvpTnwD9/th+U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-ZfA81b-pOq-SbOeok7GAvg-1; Mon, 10 Feb 2025 14:38:24 -0500
X-MC-Unique: ZfA81b-pOq-SbOeok7GAvg-1
X-Mimecast-MFC-AGG-ID: ZfA81b-pOq-SbOeok7GAvg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43626224274so28058535e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216303; x=1739821103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mARFTZKeX08fN9+zJg7ejGdzGLsE2rU+aFhmUgxRNAg=;
 b=ktdgKFOmCdZm3Zjme4DuiVTWqmU6wbRdtUZISrV36WcEXSW0gDMwiuZDQR2CQ6cphk
 R1Ce6mkjB5lnnjgByBf4TxI9WnjS0yfl8poG4FCQ4lia7eDKyBGUJyPRtaIUNo/+XVO0
 03KBGlKcEghMBcqAYXCTCSo7JXp3tTnUAibMbz20DO+TeOeW5S6xePPpX5zTPdesbYJU
 2qM4VwYSV58mN08N0kTR13GHDuoKvYRy3t4UGwrzZSST3PQ+mhWQuYrf9RGM4sAO0YJm
 a15gKvFduhM6zIM8dsB9wGJFW1t2WKpi+KGeMs2Nyd8KLGnRE5yNmhVrZDiiOS2Exxi0
 7eaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWRhrOQqeQDiajVjZM+aDTfTagU3bwZWPcjL/syQKEOFi2DEDGrn900wTISAv7UpQRPQKL8WBM2PU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGzGM3nZO2Xh0mXHzUJfmqfVfz/kwGoCZgaLsq3/QA5URZpbMz
 otcY9D43/9HJvt454cf3MFmddevrrHKg2DkukkZnv94iRcrFcs2kmlkrqbv4HBuYad8sdiwRkDM
 G7307kxmfB462n+GsFV8gk/2AXPH/5Zk13WJP2T2YbjRuYy3r1kMcK20IsCnXtq9hkA==
X-Gm-Gg: ASbGncsWuDo7y/oOFQJ5XupZH8Db8SblcugtDbWWMIYGURan0x4gKOTb8VulLUZXV9A
 ZNmjO8V+TJnWh/zhwi+PBkZUTmyUkTh9t8BJvl3i1XOgFtHFD+5iNmeU4MexF6v3O5OrQtvr+ep
 oPyjhd+gssujKIzj8VqvvBFBNLiPCtFpfiDXExEqtit7I5F00HitHfTGNUI1wLrIsP9xJDW4/uy
 umh/nuOP29qr7FEeH3uK8FDeRyMum4rrQGFMSFgA8QaJU0fYunT/CCtjqrJih9eZ8OoH3zaqNbK
 GxIbbD86S+BwDynI5Kja7lvGlD3yIJON7idgZ6CFK7kOY35UUmlj4NC4jf/Y5drpLw==
X-Received: by 2002:a05:6000:18a5:b0:38d:e33d:d0db with SMTP id
 ffacd0b85a97d-38de33dd2b2mr2312795f8f.14.1739216303479; 
 Mon, 10 Feb 2025 11:38:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1Llhtf765OHh3Rdp8g77cDKhZyIe7rPLF3LamWfRFHXBXmPgwl/7uacqNHueSdZU9tH9+kA==
X-Received: by 2002:a05:6000:18a5:b0:38d:e33d:d0db with SMTP id
 ffacd0b85a97d-38de33dd2b2mr2312758f8f.14.1739216303053; 
 Mon, 10 Feb 2025 11:38:23 -0800 (PST)
Received: from localhost
 (p200300cbc734b80012c465cd348aaee6.dip0.t-ipconnect.de.
 [2003:cb:c734:b800:12c4:65cd:348a:aee6])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38dd3fc7ee5sm7734941f8f.39.2025.02.10.11.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 11:38:21 -0800 (PST)
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
Subject: [PATCH v2 05/17] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Date: Mon, 10 Feb 2025 20:37:47 +0100
Message-ID: <20250210193801.781278-6-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210193801.781278-1-david@redhat.com>
References: <20250210193801.781278-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 986O9jhrwk1dth7wxon4oBaXDoA07oEHi5wRVSltog8_1739216303
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

Let's do it just like mprotect write-upgrade or during NUMA-hinting
faults on PROT_NONE PTEs: detect if the PTE can be writable by using
can_change_pte_writable().

Set the PTE only dirty if the folio is dirty: we might not
necessarily have a write access, and setting the PTE writable doesn't
require setting the PTE dirty.

From a CPU perspective, these entries are clean. So only set the PTE dirty
if the folios is dirty.

With this change in place, there is no need to have separate
readable and writable device-exclusive entry types, and we'll merge
them next separately.

Note that, during fork(), we first convert the device-exclusive entries
back to ordinary PTEs, and we only ever allow conversion of writable
PTEs to device-exclusive -- only mprotect can currently change them to
readable-device-exclusive. Consequently, we always expect
PageAnonExclusive(page)==true and can_change_pte_writable()==true,
unless we are dealing with soft-dirty tracking or uffd-wp. But reusing
can_change_pte_writable() for now is cleaner.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/memory.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 539c0f7c6d545..ba33ba3b7ea17 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -723,18 +723,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
 	struct folio *folio = page_folio(page);
 	pte_t orig_pte;
 	pte_t pte;
-	swp_entry_t entry;
 
 	orig_pte = ptep_get(ptep);
 	pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
 	if (pte_swp_soft_dirty(orig_pte))
 		pte = pte_mksoft_dirty(pte);
 
-	entry = pte_to_swp_entry(orig_pte);
 	if (pte_swp_uffd_wp(orig_pte))
 		pte = pte_mkuffd_wp(pte);
-	else if (is_writable_device_exclusive_entry(entry))
-		pte = maybe_mkwrite(pte_mkdirty(pte), vma);
+
+	if ((vma->vm_flags & VM_WRITE) &&
+	    can_change_pte_writable(vma, address, pte)) {
+		if (folio_test_dirty(folio))
+			pte = pte_mkdirty(pte);
+		pte = pte_mkwrite(pte, vma);
+	}
 
 	VM_BUG_ON_FOLIO(pte_write(pte) && (!folio_test_anon(folio) &&
 					   PageAnonExclusive(page)), folio);
-- 
2.48.1

