Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5CBA21C9B
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02E910E7C8;
	Wed, 29 Jan 2025 11:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IE2jdU9f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A9910E7BD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/5TTv0Iu+aL+vrfHcl/JjDhmk1gN271wttPyRyQHADk=;
 b=IE2jdU9fvAybVz7I6gRQD6dD7avsQ5WQr5tSEjC5RHCTxizAd3gNgYmfnW8HbpMhiiBlQJ
 MfGbA7RZ+QIxVbhZ3GOqbxfd0+HFUfV9pLGKBuNRFFqBmiRo94bcEl0jj5bgsuGflK3d12
 962TFHOIAfs/RfDblGKObPAo1Tv4xTU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-PN_Dt3GHMI6HSehUpPT-gA-1; Wed, 29 Jan 2025 06:54:29 -0500
X-MC-Unique: PN_Dt3GHMI6HSehUpPT-gA-1
X-Mimecast-MFC-AGG-ID: PN_Dt3GHMI6HSehUpPT-gA
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38634103b0dso3585165f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151668; x=1738756468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/5TTv0Iu+aL+vrfHcl/JjDhmk1gN271wttPyRyQHADk=;
 b=Vf7crj/4vCvdxLR7Ae27WfjkNiR6MA4RWA48fj8aXy5ZOvh6i6RH0bzvQwQiXJcv8/
 Nk4wixskvPVNYovKsQ4ujVQnGwALxuGp5JSucDwKnQ7JFC8WgWAkF7HWbqOHirq1ZyMP
 PY51YxHmL61N4SdV/T5WB72runYpmCNO5sMT3611krPfdxbjZiWSxzy8jMvF3Su09mku
 QkT4M2WZDWQ+x5XNvcsVp9EzdMy6fGFnmzre2NLniuoPpU1CYiPn/kQy0POhtQekTo3A
 zjJo5KTCMUsxI/aSrgFFVUlYKK3PPZoU1GUbCK0p3oDUhcxaWP9ZKbCCN21U4It3sf5c
 2+nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdhcXNq14XC8AevQzRdC9CPvjH7JzKLakNqsj3rn75cAcM39FCxIvUYed36/2UWITxGtRWgsZOJq8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0gc72JkIr9v0Hxhg/EH9LC5GpfbloFYYaFj9SEFg+OIGmf2cb
 t6ykGh25PUsN1hJBHfIgJkRgZf4DwI+0CUK97cFWP+/tBaW7WXhGv4xNx8hQubddu+eZ1dthWRO
 Dg2UAzB6efvHvrel1a3T4xe6hO1gpl9fC9PB5Kyibr1nzgNUI/CoFlh9okQioMq1gig==
X-Gm-Gg: ASbGnct6xGwaeNHZ33B1KIU+sHDIxe6+AXvTvPELNtXj3IZqW5/y+V5+HR3zP7KHk6t
 8exWx5w73TawOLKqrEJMZOfw5yh+nnGjgN15WGre5zKb3gzPNcLq2tCDmebYPaqkSJNOAxx+BGc
 T40MhGFjKdMYXJJmZfmyRgf8CutgGwMXWDC/i9UVMPbl6z19b1TtZXh+xb/Qz8qgEauzAnCICnh
 tyUSFJONigEjThrdOWHiLYQ6bCidSC1ZpZxcPGZ6wJl6155BJ/dH0N8SJHviRNoMLm4J28ZwbsK
 y+GgvPIpBMWtP8UVLJWA6YV2fDngg32SoLpg6ZsLREnpfi2Xtqectmfn2277JvVJzw==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id
 ffacd0b85a97d-38c51e8de63mr2549365f8f.39.1738151668336; 
 Wed, 29 Jan 2025 03:54:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3OskkNotGDGa9hKk/bhinDJ94hVo+TUAo4zN3qwEB+ZEXq9Nn9aY72BgysSoJ/r2gZh7hQQ==
X-Received: by 2002:a05:6000:1fac:b0:386:3329:6a04 with SMTP id
 ffacd0b85a97d-38c51e8de63mr2549347f8f.39.1738151667985; 
 Wed, 29 Jan 2025 03:54:27 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a188fe8sm17066981f8f.56.2025.01.29.03.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:27 -0800 (PST)
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
Subject: [PATCH v1 05/12] mm/memory: detect writability in
 restore_exclusive_pte() through can_change_pte_writable()
Date: Wed, 29 Jan 2025 12:54:03 +0100
Message-ID: <20250129115411.2077152-6-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fPhxaeZ9XG4xq2vyYqtFMYWUUAU9Vl_hcAZEuCcjqwE_1738151668
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
index 03efeeef895a..db38d6ae4e74 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -725,18 +725,21 @@ static void restore_exclusive_pte(struct vm_area_struct *vma,
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

