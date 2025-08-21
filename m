Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1EAB3039F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823BC10EA01;
	Thu, 21 Aug 2025 20:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jDPfnpv3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A3410E9F6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
 b=jDPfnpv3+N2oUxzL5Ms/5QeVqCMWtriLWVMs1G7Kk3oF7j6obMtvwE4/l4Rl3RVImRwBMJ
 tYlwCX+2//9mdOdWxx7BRMqQeSIGCfrjNDue+zl1985K4KJuXla1qfTmWwK0XOlsaknX3K
 estHeUaIsFKzD8WJkn1aT3SLSx0o5BE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-iyLQS7M3Mi-ktLTBgVbqnw-1; Thu, 21 Aug 2025 16:08:01 -0400
X-MC-Unique: iyLQS7M3Mi-ktLTBgVbqnw-1
X-Mimecast-MFC-AGG-ID: iyLQS7M3Mi-ktLTBgVbqnw_1755806880
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45a15fd6b45so10808065e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806880; x=1756411680;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6VkvDa+3msZeC5nA9B9+aDln+Mg2ABReefULBX94/4=;
 b=lDqyEAxqzt6OV0OpCUxsSbTIk7j6iXEqv8oDQDc3orFkO61/NCw5qGzbStJaH7U7pZ
 QEX0qdJtOAlw0pbvsSOvhzAiahErmszWVQd1pMlgysf9cOAYVrP2JZjnGn0jHqaKQbct
 V6Z6PCyUN3z6qBhUiGiwPfm5N0IWEl6b/agdDCNvycyDFuq3Dv7ghZgQ52HM9wiwLIK9
 2MbZgnYExrm+6JnqFXfeFuvBa6+NtNeUEU53CWsN/drD6/2BtF3eXhRMMIqWd+yAq7lx
 YCHiN5Gu5Zjphgbib7jycM1mxO02luoHNj+YsYimQgV+7kxemVM54BRmOHBjfVWh24cQ
 xcMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZT1rYDOKD9k50pFV+Phhxmor05T6MicEegfrk39VfKnt6p1aNYD17ERRG2UhrX0I90YAaMkXrAWY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbEy5j1XRTiHHMyhUkfFfgs3Hc8P4duZVyMi7DEgTmyHI51aUe
 v7wnyhKKNO0UnOHVhLDO32+hgxLi1xPLN7SO1E8nNICOwxDxsK6mxqnuY/wXKx7NkQeJlAb+KEo
 GbDNLA9IxkpDRES2eh28BEdQyRxZ68Zs2qb7XtDlPAZldk1IjtXMvxDoUSXz0Kk+8KkoQQw==
X-Gm-Gg: ASbGnctM+6RQuwcMqfFsPFMmvSMwXQHWt/4oashvbwhOofg3vIozcZYkEyPG62Q1ZT2
 Fx+nBDdLiceMFtxW/zRi+Sg1VnpoeLy4tsobcM+RodMUH6/oun7Fg6pEh1Mn2ngwCAjeJuC/Dhg
 oQcnwNrxLDsEv8aQCygoogYFyhwTzSE2Z4Otb+fGPjJlBCeOkA65dH7aNPwLIqXYYibQeLOAZoI
 dCO7mnKio/kByF4SkMpq9fNkVEyJ7ELL239b+gzrG4MqiQDs8nmSL3BsVHIaHuo+BQyuMadcU4g
 4Y3EdGJ5aGfverEbDZTa2pkCwK3UtU0kLp9n2NwwVtJw6fRAVknrPTinqAC3okbfnIF52ASMinH
 WC40POWJmuVuofCtpyrqTWg==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id
 5b1f17b1804b1-45b51792539mr3328895e9.11.1755806880061; 
 Thu, 21 Aug 2025 13:08:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ciI0WdoI3CxhUtu7m/cESVsdReJmvmXFWCMaWsO+hhXySreox2GeOL2sJ8kVyLPwCYhbEA==
X-Received: by 2002:a05:600c:1c87:b0:456:942:b162 with SMTP id
 5b1f17b1804b1-45b51792539mr3328365e9.11.1755806879543; 
 Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c07778939bsm12219075f8f.46.2025.08.21.13.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:59 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
Subject: [PATCH RFC 19/35] io_uring/zcrx: remove nth_page() usage within folio
Date: Thu, 21 Aug 2025 22:06:45 +0200
Message-ID: <20250821200701.1329277-20-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JulSr8isL5RzOhFUEjdfX3hOSaI3rseyKBmLRjccoqs_1755806880
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

Within a folio/compound page, nth_page() is no longer required.
Given that we call folio_test_partial_kmap()+kmap_local_page(), the code
would already be problematic if the src_pages would span multiple folios.

So let's just assume that all src pages belong to a single
folio/compound page and can be iterated ordinarily.

Cc: Jens Axboe <axboe@kernel.dk>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 io_uring/zcrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/io_uring/zcrx.c b/io_uring/zcrx.c
index f29b2a4867516..107b2a1b31c1c 100644
--- a/io_uring/zcrx.c
+++ b/io_uring/zcrx.c
@@ -966,7 +966,7 @@ static ssize_t io_copy_page(struct page *dst_page, struct page *src_page,
 		size_t n = len;
 
 		if (folio_test_partial_kmap(page_folio(src_page))) {
-			src_page = nth_page(src_page, src_offset / PAGE_SIZE);
+			src_page += src_offset / PAGE_SIZE;
 			src_offset = offset_in_page(src_offset);
 			n = min(PAGE_SIZE - src_offset, PAGE_SIZE - dst_offset);
 			n = min(n, len);
-- 
2.50.1

