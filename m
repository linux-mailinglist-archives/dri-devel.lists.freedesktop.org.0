Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942DCB303A8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A878110E9FD;
	Thu, 21 Aug 2025 20:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NBJmhThn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E161210E9FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
 b=NBJmhThnt6QbKPOfznR1lvSLbOABO9jQHu5pR/CiWkhRPjNrz/CfBRjALP8g7oooiOhYK8
 og9L4oRrCMh59Mh67ndkn6Kt2oc61vVKZToL51BCIrP4zkrOly24SPJS43itQJEvJBc06L
 XmGGH5nOZn7fTX2lW6la78mA9iWXpFo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-1wtZtrLXMFKG454izY8w0w-1; Thu, 21 Aug 2025 16:08:11 -0400
X-MC-Unique: 1wtZtrLXMFKG454izY8w0w-1
X-Mimecast-MFC-AGG-ID: 1wtZtrLXMFKG454izY8w0w_1755806889
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c2820so445384f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806889; x=1756411689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
 b=BvALkrru22qFjFsug16AODCFwMNfHlc5+iY7NcFectZ23fdm57DPYv8fzaVxACQJV9
 IbLkf69EVMgVZjcgmTh36dPcly5pYdGJKor313ppXeXEIBNI9E/1xc+pOr4XKryQGVS4
 X2O8enTl0dy/ngKrqbZXpr9Vx/+p7h2KpTZN3WiNi8vKPCVPGm0VWkiZzdY7wXJiohuB
 IlrWMJKcYA/1ynp/FcfYTdWK75E/k67Pfm5PzdvKYz1HX4PfKN1gbwqK7d3REywh2FjE
 Ccn5UWgLrfvWAQRF9Lk9Y1vUQbrj0e/8ctKuPAkzW9RKF+1cBXstWZtoZFV3NYlnp1ym
 OSFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPKIRL4pLY+5uXSvW5us0M16raPYUNcYEnLDWmVGpRdS7u6sQiKU8mdVptrai5CTurHWgtDTo8zrc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpyhtKZW8IPRW8zwlQsT+CCxqh89HPiJ1i3+QDGhawLwaDekSS
 WQNN5DmjBL1/eWy0yw7VopegBpj2nDiPByZUA47bycc/1fs9ZOhquVGvb8kt4mOpZ4fkami/TDq
 53UWzXpu9pCHwTnCEa0JnpWDbO/KAW25pcMIaIwz3wGpUZwhU1A9bhEsCHZ9EUWvaXOyM0Q==
X-Gm-Gg: ASbGncs3dIDtup/5eW3Sqb1viy14m1jcmwJO61BsbYeLCAQ3X1o/eVGEMetxQ1JXkP/
 Qp1UcwnTRDa6ZFDCsTujoS0Q7mVSxuIsEUYEH3CPQAe1TcJRVPFRIXZ9AAQWvRlpzbAxVrYUUe8
 ojMPA2A5bKD+RIMHrgzXCmswg/KpvdetKuBiVvWva40PVm2dpI9lQrI3nmJtHlrvXJr8skXPJgf
 CpqaNb20FYiImGKipb5HYA6v0TsvD25OhKF3ZgFCNmUlDSAHC+5T1wIt4ynrgWeHt/aBgkoP69C
 DvTUtgGNmrgptzxDcz/pJl7XITpNDjMO7VphJVww9QNsg7V2azqK6xoDh46RH9McVV90Pguc20f
 cVkLEvW7YMcvusSTg/Ui75g==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id
 ffacd0b85a97d-3c5da83bf5bmr151968f8f.9.1755806888910; 
 Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeHEkncn914iQLB6IDJFbFllUgyuseH1VcCPvg+Bdgchh7CcvmYDhAXktPsYS0hqHcr6hQuQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id
 ffacd0b85a97d-3c5da83bf5bmr151916f8f.9.1755806888456; 
 Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4e2790a8sm21120815e9.1.2025.08.21.13.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com,
 x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 22/35] dma-remap: drop nth_page() in
 dma_common_contiguous_remap()
Date: Thu, 21 Aug 2025 22:06:48 +0200
Message-ID: <20250821200701.1329277-23-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BFBa0Qm-4CGaKpe_rS9w2OJr_2_ISln_cfigotBVnkM_1755806889
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

dma_common_contiguous_remap() is used to remap an "allocated contiguous
region". Within a single allocation, there is no need to use nth_page()
anymore.

Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
ranges.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/dma/remap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 9e2afad1c6152..b7c1c0c92d0c8 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
 	if (!pages)
 		return NULL;
 	for (i = 0; i < count; i++)
-		pages[i] = nth_page(page, i);
+		pages[i] = page++;
 	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
 	kvfree(pages);
 
-- 
2.50.1

