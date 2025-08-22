Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F60DB30B26
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 03:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45DA10E312;
	Fri, 22 Aug 2025 01:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fwCb0/jz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490C510E30C;
 Fri, 22 Aug 2025 01:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB83A5C6103;
 Fri, 22 Aug 2025 01:59:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0940C4CEEB;
 Fri, 22 Aug 2025 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755827964;
 bh=hEGBgFk9rer7lwQXMpzjj4FPsIa17LEhE/UyLSIHv80=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fwCb0/jzIQkNPwEVBU6dtHyOVey66bf/HcR/iNP6aS0AhxrgrvMe34HD6vjnkGUZf
 z1O8tLkMNZpr+UzcBZV9dLBbBCwOaf+NQwl5ntySvGabL1KCpUaRFv+wfDydW+poVi
 X5XvF2zmqSX16ZKS+hqRP+DFJCxEdKcM7wYo6L7tOqHJI3XrYsnweALvOp8+KSqJnD
 2bWhxr7953gGHvjXyBJUoUfk/Lgb2omKSw1C8cEO/Qv3yAqSEKl2XaKQVhYluUWO/h
 UsLkNxPauxpS9RjmwleNolFzOVx4bdRBpqA+ZD7ACyej3l0Oe7T142W2dhwsBnQaC9
 DSd2Q1+ARL+Zw==
Message-ID: <3812ed9e-2a47-4c1c-bd69-f37768e62ad3@kernel.org>
Date: Fri, 22 Aug 2025 10:59:15 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 24/35] ata: libata-eh: drop nth_page() usage within SG
 entry
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Niklas Cassel <cassel@kernel.org>, Alexander Potapenko
 <glider@google.com>, Andrew Morton <akpm@linux-foundation.org>,
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
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-25-david@redhat.com>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20250821200701.1329277-25-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/22/25 05:06, David Hildenbrand wrote:
> It's no longer required to use nth_page() when iterating pages within a
> single SG entry, so let's drop the nth_page() usage.
> 
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Cc: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/ata/libata-sff.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
> index 7fc407255eb46..9f5d0f9f6d686 100644
> --- a/drivers/ata/libata-sff.c
> +++ b/drivers/ata/libata-sff.c
> @@ -614,7 +614,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
>  	offset = qc->cursg->offset + qc->cursg_ofs;
>  
>  	/* get the current page and offset */
> -	page = nth_page(page, (offset >> PAGE_SHIFT));
> +	page += offset / PAGE_SHIFT;

Shouldn't this be "offset >> PAGE_SHIFT" ?

>  	offset %= PAGE_SIZE;
>  
>  	/* don't overrun current sg */
> @@ -631,7 +631,7 @@ static void ata_pio_sector(struct ata_queued_cmd *qc)
>  		unsigned int split_len = PAGE_SIZE - offset;
>  
>  		ata_pio_xfer(qc, page, offset, split_len);
> -		ata_pio_xfer(qc, nth_page(page, 1), 0, count - split_len);
> +		ata_pio_xfer(qc, page + 1, 0, count - split_len);
>  	} else {
>  		ata_pio_xfer(qc, page, offset, count);
>  	}
> @@ -751,7 +751,7 @@ static int __atapi_pio_bytes(struct ata_queued_cmd *qc, unsigned int bytes)
>  	offset = sg->offset + qc->cursg_ofs;
>  
>  	/* get the current page and offset */
> -	page = nth_page(page, (offset >> PAGE_SHIFT));
> +	page += offset / PAGE_SIZE;

Same here, though this seems correct too.

>  	offset %= PAGE_SIZE;
>  
>  	/* don't overrun current sg */


-- 
Damien Le Moal
Western Digital Research
