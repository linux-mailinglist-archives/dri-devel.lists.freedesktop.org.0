Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6787B303CD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 033D310EA1B;
	Thu, 21 Aug 2025 20:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OeQ3Jku7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139A010E3B3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3CqHI+s+zbpAzQhGC/xWDVPQsQNUZt86Ikrf9EwImgM=;
 b=OeQ3Jku75acxbQhAfB/mF5BgJn7mrgOTAQm4SiEJ8viArJ6npiYV1dFU8PYc45mp29fexQ
 42lR0aqojrn9BA8FP4d7FX6ZD6iV6k+KeByfTyk9ZlOtfVOm1gfsNuSi44Szwl0gjaNZlF
 T8V6hQCDrkjYnwJuqJgXprSzUuSJUXU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-6KbFgenyNh204SchAxOcSw-1; Thu, 21 Aug 2025 16:08:37 -0400
X-MC-Unique: 6KbFgenyNh204SchAxOcSw-1
X-Mimecast-MFC-AGG-ID: 6KbFgenyNh204SchAxOcSw_1755806915
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b0b2b5cso10143425e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806915; x=1756411715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3CqHI+s+zbpAzQhGC/xWDVPQsQNUZt86Ikrf9EwImgM=;
 b=TkmiWgfDypV+jDavrkTkgKRNSW8HOJTodyHm/YzdgNjLhNkSuwtMOwdlhYtz9KjKqd
 Bu2ZEemm4qThRblFknMmiSGnqAHWObMgTKftycL+DKAuYz2jYic43UwnTiDzktfhtbl8
 ogo8MV/C69zRKx3nxShZeC041Yu60ygGWBPbL0trZN73DFONNyRSCXn1//uFbF/vle9s
 lavjL8hetIa3X6b6nAAhurYGfN1/ZNGOlHOFZhj2SvkTjIweQ36fuyOawE/9YlC05fL0
 d/Nv1ay3iUOABmPl2ft/iIw89r4+Vl17mZ8PDkDA3UDORWvV4Gx558Au6Z+I4HwJJP/w
 H4ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSACbidfKj9t06EVsqkRIOhvnPTeuKmadFBs9bFk+OVab4riOIsGen44yp9BGBS506uIBLRfU1ZGs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/bHAOp8bTi/oa2ahnsQcQszc0emynON+xDx6veIk2IFJpplcQ
 UTVVD+RvwbUBuniORR+dje6gjSHfidJTL7zgLFiRDZbDMsihNaVbLqNBFbomHuAugLjedzN4G+N
 V6bPSbH98plw5rU+8QqTUjWmcg7iEutZHMQ/r1730xSBppWVYaVMKGqw7Q/6VnmiR+6hhkg==
X-Gm-Gg: ASbGnctomOrC2jVO4oE+pMr6IelCgAPndEVvguNfEKUqE4ANeD00esLyYIMXEMFMI/o
 70EBvaN1lbAlAC2txisIOOZcsqOaq9/KMdHuxllP40zhj9sk+rdHdjcxI2ZyV9Hd4gLvPG+FEDk
 OzxfbAZQbtgmCjvLkbuRfvEiL9FU9JvqVZ4JTzb6aD87VQouwFUO5HxS9w8GXk0pOj8BkxvxyKp
 HlHeHeW/NoT2nC4qTTcHVH0rXp0x/tnJr5cdcxPCVcs8Rg+pTCKufA7tipu1WD5BxgXddR+Xakz
 k09JQ+7ey2FHBNDxmJ2lhlb/vxyKFsQj2OAwc6ZcA41vlsFUJS3wcz260RlWgH/2bVZp7l4xjw6
 tauPMKPbbIb9oZKW/mM/BVw==
X-Received: by 2002:a05:600c:1e85:b0:456:1006:5418 with SMTP id
 5b1f17b1804b1-45b5179f0d8mr2710935e9.13.1755806915059; 
 Thu, 21 Aug 2025 13:08:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNGUbCcltH4em232KOd7NJpwM5baGf2Rerwczj+dvqvR7jiogPR9NbFTOrLGPDkQDJL8nGzQ==
