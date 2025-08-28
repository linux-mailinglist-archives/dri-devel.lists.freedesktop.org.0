Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D395B3B419
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 09:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540F910EB56;
	Fri, 29 Aug 2025 07:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VVprN8U8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C2810E6BA;
 Thu, 28 Aug 2025 07:35:57 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-afec56519c4so72499866b.0; 
 Thu, 28 Aug 2025 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756366555; x=1756971355; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=;
 b=VVprN8U8jYSaVS3eA+X8pmAaKeni5QtatXlmwzkATgF3acBdJkDAaS9hD+SId+TfJ2
 UPJqF38yxeSxw0Q1FwNNwP2Ji8FepDWgCLtXFRWwcHr0WwRXV/rd5maS1d8muHRRoiFH
 TlY8t/KcblzXdFdkYZmaMRKSsOP2aZY2zR5K1ModSzskH/X3ruUla43dddTg89bIVfbr
 9/7dR1/+jxL9zMfafZwRmXIjOOJEgY/PQjXbw0BJlOH1N853A2hci8pjIaNxBci/15Iz
 HX86HZevCtOjJk6NKFImT45VeigCSihAA9eotOI6YxU5W4TRCTPHkT6dOJsex+hTIRq7
 weTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756366555; x=1756971355;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=;
 b=OH5cUQvE6m/D/bG/9z3SGMSKkimokWHc9u4POvJFrdGrrWmk/JhGti/PXqukiQCKws
 Wut3TnSl7fftu3GX3ogXMr6lm+EYr4oholU33aTu0qw5nVk0U1m7r/IYO3uT6yc+n5hl
 1DEIPZdrzG6uUFE/Knf7hlGWZFOo8iUmZ13m30pCTo+VjjjPBBde1BgFCXYBgra0yibR
 p281Xa3aedlxjxnHPuXAVJ1CQWv8BI8GjsRlY4rNe4PXdxPkUgt7hLf+cYdZO+3jIKiG
 E12DSDUda7EWQAg3/5QkMTBuiZCCqmOXbAADogRnbEUZjecXldNt28F6WkhrfDso9W2u
 qyCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOUK7PzRMOffBAUzuVpapRSfoIoTSJr6O4n3QTxaxj8WuLBZlP/tHGQvcEKX0+FHmPxO3S719NW9Dp@lists.freedesktop.org,
 AJvYcCWPpXgoQhe6rNIRciySGOHYfOSrNK0OfHRGtjavJA50bEwPiCoqgxKXEZrRonr5/0jls1rzB7w7f28=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcwbX/Ou6TJtqSYxAegw+udeE3FO6/KJXNW0Fl9B2L/5EHGPsK
 P8TLHa11SlWa+/5jg8RzmkWRZ3jyzVWsTh4f/gBxAgp6T4gkzljkygEt
X-Gm-Gg: ASbGncuzKHV1dgxYBV+PVRXPgV1Hvn6VdHMNPzL7fi3E4mEc7qDsT/Xh+WhZXRouLkb
 Plofc+ee0+EKKiukPyw/fn9aQhv7qIcNcViqPe5c7zeb99SUC6VCdceEBGyAc8EPUu7WRcYNRJQ
 icEXngZr+IbNlKZDnPKSTEdNEUKpI2Nj2Jke4O6Any+71/+Gq00n+PXcmnQgboPuvXAN8ncgnBW
 YQ17dOOFmzravNRR6fhJO00AMLYl9eKtas9tNB1m3kyVR4uCtc7qKHMeAAL/o+FB4pHyxkxTsqa
 Zq4kDqZfTQu1HLfDNbRF9k3UqW0Yu7thb9NJiwrCHZ60h/5zy5RRo5oxQo8Pu0drOnaQ+vqCHp/
 oM+2j0cT22s+LeA6iEbKgbC8Kxw==
X-Google-Smtp-Source: AGHT+IETTLjGc3PPKg04ncd1zRzcObVAV207MWaWJmOCZt1EmbrBQuEK0aAe9NGL4LI6P2OcE9HkdQ==
X-Received: by 2002:a17:907:fdc1:b0:afc:aa44:bda1 with SMTP id
 a640c23a62f3a-afe296bcae4mr2097332866b.54.1756366555363; 
 Thu, 28 Aug 2025 00:35:55 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe68891cefsm988052566b.66.2025.08.28.00.35.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Aug 2025 00:35:54 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:35:54 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
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
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 10/36] mm: sanity-check maximum folio size in
 folio_set_order()
Message-ID: <20250828073554.evipmbkxrint3tbs@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-11-david@redhat.com>
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

On Thu, Aug 28, 2025 at 12:01:14AM +0200, David Hildenbrand wrote:
>Let's sanity-check in folio_set_order() whether we would be trying to
>create a folio with an order that would make it exceed MAX_FOLIO_ORDER.
>
>This will enable the check whenever a folio/compound page is initialized
>through prepare_compound_head() / prepare_compound_page().
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me
