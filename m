Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0201B3039A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0162C10E9F1;
	Thu, 21 Aug 2025 20:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gw13t9nD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133BE10E9F0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
 b=gw13t9nDpGG3U2GGHMcx/2sRRR9KRkg1799gYSbpZQy4XI+pCFyIp7adDzu0khQO8BlEpD
 lsze6by2yDpulNWR+PJFam3a3xB1nScMtY6y+/YUHGdU/1aG7lVsqZTdUdI9gZXt0cQ3+e
 lab+ur2ji94m2LOBF2zm59gUmk9HE54=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-yleJ0rngPsmpxy7L5_I9tQ-1; Thu, 21 Aug 2025 16:07:53 -0400
X-MC-Unique: yleJ0rngPsmpxy7L5_I9tQ-1
X-Mimecast-MFC-AGG-ID: yleJ0rngPsmpxy7L5_I9tQ_1755806872
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-45a1b0b2b5cso10138425e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806872; x=1756411672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QCvnB/7xI7T/4p4mwWx/D4+W6s//h9G2+oSyfbDOFZs=;
 b=w5VE+p4O91Bwp86DMn1TG7EmC1kMKKCjBNaAyyfyQ9cZbS//7P9Fc424lNY3FYrVDX
 wY7mYCQQK48flzbOb34Nxk2Vkpq2WmQ2GPq/hAnMHtIqXBNhF5233cBR1InFiyDQix5X
 +vlcabwx95fIZtbPCm0W0ivfR/iBRNxMAMUR6ODxDAvZqJACuVapZNmCCIb2e9tu94BF
 FxMXuXQ5mACWqc/KDOTmKjKlr0imcraff0zw0Gdb7C2ee3q8+guOLtK9MfYVqIsyHbXU
 Q+RQcwuRq5GLwUn0H+vWKFb9lXdvHp1dkanU+y4rKk0u9ZYk/WMoHippdxpE3iTYU59m
 2CKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgysAgsMKdV2u0orpTxc3BCufl60VdcU1OUnixAhalLn0nC40k3MNXbZojWxb5K7RPFPyRBdFv2H8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqTiEPJB0htJm+O+DvaNVobRXfQGDCcY4/7L6jUnoHjLkwoR0u
 ppIbeFErTsXdSlQmOx34m4/jy+bs3oj7+0ZKiyiVfJ6YK4lZW1Bqeu334vyGfc/jDmuoUIkvtNG
 SYS7+t53GLQhZgUEWqp5kKJ4zz4w/PNvYzy+oDQJNlCgdxcewIcQmnTrcvZTDqkpynDJCdA==
X-Gm-Gg: ASbGnctXPnAbtFYMsk4CIp1S+AEbVrT/ZGN8+7cY/h3p7EOIN+mxYTDDpvVBg32Gedm
 ZED8uV9pU4LRMvFnvZSowx2PJr56RrRIGNpjksF6ouei8FYjed5nCRtZ9KLTjR5bTvdFkeF857x
 cXgfxkWoqB2+bs+eKK9bG5PdEbKmtMJ8NjB+T8WV1bbFWDygpUgR9HPishUu+fqS2Fr0JlGHMzt
 QAabGJ5nyXfn4YtiD/G4ZNJhnPtMiMpKEYODDOmwmCkObBFHGpCHqFyBqPXeiM+IxboZur3wzET
 /ti+BuacA9Yo44GXeQ/8cl8xF2w6ZSXEutkyV6MIhRdGU4ToatHyr7APl0Xixf/MO29ILaOVyiW
 KTcniTyrZh60UO8fmcMGDfg==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b5179e897mr2278775e9.10.1755806871564; 
 Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQe1GSIQC6LfutgynQLrqB1o4Jo0GTrBjlhxRWjM7nqTD8l8oEo1HOcPxtIuVQVn3tsHm8QA==
X-Received: by 2002:a05:600c:1d07:b0:459:e025:8c40 with SMTP id
 5b1f17b1804b1-45b5179e897mr2278575e9.10.1755806871147; 
 Thu, 21 Aug 2025 13:07:51 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b4e1d77e0sm22159155e9.0.2025.08.21.13.07.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:50 -0700 (PDT)
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
Subject: [PATCH RFC 16/35] mm/pagewalk: drop nth_page() usage within folio in
 folio_walk_start()
Date: Thu, 21 Aug 2025 22:06:42 +0200
Message-ID: <20250821200701.1329277-17-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FJ34SKyTzlWWC8Y8ZYNUMdAK2M5TZNNj0_qSY73UqME_1755806872
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

It's no longer required to use nth_page() within a folio, so let's just
drop the nth_page() in folio_walk_start().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/pagewalk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/pagewalk.c b/mm/pagewalk.c
index c6753d370ff4e..9e4225e5fcf5c 100644
--- a/mm/pagewalk.c
+++ b/mm/pagewalk.c
@@ -1004,7 +1004,7 @@ struct folio *folio_walk_start(struct folio_walk *fw,
 found:
 	if (expose_page)
 		/* Note: Offset from the mapped page, not the folio start. */
-		fw->page = nth_page(page, (addr & (entry_size - 1)) >> PAGE_SHIFT);
+		fw->page = page + ((addr & (entry_size - 1)) >> PAGE_SHIFT);
 	else
 		fw->page = NULL;
 	fw->ptl = ptl;
-- 
2.50.1