X-Received: by 2002:a05:600c:1e85:b0:456:1006:5418 with SMTP id
 5b1f17b1804b1-45b5179f0d8mr2710565e9.13.1755806914568; 
 Thu, 21 Aug 2025 13:08:34 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c074d43b9asm12707153f8f.24.2025.08.21.13.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:34 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
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
Subject: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:57 +0200
Message-ID: <20250821200701.1329277-32-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -tEDUThmZm3yj_pf6xw_ORyCIAcvf2W8fyozPuEpL6M_1755806915
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

It's no longer required to use nth_page() when iterating pages within a
single SG entry, so let's drop the nth_page() usage.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 crypto/ahash.c               | 4 ++--
 crypto/scompress.c           | 8 ++++----
 include/crypto/scatterwalk.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/crypto/ahash.c b/crypto/ahash.c
index a227793d2c5b5..a9f757224a223 100644
--- a/crypto/ahash.c
+++ b/crypto/ahash.c
@@ -88,7 +88,7 @@ static int hash_walk_new_entry(struct crypto_hash_walk *walk)
 
 	sg = walk->sg;
 	walk->offset = sg->offset;
-	walk->pg = nth_page(sg_page(walk->sg), (walk->offset >> PAGE_SHIFT));
+	walk->pg = sg_page(walk->sg) + walk->offset / PAGE_SIZE;
 	walk->offset = offset_in_page(walk->offset);
 	walk->entrylen = sg->length;
 
@@ -226,7 +226,7 @@ int shash_ahash_digest(struct ahash_request *req, struct shash_desc *desc)
 	if (!IS_ENABLED(CONFIG_HIGHMEM))
 		return crypto_shash_digest(desc, data, nbytes, req->result);
 
-	page = nth_page(page, offset >> PAGE_SHIFT);
+	page += offset / PAGE_SIZE;
 	offset = offset_in_page(offset);
 
 	if (nbytes > (unsigned int)PAGE_SIZE - offset)
diff --git a/crypto/scompress.c b/crypto/scompress.c
index c651e7f2197a9..1a7ed8ae65b07 100644
--- a/crypto/scompress.c
+++ b/crypto/scompress.c
@@ -198,7 +198,7 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 		} else
 			return -ENOSYS;
 
-		dpage = nth_page(dpage, doff / PAGE_SIZE);
+		dpage += doff / PAGE_SIZE;
 		doff = offset_in_page(doff);
 
 		n = (dlen - 1) / PAGE_SIZE;
@@ -220,12 +220,12 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 			} else
 				break;
 
-			spage = nth_page(spage, soff / PAGE_SIZE);
+			spage = spage + soff / PAGE_SIZE;
 			soff = offset_in_page(soff);
 
 			n = (slen - 1) / PAGE_SIZE;
 			n += (offset_in_page(slen - 1) + soff) / PAGE_SIZE;
-			if (PageHighMem(nth_page(spage, n)) &&
+			if (PageHighMem(spage + n) &&
 			    size_add(soff, slen) > PAGE_SIZE)
 				break;
 			src = kmap_local_page(spage) + soff;
@@ -270,7 +270,7 @@ static int scomp_acomp_comp_decomp(struct acomp_req *req, int dir)
 			if (dlen <= PAGE_SIZE)
 				break;
 			dlen -= PAGE_SIZE;
-			dpage = nth_page(dpage, 1);
+			dpage++;
 		}
 	}
 
diff --git a/include/crypto/scatterwalk.h b/include/crypto/scatterwalk.h
index 15ab743f68c8f..cdf8497d19d27 100644
--- a/include/crypto/scatterwalk.h
+++ b/include/crypto/scatterwalk.h
@@ -159,7 +159,7 @@ static inline void scatterwalk_map(struct scatter_walk *walk)
 	if (IS_ENABLED(CONFIG_HIGHMEM)) {
 		struct page *page;
 
-		page = nth_page(base_page, offset >> PAGE_SHIFT);
+		page = base_page + offset / PAGE_SIZE;
 		offset = offset_in_page(offset);
 		addr = kmap_local_page(page) + offset;
 	} else {
@@ -259,7 +259,7 @@ static inline void scatterwalk_done_dst(struct scatter_walk *walk,
 		end += (offset_in_page(offset) + offset_in_page(nbytes) +
 			PAGE_SIZE - 1) >> PAGE_SHIFT;
 		for (i = start; i < end; i++)
-			flush_dcache_page(nth_page(base_page, i));
+			flush_dcache_page(base_page + i);
 	}
 	scatterwalk_advance(walk, nbytes);
 }
-- 
2.50.1

