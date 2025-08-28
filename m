Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAADB3B416
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFE410EB57;
	Fri, 29 Aug 2025 07:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CEaL4I+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1BD10E6C5;
 Thu, 28 Aug 2025 07:31:53 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3c8fe6bd038so285005f8f.1; 
 Thu, 28 Aug 2025 00:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366311; x=1756971111; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=;
 b=CEaL4I+it9cgp57KMDikpt/a02qr5I6TTfPmP78VeShHL66kf7KILrF4OICBZn7KTN
 3FrNqS+Xe5cRsL6Vurl2WTkKXjCsPIA1CAMtUNEjcOxIQ2a+RADo7uOtGLy6LJhqtzCm
 NhHqweT+cn1qH4S7UuukbQ8VVnFUImAFAHyD3F9WPzEzc4uBEOHzBjSTeXM3ysqoAgmj
 QRXLIzyy1pta791ixE0oE1Zk+veM94gb/q4B4o3xfKuar1hz8jHb1MhV/QTyNYqVZ81T
 0tpqmmhAqLmZ6SvNxOdUsdupnxVblSs8bS5eDrjK3JeK+cZKcxnXFToa9qTMNd5SYivE
 sAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366311; x=1756971111;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EuV0vIwmYzbGp0NvCAEdvEWsqc4i4ounAUIZgXtsn78=;
 b=v1KKOFTuFoIl94XLQ8zeQXbGzcHvDGxrg2klkZY4rwMkbxNIhSQFPFGgzze1+OeNQw
 xy7mgy8a8CVOBa92qpml/rJG2O/F567gIJQc3QATqzLDbJsgBUGkU+Sf/D6UYVIYHc0n
 zH5mS8Cdk6a1Ts8bnh46v8Tw3MqMQlIagHBDTzn7zO4S3jklvio6heHrcKoLUxAaRj9O
 O/y1JwZwQcAciqZfBjC+kQWDxxmoDyj+m9Z4U6E6DckEizeIOH+n7ClsVNJSF617ITG2
 GQiqSXUM5ZxCh/1slcM4xRzag0VgM/we181iujFbXpVGiIVUaZFPQ0C3vP8z7WUZz+kA
 jm1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2gR8KOBgVDHXs/Oq/C1z5QRrHpVcLWdPkFeoJxyn+Wo/mKjqg2rhjcCp6cUEfQmos2QVXB3NYh8JM@lists.freedesktop.org,
 AJvYcCUFlUtpSq/e87MPX7nhd7YXVsD6ykxniNQKwT7NhQ24Qmx7RSAYzEaF+JhfCxYdcGRzIRPjgLwt1Sg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLymk4gUvLbl4eqAgv/l2U+2C0sPAyGq8SncuJ01jHezRnUq6t
 XHAR9LSUnETFt37VGqj5CcdZWGELBy81xYXhlwRAVd237Ae+0TPM6EAZ
X-Gm-Gg: ASbGncsINzZ86x1YekCHRgF35v39x39i6rH6Fc0+qeemsQDtN73X81WxCplU0XkIapO
 PtBD06yjIaZ7j1oL4krEQzpmIZbzi4X6gGCTBdttys+xn/2O83Slgk4Z9/fePegXJH+PJMB+KsM
 PdqagMZPj/XUCwo1cu+wenaOjC81uBLQP+IRWUIz3fn0lZdXaTb1GAw/1n77ARfvsppKuVDTTEB
 z6tJTudsYJD5YPI6mNYdx/JQ5E2R9c6nfbh/C2ptj4xbHU7Uz1k0YL36HRcXyZxgDHCoknyUBSZ
 0a213neQRTUSTu+IvQK1GOA2usL0Qc+jDx/vRQEoc2WiZoR1gc3pzVQj0ctYBYDHCaBPDq5XL79
 +ExJ9SqjjeeMfJs97uiRS5KQSo+PDQxyOX7tM
X-Google-Smtp-Source: AGHT+IGYsCTFAB2u+mO+a+/7YQm7WCRYBnf/bqNrDbgJHuGpC+AeSLNYygCiHCIag3yJJPklKDadWQ==
X-Received: by 2002:a05:6000:2891:b0:3cd:96bb:b948 with SMTP id
 ffacd0b85a97d-3cd96bbc28fmr1837267f8f.47.1756366311260; 
 Thu, 28 Aug 2025 00:31:51 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c9c9324dc9sm14883755f8f.3.2025.08.28.00.31.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:31:50 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:31:50 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 SeongJae Park <sj@kernel.org>, Alexander Potapenko <glider@google.com>,
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
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 06/36] mm/page_alloc: reject unreasonable
 folio/compound page sizes in alloc_contig_range_noprof()
Message-ID: <20250828073150.jyafkufvkjfqwp3f@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-7-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-7-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:10AM +0200, David Hildenbrand wrote:
>Let's reject them early, which in turn makes folio_alloc_gigantic() reject
>them properly.
>
>To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
>and calculate MAX_FOLIO_NR_PAGES based on that.
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Acked-by: SeongJae Park <sj@kernel.org>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
