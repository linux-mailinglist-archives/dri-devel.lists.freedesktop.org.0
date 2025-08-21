Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5AB3037C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BB710E9D9;
	Thu, 21 Aug 2025 20:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EWmTx4Rj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C460410E9D9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9hzYOZv6YXUN4v1wicJ53nqMhopJDezqYU76J2buLg=;
 b=EWmTx4RjZtCZ7kg4HR83O1EJQXuv8z0JaWHNVZmRffw25gjmdbNTqKHFk6fzVe/u4OsvpS
 eBodD6HE0gwQub4KkqnpJU2Djaaqv1zg7PosGVFlsAoys6OnC2dExqc4ngzi+8YZb2zitv
 krL867E357KPmbWQTqrlUVUoberRDFU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-ezPRUfxCPA2SCbjaGKrJAA-1; Thu, 21 Aug 2025 16:07:31 -0400
X-MC-Unique: ezPRUfxCPA2SCbjaGKrJAA-1
X-Mimecast-MFC-AGG-ID: ezPRUfxCPA2SCbjaGKrJAA_1755806850
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a1b0045a0so8434335e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806850; x=1756411650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9hzYOZv6YXUN4v1wicJ53nqMhopJDezqYU76J2buLg=;
 b=CpUk9lfsIYaSedF1HQ70aKaHPQaI8AIYD7x65lwKGtFPth/nFmPGl3X8E6R6TWtFuh
 9rmzYuKpgduhDBs/nOWH+1WZg1V0UJV1T26yqJS+C9c/B4Proc7AmcEUmHkYdbryuOCE
 J2zAIeEkp4NTec9pbMMfPk0pEhkqsu0k61yDAhQ/ih+MBwEUF5Fge3vj116gPgYowO/t
 Pw5uWMkFlyXEFGDfA7MyfbsC3oRTyMAiPh2V7XGmNc5uEu29BPStJH6Hf75vww1hmbKd
 hnWu4SNDGSht3YscpXGXDr4eXRsNluUavMXJQ6bum7ioaX+hVx8r7EuHvc86onJMK7jf
 4nsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKDbzvMhbfvRNwovucy2r8ZDG0ZSYFY5xXfwntJu309gFgjYg2HrBX8XoFrFB9HI/Mos+qKm5QOFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn7Domiox40dVifF74P2FdhQPiZWqkYURTzlKccUBXuL5gnxGJ
 PivYBXULLJWbNc12TTlYOv7nqhRzXfRK8a7W0eSzLPY9Bg9Vr558+MoCD8FkbifOCxuJn3lfrZd
 dacu2dyKd7OVTrq55g7YEB4Lv/2ToCXG9uYUNzBQizId/DbnbTfZSStucrjmskNAHK5ny1Q==
X-Gm-Gg: ASbGncumH+iQrq4M/BshHEfoAUPQZFeHi0FxVQwZ/yW9/iTSiaus8XUqqz7Vz8H4xuy
 i8PCQInDREf+n97BlqxjeET82/zeba7RgdS2uWyXck12piWYivjuIV06pBoIc4dOaDxDll15gqA
 XUsS8KdwQ2z0TtE1x1IxxMnY62RIdahXJoMRLVrg+mW86QFG4IC/qnXIi/DyDvVU2h0/bXJhpck
 toBeUKYHzutjZQDd0jii7s5uom79JE+rI/0hcTRycOcpDQKJY/Hvrlb/wjXp5hB/pqBwzDLeI6R
 BoK2+8eF7f3dOspNr2iNMK2cY0Mr28yBvcLDyvskFV9ZVMyuS1wM/figeKs1Om5CdNUSSSFty4Q
 Ka5NwVWSKylt3DxTA1YE8nQ==
X-Received: by 2002:a05:600c:1548:b0:459:dfde:3329 with SMTP id
 5b1f17b1804b1-45b517ddbe2mr2955895e9.31.1755806850024; 
 Thu, 21 Aug 2025 13:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPNoTdvVqQJqQwQf/z0aFpcDb/7HunF1Y6KwbAqmFFF4D3cnAaKEmAnoGbjwE6N5eIepmoyw==
X-Received: by 2002:a05:600c:1548:b0:459:dfde:3329 with SMTP id
 5b1f17b1804b1-45b517ddbe2mr2955545e9.31.1755806849496; 
 Thu, 21 Aug 2025 13:07:29 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c3a8980ed5sm7242256f8f.16.2025.08.21.13.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:29 -0700 (PDT)
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
Subject: [PATCH RFC 08/35] mm/hugetlb: check for unreasonable folio sizes when
 registering hstate
Date: Thu, 21 Aug 2025 22:06:34 +0200
Message-ID: <20250821200701.1329277-9-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _x0OdO8NERkyjUa01fXG5tneb25jfqiuLYgQ4JGuBVY_1755806850
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

Let's check that no hstate that corresponds to an unreasonable folio size
is registered by an architecture. If we were to succeed registering, we
could later try allocating an unsupported gigantic folio size.

Further, let's add a BUILD_BUG_ON() for checking that HUGETLB_PAGE_ORDER
is sane at build time. As HUGETLB_PAGE_ORDER is dynamic on powerpc, we have
to use a BUILD_BUG_ON_INVALID() to make it compile.

No existing kernel configuration should be able to trigger this check:
either SPARSEMEM without SPARSEMEM_VMEMMAP cannot be configured or
gigantic folios will not exceed a memory section (the case on sparse).

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/hugetlb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 514fab5a20ef8..d12a9d5146af4 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4657,6 +4657,7 @@ static int __init hugetlb_init(void)
 
 	BUILD_BUG_ON(sizeof_field(struct page, private) * BITS_PER_BYTE <
 			__NR_HPAGEFLAGS);
+	BUILD_BUG_ON_INVALID(HUGETLB_PAGE_ORDER > MAX_FOLIO_ORDER);
 
 	if (!hugepages_supported()) {
 		if (hugetlb_max_hstate || default_hstate_max_huge_pages)
@@ -4740,6 +4741,7 @@ void __init hugetlb_add_hstate(unsigned int order)
 	}
 	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
 	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
+	WARN_ON(order > MAX_FOLIO_ORDER);
 	h = &hstates[hugetlb_max_hstate++];
 	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
 	h->order = order;
-- 
2.50.1

