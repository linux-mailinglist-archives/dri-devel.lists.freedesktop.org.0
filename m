Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E60DB3B415
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5595D10EB54;
	Fri, 29 Aug 2025 07:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WMgAY7RS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B05D10E6CD;
 Thu, 28 Aug 2025 07:37:58 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-61cb9f6dbe7so1131551a12.0; 
 Thu, 28 Aug 2025 00:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366677; x=1756971477; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=;
 b=WMgAY7RSZ48rQF9CxGJ1qXnOzw6U0P4GaHwBa9+EduNcJallioKhnj4jSIkYTbTwcI
 l84sZTcQ5Z5uas9ZQzi+j76+0dGuFzWMjBcrkp833NuMHlkNTDdbx1xevTFBI28gakYy
 QQoN+GaW4NVpZkwZ4BnXO8N9ev4xPg9YQol3088Azw9JUMjp0+k0oxkM6pVOzDvq44ta
 lTdERaKgWznH0HJKqm9PRYL6wKBBR4qdwozYWsDaBVL9Vi2wNMahUGXeMEKlt93i6uMB
 TlrTTq2hmL8gvFuGu94VGbibEkSooCVjJkeARQNVNJhZNf+u4x1u+scZsvwMtl4Hvve9
 KXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366677; x=1756971477;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TVrt2ctwbXgHbo+Hn2TZ0gCxiv/sLljbJFjbqAY/TQU=;
 b=ZvYQPFR0zjSk20NnnZ6CywKA8dppTd2UHqClyikd2tLCSvnpIkRh8Wscc5EAEPmR3q
 aOGJn8ekkUA60z/Qh/Iqlvdsj6WLpbtM6cF3smTUnBBk8J90ERjCKrBqjMbzl+vrJ1uL
 54nK/duR5J6+378bBO1uu1vWow7KPegq/My3hs2l7HD5320qPadf+5lAczE1d2b2/wvA
 ZkIzm79fHTd9170HGVZ2doU98Nad2nBeOAiDDnTOlv3Fhix/mx87SW9mx4djG/XZXYmh
 50sqVyYRXz4wrHoWCAu+la3Q+hFKvnkD76P6AaH59NbZ0q0CfhHNfENW+/GXsFOepumY
 VLww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj5Q2D9F/em6/a91ksWKVjAuLb4A58VeHSL94D2hL2bvyNrlqt5VeDWu77dIwo7m/XT/FSyiV5iCYj@lists.freedesktop.org,
 AJvYcCVHSVYDOB/UGki5fisdn2V4FHyAoemiIDH/wH81V03Heutn19c4uJYdij25L2ml19vkYjdBmJubsQo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIUE3XZ3TpDy9qrgG9KJcwEA/xFW8W65LV9zyg0omAydHMwrCA
 Cnue33T7sweJuUkAmzSj6lfwwl00rnErqvL5VCDjp84zbiaidReOJWZ1
X-Gm-Gg: ASbGncve2s19361mDjkRDGMaJ5aYL4STvqGtBd5mUOCnHm5eBStRSLG/n3CZPtMPxpO
 9QxZgobxNKaCrljqWaSkHfyEIiMfFqaO/GutA6R9O58eXsNO5m8xNBZZRVO4qxi8QA/M+sHP/MX
 34gc+gsHokztxcUcWBOUQl+r2RhKbX+mXnflTezS0y4EjLxgAg2v+zrHxIBwBS3595t6twk0SBJ
 gm6hZT+t5n+PqUlE+I/eAl2+bOlesQ3IWZVZBV2T6wVbgkcbTJPTMoNqikmeyttv+gLKswDNca9
 NCjGiF5qH6OAfHuEXAjoWOk8pHdg94VyVwVC6A1HQOh8RZj61jdzzrRqtdu5Tg/rimyrAk3uuZw
 9XQDw/POFjg541N7IOPyVqh03Pm8AFb6G/6SMrzjazdOv03w=
X-Google-Smtp-Source: AGHT+IHzpXzU7IRYTRL9u8s1GDWZ3U5CYmUtBakw/pIBZX/rgdseIwaMMauanPlQhlJ9DDnzYy2q2w==
X-Received: by 2002:a05:6402:52c4:b0:607:28c9:c3c9 with SMTP id
 4fb4d7f45d1cf-61c1b453182mr20154119a12.6.1756366676733; 
 Thu, 28 Aug 2025 00:37:56 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cdb00baf9sm715248a12.33.2025.08.28.00.37.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:37:56 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:37:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>,
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 11/36] mm: limit folio/compound page sizes in
 problematic kernel configs
Message-ID: <20250828073755.gyq5cyafrxb7lnw2@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-12-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 29 Aug 2025 07:17:00 +0000
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 28, 2025 at 12:01:15AM +0200, David Hildenbrand wrote:
>Let's limit the maximum folio size in problematic kernel config where
>the memmap is allocated per memory section (SPARSEMEM without
>SPARSEMEM_VMEMMAP) to a single memory section.
>
>Currently, only a single architectures supports ARCH_HAS_GIGANTIC_PAGE
>but not SPARSEMEM_VMEMMAP: sh.
>
>Fortunately, the biggest hugetlb size sh supports is 64 MiB
>(HUGETLB_PAGE_SIZE_64MB) and the section size is at least 64 MiB
>(SECTION_SIZE_BITS == 26), so their use case is not degraded.
>
>As folios and memory sections are naturally aligned to their order-2 size
>in memory, consequently a single folio can no longer span multiple memory
>sections on these problematic kernel configs.
>
>nth_page() is no longer required when operating within a single compound
>page / folio.
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
