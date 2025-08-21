Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC8B303D7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9C510EA1F;
	Thu, 21 Aug 2025 20:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UonbbPAB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9332E10EA1E
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
 b=UonbbPABs/WAVZJ+kINp2q/lhGgM2bobix8GHDf7b+5l8wT6zS1EEwQKVIipjhp7kANz1G
 6qN0HXc1f3tA5YdI62e4WfebyfFYLgR0INJwDIY+GOce3ZnZNdU9OpuLKm5ORDZ9vPb7NW
 kx5CHPOcDKoq6F21zkgReSDFBMZc1Mw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-ojsLkw86NUCAWE0Ao_-NAQ-1; Thu, 21 Aug 2025 16:08:44 -0400
X-MC-Unique: ojsLkw86NUCAWE0Ao_-NAQ-1
X-Mimecast-MFC-AGG-ID: ojsLkw86NUCAWE0Ao_-NAQ_1755806923
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3b9e41037e6so864601f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806923; x=1756411723;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7iPpUiW3LrFM0W3XrB+Z82uodwKTsefoCzXwhLbLUo=;
 b=bFL92H/46UgtDpZlHpl8ANxyOOibAGWFCdYQb2+J7lfdVhLfsY5MvK2Cyzn5NOC00h
 1u+YdRucc0NwgVMmqr0aBGoZT/a+NlXB5Fsal0hByE9wpS3Z4du6nlXcHoFNHq3I47go
 JLnWBBR3UAbF96Mo9/PtpFCgzWpd9GTxd2vaoAtkWDjmYe6ZTtHRDG0I5d9CmSuWwSEt
 dZh0qZbilCnVRS5l/X05LvPFG4L6uYZZo9FGi+LUNY/AYjF+u+MAjjLh2adv6i/3CQt3
 /trDsQflBdr3Tff/7PXtkzoQARa+MP4z8TuxEdbhVku2m2Rgzbo3UDGmyJ0ZtSxCBXFb
 ZU8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwKVwj5Im0bOzKITEkuVKYa+yloYq2UgQ51rRlBkfgqFrVjOksvi0p9jeWclmnJT+FUCLbCPQ7Ipk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3hbbR5sqUcllMvftc0V5NDolZj4Ir3YNDsKD+aC7uKnFenqRp
 tkpWACpfHnZ7AbNzS9/Qu1+xnP2DzUmJaqSK9RKFZzgWuyQZ4Ev52WVIdnGeZLwtfU8DqIVVbua
 nPNhm5DDdwp3ntf32+dugbDIQWOJ4cqP/uH2DN10HQidNU1p0vBTzcpCBkGlVTBPB02Oebg==
X-Gm-Gg: ASbGncuKXa7BXoxMnFCUQN1BWL9j1eynsxrrl5fM7IipgfgRIuSTiiMoS14uHhxVDOS
 JAweEALoOhZGmPHf2nqbwetRYIbSKV1vLEJQ00zXn1QPkUtENfdNAjY3PQ/krdL3iPQ4sbf0RIs
 fWPJdIjOIdZB7jjoZZf35j0vejXhJ2qeD1eL7dWQ067OfS4JmakRq6OO47DRuC+fVvZIOOV2UsD
 K8v8RuDsZ3UwC0kRKzR3ccCPbK4HZmPrYzjSh7jfcDnoUormBlt53eqLFmrPMIdXZQeX86jdKIt
 EnugmdpJZyL6f/93dDXeygtHcYLW7ry8WQo/L0qId7X2pYYOZSoJqFOcdtZCn8nM2wHCWsNX61v
 dJn3rZ3ywm/LHcUaeWfRwEA==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id
 ffacd0b85a97d-3c5dc7313famr204676f8f.33.1755806922950; 
 Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnHzRKC08dohUKQD/XdldMc6IWYVddiLtTh8Yidep5vx+5++gzVG23SiimMwYZ+HldR36Zkg==
X-Received: by 2002:a5d:64ed:0:b0:3b5:dafc:1525 with SMTP id
 ffacd0b85a97d-3c5dc7313famr204645f8f.33.1755806922505; 
 Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50e3a587sm10028205e9.18.2025.08.21.13.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:42 -0700 (PDT)
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
Subject: [PATCH RFC 34/35] block: update comment of "struct bio_vec" regarding
 nth_page()
Date: Thu, 21 Aug 2025 22:07:00 +0200
Message-ID: <20250821200701.1329277-35-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ISrmDSNhSzzoJ-bcr-A9Ys3SOugf0Jyic2DnALKDZmQ_1755806923
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

Ever since commit 858c708d9efb ("block: move the bi_size update out of
__bio_try_merge_page"), page_is_mergeable() no longer exists, and the
logic in bvec_try_merge_page() is now a simple page pointer
comparison.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/bvec.h | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index 0a80e1f9aa201..3fc0efa0825b1 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -22,11 +22,8 @@ struct page;
  * @bv_len:    Number of bytes in the address range.
  * @bv_offset: Start of the address range relative to the start of @bv_page.
  *
- * The following holds for a bvec if n * PAGE_SIZE < bv_offset + bv_len:
- *
- *   nth_page(@bv_page, n) == @bv_page + n
- *
- * This holds because page_is_mergeable() checks the above property.
+ * All pages within a bio_vec starting from @bv_page are contiguous and
+ * can simply be iterated (see bvec_advance()).
  */
 struct bio_vec {
 	struct page	*bv_page;
-- 
2.50.1

