Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47AB30399
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC90610E9F4;
	Thu, 21 Aug 2025 20:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c3iWzq7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE6E10E9F6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806877;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
 b=c3iWzq7gztm0r/rqmEUVRMpluw2T/1aAtFoghr8g/YbWc/UTUQZqk7iRcOZ66WodcbK83b
 Y3i1vGo0otccyaMkJqlneCc596gErfhzbxI244W0Nd4cSrD0bGDaCXcS8IIpLp1T1zlapL
 2lBXDWvxtFm3eMMDzq/6V1e9qFggdXQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-CjbTPRpPOFibd7kH7vKAWA-1; Thu, 21 Aug 2025 16:07:47 -0400
X-MC-Unique: CjbTPRpPOFibd7kH7vKAWA-1
X-Mimecast-MFC-AGG-ID: CjbTPRpPOFibd7kH7vKAWA_1755806866
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0071c1so6420445e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806866; x=1756411666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TaqjYk7qiFpFT4dP16wKMuC8fiQfbkUwRRgQVKGzHC8=;
 b=Nq8EvaYcKGQpjX1W+6IW4E1DR4jGE3sLAt4IUvym/dhMTKdyu0I6SmzxRufEjbr97F
 qu0x4MJsBTr6vHSBnjsHs/i51Z6wDfhG3a9TuiXv9v5CnalC7xyDZJXZcCjhMyNLg4Y2
 oFU56plWFKSy9zNadBXuoAcw/J4XUHOKOUKmUleI91ps7ZVjU2+70Gg0TOM8+NtSFvb+
 Kv5tGfijb8xiZ97eOVsNYKj135qXI2bVwC+JM90I7GHhrvcgo9WIdCtluOPooNc9lkBl
 dVG9WqSKIBWLx1MXfMK1NP9eYNoNIjUkuKs9DDEL9xElKFeVnpuxkUbJ5sYNxCu8wZX+
 x/3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD2Pxqiy941NjxMuceXCCwQZhwMp6S1npEP99cIl7/klj1S6n4hbnj9MCBwvLCN6K2GAeSmw7IXrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2T+F04v6bBbEsikO20Dma9jjXhnTE5INQxNYQKanJO6EJUb2K
 2aGCqoDGQkBF4R9De8mNjgGj/ILSyn25h2K34cXphGQ3NbquFyUJ6IdwamD1l4KHbCG5eO/zTjy
 7l2l5Jj9dQFuMGhVVrPJqb0w4gz9QKF7iDNP4EA9585Wkbskd1LOOrarPEKxYqtK9A1pOnw==
X-Gm-Gg: ASbGncsCwkKvDINNBa7zNnsb8cy/YNlsMqbnEMXX7f65DoMwTACbaqojBA3YIPBE7wZ
 /dRQRMmqICZ/76lHInqsEYT922zXRRhBUV5/jd1n2gUTuBZmnPEuT5/lrV61gUBTGK30U7koHO4
 xFikRHHwflrQnpoQtIPc3j85XtIlamAE2xtP2AkAp4UFAkUYVi0zQYqAiDLDhRMg7NjU3wghuxs
 BVhgO8yrZOtSLDeyva26swSWgOrmhNKyfWzQkQRXDllWudgyI0XygwMIi2TmISo8azja6n0oj2e
 qPKY5qulwDB5MwS0Iqd1u/2+cPqbADlnr1US+DaG2/EFqoHGqDLTNuenKomtcLAOJ1jsCo3Zc2x
 sIFacu7/NMGtIWy0bmuOkZg==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id
 5b1f17b1804b1-45b517d4e23mr2819545e9.26.1755806866195; 
 Thu, 21 Aug 2025 13:07:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUtzGc4rPv18tjnV22wd1xjfGI25AJiVbHUBF3o7jj7YvZLrrv8XzLc39l/Z4dCqHj4yY2QA==
X-Received: by 2002:a05:600c:1392:b0:453:5a04:b60e with SMTP id
 5b1f17b1804b1-45b517d4e23mr2819075e9.26.1755806865726; 
 Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50dd0380sm8632985e9.10.2025.08.21.13.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:45 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
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
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 14/35] mm/mm/percpu-km: drop nth_page() usage within
 single allocation
Date: Thu, 21 Aug 2025 22:06:40 +0200
Message-ID: <20250821200701.1329277-15-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OzlVqWNpX19bpEM5v6wk7PDpt9H-ItNjlrVMRRCngpE_1755806866
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

We're allocating a higher-order page from the buddy. For these pages
(that are guaranteed to not exceed a single memory section) there is no
need to use nth_page().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/percpu-km.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-km.c b/mm/percpu-km.c
index fe31aa19db81a..4efa74a495cb6 100644
--- a/mm/percpu-km.c
+++ b/mm/percpu-km.c
@@ -69,7 +69,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	for (i = 0; i < nr_pages; i++)
-		pcpu_set_page_chunk(nth_page(pages, i), chunk);
+		pcpu_set_page_chunk(pages + i, chunk);
 
 	chunk->data = pages;
 	chunk->base_addr = page_address(pages);
-- 
2.50.1

