Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7435A21CA0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 12:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0D310E7CB;
	Wed, 29 Jan 2025 11:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WAYASyGF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DBA10E7C4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 11:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738151677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SXa0V5qonctJf7EFSiCmTQng5dHGkyNA7f/zw6SOSBk=;
 b=WAYASyGFbN7nJUXo0mEkZdRX+ZrxhbZu8gl1H2q4ygb6Sef/QPDcsgu35H9//IG/biSfL4
 shmcZBeXw3HrLM3Evbg+XHSs9COZ2GGPptpKP+tG+HfaHJqMjZr+jdfZoIExUs3o1dN1LD
 9GomvwlFFZEm4YJy9oXGTJ6wKuosHF8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-8eqo1fPLNSGFUz703mH1aQ-1; Wed, 29 Jan 2025 06:54:35 -0500
X-MC-Unique: 8eqo1fPLNSGFUz703mH1aQ-1
X-Mimecast-MFC-AGG-ID: 8eqo1fPLNSGFUz703mH1aQ
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4361ecebc5bso34372105e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 03:54:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738151674; x=1738756474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXa0V5qonctJf7EFSiCmTQng5dHGkyNA7f/zw6SOSBk=;
 b=dkIjFFni6sfFiyNMYhiXsDSh5CADLEjWLR8UybwPMVj4q98l5YEiiz6ZsxigaduhUx
 mUqSU28fQvJ3xwI95R228W28ukIs99ZzYADNP/ieeJqIHCBEYRc1uqP7WHZLMoYZiGbR
 sRrYmI6+wJNosRkVhk8R8YMUKh1E/4RlQ3HxGwUXqPPTjqZBAFMDpBK2fzdt273qEMFr
 BCnw5gd3SAkDqGEzYmF322xyiVLvCzGjsyZ7UWOE9jslUhELDGfC1z/EXzXSXmq/R98K
 Amr/LuYr4gsDea3zXwlyi4lV1IRs6VbCezC1FFIJIazj5SRVexFwFE7yI7jA8nPvFjOM
 a1Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA/l7caA8fzasjOkqkNiZy4QOROY6YFU5gCYp/o77Jau9j41GHeeaNd29CdqDjriDBZj+szaGNZ8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlILdLeaKFtMLgfW9d69oKl5WkctM9jEfdUZyjJOll/pI1Km/b
 tDPbjgaoGnWwPJgiCkah56cZkdiA7qjZnvV9EtxmX/cWspkvNpWNusYgkcftasYXUIcqNxmJSEN
 kYlju0m9YlFrwVfNmDFmqlT6KWtVwZJrpjIMrWbTu92z32ISgECybhXc88TmJjRocdQ==
X-Gm-Gg: ASbGncvvCkgvFeO7FlTXmQutPpzfMkCwTcnOTciHQ3hSg9VFZTj1BfN5fhBzdlWDQM4
 GBLvIiuNEdUqNajRdteWYc3rqsxP/WA/VeOUzctZRFf2QEAzOJHN/WZUjqfeQ71hBIN9C2NA8oN
 DO7KEp8tz9orOoH9GSfNL3Q9Igxc27ezrgqAXEryLfzwwTZJ4bL3Pyv7PXCsriXIHkT4hz9QWuD
 fRDQ56QX/fX2dfwsmrJerQD+9We4DWnHOiP8sC/WlH0949k4QsI5NSVpUc2WNnE39NewOg5FL0b
 I1RIuoPwL8nL35tiSZzkgEq/mFv3mWxrZRTITo9VpCTYXk12+wuyRvJku5U/MiZvIQ==
X-Received: by 2002:a5d:61cd:0:b0:385:f7ef:a57f with SMTP id
 ffacd0b85a97d-38c519744d5mr2113625f8f.27.1738151674159; 
 Wed, 29 Jan 2025 03:54:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYVCfHEVHB5xz9x9tgAenDwJY8DuXR9neg40xsYB0gvwDn7frPxCs2ZGd0+jvQzBFPN5gg9A==
X-Received: by 2002:a5d:61cd:0:b0:385:f7ef:a57f with SMTP id
 ffacd0b85a97d-38c519744d5mr2113590f8f.27.1738151673837; 
 Wed, 29 Jan 2025 03:54:33 -0800 (PST)
Received: from localhost
 (p200300cbc7053b0064b867195794bf13.dip0.t-ipconnect.de.
 [2003:cb:c705:3b00:64b8:6719:5794:bf13])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-38c2a1bb040sm16943248f8f.67.2025.01.29.03.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 03:54:32 -0800 (PST)
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
Subject: [PATCH v1 07/12] mm/page_vma_mapped: device-private entries are not
 migration entries
Date: Wed, 29 Jan 2025 12:54:05 +0100
Message-ID: <20250129115411.2077152-8-david@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250129115411.2077152-1-david@redhat.com>
References: <20250129115411.2077152-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9a9y_quEaI-z5y0cffT8deZ3OvuYhod_10ClUVOJkpw_1738151674
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

It's unclear why they would be considered migration entries; they are
not.

Likely we'll never really trigger that case in practice, because
migration (including folio split) of a folio that has device-private
entries is never started, as we would detect "additional references":
device-private entries adjust the mapcount, but not the refcount.

Fixes: b756a3b5e7ea ("mm: device exclusive memory access")
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/page_vma_mapped.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 81839a9e74f1..32679be22d30 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -111,8 +111,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
 			return false;
 		entry = pte_to_swp_entry(ptent);
 
-		if (!is_migration_entry(entry) &&
-		    !is_device_exclusive_entry(entry))
+		if (!is_migration_entry(entry))
 			return false;
 
 		pfn = swp_offset_pfn(entry);
-- 
2.48.1

