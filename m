Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8716CB30366
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C356A10E9CA;
	Thu, 21 Aug 2025 20:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N/x7g2Gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EB910E3BE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zfh98TqNQqR9uCNr2hB5bEgIJ/15ql7Yv0zNbj5EC/8=;
 b=N/x7g2GmM2Y+GNvXIudCJPlMxW6wb2pOQh0itTOdPgmVpr5bIiD/10Qgs0sEFtIJJ/Ionq
 y/oJ9m8uW5OgJVJRFYL6x90zADPzDhOnW5Cff8ALZ7yi2udqSNDaMe4Teseknt/jEeYZd2
 MR1bj7HBKjwsCepEt9I9fJIsGt9bgYw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-n_W3KFXsNSaksQGsJqK42Q-1; Thu, 21 Aug 2025 16:07:17 -0400
X-MC-Unique: n_W3KFXsNSaksQGsJqK42Q-1
X-Mimecast-MFC-AGG-ID: n_W3KFXsNSaksQGsJqK42Q_1755806836
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3c584459d02so247097f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806836; x=1756411636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zfh98TqNQqR9uCNr2hB5bEgIJ/15ql7Yv0zNbj5EC/8=;
 b=g1zp1MNllM+HI+qc6IBacCj6GiI+MjifaSV5uWag38x0WcTiI0jp8h9YnIExLrG/Ml
 VD2mJDMkvi1e9fpcr7hyGP1elRY35nKbrzh4zHnqgNV2wrJRjGFH86AUP7f4XAll0gJp
 3HoM+yo+f5y8pUAOkn+g1q7AlxjnE1CV++lgc4yFPWwAXoZT9NuR3VDCjnMMwB4/4uqj
 yYr/wfebNaL/Jy/sD8bYdbYQGPXVlU0lKqV59I+uvkMKi6swl1/yocnFIyzI5Rfmn+QE
 gAxFLqzJV6CCmegOXoWJc/vqZ0GB56yGsj1C2VEe77C8pGV9teO/ygFQcSpZzNc96flX
 a45A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhQ6EHSHm/6iHE0rXFJ9LDx233Y81uEhq1Qn/rpNeJ1Ffi05dl9dc+WIaZbnWTBG7gKDendra7UJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxazGDw82wz7ZcU58Dbgw152EWoaiR9XwuGZdHxh5NKDB+Ua5/2
 Uy+L4qK2wE2qloWYZh7XHhMS4J0Y6khaT6mwr8ajQU+Gp2jW6dKMXWq6McNBi/xis78FStwNv+s
 gscX3vdZIHBJwWGji+5gxIyY+No2nAZlqNbc7t7Z7riQMQx+JnBoWZ7PDHfFubltlGN57lA==
X-Gm-Gg: ASbGncspdBEEOHs8csHyUU75Km3jEACl3UCDA5M071t0YtEfu/q9Y22t7xOtnlqhoMJ
 4av+ZhbPW/mJ332cyaDyhNjNJ9AVLq9Df9XaYB7g1F6c6ABA8/jsR3BikRLNQCcU1dCN1Fvn79k
 I4KBPHco9l1tRrWwZb5IhWNvh0xHgYlD44wWYDtzNKaSGKJGfzZY7rsmS0E2aLoF1zo1xGwXh+2
 YRjM5PRm5uwfDqcHcVFePfbJMkAJ0p8Wt7aI75uKa0Pzem6Of9OCdEI03luzbl6snsRlXk5dccs
 L3JvD729+U+yZlzQ0Hs0ttK/9ZsV//fzthpKhPjN+kU0gbp7zP+d2d83FBiBw844TJ//CuNW6/f
 naV2GDAPMFvOumE7WY5SaFw==
X-Received: by 2002:a05:6000:1445:b0:3a5:27ba:47c7 with SMTP id
 ffacd0b85a97d-3c5dcc0da36mr163011f8f.48.1755806836157; 
 Thu, 21 Aug 2025 13:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpC+bUbLbCjHqucY3RiMYJPd72Xl9UYU3JmJwOiC1ZPXsKWXLLEiwWSHifO8HwGgrBWSbiEw==
X-Received: by 2002:a05:6000:1445:b0:3a5:27ba:47c7 with SMTP id
 ffacd0b85a97d-3c5dcc0da36mr162946f8f.48.1755806835650; 
 Thu, 21 Aug 2025 13:07:15 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50dc00a8sm10958175e9.1.2025.08.21.13.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:15 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
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
Subject: [PATCH RFC 03/35] s390/Kconfig: drop superfluous "select
 SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:29 +0200
Message-ID: <20250821200701.1329277-4-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: upblRGfi73X4eUZ7XXpoU4y51Ep-4JPYqTiDdYD5IsI_1755806836
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

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: Sven Schnelle <svens@linux.ibm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index bf680c26a33cf..145ca23c2fff6 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -710,7 +710,6 @@ menu "Memory setup"
 config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_VMEMMAP_ENABLE
-	select SPARSEMEM_VMEMMAP
 
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
-- 
2.50.1

