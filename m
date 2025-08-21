Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677BB303BA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308B610EA0C;
	Thu, 21 Aug 2025 20:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JCVudpc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0010EA0C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5m4ogAvLOK+AKMqlHwhkjmyVbS/4gGgmBykcdwEFmjg=;
 b=JCVudpc1EzHSdet0Lv869NS5JhVzMl/TZ2wP4EaCZlWK/ZJp7RwFAbctShI6kwz2F8tYea
 IvFU7XxL+S25GidIooIm+Oka7uuwswEc3GVyJ0N95erev81Cxn7HpmAxX/wuAqH903fslf
 2wKB0XdMwfx6wAItl4c1X9ZQ2zVIXOo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-kziBwn7SN1G1O6BuKLFbRw-1; Thu, 21 Aug 2025 16:08:21 -0400
X-MC-Unique: kziBwn7SN1G1O6BuKLFbRw-1
X-Mimecast-MFC-AGG-ID: kziBwn7SN1G1O6BuKLFbRw_1755806900
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45a1b0b2b5cso10141335e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806900; x=1756411700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5m4ogAvLOK+AKMqlHwhkjmyVbS/4gGgmBykcdwEFmjg=;
 b=mJ3V5UGRW6SZOeUbzFOXk04i1f7nJ83Kl4Q14dgXRe76Xi2wMlIya/4HVXe1xUznhc
 2M3YoYDrAwdMfMo7ND+VqETELnP7bRpMvYZ/OPopC8qPAORO+p/fDeL6IqldUlc6dxGv
 GWLdlVHfNd8FaXLcbdITahv/noChK5txwtz4BmeG7bfh5YMvoeukUEsUNQVQy5g1b/TN
 Dkj2ZZfiCDESpn3NLrey92/3/fkQ22OMQm17SQ+9IrRrlY8F6RJRthCq/vGSLl5l1VkR
 w9bD28VqGIBdPC9bLH923yLZIDzY3DhW/NrTYUBjqohnyfZsDIyC35iMYgjID9Uvkj0t
 t7NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfW+bT4eeH2fwR+KfwyuXacEDFozGjtR7dnlSGQ22p592OyBBKC/Cynbtb99tfCg9zm0UIdgTyB9E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9LLglpFRKpyp5r68drx0f0vvuqvSjb7cWThPx1GI4kEFC7ch3
 +0bNO3AvAxinqcdQK60lUk2u7ydUCC+MWQtPRzIV0kcYUSkz1ydD2DVM1XoqM9UQ7OxwMEPD5GO
 +3Jjw/qClLN+RlmA6kZQ/l8Ngtlh0R8tuyei0+IJ2/e5qYNCywD2i4e1UMyPrXKAtmPhAiQ==
X-Gm-Gg: ASbGnctAPbrIY6E+S6cB7wTKqqBU1hc4v/WUaa+VrTe+/Ex4t4Vq9krr0KhhZSYBkeo
 O2k/ZlwF4wa7Hgc50+FdEKUzSbs1bbJ1d1GmdNGeYeSI4J8W7i6vs+vjVk+ADThWcQMfLjQ1Jwo
 5E5aSxEq68wMtGmCCNuf+XX3JBMyDd5NPV6rhzNSXOTvWGC00ausecXVynrEKSe0Ygai94m0/fi
 AGdRp57u4MuZIXdEY8DCOfJTEdsiYxS7HR4s+ctzhYh14dHyiAqcTE+dZwXE5n16fxm9Hh8rQwP
 50rjVKfTTUzWTHYJMokXgHbasj4UQmftXvpsXRQM2uGp7b+Qnwwn4vLf2hF5J8ox6c/FN3LbBGs
 FAXhpAs2s3L3EQA7Q2xeJmA==
X-Received: by 2002:a05:600d:15a:10b0:458:bc3f:6a77 with SMTP id
 5b1f17b1804b1-45b51f2fe8dmr510525e9.2.1755806900322; 
 Thu, 21 Aug 2025 13:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpV2b3uhR/IYbmrTMgtg0gx1wkF4+JdBDenNBBSMhYf9nynPUCNMa8PTADPxo4/liFiw6TqA==
X-Received: by 2002:a05:600d:15a:10b0:458:bc3f:6a77 with SMTP id
 5b1f17b1804b1-45b51f2fe8dmr509915e9.2.1755806899756; 
 Thu, 21 Aug 2025 13:08:19 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3c07487986fsm13999227f8f.1.2025.08.21.13.08.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:08:19 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: [PATCH RFC 26/35] mspro_block: drop nth_page() usage within SG entry
Date: Thu, 21 Aug 2025 22:06:52 +0200
Message-ID: <20250821200701.1329277-27-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nKj6k7rP7CqxZF9fBP9CVot6x0puKn438XhMfIxeBsc_1755806900
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

Cc: Maxim Levitsky <maximlevitsky@gmail.com>
Cc: Alex Dubov <oakad@yahoo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 drivers/memstick/core/mspro_block.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index c9853d887d282..985cfca3f6944 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -560,8 +560,7 @@ static int h_mspro_block_transfer_data(struct memstick_dev *card,
 		t_offset += msb->current_page * msb->page_size;
 
 		sg_set_page(&t_sg,
-			    nth_page(sg_page(&(msb->req_sg[msb->current_seg])),
-				     t_offset >> PAGE_SHIFT),
+			    sg_page(&(msb->req_sg[msb->current_seg])) + t_offset / PAGE_SIZE,
 			    msb->page_size, offset_in_page(t_offset));
 
 		memstick_init_req_sg(*mrq, msb->data_dir == READ
-- 
2.50.1

